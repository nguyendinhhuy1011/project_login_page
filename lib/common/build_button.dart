import 'package:flutter/material.dart';

class Mybutton extends StatefulWidget {
  final String textButton;
  final double heightBtn;
  final double widthBtn;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const Mybutton({
    super.key,
    required this.textButton,
    this.heightBtn = 48,
    this.widthBtn = double.infinity,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    required this.onTap,
  });

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {

  var lock =false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!lock){
          setState(() {
            lock =true;
            widget.onTap();
          });

          Future.delayed(Duration(milliseconds: 1000),(){
            setState(() {
              lock = false;
            });
          });
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: widget.widthBtn,
        height: widget.heightBtn,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: lock ? Colors.teal :widget.backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          widget.textButton,
          style: TextStyle(color: widget.textColor,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
