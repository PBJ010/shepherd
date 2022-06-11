import 'package:firebase_auth/firebase_auth.dart';
import 'loginpage.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class Middle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance
          .authStateChanges(), //firebase 상태가 바뀌었는지 아닌지 체크하는 stream.
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (!snapshot.hasData) {
          return LoginPage(); //data가 없으므로 로그인 페이지로
        } else {
          return MyHomePage(); // data가 있으므로 바로 메인 페이지로
        }
      },
    );
  }
}
