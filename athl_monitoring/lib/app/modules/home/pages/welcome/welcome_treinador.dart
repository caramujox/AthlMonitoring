import 'package:athl_monitoring/app/modules/home/controllers/user_controller.dart';
import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
                  backgroundColor: Colors.yellow,
                  radius: 65,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60.0,
                    backgroundImage: user.urlPhoto == null
                        ? AssetImage("assets/images/account_circle_white.png")
                        : NetworkImage(user.urlPhoto),
                  ),
                ),
                padding: EdgeInsets.all(1.5),
              ),
            ),
            decoration: BoxDecoration(
              color: ConstColors.ccBlueVioletWheel,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: ConstColors.ccBlueVioletWheel,
            ),
            title: Text(
              'Configurações da conta',
              style: TextStyle(
                  color: ConstColors.ccBlueVioletWheel,
                  fontStyle: FontStyle.italic,
                  fontSize: 20),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: ConstColors.ccBlueVioletWheel),
            title: Text(
              user.nome == null ? "Visitante" : user.nome,
              style: TextStyle(
                  color: ConstColors.ccBlueVioletWheel,
                  fontStyle: FontStyle.italic,
                  fontSize: 20),
            ),
            onTap: () {},
          ),
          Divider(
            color: Colors.grey,
            height: 15,
            thickness: 1.5,
            indent: 20,
            endIndent: 20,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                  leading: Icon(
                    Icons.live_help,
                    color: ConstColors.ccBlueVioletWheel,
                  ),
                  title: Text(
                    'Sobre nós',
                    style: TextStyle(
                        color: ConstColors.ccBlueVioletWheel,
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  ),
                  onTap: () {
                    controller.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/authpage', (route) => false);
                  }),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: ConstColors.ccBlueVioletWheel,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: ConstColors.ccBlueVioletWheel,
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  ),
                  onTap: () {
                    controller.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/authpage', (route) => false);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  _welcomeBodyTreinador() {
    UserModel user = controller.userModel.result;
    return Container(
      //padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          //"app bar"
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: ConstColors.ccBlueVioletWheel,
                      child: CircleAvatar(
                        backgroundImage: user.urlPhoto == null
                            ? AssetImage(
                                "assets/images/account_circle_white.png")
                            : NetworkImage(user.urlPhoto),
                        radius: 23,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 13.0, top: 45.0, bottom: 10.0),
                    child: AutoSizeText(
                      'Bem vindo, treinador!',
                      maxLines: 1,
                      style: TextStyle(
                          color: Color(0xff230a42),
                          fontFamily: 'Google',
                          fontWeight: FontWeight.bold,
                          fontSize: 64),
                    ),
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
          Container(
            child: Padding(
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
          ),
          //SizedBox(height: 20),
          Container(
            child: Padding(
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
          ),
          SizedBox(height: 20),
          Container(
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _botaoComFoto("assets/images/atleta4.png", "ATLETAS",
                      "/atletas", Icons.person),
                  _botaoComFoto("assets/images/equipe.png", "EQUIPES",
                      "/equipes", Icons.people),
                ],
              ),
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }

  _botaoComFoto(String assetPath, btnText, route, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                  // color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(assetPath), fit: BoxFit.cover),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topRight,
                        end: FractionalOffset.bottomLeft,
                        colors: [
                          Colors.white.withOpacity(0.35),
                          Colors.white,
                        ],
                        stops: [
                          0.0,
                          1.0
                        ])),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: Icon(
                        icon,
                        size: 50,
                        color: ConstColors.ccBlueVioletWheel,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        btnText,
                        style: TextStyle(
                            color: ConstColors.ccBlueVioletWheel,
                            fontFamily: 'Google',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
