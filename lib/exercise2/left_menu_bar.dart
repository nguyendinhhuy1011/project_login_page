import 'package:flutter/material.dart';
import 'package:homework2/common/const/avatar.dart';
import 'package:homework2/exercise2/issue_page/page/issue_page.dart';
import 'package:homework2/exercise2/issue_page/page/newFeed.dart';
import 'package:homework2/exercise2/report_page.dart';

import 'package:homework2/models/personal_setting.dart';

import 'package:homework2/exercise2/profile_page.dart';

class LeftMenuBar extends StatefulWidget {
  const LeftMenuBar({Key? key}) : super(key: key);

  @override
  State<LeftMenuBar> createState() => _LeftMenuBarState();
}



class _LeftMenuBarState extends State<LeftMenuBar> {

  final listSetting = [];

  @override
  void initState() {
    listSetting.addAll([
      PersonalSetting(select: 'Issue', icon: Icon(Icons.menu,),),
      PersonalSetting(select: 'Report', icon: Icon(Icons.report_problem)),
      PersonalSetting(select: 'Change Password', icon: Icon(Icons.wifi_protected_setup)),
      PersonalSetting(select: 'Policies', icon: Icon(Icons.policy)),
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
      margin: EdgeInsets.only(right: 32,),
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
                      child: Avatar(
                        widthAva: 56,
                        heightAva: 56,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Huy Nguyen',style: TextStyle(color: Colors.white),),
                      Text('0909408099', style: TextStyle(color: Colors.white),),
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
        }
      },
      child: Container(
        color: Colors.white54,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
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
