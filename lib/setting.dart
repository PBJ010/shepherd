import 'package:flutter/material.dart';
import 'package:shepherd/note_screen.dart';
import 'package:shepherd/tool1.dart';

import 'info1.dart';
import 'info2.dart';
import 'myaccount.dart';
import 'myprofile.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
                color: const Color(0xffFAFCFD),
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
                              Icons.pets,
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
                                      height: 156,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyProfile(name: widget.name)));
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
                                              '프로필 수정하기',
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
                                      height: 156,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(name: widget.name)));
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
                                              '금연일기',
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
                                      height: 156,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyAccount(name: widget.name)));
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
                                              '계정 정보',
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
                                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Info1(name: widget.name)), (route) => false);
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
                                                MaterialPageRoute(builder: (context)=>Info2(name: widget.name),), (route) => false);
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
