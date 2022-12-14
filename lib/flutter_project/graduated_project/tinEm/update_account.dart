import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/keyboard.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/common/const/progress_dialog.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/flutter_project/graduated_project/tinEm/signin_page.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/photo_service.dart';
import 'package:homework2/service/user_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../common/const/MyTextField2.dart';
import '../../../common/const/const.dart';
import '../../../module/fcm/fcm_manager.dart';
import 'bottom_navigation_page.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({Key? key}) : super(key: key);

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();

  final _mailController = TextEditingController();

  final picker = ImagePicker();
  var url = 'https://colombo.vn/upload/20770/20180604/no-avatar.png';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _bioController.dispose();

    _mailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fcm.requestPermission();
    getProfile();
    super.initState();
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
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            navigatorPushAndRemoveUntil(context, SignInPage());
                          },
                          child: Icon(LineAwesomeIcons.arrow_left)),
                    ),
                  ),
                  Text(
                    'Update Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorPushAndRemoveUntil(context, BottomBarPage());
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            navigatorPushAndRemoveUntil(context, BottomBarPage());
                          },
                          child: Icon(LineAwesomeIcons.arrow_right,color: Colors.black,)),
                    ),
                  )
                ],
              ),
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
                    child: Image.network(
                      url,
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

                      child: GestureDetector(
                          onTap: () {
                            selectImage(source: ImageSource.gallery);
                          },
                          child: const Icon(Icons.add_a_photo)),

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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: MyTextField2(
                          controller: _mailController,
                          prefixIcon: Icon(Icons.info),
                          labelText: 'Email',
                          hintText: 'Email',
                          keyboardType: TextInputType.text,
                          maxLines: 3,
                          heightTextField: 28,
                        ),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 26, vertical: 20),
                        child: MyButton(
                            textButton: 'Save',
                            onTap: () {
                              updateProfile();
                              navigatorPush(context, BottomBarPage());
                              // navigatorPush(context, AccountPage());
                            })),
                    Container(
                      height: 130,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future <void> getProfile() async{
    final progressDialog = ProgressDialog(context);
    progressDialog.show();
    await apiService.getProfile().then((profile) {
      _nameController.text = profile.name ?? '';
      _mailController.text = profile.email ?? '';
      _bioController.text = profile.address ?? '';
      _phoneController.text = profile.phoneNumber ?? '';
      url = profile.avatar ??
          'https://colombo.vn/upload/20770/20180604/no-avatar.png';
      setState(() {});
      progressDialog.hide();
    }).catchError((e) {
      progressDialog.hide();
      ToastOverlay(context)
          .show(message: 'Error occurs ${e.toString()}', type: ToastType.error);
    });
  }

  void updateProfile() {
    apiService
        .updateProfile(
            name: _nameController.text,
            date: '',
            address: _bioController.text,
            email: _mailController.text,
            avatar: url)
        .then((profileUser) {
      profileUser.name = _nameController.text;
      profileUser.address = _bioController.text;
      profileUser.email = _mailController.text;
      profileUser.avatar = url;

      ToastOverlay(context)
          .show(message: 'Updated successfully', type: ToastType.success);
    }).catchError((e) {
      ToastOverlay(context).show(
          message: 'Errors occur: ${e.toString()}', type: ToastType.error);
    });
  }

  void uploadAva(XFile f) {
    final progressDialog = ProgressDialog(context);
    progressDialog.show();
    apiService.uploadPhoto(file: f).then((value) {
      setState(() {
        url = '$baseUrl${value.path}';
        ToastOverlay(context).show(message: 'Upload Avatar successfully');
      });
      progressDialog.hide();
    }).catchError((e) {
      ToastOverlay(context).show(
          message: 'Errors occur: ${e.toString()}', type: ToastType.error);
    });
  }

  Future selectImage({required ImageSource source}) async {
    try {
      final image = await picker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 10,
      );
      if (image != null) {
        uploadAva(image);
      }

    } catch (e) {

      ToastOverlay(context).show(message: '${e.toString()}');
    }
  }
}
