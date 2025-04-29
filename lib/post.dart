import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/Widget/text_format.dart';
import 'Home.dart';
import 'Widget/bottom_navigation.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar:
      AppBar(backgroundColor: Color(0xFF404040),
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
              Navigator.pop(context,message);
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
              Text(widget.name, style: GoogleFonts.inter(
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 15,
              ),),
    ],
          ),

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
          hintText: "いまなにしてる？",
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
                 OrangeButton(message: "+write_code",
                   onPressed: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => CodePostScreen()),
                     );
                   },
                 ),
      ],
             ),
        ),
    );
  }
}
