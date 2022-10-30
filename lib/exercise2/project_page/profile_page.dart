import 'package:flutter/material.dart';
import 'package:homework2/common/const/avatar.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/exercise2/project_page/left_menu_bar.dart';
import 'package:homework2/service/photo_service.dart';
import 'package:homework2/service/user_service.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/const/MyTextField2.dart';
import '../../common/const/build_button.dart';
import '../../common/const/const.dart';
import '../../common/const/toast_overlay.dart';
import '../../service/api_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();

  final picker = ImagePicker();
  var url = 'http://clipart-library.com/images/dT9rkjK6c.png';

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            showLeftMenuBar();
          },
        ),
      ),
      body: buildAccountbody(),
    );
  }

  Widget buildAccountbody() {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey.shade200,
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: IconButton(
                    onPressed: () {
                      selectImage(source: ImageSource.gallery);
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                )
              ],
            ),
          SizedBox(height: 20),
          MyTextField2(
            controller: _nameController,
            labelText: 'Full name',
            keyboardType: TextInputType.text,
          ),
          MyTextField2(
            controller: _dateOfBirthController,
            labelText: 'Date of Birth',
            keyboardType: TextInputType.datetime,
          ),
          MyTextField2(
            controller: _addressController,
            labelText: 'Address',
            keyboardType: TextInputType.text,
          ),
          MyTextField2(
              controller: _phoneNumberController,
              labelText: 'Phone Number',
              keyboardType: TextInputType.phone),
          MyTextField2(
              controller: _emailController,
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress),
          SizedBox(
            height: 20,
          ),
          MyButton(
              textButton: 'Save',
              onTap: () {
                updateProfile();
              })
        ],
      ),
    ));
  }

  Future selectImage({required ImageSource source}) async {
    try {
      final image = await picker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 10,
      );
      if (image != null) {
        uploadData(image);
      }

    } catch (e) {
      ToastOverlay(context).show(message: 'e.toString()');
    }
  }
    void uploadData(XFile f) {
      apiService.uploadPhoto(file: f).then((value) {
        setState(() {
          url = '$baseUrl${value.path}';
        });
      }).catchError((e) {
        ToastOverlay(context).show(
            message: 'Errors occur: ${e.toString()}', type: ToastType.error);
      });
    }


  void showLeftMenuBar() {
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.8),
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        builder: (context) {
          return Container(
            alignment: Alignment.topLeft,
            child: LeftMenuBar(),
          );
        });
  }

  void getProfile() {
    apiService.getProfile().then((profileUser) {
      _nameController.text = profileUser.name ?? '';
      _dateOfBirthController.text = profileUser.dateOfBirth ?? '';
      _addressController.text = profileUser.address ?? '';
      _phoneNumberController.text = profileUser.phoneNumber ?? '';
      _emailController.text = profileUser.email ?? '';
      url = profileUser.avatar ?? '';
      setState(() {});
      print('Link photo: $url');
    }).catchError((e) {
      ToastOverlay(context)
          .show(message: 'Error occurs ${e.toString()}', type: ToastType.error);
    });
  }

  void updateProfile() {
    apiService
        .updateProfile(
            name: _nameController.text,
            date: _dateOfBirthController.text,
            address: _addressController.text,
            email: _emailController.text,
            avatar: url)
        .then((profileUser) {
      profileUser.name = _nameController.text;
      profileUser.dateOfBirth = _dateOfBirthController.text;
      print('date Of birth: ${_dateOfBirthController.toString()}');
      profileUser.address = _addressController.text;
      profileUser.email = _emailController.text;
      profileUser.avatar = url;

      ToastOverlay(context)
          .show(message: 'Cập nhật thành công', type: ToastType.success);
    }).catchError((e) {
      ToastOverlay(context).show(
          message: 'Có lỗi xảy ra: ${e.toString()}', type: ToastType.error);
    });
  }
}
