import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/Widget/text_format.dart';
import 'Widget/bottom_navigation.dart';
import 'Widget/push_button.dart';
import 'Widget/format_text_field.dart';
import 'Widget/orange_button.dart';


class Post extends StatefulWidget {
  const Post({super.key});
  @override
  State<Post> createState() => _Post();
}
class _Post extends State<Post> {

  final postController = TextEditingController();

  List<String> posts = [];

  void _post_add(final postController){
    setState(() {
      posts.add(postController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar:
      AppBar(backgroundColor: Color(0xFF404040),
      ),

      body:Center(child:
        Row(children: [
          FormatTextField(
            Width: 300,
            iconData: Icons.abc,
            labelText: "投稿メッセージを入力",
            Controller: postController,
          ),

          IconButton(onPressed:(){
            _post_add(postController);
          }, icon: Icon(Icons.send)),
          Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(1.0),//行間隔
                    child: Text(
                      posts[index], //nameカラム指定でnameだけ取り出す
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                        height: 2,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
          ),
        ],
        ),

        ),
    );
  }
}
