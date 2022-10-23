import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../business_logic/help_cubit/help_cubit.dart';
import '../../styles/colors.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    HelpCubit.get(context).getHelpData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCubit, HelpState>(
      builder: (context, state) {
        var gCubit = GlobalCubit.get(context);
        if (state is HelpLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HelpSucessState) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 20.0,
              bottom: 70.0,
            ),
            child: Column(
              children: state.products
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.question,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (gCubit.ids.contains(e.id)) {
                                          gCubit.remvoeFromSelectedIds(e.id);
                                        } else {
                                          gCubit.addToSelectedIds(e.id);
                                        }
                                      },
                                      icon: gCubit.ids.contains(e.id)
                                          ? const Icon(
                                              Icons.keyboard_arrow_up_rounded,
                                              color: AppColors.black,
                                            )
                                          : const Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: AppColors.black,
                                            ),
                                    )
                                  ],
                                ),
                                if (gCubit.ids.contains(e.id)) ...[
                                  Text(
                                    e.answer,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        } else if (state is HelpFailureState) {
          return Center(
            child: Text(state.message),
          );
        }
        return const SizedBox();
      },
    );
  }
}
