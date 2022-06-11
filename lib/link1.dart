import 'package:flutter/material.dart';
import 'package:shepherd/tool3.dart';
import 'package:shepherd/tool5.dart';
import 'package:shepherd/tool6.dart';

class Link1 extends StatefulWidget {
  const Link1({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<Link1> createState() => _Link1State();
}

class _Link1State extends State<Link1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 70,
                              ),
                              Icon(
                                Icons.medical_services,
                                color: Colors.indigo,
                                size: 100,
                              ),
                              SizedBox(
                                height: 33,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(33, 10, 33, 33),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '금연치료제',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '금연을 도와주는 의약품으로, 크게 두 가지 종류로 나뉩니다.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '니코틴 대체재(Nicotine Replacement Therapy, NRT)',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                            '금연 시 가장 많이 이용하는 방법으로, 처방전 없이 약국에서 구매 가능합니다. ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '금연 확률을 두 배 이상 높여준다',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '는 것이 연구를 통해 밝혀졌습니다.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ])),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '담배에는 니코틴 외에 다른 위험한 물질들이 포함되어 있습니다. 이들을 제외한 소량의 니코틴만을 조절하여 제공함으로써, 금단 증상을 줄여줍니다.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '중등도 이상 흡연자의 경우, 니코틴 대체재와 병행하여 금연하시길 추천드립니다.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tool3(name: widget.name)));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0, 15, 15, 7.5),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 150,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '·  ',
                                                    style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  Text(
                                                    '니코틴패치',
                                                    style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      decoration: TextDecoration.underline,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                              color: Colors.black54,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tool5(name: widget.name)));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0, 7.5, 15, 7.5),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 150,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '·  ',
                                                    style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  Text(
                                                    '니코틴껌',
                                                    style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      decoration: TextDecoration.underline,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                              color: Colors.black54,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Tool6(name: widget.name)));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0, 7.5, 15, 15),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 150,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '·  ',
                                                    style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  Text(
                                                    '니코틴트로키(사탕)',
                                                    style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      decoration: TextDecoration.underline,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                              color: Colors.black54,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '니코틴 대체재는 대부분의 건강한 성인들에게 안전하게 여겨지지만, 의사/약사에게 잠재적인 위험이나 부작용에 대한 충분한 설명을 듣고 사용하시길 바랍니다.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '주의) 니코틴 대체재는 금연 중인 분들만 사용하는 것으로, 아직 흡연을 하고 계신 경우 사용하시면 안됩니다. 임산부, 청소년은 사용하시면 안됩니다.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '금연 약물',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      '보건소나 일반 병원에서 의사의 처방전을 통해 구입할 수 있습니다. 이 약물들은 니코틴을 포함하지 않습니다.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 15, 15, 7.5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '·  ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            '챈틱스 (Varenicline tartrate)',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 7.5, 15, 15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '·  ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            '자이반 (Bupropion hydrochloride)',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '주로 금연 시작일 몇 주 전부터 복용을 시작합니다. 의사와 상담을 통해 복용 여부를 결정하세요.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
              ],
            )),
      ),
    );
  }
}
