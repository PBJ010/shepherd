import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/newsplash.dart';

import 'newstop.dart';

class Info14 extends StatefulWidget {
  const Info14({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  _Info14State createState() => _Info14State();
}

class _Info14State extends State<Info14> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int stopyear = 0;
  int stopmonth = 0;
  int stopday = 0;
  int stoptime = 0;
  int datetime = 0;

  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;
    await firestore
        .collection(uid)
        .doc("stopyear")
        .get()
        .then((DocumentSnapshot ds) {
      stopyear = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(uid)
        .doc("stopmonth")
        .get()
        .then((DocumentSnapshot ds) {
      stopmonth = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(uid)
        .doc("stopday")
        .get()
        .then((DocumentSnapshot ds) {
      stopday = int.parse(ds.get('data').toString());
    });

    await firestore
        .collection(uid)
        .doc("stoptime")
        .get()
        .then((DocumentSnapshot ds) {
      stoptime = int.parse(ds.get('data').toString());
    });
    datetime = DateTime.now().millisecondsSinceEpoch - stoptime > 0
        ? DateTime.now().millisecondsSinceEpoch - stoptime
        : 0;

    return uid;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetch1(),
      builder: (BuildContext context,
          AsyncSnapshot snapshot) {
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
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 33,
                          color: Colors.white,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 130,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 33,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                      child: Text(
                                        'Stop Day',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 33,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: Colors.indigo,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            widget.name + ' 님은',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            stopyear.toString() +
                                                '년 ' +
                                                stopmonth.toString() +
                                                '월 ' +
                                                stopday.toString() +
                                                '일',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 28,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            '부터 금연 중입니다',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 33,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 330,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '지금까지 총 금연한 시간',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 60,
                                          ),
                                          Text(
                                            (datetime / 86400000).toInt().toString() +
                                                '일',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 38,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            ((datetime % 86400000) / 3600000)
                                                .toInt()
                                                .toString() +
                                                '시간 ' +
                                                ((datetime % 3600000) / 60000)
                                                    .toInt()
                                                    .toString() +
                                                '분',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 28,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          NewStop(name: widget.name)),
                                                      (route) => false);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              shadowColor: Colors.transparent,
                                            ),
                                            child: Text(
                                              '새 금연 날짜 설정',
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                                    Navigator.of(context).pushNamedAndRemoveUntil(
                                        '/homepage', (route) => false);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepOrangeAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Text(
                                    '확인',
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
          );
        }
      },
    );
  }
}
