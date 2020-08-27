import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String nome;
  final int index;
  final String num;
  final String photoUrl;

  const GridItem({Key key, this.nome, this.index, this.num, this.photoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: ConstColors.ccBlueVioletWheel,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  nome == null ? 'sem nome':nome,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  height: 100,
                  width: 100,
                  placeholder: (context, url) => new Container(
                    color: Colors.transparent,
                  ),
                  imageUrl:
                      photoUrl != null? photoUrl:"",
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    num != null? num:"",
                    style: TextStyle(fontSize: 32),
                  ),
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
