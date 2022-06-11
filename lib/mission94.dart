import 'package:flutter/material.dart';

class Mission94 extends StatefulWidget {
  const Mission94({Key? key, required this.name,}) : super(key: key);
  final String name;
  @override
  _Mission94State createState() => _Mission94State();
}

class _Mission94State extends State<Mission94> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black38, //change your color here
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height-270,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '개인 단기프로그램',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 33),
                          Text(
                            '금연 하루 전일부터 금연 7일 혹은 30일 금연 성공일 까지 전담상담사가 예약된 시간에 전화하여 금연 준비사항을 비롯해 금연 초기 다양하게 경험할 수 있는 금단증상과 흡연에 대한 극심한 갈망을 극복할 수 있도록 다양한 지침과 정서적 지지를 제공합니다.\n\n7일 프로그램\n\n1단계 : 금연 선포, 금연 준비\n2단계 : 금연 간식, 식습관 조절\n3단계 : 스트레스 관리\n4단계 : 운동관리\n5단계 : 담배 거절하기\n6단계 : 금연 식이조절\n7단계 : 체중조절 일지 작성\n8단계 : 금연 VS 흡연\n\n30일 프로그램\n\n1단계 : 금연선포, 금연준비\n2단계 : 금연간식, 식습관 조절\n3단계 : 음주 관리\n4단계 : 스트레스 관리\n5단계 : 전자담배 알기\n6단계 : 운동 관리\n7단계 : 경제손실 계산하기\n8단계 : 간접흡연의 위해 알기',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 299,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.fromLTRB(15,15,15,15),
                              ),
                              child: Text(
                                '연결하기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
