import 'package:flutter/material.dart';

import 'info5.dart';

class Info4 extends StatefulWidget {
  const Info4({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Info4State createState() => _Info4State();
}

class _Info4State extends State<Info4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        shadowColor: Colors.transparent,
        title: Text(""),
        actions: <Widget>[
          new IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
            },
            icon: new Icon(Icons.cancel),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.indigo,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 260,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[

                Padding(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 22,
                            ),
                            Image.asset(
                              'repo/images/victory.png',
                              height: 180,
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            Text(
                              '흡연욕구를 견뎌냈습니다!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            Text(
                              '계속해서 성공적인 금연을\n유지하시길 응원하겠습니다.\n흡연욕구가 생길 때 언제든지\n다시 찾아주세요!',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ],),),),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info5(name: widget.name,)));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          ),
                          child: Text(
                            '내 흡연욕구 기록하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          ),
                          child: Text(
                            '마치기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
