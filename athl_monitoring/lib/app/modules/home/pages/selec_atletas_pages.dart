import 'package:athl_monitoring/app/modules/home/controllers/atleta_controller.dart';
import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/models/equipe_model.dart';
import 'package:athl_monitoring/app/modules/home/models/game_model.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:athl_monitoring/app/modules/home/widgets/grid_item.dart';
import 'package:athl_monitoring/app/modules/home/widgets/header_title.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SelecAtleta extends StatefulWidget {
  final String title;
  final List<EquipeModel> equipeJogando;
  final String equipeAdv, nomeCompeticao;
  const SelecAtleta({Key key, this.title = "Home", this.equipeJogando, this.equipeAdv, this.nomeCompeticao})
      : super(key: key);

  @override
  _SelecAtletaState createState() => _SelecAtletaState();
}

class _SelecAtletaState extends ModularState<SelecAtleta, AtletaController> {
  //use 'controller' variable to access controller
  ScrollController scrollController = new ScrollController();
    bool successDrop4 = false;
    bool successDrop3 = false;
    bool successDrop2 = false;
    bool successDrop5 = false;
    bool successDrop6 = false;
    bool successDrop1 = false;
  @override
  Widget build(BuildContext context) {
    AtletaModel tavindo = new AtletaModel();
    controller.getAtletasSingleTeam(widget.equipeJogando[0].codEquipe);
    return Scaffold(
        body: Column(
            // alignment: Alignment.topCenter,
            children: [
          Container(
            child: Wrap(
              children: <Widget>[
                TitlePage(
                  titulo: 'Selecione a equipe titular',
                ),
                const Divider(
                  color: Color(0xFFb6a5c4),
                  height: 20,
                  thickness: 1.5,
                  indent: 20,
                  endIndent: 20,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          padding: const EdgeInsets.all(2.0),
                          shrinkWrap: true,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          crossAxisCount: 3,
                          childAspectRatio: 0.85,
                          children: <Widget>[
                            SizedBox.expand(
                                child: DragTarget<AtletaModel>(
                              builder: (context, List<AtletaModel> incoming,
                                  List rejected) {
                                if (successDrop4 == true) {
                                  successDrop4 = !successDrop4;
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                        child: GestureDetector(
                                      child: GridItem(
                                        nome: tavindo.nome,
                                        num: tavindo.number.toString(),
                                        photoUrl: tavindo.urlPhoto,
                                      ),
                                      onTap: () {
                                        print('nnanarewanitonight');
                                        successDrop4 = false;
                                      },
                                    )),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                      child: AutoSizeText(
                                        '4',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                ConstColors.ccBlueVioletWheel,
                                            letterSpacing: 1.5,
                                            fontSize: 60.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans',
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                              },
                              onWillAccept: (data) {
                                print('ximbinha');
                                return data.nome.isNotEmpty;
                              },
                              onAccept: (data) {
                                successDrop4 = true;
                                tavindo = data;
                                print("xablau");
                              },
                              onLeave: (data) {
                                print('xibliu');
                              },
                            )),
                            SizedBox.expand(
                                child: DragTarget<AtletaModel>(
                              builder: (context, List<AtletaModel> incoming,
                                  List rejected) {
                                if (successDrop3 == true) {
                                  successDrop3 = !successDrop3;
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                        child: GestureDetector(
                                      child: GridItem(
                                        nome: tavindo.nome,
                                        num: tavindo.number.toString(),
                                        photoUrl: tavindo.urlPhoto,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          successDrop3 = false;
                                        });
                                      },
                                    )),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                      child: AutoSizeText(
                                        '3',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                ConstColors.ccBlueVioletWheel,
                                            letterSpacing: 1.5,
                                            fontSize: 60.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans',
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                              },
                              onWillAccept: (data) {
                                print('ximbinha');
                                return data.nome.isNotEmpty;
                              },
                              onAccept: (data) {
                                successDrop3 = true;
                                tavindo = data;
                                print("xablau");
                              },
                              onLeave: (data) {
                                print('xibliu');
                              },
                            )),
                            SizedBox.expand(
                                child: DragTarget<AtletaModel>(
                              builder: (context, List<AtletaModel> incoming,
                                  List rejected) {
                                if (successDrop2 == true) {
                                  successDrop2 = !successDrop2;
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                        child: GestureDetector(
                                      child: GridItem(
                                        nome: tavindo.nome,
                                        num: tavindo.number.toString(),
                                        photoUrl: tavindo.urlPhoto,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          successDrop2 = false;
                                        });
                                      },
                                    )),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          bottom: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                      child: AutoSizeText(
                                        '2',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                ConstColors.ccBlueVioletWheel,
                                            letterSpacing: 1.5,
                                            fontSize: 60.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans',
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                              },
                              onWillAccept: (data) {
                                print('ximbinha');
                                return data.nome.isNotEmpty;
                              },
                              onAccept: (data) {
                                successDrop2 = true;
                                tavindo = data;
                                print("xablau");
                              },
                              onLeave: (data) {
                                print('xibliu');
                              },
                            )),
                            SizedBox.expand(
                                child: DragTarget<AtletaModel>(
                              builder: (context, List<AtletaModel> incoming,
                                  List rejected) {
                                if (successDrop5 == true) {
                                  successDrop5 = !successDrop5;
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          top: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                        child: GestureDetector(
                                      child: GridItem(
                                        nome: tavindo.nome,
                                        num: tavindo.number.toString(),
                                        photoUrl: tavindo.urlPhoto,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          successDrop5 = false;
                                        });
                                      },
                                    )),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          top: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                      child: AutoSizeText(
                                        '5',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                ConstColors.ccBlueVioletWheel,
                                            letterSpacing: 1.5,
                                            fontSize: 60.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans',
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                              },
                              onWillAccept: (data) {
                                print('ximbinha');
                                return data.nome.isNotEmpty;
                              },
                              onAccept: (data) {
                                successDrop5 = true;
                                tavindo = data;
                                print("xablau");
                              },
                              onLeave: (data) {
                                print('xibliu');
                              },
                            )),
                            SizedBox.expand(
                                child: DragTarget<AtletaModel>(
                              builder: (context, List<AtletaModel> incoming,
                                  List rejected) {
                                if (successDrop6 == true) {
                                  successDrop6 = !successDrop6;
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          top: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                        child: GestureDetector(
                                      child: GridItem(
                                        nome: tavindo.nome,
                                        num: tavindo.number.toString(),
                                        photoUrl: tavindo.urlPhoto,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          successDrop6 = false;
                                        });
                                      },
                                    )),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          top: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                      child: AutoSizeText(
                                        '6',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                ConstColors.ccBlueVioletWheel,
                                            letterSpacing: 1.5,
                                            fontSize: 60.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans',
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                              },
                              onWillAccept: (data) {
                                print('ximbinha');
                                return data.nome.isNotEmpty;
                              },
                              onAccept: (data) {
                                successDrop6 = true;
                                tavindo = data;
                                print("xablau");
                              },
                              onLeave: (data) {
                                print('xibliu');
                              },
                            )),
                            SizedBox.expand(
                                child: DragTarget<AtletaModel>(
                              builder: (context, List<AtletaModel> incoming,
                                  List rejected) {
                                if (successDrop1 == true) {
                                  successDrop1 = !successDrop1;
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          top: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                        child: GestureDetector(
                                      child: GridItem(
                                        nome: tavindo.nome,
                                        num: tavindo.number.toString(),
                                        photoUrl: tavindo.urlPhoto,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          successDrop1 = false;
                                        });
                                      },
                                    )),
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.orange[300],
                                        border: Border(
                                          top: BorderSide(
                                              color:
                                                  ConstColors.ccBlueVioletWheel,
                                              width: 2),
                                        )),
                                    child: Center(
                                      child: AutoSizeText(
                                        '1',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                ConstColors.ccBlueVioletWheel,
                                            letterSpacing: 1.5,
                                            fontSize: 60.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans',
                                            fontStyle: FontStyle.italic),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                }
                              },
                              onWillAccept: (data) {
                                print('ximbinha');
                                return data.nome.isNotEmpty;
                              },
                              onAccept: (data) {
                                successDrop1 = true;
                                tavindo = data;
                                print("xablau");
                              },
                              onLeave: (data) {
                                print('xibliu');
                              },
                            )),
                          ]),
                    ),
                  ),
                ),
                Observer(builder: (_) {
                  if (controller.atletasTeamList.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.atletasTeamList.hasError) {
                    return Center(
                        child: RaisedButton(
                      onPressed: () {},
                      child: Text('Error'),
                    ));
                  } else {
                    List<AtletaModel> list = controller.atletasTeamList.data;
                    list.sort((a, b) => a.number.compareTo(b.number));
                    return Flexible(
                      child: Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                            height: MediaQuery.of(context).size.height * 0.300,
                            child: FutureBuilder(
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                return Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Scrollbar(
                                    isAlwaysShown: true,
                                    controller: scrollController,
                                    child: ListView.builder(
                                        controller: scrollController,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: list.length,
                                        itemBuilder: (context, index) {
                                          return AnimationConfiguration
                                              .staggeredList(
                                                  position: index,
                                                  duration: const Duration(
                                                      microseconds: 375),
                                                  child: ScaleAnimation(
                                                    child: GestureDetector(
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        child: Card(
                                                          child: Draggable(
                                                            data: list[index],
                                                            child: Container(
                                                              child: GridItem(
                                                                index: index,
                                                                nome:
                                                                    list[index]
                                                                        .nome,
                                                                num: list[index]
                                                                    .number
                                                                    .toString(),
                                                                photoUrl: list[
                                                                        index]
                                                                    .urlPhoto,
                                                              ),
                                                            ),
                                                            feedback: Center(
                                                              child: Card(
                                                                child: Container(
                                                                  child: AutoSizeText(
                                                                      list[index]
                                                                          .nome),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      onLongPress: () {
                                                        print(
                                                            'LOOOOOOOOOOOOOOOOOOOOOOONG press');
                                                      },
                                                    ),
                                                  ));
                                        }),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: RaisedButton(
                                color: ConstColors.ccBlueVioletWheel,
                                textColor: Colors.white,
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text("INICIAR PARTIDA",
                                            style: TextStyle(fontSize: 24.0)),
                                      ],
                                    )),
                                onPressed: () {
                                  // List<EquipeModel> gambi =
                                  //     new List<EquipeModel>();

                                  GameModel x = new GameModel(
                                      codEquipe: widget.equipeJogando[0].codEquipe,
                                      nomeEquipe: widget.equipeJogando[0].nome,
                                      equipeAdv: 'França',// widget.equipeAdv,
                                      nomeCompeticao: 'VNL 2018',//widget.nomeCompeticao,
                                      dataGame: DateTime.now());
                                  // controller.startGame(x);
                                  Navigator.of(context)
                                      .pushNamed('/volleyballGame', arguments: x);
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0))),
                          ),
                        ],
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ]));
  }
}
