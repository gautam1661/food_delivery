 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
   BigText({Key? key,  this.color = Colors.black,
     required this.text,
     this.size = 20,
     this.overflow=TextOverflow.ellipsis

   }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Text(
        text,
       maxLines: 1,
       overflow: overflow,
       style: TextStyle(
         fontFamily: 'Roboto',
         color: color,
         fontSize: size,
         fontWeight: FontWeight.w400
       ),
     );
   }
 }
 