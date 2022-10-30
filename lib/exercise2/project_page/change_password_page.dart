import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework2/exercise2/project_page/login_page.dart';
import 'package:homework2/service/user_service.dart';

import '../../common/const/MyTextField2.dart';
import '../../common/const/build_button.dart';
import '../../common/const/navigator.dart';
import '../../common/const/toast_overlay.dart';
import '../../service/api_service.dart';



class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password'),),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          MyTextField2(
            labelText: 'OldPassword',
            controller: _oldPasswordController,
          ),
          const SizedBox(
            height: 16,
          ),
          MyTextField2(
            labelText: 'NewPassword',
            controller: _newPasswordController,
          ),
          const SizedBox(
            height: 16,
          ),
          MyButton(
              textButton: 'Save', backgroundColor: Colors.green, onTap: () {
            changePassword();
          }),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  void changePassword() {
    apiService
        .changePassword(
        oldPassword: _oldPasswordController.text,
        newPassword: _newPasswordController.text)
        .then((value) {
      ToastOverlay(context).show(message: 'Change Password successfully', type: ToastType.success);
      navigatorPushAndRemoveUntil(context, LoginScreen());
    })
        .catchError((e) {
      ToastOverlay(context).show(message: 'Có lỗi xảy ra: ${e.toString()}', type: ToastType.error);

    });
  }

}