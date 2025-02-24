import 'package:flutter/material.dart';

class ShadowContainerWidget extends StatelessWidget {
  final Widget child;
  Color color;
  double height;
  double radius;

  ShadowContainerWidget(
      {required this.child,
      this.color = Colors.white,
      this.height = 50,
      this.radius = 10.0,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFD0D0D0),
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              0.5, // Move to right 5  horizontally
              0.5, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: child,
    );
  }
}
