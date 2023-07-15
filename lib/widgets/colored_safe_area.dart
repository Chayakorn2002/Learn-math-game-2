import 'package:flutter/material.dart';

class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;

  const ColoredSafeArea({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[400],
      child: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 181, 138, 255),
          child: child,
        ),
      ),
    );
  }
}
