import 'package:flutter/material.dart';
import 'package:shepherd/editprofile.dart';
import 'package:shepherd/note_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'newstop.dart';

class Help8 extends StatefulWidget {
  const Help8({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<Help8> createState() => _Help8State();
}

class _Help8State extends State<Help8> {
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
                                '🧗‍♀️',
                                style: TextStyle(
                                  fontSize: 66,
                                ),
                              ),
                              SizedBox(height:33,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 22,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text:
                                          '지금부터 다시 금연을 시작하면 됩니다. 오늘의 힘들었던 상황을 바탕으로, 앞으로 비슷한 상황에 처할 경우 어떻게 대처할지 계획을 세워보는 것도 좋습니다.',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context)=>HomeScreen(name: widget.name)));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 15, 15, 7.5),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 150,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '·  ',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                Text(
                                                  '일기 작성하기',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (context)=>EditProfile(name: widget.name,)));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 15, 15, 7.5),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 150,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '·  ',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                Text(
                                                  '금연 문구 수정하기',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T85C86/G/41/list.do");
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 15, 15, 7.5),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 150,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  '·  ',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                Text(
                                                  '게시판에 글 적기',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text:
                                          'STOP DAY를 다시 설정해봅시다. 마음을 가다듬고 다시 정신을 차린 지금부터 다시 금연하는 것이 어떨까요?',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          children: <TextSpan>[
                                          ]
                                      )
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewStop(name: widget.name)));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                'STOP DAY 재설정',
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
