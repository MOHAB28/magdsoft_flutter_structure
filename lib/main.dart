import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/bloc_observer.dart';
import 'business_logic/global_cubit/global_cubit.dart';
import 'business_logic/help_cubit/help_cubit.dart';
import 'business_logic/home_cubit/home_cubit.dart';
import 'business_logic/login_cubit/login_cubit.dart';
import 'business_logic/verify_phone_cubit/verify_phone_cubit.dart';
import 'data/data_providers/local/cache_helper.dart';
import 'data/data_providers/remote/dio_helper.dart';
import 'presentation/router/app_router.dart';
import 'presentation/services/notification_services.dart';
import 'presentation/styles/theme_manager.dart';
import 'presentation/widget/toast.dart';

late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await NotificationService().init();
      await CacheHelper.init();
      final locale =
          CacheHelper.getDataFromSharedPreference(key: 'language') ?? "en";
      delegate = await LocalizationDelegate.create(
        fallbackLocale: locale,
        supportedLocales: ['ar', 'en'],
      );
      await delegate.changeLocale(Locale(locale));
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = delegate.currentLocale.languageCode;

    delegate.onLocaleChanged = (Locale value) async {
      try {
        setState(() {
          Intl.defaultLocale = value.languageCode;
        });
      } catch (e) {
        showToast(e.toString(),context);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalCubit>(
          create: ((context) => GlobalCubit()),
        ),
        BlocProvider<LoginCubit>(
          create: ((context) => LoginCubit()),
        ),
        BlocProvider<VerifyPhoneCubit>(
          create: (_) => VerifyPhoneCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(),
        ),
        BlocProvider<HelpCubit>(
          create: (_) => HelpCubit(),
        ),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LocalizedApp(
                delegate,
                LayoutBuilder(
                  builder: (context, constraints) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Werash',
                      localizationsDelegates: [
                        GlobalCupertinoLocalizations.delegate,
                        DefaultCupertinoLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        delegate,
                      ],
                      locale: delegate.currentLocale,
                      supportedLocales: delegate.supportedLocales,
                      initialRoute: Routes.splashScreenKey,
                      onGenerateRoute: widget.appRouter.onGenerateRoute,
                      theme: getApplicationTheme(),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
