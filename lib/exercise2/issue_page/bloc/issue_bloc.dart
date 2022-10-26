import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework2/common/const/progress_dialog.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/issue_service.dart';
import 'package:homework2/util/main.dart';

import '../../../models/issue.dart';

class IssueBloc {

  final _countStreamController = StreamController<int>();
  Stream<int> get stream => _countStreamController.stream;
  StreamSink<int> get sink => _countStreamController.sink;

  final _issueStreamController = StreamController<List<Issue>>();
  Stream<List<Issue>> get streamIssue => _issueStreamController.stream;
  StreamSink<List<Issue>> get sinkIssue => _issueStreamController.sink;

  final BuildContext context;
  final issues = <Issue>[];
  int count =0;

  IssueBloc(this.context){
    getIssues();
  }

  void increment(){
    count = count +1;
    sink.add(count);
  }
  void decrement(){
    count =count -1;
    // _countStreamController.sink.add(count);
    _countStreamController.add(count);
  }
  Future <void> getIssues({bool isClear =false}) async{
    // final context = navigatorKey.currentContext;
    // if (context == null){
    //   return;
    // }
    final progressDialog = ProgressDialog(context);

    progressDialog.show();

  await Future.delayed(Duration(seconds: 3));
  await apiService.getIssues(offset: isClear?0 : issues.length).then((value) {

      if (isClear){
        issues.clear();
      }
      if (value.isNotEmpty){
        issues.addAll(value);
        _issueStreamController.add(issues);
      } else if (isClear){
        _issueStreamController.add(issues);
      }

      progressDialog.hide();

    }).catchError((e){
    progressDialog.hide();
      _issueStreamController.addError(e.toString());
    });
  }
}