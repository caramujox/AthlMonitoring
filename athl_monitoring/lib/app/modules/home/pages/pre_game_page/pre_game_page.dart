import 'package:athl_monitoring/app/modules/home/controllers/equipe_controller.dart';
import 'package:athl_monitoring/app/modules/home/models/equipe_model.dart';
import 'package:athl_monitoring/app/modules/home/models/game_model.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:athl_monitoring/app/modules/home/widgets/form_padrao.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PreGamePagePage extends StatefulWidget {
  final String title;
  const PreGamePagePage({Key key, this.title = "PreGamePage"})
      : super(key: key);

  @override
  _PreGamePagePageState createState() => _PreGamePagePageState();
}

class _PreGamePagePageState
    extends ModularState<PreGamePagePage, EquipeController> {
  //use 'controller' variable to access controller
  EquipeModel selectedType;
  final TextEditingController equipeAdvController = TextEditingController();
  final TextEditingController campeonatoController = TextEditingController();

  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  List<bool> _selecionado = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKeyValue,
      autovalidate: true,
      child: new ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, top: 45.0),
                  child: Text(
                    'Nova sessão',
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
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(builder: (_) {
                if (controller.equipeList.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.equipeList.hasError) {
                  return Center(
                      child: RaisedButton(
                    onPressed: controller.getList,
                    child: Text('Error'),
                  ));
                } else {
                  List<EquipeModel> list = controller.equipeList.data;
                  return FutureBuilder(builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return DropdownButton(
                        onChanged: (equipeSelecionada) {
                          print('$equipeSelecionada');
                          setState(() {
                            selectedType = equipeSelecionada;
                          });
                        },
                        value: selectedType,
                        isExpanded: false,
                        hint: Text(
                          'Selecione a equipe',
                          style:
                              TextStyle(color: ConstColors.ccBlueVioletWheel),
                        ),
                        items: list
                            .map(
                              (e) => DropdownMenuItem(
                                child: AutoSizeText(
                                  e.nome,
                                  style: TextStyle(
                                      color: ConstColors.ccBlueVioletWheel),
                                ),
                                value: e,
                              ),
                            )
                            .toList());
                  });
                }
              }),
            ],
          ),
          FormPadrao(
            formTitle: "Equipe Adversária",
            formHint: "Insira o nome da Equipe adversária...",
            formIcon: Icons.people,
            formEditingController: equipeAdvController,
          ),
          FormPadrao(
            formTitle: "Campeonato",
            formHint: "Insira o nome da competição...",
            formIcon: Icons.equalizer,
            formEditingController: campeonatoController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 120.0),
              ToggleButtons(
                selectedColor: Colors.white,
                borderRadius: BorderRadius.circular(5),
                fillColor: ConstColors.ccBlueVioletWheel,
                children: <Widget>[
                  Text("P1"),
                  Text("P2"),
                  Text("P3"),
                  Text("P4"),
                  Text("P5"),
                  Text("P6")
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < _selecionado.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        _selecionado[buttonIndex] = true;
                      } else {
                        _selecionado[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: _selecionado,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              RaisedButton(
                  color: ConstColors.ccBlueVioletWheel,
                  textColor: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("INICIAR PARTIDA",
                              style: TextStyle(fontSize: 24.0)),
                        ],
                      )),
                  onPressed: () {
                    GameModel x = new GameModel(
                        equipeId: selectedType.codEquipe,
                        equipeAdv: equipeAdvController.text,
                        nomeCompeticao: campeonatoController.text,
                        dataGame: DateTime.now());
                    controller.startGame(x);
                    Navigator.of(context)
                        .pushNamed('/volleyballGame', arguments: x);
                    // Modular.to.pushNamed('volleyballGame',
                    // arguments: {'gameModel': x});
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
            ],
          ),
        ],
      ),
    ));
  }
}
