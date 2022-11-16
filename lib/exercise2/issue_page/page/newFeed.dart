import 'package:flutter/material.dart';
import 'package:homework2/exercise2/issue_page/bloc/issue_bloc.dart';
import 'package:homework2/models/new_feed_model.dart';

class NewFeedPage extends StatefulWidget {
  const NewFeedPage({Key? key}) : super(key: key);

  @override
  State<NewFeedPage> createState() => _NewFeedPageState();
}

class _NewFeedPageState extends State<NewFeedPage> {
  final listNewfeed = [];
  // late IssueBloc bloc;


  @override
  void initState() {
    // bloc = IssueBloc(context);
    listNewfeed.addAll([
        NewFeedModel(avaUser: 'assets/images/avar.jpeg',
        nameUser: 'Huy Nguyen',
        datePost: '20/10/2022',
        status: 'Verifying',
        titlePost: 'Who are you ?',
        contentPost: 'I am a hero. When I was a kid, I always dreamed to be able to fly.'
            ' Now, I could be able to lift 200 Kg but I still cannot fly ',
          imagePost: [
            'assets/images/sup.jpeg',
          ]
        ),
      NewFeedModel(avaUser: 'assets/images/logo2.jpeg',
          nameUser: 'Tin Pham',
          datePost: '20/08/2022',
          status: 'Verified',
          titlePost: 'How to become a Dad',
          contentPost: 'My girlfriend had pregnant. I know it is horrible. I am not ready to be a dad, a good dad.'
              'I wish I could back to the time when I was first year. I could do anything without take any responsibility.',
        imagePost: [
          'assets/images/dad.jpeg',
          'assets/images/dad2.jpeg',]
      ),

      NewFeedModel(avaUser: 'assets/images/avar.jpeg',
          nameUser: 'Huy Nguyen',
          datePost: '20/05/2022',
          status: 'Not verified',
          titlePost: 'I want to break up',
          contentPost: 'I love my girl friend, but she is pregnant. I know, I am an asshole.'
              'I dont know what to do, I remember how happy we were. But now it is time to say goodbye',
          imagePost: [
            'assets/images/love1.jpeg',
            'assets/images/love2.jpeg',
            'assets/images/love3.jpeg',
          ]
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue'),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.menu))
      ),
      body: buildNewFeeds(),
    );
  }

  Widget buildNewFeeds() {
    return Container(
      child: ListView.separated(
          itemBuilder: (context, index) {
            final newFeed = listNewfeed[index];
            return buildNewFeed(newFeed);
          },
          separatorBuilder: (_, __) => SizedBox(height: 8,),
          itemCount: listNewfeed.length),
    );
  }

  Widget buildNewFeed(NewFeedModel newFeed) {
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
                  child: Image.asset(newFeed.avaUser,height: 42,width: 42,fit: BoxFit.cover,)),
              SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(newFeed.nameUser),
                    Text(newFeed.datePost),
                  ],
                ),
              ),
              Text(newFeed.status,style: TextStyle(color: Colors.pinkAccent),),
            ],
          ),
          SizedBox(height: 16,),

          Text(newFeed.titlePost,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          Text(newFeed.contentPost),
          // Image.network('https://giupban.com.vn/wp-content/uploads/2019/09/hinh-an-tinh-yeu-buon-tan-vo.jpg'),
          Container(
            height: 200,
            child: GridView.builder(
              itemCount: newFeed.imagePost!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: newFeed.imagePost!.length==1?1:
                  newFeed.imagePost!.length==2?2:3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (BuildContext context, int index){
                  return Image.asset(newFeed.imagePost![index]);
                }
            ),
          ),
        ],
      ),
    );
  }
}
