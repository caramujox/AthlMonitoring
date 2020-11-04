import 'package:athl_monitoring/app/modules/home/controllers/volleyball_game_controller.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_modular/flutter_modular.dart';

class GrafVolei extends StatefulWidget {
  @override
  _GrafVoleiState createState() => _GrafVoleiState();
}

class _GrafVoleiState
    extends ModularState<GrafVolei, VolleyballGameController> {
  static List<charts.Series<Ponto, String>> _dadosSerie;
  static List<charts.Series<Erro, String>> _dadosSerieErro;

  final blue = charts.MaterialPalette.blue.makeShades(2);
  final red = charts.MaterialPalette.red.makeShades(2);
  final green = charts.MaterialPalette.green.makeShades(2);
  final purple = charts.MaterialPalette.purple.makeShades(50);
  final yellow = charts.MaterialPalette.yellow.makeShades(50);

  _createSampleDataPonto() {
    var proPtData = [
      new Ponto('1° SET', 5),
      new Ponto('2° SET', 15),
      new Ponto('3° SET', 10),
    ];

    var contraPtData = [
      new Ponto('1° SET', 20),
      new Ponto('2° SET', 10),
      new Ponto('3° SET', 15),
    ];

    _dadosSerie.add(
      charts.Series(
          data: proPtData,
          domainFn: (Ponto ponto, _) => ponto.tempo,
          measureFn: (Ponto ponto, _) => ponto.pontos,
          colorFn: (Ponto ponto, _) => purple[50],
          id: 'pro'),
    );
    _dadosSerie.add(charts.Series(
        data: contraPtData,
        domainFn: (Ponto ponto, _) => ponto.tempo,
        measureFn: (Ponto ponto, _) => ponto.pontos,
        colorFn: (Ponto ponto, _) => purple[15],
        id: 'contra'));
  }

  _createSampleDataErro() {
    var erroSaque = [
      new Erro('Defesa', 12),
      new Erro('Ataque', 7),
      new Erro('Saque', 4),
    ];

    _dadosSerieErro.add(
      charts.Series(
          data: erroSaque,
          domainFn: (Erro erro, _) => erro.tipo,
          measureFn: (Erro erro, _) => erro.qnt,
          colorFn: (Erro erro, _) {
            switch (erro.tipo) {
              case 'Ataque':
                {
                  return purple[12];
                }
              case 'Defesa':
                {
                  return purple[25];
                }
              case 'Saque':
                {
                  return purple[50];
                }
              default:
                {
                  return green[0];
                }
            }
          },
          id: 'pro'),
    );
  }

  @override
  void initState() {
    super.initState();
    _dadosSerie = List<charts.Series<Ponto, String>>();
    _createSampleDataPonto();
    _dadosSerieErro = List<charts.Series<Erro, String>>();
    _createSampleDataErro();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: ConstColors.ccBlueVioletWheel,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: _appBarTab(),
              body: _bodyTeste(),
            )));
  }

  _appBarTab() {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Resultados',
          style: TextStyle(
              color: Color(0xff230a42),
              fontFamily: 'Google',
              fontWeight: FontWeight.bold,
              fontSize: 32),
        ),
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.insert_chart, color: Color(0xff230a42))),
            Tab(icon: Icon(Icons.pie_chart_outlined, color: Color(0xff230a42))),
            Tab(icon: Icon(Icons.file_download, color: Color(0xff230a42))),
          ],
        ));
  }

  _bodyTeste() {
    return TabBarView(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Text(
                'Pontos por Set',
                style: TextStyle(
                    color: Color(0xff230a42),
                    fontFamily: 'Google',
                    //fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 10.0),
              Expanded(
                  child: charts.BarChart(
                _dadosSerie,
                barGroupingType: charts.BarGroupingType.stacked,
                animate: true,
              ))
            ],
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Text(
                'Erros Predominantes',
                style: TextStyle(
                    color: Color(0xff230a42),
                    fontFamily: 'Google',
                    //fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 10.0),
              Expanded(
                  child: charts.PieChart(
                _dadosSerieErro,
                animate: true,
                defaultRenderer: charts.ArcRendererConfig(
                    arcWidth: 100,
                    arcRendererDecorators: [
                      new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.auto,
                      )
                    ]),
              ))
            ],
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 120.0),
              Icon(Icons.file_download, color: Color(0xff230a42), size: 70),
              SizedBox(height: 10.0),
              Text(
                'DOWNLOAD',
                style: TextStyle(
                    color: Color(0xff230a42),
                    fontFamily: 'Google',
                    //fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    ]);
  }
}

class Ponto {
  final String tempo;
  final int pontos;

  Ponto(this.tempo, this.pontos);
}

class Erro {
  final String tipo;
  final int qnt;

  Erro(this.tipo, this.qnt);
}
