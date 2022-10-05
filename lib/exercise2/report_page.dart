import 'package:flutter/material.dart';
import 'package:homework2/common/MyTextField2.dart';
import 'package:homework2/common/build_button.dart';
import 'package:homework2/common/myTextFiled.dart';
import 'package:homework2/exercise2/newFeed.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Report',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: buildReportBody(),
      ),
    );
  }

  Widget buildReportBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16),
          MyTextField2(
            labelText: 'Title',
            keyboardType: TextInputType.text,
          ),
          MyTextField2(
            labelText: 'Content',
            keyboardType: TextInputType.text,
            maxLines: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/vietel.jpeg',width: 150,height: 140,),
              InkWell(
                onTap: (){
                  print('Upload image');
                  },
                  child: Image.asset('assets/images/upload.jpeg', width: 150, height: 140,)),
            ],
          ),
          Mybutton(textButton: 'Save', onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=>NewFeedPage(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
