import 'package:flutter/material.dart';
import 'package:stu/add_friend.dart';
import 'package:stu/sign_up.dart';
import 'Home.dart';
import 'friend_list.dart';
import 'login.dart';

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
       //'/login':(BuildContext context) => const Login(),
        //'/timer':(BuildContext context) => const Timer(),
        //'/account_circle':(BuildContext context) => const AccountCircle(),
        //'/settings':(BuildContext context) => const Settings(),
      },
    );
  }
}
