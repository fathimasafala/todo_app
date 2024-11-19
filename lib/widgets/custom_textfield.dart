import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFields extends StatefulWidget {
  final Widget? suffixIcon;
  final int? maxLines;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final double? width;
  final double? height;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? enabled;
  final bool? isPassword;
  final bool? isFill;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validation;
  final TextInputType? keyboardType;
  final Color? cursorColor;
  final String? initialValue;
  final bool isColordBackground;
  final FocusNode? focusNode;
  final TextStyle? style;
  final int? maxLength;
  final int? errorMaxLines;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  const CustomTextFormFields({
    super.key,
    this.suffixIcon,
    this.controller,
    this.maxLines,
    this.hintText,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
    this.cursorColor,
    this.inputFormatters,
    this.width,
    this.enabled,
    this.onEditingComplete,
    this.initialValue,
    this.onChanged,
    this.height,
    this.isFill,
    this.validation,
    this.isPassword,
    this.focusNode,
    this.isColordBackground = false,
    this.style,
    this.maxLength,
    this.errorMaxLines,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextFormFields> createState() => _CustomTextFormFieldsState();
}

class _CustomTextFormFieldsState extends State<CustomTextFormFields> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: TextFormField(
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        validator: widget.validation,
        style: widget.style ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
        readOnly: widget.readOnly ?? false,
        controller: widget.controller,
        initialValue: widget.initialValue,
        cursorColor: Colors.black,
        onTap: widget.onTap,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines ?? 1,
        textInputAction: widget.textInputAction,
        cursorHeight: 20,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        obscureText: widget.isPassword == true ? _obscureText : false,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: widget.isColordBackground
                ? Colors.black
                : Colors.red, // Change the error message color here
            fontSize: 12, // Change the error message font size if needed
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.brown[300],
          ),
          errorMaxLines: widget.errorMaxLines,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.brown[300]!,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.brown[300]!,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.brown[300]!,
              )),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: widget.isColordBackground ? Colors.black : Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: widget.isColordBackground ? Colors.black : Colors.red,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          enabled: widget.enabled ?? true,
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffixIcon,
          hintText: (widget.hintText ?? ''),
          filled: widget.isFill ?? true,
          prefixIcon: widget.prefixIcon,
        ),
        onEditingComplete: widget.onEditingComplete,
      ),
    );
  }
}
