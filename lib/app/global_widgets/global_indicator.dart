import 'package:flutter/material.dart';

class GlobalIndicator extends StatelessWidget {
  const GlobalIndicator({Key? key, this.size, this.color}) : super(key: key);

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 1.7,
      ),
    );
  }
}
