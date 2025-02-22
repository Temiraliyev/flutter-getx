import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoInkWell extends StatefulWidget {
  const CupertinoInkWell({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;

  bool get enabled => onPressed != null;

  @override
  State<CupertinoInkWell> createState() => _CupertinoInkWellState();
}

class _CupertinoInkWellState extends State<CupertinoInkWell> {
  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      setState(() {
        _buttonHeldDown = true;
      });
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      setState(() {
        _buttonHeldDown = false;
      });
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      setState(() {
        _buttonHeldDown = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.enabled;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? _handleTapDown : null,
      onTapUp: enabled ? _handleTapUp : null,
      onTapCancel: enabled ? _handleTapCancel : null,
      onTap: widget.onPressed,
      child: Semantics(
        button: true,
        child: AnimatedContainer(
          color:
              _buttonHeldDown
                  ? Theme.of(context).dividerColor.withAlpha(100)
                  : Theme.of(context).scaffoldBackgroundColor,
          duration: const Duration(milliseconds: 200),
          child: widget.child,
        ),
      ),
    );
  }
}

void openPage(BuildContext context, Widget page) {
  if (Platform.isAndroid) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  } else {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => page));
  }
}

void closePage(BuildContext context) {
  FocusScope.of(context).unfocus();
  if (Platform.isAndroid) {
    Navigator.of(context).pop();
  } else {
    Navigator.of(context).pop();
  }
}

void openReplacement(BuildContext context, Widget page) {
  if (Platform.isAndroid) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => page));
  } else {
    Navigator.of(
      context,
    ).pushReplacement(CupertinoPageRoute(builder: (context) => page));
  }
}

// String formatNumber(double value) {
//   return NumberFormat('#,###', 'fr_FR').format(value).replaceAll(',', ' ');
// }

// Future<void> checkLoginStatus(bool isLogin) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   isLogin = prefs.getBool('isLoggedIn') ?? false;
// }

// String formatTimestamp(BuildContext context, Timestamp timestamp) {
//   DateTime dateTime = timestamp.toDate();
//   String formattedDate = DateFormat('yyyy, d-MMMM', context.locale.toString()).format(dateTime);
//   return formattedDate;
// }
