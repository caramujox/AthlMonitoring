import 'package:athl_monitoring/app/modules/home/controllers/equipe_controller.dart';
import 'package:athl_monitoring/app/modules/home/models/equipe_model.dart';
import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:athl_monitoring/app/modules/home/widgets/grid_item.dart';
import 'package:athl_monitoring/app/modules/home/widgets/header_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridEquipePage extends StatefulWidget {
  final String title;
  const GridEquipePage({Key key, this.title = "Equipes Page"})
      : super(key: key);
  @override
  _GridEquipePageState createState() => _GridEquipePageState();
}

class _GridEquipePageState
    extends ModularState<GridEquipePage, EquipeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            child: Column(
              children: [
                TitlePage(
                  titulo: "Equipes",
                ),
                const Divider(
                  color: Color(0xFFb6a5c4),
                  height: 20,
                  thickness: 1.5,
                  indent: 20,
                  endIndent: 20,
                ),
                Expanded(
                  child: Observer(
                    builder: (_) {
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
                        return Stack(children: <Widget>[
                          Container(child: FutureBuilder(builder:
                              (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                            return GridView.builder(
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemCount: list.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            border: Border.all(
                                                color: Colors.purple.shade200)),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            size: 40,
                                            color: ConstColors.ccBlueVioletWheel,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushNamed('/regEquipes');
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                  return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      columnCount: 3,
                                      duration: const Duration(microseconds: 375),
                                      child: ScaleAnimation(
                                        child: GestureDetector(
                                          child: GridItem(
                                            index: index,
                                            nome: list[index - 1].nome,
                                            photoUrl: list[index - 1].urlPhoto,
                                          ),
                                          onTap: () {
                                            print("SUCESSO IRMAOS");
                                          },
                                        ),
                                      ));
                                });
                          }))
                        ]);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
