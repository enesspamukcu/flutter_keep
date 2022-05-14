import 'package:flutter/material.dart';

class ColorChooseCircle extends StatelessWidget {
  const ColorChooseCircle(
      {Key? key, required this.onPress, required this.color})
      : super(key: key);
  final Function onPress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onPress(),
        child:Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
            border: Border.all(style: BorderStyle.solid,color: Colors.black,)
          ),
        ));
  }
}
