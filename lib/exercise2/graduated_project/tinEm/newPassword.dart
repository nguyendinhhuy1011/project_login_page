import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/keyboard.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/common/const/toast_overlay.dart';

import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/user_service.dart';

import 'bottom_navigation_page.dart';


class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  // final _passError = 'Password must be more than 4 digits and less than 8 digits';

  var _notifierOldPassInvalid = ValueNotifier<bool>(false);
  var _notifierNewPassInvalid = ValueNotifier<bool>(false);

  var notifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: buildBody(),
      ),
    );
  }

  // decoration: BoxDecoration(
  //   image: DecorationImage(
  //     image: NetworkImage('https://i.pinimg.com/236x/9b/e1/71/9be17159ddfbb61809278283516e8292.jpg'),
  //     fit: BoxFit.cover,
  //   )
  // ),

  Widget buildBody() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background2.jpg'),
        fit: BoxFit.cover,
      )),
      child: GestureDetector(
        onTap: () => hideKeyboardAndUnFocus(context),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildLogo(),
                      ValueListenableBuilder(
                        valueListenable: _notifierOldPassInvalid,
                        builder: (context, value, _) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 24),
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.security,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Old Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                controller: _oldPasswordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                onChanged: (_) {
                                  validate();
                                  // validatePassword();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                          valueListenable: _notifierNewPassInvalid,
                          builder: (context, value, _) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 24),
                              height: 52,
                              decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: TextField(
                                  textInputAction: TextInputAction.done,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.security,
                                      color: Colors.white,
                                    ),
                                    hintText: 'New Password',
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  controller: _newPasswordController,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  onChanged: (_) {
                                    validate();
                                    // validatePassword();
                                  },
                                ),
                              ),
                            );
                          }),
                      ValueListenableBuilder<bool>(
                        valueListenable: notifier,
                        builder: (context, value, _) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: MyButton(
                          widthBtn: double.infinity,
                          heightBtn: 48,
                          textButton: 'Save',
                          onTap: changePassword,
                          enable: value,
                        ),
                      );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(alignment: Alignment.bottomCenter, child: buildHotline()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Image.asset(
        'assets/images/logofox.png',
        height: 150,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildHotline() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: 'Book Us: ', style: TextStyle(color: Colors.white)),
          TextSpan(text: '1900 8099', style: TextStyle(color: Colors.grey)),
        ]),
      ),
    );
  }

  Future save() async{
    final oldPassword = _oldPasswordController.text;
    final newPassword = _newPasswordController.text;
    if (oldPassword == newPassword){
      ToastOverlay(context).show(message: 'A new Password cannot be the same');
    } else {
      ToastOverlay(context).show(message: 'Change Password successfully');
      await Future.delayed(Duration(seconds: 1));
      navigatorPush(context, BottomBarPage());
    }
  }

  void validate() {
    final oldPassword = _oldPasswordController.text;
    final newPassword = _newPasswordController.text;

    if (oldPassword.length >= 4 &&
        oldPassword.length <= 8 &&
        4 <= newPassword.length &&
        newPassword.length <= 8) {
      notifier.value = true;
    } else {
      notifier.value = false;
    }
  }



  void changePassword(){
    apiService.changePassword(
      oldPassword: _oldPasswordController.text,
      newPassword: _newPasswordController.text,
    ).then((value) {
      save();

    }).catchError((e){
      ToastOverlay(context).show(message: 'Errors occur: ${e.toString()}',type: ToastType.error);
    });
  }
}
