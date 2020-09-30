import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:flutter/material.dart';

class DadosPageAtletaAtleta extends StatefulWidget {
  @override
  _DadosPageAtletaAtletaState createState() => _DadosPageAtletaAtletaState();
}

class _DadosPageAtletaAtletaState extends State<DadosPageAtletaAtleta> {
  double _currentSliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return _constroiDadoAtletaAtleta();
  }

  _constroiDadoAtletaAtleta() {
    return Scaffold(
      body: _dadosBodyAtletaAtleta(),
    );
  }

  _dadosBodyAtletaAtleta() {
    return (Container(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          //"appbar"
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, top: 45.0),
                  child: Text(
                    'Meus dados',
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
          ),
          const Divider(
            color: Color(0xFFb6a5c4),
            height: 20,
            thickness: 1.5,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(height: 5),
          //"profile"
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0),
            child: Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              height: 100,
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'NOME',
                  style: TextStyle(
                      color: ConstColors.ccBlueVioletWheel,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                color: ConstColors.ccMagnolia,
              ),
            ),
          ),
          //slider jogos
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 10,
            divisions: 10,
            
            inactiveColor: ConstColors.ccMagnolia,
            activeColor: ConstColors.ccBlueVioletWheel,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          //sumula
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              height: 200,
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'SUMULA',
                  style: TextStyle(
                      color: ConstColors.ccBlueVioletWheel,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                color: ConstColors.ccMagnolia,
              ),
            ),
          ),
          //graficos posicoes
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              //height: 200,
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'grafico 1',
                  style: TextStyle(
                      color: ConstColors.ccBlueVioletWheel,
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                color: ConstColors.ccMagnolia,
              ),
            ),
          ),

          //boards ataque+defesa
        ],
      ),
    ));
  }
}
