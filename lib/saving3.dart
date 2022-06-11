import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shepherd/saving4.dart';
import 'package:shepherd/saving5.dart';

import 'authentication.dart';
import 'newsplash.dart';

class Saving3 extends StatefulWidget {
  const Saving3({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  _Saving3State createState() => _Saving3State();
}

class _Saving3State extends State<Saving3> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final itemController = TextEditingController();
  final moneyController = TextEditingController();
  String itemData = "";
  Future<String> _fetch1() async {
    String uid = (_auth.currentUser)!.uid;
    await firestore
        .collection(uid)
        .doc("moneyforitem")
        .get()
        .then((DocumentSnapshot ds) {
      itemData = ds.get('data').toString();
    });

    return '';
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetch1(),
        builder:
            (BuildContext context, AsyncSnapshot snapshot) {
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
                backgroundColor: const Color(0xffFAFCFD),
                foregroundColor: Colors.black,
                shadowColor: Colors.transparent,
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
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          '절약해서 사고 싶은 아이템은 무엇인가요?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height:22,),
                        TextField(
                          controller: itemController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: '아이템 이름',
                          ),
                        ),
                        SizedBox(height:22,),
                        TextField(
                          controller: moneyController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '아이템 가격',
                          ),
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
                                      if (itemController.text.replaceAll("+", "").replaceAll(";", "")!="" && moneyController.text.replaceAll("+", "").replaceAll(";", "")!=""){
                                        firestore
                                            .collection(AuthenticationHelper().getUid())
                                            .doc("moneyforitem")
                                            .update({
                                          'data': itemData+itemController.text.replaceAll("+", "").replaceAll(";", "")+"+"+moneyController.text.replaceAll("+", "").replaceAll(";", "")+";",
                                        });
                                      }
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Saving5(name: widget.name),),);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.deepOrangeAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    child: Text(
                                      '다음',
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
        });
  }
}
