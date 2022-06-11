import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
import 'info66.dart';

class Info55 extends StatefulWidget {
  const Info55({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Info55State createState() => _Info55State();
}

class _Info55State extends State<Info55> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  var cause = List<int>.filled(24, 0);
  var _btn = List<bool>.filled(24, true);
  var kind = List<int>.filled(4,0);
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



  void getList(String uid, int index) {
    firestore.collection(uid)
        .doc("causelist$index")
        .get()
        .then((DocumentSnapshot ds) {
      cause[index]=int.parse(ds.get('data').toString());
    });

  }
  @override
  void initState() {
    super.initState();
    String uid = (_auth.currentUser)!.uid;
    for(int i=0;i<24;i++){
      getList(uid, i);
    }
    firestore.collection(uid)
        .doc("anothertrigger0")
        .get()
        .then((DocumentSnapshot ds) {
      kind[0]=int.parse(ds.get('data').toString());
    });
    firestore.collection(uid)
        .doc("anothertrigger1")
        .get()
        .then((DocumentSnapshot ds) {
      kind[1]=int.parse(ds.get('data').toString());
    });
    firestore.collection(uid)
        .doc("anothertrigger2")
        .get()
        .then((DocumentSnapshot ds) {
      kind[2]=int.parse(ds.get('data').toString());
    });
    firestore.collection(uid)
        .doc("anothertrigger3")
        .get()
        .then((DocumentSnapshot ds) {
      kind[3]=int.parse(ds.get('data').toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height-140,
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
                                widget.name+'님이 흡연을 한 이유들 중 가장 큰 것부터 순서대로 클릭해주세요.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 33,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Visibility(
                                    visible: _btn[0],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[0] = !_btn[0];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🍽',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '식사 후',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[0],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[0] = !_btn[0];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🍽',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '식사 후',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[1],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[1] = !_btn[1];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🍷',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '음주 후',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[1],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[1] = !_btn[1];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🍷',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '음주 후',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[2],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[2] = !_btn[2];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😮‍💨',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '피곤',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[2],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[2] = !_btn[2];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😮‍💨',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '피곤',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Visibility(
                                    visible: _btn[3],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[3] = !_btn[3];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '❤️',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '성관계 후',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[3],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[3] = !_btn[3];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '❤️',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '성관계 후',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[4],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[4] = !_btn[4];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '️😖',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '스트레스/걱정',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[4],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[4] = !_btn[4];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😖',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '스트레스/걱정',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[5],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[5] = !_btn[5];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😡',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '분노',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[5],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[5] = !_btn[5];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😡',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '분노',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Visibility(
                                    visible: _btn[6],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[6] = !_btn[6];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🕖',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '아침 시간',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[6],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[6] = !_btn[6];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🕖',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '아침 시간',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[7],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[7] = !_btn[7];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🚘',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '운전',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[7],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[7] = !_btn[7];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🚘',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '운전',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[8],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[8] = !_btn[8];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😶',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '지루함',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[8],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[8] = !_btn[8];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😶',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '지루함',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Visibility(
                                    visible: _btn[9],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[9] = !_btn[9];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😕',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '집중력 저하',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[9],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[9] = !_btn[9];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😕',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '집중력 저하',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[10],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[10] = !_btn[10];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🎉',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '축하 이벤트',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[10],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[10] = !_btn[10];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🎉',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '축하 이벤트',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[11],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[11] = !_btn[11];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '☕️',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '커피',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[11],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[11] = !_btn[11];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '☕️',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '커피',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Visibility(
                                    visible: _btn[12],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[12] = !_btn[12];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😳️',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '주변 권유',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[12],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[12] = !_btn[12];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😳️',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '주변 권유',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[13],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[13] = !_btn[13];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🚞',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '야외활동',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[13],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[13] = !_btn[13];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🚞',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '야외활동',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[14],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[14] = !_btn[14];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '👨‍👩‍👧',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '가족',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[14],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[14] = !_btn[14];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '👨‍👩‍👧',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '가족',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Visibility(
                                    visible: _btn[15],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[15] = !_btn[15];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🏋️‍',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '운동 후',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[15],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[15] = !_btn[15];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🏋️‍',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '운동 후',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[16],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[16] = !_btn[16];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '👩‍💻',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '작업 중',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[16],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[16] = !_btn[16];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '👷‍',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '작업 중',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[17],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[17] = !_btn[17];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🧘‍',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '휴식시간',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[17],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[17] = !_btn[17];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🧘‍',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '휴식시간',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Visibility(
                                    visible: _btn[18],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[18] = !_btn[18];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🛌',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '자기 전',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[18],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[18] = !_btn[18];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🛌',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '자기 전',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[19],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[19] = !_btn[19];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🍩',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '배고픔',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[19],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[19] = !_btn[19];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🍩',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '배고픔',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[20],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[20] = !_btn[20];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😭',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '슬픔',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[20],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[20] = !_btn[20];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😭',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '슬픔',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Visibility(
                                    visible: _btn[21],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[21] = !_btn[21];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🤕',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '두통',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[21],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[21] = !_btn[21];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🤕',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '두통',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[22],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[22] = !_btn[22];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😩',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '짜증',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[22],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[22] = !_btn[22];
                                        });
                                      },
                                      child: Container(
                                        width: 80,
                                        color: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '😩',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '짜증',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Visibility(
                                    visible: _btn[23],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[23] = !_btn[23];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🚬',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '흡연목격',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !_btn[23],
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        padding: EdgeInsets.fromLTRB(9, 10, 9, 10),
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _btn[23] = !_btn[23];
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: 80,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '🚬',
                                              style: TextStyle(
                                                fontSize: 44,
                                              ),
                                            ),
                                            Text(
                                              '흡연목격',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info66(name: widget.name)));
                          for(int i=0;i<24;i++){
                            if (!_btn[i]==true){
                              firestore.collection((_auth.currentUser)!.uid).doc("anothercauselist$i").update({"data":cause[i]+1});
                              kind[_kindList[i]] = kind[_kindList[i]]+1;
                            }
                          }
                          firestore.collection((_auth.currentUser)!.uid).doc("anothertrigger0").update({"data":kind[0]});
                          firestore.collection((_auth.currentUser)!.uid).doc("anothertrigger1").update({"data":kind[1]});
                          firestore.collection((_auth.currentUser)!.uid).doc("anothertrigger2").update({"data":kind[2]});
                          firestore.collection((_auth.currentUser)!.uid).doc("anothertrigger3").update({"data":kind[3]});
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '다음',
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
