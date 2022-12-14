import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homework2/flutter_project/graduated_project/tinEm/review/review_bloc/review_bloc.dart';
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
                    reviews.account?.avatar ??
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
          reviews.photos!.isEmpty
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 190,
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: reviews.photos?.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: reviews.photos?.length == 1
                            ? 1
                            : reviews.photos?.length == 2
                                ? 2
                                : 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: CachedNetworkImage(
                              imageUrl: reviews.photos?[index],
                              fit: BoxFit.cover,
                            ));
                      }),
                ),
        ],
      ),
    );
  }
}
