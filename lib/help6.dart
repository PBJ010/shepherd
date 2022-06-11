import 'package:flutter/material.dart';
import 'package:shepherd/support1.dart';
import 'package:url_launcher/url_launcher.dart';

class Help6 extends StatefulWidget {
  const Help6({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<Help6> createState() => _Help6State();
}

class _Help6State extends State<Help6> {
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
                                '👩‍',
                                style: TextStyle(
                                  fontSize: 66,
                                ),
                              ),
                              SizedBox(height:33,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '전문가 도움받기',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:33,),
                                  Text(
                                    '  전화 상담 연결, AI 상담을 받을 수 있습니다. 혼자 참기 어렵거나, 금단증상이 심한 경우 보건소/병원을 방문하는 것이 도움이 됩니다.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height:33,),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width - 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context).size.width - 60,
                                            height: 88,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Support1(name: widget.name)));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.transparent,
                                                shadowColor: Colors.transparent,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                  Text(
                                                    '전화 상담 연결',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black38,
                                                    size: 25,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 1,
                                            color: Colors.black12,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width - 60,
                                            height: 88,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.transparent,
                                                shadowColor: Colors.transparent,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                  Text(
                                                    'AI 상담',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black38,
                                                    size: 25,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 1,
                                            color: Colors.black12,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width - 60,
                                            height: 88,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                launch("https://www.google.com/maps");
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.transparent,
                                                shadowColor: Colors.transparent,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                  Text(
                                                    '보건소/병원 방문',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black38,
                                                    size: 25,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
