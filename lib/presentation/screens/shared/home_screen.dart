import 'package:flutter/material.dart';

import '../../view/scaffold_background_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ScaffoldBackGroundBuilder(),
        Scaffold(
          appBar: AppBar(toolbarHeight: 1),
        ),
      ],
    );
  }
}