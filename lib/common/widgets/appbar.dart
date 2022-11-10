import 'package:flutter/material.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
  Widget? leading,
}) {
  return AppBar(
    leading: leading,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    backgroundColor: Colors.blue,
    actions: actions,
  );
}
