import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stu/post.dart';
import 'package:stu/profile.dart';
import 'Reply.dart';
import 'Widget/format_text_field.dart';
import 'Widget/avatar_app_bar.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'join_request.dart';

class Board extends StatefulWidget {
  final String id;
  final String name;
  final String avatar;
  final String token;

  const Board({
    super.key,
    required this.id,
    required this.name,
    required this.avatar,
    required this.token,
  });

  @override
  State<Board> createState() => _Board();
}

class _Board extends State<Board> {
  List posts = [];

  //サーバー送信
  Future<void> _addPost(String message,int recruitment, {Map<String, dynamic>? replyTo}) async{
    final response = await http.post(
        Uri.parse("https://engineer-sns-436152672971.europe-west1.run.app/get_post"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_id': widget.id,
          'message': message,
          'recruitment': recruitment,
          'avatar_url': widget.avatar,
          'user_github_neme': widget.name,
          //'media_url': mediaUrl,
        })
    );
    if(response.statusCode == 201){
      final post = jsonDecode(response.body);
      setState(() {
        posts.insert(0, post);
      });
    }else{
      print("投稿失敗");
    }
  }
//一覧取得
  Future<void> fetchPosts() async {
    print('fetchPosts: 呼び出されました');
    final response = await http.get(
      Uri.parse("https://engineer-sns-436152672971.europe-west1.run.app/posts"),
    );
    if (response.statusCode == 200) {
      final List<dynamic> postList = jsonDecode(response.body);
      setState(() {
        posts = List<Map<String, dynamic>>.from(postList);
      });
    } else {
      print('一覧取得失敗: ${response.body}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Widget buildLikeText(int likeCount) {
    if (likeCount >= 1000000) {
      return Text("${(likeCount / 1000000).toStringAsFixed(1)}M",style: GoogleFonts.inter(
        color: Colors.white,
      ));
    } else if (likeCount >= 1000) {
      return Text("${(likeCount / 1000).toStringAsFixed(1)}k",style: GoogleFonts.inter(
        color: Colors.white,
      ));//小数点第一まで表示
    } else {
      return Text("$likeCount",style: GoogleFonts.inter(
        color: Colors.white,
      ));
    }
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
                            backgroundImage: NetworkImage(post["avatar_url"]),
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
                                      Text("なうい",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      //  Text("@",style: GoogleFonts.inter(
                                      //   letterSpacing: 1.2,
                                      //   fontWeight: FontWeight.w600,
                                      //   color: Colors.grey,
                                      //   fontSize: 14,),),
                                      // Text(post["user_id"]!,//TODO：IDの実装しなくちゃ
                                      //   style: GoogleFonts.inter(
                                      //   letterSpacing: 1.2,
                                      //   fontWeight: FontWeight.w600,
                                      //   color: Colors.grey,
                                      //   fontSize: 14,),),
                                    ]
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4,vertical: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: Colors.greenAccent
                                  ),
                                  child:  Text("0/${post["recruitment"]??""}人参加中",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
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
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    //SizedBox(width: 12),

                                    // IconButton(
                                    //   onPressed: () {
                                    //     setState(() {
                                    //      if(posts[index]["liked"] == false){
                                    //        posts[index]["like"]++;
                                    //        posts[index]["liked"] = true;
                                    //      }else{
                                    //        posts[index]["like"]--;
                                    //        posts[index]["liked"] = false;
                                    //      }
                                    //     });
                                    //   },
                                    //   icon: Icon(Icons.thumb_up_off_alt, color: Colors.white, size: 16),
                                    // ),
                                    // buildLikeText(posts[index]["like"]),
                                  ],
                                ),
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // ElevatedButton.icon(
                                      //   style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.green, // 色を変えたい場合
                                      //     shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(8),
                                      //     ),),
                                      //   label: Text("参加希望者"),
                                      //   onPressed: () {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(builder: (context) => JoinRequest()),
                                      //     );
                                      //   },
                                      // ),
                                      Container(
                                        //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
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
                                        child:ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7), // ←細くしたい場合ここで調整
                                            minimumSize: Size(0, 28), // 高さ28px、幅制限なし（さらに細くしたい場合調整）
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ←タップ範囲も小さくするなら
                                          ),
                                          label: Text("参加申請を送信",style: GoogleFonts.inter(
                                            letterSpacing: 1.2,
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => JoinRequest()),
                                            );
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.bookmark_border, color: Colors.white, size: 19),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.share_outlined, color: Colors.white, size: 19),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.reply, color: Colors.white, size: 19),
                                      ),
                                    ]
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
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Post(
                  avatar: widget.avatar,
                  name: widget.name,
                ),
              ),
            );

            if (result != null) {
              final message = result['message'];
              final recruitment = result['recruitment'];
              _addPost(message, recruitment);
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
