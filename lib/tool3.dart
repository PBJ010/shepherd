import 'package:flutter/material.dart';
import 'package:shepherd/tool1.dart';

import 'info1.dart';
import 'info2.dart';

class Tool3 extends StatefulWidget {
  const Tool3({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<Tool3> createState() => _Tool3State();
}

class _Tool3State extends State<Tool3> {
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
                                            '니코틴패치',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            '피부를 통해 신체에 니코틴을 제공하여, 흡연 욕구 및 금단 증상을 줄여 줍니다. 다른 니코틴 대체제만큼 중독성이 강하지 않습니다.',
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
                                                      '1일 1회 1매씩 건조하고 손상되지 않은 신체부분(엉덩이, 팔안쪽, 등, 가슴 등)의 털이 없는 피부에 매일 부위를 바꾸며 부착',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
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
                                                  '16시간 지속형 : 매일 아침에 일어나자마자 1매를 부착하고 취침 시에 뗌',
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
                                                  '24시간 지속형 : 매일 1회 1매를 24시간 동안 부착하고 뗌',
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
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '치료기간) ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                  '16시간 지속형은 6개월 이내, 24시간 지속형은 3개월 이내',
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
                                                  '부착 부위에 피부 발진이 생길 수 있습니다. 다른 부위에 부착하거나, 항히스타민 크림/연고/젤을 바르면 도움이 됩니다.',
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
                                                  '24시간 지속형의 경우 수면을 방해할 수 있습니다. 잠들기 몇 시간 전에 패치를 제거하면 도움이 됩니다.',
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
                                            MaterialPageRoute(builder: (context)=>Info1(name: widget.name)), (route) => false);
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
                                            MaterialPageRoute(builder: (context)=>Info2(name: widget.name)), (route) => false);
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
