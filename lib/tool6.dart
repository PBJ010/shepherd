import 'package:flutter/material.dart';
import 'package:shepherd/info2.dart';
import 'package:shepherd/tool1.dart';

import 'info1.dart';

class Tool6 extends StatefulWidget {
  const Tool6({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<Tool6> createState() => _Tool6State();
}

class _Tool6State extends State<Tool6> {
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
                    child: Container(
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 70,
                                ),
                                Icon(
                                  Icons.medical_services,
                                  color: Colors.indigo,
                                  size: 100,
                                ),
                                SizedBox(
                                  height: 33,
                                ),
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
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Text(
                                            '💊',
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '니코틴트로키(사탕)',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            '니코틴트로키는 사탕의 형태로, 니코틴이 입을 통해 흡수되어 갈망과 금단 증상을 줄여줍니다. 껌을 씹을 수 없거나, 선호하지 않는 분들에게 좋습니다.',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '사용법) ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '정해진 스케쥴 없이 원하는 때에 사탕을 먹으면 됩니다.',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            '부작용) ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                ' · ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '드물게 두통, 복통, 가슴 통증을 느낄 수 있습니다.',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                ' · ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '딸꾹질',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                            MaterialPageRoute(builder: (context)=>Info1(name:widget.name,)), (route) => false);
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
                                            MaterialPageRoute(builder: (context)=>Info2(name:widget.name,)), (route) => false);
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
