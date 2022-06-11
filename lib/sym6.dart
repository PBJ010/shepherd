import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shepherd/healthgraph.dart';

class Sym6 extends StatefulWidget {
  const Sym6({Key? key}) : super(key: key);

  @override
  _Sym6State createState() => _Sym6State();
}

class _Sym6State extends State<Sym6> {
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
          '우울감',
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
                          '${args.name}님의 우울감은 완전히 경감되었습니다',
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
                          '${args.name}님의 우울감은 ${((100 - args.percent) / 100 * 30).round().toString()}일 후 경감됩니다',
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
                                '  기쁨을 느낄 때 사람의 뇌는 도파민이라는 물질을 분비해 긍정적인 기분을 유도합니다. 니코틴은 이러한 작용을 흉내내어 사람의 기분을 잠시나마 좋게 만들지만, 시간이 지날수록 오히려 우울감을 느끼게 만듭니다. 왜 그럴까요? 니코틴이 뇌의 도파민 분비를 유도하게 되면, 뇌는 자체적인 도파민분비 시스템을 중지하게 됩니다. 이러한 현상의 문제점은 2가지가 있습니다. 첫번째는 이제 기쁨을 느끼기 위해 도파민이 아닌 니코틴에 의지하게 된다는 것이고, 두번째는 뇌의 도파민 시스템이 문을 닫게 되면서 전보다 더 쉽게 우울감을 느끼게 된다는 것입니다. ',
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
                                '하지만 금연을 하게 된다면, 뇌는 니코틴의 “가짜 도파민 신호”를 더 이상 받지 않게 되고, 따라서 자체적인 도파민 분비를 재개하게 됩니다. 니코틴에게 속지 않으려면 지금 당장 금연을 시작해보세요!',
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
