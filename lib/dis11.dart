import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shepherd/healthgraph.dart';

class Dis11 extends StatefulWidget {
  const Dis11({Key? key}) : super(key: key);

  @override
  _Dis11State createState() => _Dis11State();
}

class _Dis11State extends State<Dis11> {
  num completion = 0;

  @override
  Widget build(BuildContext context) {
    final ScreenArgument args =
    ModalRoute.of(context)?.settings?.arguments as ScreenArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFCFD),
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        title: Text(
          '치아 손실',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xffFAFCFD),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        color: const Color(0xffFAFCFD),
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
                        percent: args.percent / 100,
                        center: new Text(
                          args.percent.toString() + "%",
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
                      Visibility(
                        visible: args.percent == 100 ? true : false,
                        child: Text(
                          '${args.name}님의 치아 손실에 대한 위험성은 완전히 경감되었습니다',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Visibility(
                        visible: args.percent == 100 ? false : true,
                        child: Text(
                          '${args.name}님의 치아 손실에 대한 위험성은 ${((100 - args.percent) / 100 * 13).round().toString()}년 후 경감됩니다',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          '(회복시간: 13년)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(33),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                '  흡연이 구취와 치아의 변색을 일으킨다는 사실은 아마 들어보셨을 겁니다. 하지만 니코틴이 잇몸병을 일으켜 치아 손실의 주요 원인이 될 수 있다는 사실을 알고 계셨나요?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                '흡연은 박테리아에 대한 면역력을 약화시켜 잇몸에 플라크(plaque)가 쌓이게 합니다. 축적된 플라크는 감염의 원인이 되고, 치아를 붙들고 있는 잇몸조직이 약화되어 치아가 빠지게 됩니다. 지금 당장 금연을 통해 치아 손실의 위험을 낮추고 당신의 환한 미소를 지키세요',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          '참고: 건강회복정보는 평균 흡연자를 기준으로 만들어졌습니다. 개인마다 결과에 차이가 있을 수 있습니다.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).padding.bottom),
                    ],
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
