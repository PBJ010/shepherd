import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
import 'nicotine3.dart';
class Nicotine2 extends StatefulWidget {
  const Nicotine2({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Nicotine2State createState() => _Nicotine2State();
}

class _Nicotine2State extends State<Nicotine2> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  num _smokingtime = 0;
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
                  height: MediaQuery.of(context).size.height-120,
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
                          '아침에 일어나서 얼마 만에 첫 담배를 피우십니까?',
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
                          title: Text('5분 이내'),
                          value: 3,
                          groupValue: _smokingtime,
                          onChanged: (value){
                            setState(() {
                              _smokingtime = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('6~30분 사이'),
                          value: 2,
                          groupValue: _smokingtime,
                          onChanged: (value){
                            setState(() {
                              _smokingtime = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('31~60분 사이'),
                          value: 1,
                          groupValue: _smokingtime,
                          onChanged: (value){
                            setState(() {
                              _smokingtime = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('60분 이후'),
                          value: 0,
                          groupValue: _smokingtime,
                          onChanged: (value){
                            setState(() {
                              _smokingtime = int.parse((value!).toString());
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Nicotine3(name:widget.name)));
                          firestore.collection(AuthenticationHelper().getUid()).doc("smokingtime").set({'data': _smokingtime,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm0").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm1").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm2").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm3").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm4").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm5").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm6").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm7").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm8").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("alarm9").set({"hour":25,"minute":0,});
                          firestore.collection(AuthenticationHelper().getUid()).doc("challengetime").set({"data":0});

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
