import 'package:flutter/material.dart';
import 'package:homework2/common/const/MyTextField2.dart';
import 'package:homework2/common/const/navigator.dart';
import 'package:homework2/exercise2/my_Area/area_page.dart';
import 'package:homework2/exercise2/my_area/select_area_bloc.dart';
import 'package:homework2/models/area.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/area_service.dart';

class CityPage extends StatefulWidget {
  final Function (Area, Area) onDone;

  const CityPage({super.key, required this.onDone});


  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {

  final keyController = TextEditingController();
  late SelectAreaBloc bloc;
  @override
  void initState() {
    bloc = SelectAreaBloc();
    bloc.getCities();

    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: StreamBuilder(
            stream: bloc.stream,
            builder: (context,snapshot){
              return Text(bloc.citySelected == null? 'City' : 'District');
            },
          ),
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
          controller: keyController,
          hintText: 'Find..',
          onChanged: bloc.onFilter,
        ),
        Expanded(
          child: StreamBuilder<List<Area>>(
            stream: bloc.streamController.stream,
            builder: (context,snapshot){
              final list = snapshot.data ?? [];
              return GestureDetector(
                onTap: (){
                  setState(() {
                  });
                },
                child: ListView.separated(
                  itemBuilder: (context,index){
                    final area = list[index];
                    return buildItem(area);
                  },
                  separatorBuilder:  (_, __) => Divider(),
                  itemCount: list.length,
                ),
              );
            },
          ),),
      ],
    );
  }
  Widget buildItem(Area area){
    return GestureDetector(
      onTap: (){
        if (bloc.citySelected ==null){
          keyController.text = "";
          bloc.citySelected = area;
          bloc.getDistrict(cityId: area.id ?? '');
        } else {
          widget.onDone(bloc.citySelected!, area);
          Navigator.of(context).pop();
        }

      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:16,vertical: 16),
        child: Text(area.name ?? ''),
      ),
    );
  }
  // void getListCity(){
  //   apiService.getCities().then((value) {
  //     if (value.isNotEmpty){
  //       setState(() {
  //         listCity.addAll(value);
  //       });
  //     }
  //   }).catchError((e){
  //     print('error: ${e.toString()}');
  //   });
  // }
}
