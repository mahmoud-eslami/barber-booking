import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class GlobalIndicator extends StatelessWidget {
  const GlobalIndicator({Key? key, this.size, this.color}) : super(key: key);

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return Center(
        child: SizedBox(
          width: size,
          height: size,
          child: CupertinoActivityIndicator(
            color: color,
            animating: true,
          ),
        ),
      );
    } else {
      return Center(
        child: SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            color: color,
            strokeWidth: 1.7,
          ),
        ),
      );
    }
  }
}
