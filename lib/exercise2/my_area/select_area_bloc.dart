import 'dart:async';

import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/area_service.dart';

import '../../models/area.dart';

class SelectAreaBloc {

  final streamController = StreamController<List<Area>>();
  final list = <Area>[];
  final listFilter = <Area>[];
  String city = "";

  Stream get stream => streamController.stream;

  void dispose (){
    streamController.close();
  }

  Future getCities()async{
    apiService.getCities().then((value) {
      list.clear();
      list.addAll(value);
      streamController.add(list);
    }).catchError((e){
      print('e: ${e.toString()}');
      ToastOverlay(e);
    });
  }

  Future getDistrict({required String cityId})async{
    apiService.getDistrict(cityId: cityId).then((value) {
      listFilter.clear();
      listFilter.addAll(value);
      streamController.add(listFilter);
    }).catchError((e){
      print('e: ${e.toString()}');
      ToastOverlay(e);
    });
  }

  void setCity(String city) {
    this.city = city;
    streamController.sink.add([]);
  }
}