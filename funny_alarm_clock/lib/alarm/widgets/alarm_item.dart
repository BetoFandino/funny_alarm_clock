import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget alarmItem(hour, enabled) {
  return Padding(
    padding: const EdgeInsets.all(17.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hour,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                Row(
                  children: <Widget>[],
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}
