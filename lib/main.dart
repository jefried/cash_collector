import 'package:cash_collector/pages/connexion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // make the top app transparent
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        //color set to transperent or set your own color
        statusBarIconBrightness: Brightness.dark,
        //set brightness for icons, like dark background light icons
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cash Collector',
      home: Scaffold(
        body: Connexion(),
      ),
    );
  }
}
