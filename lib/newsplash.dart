import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class NewSplash extends StatefulWidget {
  const NewSplash({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  _NewSplashState createState() => _NewSplashState();
}

class _NewSplashState extends State<NewSplash> {
  Future<String> _fetch1() async {
    bool data = false;
    // Change to API call
    await Future.delayed(Duration(seconds: 5), () {
      data = true;
    });
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetch1(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
          if (snapshot.hasData == false) {
            return Scaffold(
              body: Container(
                  color: Colors.indigo,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SHEPHERD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        SizedBox(
                          height: 33,
                          child: SpinKitCubeGrid(
                            color: Colors.white,
                            size: 33,
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          }
          //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return Scaffold(
              body: Container(
                  color: Colors.indigo,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SHEPHERD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        SizedBox(
                          height: 33,
                          child: SpinKitCubeGrid(
                            color: Colors.white,
                            size: 33,
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
          else {
            return Scaffold(
              body: Container(
                  color: Colors.indigo,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '새로고침 과정에서 오류가 발생하였습니다.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        SizedBox(
                          height: 33,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/loginpage', (route) => false);
                            },
                            child: Icon(
                              Icons.restart_alt,
                              size: 33,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          }
        });
  }
}


