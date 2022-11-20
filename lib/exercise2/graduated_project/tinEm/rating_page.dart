import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/exercise2/graduated_project/tinEm/review/review_bloc/review_bloc.dart';
import 'package:homework2/models/account_public.dart';

import 'package:homework2/models/rating_model.dart';

import '../../../models/reviewData.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  // final listRating = [];
  late ReviewBloc _reviewBloc;

  @override
  void initState() {
    _reviewBloc = ReviewBloc(context);
    _reviewBloc.getReviews();
    // listRating.addAll([
    //   RatingModel(
    //       avaUser: 'assets/images/avar.jpeg',
    //       nameUser: 'Huy Nguyen',
    //       datePost: '20/10/2022',
    //       ratingStar: 4,
    //       titlePost: 'Uyen Nhi',
    //       contentPost:
    //           'Good teamwork, technique she also can sing and be supportive. '
    //           'It’s a skittish kind of intimacy, restless and prone to flaming out. But there are moments',
    //       imagePost: [
    //         'https://kiemtientuweb.com/ckfinder/userfiles/images/anh-gai-xinh/anh-gai-xinh-2.jpg'
    //       ]),
    //   RatingModel(
    //       avaUser: 'assets/images/logo2.jpeg',
    //       nameUser: 'Hung',
    //       datePost: '20/11/2022',
    //       ratingStar: 1,
    //       titlePost: 'Kim',
    //       contentPost: 'Bad player, selfish, idiot, I suggest not to book her'
    //           'Mimmi biting back her emotions as Emma dances for her alone at night – that tingle with discovery and promise.',
    //       imagePost: [
    //         'https://kiemtientuweb.com/ckfinder/userfiles/images/anh-gai-xinh/anh-gai-xinh-8.jpg',
    //         'https://kiemtientuweb.com/ckfinder/userfiles/images/anh-gai-xinh/anh-gai-xinh-12.jpg',
    //       ]),
    //   RatingModel(
    //       avaUser: 'assets/images/avar.jpeg',
    //       nameUser: 'Huy Nguyen',
    //       datePost: '10/10/2022',
    //       ratingStar: 5,
    //       titlePost: 'Tien',
    //       contentPost:
    //           'Emma is a competitive figure skater whose world, and her rigorous training regime, is rocked when she falls in love with Mimmi.'
    //           ' And Rönkkö hooks up with boy after hapless boy in the hope that one of them will unlock something in her soul.',
    //       imagePost: [
    //         'https://kiemtientuweb.com/ckfinder/userfiles/images/anh-gai-xinh/anh-gai-xinh-14.jpg',
    //         'https://kiemtientuweb.com/ckfinder/userfiles/images/anh-gai-xinh/anh-gai-xinh-16.jpg',
    //         'https://kiemtientuweb.com/ckfinder/userfiles/images/anh-gai-xinh/anh-gai-xinh-19.jpg'
    //       ]),
    //   RatingModel(
    //       avaUser: 'assets/images/dad2.jpeg',
    //       nameUser: 'Kang',
    //       datePost: '08/08/2022',
    //       ratingStar: 3,
    //       titlePost: 'Phuong',
    //       contentPost:
    //           'When “Girls” had its premiere on HBO in 2012, it was an instant lightning rod.'
    //           'A dramedy about four 20-something women searching for careers and companionship in New York.',
    //       imagePost: [
    //         'https://kiemtientuweb.com/ckfinder/userfiles/images/anh-gai-xinh/anh-gai-xinh-26.jpg'
    //       ]),
    // ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: buildReviews(),
    );
  }

  Widget buildReviews() {
    return StreamBuilder<List<ReviewData>>(
      stream: _reviewBloc.streamReview,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          final reviews = snapshot.data ?? [];
          return ListView.separated(
              itemBuilder: (context, index) {
                if (index == reviews.length - 1) {
                  _reviewBloc.getReviews();
                }
                return buildReview(reviews[index]);
              },
              separatorBuilder: (_, __) => SizedBox(
                    height: 8,
                  ),
              itemCount: reviews.length);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildReview(ReviewData reviews) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 14,
              spreadRadius: 14,
              offset: const Offset(0, 4),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network(
                    reviews.account?.avatar??
                        'https://png.pngtree.com/png-clipart/20190925/original/pngtree-no-avatar-vector-isolated-on-white-background-png-image_4979074.jpg',
                    height: 42,
                    width: 42,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reviews.account?.name ?? 'Anonymus'),
                    Text(reviews.createdAt ?? ''),
                  ],
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(
                ' ${reviews.rating?.toString() ?? ''} ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            reviews.title ?? '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(reviews.content ?? ''),
          SizedBox(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),

            height: 150,
            child: GridView.builder(
                itemCount: reviews.photos?.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: reviews.photos?.length==1?1:
                  reviews.photos?.length==2?2:3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (BuildContext context, int index){
                  return Image.network(reviews.photos?[index] );
                }
            ),
          ),
        ],
      ),
    );
  }
}
