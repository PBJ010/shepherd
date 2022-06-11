import 'package:flutter/material.dart';

class Info9 extends StatefulWidget {
  const Info9({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _Info9State createState() => _Info9State();
}

class _Info9State extends State<Info9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 33,
                color: Colors.white,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 130,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 33,
                          ),
                          Text(
                            '감정 트리거',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '감정은 흡연의 주요한 트리거가 될 수 있습니다. 니코틴은 뇌에 도달하면, 즐거움을 담당하는 도파민 분비를 유도합니다. 기분이 나쁘거나, 스트레스를 받거나, 행복할 때조차도 흡연은 기분을 좀 더 낫게 해줍니다(단, 아주 일시적으로).',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 33,
                          ),
                          Text(
                            '감정 트리거를 이겨내는 법',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '흡연에 의지하지 않고도 감정에 대응할 수 있습니다.\n\n감정에 대해 말하기\n가족이나 친구들에게 자신이 느끼는 감정을 털어놓으면 도움이 됩니다.\n\n천천히, 깊게 호흡하기\n심호흡은 몸을 진정시키고, 마음을 침착하게 하며, 욕구를 줄어들게 합니다. 불안 스트레스 관리에도 좋은 방법입니다.\n\n운동하기\n운동은 감정을 컨트롤하는 최고의 방법입니다. 운동 시 뇌에서 엔도르핀을 분비되어 기분이 좋아집니다.\n\n차분한 음악 듣기\n차분한 음악을 들으면 맥박이 느려지고, 혈압이 낮아지며, 스트레스 호르몬이 줄어듭니다.',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
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
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '확인',
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
