import 'package:athl_monitoring/pages/auth_page.dart';
import 'package:athl_monitoring/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:athl_monitoring/util/placeholder_widget.dart';
import 'package:athl_monitoring/util/const_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.authService, this.user, this.logoutCallBack});

  final AuthService authService;
  final VoidCallback logoutCallBack;
  final FirebaseUser user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.yellow),

  ];

  bool _visible = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  _construirHome() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _homeAppBar(),
      body: _homeBody(),
      bottomNavigationBar: _homeBottomNavigationBar(),
      drawer: _homeDrawer(),
    );
  }

  _homeAppBar() {
    return AppBar(
      title: Text(
        "Alojas Mauá",
        style: GoogleFonts.permanentMarker(
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      leading: Container(
        padding: EdgeInsets.all(1.5),
        child: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            backgroundImage: widget.user.photoUrl == null
                ? AssetImage("assets/images/account_circle_grey.png")
                : NetworkImage(widget.user.photoUrl),
          ),
          iconSize: 32,
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
    );
  }

  _homeBody() {
    return _children[_currentIndex];
  }

  _homeBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: ConstColors.ccBlueVioletWheel,
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(fontFamily: 'Adumu'),
//          style: GoogleFonts.permanentMarker(),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_bus),
          title: Text(
            'Ônibus',
            style: TextStyle(fontFamily: 'Adumu'),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          title: Text(
            'Jogos',
            style: TextStyle(fontFamily: 'Adumu'),
          ),
        ),
      ],
    );
  }

  _homeDrawer() {
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
                  backgroundImage: widget.user.photoUrl == null
                      ? AssetImage("assets/images/account_circle_grey.png")
                      : NetworkImage(widget.user.photoUrl),
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
              widget.user.displayName == null
                  ? "Visitante"
                  : widget.user.displayName,
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Logout',
                style:
                TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
            onTap: () {
              widget.authService.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(pageBuilder: (BuildContext context,
                      Animation animation, Animation secondaryAnimation) {
                    return AuthPage(
                      authService: new AuthService(),
                    );
                  }, transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return new SlideTransition(
                      position: new Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  }),
                      (Route route) => false);
            },
          ),
          Divider(
            color: Colors.grey,
            height: 15,
            thickness: 1.5,
            indent: 20,
            endIndent: 20,
          ),
          Offstage(
            offstage: _visible,
            child: ListTile(
              title: Text('Cadastrar Roteiro de Onibus',
                  style: TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic)),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return null;
                }));
              },
            ),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
//    widget.authService.getCurrentUser().then((userResp) {
//      Firestore.instance
//          .collection("users")
//          .document(userResp.uid)
//          .get()
//          .then((doc) {
//        if (doc['adm']) {
//          setState(() {
//            _visible = !_visible;
//          });
//        } else
//          return;
//      });
//    });
  }
}
