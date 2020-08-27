import 'package:athl_monitoring/app/modules/home/controllers/atleta_controller.dart';
import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class AtletaPage extends StatefulWidget {
  final String title;
  const AtletaPage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _AtletaPageState createState() => _AtletaPageState();
}

class _AtletaPageState extends ModularState<AtletaPage, AtletaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      if (controller.atletaList.data == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.atletaList.hasError) {
        return Center(
            child: RaisedButton(
              onPressed: controller.getList,
              child: Text('Error'),
            ));
      } else {
        List<AtletaModel> list = controller.atletaList.data;
        return Stack(children: <Widget>[
          Container(
            child: FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: list.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: Colors.purple.shade200
                              )
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/regAtleta');
                            },
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
                                nome: list[index-1].nome,
                                num: list[index-1].number.toString(),
                                photoUrl: list[index-1].urlPhoto,
                              ),
                              onTap: () {
                                print("topper");
                              },
                            ),
                          ));
                    });
              },),
          )
        ]);
      }
    }));
  }
}
