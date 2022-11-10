import 'package:firebase_messaging/firebase_messaging.dart';


class FCMManager {
  static final service = FCMManager._internal();
  factory FCMManager() => service;
  FCMManager._internal();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
    messaging.getToken().then((value) {
      print('token: $value');
    });
  }

  void listen(){
    // Foreground message
    FirebaseMessaging.onMessage.listen((message) {
      print('*** Got a message whilst in the foreground');
      print('Message data: ${message.data}');

      if (message.notification != null){
        print('*** notification: ${message.notification}');
      }
    });

    //Background and open app
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('onMessageOpenApp!');
      print('Message data: ${message.data}');

      if (message.notification !=null){
        print('*** notification: ${message.notification}');
      }
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print('getInitialMessage!');
      if (message?.notification !=null){
        print('*** notification: ${message?.notification}');
      }
    });

  }

}

final fcm = FCMManager();
