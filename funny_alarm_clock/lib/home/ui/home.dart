import 'dart:async';

import 'package:flutter/material.dart';
import 'package:funny_alarm_clock/alarm/widgets/alarm_item.dart';
import 'package:intl/intl.dart';

import '../widgets/shapes_painter.dart';

import 'package:funny_alarm_clock/alarm/bloc/block_alarm.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String? _timeString;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    _timeString = _formatDateTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).colorScheme.secondary,
              indicatorWeight: 4.0,
              tabs: const <Widget>[
                Tab(icon: Icon(Icons.access_time), text: 'Clock'),
                Tab(icon: Icon(Icons.alarm), text: 'Alarm'),
                Tab(icon: Icon(Icons.hourglass_empty), text: 'Timer'),
                Tab(icon: Icon(Icons.av_timer), text: 'Stopwatch'),
              ],
            )),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: TabBarView(controller: _tabController, children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPaint(
                    painter: ShapesPainter(),
                    child: Container(
                      height: 500.0,
                    ),
                  ),
                ),
                Text(
                  _timeString.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro'),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                alarmItem(_timeString, true),
                alarmItem(_timeString, true),
                alarmItem(_timeString, false),
                alarmItem(_timeString, false),
              ],
            ),
            const Icon(Icons.hourglass_empty),
            const Icon(Icons.timer),
          ]),
        ),
        floatingActionButton: _bottomButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  FloatingActionButton? _bottomButtons() {
    return _tabController?.index == 1
        ? FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, '/add-alarm'),
            backgroundColor: Color(0xff65D1BA),
            child: Icon(
              Icons.add,
              size: 20.0,
            ),
          )
        : null;
  }
}
