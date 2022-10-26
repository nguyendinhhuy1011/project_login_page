import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/myTextFiled.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/exercise2/issue_page/page/newFeed.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/photo_service.dart';
import 'package:image_picker/image_picker.dart';

import '../common/const/build_button.dart';
import '../common/const/const.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final picker = ImagePicker();
  // XFile? file;

  var url = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Report',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: buildReportBody(),
      ),
    );
  }

  Widget buildReportBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16),
          MyTextField2(
            labelText: 'Title',
            keyboardType: TextInputType.text,
          ),
          MyTextField2(
            labelText: 'Content',
            keyboardType: TextInputType.text,
            maxLines: 5,
          ),
          SizedBox(
            height: 16,
          ),
          // if (file !=null)...[
          //   Image.file(File(file!.path)),
          // ] else ...[
          //   ],
          if (url.isNotEmpty)...{
            Image.network(url,height: 200,width: 300,),
          },
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    takeCamera(source: ImageSource.camera);
                  },
                  child: Image.asset(
                    'assets/images/camera.jpeg',
                    width: 130,
                    height: 140,
                    fit: BoxFit.cover,
                  )),
              InkWell(
                  onTap: () {
                    selectImage(source: ImageSource.gallery);
                  },
                  child: Image.asset(
                    'assets/images/upload.jpeg',
                    width: 170,
                    height: 140,
                    fit: BoxFit.cover,
                  )),
            ],
          ),
          MyButton(
              textButton: 'Save',
              onTap: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  Future selectImage({required ImageSource source}) async {
    try {
      final image = await picker.pickImage(
        source: source,
      );
      if (image != null) {
        upload(image);
      }
    }
    catch (e){
      ToastOverlay(context).show(message: e.toString());
    }
  }
  Future takeCamera({required ImageSource source}) async {
    try {
      final image = await picker.pickImage(
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 40,
        source: source,
      );
      if (image != null) {
        upload(image);
      }
    }
    catch (e){
      ToastOverlay(context).show(message: e.toString());
    }
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.files != null) {
      for (final XFile file in response.files ?? []) {
        upload(file);
      }
    } else {
      throw Exception('Error, cannot get image');
    }
  }

  void upload(XFile f) {
    print('path: ${f.path}');

    // setState(() {
    //   file =f;
    // });
    apiService.uploadPhoto(file: f).then((value){
      print('url: $baseUrl${value.path}');
      setState(() {
        url = '$baseUrl${value.path}';
      });
    }).catchError((e){
      ToastOverlay(context).show(message: e.toString());
    });
  }
}
