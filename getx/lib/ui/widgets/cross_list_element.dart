import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getx/core/skeleton.dart';
import 'package:getx/ui/widgets/on_tap_scale.dart';

class CrossListElement extends StatelessWidget {
  const CrossListElement({
    super.key,
    required this.onPressed,
    required this.child,
    this.enabled = true,
    this.divider = true,
  });

  final Widget child;
  final bool enabled;
  final bool divider;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Platform.isIOS
            ? CupertinoInkWell(
              onPressed: onPressed,
              child: OnTapScaleAndFade(
                onTap: onPressed!,
                lowerBound: 0.98,
                child: Opacity(opacity: enabled ? 1 : 0.6, child: child),
              ),
            )
            : InkWell(
              onTap: onPressed,
              child: OnTapScaleAndFade(
                lowerBound: 0.98,
                onTap: onPressed!,
                child: Opacity(opacity: enabled ? 1 : 0.6, child: child),
              ),
            ),
        divider
            ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).dividerColor,
              ),
              height: 0.6,
            )
            : const SizedBox(),
      ],
    );
  }
}
