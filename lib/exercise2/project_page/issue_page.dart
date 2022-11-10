import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homework2/exercise2/issue_page/bloc/issue_bloc.dart';
import 'package:homework2/exercise2/project_page/left_menu_bar.dart';
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
    bloc.getIssues();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue'),
      ),
      drawer: Drawer(
        child: LeftMenuBar(),
      ),
      body: buildNewFeeds(),
    );
  }

  Widget buildNewFeeds() {
    return StreamBuilder<List<Issue>>(
      stream: bloc.streamIssue,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          final issues = snapshot.data ?? [];
          return ListView.separated(
            itemBuilder: (context, index) {
              if (index == issues.length - 1) {
                bloc.getIssues();
              }
              return buildNewFeed(issues[index]);
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: issues.length,
          );
        }
        // return CircularProgressIndicator();
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildNewFeed(Issue issues) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  child: Image.network(
                      issues.accountPublic?.avatar ??
                          'https://png.pngtree.com/png-clipart/20190925/original/pngtree-no-avatar-vector-isolated-on-white-background-png-image_4979074.jpg',
                      height: 42,
                      width: 42,
                      fit: BoxFit.cover)),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(issues.accountPublic?.name ?? ''),
                    Text(issues.createdAt ?? ''),
                  ],
                ),
              ),
              if (issues.status == 0) ...{
                Text('Not verified')
              } else if (issues.status == 1) ...{
                Text('Veriying')
              } else ...{
                Text('Verified')
              }
              // Text(issues.status.toString()),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            issues.title ?? '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(issues.content ?? ''),

          Container(
            height: 200,
            child: GridView.builder(
                itemCount: issues.photos!.length,
                // physics: const NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: issues.photos!.length == 1?1:
                  issues.photos!.length == 2?2:3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CachedNetworkImage(
                    imageUrl: issues.photos![index] ,
                    errorWidget: (_,__, ___) => Icon(Icons.error),
                    // Image.network(issues.photos![index]);
                  );

                }),
          ),

        ],
      ),
    );
  }
}
