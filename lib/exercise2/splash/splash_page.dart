import 'package:flutter/material.dart';
import 'package:homework2/common/widgets/flutter_secure_storage.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/exercise2/project_page/issue_page.dart';


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
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100,),
      ),
    );
  }
  Future initData() async {
    await sharePrefs.init();
    await secureStorage.init();
    await hive.init();

    final token = await hive.getValue(userTokenKey);
    if (token != null){
      navigatorPushAndRemoveUntil(context, LoginScreen());
    }else {
      navigatorPushAndRemoveUntil(context, LoginScreen());
    }


  }
}
