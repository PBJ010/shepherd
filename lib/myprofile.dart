import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final nameController = TextEditingController();
  final birthController = TextEditingController();
  final phoneController = TextEditingController();
  num _sex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
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
                                              '사용자 이름',
                                              style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextField(
                                              controller: nameController,
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
                                              '생년월일',
                                              style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextField(
                                              controller: birthController,
                                              decoration: InputDecoration(
                                                hintText: 'YYMMDD',
                                              ),
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
                                              '성별',
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
                                                  groupValue: _sex,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _sex = int.parse(
                                                          (value!).toString());
                                                    });
                                                  },
                                                ),
                                                Text(
                                                  '남',
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
                                                  groupValue: _sex,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _sex = int.parse(
                                                          (value!).toString());
                                                    });
                                                  },
                                                ),
                                                Text(
                                                  '여',
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
                                              '번호',
                                              style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextField(
                                              controller: phoneController,
                                            ),
                                          ],
                                        ),
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
                                  Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                                  firestore.collection(AuthenticationHelper().getUid()).doc("name").update({'data': nameController.text,});
                                  firestore.collection(AuthenticationHelper().getUid()).doc("birth").update({'data': birthController.text,});
                                  firestore.collection(AuthenticationHelper().getUid()).doc("sex").update({'data': _sex,});
                                  firestore.collection(AuthenticationHelper().getUid()).doc("phone").update({'data': phoneController.text,});
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.indigo,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  '완료',
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
    );
  }
}
