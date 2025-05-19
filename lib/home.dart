import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/post.dart';
import 'package:stu/profile.dart';
import 'Reply.dart';
import 'Widget/format_text_field.dart';
import 'Widget/ui_divider_widget.dart';
import 'Widget/avatar_app_bar.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/python.dart';
import 'code_post.dart';

class Home extends StatefulWidget {
  final String id;
  final String name;
  final String avatar;
  final String token;

  const Home({
    super.key,
    required this.id,
    required this.name,
    required this.avatar,
    required this.token,
  });

  @override
  State<Home> createState() => _MyHome();
}

class _MyHome extends State<Home> {
  List posts = [];

  void _addPost(String message, {Map<String, dynamic>? replyTo}) {
    setState(() {
      posts.insert(0, {
        "name": widget.name,
        "avatar": widget.avatar,
        "message": message,
        "like": 0,
        "replyTo": replyTo,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar: AppBar(
        backgroundColor: Color(0xFF404040),
        elevation: 0,
        title: FormatTextField(
          Width: 300,
          Height: 40,
          iconData: Icons.search,
          labelText: "検索",
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(
                  name: widget.name,
                  avatar: widget.avatar,
                  id: widget.id,
                  token: widget.token,
                ),
                transitionDuration: Duration(milliseconds: 220),//行き
                reverseTransitionDuration: Duration(milliseconds: 220),//帰りの速度
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0); // 左からスライドイン
                  const end = Offset.zero;
                  final tween = Tween(begin: begin, end: end);
                  final offsetAnimation = animation.drive(tween);
                  return SlideTransition(position: offsetAnimation, child: child);
                },
              ),
            );
          },
          child: AvatarAppBar(avatarUrl: widget.avatar),
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

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    children: [
                      Divider(color: Colors.black, thickness: 0.5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(post["avatar"]!),
                            radius: 20,
                          ),
                          SizedBox(width: 12),
                          Expanded(//これがないとはみ出る
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    children: [
                                Text(
                                  post["name"]!,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text("@dfhajkhfdks",//TODO：IDの実装しなくちゃ
                                  style: GoogleFonts.inter(
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                  fontSize: 14,),),
                                ]
                                ),
                                SizedBox(height: 4),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => Reply(replyTo: post),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    post["message"]!,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chat_bubble_outline, color: Colors.white, size: 16),
                                    ),

                                    SizedBox(width: 12),

                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.repeat, color: Colors.white, size: 16),
                                    ),

                                    SizedBox(width: 12),

                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.thumb_up_off_alt, color: Colors.white, size: 16),
                                    ),

                                   // Spacer(),

                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.bookmark_border, color: Colors.white, size: 16),
                                    ),
                                    SizedBox(width: 12),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.share_outlined, color: Colors.white, size: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 45,
        height: 45,
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () async {
            final message = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Post(
                  avatar: widget.avatar,
                  name: widget.name,
                ),
              ),
            );

            if (message != null && message is String) {
              _addPost(message);
            }
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: const [
                  Color(0xFF99CCFF),
                  Color(0xFF99FFFF),
                  Color(0xFF99FFCC),
                  Color(0xFF99FF99),
                ],
              ),
            ),
            child: Icon(Icons.add, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
