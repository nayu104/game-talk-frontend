import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Widget/myName.dart';

import 'Widget/friend_list_DB.dart';

// StatefulWidget（状態を持つウィジェット）
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State クラス（画面の状態を管理）
class _MyHomePageState extends State<MyHomePage> {

  List userList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState(); //親の処理も初期化しておく、中で大事な処理があるから
    getUser(); //ここで自分の処理を初期化
  }

  Future<void> getUser() async {
    var url = Uri.http("192.168.3.44:5000", "/users");
    var response = await http.get(url);

    setState(() {
      userList = json.decode(utf8.decode(response.bodyBytes));
      isLoading = false;
      //バイトデータ→utf8変換→Dartが理解可能な形に変換
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF404040),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            backgroundColor: const Color(0xFF404040),
            title: Text(
              "フレンド一覧",
              style: GoogleFonts.inter(
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            leading: SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios),
                highlightColor: Colors.transparent,
                color: Colors.white,
              ),
            ),
            actions: [
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/add_friend");
                  },
                  icon: Icon(
                      Icons.person_add_alt, size: 35, color: Colors.white),
                  highlightColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          //左右16ピクセル余白,上下8ピクセル余白
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(
          children: [
          Stack(
          alignment: Alignment.center, //ウィジェットを中央に重ねる
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    //ここでぼかし影つくるよ
                    BoxShadow(
                      color: Colors.orange,
                      blurRadius: 1, //ぼかし具合
                      spreadRadius: 1.5, //幅
                    ),
                  ],
                ),
              ),

              CircleAvatar(
                //アイコン
                radius: 30, //半径30
                backgroundImage: AssetImage('assets/images/test01.jpg'),
              ),
            ],
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, //左ぞろえ
            children: [
              MyName(font_size: 20),
              Row(
                children: [
                  Icon(Icons.star, size: 15, color: Colors.amberAccent),
                  Text(
                    "999",
                    style: GoogleFonts.robotoMono(
                      fontSize: 15,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ],
        ),
        SizedBox(
          height: 50, //余白
          child: Divider(
            //線で区切る
            thickness: 0.5, //太さ
            color: Colors.grey,
            indent: 5, //右余白
            endIndent: 5, //左余白
          )
        ),
        isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.orange))
            : Expanded(child:FriendListDB(user: userList)),
            ],
    )
    ,
    )
    ,
    );
  }
}
