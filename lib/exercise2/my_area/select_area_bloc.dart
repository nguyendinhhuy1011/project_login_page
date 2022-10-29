import 'dart:async';

import 'package:homework2/common/const/toast_overlay.dart';
import 'package:homework2/service/api_service.dart';
import 'package:homework2/service/area_service.dart';

import '../../models/area.dart';

class SelectAreaBloc {

  final streamController = StreamController<List<Area>>.broadcast();
  final _list = <Area>[];
  final _listFilter = <Area>[];
  // var isCity = true;
  Area? citySelected;

  Stream get stream => streamController.stream;

  void dispose (){
    streamController.close();
  }

  Future getCities()async{
    apiService.getCities().then((value) {
      _list.clear();
      _listFilter.clear();
      _list.addAll(value);
      _listFilter.addAll(value);
      
      print('selectAreaBloc.getCities ${value.length}');
      streamController.add(_listFilter);
    }).catchError((e){
      print('e: ${e.toString()}');
      ToastOverlay(e);
    });
  }

  Future getDistrict({required String cityId})async{

    apiService.getDistrict(cityId: cityId).then((value) {
      // isCity = false;
      _list.clear();
      _listFilter.clear();
      _list.addAll(value);
      _listFilter.addAll(value);
      streamController.add(_listFilter);
    }).catchError((e){
      print('e: ${e.toString()}');

    });
  }

  void onFilter (String keyword){
    _listFilter.clear();
    _listFilter.addAll(_list.where((element) => element.name?.toLowerCase().contains(keyword.toLowerCase())==true).toList());
    streamController.add(_listFilter);
  }
}