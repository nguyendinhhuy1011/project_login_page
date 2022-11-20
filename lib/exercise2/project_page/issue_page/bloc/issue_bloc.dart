import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework2/common/const/progress_dialog.dart';
import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/issue_service.dart';
import 'package:homework2/util/main.dart';

import '../../../../models/issue.dart';



class IssueBloc {
  // final _countStreamController = StreamController<int>();
  //
  // Stream<int> get stream => _countStreamController.stream;
  //
  // StreamSink<int> get sink => _countStreamController.sink;

  final _listIssueStreamController = StreamController<List<Issue>>();

  Stream<List<Issue>> get streamIssue => _listIssueStreamController.stream;

  StreamSink<List<Issue>> get sinkIssue => _listIssueStreamController.sink;

  final _issueStreamController = StreamController<Issue>();

  final BuildContext context;
  final issues = <Issue>[];
  Issue? issue;
  // int count = 0;

  IssueBloc(this.context) {
    getIssues();
  }

  // void increment() {
  //   count = count + 1;
  //   sink.add(count);
  // }
  //
  // void decrement() {
  //   count = count - 1;
  //   // _countStreamController.sink.add(count);
  //   _countStreamController.add(count);
  // }

  Future<void> getIssues({bool isClear = false}) async {
    // final context = navigatorKey.currentContext;
    // if (context == null){
    //   return;
    // }
    final progressDialog = ProgressDialog(context);

    progressDialog.show();

    await apiService
        .getIssues(offset: isClear ? 0 : issues.length)
        .then((value) {

      if (isClear) {
        issues.clear();
      }
      if (value.isNotEmpty) {
        issues.addAll(value);
        _listIssueStreamController.add(issues);
      } else if (isClear) {
        _listIssueStreamController.add(issues);
      }

      progressDialog.hide();
    }).catchError((e) {
      progressDialog.hide();
      _listIssueStreamController.addError(e.toString());
    });
  }

  Future<void> reportIssue({required Issue issue}) async {
    apiService
        .reportIssue(
      title: issue.title ?? '',
      content: issue.content ?? '',
      photos: issue.photos?.join('|') ?? '',
    )
        .then((value) {
      _issueStreamController.add(value);
      print('print ${issue.photos.toString()}');
      ToastOverlay(context).show(
          message: 'Added the article ${issue.title} successfully',
          type: ToastType.success);
    }).catchError((e) {
      _listIssueStreamController.addError(e.toString());
      ToastOverlay(context).show(message: 'Errors occur ${e.toString()}');
    });
  }
}
