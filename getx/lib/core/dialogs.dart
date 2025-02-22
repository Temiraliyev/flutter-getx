// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';

void showSuccesToast(BuildContext context, String title, String subtitle) {
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 2),
    title: Text(title, style: TextStyle(fontSize: 25)),
    description: Text(subtitle, style: TextStyle(fontSize: 16)),
    alignment: Alignment.topRight,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    showIcon: true,
    backgroundColor: Colors.green,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      ),
    ],
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}

void showErrorToast(BuildContext context, String title, String subtitle) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 2),
    title: Text(title, style: TextStyle(fontSize: 25)),
    description: Text(subtitle, style: TextStyle(fontSize: 16)),
    alignment: Alignment.topRight,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    showIcon: true,
    backgroundColor: Colors.red,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      ),
    ],
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}

void showAlertDialog(BuildContext context, String title, String message) {
  showCupertinoDialog<void>(
    context: context,
    builder:
        (BuildContext context) => CupertinoAlertDialog(
          title: Text(title, style: Theme.of(context).textTheme.titleLarge),
          content: Text(message, style: Theme.of(context).textTheme.bodyMedium),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDestructiveAction: false,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),

                // TextStyle(
                //   fontFamily: "Montserrat",
                //   fontWeight: FontWeight.w600,
                // ),
              ),
            ),
          ],
        ),
  );
}

void showConfirmDialog(
  BuildContext context,
  String title,
  String msg,
  String cancel,
  String delete,
  void Function() confirmAction,
) {
  showCupertinoDialog<void>(
    context: context,
    builder:
        (BuildContext context) => CupertinoAlertDialog(
          title: Column(
            children: [
              // Image(
              //   image: isDarkMode
              //       ? const AssetImage(
              //           "assets/images/home.png",
              //         )
              //       : const AssetImage(
              //           "assets/images/home.png",
              //         ),
              //   fit: BoxFit.cover,
              //   width: 300,
              // ),
            ],
          ),
          content: Text(
            msg,
            style: const TextStyle(fontFamily: "Montserrat", fontSize: 16),
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDestructiveAction: false,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(cancel, overflow: TextOverflow.ellipsis, maxLines: 1),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                confirmAction();
              },
              child: Text(delete, overflow: TextOverflow.ellipsis, maxLines: 1),
            ),
          ],
        ),
  );
}

// select category

void showSelectCategoryDialog({
  required BuildContext context,
  required int initialItem,
  required List<String> items,
  required Function(int) action,
}) {
  FixedExtentScrollController extentScrollController =
      FixedExtentScrollController(initialItem: initialItem);
  int selected = 0;
  showCupertinoModalPopup<void>(
    context: context,
    builder:
        (BuildContext context) => Container(
          height: 250,
          padding: const EdgeInsets.only(top: 6.0),

          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),

          color: CupertinoColors.systemBackground.resolveFrom(context),

          child: SafeArea(
            top: false,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: CupertinoPicker(
                    scrollController: extentScrollController,
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: false,
                    looping: false,
                    itemExtent: 32,

                    onSelectedItemChanged: (int selectedItem) {
                      SystemSound.play(SystemSoundType.click);
                      HapticFeedback.mediumImpact();
                      selected = selectedItem;
                    },
                    children: List<Widget>.generate(items.length, (int index) {
                      return Center(child: Text(items[index]));
                    }),
                  ),
                ),
                CupertinoButton(
                  child: Text("Выбрать"),
                  onPressed: () {
                    Navigator.pop(context);
                    action(selected);
                  },
                ),
              ],
            ),
          ),
        ),
  );
}
