import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shepherd/newsplash.dart';

import 'authentication.dart';
import 'breath4.dart';

class Breath3 extends StatefulWidget {
  const Breath3({Key? key, required this.name, required this.remainTime})
      : super(key: key);
  final String name;
  final int remainTime;

  @override
  _Breath3State createState() => _Breath3State();
}

class _Breath3State extends State<Breath3> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int breathtime = 0;

  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;
    await firestore
        .collection(uid)
        .doc("breathtime")
        .get()
        .then((DocumentSnapshot ds) {
      breathtime = int.parse(ds.get('data').toString());
    });

    return uid;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetch1(),
        builder:
            (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
//          if (snapshot.hasData == false) {
//            return NewSplash(name: widget.name);
//          }
          //error가 발생하게 될 경우 반환하게 되는 부분
//          else if (snapshot.hasError) {
//            return NewSplash(name: widget.name);
//          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
//          else {
            return Scaffold(
              body: Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.lightGreen,
                              Colors.blueGrey,
                            ],
                          )),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Center(
                              child: Text(
                                '잘하셨습니다!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Center(
                              child: Container(
                                color: Colors.transparent,
                                width: 122,
                                height: 122,
                                child: Text(
                                  '🎖',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 88,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(33.0, 0, 33.0, 0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    widget.name +
                                        '님께서는 ' +
                                        ((300 - widget.remainTime) / 60).toInt().toString() +
                                        '분 ' +
                                        ((300 - widget.remainTime) % 60).toString() +
                                        '초 동안\n호흡운동을 하셨습니다.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(33.0, 0, 33.0, 0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '앞으로 흡연욕구가 들때, 스트레스 받을 때, 불안 할 때 다시 오시면 호흡운동을 도와드리겠습니다.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(33.0, 0, 33.0, 0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '총 호흡운동 시간 : ' +
                                        ((breathtime + 300 - widget.remainTime) / 60)
                                            .toInt()
                                            .toString() +
                                        '분',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: ElevatedButton(
                                child: const Text(
                                  '다음',
                                  style: TextStyle(fontSize: 18),
                                ),
                                onPressed: () {
                                  firestore
                                      .collection(AuthenticationHelper().getUid())
                                      .doc("breathtime")
                                      .update({
                                    "data": breathtime + 300 - widget.remainTime,
                                  });
                                  //Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Breath4(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  fixedSize: const Size(99, 99),
                                  shape: const CircleBorder(),
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
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ),
            );
//          }
        });
  }
}
