import 'package:flutter/material.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/exercise2/my_area/select_area_bloc.dart';
import 'package:homework2/models/area.dart';

class DistrictPage extends StatefulWidget {
  const DistrictPage({Key? key}) : super(key: key);

  @override
  State<DistrictPage> createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {

  late SelectAreaBloc bloc;
  Area? area;
  @override
  void initState() {
    bloc = SelectAreaBloc();
    bloc.getDistrict(cityId: area?.name?? '');
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select District'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        MyTextField2(
          hintText: 'Find..',
        ),
        Expanded(
          child: StreamBuilder<List<Area>>(
            stream: bloc.streamController.stream,
            builder: (context,snapshot){
              final list = snapshot.data ?? [];
              return ListView.separated(
                itemBuilder: (context,index){
                  final area = list[index];
                  return buildItem(area);
                },
                separatorBuilder:  (_, __) => Divider(),
                itemCount: list.length,
              );
            },
          ),),
      ],
    );
  }
  Widget buildItem(Area area){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:16,vertical: 16),
      child: Text('sadasdasdasdasd'),
    );
  }
}
