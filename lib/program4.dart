import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/program5.dart';
import 'authentication.dart';
class Program4 extends StatefulWidget {
  const Program4({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _Program4State createState() => _Program4State();
}

class _Program4State extends State<Program4> {
  final ageController = TextEditingController();
  final causeController = TextEditingController();
  num _kind = 0;
  num _method = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                              Icons.book_rounded,
                              size: 100,
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            Text(
                              '정보 입력',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(37, 18, 37, 18),
                              child: Text(
                                '개인별 맞춤형 금연 솔루션을 위한 기본 정보를 입력해 주세요.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              width: MediaQuery.of(context).size.width - 88,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '담배를 피기 시작한 연령',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextField(
                                          controller: ageController,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              width: MediaQuery.of(context).size.width - 88,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '담배 종류',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        width: 120,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              fillColor:
                                              MaterialStateColor.resolveWith(
                                                    (state) => Colors.lightBlue,
                                              ),
                                              value: 0,
                                              groupValue: _kind,
                                              onChanged: (value) {
                                                setState(() {
                                                  _kind = int.parse(
                                                      (value!).toString());
                                                });
                                              },
                                            ),
                                            Text(
                                              '연초',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        width: 120,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              fillColor:
                                              MaterialStateColor.resolveWith(
                                                    (state) => Colors.lightBlue,
                                              ),
                                              value: 1,
                                              groupValue: _kind,
                                              onChanged: (value) {
                                                setState(() {
                                                  _kind = int.parse(
                                                      (value!).toString());
                                                });
                                              },
                                            ),
                                            Text(
                                              '전자담배',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
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
                            SizedBox(
                              height: 11,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              width: MediaQuery.of(context).size.width - 88,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '금연 동기',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextField(
                                          controller: causeController,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              width: MediaQuery.of(context).size.width - 88,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '약물요법 사용을 원하시나요?',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        width: 120,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              fillColor:
                                              MaterialStateColor.resolveWith(
                                                    (state) => Colors.lightBlue,
                                              ),
                                              value: 0,
                                              groupValue: _method,
                                              onChanged: (value) {
                                                setState(() {
                                                  _method = int.parse(
                                                      (value!).toString());
                                                });
                                              },
                                            ),
                                            Text(
                                              '예',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        width: 120,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              fillColor:
                                              MaterialStateColor.resolveWith(
                                                    (state) => Colors.lightBlue,
                                              ),
                                              value: 1,
                                              groupValue: _method,
                                              onChanged: (value) {
                                                setState(() {
                                                  _method = int.parse(
                                                      (value!).toString());
                                                });
                                              },
                                            ),
                                            Text(
                                              '아니오',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Program5(name: widget.name)));
                              firestore.collection(AuthenticationHelper().getUid()).doc("age").set({'data': ageController.text,});
                              firestore.collection(AuthenticationHelper().getUid()).doc("kind").set({'data': _kind,});
                              firestore.collection(AuthenticationHelper().getUid()).doc("cause").set({'data': causeController.text,});
                              if (causeController.text==""){
                                firestore.collection(AuthenticationHelper().getUid()).doc("statemessage").set({"data": "SHEPHERD와 함께 금연을 시작하세요!",});
                              } else {
                                firestore.collection(AuthenticationHelper().getUid()).doc("statemessage").set({"data": causeController.text,});
                              }


                              firestore.collection(AuthenticationHelper().getUid()).doc("method").set({'data': _method,});

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
        ),
      ),
    );
  }
}
