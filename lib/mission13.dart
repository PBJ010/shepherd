import 'package:flutter/material.dart';

class Mission13 extends StatefulWidget {
  const Mission13({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Mission13State createState() => _Mission13State();
}

class _Mission13State extends State<Mission13> {
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
                            '물을 마시는 것은 금연하는데 오랫동안 사용된 가장 좋은 방법 중의 하나로서 시원한 물은 입속의 감각을 다르게 하여 흡연욕구를 많이 없애줍니다. 그리고 물은 니코틴과 각종 노폐물의 배설을 촉진시켜줍니다.\n\n규칙적으로 물을 마시는 습관을 기르는 것은 금연을 시도하고 있는 도중에 특히 중요합니다. 금연을 시도한다는 것은 강력한 습관 중 하나를 중단하는 것이기 때문에, 그 습관을 다른 습관으로 대체해야 할 필요가 있습니다. ',
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
                                Navigator.of(context).pushNamed('/alarm');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.fromLTRB(15,15,15,15),
                              ),
                              child: Text(
                                '알람 설정',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 299,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.fromLTRB(15,15,15,15),
                              ),
                              child: Text(
                                '다음에 하기',
                                style: TextStyle(
                                  color: Colors.deepOrangeAccent,
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
