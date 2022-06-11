import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shepherd/healthgraph.dart';

class Body10 extends StatefulWidget {
  const Body10({Key? key}) : super(key: key);

  @override
  _Body10State createState() => _Body10State();
}

class _Body10State extends State<Body10> {
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
          '폐기능',
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
                  '${args.name}님의 폐기능이 완전히 회복되었습니다',
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
                  '${args.name}님의 폐기능이 ${((100 - args.percent) / 100 * 21).round().toString()}일 후에 회복될 것입니다',
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
                  '(회복시간: 21일)',
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
                        '  우리의 폐는 완전히 팽창될 수 있어야 우리 몸으로 충분히 산소를 들여올 수 있습니다. 하지만 흡연자의 경우, 기도가 자극되어 염증반응을 일으켜 숨 쉬기 어렵게 만듭니다. 흡연은 또한 폐의 조직들을 파괴하여 건강한 폐를 줄어들게 만들며, 피 속의 산소가 부족하게 됩니다.  ',
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
                        '하지만 금연한다면, 우리 폐는 서서히 회복되어 기침과 숨이 찬 증상들이 현저히 감소될 것입니다.',
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
