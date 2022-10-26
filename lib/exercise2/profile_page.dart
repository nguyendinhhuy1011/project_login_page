import 'package:flutter/material.dart';
import 'package:homework2/common/const/avatar.dart';
import 'package:homework2/exercise2/left_menu_bar.dart';

import '../common/const/MyTextField2.dart';
import '../common/const/build_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: buildAccountbody(),
    );
  }

  Widget buildAccountbody() {
    return SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Avatar(
                widthAva: 100,
                heightAva: 100,
              ),
              SizedBox(height: 20),
              MyTextField2(
                labelText: 'Full name',
                keyboardType: TextInputType.text,
              ),
              MyTextField2(
                labelText: 'Date of Birth',
                keyboardType: TextInputType.datetime,
              ),
              MyTextField2(
                labelText: 'Address',
                keyboardType: TextInputType.text,
              ),
              MyTextField2(
                  labelText: 'Phone Number', keyboardType: TextInputType.phone),
              MyTextField2(
                  labelText: 'Email', keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 20,
              ),
              MyButton(textButton: 'Save', onTap: () {
                showLeftMenuBar();
              })
            ],
          ),
        ));
  }

  void showLeftMenuBar() {
    showDialog(
        context: context,
        barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      builder: (context){
          return Container(
            alignment: Alignment.topLeft,
              child: LeftMenuBar(),
          );
      }
    );

  }
}
