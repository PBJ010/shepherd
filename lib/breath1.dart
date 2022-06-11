import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'authentication.dart';
import 'breath2.dart';

class Breath1 extends StatefulWidget {
  Breath1({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _Breath1State createState() => _Breath1State();
}

class _Breath1State extends State<Breath1> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String name = '';
  var mention = ['켜기', '끄기'];
  int narration = 0;
  late AudioPlayer player;

  Future<String> _fetch1() async {
    player = AudioPlayer();
    await player.setAsset('assets/audio/click.mp3');

    return '';
  }

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blueGrey,
                  Colors.indigo,
                ],
              )),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Center(
                      child: ElevatedButton(
                        child: Container(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.person_outlined,
                                  size: 33,
                                ),
                                Text(
                                  '내레이션',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  mention[narration],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (narration == 0) {
                              player.play();
                              narration = 1;
                            } else {
                              player.dispose();
                              _fetch1();
                              narration = 0;
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          fixedSize: const Size(99, 99),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Center(
                      child: Container(
                        color: Colors.transparent,
                        width: 122,
                        height: 122,
                        child: ElevatedButton(
                            child: Container(
                              color: Colors.transparent,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '시작',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onPressed: () async {
                              player.dispose();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Breath2(name: widget.name)));
                              firestore
                                  .collection(AuthenticationHelper().getUid())
                                  .doc("narration")
                                  .set({
                                "data": narration,
                              });
                            },
                            style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent,
                                ),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(122.0),
                                            side: BorderSide(color: Colors.white))))),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(33.0, 0, 33.0, 88.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '명상하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            '내레이션을 들으며 ' +
                                widget.name +
                                '님에게 개인적으로 의미 있는 것들을 머릿속으로 그려보세요. 사람, 장소, 일화 등 ' +
                                widget.name +
                                '님께서 긍정적으로 생각하는 어떤 것이라도 좋습니다.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          FutureBuilder(
                              future: _fetch1(),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                                if (snapshot.hasData == false) {
                                  return Container();
                                }
                                //error가 발생하게 될 경우 반환하게 되는 부분
                                else if (snapshot.hasError) {
                                  return Container();
                                }
                                // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                                else {
                                  return Container();
                                }
                              }),

                        ],
                      ),
                    ),
                  ),
                ],
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
