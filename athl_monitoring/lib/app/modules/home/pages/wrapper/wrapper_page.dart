import 'package:athl_monitoring/app/modules/home/controllers/user_controller.dart';
import 'package:athl_monitoring/app/modules/home/pages/authpage/authpage_page.dart';
import 'package:athl_monitoring/app/modules/home/pages/welcome/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum AuthStatus { NOT_DETERMINED, NOT_LOGGED_IN, LOGGED_IN }

class WrapperPage extends StatefulWidget {
  final String title;
  const WrapperPage({Key key, this.title = "Wrapper"}) : super(key: key);

  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends ModularState<WrapperPage, UserController> {
  //use 'controller' variable to access controller
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  FirebaseUser _user;

  @override
  void initState() {
    super.initState();
    controller.getUser().then((user) {
      setState(() {
        if (user != null) {
          _user = user;
          authStatus = AuthStatus.LOGGED_IN;
        } else {
          authStatus = AuthStatus.NOT_LOGGED_IN;
        }
        // authStatus =
        //     _user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
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
        return AuthpagePage();
        break;
      case AuthStatus.LOGGED_IN:
        return WelcomeScreen();
        break;
      default:
        return buildWaitingScreen();
    }
  }

  void loginCallBack() {
    controller.getUser().then((user) {
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
    ));
  }
}
