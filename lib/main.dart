import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shepherd/help1.dart';
import 'package:shepherd/help6.dart';
import 'package:shepherd/info66.dart';
import 'dis1.dart';
import 'dis2.dart';
import 'dis3.dart';
import 'dis4.dart';
import 'dis5.dart';
import 'dis6.dart';
import 'dis7.dart';
import 'dis8.dart';
import 'dis9.dart';
import 'dis10.dart';
import 'dis11.dart';
import 'dis12.dart';
import 'sym1.dart';
import 'sym2.dart';
import 'sym3.dart';
import 'sym4.dart';
import 'sym5.dart';
import 'sym6.dart';
import 'sym7.dart';
import 'sym8.dart';
import 'sym9.dart';
import 'sym10.dart';
import 'sym11.dart';
import 'body1.dart';
import 'body2.dart';
import 'body3.dart';
import 'body4.dart';
import 'body5.dart';
import 'body6.dart';
import 'body7.dart';
import 'body8.dart';
import 'body9.dart';
import 'body10.dart';
import 'body11.dart';
import 'body12.dart';
import 'body13.dart';
import 'body14.dart';
import 'firebase_options.dart';
import 'help2.dart';
import 'help3.dart';
import 'help4.dart';
import 'help5.dart';
import 'help7.dart';
import 'help8.dart';
import 'homepage.dart';
import 'info55.dart';
import 'loginpage.dart';
import 'myprofile.dart';
import 'nicotine1.dart';
import 'nicotine2.dart';
import 'nicotine3.dart';
import 'nicotine4.dart';
import 'nicotine5.dart';
import 'nicotine6.dart';
import 'nicotine7.dart';
import 'nicotine8.dart';
import 'program1.dart';
import 'program2.dart';
import 'program3.dart';
import 'program4.dart';
import 'program5.dart';
import 'program6.dart';
import 'program7.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'program8.dart';
import 'program9.dart';
import 'info1.dart';
import 'info2.dart';
import 'info3.dart';
import 'info4.dart';
import 'info5.dart';
import 'info6.dart';
import 'info7.dart';
import 'info8.dart';
import 'info9.dart';
import 'info10.dart';
import 'info11.dart';
import 'info12.dart';
import 'info13.dart';
import 'info14.dart';
import 'info15.dart';
import 'info16.dart';
import 'tool1.dart';
import 'tool2.dart';
import 'tool3.dart';
import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'authentication.dart';

import '/screens/add_note.dart';
import '/screens/display_note.dart';
import 'db/database_provider.dart';
import 'model/note_model.dart';
import 'note_screen.dart';
import 'draw.dart';
import 'newstop.dart';
import 'setting.dart';
import 'mission1.dart';
import 'mission13.dart';
import 'mission23.dart';
import 'mission24.dart';
import 'mission33.dart';
import 'mission43.dart';
import 'mission53.dart';
import 'mission63.dart';
import 'mission73.dart';
import 'mission74.dart';
import 'mission93.dart';
import 'mission94.dart';
import 'mission95.dart';
import 'mission103.dart';
import 'tool4.dart';
import 'myaccount.dart';
import 'editprofile.dart';
import 'breath1.dart';
import 'breath2.dart';
import 'breath3.dart';
import 'link1.dart';
import 'tool5.dart';
import 'tool6.dart';
import 'middle.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();
final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();
const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

