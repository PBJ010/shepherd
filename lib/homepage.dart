import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/note_screen.dart';
import 'package:shepherd/setting.dart';
import 'package:shepherd/tool1.dart';
import 'package:shepherd/tool4.dart';
import 'package:shepherd/user_image2.dart';
import 'authentication.dart';
import 'body1.dart';
import 'editprofile.dart';
import 'info1.dart';
import 'info2.dart';
import 'mission1.dart';
import 'newsplash.dart';
import 'newstop.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String name = '';
  int stopmonth = 0;
  int stopday = 0;
  int usercount = 0;
  String title = '';
  String content1 = '';
  String content2 = '';
  String content3 = '';
  String content4 = '';
  String content5 = '';
  String content6 = '';
  String content7 = '';
  String statemessage = '';
  String contenttime = '';
  int challengetime = 0;
  bool challengeflag = false;
  String imageUrl = '';

  Future<String> _fetch1() async {
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("challengetime")
        .get()
        .then((DocumentSnapshot ds) {
      challengetime = int.parse(ds.get('data').toString());
    });
    challengeflag = (DateTime.now().millisecondsSinceEpoch / 86400000).toInt() -
                (challengetime / 86400000).toInt() !=
            0
        ? true
        : false;

    await firestore
        .collection("master")
        .doc("user")
        .get()
        .then((DocumentSnapshot ds) {
      usercount = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("name")
        .get()
        .then((DocumentSnapshot ds) {
      name = ds.get('data').toString();
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("stopmonth")
        .get()
        .then((DocumentSnapshot ds) {
      stopmonth = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("stopday")
        .get()
        .then((DocumentSnapshot ds) {
      stopday = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("statemessage")
        .get()
        .then((DocumentSnapshot ds) {
      statemessage = ds.get('data').toString();
    });
    //await Future.delayed(Duration(seconds: 2));

    switch ((DateTime.now().day % 10) + 1) {
      case 1:
        await firestore
            .collection("master")
            .doc("mission1")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          contenttime = ds.get('time').toString();
        });
        break;
      case 2:
        await firestore
            .collection("master")
            .doc("mission2")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          content2 = ds.get('content2').toString();
          content1 = content1 + name + content2;
          contenttime = ds.get('time').toString();
        });
        break;
      case 3:
        await firestore
            .collection("master")
            .doc("mission3")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          content2 = ds.get('content2').toString();
          content1 = content1 + '\n' + content2;
          contenttime = ds.get('time').toString();
        });
        break;
      case 4:
        await firestore
            .collection("master")
            .doc("mission4")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          contenttime = ds.get('time').toString();
        });
        break;
      case 5:
        await firestore
            .collection("master")
            .doc("mission5")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          content2 = ds.get('content2').toString();
          contenttime = ds.get('time').toString();
        });
        break;
      case 6:
        await firestore
            .collection("master")
            .doc("mission6")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          contenttime = ds.get('time').toString();
        });
        break;
      case 7:
        await firestore
            .collection("master")
            .doc("mission7")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          content2 = ds.get('content2').toString();
          content3 = ds.get('content3').toString();
          content4 = ds.get('content4').toString();
          content5 = ds.get('content5').toString();
          content6 = ds.get('content6').toString();
          content7 = ds.get('content7').toString();
          contenttime = ds.get('time').toString();
        });
        break;
      case 8:
        await firestore
            .collection("master")
            .doc("mission8")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          content2 = ds.get('content2').toString();
          content3 = ds.get('content3').toString();
          contenttime = ds.get('time').toString();
        });
        break;
      case 9:
        await firestore
            .collection("master")
            .doc("mission9")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          content2 = ds.get('content2').toString();
          content3 = ds.get('content3').toString();
          content4 = ds.get('content4').toString();
          contenttime = ds.get('time').toString();
        });
        break;
      case 10:
        await firestore
            .collection("master")
            .doc("mission10")
            .get()
            .then((DocumentSnapshot ds) {
          title = ds.get('title').toString();
          content1 = ds.get('content1').toString();
          contenttime = ds.get('time').toString();
        });
        break;
    }

    return name;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetch1(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
          if (snapshot.hasData == false) {
            return NewSplash(name: name);
          }
          //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return NewSplash(name: name);
          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
          else {
            return Scaffold(
              body: Center(
                child: Container(
                    color: const Color(0xffFAFCFD),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height - 120,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.indigo,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 48,
                                      ),
                                      Text(
                                        'SHEPHERD',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 22,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 11,
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    NewStop(
                                                                        name: name)));
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        elevation: 0.0,
                                                        shadowColor:
                                                        Colors.transparent,
                                                        padding:
                                                        const EdgeInsets.all(0),
                                                      ),
                                                      child: Icon(
                                                        Icons.event,
                                                        color: Colors.white,
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 11,
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                        141,
                                                    child: SingleChildScrollView(
                                                      scrollDirection:
                                                      Axis.horizontal,
                                                      child: Text(
                                                        name +
                                                            '님의 금연 시작일 : ' +
                                                            stopmonth.toString() +
                                                            '월 ' +
                                                            stopday.toString() +
                                                            '일',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 11,
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Setting(
                                                                        name: name)));
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        elevation: 0.0,
                                                        shadowColor:
                                                        Colors.transparent,
                                                        padding:
                                                        const EdgeInsets.all(0),
                                                      ),
                                                      child: Icon(
                                                        Icons.account_circle,
                                                        color: Colors.white,
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Tool4(
                                                                        name: name)));
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        elevation: 0.0,
                                                        shadowColor:
                                                        Colors.transparent,
                                                        padding:
                                                        const EdgeInsets.all(0),
                                                      ),
                                                      child: Icon(
                                                        Icons.info,
                                                        color: Colors.white,
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 11,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 11,
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 11,
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                  height: 30,
                                                  child: UserImage2(
                                                      onFileChanged: (imageUrl) {
                                                        setState(() {
                                                          this.imageUrl = imageUrl;
                                                        });
                                                      }),
                                                ),
                                                SizedBox(
                                                  width: 11,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                      66,
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                      Axis.horizontal,
                                                      child: Text(
                                                        statemessage,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      )),
                                                ),
                                              ]),
                                          SizedBox(
                                            height: 11,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                width: 11,
                                              ),
                                              SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewSplash(name: name),),);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    elevation: 0.0,
                                                    shadowColor: Colors.transparent,
                                                    padding: const EdgeInsets.all(0),
                                                  ),
                                                  child: Icon(
                                                    Icons.people_outline,
                                                    color: Colors.white,
                                                    size: 22,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 11,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                    60,
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text(
                                                    '현재 ' +
                                                        usercount.toString() +
                                                        '명의 사람들이 ' +
                                                        name +
                                                        '님과 함께 금연 중입니다',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 11),
                                          Stack(
                                              children: <Widget>[
                                                Column(
                                                    children: <Widget>[
                                                      SizedBox(height: 112),
                                                      Container(
                                                        width: MediaQuery.of(context).size.width,
                                                        color: const Color(0xffFAFCFD),
                                                        child: SizedBox(height: 147),
                                                      ),
                                                    ]
                                                ),
                                                Column(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                        EdgeInsets.fromLTRB(40, 7, 40, 0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(18),
                                                              topRight: Radius.circular(18),
                                                              bottomLeft: Radius.circular(18),
                                                              bottomRight: Radius.circular(18),
                                                            ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.black12,
                                                                blurRadius: 1.0,
                                                                spreadRadius: 1.0,
                                                                offset: Offset(0, 3),
                                                              ),
                                                            ],
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 11,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.start,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    width: 22,
                                                                  ),
                                                                  Icon(
                                                                    Icons.pets,
                                                                    color: Colors.black,
                                                                    size: 25,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 22,
                                                                  ),
                                                                  Text(
                                                                    '오늘의 과제',
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 25,
                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: !challengeflag,
                                                                    child: Expanded(
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.end,
                                                                        children: <Widget>[
                                                                          Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                            Colors.lightGreen,
                                                                            size: 25,
                                                                          ),
                                                                          SizedBox(
                                                                            width: 22,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 22,
                                                              ),
                                                              Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.start,
                                                                  children: <Widget>[
                                                                    SizedBox(
                                                                      width: 22,
                                                                    ),
                                                                    Visibility(
                                                                      visible: challengeflag,
                                                                      child: Text(
                                                                        title,
                                                                        style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: 18,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Visibility(
                                                                      visible: !challengeflag,
                                                                      child: Text(
                                                                        '오늘의 과제를 완료하였습니다!',
                                                                        style: TextStyle(
                                                                          color: Colors.black45,
                                                                          fontSize: 18,
                                                                        ),
                                                                        textAlign:
                                                                        TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ]),
                                                              Visibility(
                                                                visible: challengeflag,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.start,
                                                                  children: <Widget>[
                                                                    Container(
                                                                      height: 88,
                                                                      child: Padding(
                                                                        padding:
                                                                        EdgeInsets.fromLTRB(25, 11, 25, 11),
                                                                        child: Text(
                                                                          content1,
                                                                          style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontSize: 12,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 11,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 250,
                                                                      height: 30,
                                                                      child: ElevatedButton(
                                                                        onPressed: () {
                                                                          Navigator.of(context).push(
                                                                              MaterialPageRoute(
                                                                                  builder: (context) =>
                                                                                      Mission1(
                                                                                          name:
                                                                                          name)));
                                                                        },
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                          Colors.orange,
                                                                          shape:
                                                                          RoundedRectangleBorder(
                                                                            borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                18),
                                                                          ),
                                                                        ),
                                                                        child: Text("시작",
                                                                            style: TextStyle(
                                                                              color:
                                                                              Colors.white,
                                                                              fontSize: 15,
                                                                            )),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 11,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Visibility(
                                                                visible: !challengeflag,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.start,
                                                                  children: <Widget>[
                                                                    Container(
                                                                      height: 129,
                                                                      child: Image.asset(
                                                                        'repo/images/success.png',
                                                                        fit: BoxFit.contain,
                                                                        height: 129,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 11,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                )
                                              ]
                                          ),
                                        ],
                                      ),
                                    ]
                                  ),
                                ),
                                Container(
                                  color: const Color(0xffFAFCFD),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 22,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 7, 30, 0),
                                        child: SizedBox(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(name: name)));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0.0,
                                              shadowColor: Colors.transparent,
                                              padding: const EdgeInsets.all(0),
                                              primary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(18),
                                                  ),
                                                  border: Border.all(
                                                    color: Colors.black12,
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 18,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      Text(
                                                        '금연일기 쓰기',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      Text(
                                                        '나만의 금연 과정을 기록해보세요',
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Icon(
                                                        Icons
                                                            .collections_bookmark,
                                                        size: 30,
                                                        color: Colors.black38,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 7, 30, 0),
                                        child: SizedBox(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed('/alarm');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0.0,
                                              shadowColor: Colors.transparent,
                                              padding: const EdgeInsets.all(0),
                                              primary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(18),
                                                  ),
                                                  border: Border.all(
                                                    color: Colors.black12,
                                                  )),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 18,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      Text(
                                                        '알람 설정',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      Text(
                                                        '많이 피는 시간대에 알람을 설정해보세요',
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Icon(
                                                        Icons.schedule,
                                                        size: 30,
                                                        color: Colors.black38,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: const Color(0xffFAFCFD),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                shadowColor: Colors.transparent,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                  Icon(
                                                    Icons.home,
                                                    color: Colors.black,
                                                    size: 25,
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text('    홈    ',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                shadowColor: Colors.transparent,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                  Icon(
                                                    Icons.graphic_eq,
                                                    color: Colors.black,
                                                    size: 25,
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text('진행상황',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                shadowColor: Colors.transparent,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                  Icon(
                                                    Icons.brightness_1_outlined,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text('흡연욕구',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                shadowColor: Colors.transparent,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                  Icon(
                                                    Icons.library_books,
                                                    color: Colors.black,
                                                    size: 25,
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text('  도구  ',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                shadowColor: Colors.transparent,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 18,
                                                  ),
                                                  Icon(
                                                    Icons.check_circle_outline,
                                                    color: Colors.black,
                                                    size: 25,
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text('점검하기',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Expanded(
                                            child: Row(
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info1(
                                                                        name:
                                                                            name)),
                                                            (route) => false);
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Info2(
                                                                        name:
                                                                            name)),
                                                            (route) => false);
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      color: Colors.transparent,
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Image.asset(
                                                          'repo/images/homebtn.png',
                                                          fit: BoxFit.contain,
                                                          height: 55,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Tool1(
                                                                        name:
                                                                            name)),
                                                            (route) => false);
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          }
        });
  }
}
