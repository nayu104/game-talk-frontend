import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stu/Widget/pop_button.dart';
import 'package:stu/Widget/text_format.dart';
import 'package:stu/Widget/orange_button.dart';
import 'package:stu/Widget/search_text_field.dart';
import 'package:stu/Widget/small_text.dart';
import 'package:vibration/vibration.dart';

class AddFriend extends StatefulWidget {
  const AddFriend({super.key});

  @override
  State<AddFriend> createState() => _AddFriend();
}

void vibratePhone() {
  Vibration.vibrate(duration: 30); //バイブレーション関数
}


// State クラス（画面の状態を管理）
class _AddFriend extends State<AddFriend> {
  int user_id = 111222333;

  String getUserID() => NumberFormat("#,###").format(user_id); //三桁ごとにカンマ

  //copy動作時checkマークのフラグ用
  bool isCopied = false;
  void change_01Second_Button() {
    setState(() {
      isCopied = true;
    });
    Future.delayed(Duration(seconds: 2), () {//一秒後に起動
      setState(() {
        isCopied = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF404040),
      resizeToAvoidBottomInset: false, // ウィジェットを勝手に押し上げないようにする
      //appBarの領域に入ると文字が途切れる
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),//高さ40ピクセルのサイズ
        //AppBarの高さ変更時,キーボード入力時に「フレンド検索」が埋もれるから
        child: AppBar(
          backgroundColor: const Color(0xFF404040),
          leading: PopButton(icon: Icons.arrow_back_ios,size:20),
        ),
      ),

      body: Center(
    child: Transform.translate(
          offset: Offset(0, -130), //Offset(dx,dy)　中心を軸にx,y座標で位置調節
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextFormat(message: "フレンド検索",fontsize: 22),

              SizedBox(height: 0),

              smallText(message: "IDを入力するとユーザーにフレンド申請できます！"),
              SearchTextField(Width: 300, keyboardType: TextInputType.number),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "あなたのID：${getUserID()}",
                    style: GoogleFonts.inter(
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(//TODO押した時に一瞬だけ✓マークいれたい未完成
                    onPressed: () {
                      vibratePhone();
                      change_01Second_Button();
                    },
                    icon: Icon(
                        isCopied ? Icons.check : Icons.copy,
                        color: Colors.white,size: 20),
                    highlightColor: Colors.black,
                  ),
                ],
              ),
             OrangeButton(message: "フレンド申請送信",fontSize: 15),
            ],
          ),
        ),
      ),
    );
  }
}
