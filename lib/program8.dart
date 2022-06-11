import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/program9.dart';
import 'authentication.dart';

class Program8 extends StatefulWidget {
  const Program8(this.stopyear, this.stopmonth, this.stopday, {Key? key, required this.name})
      : super(key: key);
  final int stopyear;
  final int stopmonth;
  final int stopday;
  final String name;

  @override
  _Program8State createState() => _Program8State();
}

class _Program8State extends State<Program8> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                          '축하드립니다!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        Text(
                          widget.name+'님의 STOP DAY는',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 28,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '👑',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 28,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  ' ' +
                                      (widget.stopmonth).toString() +
                                      '월 ' +
                                      widget.stopday.toString() +
                                      '일 ',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 28,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  '입니다!',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 66,
                        ),
                        Image.asset(
                          'repo/images/victory.png',
                          fit: BoxFit.contain,
                          height: 220,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => Program9(widget.stopyear, widget.stopmonth, widget.stopday, widget.name),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '다음 단계로',
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
    );
  }
}
