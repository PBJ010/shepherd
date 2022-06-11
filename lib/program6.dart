import 'package:flutter/material.dart';
import 'package:shepherd/program7.dart';

class Program6 extends StatefulWidget {
  const Program6({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  _Program6State createState() => _Program6State();
}

class _Program6State extends State<Program6> {
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
                          Icons.date_range,
                          color: Colors.redAccent,
                          size: 100,
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        Text(
                          'STOP DAY(담배 끊는 날)을 정해 봅시다!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height:33,),
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.card_giftcard,
                                      size: 18,
                                    ),
                                    SizedBox(width:10,),
                                    Container(
                                      width: MediaQuery.of(context).size.width - 99,
                                      child: Text(
                                        'STOP DAY는 의미있는 날이 좋습니다. (자신이나 주변인들의 생일, 결혼기념일, 연인과 만난 지 100일째 되는 날 등)',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        SizedBox(height:22,),
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.thumb_up_alt_outlined,
                                      size: 18,
                                    ),
                                    SizedBox(width:10,),
                                    Container(
                                      width: MediaQuery.of(context).size.width - 99,
                                      child: Text(
                                        '특별한 날이 아니더라도 스트레스가 적은 공휴일이나 일요일을 기준으로 시작하는 것도 좋습니다.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        SizedBox(height:22,),
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time,
                                      size: 18,
                                    ),
                                    SizedBox(width:10,),
                                    Container(
                                      width: MediaQuery.of(context).size.width - 99,
                                      child: Text(
                                        '2주 이내의 날짜로 금연 시작일을 정하시기 바랍니다. 너무 오래 기다린 후 시작하면 결심이 식어버릴 수 있습니다.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        SizedBox(height:22,),
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.trending_up,
                                      size: 18,
                                    ),
                                    SizedBox(width:10,),
                                    Container(
                                      width: MediaQuery.of(context).size.width - 99,
                                      child: Text(
                                        '정하신 STOP DAY 이후에는 담배를 한 대도 피우지 않는 본격적인 금연에 들어가게 됩니다.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ]),
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Program7(name: widget.name)));
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
