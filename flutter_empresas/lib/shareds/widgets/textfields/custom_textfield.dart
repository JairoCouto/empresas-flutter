import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
    {
      Key? key,
      this.hintText,
      this.width = double.infinity,
      this.isPassword = false,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.maxLength,
      this.maxLines = 1,
      this.suffixIcon,
      this.counterText,
      this.enabled = true,
      this.onFieldSubmitted,
      this.focusNode,
      this.inputFormatters,
      this.onChanged,
      this.contentPadding,
      this.labelText,
      this.isValidator = false,
      this.height = 60.0,
      this.readOnly = false,
      this.obscureText = false,
      this.hintColor = Colors.grey,
      this.isPrefixIcon = false,
      this.prefixIcon})
      : super(key: key);
      final String? hintText;
      final double? width;
      final bool? isPassword;
      final String? Function(String?)? validator;
      final TextEditingController? controller;
      final String? labelText;
      final TextInputAction? textInputAction;
      final int? maxLength;
      final int? maxLines;
      final String? counterText;
      final Widget? suffixIcon;
      final List<TextInputFormatter>? inputFormatters;
      final TextInputType? keyboardType;
      final bool? enabled;
      final FocusNode? focusNode;
      final EdgeInsets? contentPadding;
      final void Function(String)? onFieldSubmitted;
      final void Function(String)? onChanged;
      final bool? isValidator;
      final double? height;
      final bool? readOnly;
      final bool? obscureText;
      final Color? hintColor;
      final bool? isPrefixIcon;
      final Icon? prefixIcon;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            widget.labelText.toString(),
            style: TextStyle(fontFamily: 'Quicksand', fontSize: 18.0, color: Color.fromRGBO(102, 102, 102, 1)),
          ),
        ),

        SizedBox(
          height: 60.0,
          width: widget.width,
          child: TextFormField(
            obscureText: widget.obscureText as bool,
            readOnly: widget.readOnly as bool,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey
                )
              ),
              fillColor: Color.fromRGBO(245, 245, 245, 1),
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.cyan
                )
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontFamily: 'Quicksand', fontSize: 18.0, color: widget.hintColor),
              isDense: true,
              labelStyle: TextStyle(fontFamily: 'Quicksand', fontSize: 18.0, color: Color.fromRGBO(102, 102, 102, 1)),
              prefixIcon: widget.isPrefixIcon! ? Icon(Icons.search) : null,
            ),
            style: const TextStyle(fontFamily: 'Quicksand', fontSize: 16.0),
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            controller: widget.controller,
            validator: (text) {
              if(widget.isValidator == true) {
                if(text?.isEmpty ?? false) return 'Campo Obrigatório';
                return null;
              }
            },
            onChanged: widget.onChanged,
          ),
        ),
        
      ],
    );
  }
}