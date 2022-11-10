import 'package:flutter/material.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/build_button.dart';

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
            image: NetworkImage('https://congngheviet.com/wp-content/uploads/2017/10/iPhone-wallpaper-Violet-Gradient-alexmuench-768x1366.png'),
            fit: BoxFit.cover,
          )
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildLogo(),
                  MyTextField2(
                    prefixIcon: Icon(Icons.phone) ,
                    hintText: 'Full Name',
                    autoFocus: true,
                    keyboardType: TextInputType.text,
                  ),
                  MyTextField2(
                    prefixIcon: Icon(Icons.security),
                    hintText: 'Phone Number',
                    autoFocus: true,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  MyTextField2(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    autoFocus: true,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  MyTextField2(
                    prefixIcon: Icon(Icons.security),
                    hintText: 'Password',
                    keyboardType: TextInputType.text,
                    obscureText: true,

                  ),

                  MyButton(
                    widthBtn: double.infinity,
                    textButton: 'Sign Up',
                    onTap: () {},
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
}
