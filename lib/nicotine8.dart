import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/program1.dart';
import 'authentication.dart';
import 'link1.dart';
import 'link11.dart';

class Nicotine8 extends StatefulWidget {
  const Nicotine8(this.result, {Key? key, required this.name,}) : super(key: key);
  final int result;
  final String name;

  @override
  _Nicotine8State createState() => _Nicotine8State();
}

class _Nicotine8State extends State<Nicotine8> {
  var face = [Icons.mood, Icons.mood, Icons.mood_bad];
  var ment = ['약한 정도', '중간 정도', '중증도'];
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
                  height: MediaQuery.of(context).size.height - 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),
                        Icon(
                          face[widget.result],
                          size: 100,
                        ),
                        SizedBox(
                          height: 101,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.name + '님의 니코틴 의존도:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              ment[widget.result],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            Padding(
                              padding:
                              EdgeInsets.fromLTRB(60, 0, 60, 0),
                              child: Text(
                                '금연을 위해 ' + widget.name + '님께 다음을 추천드립니다:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Transform.rotate(
                              angle: 45 * math.pi / 180,
                              child: Icon(
                                Icons.push_pin_outlined,
                                size: 22,
                              ),
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 110,
                              child: Text(
                                '앞으로 1~2주 기간 동안에 서서히 담배를 끊거나, 한번에 금연을 하세요.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Transform.rotate(
                              angle: 45 * math.pi / 180,
                              child: Icon(
                                Icons.push_pin_outlined,
                                size: 22,
                              ),
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 110,
                              child: Text(
                                '니코틴 패치, 사탕, 껌을 이용하여 흡연 욕구를 줄이고 증상을 경감시킬 수 있습니다.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              width: 33,
                            ),
                            SizedBox(
                              height: 22,
                              child: Align(
                                alignment: Alignment(-1.0, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shadowColor: Colors.transparent,
                                    padding: EdgeInsets.all(0),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Link11(name: widget.name)));
                                  },
                                  child: Text('자세히 알아보기',
                                      style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 11,
                                      )),
                                ),
                              ),
                            ),
                          ],
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Program1(name: widget.name)));
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
