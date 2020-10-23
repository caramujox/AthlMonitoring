import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class volleyballGame extends StatefulWidget {
  volleyballGame({Key key}) : super(key: key);

  @override
  _volleyballGameState createState() => _volleyballGameState();
}

class _volleyballGameState extends State<volleyballGame> {
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
      child: ListView(
        padding: EdgeInsets.only(top: 25.0),
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
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
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
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
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
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
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
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
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
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
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
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
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
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
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
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
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
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
}
