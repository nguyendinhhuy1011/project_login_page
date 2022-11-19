import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/exercise2/tinEm/bottom_navigation_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../models/gamer_model.dart';

class GamerCard extends StatelessWidget {
  final GamerModel gamer;

  const GamerCard({
    Key? key,
    required this.gamer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
          child: SizedBox(
            height: 560,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        gamer.imageUrl,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow:  [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(3, 3)
                      )
                    ]
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(6, 3, 40, 0.2),
                          Colors.black12.withOpacity(0.9),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.6,1]
                      )
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${gamer.name}, ${gamer.age}',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(' ${gamer.rating}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Icon(
                                LineAwesomeIcons.crown,
                                color: Colors.yellow,
                              ),
                              Text(' ${gamer.rank}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(LineAwesomeIcons.coins, color: Colors.yellow,size: 22,),
                              SizedBox(width: 4,),
                              Expanded(
                                child: Text('${gamer.bio}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 17,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                            margin: EdgeInsets.only(top: 4, right: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(colors: [
                                  Colors.green,
                                  Colors.deepPurpleAccent,
                                ])),
                            child: Text(
                              '${gamer.game}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}