import 'package:flutter/material.dart';
import 'package:flutter_keep/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class TextFieldd extends StatelessWidget {
   const TextFieldd({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final double fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return TextFormField(
    style: themeProvider.themeControl(fontSize,fontWeight),
    controller: controller,
     autofocus: false,
     maxLines: null,
     decoration: InputDecoration(
       border: InputBorder.none,
       hintText: hintText,
      hintStyle: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w500,color: Colors.grey)
     ),
    );
  }
}