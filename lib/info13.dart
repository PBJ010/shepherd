import 'package:flutter/material.dart';

import 'info16.dart';

class Info13 extends StatefulWidget {
  const Info13({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Info13State createState() => _Info13State();
}

class _Info13State extends State<Info13> {
  var _healthList = [
    100,
    100,
    100,
    100,
    50,
    50,
    50,
    10,
    5,
    5,
    5,
    0
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 130,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 33,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: Text(
                                  '건강 회복 정보',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.black12,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                '전신 회복',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.black12,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '체온',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[0]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[0]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[0])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '혈압',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[1]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[1]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[1])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '맥박',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[2]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[2]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[2])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '산소포화도',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[3]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[3]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[3])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '말초 신경',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[4]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[4]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[4])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '후각',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[5]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[5]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[5])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '미각',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[6]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[6]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[6])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '혈액 순환',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[7]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[7]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[7])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '폐 기능',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[8]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[8]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[8])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '신경수용체',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[9]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[9]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[9])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '폐 섬모',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[10]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[10]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[10])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Info16(name: widget.name)));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 11,
                                        ),
                                        Text(
                                          '생식 능력',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${_healthList[11]}%',
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(width:11,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*(_healthList[11]/100),
                                          height: 2,
                                          color: Colors.lightBlueAccent.withOpacity(0.7),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*((100-_healthList[11])/100),
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height:7,),
                                  ],
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.black12,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                '증상 회복',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                        ),
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
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 280,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
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
    );
  }
}
