import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shepherd/newsplash.dart';
import 'package:shepherd/saving1.dart';
import 'package:shepherd/saving2.dart';
import 'package:shepherd/saving4.dart';

import 'authentication.dart';

class Saving5 extends StatefulWidget {
  const Saving5({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  _Saving5State createState() => _Saving5State();
}

class _Saving5State extends State<Saving5> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  var f = NumberFormat.currency(locale: "ko_KR", symbol: "￦");
  List<int> timestampTitle = [];
  List<String> dateTitle = [];
  List<String> bodyTitle = [];
  List<int> moneyTitle = [];
  List<int> flagTitle = [];

  num moneyper = 0;
  num moneyperhundred = 0;
  String itemData = "";
  String eventData = "";
  int stoptime = 0;
  int datetime = 0;

  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;
    await firestore
        .collection(uid)
        .doc("moneyper")
        .get()
        .then((DocumentSnapshot ds) {
      moneyper = int.parse(ds.get('data').toString());
    });

    moneyperhundred = moneyper * 365 * 100;

    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("stoptime")
        .get()
        .then((DocumentSnapshot ds) {
      stoptime = int.parse(ds.get('data').toString());
    });
    datetime = DateTime.now().millisecondsSinceEpoch - stoptime > 0
        ? DateTime.now().millisecondsSinceEpoch - stoptime
        : 0;

    timestampTitle.clear();
    dateTitle.clear();
    bodyTitle.clear();
    moneyTitle.clear();
    flagTitle.clear();
    timestampTitle.add(DateTime.now().millisecondsSinceEpoch);
    dateTitle.add(DateTime.now().year.toString() +
        "년 " +
        DateTime.now().month.toString() +
        "월 " +
        DateTime.now().day.toString() +
        "일");
    bodyTitle.add('오늘');
    moneyTitle.add((((datetime / 86400000).toInt() + 1) * moneyper).toInt());
    flagTitle.add(0);

    await firestore
        .collection(uid)
        .doc("moneyforitem")
        .get()
        .then((DocumentSnapshot ds) {
      itemData = ds.get('data').toString();
    });
    List<String> items = itemData.split(";");

    for (int i = 0; i < items.length - 1; i++) {
      int bet =
          ((int.parse(items[i].split("+").last)) / (moneyper != 0 ? moneyper : 1))
              .ceil();
      DateTime dt = DateTime.fromMillisecondsSinceEpoch(
          ((bet > 0 ? bet - 1 : 0) * 86400000 + stoptime).toInt());
      timestampTitle.add(dt.millisecondsSinceEpoch);
      dateTitle.add(dt.year.toString() +
          "년 " +
          dt.month.toString() +
          "월 " +
          dt.day.toString() +
          "일");
      bodyTitle.add(items[i].split("+").first);
      moneyTitle.add(int.parse(items[i].split("+").last));
      flagTitle.add(1);
    }

    await firestore
        .collection(uid)
        .doc("moneyforevent")
        .get()
        .then((DocumentSnapshot ds) {
      eventData = ds.get('data').toString();
    });
    List<String> events = eventData.split(";");

    for (int i = 0; i < events.length - 1; i++) {
      int tim = int.parse(events[i].split("+").last);
      DateTime dt = DateTime.fromMillisecondsSinceEpoch(tim);
      DateTime st = DateTime.fromMillisecondsSinceEpoch(stoptime);
      timestampTitle.add(tim);
      dateTitle.add(dt.year.toString() +
          "년 " +
          dt.month.toString() +
          "월 " +
          dt.day.toString() +
          "일");
      bodyTitle.add(events[i].split("+").first);

      if(dt.year==st.year && dt.month==st.month && dt.day==st.day){
        moneyTitle.add((moneyper).toInt());
        flagTitle.add(2);
      } else {
        int bet = ((tim - stoptime) / 86400000).ceil() + 1;
        moneyTitle.add((bet * moneyper).toInt());
        flagTitle.add(2);
      }
    }

    int temp1 = 0;
    String temp2 = "";
    String temp3 = "";
    int temp4 = 0;
    int temp5 = 0;
    int n = timestampTitle.length;
    for (int i = n - 1; i > 0; i--) {
      // 0 ~ (i-1)까지 반복
      for (int j = 0; j < i; j++) {
        // j번째와 j+1번째의 요소가 크기 순이 아니면 교환
        if (timestampTitle[j] > timestampTitle[j + 1]) {
          temp1 = timestampTitle[j];
          timestampTitle[j] = timestampTitle[j + 1];
          timestampTitle[j + 1] = temp1;

          temp2 = dateTitle[j];
          dateTitle[j] = dateTitle[j + 1];
          dateTitle[j + 1] = temp2;

          temp3 = bodyTitle[j];
          bodyTitle[j] = bodyTitle[j + 1];
          bodyTitle[j + 1] = temp3;

          temp4 = moneyTitle[j];
          moneyTitle[j] = moneyTitle[j + 1];
          moneyTitle[j + 1] = temp4;

          temp5 = flagTitle[j];
          flagTitle[j] = flagTitle[j + 1];
          flagTitle[j + 1] = temp5;
        }
      }
    }

    return '';
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
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shadowColor: Colors.transparent,
                title: Text('절약 금액'),
              ),
              body: Container(
                color: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
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
                                '예상되는 절약 금액',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                f.format(moneyperhundred),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 33,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          Saving2(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Text(
                                  '지불 액수 수정하기',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2,
                              width: 1,
                              color: Colors.black12.withOpacity(0.1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 25, 5),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height / 2 - 15,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: bodyTitle.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (bodyTitle[index] != "오늘") {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    '일시 : ' +
                                                        dateTitle[index] +
                                                        '\n예산 : ' +
                                                        f.format(
                                                            moneyTitle[index]) +
                                                        '\n계획 : ' +
                                                        bodyTitle[index] +
                                                        '\n\n삭제하시겠습니까?',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ],
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      timestampTitle
                                                          .removeAt(index);
                                                      dateTitle.removeAt(index);
                                                      bodyTitle.removeAt(index);
                                                      moneyTitle
                                                          .removeAt(index);
                                                      flagTitle.removeAt(index);
                                                    });
                                                    Navigator.of(context).pop();
                                                    String itemData = "";
                                                    String eventData = "";
                                                    for (int i = 0;
                                                        i <
                                                            timestampTitle
                                                                .length;
                                                        i++) {
                                                      if (flagTitle[i] == 0){

                                                      } else if (flagTitle[i] == 1) {
                                                        itemData += bodyTitle[
                                                        i] +
                                                            "+" +
                                                            moneyTitle[i]
                                                                .toString() +
                                                            ";";
                                                      } else if (flagTitle[i] ==
                                                          2) {
                                                        eventData += bodyTitle[
                                                        i] +
                                                            "+" +
                                                            timestampTitle[i]
                                                                .toString() +
                                                            ";";
                                                      }
                                                    }
                                                    firestore
                                                        .collection(
                                                            AuthenticationHelper()
                                                                .getUid())
                                                        .doc("moneyforitem")
                                                        .update({
                                                      'data': itemData,
                                                    });
                                                    firestore
                                                        .collection(
                                                            AuthenticationHelper()
                                                                .getUid())
                                                        .doc("moneyforevent")
                                                        .update({
                                                      'data': eventData,
                                                    });
                                                  },
                                                  child: const Text(
                                                    '예',
                                                    style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    '아니오',
                                                    style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '●',
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 10,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 11,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                Container(
                                                  height: 20,
                                                ),
                                                Text(
                                                  dateTitle[index],
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  bodyTitle[index],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  f.format(moneyTitle[index]),
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Container(
                                                  height: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 280,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Saving1(name: widget.name),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.deepOrangeAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    child: Text(
                                      '새로운 계획 세우기',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
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