String? selectedNotificationPayload;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureLocalTimeZone();
  final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
          Platform.isLinux
      ? null
      : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
          ) async {
            didReceiveLocalNotificationSubject.add(
              ReceivedNotification(
                id: id,
                title: title,
                body: body,
                payload: payload,
              ),
            );
          });
  const MacOSInitializationSettings initializationSettingsMacOS =
      MacOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );
  final LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(
    defaultActionName: 'Open notification',
    defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
  );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: initializationSettingsMacOS,
    linux: initializationSettingsLinux,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    selectedNotificationPayload = payload;
    selectNotificationSubject.add(payload);
  });

  //  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeDateFormatting()
      .then((_) => runApp(MyApp(notificationAppLaunchDetails)));
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(
    this.notificationAppLaunchDetails, {
    Key? key,
  }) : super(key: key);
  final NotificationAppLaunchDetails? notificationAppLaunchDetails;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHEPHERD',
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Firebase load fail'), // 에러 대응
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Middle();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        '/alarm': (context) => Alarm(notificationAppLaunchDetails),
        '/loginpage': (context) => LoginPage(),
        '/homepage': (context) => MyHomePage(),
        //'/nicotine1': (context) => Nicotine1(),
        //'/nicotine2': (context) => Nicotine2(),
        //'/nicotine3': (context) => Nicotine3(),
        //'/nicotine4': (context) => Nicotine4(),
        //'/nicotine5': (context) => Nicotine5(),
        //'/nicotine6': (context) => Nicotine6(),
        //'/nicotine7': (context) => Nicotine7(),
        //'/nicotine8': (context) => Nicotine8(),
        //'/program1': (context) => Program1(),
        //'/program2': (context) => Program2(),
        '/program3': (context) => Program3(),
        //'/program4': (context) => Program4(),
        //'/program5': (context) => Program5(),
        //'/program6': (context) => Program6(),
        //'/program7': (context) => Program7(),
        //'/program8': (context) => Program8(),
        //'/program9': (context) => Program9(),
        //'/info1': (context) => Info1(),
        //'/info2': (context) => Info2(),
        //'/info3': (context)=> Info3(),
        //'/info4': (context) => Info4(),
        //'/info5': (context) => Info5(),
        //'/info6': (context) => Info6(),
        //'/info7': (context) => Info7(),
        //'/info8': (context) => Info8(),
        //'/info9': (context) => Info9(),
        //'/info10': (context) => Info10(),
        //'/info11': (context) => Info11(),
        //'/info12': (context) => Info12(),
        //'/info13': (context) => Info13(),
        //'/info14': (context) => Info14(),
        //'/info15': (context) => Info15(),
        //'/info16': (context) => Info16(),
        //'/tool1': (context) => Tool1(),
        //'/tool2': (context) => Tool2(),
        //'/tool3': (context) => Tool3(),
        //"/NoteScreen": (context) => HomeScreen(),
        //"/AddNote": (context) => AddNote(),
        "/ShowNote": (context) => ShowNote(),
        //"/draw": (context) => Draw(),
        //"/newstop": (context) => NewStop(),
        //"/setting": (context) => Setting(),
        //"/myprofile": (context) => MyProfile(),
        //"/mission1": (context)=>Mission1(),
        //"/mission13": (context)=>Mission13(),
        //"/mission23": (context)=>Mission23(),
        //"/mission24": (context)=>Mission24(),
        //"/mission33": (context)=>Mission33(),
        //"/mission43": (context)=>Mission43(),
        //"/mission53": (context)=>Mission53(),
        //"/mission63": (context)=>Mission63(),
        //"/mission73": (context)=>Mission73(),
        //"/mission74": (context)=>Mission74(),
        //"/mission93": (context)=>Mission93(),
        //"/mission94": (context)=>Mission94(),
        //"/mission95": (context)=>Mission95(),
        //"/mission103": (context)=>Mission103(),
        //"/tool4": (context)=>Tool4(),
        //"/myaccount": (context)=>MyAccount(),
        //"/editprofile": (context)=>EditProfile(),
        //"/breath1": (context)=>Breath1(),
        //"/breath2": (context)=>Breath2(),
        //"/breath3": (context)=>Breath3(),
        //"/link1": (context)=>Link1(),
        //"/tool5": (context)=>Tool5(),
        //"/tool6": (context)=>Tool6(),
        //"/help1": (context)=>Help1(),
        //"/help2": (context)=>Help2(),
        //"/help3": (context)=>Help3(),
        //"/help4": (context)=>Help4(),
        //"/help5": (context)=>Help5(),
        //"/help6": (context)=>Help6(),
        //"/help7": (context)=>Help7(),
        //"/info55": (context)=>Info55(),
        //"/info66": (context)=>Info66(),
        //"/help8": (context)=>Help8(),
        '/body1': (context) => Body1(),
        '/body2': (context) => Body2(),
        '/body3': (context) => Body3(),
        '/body4': (context) => Body4(),
        '/body5': (context) => Body5(),
        '/body6': (context) => Body6(),
        '/body7': (context) => Body7(),
        '/body8': (context) => Body8(),
        '/body9': (context) => Body9(),
        '/body10': (context) => Body10(),
        '/body11': (context) => Body11(),
        '/body12': (context) => Body12(),
        '/body13': (context) => Body13(),
        '/body14': (context) => Body14(),
        '/sym1': (context) => Sym1(),
        '/sym2': (context) => Sym2(),
        '/sym3': (context) => Sym3(),
        '/sym4': (context) => Sym4(),
        '/sym5': (context) => Sym5(),
        '/sym6': (context) => Sym6(),
        '/sym7': (context) => Sym7(),
        '/sym8': (context) => Sym8(),
        '/sym9': (context) => Sym9(),
        '/sym10': (context) => Sym10(),
        '/sym11': (context) => Sym11(),
        '/dis1': (context) => Dis1(),
        '/dis2': (context) => Dis2(),
        '/dis3': (context) => Dis3(),
        '/dis4': (context) => Dis4(),
        '/dis5': (context) => Dis5(),
        '/dis6': (context) => Dis6(),
        '/dis7': (context) => Dis7(),
        '/dis8': (context) => Dis8(),
        '/dis9': (context) => Dis9(),
        '/dis10': (context) => Dis10(),
        '/dis11': (context) => Dis11(),
        '/dis12': (context) => Dis12(),
      },
      debugShowCheckedModeBanner: false,
      //home: const Program9(),
    );
  }
}

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
}

class PaddedElevatedButton extends StatelessWidget {
  const PaddedElevatedButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      );
}

class Alarm extends StatefulWidget {
  const Alarm(
    this.notificationAppLaunchDetails, {
    Key? key,
  }) : super(key: key);
  static const String routeName = '/';
  final NotificationAppLaunchDetails? notificationAppLaunchDetails;

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String name = '';
  String uid = "";
  List<int> hour = [];
  List<int> minute = [];

