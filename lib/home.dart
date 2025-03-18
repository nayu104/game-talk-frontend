import 'package:flutter/material.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF404040),
        ),
        backgroundColor: Color(0xFF404040),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 32),
              child: Text('メニュー'),
            ),
            Spacer(), // これでRowを画面の下に押し下げる
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, "/home");},
                  child: Icon(Icons.home, color: Colors.orange),
                ),
                ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, "/AddFriend");},
                  child: Icon(Icons.account_circle, color: Colors.orange),
                ),
                ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, "/setting");},
                  child: Icon(Icons.settings, color: Colors.orange),
                ),
                ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, "/done");},
                  child: Icon(Icons.done, color: Colors.orange),
                ),
                ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, "/TimerWidget");},
                  child: Icon(Icons.alarm, color: Colors.orange),
                ),
              ],
            ),
            SizedBox(height: 16), // 画面の下との余白を追加
          ],
        ),
      ),
    );
  }
}
