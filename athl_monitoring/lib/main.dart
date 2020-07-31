import 'package:athl_monitoring/pages/wrapper.dart';
import 'package:athl_monitoring/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:athl_monitoring/util/const_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: ConstColors.ccMagnolia
      ),
      home: Wrapper(authService: AuthService(),),
    );
  }
}

