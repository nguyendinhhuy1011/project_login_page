

import 'package:homework2/models/area.dart';

import 'api_service.dart';

extension AreaService on APIService {
  Future<List<Area>> getCities () async{

    final result = await request(
      path: '/api/area/cities',
      method: Method.get,
    );
    return  List<Area>.from(result.map((e) => Area.fromJson(e)));
  }

  Future<List<Area>> getDistrict ({required String cityId}) async{

    final result = await request(
      path: '/api/area/districts?cityId=$cityId',
      method: Method.get,
    );
    return  List<Area>.from(result.map((e) => Area.fromJson(e)));
  }
}