import 'package:flutter/material.dart';
import 'package:homework2/common/widgets/flutter_secure_storage.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/exercise2/project_page/issue_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:homework2/exercise2/tinEm/signin_page.dart';
import '../../common/widgets/hive_manager.dart';
import '../../common/widgets/shared_preference.dart';
import '../project_page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          child: Image.asset('assets/images/ganhanhdencung.jpeg'),
        ),
      ),
    );
  }
  Future initData() async {
    await Firebase.initializeApp();
    await sharePrefs.init();
    await secureStorage.init();
    await hive.init();

    await Future.delayed(Duration(seconds: 1));
    final token = await hive.getValue(userTokenKey);
    if (token != null){
      navigatorPushAndRemoveUntil(context, SignInPage());
    }else {
      navigatorPushAndRemoveUntil(context, SignInPage());
    }


  }
}
