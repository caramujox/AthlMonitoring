import 'dart:io';

import 'package:athl_monitoring/app/modules/home/controllers/equipe_controller.dart';
import 'package:athl_monitoring/app/modules/home/controllers/user_controller.dart';
import 'package:athl_monitoring/app/modules/home/widgets/form_padrao.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterEquipeForm extends StatefulWidget {
  @override
  _RegisterEquipeFormState createState() => _RegisterEquipeFormState();
}

class _RegisterEquipeFormState extends ModularState<RegisterEquipeForm, UserController> {
  final TextEditingController nomeEquipeController = TextEditingController();
  final TextEditingController codEquipeController = TextEditingController();
  final TextEditingController modalidadeController = TextEditingController();
  File _image;
  String _uploadedFileUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFddd0f5),
                      Color(0xFFd8c9f2),
                      Color(0xFFbeaae3),
                      Color(0xFFB39DDB),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Adicione a equipe',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      //ImageBox
                      Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.5, color: Colors.white),
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 60.0,
                              backgroundImage: AssetImage(
                                  "assets/images/account_circle_grey.png"),
                            ),
                          ),
                          onTap: (){
                            
                          },
                        ),
                      ),
                      //Email
                      FormPadrao(
                        formTitle: "Nome da equipe",
                        formHint: "Digite o nome da equipe",
                        formIcon: Icons.email,
                        formEditingController: nomeEquipeController,
                      ),
                      SizedBox(height: 10.0),
                      //CodEquipe
                      FormPadrao(
                        formEditingController: codEquipeController,
                        formIcon: Icons.people,
                        formHint: "Digite o código da Equipe",
                        formTitle: "Código da Equipe",
                      ),
                      SizedBox(height: 10.0),
                      //Numero
                      FormPadrao(
                        formEditingController: modalidadeController,
                        formIcon: Icons.assignment_ind,
                        formHint: "Exemplo: Volêi, Futsal, etc",
                        formTitle: "Modalidade",
                      ),
                      SizedBox(height: 10.0),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[],
                      ),
                      // _buildRegisterBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildRegisterBtn() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 25.0),
  //     width: double.infinity,
  //     child: Observer(builder: (_) {
  //       return RaisedButton(
  //         onPressed: () async {
  //           FirebaseUser fbUser = await controller.getUser();
  //           print(controller.getUserInfo());
  //           Navigator.pop(context);
  //         },
  //         elevation: 5.0,
  //         padding: EdgeInsets.all(15.0),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(30.0),
  //         ),
  //         color: Colors.white,
  //         child: Text(
  //           'Adicionar',
  //           style: TextStyle(
  //             color: Color(0xFF673AB7),
  //             letterSpacing: 1.5,
  //             fontSize: 18.0,
  //             fontWeight: FontWeight.bold,
  //             fontFamily: 'OpenSans',
  //           ),
  //         ),
  //       );
  //     }),
  //   );
  // }
}