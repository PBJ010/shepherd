import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shepherd/program6.dart';
import 'authentication.dart';

class Program2 extends StatefulWidget {
  const Program2({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Program2State createState() => _Program2State();
}

class _Program2State extends State<Program2> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final accountController = TextEditingController();
  num _moneyback = 0;
  num _moneymethod = 0;
  num _moneyfor = 0;
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
                              Icons.pets,
                              size: 100,
                            ),
                            SizedBox(
                              height: 33,
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
                                    padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '머니백 예치금액',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Radio(
                                        fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                        value: 10,
                                        groupValue: _moneyback,
                                        onChanged: (value){
                                          setState(() {
                                            _moneyback = int.parse((value!).toString());
                                          });
                                        },
                                      ),
                                      Text(
                                        '10만원',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Radio(
                                        fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                        value: 15,
                                        groupValue: _moneyback,
                                        onChanged: (value){
                                          setState(() {
                                            _moneyback = int.parse((value!).toString());
                                          });
                                        },
                                      ),
                                      Text(
                                        '15만원',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Radio(
                                        fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                        value: 20,
                                        groupValue: _moneyback,
                                        onChanged: (value){
                                          setState(() {
                                            _moneyback = int.parse((value!).toString());
                                          });
                                        },
                                      ),
                                      Text(
                                        '20만원',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Radio(
                                        fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                        value: 25,
                                        groupValue: _moneyback,
                                        onChanged: (value){
                                          setState(() {
                                            _moneyback = int.parse((value!).toString());
                                          });
                                        },
                                      ),
                                      Text(
                                        '25만원',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Radio(
                                        fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                        value: 30,
                                        groupValue: _moneyback,
                                        onChanged: (value){
                                          setState(() {
                                            _moneyback = int.parse((value!).toString());
                                          });
                                        },
                                      ),
                                      Text(
                                        '35만원',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 11,),
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
                                    padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '환급 방식',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Radio(
                                        fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                        value: 0,
                                        groupValue: _moneymethod,
                                        onChanged: (value){
                                          setState(() {
                                            _moneymethod = int.parse((value!).toString());
                                          });
                                        },
                                      ),
                                      Text(
                                        '금액',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Radio(
                                        fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                        value: 1,
                                        groupValue: _moneymethod,
                                        onChanged: (value){
                                          setState(() {
                                            _moneymethod = int.parse((value!).toString());
                                          });
                                        },
                                      ),
                                      Text(
                                        '기프티콘',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 11,),
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
                                    padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '환급 대상',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        width: 130,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                              value: 0,
                                              groupValue: _moneyfor,
                                              onChanged: (value){
                                                setState(() {
                                                  _moneyfor = int.parse((value!).toString());
                                                });
                                              },
                                            ),
                                            Text(
                                              '본인',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 130,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                              value: 1,
                                              groupValue: _moneyfor,
                                              onChanged: (value){
                                                setState(() {
                                                  _moneyfor = int.parse((value!).toString());
                                                });
                                              },
                                            ),
                                            Text(
                                              '자녀',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        width: 130,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                              value: 2,
                                              groupValue: _moneyfor,
                                              onChanged: (value){
                                                setState(() {
                                                  _moneyfor = int.parse((value!).toString());
                                                });
                                              },
                                            ),
                                            Text(
                                              '배우자/연인',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 130,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Radio(
                                              fillColor: MaterialStateColor.resolveWith((state)=>Colors.lightBlue,),
                                              value: 3,
                                              groupValue: _moneyfor,
                                              onChanged: (value){
                                                setState(() {
                                                  _moneyfor = int.parse((value!).toString());
                                                });
                                              },
                                            ),
                                            Text(
                                              '부모님',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 11,),
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
                                          '계좌',
                                          style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextField(
                                          controller: accountController,
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Program6(name: widget.name)));
                              firestore.collection(AuthenticationHelper().getUid()).doc("moneyback").set({'data': _moneyback,});
                              firestore.collection(AuthenticationHelper().getUid()).doc("moneymethod").set({'data': _moneymethod,});
                              firestore.collection(AuthenticationHelper().getUid()).doc("moneyfor").set({'data': _moneyfor,});
                              firestore.collection(AuthenticationHelper().getUid()).doc("account").set({'data': accountController.text,});
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              '결제',
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
