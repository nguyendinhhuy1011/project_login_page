
import 'package:flutter/material.dart';
import 'package:homework2/common/const/navigator.dart';

import 'package:homework2/common/widgets/flutter_secure_storage.dart';
import 'package:homework2/common/const/keyboard.dart';
import 'package:homework2/common/const/progress_dialog.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/common/widgets/hive_manager.dart';
import 'package:homework2/exercise2/project_page/profile_page.dart';
import 'package:homework2/exercise2/project_page/register_screen.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/const/MyTextField2.dart';
import '../../common/const/build_button.dart';
import '../../common/widgets/shared_preference.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  var isEnable = false;

  var notifier = ValueNotifier<bool>(false);
  late ProgressDialog progress;


  @override
  void initState() {
    // phoneController.text = '0909408099';

    progress = ProgressDialog(context);

    sharePrefs.getString(phoneKey).then((value) {
      phoneController.text = value ?? '';
    });

    secureStorage.getString(phoneKey).then((value) {
      phoneController.text = value ?? '';
    });

    super.initState();
  }


  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Build when login');
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
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
                    labelText: 'Phone Number',
                    autoFocus: true,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: MyButton(
                          onTap: register,
                          textButton: 'Register',
                        ),
                      ),
                      Expanded(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: notifier,
                          builder: (context, value, _) {
                            return MyButton(
                              onTap: login,
                              textButton: 'Log in',
                              enable: value,
                            );
                          },
                        ),
                      ),
                    ],
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
    navigatorPush(context, RegisterScreen());
  }

  Future login() async{
    // apiLogin().then((value) {
    //   ToastOverlay(context).show(message: 'Log in successfully');
    // }).catchError((e) {
    //   ToastOverlay(context).show(message: 'Log in failed: $e' );
    // });

    // progress.show();
    await Future.delayed(Duration(seconds: 3));
    apiService
        .login(phone: phoneController.text, password: passwordController.text)
        .then((user) {
          sharePrefs.setString(phoneKey, phoneController.text);
          secureStorage.setString(phoneKey, phoneController.text);
          
          hive.setValue(userTokenKey, user.token);
          // progress.hide();

      ToastOverlay(context).show(message: 'Hello ${user.name}');

      apiService.token = user.token ?? '';
      navigatorPushAndRemoveUntil(context, ProfilePage());



    }).catchError((e) {
      // progress.show();
      // // Future.delayed(Duration(seconds: 3));
      // progress.hide();
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
