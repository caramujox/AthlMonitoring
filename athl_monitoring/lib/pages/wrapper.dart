import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:athl_monitoring/services/auth_service.dart';
import 'package:athl_monitoring/pages/auth_page.dart';
import 'package:athl_monitoring/pages/home_page.dart';

enum AuthStatus { NOT_DETERMINED, NOT_LOGGED_IN, LOGGED_IN }

class Wrapper extends StatefulWidget {
  Wrapper({this.authService});

  final AuthService authService;

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  FirebaseUser _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.authService.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _user = user;
        }
        authStatus =
        user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return AuthPage(
          authService: widget.authService,
          loginCallBack: loginCallBack,
        );
        break;
      case AuthStatus.LOGGED_IN:
//        return HomePage(
//          logoutCallBack: logoutCallback,
//          authService: widget.authService,
//          user: _user,
//        )
//        ;
      return MyHomePage();
        break;
      default:
        return buildWaitingScreen();
    }
  }

  void loginCallBack() {
    widget.authService.getCurrentUser().then((user) {
      setState(() {
        _user = user;
      });
    });

    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _user = null;
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        )
    );
  }
}

