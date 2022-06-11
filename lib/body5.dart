import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shepherd/healthgraph.dart';

class Body5 extends StatefulWidget {
  const Body5({Key? key}) : super(key: key);

  @override
  _Body5State createState() => _Body5State();
}

class _Body5State extends State<Body5> {
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
          '신경 말단',
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
                  '${args.name}님의 신경 말단이 완전히 회복되었습니다',
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
                  '${args.name}님의 신경 말단이 ${((100 - args.percent) / 100 * 48).round().toString()}시간 후에 회복될 것입니다',
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
                  '(회복시간: 2일)',
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
                        '  우리 뇌 속에 수백개의 세포들은 화학신호를 통해 서로 대화하여, 우리가 움직이고, 말하고, 생각하고, 느낄 수 있게 만들어 줍니다',
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
                        '담배의 니코틴은 우리 몸의 신경말단까지 도달하는 피의 양을 줄임으로써, 신경이 원활하게 작동하는데 필요한 영양분을 제공하지 못하게 합니다. 하지만, 신경 손상은 다시 회복될 수 있습니다. 니코틴으로부터 멀어진다면, 우리의 신경은 다시 예전으로 돌아가 건강하게 살아갈 수 있습니다.',
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
