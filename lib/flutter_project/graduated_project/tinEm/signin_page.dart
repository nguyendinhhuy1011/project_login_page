import 'package:flutter/material.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/keyboard.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/common/widgets/hive_manager.dart';
import 'package:homework2/common/widgets/shared_preference.dart';
import 'package:homework2/flutter_project/graduated_project/tinEm/signup_page.dart';
import 'package:homework2/flutter_project/graduated_project/tinEm/update_account.dart';
import 'package:homework2/lifecycle/lifecycle.dart';
import 'package:homework2/service/user_service.dart';

import '../../../service/api_service.dart';
import 'bottom_navigation_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends LifecycleState<SignInPage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneError = 'Phone number must has 10 digits';
  final _passError = 'Password must be more than 4 digits and less than 8 digits';

  var _notifierPhoneInvalid = ValueNotifier<bool>(false);
  var _notifierPasswordInvalid = ValueNotifier<bool>(false);

  var notifier = ValueNotifier<bool>(false);


  @override
  void initState() {
    sharePrefs.getString(phoneKey).then((value) {
      _phoneController.text = value?? '';
    });
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();

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
            image: NetworkImage(
                'https://congngheviet.com/wp-content/uploads/2017/10/iPhone-wallpaper-Violet-Gradient-alexmuench-768x1366.png'),
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
                        valueListenable: _notifierPhoneInvalid,
                        builder: (context, value, _) {
                          return MyTextField2(
                            textInputAction: TextInputAction.next,
                            controller: _phoneController,
                            prefixIcon: const Icon(Icons.phone_android),
                            hintText: 'Phone Number',
                            autoFocus: true,
                            keyboardType: TextInputType.phone,
                            errorText:
                            _notifierPhoneInvalid.value ? _phoneError : null,
                            onChanged: (_) {
                              validate();
                              validatePhone();
                            },
                          );
                        },
                      ),
                      ValueListenableBuilder(
                          valueListenable: _notifierPasswordInvalid,
                          builder: (context, value, _) {
                            return MyTextField2(
                              textInputAction: TextInputAction.next,
                              controller: _passwordController,
                              prefixIcon: const Icon(Icons.security),
                              hintText: 'Password',
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              errorText: _notifierPasswordInvalid.value == true
                                  ? _passError
                                  : null,
                              onChanged: (_) {
                                validate();
                                validatePassword();
                              },
                            );
                          }),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: MyButton(
                                textButton: 'Sign Up',
                                onTap: signUp,
                                enable: true,
                              ),
                            ),
                            Expanded(
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: notifier,
                                  builder: (context, value, _) {
                                    return MyButton(
                                      textButton: 'Sign In',
                                      onTap: signIn,
                                      enable: value,
                                    );
                                  },
                                )),
                          ],
                        ),
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

  void signUp() {
    navigatorPush(context, SignUpPage());
  }

  Future signIn() async{

    apiService.login(
        phone: _phoneController.text,
        password: _passwordController.text).then((
        user) {
          sharePrefs.setString(phoneKey, _phoneController.text);
          hive.setValue(userTokenKey, user.token);

          ToastOverlay(context).show(message: 'Hello ${user.name}');
          apiService.token = user.token?? '';
          print('Token: ${user.token.toString()}');
      navigatorPushAndRemoveUntil(context, BottomBarPage());
    }).catchError((e){
      ToastOverlay(context).show(message: e.toString());
    });
  }

  void validate() {
    final phone = _phoneController.text;
    final password = _passwordController.text;

    if (phone.length == 10 && 4 <= password.length && password.length <= 8) {
      notifier.value = true;
    } else {
      notifier.value = false;
    }
  }

  void validatePhone() {
    final phone = _phoneController.text;
    if (phone.length == 10) {
      _notifierPhoneInvalid.value = false;
    } else {
      _notifierPhoneInvalid.value = true;
    }
  }

  void validatePassword() {
    final password = _passwordController.text;
    if (password.length >= 4 && password.length <= 8) {
      _notifierPasswordInvalid.value = false;
    } else {
      _notifierPasswordInvalid.value = true;
    }
  }

}
