import 'package:flutter/material.dart';

class Help3 extends StatefulWidget {
  const Help3({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<Help3> createState() => _Help3State();
}

class _Help3State extends State<Help3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height - 120,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(height:33,),
                              Text(
                                '🚶‍',
                                style: TextStyle(
                                  fontSize: 66,
                                ),
                              ),
                              SizedBox(height:33,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '산책하기',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:33,),
                                  Text(
                                    '  계단 오르내리기라도 좋습니다. 잠시 걸으면서 흡연에 대한 욕구를 이겨내봅시다.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:33,),
                                  SizedBox(height:33,),
                                  Text(
                                    '작장에서',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:11,),
                                  Text(
                                    '- 출,퇴근시 한 정거장 먼저 내려 걷기\n- 엘리베이터나 에스컬레이터 대신 계단을 이용하기\n- 가까운 거리는 걷거나 자전거를 이용하여 출근하기\n- 차를 가지고 출근할 경우 가능한 먼 곳에 주차하기\n- 화잘실이나 휴게실 이용 시 아래층이나 위층으로 가기\n- 직장 동료에게 E-mail, 메신저, 전화 대신 직접 가서 업무 보기\n- 걸어서 다녀올 수 있는 가능한 먼 곳에서 식사하기\n- 점심시간에 동료들과 주변을 거닐며 대화하기\n- 휴식시간에 커피마시면서 걷거나 산책하기\n- 틈트이 스트레칭하기\n- 동료들과 신체활동 증진을 위한 목표 하나를 선정하기\n- 앉아 있을 때는 허리와 가슴을 펴고 배에 힘을 주고 앉기\n- 컴퓨터 앞에 스트레칭 그림 붙여놓기',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:33,),
                                  SizedBox(height:33,),
                                  Text(
                                    '집에서',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:11,),
                                  Text(
                                    '- 장보기는 당일 필요한 양만을 구입하여 자주 보기\n- 가까운 거리는 걷거나 자전거를 이용하기\n- 누워 있는 시간 줄이기\n- 틈틈이 스트레칭하기\n- 가족이 함께 할 수 있는 활동적인 취미 만들기\n- 아이들과 활동적인 놀이하기\n- 엘리베이터보다 계단을 이용하기\n- 전화통화는 서서하기\n- TV를 볼 때는 가정용 자전거 타기 등 움직이기\n- TV를 볼 때 리모콘을 사용하지 않기',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:33,),
                                  SizedBox(height:33,),
                                  Text(
                                    '이동 시간에',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:11,),
                                  Text(
                                    '- 외출할 때는 걷거나, 자전거, 인라인스케이트를 이용하기\n- 목적지보다 한 정거장 먼저 내려서 걸어가기\n- 버스나 지하철을 기다리면서 계속 움직이기\n- 운전을 해야 할 경우 차에 타기 전 스트레칭하기\n- 버스나 지하철 안에서 서있기',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:33,),
                                  SizedBox(height:33,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 280,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                '끝내기',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(5,MediaQuery.of(context).padding.top, 0,0),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
