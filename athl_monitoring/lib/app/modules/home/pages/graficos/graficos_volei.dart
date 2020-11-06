import 'package:athl_monitoring/app/modules/home/controllers/volleyball_game_controller.dart';
import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class GrafVolei extends StatefulWidget {
  @override
  _GrafVoleiState createState() => _GrafVoleiState();
}

class _GrafVoleiState
    extends ModularState<GrafVolei, VolleyballGameController> {
  static List<charts.Series<PontoType, String>> _dadosSerieT;
  static List<charts.Series<Erro, String>> _dadosSerieErro;

  final blue = charts.MaterialPalette.blue.makeShades(2);
  final red = charts.MaterialPalette.red.makeShades(2);
  final green = charts.MaterialPalette.green.makeShades(2);
  final purple = charts.MaterialPalette.purple.makeShades(50);
  final yellow = charts.MaterialPalette.yellow.makeShades(50);

  int _conCountSaque;
  int _conCountAtaque;
  int _conCountBloqueio;
  int _conCountGenerico;
  int _proCountSaque;
  int _proCountAtaque;
  int _proCountBloqueio;
  int _proCountGenerico;

  int _pontosClassificado(List<DadosVolleyModel> list) {
    list.forEach((element) {
      switch (element.tipo) {
        case ('ponto de saque'):
          {
            return _proCountSaque = list.length;
          }
        case 'ponto de ataque':
          {
            return _proCountAtaque = list.length;
          }
        case 'ponto de bloqueio':
          {
            return _proCountBloqueio = list.length;
          }
        case 'ponto do oponente':
          {
            return _proCountGenerico = list.length;
          }
        case ('erro de saque'):
          {
            return _conCountSaque = list.length;
          }
        case 'erro de ataque':
          {
            return _conCountAtaque = list.length;
          }
        case 'erro de bloqueio':
          {
            return _conCountBloqueio = list.length;
          }
        case 'erro generico':
          {
            return _conCountGenerico = list.length;
          }
      }
    });
  }

  _createSampleDataPonto(int pa, pb, pg, ps, cs, ca, cb, cg) {
    var proPtTipo = [
      new PontoType('Saque', ps),
      new PontoType('Ataque', pa),
      new PontoType('Bloqueio', pb),
      new PontoType('Genérico', pg)
    ];

    var conPtTipo = [
      new PontoType('Saque', cs),
      new PontoType('Ataque', ca),
      new PontoType('Bloqueio', cb),
      new PontoType('Genérico', cg)
    ];

    return [
      new charts.Series<PontoType, String>(
          data: proPtTipo,
          domainFn: (PontoType ponto, _) => ponto.tipo,
          measureFn: (PontoType ponto, _) => ponto.ponto,
          colorFn: (PontoType ponto, _) => purple[50],
          id: 'pro'),
      new charts.Series<PontoType, String>(
          data: conPtTipo,
          domainFn: (PontoType ponto, _) => ponto.tipo,
          measureFn: (PontoType ponto, _) => ponto.ponto,
          colorFn: (PontoType ponto, _) => yellow[15],
          id: 'contra')
    ];

  } //createSampleData

  _createSampleDataErro(List<DadosVolleyModel> list) {
    var erroSaque = [
      new Erro('J1', 1),
      new Erro('J2', 2),
      new Erro('J3', 3),
      new Erro('J4', 4),
      new Erro('J5', 3),
      new Erro('J6', 4)
    ];

    var erroBloqueio = [
      new Erro('J1', 1),
      new Erro('J2', 2),
      new Erro('J3', 3),
      new Erro('J4', 4),
      new Erro('J5', 3),
      new Erro('J6', 4)
    ];

    var erroAtaque = [
      new Erro('J1', 1),
      new Erro('J2', 2),
      new Erro('J3', 3),
      new Erro('J4', 4),
      new Erro('J5', 3),
      new Erro('J6', 4)
    ];

    var erroGenerico = [
      new Erro('J1', 1),
      new Erro('J2', 2),
      new Erro('J3', 3),
      new Erro('J4', 4),
      new Erro('J5', 3),
      new Erro('J6', 4)
    ];

    _dadosSerieErro.add(
      charts.Series(
          data: erroSaque,
          domainFn: (Erro erro, _) => erro.tipo,
          measureFn: (Erro erro, _) => erro.jogador,
          colorFn: (Erro erro, _) => purple[15],
          id: 'saque'),
    );

    _dadosSerieErro.add(
      charts.Series(
          data: erroAtaque,
          domainFn: (Erro erro, _) => erro.tipo,
          measureFn: (Erro erro, _) => erro.jogador,
          colorFn: (Erro erro, _) => purple[15],
          id: 'ataque'),
    );

    _dadosSerieErro.add(
      charts.Series(
          data: erroBloqueio,
          domainFn: (Erro erro, _) => erro.tipo,
          measureFn: (Erro erro, _) => erro.jogador,
          colorFn: (Erro erro, _) => purple[15],
          id: 'bloqueio'),
    );

    _dadosSerieErro.add(
      charts.Series(
          data: erroGenerico,
          domainFn: (Erro erro, _) => erro.tipo,
          measureFn: (Erro erro, _) => erro.jogador,
          colorFn: (Erro erro, _) => purple[15],
          id: 'generico'),
    );
  }

  @override
  void initState() {
    super.initState();
    _dadosSerieT = List<charts.Series<PontoType, String>>();
    //_dadosSerie = List<charts.Series<Ponto, String>>();
    _dadosSerieErro = List<charts.Series<Erro, String>>();
    List<DadosVolleyModel> list = controller.dadosList.data;
    _createSampleDataErro(list);
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
              Expanded(child: Observer(
                builder: (_) {
                  if (controller.dadosList.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.dadosList.hasError) {
                    return Center(
                        child: RaisedButton(
                      onPressed: controller.getList,
                      child: Text('Error'),
                    ));
                  } else {
                    List<DadosVolleyModel> list = controller.dadosList.data;
                    List<DadosVolleyModel> listp = controller.dadosListPro.data;
                    List<DadosVolleyModel> listpa = controller.dadosListProAtaque.data;
                    List<DadosVolleyModel> listpb = controller.dadosListProBloqueio.data;
                    List<DadosVolleyModel> listpeo = controller.dadosListProErroOponente.data;
                    List<DadosVolleyModel> listps = controller.dadosListProSaque.data;
                    List<DadosVolleyModel> listc = controller.dadosListCon.data;
                    List<DadosVolleyModel> listca = controller.dadosListConAtaque.data;
                    List<DadosVolleyModel> listcb = controller.dadosListConBloqueio.data;
                    List<DadosVolleyModel> listcg = controller.dadosListConGenerico.data;
                    List<DadosVolleyModel> listcs = controller.dadosListConSaque.data;

                    _pontosClassificado(listpa);
                    _pontosClassificado(listpb);
                    _pontosClassificado(listpeo);
                    _pontosClassificado(listps);
                    _pontosClassificado(listca);
                    _pontosClassificado(listcb);
                    _pontosClassificado(listcg);
                    _pontosClassificado(listcs);
                    
                    _dadosSerieT = _createSampleDataPonto(
                        _proCountAtaque,
                        _proCountBloqueio,
                        _proCountGenerico,
                        _proCountSaque,
                        _conCountSaque,
                        _conCountAtaque,
                        _conCountBloqueio,
                        _conCountGenerico);

                    return charts.BarChart(
                      _dadosSerieT,
                      barGroupingType: charts.BarGroupingType.stacked,
                      animate: true,
                    );
                  }
                },
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
              Expanded(child: Observer(
                builder: (_) {
                  if (controller.dadosList.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.dadosList.hasError) {
                    return Center(
                        child: RaisedButton(
                      onPressed: controller.getList,
                      child: Text('Error'),
                    ));
                  } else {
                    /*
                    List<DadosVolleyModel> list = controller.dadosList.data;
                    _createSampleDataPonto(listcg);
                    return charts.BarChart(
                      _dadosSerieT,
                      barGroupingType: charts.BarGroupingType.stacked,
                      animate: true,
                    );*/
                    return Text('ok');
                  }
                },
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

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}

class Ponto {
  final String tempo;
  final int pontos;

  Ponto(this.tempo, this.pontos);
}

class PontoType {
  final String tipo;
  final int ponto;

  PontoType(this.tipo, this.ponto);
}

class Erro {
  final String tipo;
  final int jogador;

  Erro(this.tipo, this.jogador);
}
