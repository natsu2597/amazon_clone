import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final VoidCallback onTap;
  const CustomButton({super.key,required this.text,required this.onTap,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
       child: Text(text,style: TextStyle(fontSize: fontSize),),
       style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50)
       ),
       );
  }
}