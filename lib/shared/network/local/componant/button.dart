import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color color =  Colors.grey,
  required VoidCallback? onPressed,
  required String text,
}) =>
    Container(
       width: double.infinity,
       clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(
                  Radius.circular(20)
                   
                ),
                ),
      
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(

            color: Colors.white,
          ),
        ),
       
        ) ,
      
    );
