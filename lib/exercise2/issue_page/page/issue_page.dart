import 'package:flutter/material.dart';
import 'package:homework2/exercise2/issue_page/bloc/issue_bloc.dart';
import 'package:homework2/exercise2/left_menu_bar.dart';
import 'package:homework2/models/issue.dart';


class IssuePage extends StatefulWidget {
  const IssuePage({Key? key}) : super(key: key);

  @override
  State<IssuePage> createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  late IssueBloc bloc;
  @override
  void initState() {
    bloc = IssueBloc(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Issue'),),
      drawer: Drawer(
        child: LeftMenuBar(),
      ),
      body: buildNewFeeds(),
    );
  }

  Widget buildNewFeeds() {
    return StreamBuilder <List<Issue>>(
      stream: bloc.streamIssue,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()),);
        }
        if (snapshot.hasData) {
          final issues = snapshot.data ?? [];
          return ListView.separated(
            itemBuilder: (context, index) {

              if (index== issues.length -1){
                bloc.getIssues();
              }
            return buildNewFeed(issues[index]);
          },
            separatorBuilder: (_, __) => Divider(),
            itemCount: issues.length,
          );
        }
        // return CircularProgressIndicator();
        return Container();
      },
    );
  }

Widget buildNewFeed(Issue issues) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
    decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8),
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
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(issues.accountPublic?.avatar?? '',height: 42,width: 42,fit: BoxFit.cover)),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(issues.accountPublic?.name?? ''),
                  Text(issues.createdAt?? ''),
                ],
              ),
            ),
            Text(issues.status.toString()),
          ],
        ),
        SizedBox(height: 16,),

        Text(issues.title?? '',style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 8,),
        Text(issues.content?? ''),
        // Image.network('https://giupban.com.vn/wp-content/uploads/2019/09/hinh-an-tinh-yeu-buon-tan-vo.jpg'),
        Container(
          height: 200,
          child: GridView.builder(
              itemCount: issues.photos!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: issues.photos!.length==1?1:
                issues.photos!.length==2?2:3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (BuildContext context, int index){
                return Image.network(issues.photos![index]);
              }
          ),
        ),
      ],
    ),
  );
}
}
