import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:vector_math/vector_math.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:ui' as ui;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, ui.Size size) {
    // Global angle
    var angle = vector.radians(-90);

    final double r =
        sqrt(size.width * size.width + size.height * size.height) / 2;
    final alpha = atan(size.height / size.width);
    final beta = alpha + angle;
    final shifty = r * sin(beta);
    final shiftx = r * cos(beta);
    final translateX = size.width / 2 - shiftx;
    final translateY = size.height / 2 - shifty;
    canvas.translate(translateX, translateY);
    canvas.rotate(angle);

    DateTime now = DateTime.now();

    // init painter
    final paint = Paint();
    var center = Offset(size.width / 2, size.height / 2);
    paint.color = const Color.fromARGB(255, 255, 255, 255);
    canvas.drawCircle(center, (size.width / 3) - 5, paint);
    paint.strokeCap = StrokeCap.round;

    /* 
    * Seconds line
    */
    final secondsP1 = center;
    double secondsDegree = 360 / 60 * now.second;
    double x = (size.width / 2) +
        (size.width / 3 - 20) * cos(vector.radians(secondsDegree));

    double y = (size.height / 2) +
        (size.width / 3 - 20) * sin(vector.radians(secondsDegree));

    final secondsP2 = Offset(x, y);

    paint.color = const Color(0xff65d1ba);
    paint.strokeWidth = 2;
    canvas.drawLine(secondsP1, secondsP2, paint);

    /* 
    * minutes line
    */
    final minutesP1 = center;
    double minutesDegree = 360 / 60 * now.minute;
    x = (size.width / 2) +
        (size.width / 3 - 40) * cos(vector.radians(minutesDegree));

    y = (size.height / 2) +
        (size.width / 3 - 40) * sin(vector.radians(minutesDegree));

    final minutesP2 = Offset(x, y);

    paint.color = const Color(0xff354569);
    paint.strokeWidth = 3;
    canvas.drawLine(minutesP1, minutesP2, paint);

    /* 
    * hours line
    */
    final hoursP1 = center;
    double hoursDegree = 360 / 12 * (now.hour - 12); // set hour to 12 hrs
    x = (size.width / 2) +
        (size.width / 3 - 60) * cos(vector.radians(hoursDegree));

    y = (size.height / 2) +
        (size.width / 3 - 60) * sin(vector.radians(hoursDegree));

    final hoursP2 = Offset(x, y);

    paint.color = const Color(0xff354569);
    paint.strokeWidth = 4;
    canvas.drawLine(hoursP1, hoursP2, paint);

    /**
     * external lines
     */

    for (int i = 0; i < 60; i++) {
      //calculate line positions
      double minute = 360 / 60 * i;

      // Set style every 5 minutes
      paint.color = (i % 5 == 0) ? const Color(0xff65d1ba) : Colors.white;
      paint.strokeWidth = (i % 5 == 0) ? 4 : 1;

      int distance = (i % 5 == 0) ? 10 : 15;

      double x1 = (size.width / 2) +
          (size.width / 3 + distance) * cos(vector.radians(minute));
      double y1 = (size.height / 2) +
          (size.height / 3 + distance) * sin(vector.radians(minute));
      final p1 = Offset(x1, y1);

      double x2 = (size.width / 2) +
          (size.width / 3 + 30) * cos(vector.radians(minute));
      double y2 = (size.height / 2) +
          (size.height / 3 + 30) * sin(vector.radians(minute));
      final p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
