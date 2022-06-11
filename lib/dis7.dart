import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shepherd/healthgraph.dart';

class Dis7 extends StatefulWidget {
  const Dis7({Key? key}) : super(key: key);

  @override
  _Dis7State createState() => _Dis7State();
}

class _Dis7State extends State<Dis7> {
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
          '당뇨',
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
                          '${args.name}님의 당뇨에 대한 위험성은 완전히 경감되었습니다',
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
                          '${args.name}님의 당뇨에 대한 위험성은 ${((100 - args.percent) / 100 *5).round().toString()}년 후 경감됩니다',
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
                          '(회복시간: 5년)',
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
                                '  당뇨는 혈중 당 농도를 낮춰주는 인슐린이라는 호르몬에 신체가 잘 반응하지 않아 생기는 질병입니다. 하지만 흡연은 혈중 당 농도를 증가시킬 뿐 아니라 인슐린 저항성도 증가시키는 것으로 알려져 있습니다. 따라서 흡연을 하게 되면 당뇨에 걸릴 확률이 높아지게 되겠죠? 금연을 통해 당뇨병에 걸릴 위험을 낮춰보세요',
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
                                '',
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
