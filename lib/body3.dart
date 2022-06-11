import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shepherd/healthgraph.dart';

class Body3 extends StatefulWidget {
  const Body3({Key? key}) : super(key: key);

  @override
  _Body3State createState() => _Body3State();
}

class _Body3State extends State<Body3> {
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
          '체온',
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
                  '${args.name}님의 체온이 완전히 회복되었습니다',
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
                  '${args.name}님의 체온이 ${((100 - args.percent) / 100 * 20).round().toString()}분 후에 회복될 것입니다',
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
                  '(회복시간: 20분)',
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
                        '  성인의 평균 체온은 대략 섭씨 36~37.2도 입니다. 건강한 사람의 경우 이 온도의 범위 안에서 체온을 자동으로 적절하게 유지하며 살아갈 수 있습니다. 하지만, 흡연자가 담배의 화학물질을 흡입하게 되면 우리 몸의 체온 유지 기능을 방해하여 다양한 건강상의 문제를 야기할 수 있습니다.',
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
                        '하지만 금연한다면, 체온을 정상 수준으로 되돌릴 수 있습니다.',
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
