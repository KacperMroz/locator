import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:locator/app/app.dart';
import 'package:locator/app/injection.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
  as bg;
@pragma('vm:entry-point')
void backgroundGeolocationHeadlessTask(bg.HeadlessEvent headlessEvent) async {
  print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@📬 --> $headlessEvent');

  switch (headlessEvent.name){
    case bg.Event.HEARTBEAT:
    // DISABLED getCurrentPosition on heartbeat
      try {
        bg.Location location = await bg.BackgroundGeolocation.getCurrentPosition(samples: 1);
        print('[getCurrentPosition] Headless: $location');
      } catch (error) {
        print('[getCurrentPosition] Headless ERROR: $error');
      }
      //*/
      break;
  }
}



void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  print('@@@@@@@@@MAIN@@@@@@@@');
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Lokalizator());
  bg.BackgroundGeolocation.registerHeadlessTask(
      backgroundGeolocationHeadlessTask);
}


