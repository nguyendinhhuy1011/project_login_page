import 'package:flutter/material.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/flutter_project/graduated_project/tinEm/signin_page.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/user_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _phoneError = 'Phone number must has 10 digits';
  final _passError = 'Password must be more than 4 digits and less than 8 digits';
  final _mailError = 'Email must contains @gmail.com';

  var _notifierPhoneInvalid = ValueNotifier<bool>(false);
  var _notifierPasswordInvalid = ValueNotifier<bool>(false);
  var _notifierEmailInvalid = ValueNotifier<bool>(false);

  var notifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _mailController.dispose();
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
          )
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24, top: 24),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                              child: Icon(Icons.arrow_back)),
                        ),
                      ),
                    ],
                  ),
                  buildLogo(),
                  MyTextField2(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Full Name',
                    autoFocus: true,
                    keyboardType: TextInputType.text,
                    onChanged: (_)=>validate(),
                  ),
                  ValueListenableBuilder(
                    valueListenable: _notifierPhoneInvalid,
                    builder: (context, value, _) {
                      return MyTextField2(
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
                      valueListenable: _notifierEmailInvalid,
                      builder: (context, value, _) {
                        return MyTextField2(
                          controller: _mailController,
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.mail),
                          hintText: 'Email',
                          keyboardType: TextInputType.text,
                          errorText: _notifierEmailInvalid.value==true ? _mailError : null,
                          onChanged: (_) {
                            validate();
                            validEmail();
                          },
                        );
                      }),
                  ValueListenableBuilder(
                      valueListenable: _notifierPasswordInvalid,
                      builder: (context, value, _) {
                        return MyTextField2(
                          controller: _passwordController,
                          textInputAction: TextInputAction.next,
                          prefixIcon: const Icon(Icons.security),
                          hintText: 'Password',
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          errorText: _notifierPasswordInvalid.value==true ? _passError : null,
                          onChanged: (_) {
                            validate();
                            validatePassword();
                          },
                        );
                      }),
                  SizedBox(height: 16,),

                  ValueListenableBuilder<bool>(
                    valueListenable: notifier,
                    builder: (context, value, _) {
                      return MyButton(
                        widthBtn: 180,
                        textButton: 'Sign Up',
                        enable: value,
                        onTap: () {
                          register();
                        },
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

  void validate() {
    final name = _nameController.text;
    final phone = _phoneController.text;
    final email = _mailController.text;
    final password = _passwordController.text;

    if (2 <= name.length && name.length <= 10 && phone.length == 10 &&
        email.length > 10 && email.contains('@gmail.com') &&
        password.length >= 4 && password.length <= 8){
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

  void validEmail(){
    final email = _mailController.text;
    if (email.length > 10 && email.contains('@gmail.com')){
      _notifierEmailInvalid.value = false;
    } else {
      _notifierEmailInvalid.value = true;
    }
  }

  void register() {
    apiService.register(
      name: _nameController.text,
      phone: _phoneController.text,
      password: _passwordController.text,
      email: _mailController.text
    ).then((user) {
      ToastOverlay(context).show(message: 'Register successfully\n'
          'Welcome ${user.name}');

      navigatorPushAndRemoveUntil(context, SignInPage());
    }).catchError((e){
      ToastOverlay(context).show(message: 'Errors occur ${e.toString()}',type: ToastType.error);
    });
  }
}
