import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:homework2/common/const/progress_dialog.dart';
import 'package:homework2/common/const/toast_overlay.dart';

import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/review_service.dart';

import '../../../../../models/reviewData.dart';

class ReviewBloc {
  final _listReviewStreamController = StreamController<List<ReviewData>>();

  Stream<List<ReviewData>> get streamReview => _listReviewStreamController.stream;

  StreamSink<List<ReviewData>> get sinkReview => _listReviewStreamController.sink;
  final _reviewStreamController = StreamController<ReviewData>();

  final BuildContext context;

  final reviews = <ReviewData>[];
  ReviewData? review;

  ReviewBloc(this.context) {
  }

  Future<void> getReviews({bool isClear = false}) async {
    final progressDialog = ProgressDialog(context);
    progressDialog.show();

    await apiService
        .getReview(offset: isClear ? 0 : reviews.length)
        .then((value) {
      if (isClear) {
        reviews.clear();
      }
      if (value.isNotEmpty) {
        reviews.addAll(value);
        _listReviewStreamController.add(reviews);
      } else if (isClear) {
        _listReviewStreamController.add(reviews);

      }
      progressDialog.hide();
    }).catchError((e) {
      progressDialog.hide();
      _listReviewStreamController.addError(e.toString());
    });
  }

  Future<void> postReview({required ReviewData review}) async {
    apiService
        .postReview(
            title: review.title ?? '',
            content: review.content ?? '',
            photos: review.photos?.join('|')?? '',
            rating: review.rating?? 0 )
        .then((value) {
      _reviewStreamController.add(value);
      ToastOverlay(context).show(
          message: 'Feedback ${review.title} successfully',
          type: ToastType.success);
    }).catchError((e) {
      _reviewStreamController.addError(e.toString());
      ToastOverlay(context).show(message: 'Errors occur ${e.toString()}');
      print('${e.toString()}');
    });
  }
}
