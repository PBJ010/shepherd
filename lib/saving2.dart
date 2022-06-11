import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shepherd/saving3.dart';
import 'package:shepherd/saving5.dart';

import 'authentication.dart';

class Saving2 extends StatefulWidget {
  const Saving2({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  _Saving2State createState() => _Saving2State();
}

class _Saving2State extends State<Saving2> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _itemList = List.generate(10001, (i) {
    var f = NumberFormat('###,###,###,###');
    return f.format(i + 1000);
  });
  String _result = "4,500";

  @override
  Widget build(BuildContext context) {
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
                  '담배 한 갑에 평균적으로 지불하는 금액은 얼마입니까?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height:70,
                ),
                Text(
                  '₩'+_result,
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w500,
                    ),
                ),
                SizedBox(
                  height:60,
                ),
                Container(
                  height: 93,
                  child: CupertinoPicker(
                    children: _itemList.map((e){
                      return Container(
                        width: 100,
                        height: 44,
                        child: Center(
                          child: Text(
                            '₩$e',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )
                          ),
                        ),
                      );
                    }).toList(),
                    itemExtent: 44,
                    scrollController:
                        FixedExtentScrollController(initialItem: 3500),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        _result = _itemList[index];
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
                Text(
                  '예상되는 금액은 나이, 성별, 하루에 피우는 담배, 기대 수명 등으로 추산됩니다.',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
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
                              firestore
                                  .collection(AuthenticationHelper().getUid())
                                  .doc("moneyper")
                                  .update({
                                'data': int.parse((_result.replaceAll(',', ''))),
                              });
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Saving5(name: widget.name),),);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              '완료',
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
