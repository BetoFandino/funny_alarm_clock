import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/shapes_painter.dart';

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
    _tabController = TabController(length: 4, vsync: this,
    initialIndex: 0
    );

    _timeString = _formatDateTime(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    
  }

  void _getTime(){
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime){
    return DateFormat('hh:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, 
      child: Scaffold(
        appBar:AppBar(
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
          )
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child:  TabBarView(
            controller: _tabController,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomPaint(
                      painter: ShapesPainter(),
                      child: Container(height: 500.0,),

                      ),
                  )
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}