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
  
  int _countSaque1 =0;
  int _countSaque2 = 0;
  int _countSaque3= 0;
  int _countSaque4= 0;
  int _countSaque5= 0;
  int _countSaque6= 0;
  int _countAtaque1= 0;
  int _countAtaque2= 0;
  int _countAtaque3= 0;
  int _countAtaque4= 0;
  int _countAtaque5= 0;
  int _countAtaque6= 0;
  int _countBloqueio1= 0;
  int _countBloqueio2= 0;
  int _countBloqueio3= 0;
  int _countBloqueio4= 0;
  int _countBloqueio5= 0;
  int _countBloqueio6= 0;
  int _countGenerico1= 0;
  int _countGenerico2= 0;
  int _countGenerico3= 0;
  int _countGenerico4= 0;
  int _countGenerico5= 0;
  int _countGenerico6= 0;

  List<Erro> erroSaque;
  List<Erro> erroAtaque;
  List<Erro> erroBloqueio;
  List<Erro> erroGenerico;


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
          id: 'Pro'),
      new charts.Series<PontoType, String>(
          data: conPtTipo,
          domainFn: (PontoType ponto, _) => ponto.tipo,
          measureFn: (PontoType ponto, _) => ponto.ponto,
          colorFn: (PontoType ponto, _) => purple[20],
          id: 'Contra')
    ];

  } //createSampleData


  _errosJogador(List<DadosVolleyModel> list){
    
    var jogador = [];
    
    list.forEach((element) {      
      jogador.add(element.jogador);
      }           
    );

    var jogadorDist = jogador.toSet().toList();
    
    list.forEach((element) {
      if(element.jogador==jogadorDist[0]){
        switch (element.tipo) {
         case ('erro de saque'):
         {           
           _countSaque1++;
           return erroSaque.add(Erro (element.jogador, _countSaque1));
         }
         case ('erro de ataque'):
         {
           _countAtaque1++;
           return erroAtaque.add(Erro (element.jogador, _countAtaque1));
         }
         case ('erro de bloqueio'):
         {
           _countBloqueio1++;
           return erroBloqueio.add(Erro (element.jogador, _countBloqueio1));
         }
         case ('erro generico'):
         {
           _countGenerico1++;
           return erroGenerico.add(Erro (element.jogador, _countGenerico1));
         }
        }
      }
      else if (element.jogador==jogadorDist[1]){
        switch (element.tipo) {
         case ('erro de saque'):
         {           
           _countSaque1++;
           return erroSaque.add(Erro (element.jogador, _countSaque2));
         }
         case ('erro de ataque'):
         {
           _countAtaque1++;
           return erroAtaque.add(Erro (element.jogador, _countAtaque2));
         }
         case ('erro de bloqueio'):
         {
           _countBloqueio1++;
           return erroBloqueio.add(Erro (element.jogador, _countBloqueio2));
         }
         case ('erro generico'):
         {
           _countGenerico1++;
           return erroGenerico.add(Erro (element.jogador, _countGenerico2));
         }
        }

      }
      else if (element.jogador==jogadorDist[2]){
        switch (element.tipo) {
         case ('erro de saque'):
         {           
           _countSaque1++;
           return erroSaque.add(Erro (element.jogador, _countSaque3));
         }
         case ('erro de ataque'):
         {
           _countAtaque1++;
           return erroAtaque.add(Erro (element.jogador, _countAtaque3));
         }
         case ('erro de bloqueio'):
         {
           _countBloqueio1++;
           return erroBloqueio.add(Erro (element.jogador, _countBloqueio3));
         }
         case ('erro generico'):
         {
           _countGenerico1++;
           return erroGenerico.add(Erro (element.jogador, _countGenerico3));
         }
        }
        
      }
      else if (element.jogador==jogadorDist[3]){
        switch (element.tipo) {
         case ('erro de saque'):
         {           
           _countSaque1++;
           return erroSaque.add(Erro (element.jogador, _countSaque4));
         }
         case ('erro de ataque'):
         {
           _countAtaque1++;
           return erroAtaque.add(Erro (element.jogador, _countAtaque4));
         }
         case ('erro de bloqueio'):
         {
           _countBloqueio1++;
           return erroBloqueio.add(Erro (element.jogador, _countBloqueio4));
         }
         case ('erro generico'):
         {
           _countGenerico1++;
           return erroGenerico.add(Erro (element.jogador, _countGenerico4));
         }
        }
      }
      else if (element.jogador==jogadorDist[4]){
        switch (element.tipo) {
         case ('erro de saque'):
         {           
           _countSaque1++;
           return erroSaque.add(Erro (element.jogador, _countSaque5));
         }
         case ('erro de ataque'):
         {
           _countAtaque1++;
           return erroAtaque.add(Erro (element.jogador, _countAtaque5));
         }
         case ('erro de bloqueio'):
         {
           _countBloqueio1++;
           return erroBloqueio.add(Erro (element.jogador, _countBloqueio5));
         }
         case ('erro generico'):
         {
           _countGenerico1++;
           return erroGenerico.add(Erro (element.jogador, _countGenerico5));
         }
        }
      }
      else if (element.jogador==jogadorDist[5]){
        switch (element.tipo) {
         case ('erro de saque'):
         {           
           _countSaque1++;
           return erroSaque.add(Erro (element.jogador, _countSaque6));
         }
         case ('erro de ataque'):
         {
           _countAtaque1++;
           return erroAtaque.add(Erro (element.jogador, _countAtaque6));
         }
         case ('erro de bloqueio'):
         {
           _countBloqueio1++;
           return erroBloqueio.add(Erro (element.jogador, _countBloqueio6));
         }
         case ('erro generico'):
         {
           _countGenerico1++;
           return erroGenerico.add(Erro (element.jogador, _countGenerico6));
         }
        }
      }
      
    });
  } 
 
  _createSampleDataErro() {
    var erroSaqueStat = [
      new Erro('J1', 1),
      new Erro('J2', 2),
      new Erro('J3', 1),
      new Erro('J4', 4),
      new Erro('J5', 3),
      new Erro('J6', 4)
    ];

    var erroBloqueioStat = [
      new Erro('J1', 7),
      new Erro('J2', 1),
      new Erro('J3', 4),
      new Erro('J4', 3),
      new Erro('J5', 5),
      new Erro('J6', 5)
    ];

    var erroAtaqueStat = [
      new Erro('J1', 1),
      new Erro('J2', 6),
      new Erro('J3', 2),
      new Erro('J4', 1),
      new Erro('J5', 2),
      new Erro('J6', 1)
    ];

    var erroGenericoStat = [
      new Erro('J1', 1),
      new Erro('J2', 2),
      new Erro('J3', 3),
      new Erro('J4', 4),
      new Erro('J5', 3),
      new Erro('J6', 4)
    ];

    return [
      new charts.Series<Erro, String>(
        data: erroSaqueStat,
          domainFn: (Erro erro, _) => erro.tipo,
          measureFn: (Erro erro, _) => erro.jogador,
          colorFn: (Erro erro, _) => purple[30],
          id: 'Saque'),
      new charts.Series<Erro, String>(        
          data: erroAtaqueStat,
          domainFn: (Erro erro, _) => erro.tipo,
          measureFn: (Erro erro, _) => erro.jogador,
          colorFn: (Erro erro, _) => purple[20],
          id: 'Ataque'),
      new charts.Series<Erro, String>(
          data: erroBloqueioStat,
          domainFn: (Erro erro, _) => erro.tipo,
          measureFn: (Erro erro, _) => erro.jogador,
          colorFn: (Erro erro, _) => purple[10],
          id: 'Bloqueio'),
      new charts.Series<Erro, String>(
          data: erroGenericoStat,
          domainFn: (Erro erro, _) => erro.tipo,
          measureFn: (Erro erro, _) => erro.jogador,
          colorFn: (Erro erro, _) => purple[50],
          id: 'Genérico'),
    ];

    
  }

  @override
  void initState() {
    super.initState();
    _dadosSerieT = List<charts.Series<PontoType, String>>();
    //_dadosSerie = List<charts.Series<Ponto, String>>();
    _dadosSerieErro = List<charts.Series<Erro, String>>();
    List<DadosVolleyModel> list = controller.dadosList.data;
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
                    fontSize: 24),
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
                      behaviors: [new charts.SeriesLegend()]
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
                'Tipos de erro por jogador',
                style: TextStyle(
                    color: Color(0xff230a42),
                    fontFamily: 'Google',
                    //fontWeight: FontWeight.bold,
                    fontSize: 24),
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
                    _dadosSerieErro = _createSampleDataErro();
                    return charts.BarChart(
                      _dadosSerieErro,
                      barGroupingType: charts.BarGroupingType.grouped,
                      animate: true,
                      vertical: false,
                      behaviors: [new charts.SeriesLegend()]
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


