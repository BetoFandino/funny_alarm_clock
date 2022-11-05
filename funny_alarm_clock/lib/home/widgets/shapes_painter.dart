import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:vector_math/vector_math.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:ui' as ui;

class ShapesPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, ui.Size size){

    // Global angle
    var angle = vector.radians(-90);

    final double r = sqrt(size.width * size.width + size.height * size.height) / 2;
    final alpha = atan(size.height / size.width);
    final beta = alpha + angle;
    final shifty = r * sin(beta);
    final shiftx = r * cos(beta);
    final translateX = size.width /2 -shiftx;
    final translateY = size.height / 2 - shifty;
    canvas.translate(translateX, translateY);
    canvas.rotate(angle);

    DateTime now = DateTime.now();

    // init painter
    final paint = Paint();
    var center = Offset(size.width / 2, size.height / 2);
    paint.color = const Color.fromARGB(255, 255, 255, 255);
    canvas.drawCircle(center, (size.width /3) - 5, paint);
    paint.strokeCap = StrokeCap.round;

    


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}