import 'package:flutter/material.dart';
import 'package:funny_alarm_clock/alarm/widgets/circle_day.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  TimeOfDay? _selectedTime;
  ValueChanged<TimeOfDay>? selectTime;

  @override
  void initState() {
    _selectedTime = const TimeOfDay(hour: 12, minute: 30);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B2C57),
      appBar: AppBar(
        backgroundColor: const Color(0xff1B2C57),
        title: Column(children: const <Widget>[
          Icon(
            Icons.alarm_add,
            color: Color(0xff65D1BA),
          ),
          Text('Add alarm',
              style: TextStyle(color: Color(0xff65D1BA), fontSize: 25.0))
        ]),
      ),
    );
  }
}
