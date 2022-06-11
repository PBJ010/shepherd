import 'package:flutter/material.dart';
import 'package:shepherd/tool1.dart';
import 'package:shepherd/tool3.dart';

import 'info1.dart';
import 'info2.dart';

class Tool2 extends StatefulWidget {
  const Tool2(this.name, {Key? key}) : super(key: key);
  final String name;

  @override
  State<Tool2> createState() => _Tool2State();
}

class _Tool2State extends State<Tool2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
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
                            child: Column(
                              children: <Widget>[
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
                                        Text(
                                          '💊',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '바레니클린',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '챔픽스',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
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
                                        Text(
                                          '💊',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '부프로피온',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
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
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tool3(name: widget.name)));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          '💊',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '니코틴패치',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
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
                                        Text(
                                          '💊',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '니코틴껌',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
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
                                        Text(
                                          '💊',
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '니코틴트로키',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '사탕',
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
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
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0, -3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Info1(name: widget.name,)), (route) => false);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Info2(name: widget.name,)), (route) => false);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 18,
                                      ),
                                      Icon(
                                        Icons.brightness_1_outlined,
                                        color: Colors.black,
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
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Tool1(name: widget.name)), (route) => false);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
