import 'package:athl_monitoring/app/modules/home/util/const_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String nome;
  final int index;
  final String num;
  final String photoUrl;

  const GridItem({Key key, this.nome, this.index, this.num, this.photoUrl})
      : super(key: key);

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
                  nome == null ? 'sem nome' : nome,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: photoUrl == null
                    ? AssetImage("assets/images/account_circle_grey.png")
                    : FutureBuilder<Widget>(
                        future: _getImage(photoUrl),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done)
                            return Container(
                              child: snapshot.data,
                            );
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.25,
                                width: MediaQuery.of(context).size.width / 1.25,
                                child: CircularProgressIndicator());

                          return Container();
                        },
                      ),
              ),
              // child: CachedNetworkImage(
              //   height: 100,
              //   width: 100,
              //   placeholder: (context, url) => new Container(
              //     color: Colors.transparent,
              //   ),
              //   imageUrl:
              //       photoUrl != null? photoUrl:"",
              //   imageBuilder: (context, imageProvider) => Container(
              //     decoration: BoxDecoration(image: DecorationImage(image: )),
              //   ),
              // ),
              //),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      num != null ? num : "",
                      style: TextStyle(fontSize: 32),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> _getImage(String image) async {
    Image m;

    await FirebaseStorage.instance
        .ref()
        .child(image)
        .getDownloadURL()
        .then((downloadURL) {
      m = Image.network(
        downloadURL.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return m;
  }
}
