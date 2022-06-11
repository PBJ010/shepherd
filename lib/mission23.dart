import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/newsplash.dart';
import 'authentication.dart';
import 'mission24.dart';

class Mission23 extends StatefulWidget {
  const Mission23({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Mission23State createState() => _Mission23State();
}

class _Mission23State extends State<Mission23> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int stoptime = 0;
  int datetime = 0;

  Future<String> _fetch1() async {
    await firestore.collection(AuthenticationHelper().getUid())
        .doc("stoptime")
        .get()
        .then((DocumentSnapshot ds) {
      stoptime = int.parse(ds.get('data').toString());
    });
    datetime = DateTime.now().millisecondsSinceEpoch-stoptime>0?DateTime.now().millisecondsSinceEpoch-stoptime:0;

    return ' ';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetch1(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
          if (snapshot.hasData == false) {
            return NewSplash(name: widget.name);
          }
          //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return NewSplash(name: widget.name);
          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
          else {
            return Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.black38, //change your color here
                ),
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent,
              ),
              body: Container(
                color: Colors.white,
                child: Center(
                  child:           Container(
                    child: Padding(
                      padding: EdgeInsets.all(33),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height - 270,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '점검하기',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 33),
                                  Text(
                                    '현재 '+widget.name+'님은 금연하신지 '+(datetime/86400000).toInt().toString()+'일 되셨습니다. 현재 금연에 대한 의지를 얼마나 유지하고 계신지 생각해보는 시간을 가져보려고 합니다.\n\n1점부터 10점까지 점수를 매긴다면, 현재 금연에 대한 의지는 몇 점 정도입니까?\n\n(1점: 금연에 대한 의지가 남아있지 않다, 10점: 금연에 대한 의지가 강력하다)',
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 299,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mission24(name: widget.name)));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrangeAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                      ),
                                      child: Text(
                                        '다음',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        });

  }
}
