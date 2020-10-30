import 'dart:ffi';

import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:flutter/material.dart';

class WelcomePageAtleta extends StatefulWidget {
  WelcomePageAtleta({Key key}) : super(key: key);

  @override
  _WelcomePageAtletaState createState() => _WelcomePageAtletaState();
}

class _WelcomePageAtletaState extends State<WelcomePageAtleta> {
  @override
  Widget build(BuildContext context) {
    return  _constroiWelcomeAtleta();
      }
    
  _constroiWelcomeAtleta() {
    return Scaffold(
      //key: _scaffoldKey,
      //appBar: _welcomeAppBar(),
      body: _welcomeBodyAtleta(),
      floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  _welcomeBodyAtleta() {
    return Container(
      //padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, top: 45.0),
                  child: Text('Bem vindo, atleta!',
                  style: TextStyle(
                    color: Color(0xff230a42),
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 32
                  ),),
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
          Padding(
            padding: const EdgeInsets.only(left:30.0, right: 30.0),
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
                        onPressed: (){},
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
                              Text('EU',
                                style: TextStyle(
                                color: ConstColors.ccBlueVioletWheel,
                                fontFamily: 'Google',
                                fontWeight: FontWeight.bold,
                                fontSize: 12),)
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
                          onPressed:() {},
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
                              Text('MINHAS EQUIPES',
                                style: TextStyle(
                                color: ConstColors.ccBlueVioletWheel,
                                fontFamily: 'Google',
                                fontWeight: FontWeight.bold,
                                fontSize: 12),)
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