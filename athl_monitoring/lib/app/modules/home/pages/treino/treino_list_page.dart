import 'package:athl_monitoring/app/modules/home/controllers/treino_controller.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:athl_monitoring/app/modules/home/widgets/header_title.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TreinoListPage extends StatefulWidget {
  @override
  _TreinoListPageState createState() => _TreinoListPageState();
}

class _TreinoListPageState
    extends ModularState<TreinoListPage, TreinoController> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[300, 200, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        Container(
          child: Column(
            children: [
              TitlePage(
                titulo: "Treinos",
              ),
              const Divider(
                color: Color(0xFFb6a5c4),
                height: 20,
                thickness: 1.5,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.deepPurple[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              }),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
              color: ConstColors.ccBlueVioletWheel,
              textColor: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      AutoSizeText(
                        "Adicionar novo treino",
                        maxLines: 1,
                        maxFontSize: 45,
                      ),
                    ],
                  )),
              onPressed: () {
                Navigator.of(context).pushNamed('/registerTreino');
              },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))),
        )
      ]),
    ));
  }
}
