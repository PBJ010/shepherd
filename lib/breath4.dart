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

class Breath4 extends StatefulWidget {
  const Breath4({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  _Breath4State createState() => _Breath4State();
}

class _Breath4State extends State<Breath4> {
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
      body: Center(
        child: Stack(
          children: [
            Container(

              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.lightGreen,
                      Colors.blue,
                    ],
                  )
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
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
                            ),
                            Text(
                              '호흡운동이 도움이 되셨나요?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight : FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height:11,),
                            Text(
                              '금연을 돕는 다른 방법들도 있습니다',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight : FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height/8,
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomeScreen(
                                                                name:
                                                                    widget.name)));
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) => Help1(
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) => Help3(
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) => Help5(
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) => Draw(
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
                                        width:
                                            MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
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
                                  SizedBox(
                                    width: 33,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width - 144,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(33),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                padding: EdgeInsets.fromLTRB(
                                                    55, 13, 55, 13),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Breath1(
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
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: ElevatedButton(
                              child: const Text(
                                '끝내기',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                fixedSize: const Size(99, 99),
                                shape: const CircleBorder(),
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
  }
}
