import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
import 'nicotine5.dart';

class Nicotine4 extends StatefulWidget {
  const Nicotine4({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Nicotine4State createState() => _Nicotine4State();
}

class _Nicotine4State extends State<Nicotine4> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  num _smokingflavor = 0;

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
                          '가장 포기하기 싫은 담배, 다시 말해 가장 좋아하는 담배는 어떤 것입니까?',
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
                          title: Text('아침의 첫 담배'),
                          value: 1,
                          groupValue: _smokingflavor,
                          onChanged: (value) {
                            setState(() {
                              _smokingflavor = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('그 외의 담배'),
                          value: 0,
                          groupValue: _smokingflavor,
                          onChanged: (value) {
                            setState(() {
                              _smokingflavor = int.parse((value!).toString());
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Nicotine5(name: widget.name)));
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("smokingflavor")
                              .set({
                            'data': _smokingflavor,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist13")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist14")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist15")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist16")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist17")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist18")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist19")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist20")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist21")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist22")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist23")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("causelist24")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist13")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist14")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist15")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist16")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist17")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist18")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist19")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist20")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist21")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist22")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist23")
                              .set({
                            "data": 0,
                          });
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("anothercauselist24")
                              .set({
                            "data": 0,
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
