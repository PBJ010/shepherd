import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
import 'nicotine6.dart';

class Nicotine5 extends StatefulWidget {
  const Nicotine5({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Nicotine5State createState() => _Nicotine5State();
}

class _Nicotine5State extends State<Nicotine5> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  num _smokingamount = 0;

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
                          '하루에 담배를 몇 개비나 피우십니까?',
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
                          title: Text('31개 이상'),
                          value: 3,
                          groupValue: _smokingamount,
                          onChanged: (value) {
                            setState(() {
                              _smokingamount = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('21~30개비'),
                          value: 2,
                          groupValue: _smokingamount,
                          onChanged: (value) {
                            setState(() {
                              _smokingamount = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('11~20개비'),
                          value: 1,
                          groupValue: _smokingamount,
                          onChanged: (value) {
                            setState(() {
                              _smokingamount = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('10개비 이하'),
                          value: 0,
                          groupValue: _smokingamount,
                          onChanged: (value) {
                            setState(() {
                              _smokingamount = int.parse((value!).toString());
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Nicotine6(name: widget.name)));
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("smokingamount")
                              .set({
                            'data': _smokingamount,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("trigger0")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("trigger1")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("trigger2")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("trigger3")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothertrigger0")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothertrigger1")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothertrigger2")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothertrigger3")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("weekend")
                              .set({
                            "sun": 0,
                            "mon": 0,
                            "tue": 0,
                            "wed": 0,
                            "thu": 0,
                            "fri": 0,
                            "sat": 0,
                            "last": 0
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("moneyper")
                              .set({
                            'data': 4500,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("moneyforitem")
                              .set({
                            'data': '',
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("moneyforevent")
                              .set({
                            'data': '',
                          });
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
