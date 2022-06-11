import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
import 'info77.dart';

class Info66 extends StatefulWidget {
  const Info66({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Info66State createState() => _Info66State();
}

class _Info66State extends State<Info66> {
  num _smokingDesire = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int causelist24 = 0;

  @override
  void initState() {
    super.initState();
    String uid = (_auth.currentUser)!.uid;
    firestore
        .collection(uid)
        .doc("anothercauselist24")
        .get()
        .then((DocumentSnapshot ds) {
      causelist24 = int.parse(ds.get('data').toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 33,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            Text(
                              '흡연욕구가 얼마나 심했나요?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(66, 124, 66, 0),
                              child: Column(
                                children: <Widget>[
                                  RadioListTile(
                                    title: Text('심하지 않았다'),
                                    activeColor: Colors.black,
                                    value: 0,
                                    groupValue: _smokingDesire,
                                    onChanged: (value) {
                                      setState(
                                            () {
                                          _smokingDesire =
                                              int.parse((value!).toString());
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  RadioListTile(
                                    title: Text('중간 정도였다'),
                                    activeColor: Colors.black,
                                    value: 1,
                                    groupValue: _smokingDesire,
                                    onChanged: (value) {
                                      setState(
                                            () {
                                          _smokingDesire =
                                              int.parse((value!).toString());
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  RadioListTile(
                                    title: Text('굉장히 심했다'),
                                    activeColor: Colors.black,
                                    value: 2,
                                    groupValue: _smokingDesire,
                                    onChanged: (value) {
                                      setState(
                                            () {
                                          _smokingDesire =
                                              int.parse((value!).toString());
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5,MediaQuery.of(context).padding.top, 0,0),
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 280,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          firestore.collection((_auth.currentUser)!.uid).doc("anothercauselist24").update({"data":_smokingDesire});
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => Info77(int.parse(_smokingDesire.toString()), name: widget.name,),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '다음',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
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
    );
  }
}
