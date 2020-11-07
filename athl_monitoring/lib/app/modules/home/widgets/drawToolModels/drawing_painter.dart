import 'dart:ui';
import 'package:flutter/material.dart';

import 'draw_model.dart';

class DrawingPainter extends CustomPainter{

  final List<DrawModel> pointsList;
  DrawingPainter(this.pointsList);

  @override
  void paint(Canvas canvas, Size size) {
    for(int i = 0; i<(pointsList.length -1); i++){
      if(pointsList[i]!=null && pointsList[i+1]!= null){
        canvas.drawLine(pointsList[i].offset, pointsList[i+1].offset, pointsList[i].paint);
      }else if(pointsList[i]!=null && pointsList[i+1]== null) {
        List<Offset> offsetList = List();
        offsetList.add(pointsList[i].offset);
        canvas.drawPoints(PointMode.points, offsetList, pointsList[i].paint);
      }
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }



}