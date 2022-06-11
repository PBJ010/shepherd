import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/mission103.dart';
import 'package:shepherd/mission23.dart';
import 'package:shepherd/mission33.dart';
import 'package:shepherd/mission43.dart';
import 'package:shepherd/mission53.dart';
import 'package:shepherd/mission73.dart';
import 'package:shepherd/mission93.dart';
import 'authentication.dart';
import 'breath1.dart';
import 'mission13.dart';
import 'mission63.dart';
import 'newsplash.dart';

class Mission1 extends StatefulWidget {
  const Mission1({Key? key, required this.name,}) : super(key: key);
  final String name;
  @override
  _Mission1State createState() => _Mission1State();
}

class _Mission1State extends State<Mission1> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String title = '';
  String content1 = '';
  String content2 = '';
  String content3 = '';
  String content4 = '';
  String content5 = '';
  String content6 = '';
  String content7 = '';
  String contenttime = '';

  Future<String> _fetch1() async {
    await firestore.collection(AuthenticationHelper().getUid()).doc("challengetime").update({"data":DateTime.now().millisecondsSinceEpoch});

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
          content1 = content1+widget.name+content2;
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
          content1 = content1+'\n'+content2;
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
          content1 = content2;
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
          content1 = content2+'\n\n'+content3+'\n'+content4+'\n'+content5+'\n'+content6+'\n\n'+content7;
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
          content1 = content2+'\n\n'+content3;
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
          content1 = content2+'\n\n'+content3+'\n\n'+content4;
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

    return widget.name;
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
              body: Container(
                color: Colors.white,
                child: Center(
                  child:           Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/2-88,
                          color: Colors.indigo,
                          child: Padding(
                            padding: EdgeInsets.all(22),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '⛳️   오늘의 과제',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height:11,),
                                Text(
                                  title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(22,22,45,22),
                          child: Container(
                            height: MediaQuery.of(context).size.height/2-80,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child:                 Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '⏰️   예상 소요시간 : '+contenttime+'분',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height:22,),
                                  Text(
                                    '설명',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height:11,),
                                  Text(
                                    content1,
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(33),
                                  child: Container(
                                    width: 299,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          switch ((DateTime.now().day % 10) + 1) {
                                            case 1:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission13(name: widget.name)));
                                              break;
                                            case 2:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission23(name: widget.name)));
                                              break;
                                            case 3:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission33(name: widget.name)));
                                              break;
                                            case 4:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission43(name: widget.name)));
                                              break;
                                            case 5:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission53(name: widget.name)));
                                              break;
                                            case 6:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission63(name: widget.name)));
                                              break;
                                            case 7:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission73(name: widget.name)));
                                              break;
                                            case 8:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Breath1(name: widget.name,)));
                                              break;
                                            case 9:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission93(name: widget.name)));
                                              break;
                                            case 10:
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission103(name: widget.name)));
                                              break;
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrangeAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        padding: EdgeInsets.fromLTRB(15,15,15,15),
                                      ),
                                      child: Text(
                                        '시작',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            );
          }
        });
  }
}
