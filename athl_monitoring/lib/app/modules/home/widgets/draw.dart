import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'drawToolModels/draw_model.dart';
import 'drawToolModels/drawing_painter.dart';

class Draw extends StatefulWidget {
  final String assetImage;

  const Draw({Key key, this.assetImage}) : super(key: key);
  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  ///body list of point paint

  List<DrawModel> pointsList = List();
  
  final pointStream = BehaviorSubject<List<DrawModel>>();

  GlobalKey key = GlobalKey();

  @override
  void dispose() {
    pointStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          pointsList.clear();
          pointStream.add(null);
        },
      ),
      key: key,
      body: GestureDetector(
        onPanStart: (details) {
          RenderBox renderBox = key.currentContext.findRenderObject();
          Paint paint = Paint();
          paint.color = Colors.red;
          paint.strokeWidth = 3.0;
          paint.strokeCap = StrokeCap.round;

          pointsList.add(DrawModel(
            offset: renderBox.globalToLocal(details.globalPosition),
            paint: paint,
          ));

          pointStream.add(pointsList);
        },
        onPanUpdate: (details) {
          RenderBox renderBox = key.currentContext.findRenderObject();
          Paint paint = Paint();
          paint.color = Colors.red;
          paint.strokeWidth = 3.0;
          paint.strokeCap = StrokeCap.round;

          pointsList.add(DrawModel(
            offset: renderBox.globalToLocal(details.globalPosition),
            paint: paint,
          ));

          pointStream.add(pointsList);
        },
        onPanEnd: (details) {
          pointsList.add(null);
          pointStream.add(pointsList);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.assetImage),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle),
          child: StreamBuilder<List<DrawModel>>(
              stream: pointStream.stream,
              builder: (context, snapshot) {
                return CustomPaint(
                  painter: DrawingPainter((snapshot.data ?? List())),
                );
              }),
        ),
      ),
    );
  }
}
