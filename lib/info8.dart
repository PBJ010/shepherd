import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/newsplash.dart';

class Info8 extends StatefulWidget {
  const Info8({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  _Info8State createState() => _Info8State();
}

class _Info8State extends State<Info8> {
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
  var _mostList = [0, 10, 6, 13, 11];
  var _countList = [
    5,
    1,
    2,
    3,
    4,
    5,
    2,
    7,
    8,
    9,
    2,
    1,
    12,
    1,
    14,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  var cause = [
    5,
    1,
    2,
    3,
    4,
    5,
    2,
    7,
    8,
    9,
    2,
    1,
    12,
    1,
    14,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  var cause_imsi = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23
  ];
  var _percentList = [13, 73, 0, 13];
  var _fourList = [0, 0, 0, 0];

  int startmonth = 0;
  int startday = 0;

  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;
    for (int i = 0; i < 24; i++) {
      await firestore
          .collection(uid)
          .doc("causelist$i")
          .get()
          .then((DocumentSnapshot ds) {
        _countList[i] = int.parse(ds.get('data').toString());
        cause[i] = int.parse(ds.get('data').toString());
      });
    }
    await firestore
        .collection(uid)
        .doc("startmonth")
        .get()
        .then((DocumentSnapshot ds) {
      startmonth = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(uid)
        .doc("startday")
        .get()
        .then((DocumentSnapshot ds) {
      startday = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(uid)
        .doc("trigger0")
        .get()
        .then((DocumentSnapshot ds) {
      _fourList[0] = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(uid)
        .doc("trigger1")
        .get()
        .then((DocumentSnapshot ds) {
      _fourList[1] = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(uid)
        .doc("trigger2")
        .get()
        .then((DocumentSnapshot ds) {
      _fourList[2] = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(uid)
        .doc("trigger3")
        .get()
        .then((DocumentSnapshot ds) {
      _fourList[3] = int.parse(ds.get('data').toString());
    });
    if ((_fourList[0] + _fourList[1] + _fourList[2] + _fourList[3]) != 0) {
      _percentList[0] = (_fourList[0] /
              (_fourList[0] + _fourList[1] + _fourList[2] + _fourList[3]) *
              100)
          .toInt();
      _percentList[1] = (_fourList[1] /
              (_fourList[0] + _fourList[1] + _fourList[2] + _fourList[3]) *
              100)
          .toInt();
      _percentList[2] = (_fourList[2] /
              (_fourList[0] + _fourList[1] + _fourList[2] + _fourList[3]) *
              100)
          .toInt();
      _percentList[3] = (_fourList[3] /
              (_fourList[0] + _fourList[1] + _fourList[2] + _fourList[3]) *
              100)
          .toInt();
    } else {
      _percentList[0] = 0;
      _percentList[1] = 0;
      _percentList[2] = 0;
      _percentList[3] = 0;
    }

    int n = 24;
    for (int i = n - 1; i > 0; i--) {
      // 0 ~ (i-1)까지 반복
      for (int j = 0; j < i; j++) {
        // j번째와 j+1번째의 요소가 크기 순이 아니면 교환
        if (cause[j] < cause[j + 1]) {
          int temp = cause[j];
          cause[j] = cause[j + 1];
          cause[j + 1] = temp;

          temp = cause_imsi[j];
          cause_imsi[j] = cause_imsi[j + 1];
          cause_imsi[j + 1] = temp;
        }
      }
    }
    _mostList[0] = cause_imsi[0];
    _mostList[1] = cause_imsi[1];
    _mostList[2] = cause_imsi[2];
    _mostList[3] = cause_imsi[3];
    _mostList[4] = cause_imsi[4];

    return uid;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetch1(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
          if (snapshot.hasData == false) {
            return NewSplash(name: widget.name);
          }
          //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return NewSplash(name: widget.name);
          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
          else {
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
                                        startmonth.toString() +
                                            '월 ' +
                                            startday.toString() +
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
                                        width:
                                            MediaQuery.of(context).size.width - 88,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.black12,
                                          ),
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 30, 0, 30),
                                          child: Row(
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
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: <Widget>[
                                                          Text(
                                                            '${_titleList[_mostList[0]]}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                          Text(
                                                            '${_triggerList[_mostList[0]]}',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                      child: Column(
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
                                                            '${_titleList[_mostList[1]]}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                          Text(
                                                            '${_triggerList[_mostList[1]]}',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                      child: Column(
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
                                                            '${_titleList[_mostList[2]]}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                          Text(
                                                            '${_triggerList[_mostList[2]]}',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                      child: Column(
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
                                                            '${_titleList[_mostList[3]]}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                          Text(
                                                            '${_triggerList[_mostList[3]]}',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                      child: Column(
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
                                                            '${_titleList[_mostList[4]]}',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
                                                          ),
                                                          Text(
                                                            '${_triggerList[_mostList[4]]}',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                            ),
                                                            textAlign:
                                                                TextAlign.center,
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
                                                              MainAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              height: 1,
                                                              width: (MediaQuery.of(
                                                                                  context)
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
                                                              width: (MediaQuery.of(
                                                                                  context)
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
                                                              width: (MediaQuery.of(
                                                                                  context)
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
                                                              width: (MediaQuery.of(
                                                                                  context)
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
                                                              width: (MediaQuery.of(
                                                                                  context)
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
                                                              MainAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              height: 12,
                                                              width: 15 *
                                                                  (_countList[_mostList[
                                                                                  0]] >
                                                                              9
                                                                          ? 9
                                                                          : _countList[
                                                                              _mostList[
                                                                                  0]])
                                                                      .toDouble(),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .lightBlueAccent
                                                                    .withOpacity(
                                                                        0.7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius.circular(
                                                                      10),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 42,
                                                            ),
                                                            Container(
                                                              height: 12,
                                                              width: 15 *
                                                                  (_countList[_mostList[
                                                                                  1]] >
                                                                              9
                                                                          ? 9
                                                                          : _countList[
                                                                              _mostList[
                                                                                  1]])
                                                                      .toDouble(),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .lightBlueAccent
                                                                    .withOpacity(
                                                                        0.7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius.circular(
                                                                      10),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 42,
                                                            ),
                                                            Container(
                                                              height: 12,
                                                              width: 15 *
                                                                  (_countList[_mostList[
                                                                                  2]] >
                                                                              9
                                                                          ? 9
                                                                          : _countList[
                                                                              _mostList[
                                                                                  2]])
                                                                      .toDouble(),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .lightBlueAccent
                                                                    .withOpacity(
                                                                        0.7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius.circular(
                                                                      10),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 42,
                                                            ),
                                                            Container(
                                                              height: 12,
                                                              width: 15 *
                                                                  (_countList[_mostList[
                                                                                  3]] >
                                                                              9
                                                                          ? 9
                                                                          : _countList[
                                                                              _mostList[
                                                                                  3]])
                                                                      .toDouble(),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .lightBlueAccent
                                                                    .withOpacity(
                                                                        0.7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius.circular(
                                                                      10),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 42,
                                                            ),
                                                            Container(
                                                              height: 12,
                                                              width: 15 *
                                                                  (_countList[_mostList[
                                                                                  4]] >
                                                                              9
                                                                          ? 9
                                                                          : _countList[
                                                                              _mostList[
                                                                                  4]])
                                                                      .toDouble(),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .lightBlueAccent
                                                                    .withOpacity(
                                                                        0.7),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius.circular(
                                                                      10),
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
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 3,
                                                        ),
                                                        Text(
                                                          '${_countList[_mostList[0]]}',
                                                          style: TextStyle(
                                                            color: Colors.black38,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 38,
                                                        ),
                                                        Text(
                                                          '${_countList[_mostList[1]]}',
                                                          style: TextStyle(
                                                            color: Colors.black38,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 38,
                                                        ),
                                                        Text(
                                                          '${_countList[_mostList[2]]}',
                                                          style: TextStyle(
                                                            color: Colors.black38,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 38,
                                                        ),
                                                        Text(
                                                          '${_countList[_mostList[3]]}',
                                                          style: TextStyle(
                                                            color: Colors.black38,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 38,
                                                        ),
                                                        Text(
                                                          '${_countList[_mostList[4]]}',
                                                          style: TextStyle(
                                                            color: Colors.black38,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                        width:
                                            MediaQuery.of(context).size.width - 88,
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
                                              padding:
                                                  EdgeInsets.fromLTRB(0, 10, 0, 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                        width:
                                                            (MediaQuery.of(context)
                                                                        .size
                                                                        .width -
                                                                    88) /
                                                                2,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                      0, 10, 0, 10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: <Widget>[
                                                                  Text(
                                                                    '${_percentList[0]}%',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize: 28,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 11,
                                                                  ),
                                                                  Text(
                                                                    '감정\n트리거',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black38,
                                                                      fontSize: 12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            (MediaQuery.of(context)
                                                                        .size
                                                                        .width -
                                                                    88) /
                                                                2,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                      0, 10, 0, 10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: <Widget>[
                                                                  Text(
                                                                    '${_percentList[1]}%',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize: 28,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 11,
                                                                  ),
                                                                  Text(
                                                                    '패턴\n트리거',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black38,
                                                                      fontSize: 12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
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
                                                        width:
                                                            (MediaQuery.of(context)
                                                                        .size
                                                                        .width -
                                                                    88) /
                                                                2,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                      0, 10, 0, 10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: <Widget>[
                                                                  Text(
                                                                    '${_percentList[2]}%',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize: 28,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 11,
                                                                  ),
                                                                  Text(
                                                                    '사회\n트리거',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black38,
                                                                      fontSize: 12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            (MediaQuery.of(context)
                                                                        .size
                                                                        .width -
                                                                    88) /
                                                                2,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                      0, 10, 0, 10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: <Widget>[
                                                                  Text(
                                                                    '${_percentList[3]}%',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize: 28,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 11,
                                                                  ),
                                                                  Text(
                                                                    '금단\n트리거',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black38,
                                                                      fontSize: 12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    100,
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
        });
  }
}
