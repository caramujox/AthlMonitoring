import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreGamePage extends StatefulWidget {
  @override
  _PreGamePageState createState() => _PreGamePageState();
}

class _PreGamePageState extends State<PreGamePage> {
  var selectedCurrency, selectedType;

  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  List<bool> _selecionado = List.generate(5, (_) => false);

  List<String> _equipeList = <String>[
    'Equipe1',
    'Equipe2',
    'Equipe3',
    'Equipe4'
  ];

  List<String> _equipeAdvList = <String>[
    'Equipeadv1',
    'Equipeadv2',
    'Equipeadv3',
    'Equipeadv4'
  ];

  List<String> _campeonatoList = <String>['camp1', 'camp2', 'camp3', 'camp4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKeyValue,
      autovalidate: true,
      child: new ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        children: <Widget>[
          SizedBox(height: 120.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton(
                items: _equipeList
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.purple),
                          ),
                          value: value,
                        ))
                    .toList(),
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
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 120.0),
              DropdownButton(
                items: _equipeAdvList
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.purple),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (_equipeAdvSelecionada) {
                  print('$_equipeAdvSelecionada');
                  setState(() {
                    selectedType = _equipeAdvSelecionada;
                  });
                },
                value: selectedType,
                isExpanded: false,
                hint: Text(
                  'Selecione a equipe adversária',
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton(
                items: _campeonatoList
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.purple),
                          ),
                          value: value,
                        ))
                    .toList(),
                onChanged: (_campeonatoSelecionado) {
                  print('$_campeonatoSelecionado');
                  setState(() {
                    selectedType = _campeonatoSelecionado;
                  });
                },
                value: selectedType,
                isExpanded: false,
                hint: Text(
                  'Campeonato',
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 120.0),
              ToggleButtons(
                selectedColor: Colors.white,
                borderRadius: BorderRadius.circular(5),
                fillColor: Colors.purple.shade300,
                children: <Widget>[
                  Text("P1"),
                  Text("P2"),
                  Text("P3"),
                  Text("P4"),
                  Text("P5")
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
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Submit", style: TextStyle(fontSize: 24.0)),
                        ],
                      )),
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
            ],
          ),
        ],
      ),
    ));
  }
}
