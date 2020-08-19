import 'package:athl_monitoring/app/modules/home/controllers/user_controller.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthpagePage extends StatefulWidget {
  final String title;

  const AuthpagePage({Key key, this.title = "Authpage"}) : super(key: key);

  @override
  _AuthpagePageState createState() => _AuthpagePageState();
}

class _AuthpagePageState extends ModularState<AuthpagePage, UserController> {
  //use 'controller' variable to access controller
  bool _visible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _construirAuthBody();
  }

  Widget _construirAuthBody() {
    return Scaffold(
      body: _showForm(),
    );
  }

  _showForm() {
    return SizedBox.expand(
        child: Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _showLogo(),
            _showInputOption(),
            _showEmailButton(),
            _showGoogleAuthBtn(),
            _showFacebookAuthBtn(),
            _showRegisterButton(),
          ],
        ),
      ),
    ));
  }

  _showLogo() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 70.0, 0, 0),
      child: Image.asset('assets/images/account_circle_grey.png',
          height: 250, width: 250),
    );
  }

  _showInputOption() {
    return Column(
      children: <Widget>[
        _showEmailInput(),
        _showPasswordInput(),
        _showConfirmButtons()
      ],
    );
  }

  _showEmailInput() {
    return Offstage(
      offstage: !_visible,
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
          child: new TextFormField(
            maxLines: 1,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            cursorColor: ConstColors.ccBlueVioletWheel,
            decoration: new InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                    color: ConstColors.ccBlueVioletWheel,
                    fontStyle: FontStyle.italic),
                icon: new Icon(
                  Icons.mail,
                  color: ConstColors.ccBlueVioletWheel,
                )),
            validator: (value) =>
                value.isEmpty ? 'Email can\'t be empty' : null,
          ),
        ),
      ),
    );
  }

  _showPasswordInput() {
    return Offstage(
      offstage: !_visible,
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: new TextFormField(
            controller: _pwdController,
            maxLines: 1,
            obscureText: true,
            autofocus: false,
            cursorColor: ConstColors.ccBlueVioletWheel,
            decoration: new InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: ConstColors.ccBlueVioletWheel,
                    fontStyle: FontStyle.italic),
                icon: new Icon(
                  Icons.lock,
                  color: ConstColors.ccBlueVioletWheel,
                )),
            validator: (value) =>
                value.isEmpty ? 'Password can\'t be empty' : null,
          ),
        ),
      ),
    );
  }

  _showConfirmButtons() {
    return Offstage(
      offstage: !_visible,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: OutlineButton(
                splashColor: Colors.grey,
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    _visible = !_visible;
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                highlightElevation: 0,
                borderSide: BorderSide(color: ConstColors.ccBlueVioletWheel),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                            fontSize: 18,
                            color: ConstColors.ccBlueVioletWheel,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: OutlineButton(
                splashColor: Colors.grey,
                onPressed: () {
                  controller
                      .signIn(_emailController.text.toString(),
                          _pwdController.text.toString())
                      .then((userResp) {
                    Navigator.of(context).pushNamed('/');
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                highlightElevation: 0,
                borderSide: BorderSide(color: ConstColors.ccBlueVioletWheel),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 20,
                            color: ConstColors.ccBlueVioletWheel,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showEmailButton() {
    return Offstage(
      offstage: _visible,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
        child: OutlineButton(
          splashColor: Colors.grey,
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            setState(() {
              _visible = !_visible;
            });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          highlightElevation: 0,
          borderSide: BorderSide(color: ConstColors.ccBlueVioletWheel),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.mail,
                  color: ConstColors.ccBlueVioletWheel,
                  size: 32.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Entrar com meu E-mail',
                    style: TextStyle(
                      fontSize: 20,
                      color: ConstColors.ccBlueVioletWheel,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showRegisterButton() {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: FlatButton(
            child: Text('Não tem uma conta? Cadastre-se!',
                style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: ConstColors.ccBlueVioletWheel)),
            onPressed: () {
              Navigator.of(context).pushNamed('/register');
            }));
  }

  _showGoogleAuthBtn() {
    return Offstage(
      offstage: _visible,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
        child: OutlineButton(
          splashColor: Colors.grey,
          onPressed: () {
            controller.signInGoogle().then((retUser) {
              Navigator.of(context).pushNamed('/atletas');
            });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          highlightElevation: 0,
          borderSide: BorderSide(color: ConstColors.ccBlueVioletWheel),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 18, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage('assets/images/google_logo.png'),
                    height: 35.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Entrar com o Google',
                    style: TextStyle(
                      fontSize: 20,
                      color: ConstColors.ccBlueVioletWheel,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showFacebookAuthBtn() {
    return Offstage(
      offstage: _visible,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
        child: OutlineButton(
          splashColor: Colors.grey,
          onPressed: () {
            // widget.authService.singInFacebook().then((retUser) {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //     return HomeScreen(
            //       authService: new AuthService(),
            //       user: retUser,
            //     );
            //   }));
            // });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          highlightElevation: 0,
          borderSide: BorderSide(color: ConstColors.ccBlueVioletWheel),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage('assets/images/facebook_logo.png'),
                    height: 35.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Entrar com o Facebook',
                    style: TextStyle(
                      fontSize: 20,
                      color: ConstColors.ccBlueVioletWheel,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
