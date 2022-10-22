import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../view/scaffold_background_builder.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ScaffoldBackGroundBuilder(),
        BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            var cubit = GlobalCubit.get(context);
            return Scaffold(
              extendBody: true,
              appBar: cubit.titles[cubit.currentIndex].isEmpty
              ? AppBar(toolbarHeight: 0)
              : AppBar(
                title: Text(cubit.titles[cubit.currentIndex]),
              ),
              body: cubit.screens[cubit.currentIndex],
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  cubit.changeIndex(2);
                },
                child: const Icon(Icons.home),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Directionality(
                textDirection: TextDirection.rtl,
                child: BottomAppBar(
                  color: AppColors.white.withAlpha(255),
                  notchMargin: 5.0,
                  elevation: 0.0,
                  shape: const CircularNotchedRectangle(),
                  child: BottomNavigationBar(
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeIndex(index);
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.notifications),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.favorite,
                            color: AppColors.transparent,
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.exit_to_app),
                        label: '',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
