import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/choiceButton.dart';
import 'package:homework2/common/const/const.dart';
import 'package:homework2/common/const/progress_dialog.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/exercise2/graduated_project/tinEm/review/review_bloc/review_bloc.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/photo_service.dart';
import 'package:image_picker/image_picker.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../models/reviewData.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final picker = ImagePicker();

  // var _ratingController = TextEditingController();
  double rating = 0;
  late ReviewBloc reviewBloc;
  var url = '';
  List<String> photos =[];

  @override
  void initState() {
    reviewBloc = ReviewBloc(context);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    // ratingController.dispose();
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
    return Container(
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     colors: [
          //       Color.fromRGBO(24, 3, 51, 0.2),
          //       Colors.indigo.withOpacity(0.4),
          //     ],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomCenter,
          //     stops: [0.6,1]
          // )
        image: DecorationImage(
            image: AssetImage('assets/images/background3.jpg'),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 30, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 28,
                            ),
                          ),
                        ),
                        Text(
                          'Evaluate',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Container(height: 24, width: 24),
                      ],
                    ),
                  ),
                  buildLogo(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: TextField(
                          autocorrect: false,
                          controller: _titleController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.label_sharp,
                              color: Colors.white,
                            ),
                            hintText: 'Tittle',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          keyboardType: TextInputType.text,
                          // validatePassword();
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: TextField(
                          autocorrect: false,
                          controller: _contentController,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.rate_review_outlined,
                              color: Colors.white,
                            ),
                            hintText: 'Content...',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          keyboardType: TextInputType.text,
                          // validatePassword();
                        ),
                      ),
                    ),
                  ),
                  buildGridviewImage(),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Rating: $rating',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      RatingBar.builder(
                        minRating: 1,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                        ),
                        onRatingUpdate: (value) {
                          setState(() {
                            this.rating = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          final review = ReviewData(
                            title: _titleController.text ?? '',
                            content: _contentController.text ?? '',
                            photos: photos,
                            rating: rating,
                          );
                          reviewBloc.postReview(review: review);
                          print('title: ${review.title}\n'
                              'content: ${review.content}\n'
                              'rating: ${review.rating}\n'
                              'photo: ${review.photos.toString()}');
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.amber,
                            ),
                            height: 50,
                            width: 160,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/submitIcon.png',
                                  color: Colors.indigo,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo),
                                ),
                              ],
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLogo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Image.asset(
        'assets/images/logofox.png',
        height: 110,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget addImage() {
    return GestureDetector(
      onTap: (){
        selectImage(source: ImageSource.gallery);
      },
        child: Image.asset(
      'assets/images/upload4.png',

    ));
  }

  Future selectImage ({required ImageSource source}) async{
    try {
      final image = await picker.pickImage(
        source: source,
      );
      if (image !=null){
        upload(image);
      }
    } catch (e){
      ToastOverlay(context).show(message: e.toString());
    }
  }

  Future upload(XFile f) async{
    print('path: ${f.path}');
    final progressDialog = ProgressDialog(context);
    progressDialog.show();
    apiService.uploadPhoto(file: f).then((value) {
      setState(() {
        url = '$baseUrl${value.path}';
        photos.add(url);
      });
      progressDialog.hide();
    }).catchError((e){
      getLostData();
      ToastOverlay(context).show(message: e.toString());
    });
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
  Widget buildGridviewImage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
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
      ),
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
          top: 0,
          right: 5,
          child: Container(
            height: 28,
            width: 24,
            decoration: BoxDecoration(
              color: Colors.indigo,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  photos.remove(image);
                });
              },
              child: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
