import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final double? heightTextField;

  const MyTextField({
    super.key,this.controller,
    this.keyboardType,
    this.labelText,
    this.heightTextField =56,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heightTextField,
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: TextField(
        minLines: 1,
        maxLines: 5,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),

    );
  }
}
