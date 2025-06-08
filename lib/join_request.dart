import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/Widget/text_format.dart';
import 'Home.dart';
import 'Widget/push_button.dart';
import 'Widget/format_text_field.dart';
import 'Widget/orange_button.dart';
import 'code_post.dart';


class JoinRequest extends StatefulWidget {


  const JoinRequest({
    super.key,
  });
  @override
  State<JoinRequest> createState() => _JoinRequest();
}
class _JoinRequest extends State<JoinRequest> {

  final _textController = TextEditingController();

  int?  selectedSlot = 1;
  final List slots = [1,2,3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar:
      AppBar(backgroundColor: Color(0xFF404040),
        elevation: 0,
        title: Text("参加しよう！"),
        leading:
        IconButton(
          onPressed: (){},//TODO処理
          icon: Icon(Icons.close,color: Colors.white,),
        ),
        actions: [
          Padding(padding: EdgeInsets.only(right: 10,top:10,bottom: 7),
            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // 色を変えたい場合
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
             child: Text("申請する",style: GoogleFonts.inter(
               //入力時のフォント
               fontWeight: FontWeight.w600,
               color: Colors.white,
               fontSize: 14
             ),),
              onPressed: () {//TODO:処理追加
                final message = _textController.text;
                Navigator.pop(context,{message});},
            ),
          )],
      ),

      body:
      Column(
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                SizedBox(width: 8,),
              ],
            ),

            SizedBox(height: 40),

            Padding(padding: EdgeInsets.only(left: 30,right: 30),
              child:
              TextField(
                cursorColor: Colors.white,
                controller: _textController,
                style: GoogleFonts.inter(
                  //入力時のフォント
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "〇〇で参加希望です！",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none, // 枠線なし
                ),
              ),
            ),
          ]
      ),
      bottomSheet:
      Container(
        color: Color(0xFF404040),
        padding: EdgeInsets.all(4),
        child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // OrangeButton(message: "+write_code",
            //   onPressed: (){
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => CodePostScreen()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
