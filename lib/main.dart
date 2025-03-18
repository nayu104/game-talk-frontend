import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'package:flutter/material.dart';
import 'package:stu/add_friend.dart';
import 'package:stu/done.dart';
import 'package:stu/settings.dart';
import 'package:stu/timer.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

// このウィジェットはアプリのルート（最上位）です。
class MyApp extends StatelessWidget {
  //継承
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //home: const MyHomePage(),
      initialRoute: "/", //画面遷移path登録.initialRoute:が起動時の画面指定
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => const Home(),
        "/add_friend": (BuildContext context) => const AddFriend(),
        '/done':(BuildContext context) => const Done(),
        '/timer':(BuildContext context) => const TimerWidget(),
        '/AddFriend':(BuildContext context) => const AddFriend(),
        '/settings':(BuildContext context) => const Setting(),
      },
    );
  }
}
