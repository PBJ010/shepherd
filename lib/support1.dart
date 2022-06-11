import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'authentication.dart';

class Support1 extends StatefulWidget {
  const Support1({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  _Support1State createState() => _Support1State();
}

class _Support1State extends State<Support1> {
  List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List namebook = [];
  List phonebook = [];

  String nameList = "";
  String phoneList = "";

  Future<String> _fetch1() async {
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("namebook")
        .get()
        .then((DocumentSnapshot ds) {
      nameList = ds.get('data').toString();
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("phonebook")
        .get()
        .then((DocumentSnapshot ds) {
      phoneList = ds.get('data').toString();
    });
    if (nameList.length != 0) {
      namebook = nameList.split(",");
      phonebook = phoneList.split(",");
    }

    for (int i = 0; i < namebook.length; i++) {
      print("length:${namebook.length}");
      print("namebook[$i]=${namebook[i]}");
      print("phonebook[$i]=${phonebook[i]}");
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Center(
        child: Stack(
          children: [
            Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height - 120,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                height: 33,
                              ),
                              Text(
                                '💁‍♀️',
                                style: TextStyle(
                                  fontSize: 66,
                                ),
                              ),
                              SizedBox(
                                height: 33,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Text(
                                    widget.name +
                                        '님의 배우자, 가족, 애인, 친한 친구 등 금연을 도와줄 분의 연락처를 등록하세요!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      labelText: '이름',
                                      labelStyle:
                                          TextStyle(color: Colors.indigoAccent),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.indigoAccent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.indigoAccent),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                      labelText: '전화번호',
                                      labelStyle:
                                          TextStyle(color: Colors.indigoAccent),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.indigoAccent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.indigoAccent),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                                  SizedBox(height: 7),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (nameController.text.length != 0 &&
                                              phoneController.text.length != 0) {
                                            if (!nameController.text
                                                    .contains(",") &&
                                                !phoneController.text
                                                    .contains(",")) {
                                              namebook.add(nameController.text);
                                              phonebook.add(phoneController.text);
                                              for (int i = 0;
                                                  i < namebook.length;
                                                  i++) {
                                                print(
                                                    "namebook[$i]=${namebook[i]}");
                                                print(
                                                    "phonebook[$i]=${phonebook[i]}");
                                              }
                                              firestore
                                                  .collection(AuthenticationHelper().getUid())
                                                  .doc("namebook")
                                                  .update({
                                                "data": namebook.join(","),
                                              });
                                              firestore
                                                  .collection(AuthenticationHelper().getUid())
                                                  .doc("phonebook")
                                                  .update({
                                                "data": phonebook.join(","),
                                              });

                                            }
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.indigoAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Text(
                                        '등록하기',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FutureBuilder(
                                      future: _fetch1(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                                        if (snapshot.hasData == false) {
                                          return Container();
                                        }
                                        //error가 발생하게 될 경우 반환하게 되는 부분
                                        else if (snapshot.hasError) {
                                          return Container();
                                        }
                                        // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                                        else {
                                          return ListView.separated(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(8),
                                            itemCount: namebook.length,
                                            itemBuilder:
                                                (BuildContext context, int index) {
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          showDialog<String>(
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                              content: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    3 *
                                                                    2,
                                                                height: 50,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      namebook
                                                                          .removeAt(
                                                                              index);
                                                                      phonebook
                                                                          .removeAt(
                                                                              index);
                                                                      firestore
                                                                          .collection(AuthenticationHelper().getUid())
                                                                          .doc("namebook")
                                                                          .update({
                                                                        "data": namebook.join(","),
                                                                      });
                                                                      firestore
                                                                          .collection(AuthenticationHelper().getUid())
                                                                          .doc("phonebook")
                                                                          .update({
                                                                        "data": phonebook.join(","),
                                                                      });
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          width: 50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              setState(
                                                                                  () {
                                                                                namebook.removeAt(index);
                                                                                phonebook.removeAt(index);
                                                                                firestore
                                                                                    .collection(AuthenticationHelper().getUid())
                                                                                    .doc("namebook")
                                                                                    .update({
                                                                                  "data": namebook.join(","),
                                                                                });
                                                                                firestore
                                                                                    .collection(AuthenticationHelper().getUid())
                                                                                    .doc("phonebook")
                                                                                    .update({
                                                                                  "data": phonebook.join(","),
                                                                                });
                                                                                  });
                                                                              Navigator.of(context)
                                                                                  .pop();
                                                                            },
                                                                            style: ElevatedButton
                                                                                .styleFrom(
                                                                              primary:
                                                                                  Colors.red,
                                                                              shape:
                                                                                  const CircleBorder(),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment:
                                                                                  Alignment.center,
                                                                              child:
                                                                                  Icon(
                                                                                Icons.delete,
                                                                                size:
                                                                                    18,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 11,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            child:
                                                                                Text(
                                                                              '삭제하기',
                                                                              style:
                                                                                  TextStyle(
                                                                                color:
                                                                                    Colors.black,
                                                                                fontSize:
                                                                                    18,
                                                                                fontWeight:
                                                                                    FontWeight.w500,
                                                                              ),
                                                                              textAlign:
                                                                                  TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors.grey,
                                                          shape:
                                                              const CircleBorder(),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            namebook[index]
                                                                .toString().toUpperCase()
                                                                .substring(0, 1),
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          namebook[index]
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          phonebook[index]
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          launch("tel:"+phonebook[index].toString());
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors.green,
                                                          shape:
                                                              const CircleBorder(),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                            Icons.call,
                                                            size: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context, int index) =>
                                                    const Divider(),
                                          );
                                        }
                                      }),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      '금연도움 연계',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey.withOpacity(0),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '금연상담전화',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      '1544-9030',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      launch("tel:15449030");
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.green,
                                                      shape: const CircleBorder(),
                                                    ),
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Icon(
                                                        Icons.call,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    '월~금 : 09:00~22:00',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    '주말/공휴일 : 09:00~18:00',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                ],
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
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/homepage', (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                '완료',
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
