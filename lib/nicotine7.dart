import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
import 'nicotine8.dart';

class Nicotine7 extends StatefulWidget {
  const Nicotine7({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Nicotine7State createState() => _Nicotine7State();
}

class _Nicotine7State extends State<Nicotine7> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  num _smokingsick = 0;
  int _smokingresult = 0;
  int usercount = 0;
  int totalusercount = 0;

  void resultmaker() async {
    num smokingtime = 0;
    num smokingdesire = 0;
    num smokingflavor = 0;
    num smokingamount = 0;
    num smokingearly = 0;
    num smokingsick = 0;
    await firestore
        .collection("master")
        .doc("user")
        .get()
        .then((DocumentSnapshot ds) {
      usercount = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection("master")
        .doc("totaluser")
        .get()
        .then((DocumentSnapshot ds) {
      totalusercount = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("smokingtime")
        .get()
        .then((DocumentSnapshot ds) {
      smokingtime = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("smokingdesire")
        .get()
        .then((DocumentSnapshot ds) {
      smokingdesire = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("smokingflavor")
        .get()
        .then((DocumentSnapshot ds) {
      smokingflavor = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("smokingamount")
        .get()
        .then((DocumentSnapshot ds) {
      smokingamount = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("smokingearly")
        .get()
        .then((DocumentSnapshot ds) {
      smokingearly = int.parse(ds.get('data').toString());
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("smokingsick")
        .get()
        .then((DocumentSnapshot ds) {
      smokingsick = int.parse(ds.get('data').toString());
    });
    switch (smokingtime +
        smokingdesire +
        smokingflavor +
        smokingamount +
        smokingearly +
        smokingsick) {
      case 0:
      case 1:
      case 2:
      case 3:
        _smokingresult = 0;
        break;
      case 4:
      case 5:
      case 6:
        _smokingresult = 1;
        break;
      case 7:
      case 8:
      case 9:
      case 10:
        _smokingresult = 2;
        break;
    }
    firestore
        .collection(AuthenticationHelper().getUid())
        .doc("smokingresult")
        .set({
      'data': _smokingresult,
    });
    firestore.collection("master").doc("user").update({
      'data': usercount + 1,
    });
    firestore.collection("master").doc("totaluser").update({
      'data': usercount + 1,
    });
    firestore.collection("master").doc(AuthenticationHelper().getUid()).set({
      'data': (totalusercount + 1),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),
                        Image.asset(
                          'repo/images/lung.png',
                          fit: BoxFit.contain,
                          height: 180,
                        ),
                        SizedBox(
                          height: 101,
                        ),
                        Text(
                          '아파서 거의 하루 종일 누워있거나, 감기나 독감에 걸려 호흡이 곤란할 때에도 담배를 피우십니까?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        RadioListTile(
                          title: Text('예'),
                          value: 1,
                          groupValue: _smokingsick,
                          onChanged: (value) {
                            setState(() {
                              _smokingsick = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('아니오'),
                          value: 0,
                          groupValue: _smokingsick,
                          onChanged: (value) {
                            setState(() {
                              _smokingsick = int.parse((value!).toString());
                            });
                          },
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
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("smokingsick")
                              .set({
                            'data': _smokingsick,
                          });
                          resultmaker();

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    Nicotine8(_smokingresult, name: widget.name),
                              ),
                              (route) => false);
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
    );
  }
}
