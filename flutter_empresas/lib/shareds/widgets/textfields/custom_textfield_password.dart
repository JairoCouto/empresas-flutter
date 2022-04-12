import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextFieldPassword extends StatefulWidget {
   CustomTextFieldPassword(
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
      this.obscureText = false})
      : super(key: key);
      late String? hintText;
      late double? width;
      late bool? isPassword;
      late String? Function(String?)? validator;
      late TextEditingController? controller;
      late String? labelText;
      late TextInputAction? textInputAction;
      late int? maxLength;
      late int? maxLines;
      late String? counterText;
      late Widget? suffixIcon;
      late List<TextInputFormatter>? inputFormatters;
      late TextInputType? keyboardType;
      late bool? enabled;
      late FocusNode? focusNode;
      late EdgeInsets? contentPadding;
      late void Function(String)? onFieldSubmitted;
      late void Function(String)? onChanged;
      late bool? isValidator;
      late double? height;
      late bool? readOnly;
      late bool? obscureText;

  @override
  _CustomTextFieldPasswordState createState() => _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
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
          height: widget.height,
          width: widget.width,
          child: TextFormField(
            obscureText: widget.obscureText as bool,
            readOnly: widget.readOnly as bool,
            decoration: InputDecoration(
              fillColor: Color.fromRGBO(245, 245, 245, 1),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontFamily: 'Quicksand', fontSize: 18.0),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText!;
                  });
                },
                icon:Icon(widget.obscureText! ? Icons.visibility_off : Icons.visibility, color: Color.fromARGB(102, 102, 102, 50)),
              
                
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(fontFamily: 'Quicksand', fontSize: 18.0, color: Color.fromRGBO(102, 102, 102, 1)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey
                )
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.cyan
                )
              )
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
          ),
        ),
        
      ],
    );
  }
}