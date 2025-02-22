import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossButton extends StatelessWidget {
  const CrossButton({
    super.key,
    this.text = "",
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.disabledColor = const Color.fromARGB(255, 71, 71, 71),
    required this.child,
    this.height,
    this.wight,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double? wight, height;
  final Widget child;
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Color disabledColor;

//refresh swipe

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
          height: height,
          width: wight,
          child: CupertinoButton(
            padding: padding,
            color: backgroundColor,
            borderRadius: borderRadius,
            onPressed: onPressed,
            disabledColor: disabledColor,
            child: child,
          )),
    );
  }
}
