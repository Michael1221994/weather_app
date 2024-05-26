import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color? color; 
  final Color? textcolor; 
  VoidCallback on_pressed;
  MyButton({
    super.key,
    required this.on_pressed,
    required this.color,
    required this.textcolor,
    required this.text
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialButton(
        onPressed: on_pressed,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
          side: const BorderSide(color: Colors.white, width: 2)
        ),
        child: Text(text, style: TextStyle(color: textcolor),),
        
      ),
    );
  }
}