import 'package:flutter/material.dart';
import 'package:homework2/common/const/avatar.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/common/const/progress_dialog.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/exercise2/project_page/issue_page.dart';
import 'package:homework2/exercise2/project_page/login_page.dart';
import 'package:homework2/exercise2/project_page/profile_page.dart';
import 'package:homework2/exercise2/project_page/report_page.dart';

import 'package:homework2/models/personal_setting.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/user_service.dart';

import 'change_password_page.dart';


class LeftMenuBar extends StatefulWidget {
  const LeftMenuBar({Key? key}) : super(key: key);

  @override
  State<LeftMenuBar> createState() => _LeftMenuBarState();
}



class _LeftMenuBarState extends State<LeftMenuBar> {
  late ProgressDialog progressDialog;
  var url = 'https://pic.onlinewebfonts.com/svg/img_264570.png';
  String? userName;
  String? userPhone;

  final listSetting = [];


  @override
  void initState() {
    uploadUser();
    listSetting.addAll([
      PersonalSetting(select: 'Issue', icon: Icon(Icons.menu,),),
      PersonalSetting(select: 'Report', icon: Icon(Icons.report_problem)),
      PersonalSetting(select: 'Change Password', icon: Icon(Icons.wifi_protected_setup)),
      PersonalSetting(select: 'Profile', icon: Icon(Icons.account_circle)),
      PersonalSetting(select: 'Contact', icon: Icon(Icons.contact_support)),
      PersonalSetting(select: 'Log out', icon: Icon(Icons.logout)),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 350,
      height: 600,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 120,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 56,
                          height: 56,
                          child: Image.network(url, fit: BoxFit.cover,),
                        ),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(userName?? ''),
                      Text(userPhone?? ''),
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: buildSettings()),
          ],
        ),
      ),
    );
  }

  void uploadUser(){
    apiService.getProfile().then((user) {
      url = user.avatar?? 'https://pic.onlinewebfonts.com/svg/img_264570.png';
      userName = user.name?? '';
      userPhone = user.phoneNumber?? '';
      setState(() {
      });
    }).catchError((e){
        ToastOverlay(context).show(message: 'Errors occur: ${e.toString()}');
    });
  }


  Widget buildSettings() {
    return Container(
      color: Colors.white,
      child: ListView.separated(itemBuilder: (context,index,){
        final personalSetting = listSetting[index];
        return buildSetting(personalSetting);
      },
          separatorBuilder: (_, __) => SizedBox(height: 8,),
          itemCount: listSetting.length),

    );
  }
  Widget buildSetting(PersonalSetting personalSetting){
    return GestureDetector(
      onTap: (){
        if (personalSetting.select == 'Report'){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=>ReportPage(),
            ),
          );
        }
        else if (personalSetting.select =='Issue'){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=>IssuePage(),
            ),
          );
        } else if (personalSetting.select == 'Profile'){
          navigatorPush(context, ProfilePage());
        }
        else if (personalSetting.select == 'Change Password'){
          navigatorPush(context, SwitchPasswordPage());
        }
        else if (personalSetting.select == 'Log out'){
          navigatorPushAndRemoveUntil(context, LoginScreen());
        }
      },
      child: Container(
        color: Colors.white54,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Row(
                children: [
                  personalSetting.icon,
                  SizedBox(width: 8,),
                  Text(personalSetting.select,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
