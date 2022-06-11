import 'package:flutter/material.dart';

class Mission95 extends StatefulWidget {
  const Mission95({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Mission95State createState() => _Mission95State();
}

class _Mission95State extends State<Mission95> {
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
                            '개인 장기프로그램',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 33),
                          Text(
                            '단기 프로그램과 같이 초기에는 금단 증상과 흡연에 대한 갈망을 극복할 수 있는 상담을 제공하며 장기적인 금연 유지를 위해 체중 관리, 취미생활, 금연 동기 재확인 등을 통해 전반적인 생활습관과 인지적인 변화를 이루도록 상담을 제공합니다.\n\n100일 프로그램\n\n1단계 : 금연선포, 금연준비\n2단계 : 흡연습관 버리기\n3단계 : 음주 관리\n4단계 : 스트레스 관리\n5단계 : COPD 간접체험\n6단계 : 금연 VS 흡연\n7단계 : 스트레스 뇌 구조\n8단계 : 금연자신감 재확인\n9단계 : 운동 관리\n10단계 : 재흡연 방지 지침\n11단계 : 금연 결심 재확인\n12단계 : 음주 관리\n13단계 : 한 개비 실수 대처\n14단계 : 금연 후 변화 알기\n\n1년 프로그램\n\n1단계 : 금연선포, 금연준비\n2단계 : 흡연습관 버리기\n3단계 : 보조제 활용\n4단계 : 알코올 중독 평가\n5단계 : COPD 간접체험\n6단계 : 금연 VS 흡연\n7단계 : 경제손실 계산하기\n8단계 : 금연자신감 재확인\n9단계 : 금연 식이 관리\n10단계 : 스피드 퀴즈\n11단계 : 전자담배 알기\n12단계 : 금연장점 확인\n13단계 : 체중조절 일지 작성\n14단계 : 금연 후 변화 살피기\n15단계 : 음주 관리\n16단계 : 스트레스 관리\n17단계 : 금연체조 배우기\n18단계 : 재흡연 방지 지침\n19단계 : 경제적 이익 확인\n20단계 : 한 개비 실수 대처\n21단계 : 담배 값 기부하기 금연 후 변화 알기',
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
