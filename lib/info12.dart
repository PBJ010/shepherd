import 'package:flutter/material.dart';

class Info12 extends StatefulWidget {
  const Info12({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Info12State createState() => _Info12State();
}

class _Info12State extends State<Info12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 33,
                color: Colors.white,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 130,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 33,
                          ),
                          Text(
                            '금단 트리거',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '오랜 기간 흡연했다면, 당신의 몸은 일정한 양의 니코틴에 익숙해져 있을 것입니다. 금연을 시작하면, 금단 증상으로 인해 흡연 욕구가 생길 것입니다.\n\n· 두통\n· 집중력 저하\n· 불안/짜증',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 33,
                          ),
                          Text(
                            '금단 트리거를 이겨내는 법',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '주의 분산시키기\n흡연 욕구를 잊을 수 있는 다른 일을 찾아보세요. 예를 들어, 산책하기, 샤워하기, 빨래 널기 등의 일과를 수행해보세요.\n\n니코틴 대체요법 / 약물\n니코틴 대체요법이나 약물은 금단 증상을 줄일 뿐만 아니라 금연 확률을 두배 이상 늘려줍니다. 해당 요법을 사용 가능한지 담당 의사와 상담해보세요.',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
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
                          primary: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
