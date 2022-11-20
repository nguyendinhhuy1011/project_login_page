 import 'package:homework2/models/issue.dart';
import 'package:homework2/service/api_service.dart';


extension IssueService on APIService {
  Future<List<Issue>> getIssues({
    int limit = 20,
    required int offset,
  }) async {
    final result = await request(
      path: '/api/issues?limit=$limit&offset=$offset',
      method: Method.get,
    );

    final issues = List<Issue>.from(result.map((e) => Issue.fromJson(e)));
    return issues;
  }

  Future<Issue> reportIssue({
    required String title,
    required String content,
    required String photos,
}) async{
    final body = {
      "Title": title,
      "Content": content,
      "Photo": photos,
    };
    final result = await request(
      path: '/api/issues?limit=20&offset=0',
      method: Method.post,
      body: body,
    );
    final issue = Issue.fromJson(result);
    return issue;
  }
}