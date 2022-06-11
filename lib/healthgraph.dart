import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ScreenArgument {
  final String name;
  final num percent;

  ScreenArgument(this.name, this.percent);
}

class Healthgraph extends StatefulWidget {
  const Healthgraph({
    Key? key,
    required this.name,
    required this.totalPercent,
    required this.bodyPercent,
    required this.symPercent,
    required this.disPercent,
  }) : super(key: key);
  final String name;
  final num totalPercent;
  final List<num> bodyPercent;
  final List<num> symPercent;
  final List<num> disPercent;

  @override
  _HealthgraphState createState() => _HealthgraphState();
}

class _HealthgraphState extends State<Healthgraph> {
  List<String> bodyTitle = [
    '맥박',
    '혈압',
    '체온',
    '산소',
    '신경 말단',
    '미각',
    '후각',
    '혈액순환',
    '걷기',
    '폐기능',
    '감각신경수용기',
    '폐섬모',
    '에너지',
    '생식능력',
  ];
  List<String> symTitle = [
    '갈망',
    '불면',
    '두통',
    '과민성',
    '집중력 저하',
    '우울감',
    '불안감',
    '기침',
    '코막힘',
    '호흡곤란',
    '피로',
  ];
  List<String> disTitle = [
    '조기 폐경',
    '유방암',
    '심혈관질환',
    '자궁경부암',
    '뇌졸중',
    '난소암',
    '당뇨',
    '피부암',
    '구강암',
    '폐암',
    '치아 손실',
    '췌장암',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFCFD),
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        title: Text('HEALTH RECOVERY',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            )),
      ),
      body: Container(
        color: const Color(0xffFAFCFD),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  color: Colors.grey.withOpacity(0.1),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 22,
                ),
                new CircularPercentIndicator(
                  radius: 93.0,
                  lineWidth: 10.0,
                  animation: false,
                  percent: widget.totalPercent / 100,
                  center: new Text(
                    widget.totalPercent.toString() + "%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 38.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blueAccent,
                  backgroundColor: Colors.blueAccent.withOpacity(0.1),
                ),
                SizedBox(
                  height: 44,
                ),
                SizedBox(
                  height: 22,
                ),
                Text(
                  '신체 회복',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 11,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: bodyTitle.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/body'+(index+1).toString(),
                            arguments: ScreenArgument(
                                widget.name, widget.bodyPercent[index]),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.grey.withOpacity(0.1),
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Container(
                              height: 20,
                              color: const Color(0xffFAFCFD),
                            ),
                            Row(children: <Widget>[
                              Container(
                                width: 20,
                                height: 22,
                                color: const Color(0xffFAFCFD),
                              ),
                              Text(
                                bodyTitle[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 22,
                                  color: const Color(0xffFAFCFD),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black.withOpacity(0.6),
                                size: 20,
                              ),
                              Container(
                                width: 20,
                                height: 22,
                                color: const Color(0xffFAFCFD),
                              ),
                            ]),
                            Container(
                              height: 40,
                              color: const Color(0xffFAFCFD),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 18,
                                  color: const Color(0xffFAFCFD),
                                ),
                                new LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 90,
                                  animation: false,
                                  lineHeight: 10.0,
                                  animationDuration: 2000,
                                  percent: widget.bodyPercent[index] / 100,
                                  barRadius: Radius.circular(30),
                                  progressColor: Colors.blueAccent,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 18,
                                    color: const Color(0xffFAFCFD),
                                  ),
                                ),
                                Text(
                                  widget.bodyPercent[index].toString() + '%',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  height: 18,
                                  color: const Color(0xffFAFCFD),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              color: const Color(0xffFAFCFD),
                            ),
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 22,
                ),
                Text(
                  '증상 회복',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 11,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: symTitle.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/sym'+(index+1).toString(),
                            arguments: ScreenArgument(
                                widget.name, widget.symPercent[index]),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.grey.withOpacity(0.1),
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Container(
                              height: 20,
                              color: const Color(0xffFAFCFD),
                            ),
                            Row(children: <Widget>[
                              Container(
                                width: 20,
                                height: 22,
                                color: const Color(0xffFAFCFD),
                              ),
                              Text(
                                symTitle[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 22,
                                  color: const Color(0xffFAFCFD),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black.withOpacity(0.6),
                                size: 20,
                              ),
                              Container(
                                width: 20,
                                height: 22,
                                color: const Color(0xffFAFCFD),
                              ),
                            ]),
                            Container(
                              height: 40,
                              color: const Color(0xffFAFCFD),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 18,
                                  color: const Color(0xffFAFCFD),
                                ),
                                new LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 90,
                                  animation: false,
                                  lineHeight: 10.0,
                                  animationDuration: 2000,
                                  percent: widget.symPercent[index] / 100,
                                  barRadius: Radius.circular(30),
                                  progressColor: Colors.blueAccent,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 18,
                                    color: const Color(0xffFAFCFD),
                                  ),
                                ),
                                Text(
                                  widget.symPercent[index].toString() + '%',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  height: 18,
                                  color: const Color(0xffFAFCFD),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              color: const Color(0xffFAFCFD),
                            ),
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 22,
                ),
                Text(
                  '질환 위험 감소',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 11,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: disTitle.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/dis'+(index+1).toString(),
                            arguments: ScreenArgument(
                                widget.name, widget.disPercent[index]),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.grey.withOpacity(0.1),
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Container(
                              height: 20,
                              color: const Color(0xffFAFCFD),
                            ),
                            Row(children: <Widget>[
                              Container(
                                width: 20,
                                height: 22,
                                color: const Color(0xffFAFCFD),
                              ),
                              Text(
                                disTitle[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 22,
                                  color: const Color(0xffFAFCFD),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black.withOpacity(0.6),
                                size: 20,
                              ),
                              Container(
                                width: 20,
                                height: 22,
                                color: const Color(0xffFAFCFD),
                              ),
                            ]),
                            Container(
                              height: 40,
                              color: const Color(0xffFAFCFD),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 18,
                                  color: const Color(0xffFAFCFD),
                                ),
                                new LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 90,
                                  animation: false,
                                  lineHeight: 10.0,
                                  animationDuration: 2000,
                                  percent: widget.disPercent[index] / 100,
                                  barRadius: Radius.circular(30),
                                  progressColor: Colors.blueAccent,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 18,
                                    color: const Color(0xffFAFCFD),
                                  ),
                                ),
                                Text(
                                  widget.disPercent[index].toString() + '%',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  height: 18,
                                  color: const Color(0xffFAFCFD),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              color: const Color(0xffFAFCFD),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
