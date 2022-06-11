import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/newsplash.dart';

class Info88 extends StatefulWidget {
  const Info88({
    Key? key,
    required this.name, required this.cause, required this.mostList, required this.percentList, required this.countList, required this.startmonth, required this.startday,
  }) : super(key: key);
  final String name;
  final List<num> cause;
  final List<int> mostList;
  final List<num> percentList;
  final List<num> countList;
  final num startmonth;
  final num startday;


  @override
  _Info88State createState() => _Info88State();
}

class _Info88State extends State<Info88> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  var _titleList = [
    '식사 후',
    '음주 후',
    '피곤',
    '성관계 후',
    '스트레스/걱정',
    '분노',
    '아침 시간',
    '운전',
    '지루함',
    '집중력 저하',
    '축하이벤트',
    '커피',
    '주변 권유',
    '야외활동',
    '가족',
    '운동 후',
    '작업 중',
    '휴식시간',
    '자기 전',
    '배고픔',
    '슬픔',
    '두통',
    '짜증',
    '흡연목격',
  ];
  var _triggerList = [
    '패턴 트리거',
    '패턴 트리거',
    '감정 트리거',
    '패턴 트리거',
    '감정 트리거',
    '감정 트리거',
    '패턴 트리거',
    '패턴 트리거',
    '감정 트리거',
    '귿단 트리거',
    '사회 트리거',
    '패턴 트리거',
    '사회 트리거',
    '패턴 트리거',
    '사회 트리거',
    '패턴 트리거',
    '패턴 트리거',
    '패턴 트리거',
    '패턴 트리거',
    '패턴 트리거',
    '감정 트리거',
    '금단 트리거',
    '금단 트리거',
    '사회 트리거',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 130,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 33,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 33,
                              ),
                              Text(
                                widget.name + ' 님의 주요 흡연욕구',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                widget.startmonth.toString() +
                                    '월 ' +
                                    widget.startday.toString() +
                                    '일 ~ ' +
                                    DateTime.now().month.toString() +
                                    '월 ' +
                                    DateTime.now().day.toString() +
                                    '일',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 33,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 88,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: (MediaQuery.of(context).size.width -
                                            88) /
                                            2,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Text(
                                                    '${_titleList[widget.mostList[0]]}',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    '${_triggerList[widget.mostList[0]]}',
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Text(
                                                    '${_titleList[widget.mostList[1]]}',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    '${_triggerList[widget.mostList[1]]}',
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Text(
                                                    '${_titleList[widget.mostList[2]]}',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    '${_triggerList[widget.mostList[2]]}',
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Text(
                                                    '${_titleList[widget.mostList[3]]}',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    '${_triggerList[widget.mostList[3]]}',
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Text(
                                                    '${_titleList[widget.mostList[4]]}',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    '${_triggerList[widget.mostList[4]]}',
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: (MediaQuery.of(context).size.width -
                                            88) /
                                            2,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 1,
                                              height: 258,
                                              color: Colors.black12,
                                            ),
                                            Stack(
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                          88) /
                                                          2 -
                                                          10,
                                                      color: Colors.black12,
                                                    ),
                                                    SizedBox(
                                                      height: 53,
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                          88) /
                                                          2 -
                                                          10,
                                                      color: Colors.black12,
                                                    ),
                                                    SizedBox(
                                                      height: 53,
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                          88) /
                                                          2 -
                                                          10,
                                                      color: Colors.black12,
                                                    ),
                                                    SizedBox(
                                                      height: 53,
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                          88) /
                                                          2 -
                                                          10,
                                                      color: Colors.black12,
                                                    ),
                                                    SizedBox(
                                                      height: 53,
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                          88) /
                                                          2 -
                                                          10,
                                                      color: Colors.black12,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      height: 12,
                                                      width: 15 * (widget.countList[widget.mostList[0]] > 9 ? 9 : widget.countList[widget.mostList[0]]).toDouble(),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .lightBlueAccent
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 42,
                                                    ),
                                                    Container(
                                                      height: 12,
                                                      width: 15 *
                                                          (widget.countList[widget.mostList[
                                                          1]] >
                                                              9
                                                              ? 9
                                                              : widget.countList[
                                                          widget.mostList[1]])
                                                              .toDouble(),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .lightBlueAccent
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 42,
                                                    ),
                                                    Container(
                                                      height: 12,
                                                      width: 15 *
                                                          (widget.countList[widget.mostList[
                                                          2]] >
                                                              9
                                                              ? 9
                                                              : widget.countList[
                                                          widget.mostList[2]])
                                                              .toDouble(),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .lightBlueAccent
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 42,
                                                    ),
                                                    Container(
                                                      height: 12,
                                                      width: 15 *
                                                          (widget.countList[widget.mostList[
                                                          3]] >
                                                              9
                                                              ? 9
                                                              : widget.countList[
                                                          widget.mostList[3]])
                                                              .toDouble(),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .lightBlueAccent
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 42,
                                                    ),
                                                    Container(
                                                      height: 12,
                                                      width: 15 *
                                                          (widget.countList[widget.mostList[
                                                          4]] >
                                                              9
                                                              ? 9
                                                              : widget.countList[
                                                          widget.mostList[4]])
                                                              .toDouble(),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .lightBlueAccent
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  '${widget.countList[widget.mostList[0]]}',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 38,
                                                ),
                                                Text(
                                                  '${widget.countList[widget.mostList[1]]}',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 38,
                                                ),
                                                Text(
                                                  '${widget.countList[widget.mostList[2]]}',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 38,
                                                ),
                                                Text(
                                                  '${widget.countList[widget.mostList[3]]}',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 38,
                                                ),
                                                Text(
                                                  '${widget.countList[widget.mostList[4]]}',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 33,
                              ),
                              Text(
                                widget.name + ' 님의 흡연욕구 분류',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 88,
                                height: 140,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: (MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                    88) /
                                                    2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          0, 10, 0, 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: <Widget>[
                                                          Text(
                                                            '${widget.percentList[0]}%',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 28,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                          SizedBox(
                                                            width: 11,
                                                          ),
                                                          Text(
                                                            '감정\n트리거',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                            ),
                                                            textAlign:
                                                            TextAlign.left,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: (MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                    88) /
                                                    2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          0, 10, 0, 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: <Widget>[
                                                          Text(
                                                            '${widget.percentList[1]}%',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 28,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                          SizedBox(
                                                            width: 11,
                                                          ),
                                                          Text(
                                                            '패턴\n트리거',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                            ),
                                                            textAlign:
                                                            TextAlign.left,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: (MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                    88) /
                                                    2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          0, 10, 0, 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: <Widget>[
                                                          Text(
                                                            '${widget.percentList[2]}%',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 28,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                          SizedBox(
                                                            width: 11,
                                                          ),
                                                          Text(
                                                            '사회\n트리거',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                            ),
                                                            textAlign:
                                                            TextAlign.left,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: (MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                    88) /
                                                    2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          0, 10, 0, 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: <Widget>[
                                                          Text(
                                                            '${widget.percentList[3]}%',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 28,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                            TextAlign.center,
                                                          ),
                                                          SizedBox(
                                                            width: 11,
                                                          ),
                                                          Text(
                                                            '금단\n트리거',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                            ),
                                                            textAlign:
                                                            TextAlign.left,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width - 100,
                                        height: 1,
                                        color: Colors.black12,
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        width: 1,
                                        height: 115,
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 280,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/homepage');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '끝내기',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
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
    );
  }
}
