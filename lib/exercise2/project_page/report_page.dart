import 'package:flutter/material.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/toast_overlay.dart';

import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/issue_service.dart';
import 'package:homework2/service/photo_service.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/const/build_button.dart';
import '../../common/const/const.dart';
import '../../models/issue.dart';
import 'issue_page/bloc/issue_bloc.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final picker = ImagePicker();
  late IssueBloc bloc;

  @override
  void initState() {
    bloc = IssueBloc(context);
    super.initState();
  }

  // XFile? file;

  var url = "";
  List<String> photos = [];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

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
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextField2(
            controller: _titleController,
            keyboardType: TextInputType.text,
            labelText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          MyTextField2(
            controller: _contentController,
            keyboardType: TextInputType.text,
            labelText: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          buildGridviewImage(),
          const SizedBox(
            height: 16,
          ),
          MyButton(
            textButton: 'Save',
            textColor: Colors.black,
            backgroundColor: Colors.greenAccent,
            onTap: () {
              final issue = Issue(
                title: _titleController.text?? '',
                content: _contentController.text?? '',
                photos : photos,
              );
              bloc.reportIssue(issue: issue);
              print('issue: ${issue.photos.toString()}');
              // upload(url);

            },
          )
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
    } catch (e) {
      ToastOverlay(context).show(message: e.toString());
    }
  }

  // Future takeCamera({required ImageSource source}) async {
  //   try {
  //     final image = await picker.pickImage(
  //       preferredCameraDevice: CameraDevice.front,
  //       imageQuality: 40,
  //       source: source,
  //     );
  //     if (image != null) {
  //       upload(image);
  //     }
  //   } catch (e) {
  //     ToastOverlay(context).show(message: e.toString());
  //   }
  // }

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
    apiService.uploadPhoto(file: f).then((value) {
      print('url: $baseUrl${value.path}');
      setState(() {
        url = '$baseUrl${value.path}';
        photos.add(url);
      });
    }).catchError((e) {
      getLostData();
      ToastOverlay(context).show(message: e.toString());
    });
  }

  Widget buildGridviewImage() {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            print('list photos ${photos.length}');
            if (photos.isNotEmpty) {
              if (index == photos.length) {
                return addImage();
              } else {
                final image = photos[index];
                return listImage(image);
              }
            } else {
              return addImage();
            }
          },
          itemCount: photos.length + 1,
        ),
      ],
    );
  }

  Widget addImage() {
    return GestureDetector(
      onTap: () {
        selectImage(source: ImageSource.gallery);
        // upload(url);
      },
      child: Image.asset('assets/images/uploadImage1.jpeg', fit: BoxFit.cover,),
    );
  }

  Widget listImage(String image) {
    return Stack(
      children: [
        ClipRRect(
          child: SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: -10,
          child: IconButton(
            onPressed: () {
              setState(() {
                photos.remove(image);
              });
            },
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.brown,
            ),
          ),
        ),
      ],
    );
  }

  // void reportIssue(Issue issue) {
  //   bloc.reportIssue(issue: issue);
  //   apiService.reportIssue(
  //     title: _titleController.text?? '',
  //     content: _contentController.text?? '',
  //     photos: photos.join('|') ?? '',
  //   ).then((issue) {
  //     bloc.reportIssue(issue: issue);
  //     print('issue ${issue.toString()}');
  //     ToastOverlay(context).show(
  //         message: 'Added the article ${issue.title} successfully',
  //         type: ToastType.success);
  //   }).catchError((e){
  //     ToastOverlay(context).show(message: 'Errors occur ${e.toString()}');
  //   });
  // }
}
