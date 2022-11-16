import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/exercise2/tinEm/bottom_navigation_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class TinEmPage extends StatefulWidget {
  const TinEmPage({Key? key}) : super(key: key);

  @override
  State<TinEmPage> createState() => _TinEmPageState();
}

class _TinEmPageState extends State<TinEmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(57,54,44, 0.6),
      extendBodyBehindAppBar: true,
      body: buildCard(),
    );
  }

  buildCard() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 480,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://timanhdep.com/wp-content/uploads/2022/06/hinh-anh-gai-xinh-tiktok-dep-33.jpg',
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 50, horizontal: 16),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(LineAwesomeIcons.arrow_left,color: Colors.white,),
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phuong Anh, 22',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(' 4.9',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      LineAwesomeIcons.crown,
                      color: Colors.yellow,
                    ),
                    Text(' Cao Thủ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Anh cứ việc feed, gánh team cứ để em lo',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.white)),
                SizedBox(height: 18,),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 4, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(colors: [
                            Colors.red,
                            Colors.deepPurpleAccent,
                          ])),
                      child: Text(
                        'Liên Quân',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 4, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(colors: [
                            Colors.red,
                            Colors.deepPurpleAccent,
                          ])),
                      child: Text(
                        'Dating',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 4, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(colors: [
                            Colors.red,
                            Colors.deepPurpleAccent,
                          ])),
                      child: Text(
                        'Sing',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
