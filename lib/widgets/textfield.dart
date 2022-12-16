import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputFormatter? formatter;
  final TextInputType? inputType;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.formatter,
    this.inputType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        inputFormatters: [
          widget.formatter ?? FilteringTextInputFormatter.singleLineFormatter
        ],
        controller: widget.controller,
        decoration: InputDecoration(hintText: widget.hintText),
        keyboardType: widget.inputType ?? TextInputType.text,
      ),
    );
  }
}
