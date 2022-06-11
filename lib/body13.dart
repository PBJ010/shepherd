import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shepherd/healthgraph.dart';

class Body13 extends StatefulWidget {
  const Body13({Key? key}) : super(key: key);

  @override
  _Body13State createState() => _Body13State();
}

class _Body13State extends State<Body13> {
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
          '에너지',
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
                  '${args.name}님의 에너지는 완전히 회복되었습니다',
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
                  '${args.name}님의 에너지는 ${((100 - args.percent) / 100 * 90).round().toString()}일 후에 회복될 것입니다',
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
                  '(회복시간: 3개월)',
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
                        '  우리 몸은 근육과 뇌가 효과적으로 작동하기 위해 지속적으로 산소가 필요합니다. 흡연할 경우 피로부터 공급받게 되는 산소가 줄어들어 우리 몸이 피로하고, 축 쳐지며, 생각을 제대로 할 수 없게 만듭니다. ',
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
                        '만약 이전처럼 활력이 넘치는 것을 느끼고 싶다면 금연하십시오. 니코틴 등의 해로운 화학물질로부터 해방된다면, 우리 몸과 정신은 충분한 산소를 공급받아 하루 종일 활력이 넘칠 것입니다.',
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
