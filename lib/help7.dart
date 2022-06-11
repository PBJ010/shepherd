import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'authentication.dart';
import 'info55.dart';

class Help7 extends StatefulWidget {
  const Help7({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<Help7> createState() => _Help7State();
}

class _Help7State extends State<Help7> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height - 120,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(height:33,),
                              Text(
                                '🧐',
                                style: TextStyle(
                                  fontSize: 66,
                                ),
                              ),
                              SizedBox(height:33,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 22,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text:
                                          '어떤 점이 힘들었는지 ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'SHEPHERD에게 알려주세요.',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ])),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text:
                                          '저희가 그것을 바탕으로 '+widget.name+'님의 금연을 도와드리겠습니다.',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: <TextSpan>[
                                          ])),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text:
                                          '우선, ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '흡연했던 상황',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '에 대해 자세히 파악해볼 필요가 있습니다.',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ])),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text:
                                          ': ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '누구와 ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '있었는지, ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '무엇을 ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '하고 있었는지, '+widget.name+'님이 ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '어떤 기분',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '이었는지 떠올려보세요.',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ])),
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info55(name: widget.name),));
                                DateTime _selectedDay = DateTime.now();
                                firestore.collection(AuthenticationHelper().getUid()).doc("stopyear").update({'data': _selectedDay.year,});
                                firestore.collection(AuthenticationHelper().getUid()).doc("stopmonth").update({'data': _selectedDay.month,});
                                firestore.collection(AuthenticationHelper().getUid()).doc("stopday").update({'data': _selectedDay.day,});
                                firestore.collection(AuthenticationHelper().getUid()).doc("stoptime").update({'data': _selectedDay.millisecondsSinceEpoch,});
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
            )),
      ),
    );
  }
}
