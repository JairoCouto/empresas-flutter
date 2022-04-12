import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<Future<bool?>> CustomToastMsg({required String errorMsg, int? duration, required Color backgroundColor, required Color textColor}) async {
  return Fluttertoast.showToast (
      msg: errorMsg.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0
    );
} 