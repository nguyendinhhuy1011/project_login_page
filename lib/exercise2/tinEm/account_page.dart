import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homework2/common/const/choiceButton.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/exercise2/project_page/profile_page.dart';
import 'package:homework2/exercise2/tinEm/rating_page.dart';
import 'package:homework2/exercise2/tinEm/review_page.dart';
import 'package:homework2/exercise2/tinEm/tinEm_page.dart';
import 'package:homework2/exercise2/tinEm/update_account.dart';
import 'package:homework2/exercise2/tinEm/signin_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../models/personal_setting.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {


  @override
  void initState() {
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
            height: 400,
            // height: MediaQuery.of(context).size.height /2,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 45.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/avar.jpeg',
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
                          onTap: (){
                            navigatorPush(context, TinEmPage());
                          },
                          child: ChoiceButton(
                            color: Theme.of(context).colorScheme.secondary,
                            icon: LineAwesomeIcons.search,
                            size: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
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
                          onTap: (){
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
                  'Huy Nguyen',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
                ),
                SizedBox(height: 16,),
                Text(
                  'About',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                Text(
                  'I’m really loving the variety in all the photos on here. It’s like a Dr. Seuss book: One dead fish, two dead fish, red dead fish, blue dead fish.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16,),
                Text(
                  'Interest',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 4,right: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(colors: [
                      Colors.red,
                      Colors.blue,
                    ])
                  ),
                  child: Text('Arena of Valor' , style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
// Text(
// 'Huy Nguyen',
// style: GoogleFonts.lato(
// color: Colors.white,
// fontWeight: FontWeight.w700,
// fontSize: 20),
// ),
// SizedBox(
// height: 6,
// ),
// Text(
// '0909408099',
// style: GoogleFonts.lato(
// color: Colors.white,
// fontWeight: FontWeight.w700,
// fontSize: 14,
// fontStyle: FontStyle.italic),
// ),

// Widget buildSettings() {
//   return Container(
//     height: 300,
//     child: ListView.separated(
//       itemBuilder: (
//         context,
//         index,
//       ) {
//         final personalSetting = listSetting[index];
//         return buildSetting(personalSetting);
//       },
//       separatorBuilder: (_, __) => SizedBox(
//         height: 8,
//       ),
//       itemCount: listSetting.length,
//     ),
//   );
// }

// Widget buildSetting(PersonalSetting personalSetting) {
//   return GestureDetector(
//     onTap: () {
//       if (personalSetting.select == 'Update Profile') {
//         navigatorPush(context, AccountPage());
//       }
//       if (personalSetting.select == 'Log out') {
//         navigatorPushAndRemoveUntil(context, SignInPage());
//       }
//     },
//     child: Container(
//       margin: EdgeInsets.symmetric(horizontal: 38, vertical: 8),
//       height: 52,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.greenAccent,
//       ),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 18,
//           ),
//           personalSetting.icon,
//           SizedBox(
//             width: 8,
//           ),
//           Text(
//             personalSetting.select,
//             style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
