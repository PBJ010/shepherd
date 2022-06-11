import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'breath3.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class Breath2 extends StatefulWidget {
  Breath2({Key? key, required this.name,}) : super(key: key);
  final String name;
  @override
  _Breath2State createState() => _Breath2State();
}

class _Breath2State extends State<Breath2> {
  final CountDownController _controller = CountDownController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int narration = 0;
  late AudioPlayer player;

  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;
    await firestore
        .collection(uid)
        .doc("narration")
        .get()
        .then((DocumentSnapshot ds) {
      narration = int.parse(ds.get('data').toString());
    });

    player = AudioPlayer();
    await player.setAsset('assets/audio/breath.mp3');
    if (narration == 1) {
      player.play();
    }

    return uid;
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

  _buildCard({
    Config? config,
    Color backgroundColor = Colors.transparent,
    DecorationImage? backgroundImage,
    double height = 152.0,
  }) {
    return Container(
      color: Colors.transparent,
      height: height,
      width: double.infinity,
      child: Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 12.0,
        margin: EdgeInsets.only(right: 0, left: 0, bottom: 0),
        clipBehavior: Clip.antiAlias,
        child: WaveWidget(
          config: config!,
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          size: Size(double.infinity, double.infinity),
          waveAmplitude: 18,
        ),
      ),
    );
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
                  Colors.indigo,
                  Colors.lightGreen,
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
                      child: Container(
                        height: 70,
                        width: 99,
                        color: Colors.lightGreen.withOpacity(0.7),
                        child: CircularCountDownTimer(
                          duration: 300,
                          initialDuration: 0,
                          controller: _controller,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          ringColor: Colors.transparent,
                          ringGradient: null,
                          fillColor: Colors.transparent,
                          fillGradient: null,
                          backgroundColor: Colors.transparent,
                          backgroundGradient: null,
                          strokeWidth: 20.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textFormat: CountdownTextFormat.MM_SS,
                          isReverse: true,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: true,
                          onStart: () {
                            print('Countdown Started');
                          },
                          onComplete: () {
                            print('Countdown Ended');
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Center(
                      child: _buildCard(
                        config: CustomConfig(
                          colors: [
                            Colors.white.withOpacity(0.9),
                            Colors.white.withOpacity(0.7),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.3),
                          ],
                          durations: [18000, 8000, 5000, 12000],
                          heightPercentages: [0.25, 0.26, 0.28, 0.20],
                          blur: MaskFilter.blur(BlurStyle.outer, 3),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 6,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(
                        child: const Text(
                          '끝내기',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          var arr = _controller.getTime().split(':');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Breath3(
                                name: widget.name,
                                  remainTime:
                                      int.parse(arr[0]) * 60 + int.parse(arr[1]))));
                          player.dispose();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          fixedSize: const Size(99, 99),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: _fetch1(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
