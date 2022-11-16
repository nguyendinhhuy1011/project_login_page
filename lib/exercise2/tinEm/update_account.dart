import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:homework2/common/const/avatar.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/keyboard.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/exercise2/tinEm/account_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../common/const/MyTextField2.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({Key? key}) : super(key: key);

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();
  final _interestController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    _interestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildbody(),
      ),
    );
  }

  Widget buildbody() {
    return GestureDetector(
      onTap: () => hideKeyboardAndUnFocus(context),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 30, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                ),
                Text(
                  'Update Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(height: 24, width: 24),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Container(
                    height: 130,
                    width: 130,
                    child: Image.asset(
                      'assets/images/avar.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 40,
                    width: 36,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        // selectImage(source: ImageSource.gallery);
                      },
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)],
                    )),
                child: Column(
                  children: [
                    Container(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: MyTextField2(
                          controller: _nameController,
                          labelText: 'Nickname',
                          textInputAction: TextInputAction.continueAction,
                          prefixIcon: Icon(
                            Icons.attribution_sharp,
                            size: 24,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: MyTextField2(
                          controller: _phoneController,
                          labelText: 'Phone Number',
                          prefixIcon: Icon(
                            Icons.phone_android,
                            size: 24,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: MyTextField2(
                          controller: _bioController,
                          prefixIcon: Icon(Icons.info),
                          labelText: 'Bio',
                          hintText: 'Some thing about you...',
                          keyboardType: TextInputType.text,
                          maxLines: 3,
                          heightTextField: 28,
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: MyTextField2(
                            controller: _interestController,
                            prefixIcon: Icon(Icons.interests),
                            labelText: 'Interest',
                            keyboardType: TextInputType.text,
                            maxLines: 3,
                            heightTextField: 28,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: MyButton(textButton: 'Save', onTap: (){
                          ToastOverlay(context).show(message: 'Nick: ${_nameController.text.toString()}'
                              'Phone: ${_phoneController.text.toString()}'
                              'Bio: ${_bioController.text.toString()}'
                              'Interest: ${_interestController.text.toString()}');
                          // navigatorPush(context, AccountPage());
                        })),
                    Container(height: 130,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
