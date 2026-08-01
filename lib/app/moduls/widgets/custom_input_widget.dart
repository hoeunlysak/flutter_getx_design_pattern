import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  String? hintText, label;
  TextEditingController? controller;
  CustomInputWidget({super.key, this.controller, this.label,this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 7,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20),),
                borderSide: BorderSide(width: 4,color:Colors.brown)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20),),
                borderSide: BorderSide(width: 2,color:Colors.brown)
            ),
            hintText: hintText??"",
            label:Text(label??""),

        ),
      ),
    );
  }
}
