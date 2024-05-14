import 'dart:io';

import 'package:afrimart/views/screens/auth_screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyAT0A7_zT1eF8M4365wIhotIk3_VUh726s',
              appId: '1:742281548865:android:fecc56687b8b4f2e4462c0',
              messagingSenderId: '742281548865',
              projectId: "afrimart-5cbd7",
              storageBucket: 'gs://afrimart-5cbd7.appspot.com'),
        )
      : await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
