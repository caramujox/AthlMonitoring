import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'wrapper_controller.dart';

class WrapperPage extends StatefulWidget {
  final String title;
  const WrapperPage({Key key, this.title = "Wrapper"}) : super(key: key);

  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends ModularState<WrapperPage, WrapperController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
