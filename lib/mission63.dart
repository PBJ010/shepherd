import 'package:flutter/material.dart';

class Mission63 extends StatefulWidget {
  const Mission63({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Mission63State createState() => _Mission63State();
}

class _Mission63State extends State<Mission63> {
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
                            '진정한 금연을 달성하기 위해서는 비흡연자와 같은 환경에서 일상을 보내는 것이 중요합니다.\n\n담배갑, 재떨이, 라이터 등 흡연을 연상시키는 모든 물건을 과감히 버려보세요.\n\n그 외에도 자신만의 방법으로 주변 환경을 금연을 유지하는데 도움이 될 수 있도록 정돈해보세요.\n\n금연을 유지하는 건 정말 어렵지만, 담배를 피우게 되는 유혹은 순간이라는 것을 기억하세요!',
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
