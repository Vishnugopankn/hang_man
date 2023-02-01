import 'package:flutter/material.dart';
import 'package:hang_man/ui/colors.dart';

Widget letter(String character,bool hidden){
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Container(
      height: 65,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Appcolor.backgroundcolordark,
      ),
      child: Visibility(
      visible: !hidden,
        child: Center(
          child: Text(character,style: TextStyle(color: Colors.white,fontSize:20 ,fontWeight: FontWeight.bold)
          ),
        ),
      ),
    ),
  );
}