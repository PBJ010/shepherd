import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/saving1.dart';
import 'package:shepherd/tool1.dart';
import 'authentication.dart';
import 'healthgraph.dart';
import 'info13.dart';
import 'info14.dart';
import 'info2.dart';
import 'info8.dart';
import 'newsplash.dart';

class Info1 extends StatefulWidget {
  const Info1({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  State<Info1> createState() => _Info1State();
}

class _Info1State extends State<Info1> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  var f = NumberFormat.currency(locale: "ko_KR", symbol: "￦");

  num totalPercent = 0;
  List<num> bodyPercent = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,];
  List<num> symPercent = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,];
  List<num> disPercent = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,];


  Map<String, double> dataMap = {
    "0": 25,
    "1": 75,
  };
  int minute = 0;
  int hour = 0;
  int day = 0;
  int totalMinute = 0;
  int money = 0;
  var weekend = [0, 0, 0, 0, 0, 0, 0];

  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;
    int stoptime = 0;
    int mytime;

    await firestore
        .collection(uid)
        .doc("money")
        .get()
        .then((DocumentSnapshot ds) {
      money = int.parse(ds.get('data').toString());
    });

    await firestore
        .collection(uid)
        .doc("stoptime")
        .get()
        .then((DocumentSnapshot ds) {
      stoptime = int.parse(ds.get('data').toString());
      mytime = DateTime.now().millisecondsSinceEpoch - stoptime > 0
          ? DateTime.now().millisecondsSinceEpoch - stoptime
          : 0;
      totalMinute = (mytime/60000).toInt();
      minute = ((mytime % 3600000) / 60000).toInt();
      hour = ((mytime % 86400000) / 3600000).toInt();
      day = (mytime / 86400000).toInt();
    });

    await firestore
        .collection(uid)
        .doc("weekend")
        .get()
        .then((DocumentSnapshot ds) {
      weekend[0] = int.parse(ds.get('sun').toString());
      weekend[1] = int.parse(ds.get('mon').toString());
      weekend[2] = int.parse(ds.get('tue').toString());
      weekend[3] = int.parse(ds.get('wed').toString());
      weekend[4] = int.parse(ds.get('thu').toString());
      weekend[5] = int.parse(ds.get('fri').toString());
      weekend[6] = int.parse(ds.get('sat').toString());
    });

    bodyPercent[0] = (totalMinute/20)*100>100?100:((totalMinute/20)*100).round(); //맥박
    bodyPercent[1] = bodyPercent[0]; //혈압
    bodyPercent[2] = bodyPercent[0]; //체온
    bodyPercent[3] = (totalMinute/480)*100>100?100:((totalMinute/480)*100).round(); //산소
    bodyPercent[4] = ((totalMinute/60)/48)*100>100?100:(((totalMinute/60)/48)*100).round(); //신경 말단
    bodyPercent[5] = bodyPercent[4]; //미각
    bodyPercent[6] = bodyPercent[4]; //후각
    bodyPercent[7] = ((totalMinute/60)/(24*14))*100>100?100:(((totalMinute/60)/(24*14))*100).round(); //혈액순환
    bodyPercent[8] = ((totalMinute/60)/(24*17))*100>100?100:(((totalMinute/60)/(24*14))*100).round(); //걷기
    bodyPercent[9] = ((totalMinute/60)/(24*21))*100>100?100:(((totalMinute/60)/(24*21))*100).round(); //폐기능
    bodyPercent[10] = bodyPercent[9]; //감각신경수용기
    bodyPercent[11] = ((totalMinute/60)/(24*90))*100>100?100:(((totalMinute/60)/(24*90))*100).round(); //폐섬모
    bodyPercent[12] = bodyPercent[11]; //에너지
    bodyPercent[13] = ((totalMinute/60)/(24*365))*100>100?100:(((totalMinute/60)/(24*365))*100).round(); //생식능력
    symPercent[0] = ((totalMinute/60)/(24*30))*100>100?100:(((totalMinute/60)/(24*30))*100).round(); //갈망
    symPercent[1] = symPercent[0]; //불면
    symPercent[2] = symPercent[0]; //두통
    symPercent[3] = symPercent[0]; //과민성
    symPercent[4] = symPercent[0]; //집중력 저하
    symPercent[5] = symPercent[0]; //우울감
    symPercent[6] = symPercent[0]; //불안감
    symPercent[7] = ((totalMinute/60)/(24*90))*100>100?100:(((totalMinute/60)/(24*90))*100).round(); //기침
    symPercent[8] = symPercent[7]; //코막힘
    symPercent[9] = symPercent[7]; //호흡곤란
    symPercent[10] = symPercent[7]; //피로
    disPercent[0] = ((totalMinute/60)/(24*365))*100>100?100:(((totalMinute/60)/(24*365))*100).round(); //조기 폐경
    disPercent[1] = disPercent[0]; //유방암
    disPercent[2] = disPercent[0]; //심혈관질환
    disPercent[3] = disPercent[0]; //자궁경부암
    disPercent[4] = disPercent[0]; //뇌졸중
    disPercent[5] = disPercent[0]; //난소암
    disPercent[6] = ((totalMinute/60)/(24*365*5))*100>100?100:(((totalMinute/60)/(24*365*5))*100).round(); //당뇨
    disPercent[7] = disPercent[6]; //피부암
    disPercent[8] = disPercent[6]; //구강암
    disPercent[9] = disPercent[6]; //폐암
    disPercent[10] = ((totalMinute/60)/(24*365*13))*100>100?100:(((totalMinute/60)/(24*365*13))*100).round(); //치아 손실
    disPercent[11] = ((totalMinute/60)/(24*365*15))*100>100?100:(((totalMinute/60)/(24*365*15))*100).round(); //췌장암
    for (int i=0; i<bodyPercent.length; i++){
      totalPercent += bodyPercent[i];
    }
    for (int i=0; i<symPercent.length; i++){
      totalPercent += symPercent[i];
    }
    for (int i=0; i<disPercent.length; i++){
      totalPercent += disPercent[i];
    }
    totalPercent = (totalPercent/(bodyPercent.length+symPercent.length+disPercent.length)).round();
    totalPercent = totalPercent>100?100:totalPercent;


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
              appBar: AppBar(
                title: Text('진행현황',),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                    }),
              ),
              body: Center(
                child: Container(
                  color: const Color(0xffFAFCFD),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top-AppBar().preferredSize.height-120,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.alarm,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text('총 금연한 시간',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(18),
                                        ),
                                        border: Border.all(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 11,
                                          ),
                                          Text(
                                            '🥳 ' + widget.name + ' 님 훌륭합니다, 계속하세요!',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 18,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.indigo.withOpacity(0.2),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(18),
                                                  ),
                                                ),
                                                width: 84,
                                                child: Padding(
                                                  padding:
                                                  EdgeInsets.fromLTRB(0, 18, 0, 7),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        day.toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 33,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 11,
                                                      ),
                                                      Text(
                                                        '일',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.indigo.withOpacity(0.2),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(18),
                                                  ),
                                                ),
                                                width: 84,
                                                child: Padding(
                                                  padding:
                                                  EdgeInsets.fromLTRB(0, 18, 0, 7),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        hour.toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 33,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 11,
                                                      ),
                                                      Text(
                                                        '시간',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.indigo.withOpacity(0.2),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(18),
                                                  ),
                                                ),
                                                width: 84,
                                                child: Padding(
                                                  padding:
                                                  EdgeInsets.fromLTRB(0, 18, 0, 7),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        minute.toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 33,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 11,
                                                      ),
                                                      Text(
                                                        '분',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Info14(name: widget.name)));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              shadowColor: Colors.transparent,
                                            ),
                                            child: Text(
                                              '더 알아보기',
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(
                                          Icons.gpp_good_outlined,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '이겨낸 흡연욕구',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Info8(name: widget.name)));
                                              print('hello');
                                            },
                                            child: Container(
                                              child: Text(
                                                '나의 흡연욕구 확인하기',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(18),
                                        ),
                                        border: Border.all(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0, 11, 0, 11),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 170,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    weekend[DateTime.now().weekday % 7]
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 33,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 18,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        '오늘 이겨낸',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        '흡연 욕구 횟수',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 1,
                                              height: 55,
                                              color: Colors.black12,
                                            ),
                                            Container(
                                              width: 170,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    (weekend[0] +
                                                        weekend[1] +
                                                        weekend[2] +
                                                        weekend[3] +
                                                        weekend[4] +
                                                        weekend[5] +
                                                        weekend[6])
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 33,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 18,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        '지난 7일 동안 이겨낸',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        '흡연 욕구 횟수',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
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
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(18),
                                        ),
                                        border: Border.all(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0, 11, 0, 11),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '이번 주 이겨낸 흡연 욕구 횟수',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 11,
                                            ),
                                            Stack(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Column(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 13,
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: Text(
                                                            '15',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.black26,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: Text(
                                                            '10',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.black26,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: Text(
                                                            '5',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.black26,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: Text(
                                                            '0',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors.black26,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 280,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Colors.black12,
                                                                width: 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 280,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Colors.black12,
                                                                width: 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 280,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Colors.black12,
                                                                width: 1,
                                                              ),
                                                              bottom: BorderSide(
                                                                color: Colors.black12,
                                                                width: 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Positioned(
                                                  bottom: 22,
                                                  left: 60,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 18,
                                                        height: weekend[1] > 15
                                                            ? 87
                                                            : ((29 * weekend[1] / 5)
                                                            .toDouble()),
                                                        child: Visibility(
                                                          visible: weekend[1] == 0
                                                              ? false
                                                              : true,
                                                          child: Container(
                                                            width: 18,
                                                            height: 29,
                                                            decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent
                                                                  .withOpacity(0.7),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(3),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      Container(
                                                        width: 18,
                                                        height: weekend[2] > 15
                                                            ? 87
                                                            : ((29 * weekend[2] / 5)
                                                            .toDouble()),
                                                        child: Visibility(
                                                          visible: weekend[2] == 0
                                                              ? false
                                                              : true,
                                                          child: Container(
                                                            width: 18,
                                                            height: 29,
                                                            decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent
                                                                  .withOpacity(0.7),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(3),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      Container(
                                                        width: 18,
                                                        height: weekend[3] > 15
                                                            ? 87
                                                            : ((29 * weekend[3] / 5)
                                                            .toDouble()),
                                                        child: Visibility(
                                                          visible: weekend[3] == 0
                                                              ? false
                                                              : true,
                                                          child: Container(
                                                            width: 18,
                                                            height: 29,
                                                            decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent
                                                                  .withOpacity(0.7),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(3),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      Container(
                                                        width: 18,
                                                        height: weekend[4] > 15
                                                            ? 87
                                                            : ((29 * weekend[4] / 5)
                                                            .toDouble()),
                                                        child: Visibility(
                                                          visible: weekend[4] == 0
                                                              ? false
                                                              : true,
                                                          child: Container(
                                                            width: 18,
                                                            height: 29,
                                                            decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent
                                                                  .withOpacity(0.7),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(3),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      Container(
                                                        width: 18,
                                                        height: weekend[5] > 15
                                                            ? 87
                                                            : ((29 * weekend[5] / 5)
                                                            .toDouble()),
                                                        child: Visibility(
                                                          visible: weekend[5] == 0
                                                              ? false
                                                              : true,
                                                          child: Container(
                                                            width: 18,
                                                            height: 29,
                                                            decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent
                                                                  .withOpacity(0.7),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(3),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      Container(
                                                        width: 18,
                                                        height: weekend[6] > 15
                                                            ? 87
                                                            : ((29 * weekend[6] / 5)
                                                            .toDouble()),
                                                        child: Visibility(
                                                          visible: weekend[6] == 0
                                                              ? false
                                                              : true,
                                                          child: Container(
                                                            width: 18,
                                                            height: 29,
                                                            decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent
                                                                  .withOpacity(0.7),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(3),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      Container(
                                                        width: 18,
                                                        height: weekend[0] > 15
                                                            ? 87
                                                            : ((29 * weekend[0] / 5)
                                                            .toDouble()),
                                                        child: Visibility(
                                                          visible: weekend[0] == 0
                                                              ? false
                                                              : true,
                                                          child: Container(
                                                            width: 18,
                                                            height: 29,
                                                            decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlueAccent
                                                                  .withOpacity(0.7),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(3),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '       월        화        수        목        금        토        일',
                                              style: TextStyle(
                                                color: Colors.black26,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(
                                          Icons.attach_money,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '내가 절약한 금액',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(18),
                                        ),
                                        border: Border.all(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(11, 22, 11, 0),
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    '총 절약 금액',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      f.format(money * (day + 1)),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 13,
                                              ),
                                              Container(
                                                color: Colors.black12,
                                                width: 99,
                                                height: 1,
                                              ),
                                              SizedBox(
                                                height: 13,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    '7일 후 금액',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      f.format(money * (day + 7)),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 13,
                                              ),
                                              Container(
                                                color: Colors.black12,
                                                width: 99,
                                                height: 1,
                                              ),
                                              SizedBox(
                                                height: 13,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    '30일 후 금액',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      f.format(money * (day + 30)),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:8,),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Saving1(name: widget.name,),),);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                  shadowColor: Colors.transparent,
                                                ),
                                                child: Text(
                                                  '더 알아보기',
                                                  style: TextStyle(
                                                    color: Colors.deepOrange,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Icon(
                                          Icons.health_and_safety_outlined,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '회복된 건강정보',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(18),
                                        ),
                                        border: Border.all(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height:18,),
                                          Container(
                                            color: Colors.white,
                                            height: 260,
                                            child: Padding(
                                              padding:
                                              EdgeInsets.fromLTRB(88, 22, 88, 22),
                                              child:                 new CircularPercentIndicator(
                                                radius: 100.0,
                                                lineWidth: 22.0,
                                                animation: false,
                                                percent: totalPercent/100,
                                                center: new Text(
                                                  totalPercent.toString()+"%",
                                                  style: new TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.indigo,
                                                      fontSize: 38.0),
                                                ),
                                                circularStrokeCap: CircularStrokeCap.round,
                                                progressColor: Colors.indigo,
                                                backgroundColor: Colors.indigo.withOpacity(0.1),
                                              ),

                                            ),
                                          ),
                                          Text(
                                            '현재 꾸준한 금연으로 인해 건강이 회복되는 중입니다.',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '더 알아보기를 통해 자세한 건강상황을 확인해보세요',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                  builder: (context) =>  Healthgraph(
                                                    name: widget.name, totalPercent: totalPercent, bodyPercent: bodyPercent, symPercent: symPercent, disPercent: disPercent,
                                                  )));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              shadowColor: Colors.transparent,
                                            ),
                                            child: Text(
                                              '더 알아보기',
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
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
                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                  child: Column(children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                  '/homepage', (route) => false);
                                            },
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width / 5,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width / 5,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) => Info2(
                                                        name: widget.name,
                                                      )),
                                                      (route) => false);
                                            },
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width / 5,
                                              child: Container(
                                                width:
                                                MediaQuery.of(context).size.width /
                                                    5,
                                                color: Colors.transparent,
                                                child: Align(
                                                  alignment: Alignment.topCenter,
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
                                              Navigator.of(context).pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Tool1(name: widget.name)),
                                                      (route) => false);
                                            },
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width / 5,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width / 5,
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
                  ),
                ),
              ),
            );
          }
        });
  }
}
