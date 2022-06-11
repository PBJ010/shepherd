import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';
import 'nicotine7.dart';

class Nicotine6 extends StatefulWidget {
  const Nicotine6({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Nicotine6State createState() => _Nicotine6State();
}

class _Nicotine6State extends State<Nicotine6> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  num _smokingearly = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),
                        Image.asset(
                          'repo/images/lung.png',
                          fit: BoxFit.contain,
                          height: 180,
                        ),
                        SizedBox(
                          height: 101,
                        ),
                        Text(
                          '깨어나서 처음 몇 시간 피우는 흡연량이 하루의 다른 때보다 더 많습니까?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        RadioListTile(
                          title: Text('예'),
                          value: 1,
                          groupValue: _smokingearly,
                          onChanged: (value) {
                            setState(() {
                              _smokingearly = int.parse((value!).toString());
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('아니오'),
                          value: 0,
                          groupValue: _smokingearly,
                          onChanged: (value) {
                            setState(() {
                              _smokingearly = int.parse((value!).toString());
                            });
                          },
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Nicotine7(name: widget.name)));
                          firestore
                              .collection(AuthenticationHelper().getUid())
                              .doc("smokingearly")
                              .set({
                            'data': _smokingearly,
                          });
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
    );
  }
}
