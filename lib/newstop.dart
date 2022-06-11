import 'package:flutter/material.dart';
import 'package:shepherd/program8.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';

class NewStop extends StatefulWidget {
  const NewStop({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _NewStopState createState() => _NewStopState();
}

class _NewStopState extends State<NewStop> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ko_KR');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 128,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 70,
                            ),
                            Icon(
                              Icons.date_range,
                              color: Colors.redAccent,
                              size: 100,
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            Text(
                              'STOP DAY(담배 끊는 날)을 정해 봅시다!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width -
                                              99,
                                          child: Text(
                                            '언제 시작하고 싶으신가요? (2주 이내)',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            TableCalendar(
                              firstDay: DateTime.utc(1950,1,1),
                              lastDay: DateTime.utc(2050,1,1),
                              focusedDay: DateTime.now(),
                              calendarFormat: _calendarFormat,
                              locale: 'ko_KR',
                              headerStyle: HeaderStyle(
                                titleCentered: true,
                                formatButtonVisible: false,
                              ),
                              selectedDayPredicate: (day) {
                                // Use `selectedDayPredicate` to determine which day is currently selected.
                                // If this returns true, then `day` will be marked as selected.

                                // Using `isSameDay` is recommended to disregard
                                // the time-part of compared DateTime objects.
                                return isSameDay(_selectedDay, day);
                              },
                              onDaySelected: (selectedDay, focusedDay) {
                                if (!isSameDay(_selectedDay, selectedDay)) {
                                  // Call `setState()` when updating the selected day
                                  setState(() {
                                    _selectedDay = selectedDay;
                                    _focusedDay = focusedDay;
                                  });
                                }
                              },
                              onFormatChanged: (format) {
                                if (_calendarFormat != format) {
                                  // Call `setState()` when updating calendar format
                                  setState(() {
                                    _calendarFormat = format;
                                  });
                                }
                              },
                              onPageChanged: (focusedDay) {
                                // No need to call `setState()` here
                                _focusedDay = focusedDay;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 280,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              firestore.collection(AuthenticationHelper().getUid()).doc("stopyear").update({'data': _selectedDay.year,});
                              firestore.collection(AuthenticationHelper().getUid()).doc("stopmonth").update({'data': _selectedDay.month,});
                              firestore.collection(AuthenticationHelper().getUid()).doc("stopday").update({'data': _selectedDay.day,});
                              firestore.collection(AuthenticationHelper().getUid()).doc("stoptime").update({'data': _selectedDay.millisecondsSinceEpoch,});
                              Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              '완료',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5,MediaQuery.of(context).padding.top, 0,0),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ],
      ),
    );
  }
}
