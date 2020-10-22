import 'package:athl_monitoring/app/modules/home/controllers/user_controller.dart';
import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePageTreinador extends StatefulWidget {
  WelcomePageTreinador({Key key}) : super(key: key);

  @override
  _WelcomePageTreinadorState createState() => _WelcomePageTreinadorState();
}

class _WelcomePageTreinadorState
    extends ModularState<WelcomePageTreinador, UserController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return _constroiWelcomeTreinador();
  }

  _constroiWelcomeTreinador() {
    return Scaffold(
      key: _scaffoldKey,
      body: _welcomeBodyTreinador(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.signOut();
          // Navigator.pushNamedAndRemoveUntil(
          //     context, '/authpage', (route) => false);
          _scaffoldKey.currentState.openDrawer();
        },
        backgroundColor: Colors.blue,
      ),
      drawer: _welcomeTreinadorDrawer(),
    );
  }

  _welcomeTreinadorDrawer() {
    UserModel user = controller.userModel.result;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 60.0,
                  backgroundImage: user.urlPhoto == null
                      ? AssetImage("assets/images/account_circle_grey.png")
                      : NetworkImage(user.urlPhoto),
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.white),
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(1.5),
              ),
            ),
            decoration: BoxDecoration(
              color: ConstColors.ccBlueVioletWheel,
            ),
          ),
          ListTile(
            title: Text(
              'Configurações da conta',
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              user.nome == null ? "Visitante" : user.nome,
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            onTap: () {},
          ),
          ListTile(
              title: Text('Logout',
                  style: TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic)),
              onTap: () {
                controller.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/authpage', (route) => false);
              }),
          Divider(
            color: Colors.grey,
            height: 15,
            thickness: 1.5,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
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
            indent: 20,
            endIndent: 20,
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
                color: Colors.white,
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
                color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }
}
