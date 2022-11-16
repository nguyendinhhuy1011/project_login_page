import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/build_button.dart';
import 'package:homework2/common/const/choiceButton.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  // var _ratingController = TextEditingController();
  double rating = 0;

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
        // appBar: AppBar(
        //   backgroundColor: Colors.yellow,
        //   elevation: 0,
        //   leading: GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).pop();
        //       },
        //       child: Icon(
        //         Icons.arrow_back_ios,
        //         color: Colors.black,
        //         size: 28,
        //       )),
        //   title: Text(
        //     'Review our babes',
        //     style: TextStyle(color: Colors.black, fontSize: 24),
        //   ),
        // ),
        body: buildbody(),
      ),
    );
  }

  Widget buildbody() {
    return Container(
      decoration: BoxDecoration(
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
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                          controller: _contentController,
                          style: TextStyle(color: Colors.white),
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
                        onTap: (){
                          ToastOverlay(context).show(message: 'Submitted successfully,'
                              'Tittle: ${_titleController.text.toString()}'
                              'Content: ${_contentController.text.toString()}'
                              'Rating ${rating.toDouble()}');
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
                                SizedBox(width: 8,),
                                Text('Submit', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo),),
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
      padding: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Image.asset(
        'assets/images/logofox.png',
        height: 150,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }

// Widget buildHotline() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//     child: RichText(
//       text: TextSpan(children: [
//         TextSpan(text: 'Book Us: ', style: TextStyle(color: Colors.white)),
//         TextSpan(text: '1900 8099', style: TextStyle(color: Colors.grey)),
//       ]),
//     ),
//   );
// }
}
