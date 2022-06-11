import 'package:flutter/material.dart';

class Mission53 extends StatefulWidget {
  const Mission53({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Mission53State createState() => _Mission53State();
}

class _Mission53State extends State<Mission53> {
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
                            '중요성',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 33),
                          Text(
                            '최근 금연을 시작하면서 걱정이 많아지거나 불안하신가요? 이는 금연을 하면서 느끼는 지극히 자연스러운 감정이며, 연구에 따르면 금연 시작 후 12일 경에 최고점을 찍고, 4-6주 후 가라앉는다고 알려져 있습니다.\n\n자연스러운 감정이지만, 이를 다스리는 것은 중요합니다. 아래 리스트를 참고해 금연을 하면서 느끼는 불안함과 걱정을 다스려 보세요!\n\n· 카페인 섭취 줄이기\n· 따뜻한 물로 샤워 or 목욕\n· 마사지 받기\n· 밖에서 산책하기\n· 이발하기',
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
                                '완료',
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
