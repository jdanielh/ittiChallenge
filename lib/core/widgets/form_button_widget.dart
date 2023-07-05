import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FormButtonWidget extends StatelessWidget {
  final Function() onPressFunction;
  final String lbl;
  final Color clr;
  TextEditingController? ctrl;

  FormButtonWidget(
      {required this.onPressFunction,
      required this.lbl,
      required this.clr,
      this.ctrl,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressFunction,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(clr),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
      child: Padding(
        padding: kIsWeb
            ? const EdgeInsets.symmetric(horizontal: 90, vertical: 15)
            : const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Text(
          lbl,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
