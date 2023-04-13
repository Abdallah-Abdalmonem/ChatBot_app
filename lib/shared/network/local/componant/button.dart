import 'package:flutter/material.dart';

Widget defaultButton({
  
  Color color =  Colors.grey,
  required VoidCallback? onPressed,
  required String text,
}) =>
    Container(
      
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
