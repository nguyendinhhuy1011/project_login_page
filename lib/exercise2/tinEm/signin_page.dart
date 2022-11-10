import 'package:flutter/material.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/keyboard.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/exercise2/tinEm/signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();


  var notifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    _phoneController.text = '0909408099';
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
          image: NetworkImage('https://congngheviet.com/wp-content/uploads/2017/10/iPhone-wallpaper-Violet-Gradient-alexmuench-768x1366.png'),
          fit: BoxFit.cover,
        )
      ),
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
                         MyTextField2(
                          controller: _phoneController,
                          prefixIcon: const Icon(Icons.phone) ,
                          hintText: 'Phone Number',
                          autoFocus: true,
                          keyboardType: TextInputType.phone,
                           onChanged: (_) => validate(),
                        ),
                        MyTextField2(
                          controller: _passwordController,
                          prefixIcon: const Icon(Icons.security),
                          hintText: 'Password',
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onChanged:  (_)=> validate(),
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: MyButton(
                                textButton: 'Sign Up',
                                onTap: signUp,
                                enable: true,
                              ),
                            ),
                            Expanded(
                              child: ValueListenableBuilder<bool>(valueListenable: notifier, builder: (context, value, _) {
                                return MyButton(
                                  textButton: 'Sign In',
                                  onTap: signIn,
                                  enable: value,
                                );
                              },)
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

  void signUp(){
    navigatorPush(context, SignUpPage());
  }
  void signIn(){

  }
  void validate(){
    final phone = _phoneController.text;
    final password = _passwordController.text;

    if (phone.length ==10 && 4<=password.length && password.length<=6 ){
      notifier.value = true;
    } else {
      notifier.value = false;
    }

  }

}
