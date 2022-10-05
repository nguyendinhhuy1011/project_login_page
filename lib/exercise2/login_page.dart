import 'package:flutter/material.dart';
import 'package:homework2/common/build_button.dart';
import 'package:homework2/common/myTextFiled.dart';
import 'package:homework2/exercise2/left_menu_bar.dart';
import 'package:homework2/exercise2/profile_page.dart';

import '../common/MyTextField2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        buildLogo(),
        SizedBox(
          height: 20,
        ),
        MyTextField2(
            labelText: 'Phone Number', keyboardType: TextInputType.phone,),
        MyTextField2(
          labelText: 'Password',
          keyboardType: TextInputType.text,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Mybutton(
              onTap: () {
              },
              textButton: 'Register',
              widthBtn: 140,
              backgroundColor: Colors.grey,
            ),
            Mybutton(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_)=>ProfilePage(),
                  ),
                );
              },
              textButton: 'Log in',
              widthBtn: 140,
              backgroundColor: Colors.grey,
            ),
          ],
        ),
        Expanded(
            child: Align(
                alignment: Alignment.bottomCenter, child: buildHotline())),
      ],
    );
  }

  Widget buildLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(130),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        height: 200,
        child: Image.asset(
          'assets/images/logo3.png',
          width: 230,
          height: 80,
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

}
