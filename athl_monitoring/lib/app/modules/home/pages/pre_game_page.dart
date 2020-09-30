import 'package:flutter/material.dart';

class PreGamePage extends StatefulWidget {
  @override
  _PreGamePageState createState() => _PreGamePageState();
}

class _PreGamePageState extends State<PreGamePage> {
  var selectedCurrency, selectedType;

  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  List<bool> _selecionado = List.generate(6, (_) => false);

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
              DropdownButton(
                items: _equipeList
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.purple.shade500),
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
                  style: TextStyle(color: Colors.purple.shade500),
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
                            style: TextStyle(color: Colors.purple.shade500),
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
                  style: TextStyle(color: Colors.purple.shade500),
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
                            style: TextStyle(color: Colors.purple.shade500),
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
                  style: TextStyle(color: Colors.purple.shade500),
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
                fillColor: Colors.purple.shade500,
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
                  color: Colors.purple.shade500,
                  textColor: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Submit", style: TextStyle(fontSize: 24.0)),
                        ],
                      )),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/selecAtleta');
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
