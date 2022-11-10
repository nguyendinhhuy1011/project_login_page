import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';

class LocationManager {
  static final _manager = LocationManager._internal();

  factory LocationManager() => _manager;

  LocationManager._internal(){
    print('LocationManager._internal');

  }

  StreamSubscription<Position>? subscription;
  GoogleMapsPlaces? places;

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  void listen() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    subscription =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {

      if (position ==null){
        print('Unknow');
      } else {
        print('${position.latitude.toString()}, ${position.longitude.toString()}');
      }
    });
  }

  void stop(){
    subscription?.cancel();
    subscription = null;
  }

}

final locationManager = LocationManager();
