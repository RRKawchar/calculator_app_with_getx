

import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  double size;
  FontWeight? fontWeight;
  Color color;
   ReusableText({Key? key, required this.text,this.size=18, this.color=Colors.black,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(fontSize: size,fontWeight: fontWeight,color: color,));
  }
}
