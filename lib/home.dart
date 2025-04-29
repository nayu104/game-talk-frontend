import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/post.dart';
import 'Widget/bottom_navigation.dart';
import 'Widget/format_text_field.dart';
import 'Widget/ui_divider_widget.dart';
import 'Widget/user_icon.dart';
import 'package:highlight/languages/javascript.dart'; // 言語選択
import 'package:highlight/languages/python.dart';

import 'code_post.dart'; // Python用に変更！

class Home extends StatefulWidget {
  final String id;
  final String name;
  final String avatar;

  const Home({
    super.key,
    required this.id,
    required this.name,
    required this.avatar,

    //this.massage,
  });

  @override
  State<Home> createState() => _MyHome();
}

class _MyHome extends State<Home> {
  List posts = [];

  void _addPost(String message) {
    setState(() {
      posts.insert(0, {
        "name": widget.name,
        "avatar": widget.avatar,
        "message": message,
        "like": 0,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Color(0xFF404040),
          title: FormatTextField(
            Width: 300,
            Height: 40,
            iconData: Icons.search,
            labelText: "検索",
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0), //上下左右の空白
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.avatar),
              radius: 30, //半径ね
            ), //TODOサイズが意図どおりに動かない,なんでだ
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];

                return Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.black, thickness: 0.5),
                    ListTile(
                      leading:
                      CircleAvatar(
                        backgroundImage: NetworkImage(post["avatar"]!),
                      ),
                      title: Text(
                        post["name"]!,
                        style: GoogleFonts.inter(
                          //入力時のフォント
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        post["message"]!,
                        style: GoogleFonts.inter(
                          //入力時のフォント
                          //letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Expanded(child:
                          IconButton(
                            onPressed: () {},
                            icon:
                            Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20,),),
                          ),

                          Expanded(child:
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.repeat, color: Colors.white, size: 20,),),
                          ),
                          Expanded(child:
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.thumb_up_off_alt, color: Colors.white, size: 20,),),
                          ),
                          Padding(padding: EdgeInsets.only(left:15),
                            child:
                            Row(
                              children: [

                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.bookmark_border, color: Colors.white, size: 20,),),

                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.share_outlined, color: Colors.white,size: 20,),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () async {
          final message = await Navigator.push(
            //awaitがないと怒られますねえ。
            context,
            MaterialPageRoute(
              builder:
                  (BuildContext context) => //CodePostScreen()
                  Post(avatar: widget.avatar, name: widget.name),
            ),
          );

          if (message != null && message is String) {
            _addPost(message);
          }
        },
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: bottom_navigation(),
    );
  }
}