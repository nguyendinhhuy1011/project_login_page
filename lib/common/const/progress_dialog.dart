import 'package:flutter/material.dart';

class ProgressDialog {
  bool _isShow = false;
  final BuildContext context;

  ProgressDialog(this.context);


  void show() {
    if (_isShow){
      return;
    }
    _isShow =true;
    Future.delayed(Duration.zero, (){
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.3),
          barrierLabel: MaterialLocalizations
              .of(context)
              .modalBarrierDismissLabel,
          pageBuilder: (_, __, ___) {
            return Container(
              alignment: Alignment.center,
              child: Material(
                 color: Colors.transparent,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                    color: Colors.indigo,
                  )),
            );
          });
    });
  }

  void hide() {
    if (_isShow){
      Navigator.of(context).pop();
    }
  }
}