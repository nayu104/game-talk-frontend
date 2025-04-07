import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/Widget/user_icon.dart';
import 'package:stu/Widget/ui_divider_widget.dart';
import 'Widget/pop_button.dart';
import 'Widget/my_name.dart';
import 'Widget/friend_list_db.dart';
import 'package:image_picker/image_picker.dart';
import 'Widget/my_point_row.dart';
import 'Widget/push_button.dart';
import 'Widget/text_format.dart';

// StatefulWidget（状態を持つウィジェット）
class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendList();
}

// State クラス（画面の状態を管理）
class _FriendList extends State<FriendList> {
  List userList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState(); //親の処理も初期化しておく、中で大事な処理があるから
    getUser(); //ここで自分の処理を初期化
  }

  Future<void> getUser() async {
    var url = Uri.http("172.20.10.4:5000", "/users");
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
        preferredSize: Size.fromHeight(40),//AppBar高さ
        child: AppBar(
          backgroundColor: const Color(0xFF404040),
          title:TextFormat(message: "フレンド一覧",fontsize: 22),
          leading: PopButton(icon: Icons.arrow_back_ios,size:20),
          actions: [
            PushButton(goto:"/add_friend",icon: Icons.person_add_alt,size:25),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        //左右16ピクセル余白,上下8ピクセル余白
        child: Column(
          children: [
            Row(
              children: [
                UserIcon(size: 30), //自分のアイコン表示
                SizedBox(width: 5), //幅調節
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //左ぞろえ
                  children: [
                    MyName(my_name: "nayu"), //トップ,自分の名前表示
                    MyPoint_Row(),
                  ],
                ),
              ],
            ),
            UIDivider(), //自分とフレンドリストの境界線
            //フレンドリストをDBから取得
            isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.orange))
                : Expanded(child: FriendListDB(user: userList)),
          ],
        ),
      ),
    );
  }
}