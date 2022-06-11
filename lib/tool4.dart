import 'package:flutter/material.dart';
import 'package:shepherd/tool1.dart';
import 'package:url_launcher/url_launcher.dart';

import 'info1.dart';
import 'info2.dart';

class Tool4 extends StatefulWidget {
  const Tool4({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<Tool4> createState() => _Tool4State();
}

class _Tool4State extends State<Tool4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: const Color(0xffFAFCFD),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 70,
                            ),
                            Icon(
                              Icons.pets,
                              size: 100,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              '궁금한 점이 생길 때 언제든 물어보세요!\n셰퍼드가 알기 쉽게 궁금증을 해결해 드리겠습니다!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/program/S1T33C210/bbs/knowledge/list.do?tag_name=&rows=&cpage=1&cat=&article_seq=&thumb_type=&board_seq=&condition=TITLE&keyword=%EA%B8%88%EB%8B%A8%EC%A6%9D%EC%83%81", forceWebView: true, forceSafariVC: true);
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
                                              '금단증상 바로알기',
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T33C111/H/24/list.do?tag_name=&rows=10&cpage=1&cat=33&article_seq=&thumb_type=&condition=TITLE_TAG_CONTS&keyword=", forceWebView: true, forceSafariVC: true);
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
                                              '흡연욕구 다스리기',
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T33C111/H/24/list.do?tag_name=&rows=10&cpage=1&cat=34&article_seq=&thumb_type=&condition=TITLE_TAG_CONTS&keyword=", forceWebView: true, forceSafariVC: true);
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
                                              '금연 후 체중관리',
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T33C111/H/24/list.do?tag_name=&rows=10&cpage=1&cat=35&article_seq=&thumb_type=&condition=TITLE_TAG_CONTS&keyword=", forceWebView: true, forceSafariVC: true);
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
                                              '금연과 운동',
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T33C111/H/24/list.do?tag_name=&rows=10&cpage=1&cat=36&article_seq=&thumb_type=&condition=TITLE_TAG_CONTS&keyword=", forceWebView: true, forceSafariVC: true);
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
                                              '절주 관리',
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T33C111/H/24/list.do?tag_name=&rows=10&cpage=1&cat=61&article_seq=&thumb_type=&condition=TITLE_TAG_CONTS&keyword=", forceWebView: true, forceSafariVC: true);
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
                                              '식사 관리',
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T33C111/H/24/list.do?tag_name=&rows=10&cpage=1&cat=37&article_seq=&thumb_type=&condition=TITLE_TAG_CONTS&keyword=", forceWebView: true, forceSafariVC: true);
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
                                              '스트레스 관리',
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T33C111/H/24/list.do?tag_name=&rows=10&cpage=1&cat=38&article_seq=&thumb_type=&condition=TITLE_TAG_CONTS&keyword=", forceWebView: true, forceSafariVC: true);
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
                                              '자기 보상',
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T33C111/H/24/list.do?tag_name=&rows=10&cpage=1&cat=39&article_seq=&thumb_type=&condition=TITLE_TAG_CONTS&keyword=", forceWebView: true, forceSafariVC: true);
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
                                              '재흡연 후 재도전',
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
                                        onPressed: () async {
                                          await launch("https://www.nosmokeguide.go.kr/lay2/bbs/S1T33C111/H/24/list.do?tag_name=&rows=10&cpage=1&cat=40&article_seq=&thumb_type=&condition=TITLE_TAG_CONTS&keyword=", forceWebView: true, forceSafariVC: true);
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
                                              '셀프 금연 치료',
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
                                        onPressed: () async {
                                          await launch("", forceWebView: true, forceSafariVC: true);
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
                                              '전자 담배',
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
                                        onPressed: () async {
                                          await launch("", forceWebView: true, forceSafariVC: true);
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
                                              '흡연/금연 최신 기사',
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
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: Container(
                                  color: const Color(0xffFAFCFD),
                                ),
                              ),
                              Container(
                                height: 40,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 18,
                                          ),
                                          Icon(
                                            Icons.home,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text('    홈    ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ))
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 18,
                                          ),
                                          Icon(
                                            Icons.graphic_eq,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text('진행상황',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ))
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 18,
                                          ),
                                          Icon(
                                            Icons.brightness_1_outlined,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text('흡연욕구',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ))
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 18,
                                          ),
                                          Icon(
                                            Icons.library_books,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text('  도구  ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ))
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 18,
                                          ),
                                          Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text('점검하기',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.transparent,
                            child: Column(children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                            '/homepage', (route) => false);
                                      },
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width /
                                            5,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                            MaterialPageRoute(builder: (context)=>Info1(name: widget.name,)), (route) => false);
                                      },
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width /
                                            5,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                            MaterialPageRoute(builder: (context)=>Info2(name: widget.name,)), (route) => false);
                                      },
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width /
                                            5,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              5,
                                          color: Colors.transparent,
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Image.asset(
                                              'repo/images/homebtn.png',
                                              fit: BoxFit.contain,
                                              height: 55,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                            MaterialPageRoute(builder: (context)=>Tool1(name: widget.name)), (route) => false);
                                      },
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width /
                                            5,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width /
                                            5,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
