import 'package:animation_expansive/controller/controller.dart';
import 'package:animation_expansive/widget/container_expansive.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late ControllerAnimation controller;
  int? indexSelected;
  int? oldIndex;

  @override
  void initState() {
    super.initState();
    controller = ControllerAnimation(vsync: this);
    controller.animationController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: List.generate(
          50,
          (index) {
            return ContainerExpansive(controller: controller, index: index);
          },
        ),
      ),
    );
  }
}
