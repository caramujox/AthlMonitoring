import 'package:athl_monitoring/app/modules/home/pages/atletas_page.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:flutter/material.dart';

class WelcomePageTreinador extends StatefulWidget {
  WelcomePageTreinador({Key key}) : super(key: key);

  @override
  _WelcomePageTreinadorState createState() => _WelcomePageTreinadorState();
}

class _WelcomePageTreinadorState extends State<WelcomePageTreinador> {
  @override
  Widget build(BuildContext context) {
    return _constroiWelcomeTreinador();
  }

  _constroiWelcomeTreinador() {
    return Scaffold(
      body: _welcomeBodyTreinador(),
    );
  }

  _welcomeBodyTreinador() {
    return Container(
      //padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          //status
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          //"app bar"
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, top: 45.0),
                  child: Text(
                    'Bem vindo, treinador!',
                    style: TextStyle(
                        color: Color(0xff230a42),
                        fontFamily: 'Google',
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                )
              ],
            ),
            height: 90,
            //color: Colors.red,
          ),
          const Divider(
            color: Color(0xFFb6a5c4),
            height: 20,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(height: 40),
          //botões
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/pregame');
                },
                elevation: 5.0,
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'NOVA PARTIDA',
                  style: TextStyle(
                      color: ConstColors.ccBlueVioletWheel,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                color: ConstColors.ccMagnolia,
              ),
            ),
          ),
          //SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                elevation: 5.0,
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'NOVO TREINO',
                  style: TextStyle(
                      color: ConstColors.ccBlueVioletWheel,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                color: ConstColors.ccMagnolia,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/atletas');
                        },
                        elevation: 5.0,
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              size: 50,
                              color: ConstColors.ccBlueVioletWheel,
                            ),
                            Text(
                              'ATLETAS',
                              style: TextStyle(
                                  color: ConstColors.ccBlueVioletWheel,
                                  fontFamily: 'Google',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        color: ConstColors.ccMagnolia,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/equipes');
                        },
                        elevation: 5.0,
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.people,
                              size: 50,
                              color: ConstColors.ccBlueVioletWheel,
                            ),
                            Text(
                              'EQUIPES',
                              style: TextStyle(
                                  color: ConstColors.ccBlueVioletWheel,
                                  fontFamily: 'Google',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        color: ConstColors.ccMagnolia,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      color: ConstColors.ccMagnolia,
    );
  }
}
