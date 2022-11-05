import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homework2/common/const/keyboard.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/exercise2/project_page/issue_page.dart';
import 'package:homework2/exercise2/project_page/login_page.dart';
import 'package:homework2/exercise2/project_page/profile_page.dart';
import 'package:homework2/service/issue_service.dart';
import 'package:homework2/service/user_service.dart';
import 'package:http/http.dart' as http;
import '../../common/const/MyTextField2.dart';
import '../../common/const/build_button.dart';
import '../../models/User.dart';
import '../../service/api_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  var isEnable = false;

  var notifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Build when login');
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () {
        hideKeyboardAndUnFocus(context);
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildLogo(),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField2(
                    labelText: 'Name',
                    autoFocus: true,
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    onChanged: (_) => validate(),
                  ),
                  MyTextField2(
                    labelText: 'Phone Number',
                    autoFocus: true,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    onChanged: (_) => validate(),
                  ),
                  MyTextField2(
                    labelText: 'Email',
                    autoFocus: true,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    onChanged: (_) => validate(),
                  ),
                  MyTextField2(
                    labelText: 'Password',
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: passwordController,
                    onChanged: (_) => validate(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: notifier,
                    builder: (context, value, _) {
                      return MyButton(
                        onTap: register,
                        textButton: 'Register',
                        enable: value,
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
    );
  }

  Widget buildLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(130),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        height: 170,
        child: Image.asset(
          'assets/images/logo3.png',
          width: 230,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildHotline() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: 'HotLine: ', style: TextStyle(color: Colors.black)),
          TextSpan(text: '19001999', style: TextStyle(color: Colors.grey)),
        ]),
      ),
    );
  }

  void register() {
    apiService
        .register(
            name: nameController.text,
            phone: phoneController.text,
            password: passwordController.text,
            email: emailController.text)
        .then((value) {
      ToastOverlay(context).show(message: 'Hello ${value.name}');
      navigatorPushAndRemoveUntil(context, LoginScreen());
    }).catchError((e) {
      ToastOverlay(context).show(message: e.toString());
    });
  }

  void validate() {
    final phone = phoneController.text;
    final password = passwordController.text;

    if (phone.isNotEmpty && password.isNotEmpty) {
      notifier.value = true;
    } else {
      notifier.value = false;
    }
    // provider
    //bloc
    //flutter_bloc
  }
}
