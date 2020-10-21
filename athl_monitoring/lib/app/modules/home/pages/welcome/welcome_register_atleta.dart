import 'dart:io';

import 'package:athl_monitoring/app/modules/home/controllers/atleta_controller.dart';
import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/util/const_utils.dart';
import 'package:athl_monitoring/app/modules/home/widgets/form_padrao.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class welcomeRegisterAtleta extends StatefulWidget {
  @override
  _welcomeRegisterAtletaState createState() => _welcomeRegisterAtletaState();
}

class _welcomeRegisterAtletaState
    extends ModularState<welcomeRegisterAtleta, AtletaController> {
  final TextEditingController emailAtletaController = TextEditingController();
  final TextEditingController codEquipeController = TextEditingController();
  final TextEditingController numeroAtletaController = TextEditingController();
  final TextEditingController nomeAtletaController = TextEditingController();
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
                      Color(0xFFB39DDB),
                      Color(0xFF9575CD),
                      Color(0xFF7E57C2),
                      Color(0xFF673AB7),
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
                    vertical: 40.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        'Suas informações',
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
                              radius: 70.0,
                              backgroundImage: _image != null
                                  ? FileImage(
                                      File(
                                        _image.path,
                                      ),
                                    )
                                  : AssetImage(
                                      "assets/images/account_circle_white.png",
                                    ),
                            ),
                          ),
                          onTap: () async {
                            var pickimage =
                                await controller.pickImage(ImageSource.gallery);
                            setState(() {
                              _image = File(pickimage.path);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //Email
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
                        formEditingController: numeroAtletaController,
                        formIcon: Icons.assignment_ind,
                        formHint: "Digite o seu número",
                        formTitle: "Número do Atleta",
                      ),
                      SizedBox(height: 10.0),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[],
                      ),
                      _buildRegisterBtn(),
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

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: Observer(builder: (_) {
        return RaisedButton(
          onPressed: () async {
            await controller
                .uploadPicture(
                    '${codEquipeController.text}/${nomeAtletaController.text + numeroAtletaController.text}.png',
                    File(_image.path))
                .onComplete;
            AtletaModel model = AtletaModel(
                email: emailAtletaController.text,
                nome: nomeAtletaController.text,
                number: int.parse(numeroAtletaController.text),
                urlPhoto:
                    '${codEquipeController.text}/${nomeAtletaController.text + numeroAtletaController.text}.png');
            controller.save(model);
            Navigator.of(context).pop();
          },
          elevation: 5.0,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Text(
            'Adicionar',
            style: TextStyle(
              color: Color(0xFF673AB7),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        );
      }),
    );
  }
}
