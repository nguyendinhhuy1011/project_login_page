import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double widthAva;
  final double heightAva;

  const Avatar({super.key, required this.widthAva, required this.heightAva});


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Container(
        child: Image.asset(
          'assets/images/avar.jpeg',
          width: widthAva,
          height: heightAva,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

