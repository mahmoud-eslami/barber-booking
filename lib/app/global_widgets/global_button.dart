import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.child,
    required this.color,
    required this.onPressed,
    this.elevation,
    this.height,
    this.width,
    required this.radius,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final double? elevation, height, width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: elevation,
        ),
      ),
    );
  }
}
