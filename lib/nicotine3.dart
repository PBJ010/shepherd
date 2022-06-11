import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
import 'nicotine4.dart';

class Nicotine3 extends StatefulWidget {
  const Nicotine3({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Nicotine3State createState() => _Nicotine3State();
}

class _Nicotine3State extends State<Nicotine3> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  num _smokingdesire = 0;

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
                          '지하철, 버스, 병원, 영화관 등과 같은 금연구역에서 흡연 욕구를 참는 것이 어렵습니까?',
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
                          groupValue: _smokingdesire,
                          onChanged: (value) {
                            setState(() {
                              _smokingdesire = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('아니오'),
                          value: 0,
                          groupValue: _smokingdesire,
                          onChanged: (value) {
                            setState(() {
                              _smokingdesire = int.parse((value!).toString());
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Nicotine4(name: widget.name)));
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("narration")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("breathtime")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("profileimageflag")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("smokingdesire")
                              .set({
                            'data': _smokingdesire,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist0")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist1")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist2")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist3")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist4")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist5")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist6")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist7")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist8")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist9")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist10")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist11")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist12")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist0")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist1")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist2")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist3")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist4")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist5")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist6")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist7")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist8")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist9")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist10")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist11")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist12")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("namebook")
                              .set({
                            "data": "",
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("phonebook")
                              .set({
                            "data": "",
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
