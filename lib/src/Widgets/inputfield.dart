import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  String? hint;
  IconData? icon;
  Color? color;
  Widget? suffix;
  Color? borderColor;
  Color? errorTextColor;
  FocusNode? focusNode;
  bool? readOnly;
  bool? password;
  String? initialValue;
  String? textIcon;
  TextStyle? textStyle;
  TextStyle? hintStyle;
  TextInputType? type;
  TextEditingController? controller;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  double? size;
  double? borderRadius;
  int? maxLine;
  int? minLine;
  bool? enabled;
  Function()? onTap;

  InputField({
    this.hint,
    this.color,
    this.controller,
    this.focusNode,
    this.icon,
    this.type,
    this.readOnly,
    this.password,
    this.errorTextColor,
    this.initialValue,
    this.borderColor,
    this.textStyle,
    this.suffix,
    this.onChanged,
    this.validator,
    this.size,
    this.borderRadius,
    this.hintStyle,
    this.maxLine,
    this.textIcon,
    this.minLine,
    this.onTap,
    this.enabled,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enabled,
      autofocus: false,
      maxLines: widget.maxLine ?? 1,
      minLines: widget.minLine ?? 1,
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.password != null ? hidePassword : false,
      keyboardType: widget.type,
      onTap: widget.onTap,
      readOnly: widget.readOnly ?? false,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      style: widget.textStyle ??
          const TextStyle(fontSize: 14, color: Colors.black),
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hint,
        hintStyle: widget.hintStyle ??
            const TextStyle(color: Colors.grey, fontSize: 14),
        prefixIcon: widget.textIcon != null
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.textIcon!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : widget.icon != null
                ? Icon(widget.icon, color: Colors.grey)
                : null,
        suffixIcon: widget.password != null
            ? IconButton(
                icon: hidePassword == true
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                onPressed: () => setState(() {
                  hidePassword = !hidePassword;
                }),
              )
            : widget.suffix,
        filled: true,
        fillColor: widget.color,
        suffixIconConstraints: BoxConstraints(
          maxHeight: widget.size ?? 45,
          minHeight: widget.size ?? 45,
          maxWidth: widget.size == null ? 38 : (widget.size! + 3),
          minWidth: widget.size == null ? 38 : (widget.size! + 3),
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: widget.size ?? 35,
          minHeight: widget.size ?? 35,
          maxWidth: widget.size == null ? 38 : (widget.size! + 3),
          minWidth: widget.size == null ? 38 : (widget.size! + 3),
        ),
        contentPadding: EdgeInsets.only(
          top: widget.icon == null
              ? widget.suffix == null
                  ? widget.size == null
                      ? 19
                      : (widget.size! / 2)
                  : 0
              : 0,
          bottom: widget.icon == null
              ? widget.suffix == null
                  ? widget.size == null
                      ? 19
                      : (widget.size! / 2)
                  : 0
              : 0,
          right: 15,
          left: widget.icon == null ? 15 : 0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : const BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 25),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
