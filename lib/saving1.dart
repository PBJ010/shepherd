import 'package:flutter/material.dart';
import 'package:shepherd/saving2.dart';
import 'package:shepherd/saving3.dart';
import 'package:shepherd/saving4.dart';
import 'package:shepherd/saving5.dart';

class Saving1 extends StatelessWidget {
  const Saving1({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFCFD),
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.home,
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/homepage', (route) => false);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.checklist,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Saving5(name: name)));
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xffFAFCFD),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '💵',
                  style: TextStyle(
                    fontSize: 130,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 33,
                ),
                Text(
                  '절약 계획을 세워보세요',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  '금연과 저축을 통해 새로운 아이템을 구입하거나 이벤트를 수립할 수 있습니다',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 280,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Saving3(name: name),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              '아이템 계획하기',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        SizedBox(
                          width: 280,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Saving4(name: name),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              '이벤트 계획하기',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
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
