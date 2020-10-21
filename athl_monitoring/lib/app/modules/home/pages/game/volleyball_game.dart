import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
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
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    color: Colors.blue.shade400,
                    child: Text("Ponto de Saque",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    color: Colors.red.shade400,
                    child: Text("Erro de Saque",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
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
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    color: Colors.blue.shade400,
                    child: Text("Ponto de Ataque",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    color: Colors.red.shade400,
                    child: Text("Ataque Bloqueado",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
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
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    color: Colors.blue.shade400,
                    child: Text("Ponto de Bloqueio",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    color: Colors.red.shade400,
                    child: Text("Erro de Ataque",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
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
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    color: Colors.blue.shade400,
                    child: Text("Erro do Oponente",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        )),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    color: Colors.red.shade400,
                    child: Text("Erro Genérico",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 15.0,
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
                  padding: EdgeInsets.all(15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    padding: EdgeInsets.only(top: 45.0, bottom: 45.0),
                    color: Colors.red.shade400,
                    child: Text("Ponto do Oponente",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
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
