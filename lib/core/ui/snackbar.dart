import 'enums.dart';
import 'colors.dart';
import 'package:flutter/material.dart';

class SnackbarWidget {
  final BuildContext context;
  final String text;
  final int? timeSeconds;
  final SnackBarType type;
  final Function()? onTap;

  SnackbarWidget(this.context,
      {required this.text, required this.type, this.timeSeconds, this.onTap});

  showSnackBar() {
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.

    containerHeight;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 6.0,
      duration: Duration(seconds: timeSeconds ?? 3),
      // backgroundColor: _colorTypeBackground,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      content: InkWell(
        onTap: onTap ??
            () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 30, height: 30),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 15),
                    Text(_textType,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white)),
                    const SizedBox(height: 5),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.width * 0.1,
                        child: Text(text,
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis, //n
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w500))),
                    const SizedBox(height: 5),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }

  double get containerHeight {
    final media = MediaQuery.of(context).size.height;
    final textLength = text.length;
    return 0;
  }

  String get _textType {
    switch (type) {
      case SnackBarType.success:
        return "¡Éxito!";
      case SnackBarType.error:
        return "¡Error!";
      case SnackBarType.warning:
        return "¡Atención!";
      case SnackBarType.info:
        return "¡Información!";
      default:
        return "¡Información!";
    }
  }
}
