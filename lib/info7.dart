import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/info10.dart';
import 'package:shepherd/info11.dart';
import 'package:shepherd/newsplash.dart';
import 'authentication.dart';
import 'dart:math';

import 'info12.dart';
import 'info8.dart';
import 'info9.dart';
import 'info88.dart';

class Info7 extends StatefulWidget {
  const Info7(
    this._smokingDesire, {
    Key? key,
    required this.name,
  }) : super(key: key);
  final int _smokingDesire;
  final String name;

  @override
  _Info7State createState() => _Info7State();
}

class _Info7State extends State<Info7> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  var _iconList = [
    '🍽',
    '🍷',
    '😮‍💨',
    '❤️',
    '😖',
    '😡',
    '🕖',
    '🚘',
    '😶',
    '😕',
    '🎉',
    '☕',
    '😳️',
    '🚞',
    '👨‍👩‍👧',
    '🏋️‍',
    '👷‍',
    '🧘‍',
    '🛌',
    '🍩',
    '😭',
    '🤕',
    '😩',
    '🚬',
  ];
  var _titleList = [
    '식사 후', //1
    '음주 후', //1
    '피곤', //0
    '성관계 후', //1
    '스트레스/걱정', //0
    '분노', //0
    '아침 시간', //1
    '운전', //1
    '지루함', //0
    '집중력 저하', //3
    '축하이벤트', //2
    '커피', //1
    '주변 권유', //2
    '야외활동', //1
    '가족', //2
    '운동 후', //1
    '작업 중', //1
    '휴식시간', //1
    '자기 전', //1
    '배고픔', //1
    '슬픔', //0
    '두통', //3
    '짜증', //3
    '흡연목격', //2
  ];
  var _kindList = [
    1,
    1,
    0,
    1,
    0,
    0,
    1,
    1,
    0,
    3,
    2,
    1,
    2,
    1,
    2,
    1,
    1,
    1,
    1,
    1,
    0,
    3,
    3,
    2,
  ];
  var mostList = [0, 10, 6, 13, 11];
  var _fourList = [0, 0, 0, 0];
  var percentList = [13, 73, 0, 13];
  var _degreeList1 = ['약함', '중간', '강함'];
  var _degreeList2 = ['약한 강도', '중간 강도', '강한 강도'];
  var cause = List<int>.filled(24, 0);
  List<int> cause_imsi = [
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
    23,
  ];
  var countList = [
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
        countList[i] = int.parse(ds.get('data').toString());         
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
    mostList[0] = cause_imsi[0];
    mostList[1] = cause_imsi[1];
    mostList[2] = cause_imsi[2];
    mostList[3] = cause_imsi[3];
    mostList[4] = cause_imsi[4];

    /*info88*/
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
      percentList[0] = (_fourList[0] /
          (_fourList[0] + _fourList[1] + _fourList[2] + _fourList[3]) *
          100)
          .toInt();
      percentList[1] = (_fourList[1] /
          (_fourList[0] + _fourList[1] + _fourList[2] + _fourList[3]) *
          100)
          .toInt();
      percentList[2] = (_fourList[2] /
          (_fourList[0] + _fourList[1] + _fourList[2] + _fourList[3]) *
          100)
          .toInt();
      percentList[3] = (_fourList[3] /
          (_fourList[0] + _fourList[1] + _fourList[2] + _fourList[3]) *
          100)
          .toInt();
    } else {
      percentList[0] = 0;
      percentList[1] = 0;
      percentList[2] = 0;
      percentList[3] = 0;
    }

    
    return uid;
  }

  @override
  void initState() {
    super.initState();
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
                        height: MediaQuery.of(context).size.height - 100,
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
                                      SizedBox(
                                        height: 33,
                                      ),
                                      Text(
                                        '당신의 흡연욕구는 주로\n이러한 것들에 의해 유발됩니다',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
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
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context).size.width - 88,
                                              height: 100,
                                              child: Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(18, 10, 10, 18),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(0),
                                                    primary: Colors.white,
                                                    shadowColor: Colors.transparent,
                                                  ),
                                                  onPressed: () {
                                                    switch (_kindList[mostList[0]]) {
                                                      case 0:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) => Info9(
                                                                    name: widget.name)));
                                                        break;
                                                      case 1:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info10(
                                                                        name:
                                                                        widget.name)));
                                                        break;
                                                      case 2:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info11(
                                                                        name:
                                                                        widget.name)));
                                                        break;
                                                      case 3:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info12(
                                                                        name:
                                                                        widget.name)));
                                                        break;
                                                    }
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                    children: <Widget>[
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          _iconList[mostList[0]],
                                                          style: TextStyle(
                                                            fontSize: 44,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 27,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Text(
                                                            _titleList[mostList[0]],
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 22,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text(
                                                            '대처방법 보기',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment.centerRight,
                                                          child: Icon(
                                                            Icons.arrow_forward_ios,
                                                            color: Colors.black38,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width - 88,
                                              color: Colors.black12,
                                              height: 1,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width - 88,
                                              height: 100,
                                              child: Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(18, 10, 10, 18),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(0),
                                                    primary: Colors.white,
                                                    shadowColor: Colors.transparent,
                                                  ),
                                                  onPressed: () {
                                                    switch (_kindList[mostList[1]]) {
                                                      case 0:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) => Info9(
                                                                    name: widget.name)));
                                                        break;
                                                      case 1:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info10(
                                                                        name:
                                                                        widget.name)));
                                                        break;
                                                      case 2:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info11(
                                                                        name:
                                                                        widget.name)));
                                                        break;
                                                      case 3:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info12(
                                                                        name:
                                                                        widget.name)));
                                                        break;
                                                    }
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                    children: <Widget>[
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          _iconList[mostList[1]],
                                                          style: TextStyle(
                                                            fontSize: 44,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 27,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Text(
                                                            _titleList[mostList[1]],
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 22,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text(
                                                            '대처방법 보기',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment.centerRight,
                                                          child: Icon(
                                                            Icons.arrow_forward_ios,
                                                            color: Colors.black38,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width - 88,
                                              color: Colors.black12,
                                              height: 1,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width - 88,
                                              height: 100,
                                              child: Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(18, 10, 10, 18),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(0),
                                                    primary: Colors.white,
                                                    shadowColor: Colors.transparent,
                                                  ),
                                                  onPressed: () {
                                                    switch (_kindList[mostList[2]]) {
                                                      case 0:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) => Info9(
                                                                    name: widget.name)));
                                                        break;
                                                      case 1:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info10(
                                                                        name:
                                                                        widget.name)));
                                                        break;
                                                      case 2:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info11(
                                                                        name:
                                                                        widget.name)));
                                                        break;
                                                      case 3:
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info12(
                                                                        name:
                                                                        widget.name)));
                                                        break;
                                                    }
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                    children: <Widget>[
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          _iconList[mostList[2]],
                                                          style: TextStyle(
                                                            fontSize: 44,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 27,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Text(
                                                            _titleList[mostList[2]],
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 22,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text(
                                                            '대처방법 보기',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment.centerRight,
                                                          child: Icon(
                                                            Icons.arrow_forward_ios,
                                                            color: Colors.black38,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 33,
                                      ),
                                      Text(
                                        '흡연욕구 강도',
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
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
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context).size.width - 88,
                                              height: 100,
                                              child: Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(18, 10, 10, 18),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(0),
                                                    primary: Colors.white,
                                                    shadowColor: Colors.transparent,
                                                  ),
                                                  onPressed: () {},
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                    children: <Widget>[
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Icon(
                                                          Icons.panorama_fish_eye,
                                                          size: 44,
                                                          color: Colors.lightGreen,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 27,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Text(
                                                            _degreeList1[
                                                            widget._smokingDesire],
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 22,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          Text(
                                                            '${_degreeList2[widget._smokingDesire]}의 흡연욕구를 경험하셨습니다',
                                                            style: TextStyle(
                                                              color: Colors.black38,
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Info88(name: widget.name, cause: cause, mostList: mostList, percentList: percentList, countList: countList, startmonth: startmonth, startday: startday,)));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepOrangeAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  '나의 주요 흡연욕구 보기',
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
