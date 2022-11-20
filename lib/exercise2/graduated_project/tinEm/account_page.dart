import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homework2/common/const/choiceButton.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/common/const/progress_dialog.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/exercise2/graduated_project/tinEm/rating_page.dart';
import 'package:homework2/exercise2/graduated_project/tinEm/review/review_page/review_page.dart';
import 'package:homework2/exercise2/project_page/profile_page.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/user_service.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'gamerCard/tinEm_page.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var url ='https://i.pinimg.com/564x/33/9c/a9/339ca9776cca209ce2b6b27da47b8d85.jpg';
  String? name;
  String? bio;

  late ProgressDialog _progressDialog;

  @override
  void initState() {
    uploadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildHeader(),
      ),
    );
  }

  Widget buildHeader() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 450,
            // height: MediaQuery.of(context).size.height /2,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 45.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                              url,
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigatorPush(context, TinEmPage());
                          },
                          child: ChoiceButton(
                            color: Theme.of(context).colorScheme.secondary,
                            icon: LineAwesomeIcons.firefox,
                            size: 40,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigatorPush(context, RatingPage());
                          },
                          child: const ChoiceButton(
                            color: Colors.white,
                            icon: Icons.reviews,
                            hasGradient: true,
                            height: 80,
                            width: 80,
                            size: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigatorPush(context, ReviewPage());
                          },
                          child: ChoiceButton(
                            color: Theme.of(context).colorScheme.secondary,
                            icon: Icons.star_rate,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name?? '',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'About',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                Text(
                  bio?? '...',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Interest',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 4, right: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(colors: [
                        Colors.red,
                        Colors.blue,
                      ])),
                  child: Text(
                    'Arena of Valor',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> uploadUser() async{

    await apiService.getProfile().then((user) {
      url = user.avatar?? 'https://i.pinimg.com/564x/33/9c/a9/339ca9776cca209ce2b6b27da47b8d85.jpg';
      name = user.name?? '';
      bio = user.address?? '';

      setState(() {

      });

    }).catchError((e){
      ToastOverlay(context).show(message: 'Errors occur: ${e.toString()}');
    });
  }

}
