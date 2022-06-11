import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shepherd/healthgraph.dart';

class Sym2 extends StatefulWidget {
  const Sym2({Key? key}) : super(key: key);

  @override
  _Sym2State createState() => _Sym2State();
}

class _Sym2State extends State<Sym2> {
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
          '불면',
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
                  '${args.name}님의 불면은 완전히 경감되었습니다',
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
                  '${args.name}님의 불면은 ${((100 - args.percent) / 100 * 30).round().toString()}일 후 경감됩니다',
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
                  '(회복시간: 1개월)',
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
                        '  긴 하루가 끝날 때쯤, 우리는 얼른 침대로 가서 달콤한 잠을 자기를 원합니다. 하지만 흡연자의 경우 잠에 들기도 어렵고, 잠을 유지하기도 어렵습니다. 왜냐하면 니코틴은 불면증을 유발하는 자극제이기 때문입니다. 계속하여 담배를 피는 것은 수면 무호흡증을 일으킬 수 있는데요, 수면 무호흡증은 밤에 잠을 자다가 숨을 못 쉬는 기간이 있을 때를 일컫습니다. 잠을 제대로 자지 못한다면 밤에 제대로 쉬지 못해 낮 동안 무기력한 상태가 됩니다.',
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
                        '하지만 금연한다면, 더 빨리 잠에 들고 중간에 깨지 않고 푹 잘 수 있을 것입니다. 한 번 낮에 넘치는 에너지로 무엇을 할 수 있을 지 상상해봅시다!',
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
