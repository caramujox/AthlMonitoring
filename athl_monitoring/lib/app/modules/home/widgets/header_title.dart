import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  final String titulo;
  const TitlePage({Key key, this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
        ),
        SizedBox(height: 40),
        //"app bar"
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 7.0, top: 45.0),
                child: Text(
                  titulo == null ? "" : titulo,
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
        
      ],
    );
  }
}
