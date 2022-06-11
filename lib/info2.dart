import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'authentication.dart';
import 'help7.dart';
import 'info3.dart';

class Info2 extends StatefulWidget {
  const Info2({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  _Info2State createState() => _Info2State();
}

class _Info2State extends State<Info2> {
  final CountDownController _controller = CountDownController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        shadowColor: Colors.transparent,
        title: Text(""),
        actions: <Widget>[
          new IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/homepage', (route) => false);
            },
            icon: new Icon(Icons.cancel),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.indigo,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 260,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        Text(
                          widget.name + ' 님, 흡연하고 싶으신가요?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '흡연욕구는 5분 내에 가라앉을거에요',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '힘내세요!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CircularCountDownTimer(
                          duration: 300,
                          initialDuration: 0,
                          controller: _controller,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          ringColor: Colors.indigo.shade100,
                          ringGradient: null,
                          fillColor: Colors.indigo.withOpacity(0.3),
                          fillGradient: null,
                          backgroundColor: Colors.indigo,
                          backgroundGradient: null,
                          strokeWidth: 20.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                              fontSize: 33.0,
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
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          var arr = _controller.getTime().split(':');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Info3(
                                name: widget.name,
                                  remainTime: int.parse(arr[0]) * 60 +
                                      int.parse(arr[1]))));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        ),
                        child: Text(
                          '흡연욕구 이겨내기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Container(
                                width:
                                    MediaQuery.of(context).size.width / 3 * 2,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        '⛰',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 100,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(
                                        '포기하지 마세요.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 22,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text:
                                                  '실수로 담배를 피우셨나요? 당신은 결코 의지력이 약한 사람이나 실패자가 아닙니다. ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                              text: '자책하지 마세요.',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: '금연은 \'마라톤\'',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '과 같습니다. 한 순간의 실수가 실패가 아니라 포기하는 것만이 실패입니다.',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ])),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: '장기적인 관점에서 ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                              text: '같은 실수를 반복하지 않도록',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' 노력하는 것이 중요합니다.',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ])),
                                    ]),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    '취소',
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => Help7(
                                                  name: widget.name,
                                                )));
                                  },
                                  child: const Text(
                                    '다음',
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        ),
                        child: Text(
                          '흡연했음',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
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
