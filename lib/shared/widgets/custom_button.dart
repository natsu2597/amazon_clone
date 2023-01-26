import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  const CustomButton({super.key,required this.text,required this.onTap,this.fontSize, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
       child: Text(text,style: TextStyle(fontSize: fontSize,color: textColor),),
       style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: color
       ),
       );
  }
}