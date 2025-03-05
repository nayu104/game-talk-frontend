import 'package:flutter/material.dart';

// StatefulWidget（状態を持つウィジェット）
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State クラス（画面の状態を管理）
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String message = ""; // ← TextField で使う変数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  message = value;
                });
              },
            ),
            Text(message),
            ElevatedButton(
              onPressed: () {},
              child: Text("クリック！"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("ボタンが押された！");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.next_week),
      ),
    );
  }
}