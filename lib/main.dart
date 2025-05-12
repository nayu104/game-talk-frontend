import 'package:flutter/material.dart';
import 'package:stu/add_friend.dart';
import 'package:stu/post.dart';
import 'package:stu/sign_up.dart';
import 'package:stu/timer.dart';
import 'Home.dart';
import 'login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // ← 必須（非同期初期化の前に）
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
      theme: ThemeData(
       // splashFactory: NoSplash.splashFactory, // ← ripple 無効化
        highlightColor: Colors.transparent,    // ← ハイライト色も無効化
        splashColor: Colors.transparent,       // ← スプラッシュ色も無効化
        useMaterial3: false,                   // ← M3の強い波も抑制
      ),

      //home: const MyHomePage(),
      initialRoute: "/", //画面遷移path登録.initialRoute:が起動時の画面指定
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => const Login(),
      },
    );
  }
}
