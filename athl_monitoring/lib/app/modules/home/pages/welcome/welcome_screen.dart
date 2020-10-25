import 'dart:async';
import 'package:athl_monitoring/app/modules/home/controllers/user_controller.dart';
import 'package:athl_monitoring/app/modules/home/pages/welcome/welcome_treinador.dart';
import 'package:athl_monitoring/app/modules/home/util/items.dart';
import 'package:athl_monitoring/app/modules/home/widgets/slide_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ModularState<WelcomeScreen, UserController> {
  List<Widget> slides = items
      .map((item) => SlideItem(
          description: item['description'],
          image: item['image'],
          header: item['header']))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Color(0XFF4A148C)
                    : Color(0XFF4A148C).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));
  double currentPage = 0.0;
  final _pageViewController = new PageController();

  //Verifica se o usuário já visualizou a welcome_screen
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 0), () {
      checkFirstSeen();
    });
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool _seen = (prefs.getBool('seen') ?? false);

    bool _seen = false; //SE QUISER TESTAR SEM O ONE TIME INTRO

    if (_seen) {
      //Se tiver na lista de atletas -> WelcomePageAtletas
      //Else -> WelcomePageTreinador
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (context) => new WelcomePageTreinador()));
    } else {
      prefs.setBool('seen', true);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.signOut();
        print('vazari');
        Navigator.of(context).pushNamed('/authpage');
      }),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  setState(() {
                    currentPage = _pageViewController.page;
                  });
                });
                //return slides[index];
                List<Widget> slides = items
                    .map((item) => SlideItem(
                        description: item['description'],
                        image: item['image'],
                        header: item['header'],
                        index: index))
                    .toList();
                return slides[index];
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 70.0),
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicator(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
