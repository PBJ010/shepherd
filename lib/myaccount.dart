import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/loginpage.dart';
import 'package:shepherd/newsplash.dart';
import 'authentication.dart';
import 'loginpage.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final oldController = TextEditingController();
  final newController = TextEditingController();
  final sureController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int usercount = 1;

  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;
    await firestore
        .collection("master")
        .doc("user")
        .get()
        .then((DocumentSnapshot ds) {
      usercount = int.parse(ds.get('data').toString());
    });

    return uid;
  }

  Future<String> _deleter() async {
    String uid = (_auth.currentUser)!.uid;
    firestore
        .collection(AuthenticationHelper().getUid())
        .get()
        .then((snapshot) async {
      for (DocumentSnapshot ds in snapshot.docs) {
        await ds.reference.delete();
      }
    });

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
                                  height: MediaQuery.of(context).size.height - 260,
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
                                          '계정 정보',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(37, 18, 37, 18),
                                          child: Text(
                                            '계정 정보를 확인하고 수정하세요',
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
                                            color:
                                                Colors.lightBlue.withOpacity(0.1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7)),
                                          ),
                                          width: MediaQuery.of(context).size.width -
                                              88,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 10, 15, 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '이전 비밀번호',
                                                      style: TextStyle(
                                                        color: Colors.lightBlue,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                    TextField(
                                                      obscureText: true,
                                                      controller: oldController,
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
                                            color:
                                                Colors.lightBlue.withOpacity(0.1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7)),
                                          ),
                                          width: MediaQuery.of(context).size.width -
                                              88,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 10, 15, 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '새 비밀번호',
                                                      style: TextStyle(
                                                        color: Colors.lightBlue,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                    TextField(
                                                      obscureText: true,
                                                      controller: newController,
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
                                            color:
                                                Colors.lightBlue.withOpacity(0.1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7)),
                                          ),
                                          width: MediaQuery.of(context).size.width -
                                              88,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 10, 15, 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '새 비밀번호 확인',
                                                      style: TextStyle(
                                                        color: Colors.lightBlue,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                    TextField(
                                                      obscureText: true,
                                                      controller: sureController,
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
                                          if (newController.text ==
                                              sureController.text) {
                                            AuthenticationHelper().changePassword(
                                                oldController.text,
                                                sureController.text,
                                                context);
                                            oldController.text = '';
                                            newController.text = '';
                                            sureController.text = '';
                                          } else {
                                            sureController.text = '';
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.indigo,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: Text(
                                          '비밀번호 변경하기',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(
                                      width: 280,
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          AuthenticationHelper().signOut().then(
                                              (_) => Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/loginpage',
                                                      (route) => false));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.lightGreen,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: Text(
                                          '로그아웃하기',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(
                                      width: 280,
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _deleter();
                                          firestore
                                              .collection("master")
                                              .doc(AuthenticationHelper().getUid())
                                              .delete();
                                          firestore
                                              .collection("master")
                                              .doc("user")
                                              .update({
                                            "data": usercount - 1,
                                          });
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  '/loginpage', (route) => false);
                                          AuthenticationHelper()
                                              .withdrawalAccount();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: Text(
                                          '탈퇴하기',
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
        });
  }
}
