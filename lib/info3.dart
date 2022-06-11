import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/note_screen.dart';
import 'package:shepherd/support1.dart';
import 'authentication.dart';
import 'package:url_launcher/url_launcher.dart';

import 'breath1.dart';
import 'draw.dart';
import 'help1.dart';
import 'help2.dart';
import 'help3.dart';
import 'help4.dart';
import 'help5.dart';
import 'help6.dart';
import 'help7.dart';
import 'info4.dart';

class Info3 extends StatefulWidget {
  const Info3({Key? key, required this.remainTime, required this.name})
      : super(key: key);

  final int remainTime;
  final String name;

  @override
  _Info3State createState() => _Info3State();
}

class _Info3State extends State<Info3> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  var weekend = [0, 0, 0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
    String uid = (_auth.currentUser)!.uid;
    firestore.collection(uid).doc("weekend").get().then((DocumentSnapshot ds) {
      weekend[0] = int.parse(ds.get('sun').toString());
      weekend[1] = int.parse(ds.get('mon').toString());
      weekend[2] = int.parse(ds.get('tue').toString());
      weekend[3] = int.parse(ds.get('wed').toString());
      weekend[4] = int.parse(ds.get('thu').toString());
      weekend[5] = int.parse(ds.get('fri').toString());
      weekend[6] = int.parse(ds.get('sat').toString());
      weekend[7] = int.parse(ds.get('last').toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.indigo,
        shadowColor: Colors.transparent,
        title: Text(""),
        actions: <Widget>[],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.indigo,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 260,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          child: CircularCountDownTimer(
                            duration: 300,
                            initialDuration: 300 - widget.remainTime,
                            controller: CountDownController(),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                            ringColor: Colors.indigo.shade100,
                            ringGradient: null,
                            fillColor: Colors.indigo.withOpacity(0.3),
                            fillGradient: null,
                            backgroundColor: Colors.indigo,
                            backgroundGradient: null,
                            strokeWidth: 20.0,
                            strokeCap: StrokeCap.round,
                            textStyle: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textFormat: CountdownTextFormat.MM_SS,
                            isReverse: true,
                            isReverseAnimation: false,
                            isTimerTextShown: true,
                            autoStart: true,
                            onStart: () {
                              print('Countdown Started');
                            },
                            onComplete: () {
                              print('Countdown Ended');
                            },
                          ),
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 144,
                          height: 275,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '🫁',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '호흡운동 하기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '안내에 따라 호흡운동을 통해 몸과 마음을 편안하게 해보세요',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) => Breath1(
                                                          name: widget.name,
                                                        )));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        '다양한 방안 카드를 만나보세요 👉',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '📒',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '금연일기 읽기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '작성한 금연일기를 다시 읽어보며 왜 금연을 해야하는지 상기해보세요',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen(
                                                            name: widget.name)));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '💁‍',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '조언 구하기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '서포터들에게서 온 응원의 메세지를 다시 읽어보며 마음을 다잡아보세요',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            launch(
                                                'https://www.nosmokeguide.go.kr/lay2/bbs/S1T85C86/G/41/list.do');
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '💗',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '주위사람 도와주기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '주위사람에게 도움을 베풀어 흡연욕구를 억제해보세요',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            launch('sms:');
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '📞',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '친구에게 전화하기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '가까운 친구에게 전화해 응원을 받으며 흡연욕구를 억제해보세요',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Support1(name: widget.name)));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '◽️',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '니코틴보조제 사용하기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '니코틴 패치, 껌, 사탕 등을 통해 흡연욕구를 이겨내보세요',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Help1(name: widget.name)));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '🍎',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '몸에 좋은 간식 먹기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '당근, 사과 등 건강한 간식은 흡연욕구를 억제하는데 효과적입니다',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) => Help2(
                                                          name: widget.name,
                                                        )));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '🚶‍',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '산책하기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '야외 산책을 통해 흡연욕구를 업제해보세요',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Help3(name: widget.name)));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '☕️',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '차와 물 마시기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '따듯한 차와 물 한 잔은 몸과 마음을 진정시키는데 효과적입니다',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) => Help4(
                                                          name: widget.name,
                                                        )));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '🪥',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '이 닦기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '이를 닦으면 입 안이 상쾌해져 담배 생각이 줄어듭니다',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Help5(name: widget.name)));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '✍️',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '낙서하기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '연필이나 볼펜을 손에 잡고 낙서를 하면 흡연욕구를 떨어뜨릴 수 있습니다',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Draw(name: widget.name)));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 33,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 144,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '👩‍',
                                          style: TextStyle(
                                            fontSize: 66,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          '전문가 도움받기',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 11,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(31, 0, 31, 0),
                                          child: Text(
                                            '금연전문가와의 통화를 통해 흡연욕구를 이겨내기 위한 조언을 받으세요',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shadowColor: Colors.transparent,
                                            padding:
                                                EdgeInsets.fromLTRB(55, 13, 55, 13),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) => Help6(
                                                          name: widget.name,
                                                        )));
                                          },
                                          child: Text(
                                            '시작하기',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14,
                                            ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Info4(
                                        name: widget.name,
                                      )),
                              (route) => false);
                          String uid = (_auth.currentUser)!.uid;
                          if (DateTime.now().millisecondsSinceEpoch -
                                  weekend[7] >
                              86400000) {
                            weekend[DateTime.now().weekday % 7] = 0;
                            weekend[7] = DateTime.now().millisecondsSinceEpoch -
                                DateTime.now().millisecondsSinceEpoch %
                                    86400000;
                            weekend[DateTime.now().weekday % 7] =
                                weekend[DateTime.now().weekday % 7] + 1;
                            firestore.collection(uid).doc("weekend").update({
                              "sun": weekend[0],
                              "mon": weekend[1],
                              "tue": weekend[2],
                              "wed": weekend[3],
                              "thu": weekend[4],
                              "fri": weekend[5],
                              "sat": weekend[6],
                              "last": weekend[7],
                            });
                          } else {
                            weekend[DateTime.now().weekday % 7] =
                                weekend[DateTime.now().weekday % 7] + 1;
                            firestore.collection(uid).doc("weekend").update({
                              "sun": weekend[0],
                              "mon": weekend[1],
                              "tue": weekend[2],
                              "wed": weekend[3],
                              "thu": weekend[4],
                              "fri": weekend[5],
                              "sat": weekend[6],
                              "last": DateTime.now().millisecondsSinceEpoch -
                                  DateTime.now().millisecondsSinceEpoch %
                                      86400000,
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                        ),
                        child: Text(
                          '흡연욕구 사라짐',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Container(
                                width:
                                    MediaQuery.of(context).size.width / 3 * 2,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        '⛰',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 100,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(
                                        '포기하지 마세요.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 22,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text:
                                                  '실수로 담배를 피우셨나요? 당신은 결코 의지력이 약한 사람이나 실패자가 아닙니다. ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                              text: '자책하지 마세요.',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: '금연은 \'마라톤\'',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '과 같습니다. 한 순간의 실수가 실패가 아니라 포기하는 것만이 실패입니다.',
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
                                              text: '장기적인 관점에서 ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                              text: '같은 실수를 반복하지 않도록',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 노력하는 것이 중요합니다.',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ])),
                                    ]),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    '취소',
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Help7(name: widget.name)));
                                  },
                                  child: const Text(
                                    '다음',
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                        ),
                        child: Text(
                          '흡연했음',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
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
    );
  }
}
