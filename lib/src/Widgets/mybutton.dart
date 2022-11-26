import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? sizeHieght;
  final double? sizeWidth;
  final double? fontSize;
  final double? borderRadius;
  final double? elevation;

  const MyButton({
    this.title,
    this.color,
    this.onTap,
    this.sizeHieght,
    this.sizeWidth,
    this.fontSize,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.elevation,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          side: BorderSide(
            // color: borderColor ?? color ?? AppColor.mainColor,
            width: borderWidth ?? 1,
          ),
        ),
        fixedSize: Size(
          sizeWidth ?? MediaQuery.of(context).size.width,
          sizeHieght ?? 45,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "$title",
          style: TextStyle(
            fontSize: fontSize ?? 16,
            color: color != null ? textColor ?? Colors.white : Colors.white,
            // fontFamily: "OpenSans",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      onPressed: onTap,
    );
  }
}
