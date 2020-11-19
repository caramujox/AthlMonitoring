import 'package:athl_monitoring/app/modules/home/controllers/treino_controller.dart';
import 'package:athl_monitoring/app/modules/home/models/treino_model.dart';
import 'package:athl_monitoring/app/modules/home/services/auth_service.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:athl_monitoring/app/modules/home/widgets/form_padrao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterTreino extends StatefulWidget {
  RegisterTreino({this.authService, this.loginCallBack});

  final AuthService authService;
  final VoidCallback loginCallBack;

  @override
  _RegisterTreinoState createState() => _RegisterTreinoState();
}

class _RegisterTreinoState
    extends ModularState<RegisterTreino, TreinoController> {
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController duracaoController = TextEditingController();

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          TreinoModel model = new TreinoModel(
            descricao: descricaoController.text,
            nome: nomeController.text,
            duracao: ('oi'),
            codEquipe: ('oi'),
            data: DateTime.now(),
          );
          controller.save(model);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Registrar',
          style: TextStyle(
            color: Color(0xFF673AB7),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

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
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Novo Treino',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      FormPadrao(
                        formTitle: "Nome do treino",
                        formHint: "Digite o nome do treino",
                        formIcon: Icons.directions_run,
                        formEditingController: nomeController,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FormPadrao(
                        formTitle: "Duração",
                        formHint: "Digite a duração do treino",
                        formIcon: Icons.timer,
                        formEditingController: duracaoController,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FormPadrao(
                        formTitle: "Descrição",
                        formHint: "Descreva o treino a ser realizado",
                        formIcon: Icons.textsms,
                        formEditingController: descricaoController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
}
