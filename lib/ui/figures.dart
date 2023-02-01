import 'package:flutter/material.dart';
Widget figure(bool visible,String path){
return Visibility(
  visible: visible,
    child: Container(
    width: 230,
      height: 230,
      child: Image.asset(path),
    ));
}