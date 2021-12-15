import 'package:cash_collector/pages/connexion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_sdk/core.dart';

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
  //init Here SDK context
  SdkContext.init(IsolateOrigin.main);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cash Collector',
      home: Scaffold(
        body: Connexion(),
      ),
    );
  }
}
