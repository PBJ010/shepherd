import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shepherd/newsplash.dart';
import 'authentication.dart';
import 'user_image.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  String imageUrl = '';
  final oldController = TextEditingController();
  String statemessage = '';

  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;

    await firestore
        .collection(uid)
        .doc("statemessage")
        .get()
        .then((DocumentSnapshot ds) {
      statemessage = ds.get('data').toString();
    });

    return uid;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetch1(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
//          if (snapshot.hasData == false) {
//          }
          //error가 발생하게 될 경우 반환하게 되는 부분
//          else if (snapshot.hasError) {
//          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
//          else {
            return Scaffold(
              appBar: AppBar(
                title: Text('프로필'),
              ),
              body: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(height: 22),
                    UserImage(onFileChanged: (imageUrl) {
                      setState(() {
                        this.imageUrl = imageUrl;
                      });
                    }),
                    const SizedBox(
                      height: 66,
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        width: MediaQuery.of(context).size.width - 88,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '프로필 상태 메시지',
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextField(
                                    controller: oldController,
                                    decoration: InputDecoration(
                                      hintText: "SHEPHERD와 함께 금연을 시작하세요!",
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
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 280,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                firestore
                                    .collection(AuthenticationHelper().getUid())
                                    .doc("statemessage")
                                    .set({
                                  "data": oldController.text,
                                });
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/homepage', (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.indigo,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                '저장',
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
            );
//          }
        });
  }
}
