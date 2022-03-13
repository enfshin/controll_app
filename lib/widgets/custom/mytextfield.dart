import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final decoration;
  final style;
  final textAlign;
  final onchange;
  final inputFormatters;
  const MyTextField({Key? key, required this.controller, this.decoration, this.style, this.textAlign, this.onchange, this.inputFormatters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List undetected_list = [" ", "`", "~", "!", "@", "#", "\$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+",
      "[", "]", "{", "}", "'", '"', ";", ":", "/", "?", ",", ".", "<", ">", "\\", "|",
      "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",];
    List numberPad_list = ["Numpad Decimal", "Numpad Divide", "Numpad Multiply", "Numpad Subtract", "Numpad Add",
      "Numpad 0", "Numpad 1", "Numpad 2", "Numpad 3", "Numpad 4", "Numpad 5", "Numpad 6", "Numpad 7", "Numpad 8", "Numpad 9"];
    List numerPad_convert = [".", "/", "*", "-", "+", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) async {
        // if (event.runtimeType.toString() == 'RawKeyDownEvent') {
        if (event.runtimeType == RawKeyDownEvent) {
          String keydownText = event.data.logicalKey.keyLabel;
          int cursorPosition = this.controller.selection.baseOffset;
          if (numberPad_list.contains(keydownText)) {
            keydownText = numerPad_convert[numberPad_list.indexOf(keydownText)];
          }
          if (undetected_list.contains(keydownText)) {
            await Future.delayed(Duration(milliseconds: 10));
            List text_list = this.controller.text.split("");
            try {
              if (text_list[cursorPosition] != keydownText) {
                text_list.insert(cursorPosition, keydownText);
                this.controller.text = text_list.join();
                this.controller.selection = TextSelection.fromPosition(TextPosition(offset: cursorPosition+1));
              }
            } catch (e) {
              if (text_list[this.controller.text.length-1] != keydownText) {
                this.controller.text = this.controller.text + keydownText;
                this.controller.selection = TextSelection.fromPosition(TextPosition(offset: this.controller.text.length));
              }
            }
          }
        }
      },
      child: TextField(
        controller: this.controller,
        inputFormatters: this.inputFormatters,
        onChanged: this.onchange,
        textAlign: this.textAlign ?? TextAlign.start,
        style: this.style,
        decoration: this.decoration,
      ),
    );
  }
}