  Future<String> _fetch1() async {
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("name")
        .get()
        .then((DocumentSnapshot ds) {
      name = ds.get('data').toString();
      uid = AuthenticationHelper().getUid();
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm0")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm1")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm2")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm3")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm4")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm5")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm6")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm7")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm8")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    await firestore
        .collection(AuthenticationHelper().getUid())
        .doc("alarm9")
        .get()
        .then((DocumentSnapshot ds) {
      hour.add(int.parse(ds.get('hour').toString()));
      minute.add(int.parse(ds.get('minute').toString()));
    });
    //await Future.delayed(Duration(seconds: 2));
    return name;
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title!)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body!)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Info2(name: name),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String? payload) async {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Info2(name: name)));
    });
  }

  @override
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  TimeOfDay _time = TimeOfDay.now();

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  Widget alarmlist(int index) {
    if (hour[index] == 25) {
      return Container();
    }
    return Column(
      children: <Widget>[
        Container(
          color: Colors.black12,
          width: MediaQuery.of(context).size.width,
          height: 1,
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          child: Center(
            child: Text(
              (hour[index].toString().length == 2
                      ? hour[index].toString()
                      : '0' + hour[index].toString()) +
                  ':' +
                  (minute[index].toString().length == 2
                      ? minute[index].toString()
                      : '0' + minute[index].toString()),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          createInlinePicker(
                            value: _time,
                            onChange: onTimeChanged,
                            elevation: 0,
                            borderRadius: 0,
                            accentColor: Colors.indigo,
                            dialogInsetPadding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0.0),
                            isOnChangeValueMode: true,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 66,
                            height: 66,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  '등록된 알람 목록',
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () async {
                                          await _scheduleDailyTenAMNotification();
                                          setState(() {
                                            for (int i = 0; i < 10; i++) {
                                              if (hour[i] == 25) {
                                                print(hour[0]);
                                                hour[i] = _time.hour;
                                                minute[i] = _time.minute;
                                                print(hour[0]);
                                                break;
                                              }
                                            }
                                            for (int i = 0; i < 10; i++) {
                                              firestore
                                                  .collection(
                                                      AuthenticationHelper()
                                                          .getUid())
                                                  .doc("alarm$i")
                                                  .update({
                                                "hour": hour[i],
                                                "minute": minute[i],
                                              });
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.indigo,
                                          size: 28,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () async {
                                          await _cancelNotification();
                                          setState(() {
                                            for (int i = 1; i < 10; i++) {
                                              if (hour[i] == 25) {
                                                hour[i - 1] = 25;
                                                firestore
                                                    .collection(
                                                        AuthenticationHelper()
                                                            .getUid())
                                                    .doc("alarm${i - 1}")
                                                    .update({
                                                  "hour": 25,
                                                  "minute": 0,
                                                });
                                                break;
                                              }
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.cancel,
                                          color: Colors.indigo,
                                          size: 28,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () async {
                                          await _cancelAllNotifications();
                                          setState(() {
                                            hour[0] = 25;
                                            hour[1] = 25;
                                            hour[2] = 25;
                                            hour[3] = 25;
                                            hour[4] = 25;
                                            hour[5] = 25;
                                            hour[6] = 25;
                                            hour[7] = 25;
                                            hour[8] = 25;
                                            hour[9] = 25;
                                            for (int i = 0; i < 10; i++) {
                                              firestore
                                                  .collection(
                                                      AuthenticationHelper()
                                                          .getUid())
                                                  .doc("alarm$i")
                                                  .update({
                                                "hour": 25,
                                                "minute": 0,
                                              });
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.auto_delete,
                                          color: Colors.indigo,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 500,
                              child: FutureBuilder(
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
                                      return ListView(
                                        children: <Widget>[
                                          alarmlist(0),
                                          alarmlist(1),
                                          alarmlist(2),
                                          alarmlist(3),
                                          alarmlist(4),
                                          alarmlist(5),
                                          alarmlist(6),
                                          alarmlist(7),
                                          alarmlist(8),
                                          alarmlist(9),
                                          Container(
                                            color: Colors.black12,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 1,
                                          ),
                                        ],
                                      );
                                    }
                                  })),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5,MediaQuery.of(context).padding.top, 0,0),
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
          ),
        ),
      );

  Future<void> _cancelNotification() async {
    await flutterLocalNotificationsPlugin
        .cancel(_time.hour * 60 + _time.minute);
  }

  Future<void> _cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> _scheduleDailyTenAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        _time.hour * 60 + _time.minute,
        name + '님, 흡연하고 싶으신가요?',
        '흡연을 참아내고 금연을 이어가세요',
        _nextInstanceOfTenAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id',
              'daily notification channel name',
              channelDescription: 'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, _time.hour, _time.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}

Future<LinuxServerCapabilities> getLinuxCapabilities() =>
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            LinuxFlutterLocalNotificationsPlugin>()!
        .getCapabilities();
