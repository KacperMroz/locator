import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:locator/app/app.dart';
import 'package:locator/app/injection.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Lokalizator());
}


