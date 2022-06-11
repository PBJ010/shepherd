import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
import 'nicotine1.dart';
class Program5 extends StatefulWidget {
  const Program5({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Program5State createState() => _Program5State();
}

class _Program5State extends State<Program5> {
  final moneyController = TextEditingController();
  final addressController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 128,
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
                              Icons.book_rounded,
                              size: 100,
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            Text(
                              '정보 입력',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(37, 18, 37, 18),
                              child: Text(
                                '개인별 맞춤형 금연 솔루션을 위한 기본 정보를 입력해 주세요.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              width: MediaQuery.of(context).size.width - 88,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '하루 담배값',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextField(
                                          controller: moneyController,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                              ),
                              width: MediaQuery.of(context).size.width - 88,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '주소',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextField(
                                          controller: addressController,
                                        ),
                                        SizedBox(height:7,),
                                        Text(
                                          '입력하신 주소지로 breath pen을 배송해 드립니다.',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Nicotine1(name: widget.name)));
                              if(moneyController.text.length==0){
                                firestore.collection(AuthenticationHelper().getUid()).doc("money").set({'data': 0,});
                              } else {
                                firestore.collection(AuthenticationHelper().getUid()).doc("money").set({'data': int.parse(moneyController.text),});
                              }
                              firestore.collection(AuthenticationHelper().getUid()).doc("address").set({'data': addressController.text,});
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              '다음 단계로',
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
