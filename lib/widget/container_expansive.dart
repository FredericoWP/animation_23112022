import 'package:animation_expansive/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerExpansive extends StatefulWidget {
  const ContainerExpansive(
      {super.key, required this.controller, required this.index});
  final ControllerAnimation controller;
  final int index;

  @override
  State<ContainerExpansive> createState() => _ContainerExpansiveState();
}

class _ContainerExpansiveState extends State<ContainerExpansive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ClipRRect(
            child: Container(
              color: widget.controller.getBgColor(widget.index),
              child: ListTile(
                onTap: () => widget.controller.execute(widget.index),
                textColor: widget.controller.getTxtColor(widget.index),
                title: Text(
                  "Titulo ${widget.index < 10 ? '0${widget.index}' : widget.index}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                trailing: Transform.rotate(
                  angle: widget.controller.getRotation(widget.index),
                  child: const Icon(CupertinoIcons.arrow_down),
                ),
              ),
            ),
          ),
          Align(
            heightFactor: widget.controller.factorHeight(widget.index),
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: const [
                  FlutterLogo(),
                  Text(
                      "Flutterando is the largest Flutter community in Brazil. Think about Flutter, think about Flutterando. Be part of our community!"),
                  Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
