import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:flutter/material.dart';

class CustomToast {
  static void show(BuildContext context, String message, IconData icon, Color color, Function() undo, {Duration duration = const Duration(seconds: 2)}) {
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      final toastWidth = MediaQuery.of(context).size.width * 0.85;

      return Positioned(
        bottom: MediaQuery.of(context).size.height * 0.17,
        left: (MediaQuery.of(context).size.width - toastWidth) / 2,
        child: _buildToastWidget(context, message, icon, color, undo, toastWidth),
      );
    });

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }

  static Widget _buildToastWidget(BuildContext context, String message, IconData icon, Color color, Function() undo, double width) {
    return Container(
      height: 38,
      width: width,
      decoration: BoxDecoration(
        color: context.onSecondary,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        children: [
          Container(
            width: 3,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                bottomLeft: Radius.circular(4.0),
              ),
            ),
          ),
          SizedBox(width: 10),
          Icon(
            icon,
            color: color,
          ),
          SizedBox(width: 13),
          Text(
            message,
            style: context.labelSmall,
          ),
          SizedBox(width: 190),
          TextButton(
              onPressed: undo,
              child: Text(
                'Undo',
                style: context.labelSmall,
              ))
        ],
      ),
    );
  }
}
