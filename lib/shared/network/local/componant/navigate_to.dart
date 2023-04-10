import 'package:flutter/material.dart';

void navigateTo({required BuildContext context, required Widget wiget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => wiget));

void navigateAndFinsh({required BuildContext context, required Widget wiget}) =>
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (context) => wiget),
      (Route<dynamic> route)=>false);
