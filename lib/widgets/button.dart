import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  double? width;
  double? height;
  double? fontSize;
  final String title;
  final Function() onTap;

  CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.fontSize,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        height: widget.height ?? 40,
        width: widget.width ?? 180,
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: TextStyle(fontSize: widget.fontSize ?? 20),
        ),
      ),
    );
  }
}
