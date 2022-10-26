import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HiveManager {
  static final _manager = HiveManager._internal();

  factory HiveManager() => _manager;

  HiveManager._internal();
  var _currentBox ='config';

  Future init() async{
    await Hive.initFlutter();
    await Hive.openBox('config');
  }

  Future<dynamic> getValue (String key) async{
    final box = Hive.box(_currentBox);
    return box.get(key);
  }
  Future<void> setValue (String key, dynamic value) async{
    final box = Hive.box(_currentBox);
    box.put(key,value);
  }

}
final hive = HiveManager();
const userTokenKey = 'userTokenKey';
