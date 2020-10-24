import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class volleyballGame extends StatefulWidget {
  volleyballGame({Key key}) : super(key: key);

  @override
  _volleyballGameState createState() => _volleyballGameState();
}

class _volleyballGameState extends State<volleyballGame> {
  int _pontoPro = 0;
  int _pontoCon = 0;
  @override
  Widget build(BuildContext context) {
    return _constroiVolleyGame();
  }

  _constroiVolleyGame() {
    return Scaffold(
      //key: _scaffoldKey,
      //appBar: _welcomeAppBar(),
      body: _volleyGame(),
    );
  }

  _volleyGame() {
    return Container(
      color: ConstColors.ccMagnolia,
      child: ListView(
        padding: EdgeInsets.only(top: 25.0),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
            child: (Container(
              color: ConstColors.ccMagnolia,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      'Vôlei Mauá',
                      maxLines: 1,
                      style: TextStyle(
                          color: ConstColors.ccBlueVioletWheel,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      'NDU',
                      maxLines: 1,
                      style: TextStyle(
                          color: ConstColors.ccBlueVioletWheel,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      _currentDate(),
                      maxLines: 1,
                      style: TextStyle(
                          color: ConstColors.ccBlueVioletWheel,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
            child: Container(
              color: ConstColors.ccMagnolia,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    _pontoPro.toString(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ConstColors.ccBlueVioletWheel,
                      letterSpacing: 1.5,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 5,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ConstColors.ccBlueVioletWheel, width: 1.0),
                      ),
                      child: Flexible(
                        child: Center(
                          child: AutoSizeText(
                            '1o Set',
                            maxLines: 1,
                            style: TextStyle(
                              color: ConstColors.ccBlueVioletWheel,
                              letterSpacing: 1.5,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AutoSizeText(
                    _pontoCon.toString(),
                    maxLines: 1,
                    style: TextStyle(
                      color: ConstColors.ccBlueVioletWheel,
                      letterSpacing: 1.5,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: ConstColors.ccMagnolia,
            child: const Divider(
              color: Color(0xFFb6a5c4),
              height: 20,
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: ConstColors.ccMagnolia,
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.32)),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 35.0, left: 5.0, right: 5.0),
                    color: ConstColors.ccBlueVioletWheel,
                    child: AutoSizeText("Ponto de Saque",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {
                      _incrementProPoint();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.32)),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 35.0, left: 5.0, right: 5.0),
                    color: Colors.yellow.shade600,
                    child: AutoSizeText("Erro de Saque",
                        maxLines: 1,
                        style: TextStyle(
                          color: ConstColors.ccBlueVioletWheel,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {
                      _incrementConPoint();
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.32)),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 35.0, left: 5.0, right: 5.0),
                    color: ConstColors.ccBlueVioletWheel,
                    child: AutoSizeText("Ponto de Ataque",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.32)),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 35.0, left: 5.0, right: 5.0),
                    color: Colors.yellow.shade600,
                    child: AutoSizeText("Ataque Bloqueado",
                        maxLines: 1,
                        style: TextStyle(
                          color: ConstColors.ccBlueVioletWheel,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.32)),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 35.0, left: 5.0, right: 5.0),
                    color: ConstColors.ccBlueVioletWheel,
                    child: AutoSizeText("Ponto de Bloqueio",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.32)),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 35.0, left: 5.0, right: 5.0),
                    color: Colors.yellow.shade600,
                    child: AutoSizeText("Erro de Ataque",
                        maxLines: 1,
                        style: TextStyle(
                          color: ConstColors.ccBlueVioletWheel,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.32)),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 35.0, left: 5.0, right: 5.0),
                    color: ConstColors.ccBlueVioletWheel,
                    child: AutoSizeText("Erro do Oponente",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.32)),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 35.0, left: 5.0, right: 5.0),
                    color: Colors.yellow.shade600,
                    child: AutoSizeText("Erro Genérico",
                        maxLines: 1,
                        style: TextStyle(
                          color: ConstColors.ccBlueVioletWheel,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.32)),
                    elevation: 5.0,
                    padding: EdgeInsets.only(
                        top: 30.0, bottom: 35.0, left: 5.0, right: 5.0),
                    color: Colors.yellow.shade600,
                    child: AutoSizeText("Ponto do Oponente",
                        maxLines: 1,
                        style: TextStyle(
                          color: ConstColors.ccBlueVioletWheel,
                          letterSpacing: 1.5,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _incrementProPoint() {
    setState(() {
      _pontoPro++;
    });
  }

  String _currentDate() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formatted = formatter.format(now);
    return formatted;
  }

  void _incrementConPoint() {
    setState(() {
      _pontoCon++;
    });
  }
}
