import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
    {
      Key? key,
      this.width = double.infinity,
      this.height = 50.0,
      required this.title,
      this.buttonColor,
      this.fontColor,
      required this.onPressed,
      this.borderRadius = 5.0})
      : super(key : key);
      final double? width;
      final double? height;
      final String title;
      final Color? buttonColor;
      final Color? fontColor;
      final Function onPressed;
      final double? borderRadius;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: widget.height,
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
        }, 
        child: Text(
          widget.title.toString(), 
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18.0,
            color: widget.fontColor
          )
        ),
        style: ElevatedButton.styleFrom(
          primary: widget.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius as double)
          )
        ),
      ),
    );
  }
}