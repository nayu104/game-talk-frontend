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


class Post extends StatefulWidget {

  final String avatar;
  final String name;

  const Post({
    super.key,
    required this.avatar,
    required this.name
  });
  @override
  State<Post> createState() => _Post();
}
class _Post extends State<Post> {

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
        leading:
        IconButton(
            onPressed: (){},//TODO処理
            icon: Icon(Icons.close,color: Colors.white,),
      ),
        actions: [
          Padding(padding: EdgeInsets.only(right: 10),
          child:
          IconButton(
            onPressed: (){
              final message = _textController.text;
              final recruitment = selectedSlot;
              Navigator.pop(context,{
                'message': message,
                'recruitment': recruitment,
              });
            },//TODO処理
            icon: Transform.rotate(
                angle:-0.5,
            child: Icon(Icons.send,color: Colors.white,)
            )
          ),
          ),
        ],
      ),

      body:
      Column(
        children: [
          Row(
           //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatar),
            radius: 15,
          ),
              SizedBox(width: 8,),
              Text("なうい", style: GoogleFonts.inter(
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 15,
              ),),
    ],
          ),

          SizedBox(height: 40),

          Center(
            child: SizedBox(
              width: 250,
             child:  DropdownButtonFormField<int>(
               isExpanded: true,
                value: selectedSlot,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black87, // バーの背景
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: Colors.black, // リスト背景
                items: slots.map((slot) => DropdownMenuItem<int>(
                  value: slot,
                  child: Center(
                    child: Text("募集人数：$slot人", style: TextStyle(color: Colors.white)),
                  ),
                )).toList(),//map,toListで新しいリストに入れ替える
                selectedItemBuilder: (context) {
                  return slots.map((slot) {// returnでListを返す
                    return Center(child: Text("募集人数：$slot人", style: TextStyle(color: Colors.white),));
                  }).toList();
                },
                onChanged: (value) {
                  setState(() { selectedSlot = value; });//Object?型だがint?をいれたいため
                },
              ),

            ),
          ),

          SizedBox(height: 40),

          Padding(padding: EdgeInsets.only(left: 50),
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
          hintText: "募集内容を書いてください！",
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
