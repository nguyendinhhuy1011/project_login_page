

import '../models/reviewData.dart';
import 'api_service.dart';

extension IssueService on APIService {
  Future<List<ReviewData>> getReview({
    int limit = 20,
    required int offset,
  }) async {
    final result = await request(
      path: '/api/reviews?limit=$limit&offset=$offset',
      method: Method.get,
    );

    final reviews = List<ReviewData>.from(result.map((e) => ReviewData.fromJson((e))));
    return reviews;
  }

  Future<ReviewData> postReview({
    required String title,
    required String content,
    required double rating,
    required String photos,

  }) async{
    final body = {
      "Title": title,
      "Content": content,
      "photos": photos,
      "rating": rating.toString(),
    };
    final result = await request(
      path: '/api/reviews',
      method: Method.post,
      body: body,
    );
    final review = ReviewData.fromJson(result);
    return review;
  }
}