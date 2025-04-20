import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/post.dart';
import 'Widget/bottom_navigation.dart';
import 'Widget/format_text_field.dart';
import 'Widget/ui_divider_widget.dart';
import 'Widget/user_icon.dart';

class Home extends StatefulWidget {

  final String id;
  final String name;
  final String avatar;
  //final String? massage;


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

  List posts =[];

  void _addPost(String message){
    setState(() {
      posts.add(
          {
            "name": widget.name,
            "avatar": widget.avatar,
            "message": message,
          }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar: PreferredSize(
    preferredSize: Size.fromHeight(80),
    child:  AppBar(
          backgroundColor: Color(0xFF404040),
          title:FormatTextField(Width: 300,iconData: Icons.search,labelText: "検索",),
          leading:
              Padding(padding: const EdgeInsets.all(8.0),//上下左右の空白
              child:
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatar),
            radius: 30,//半径ね
          )//TODOサイズが意図どおりに動かない,なんでだ
      ),
              ),
    ),

      body:
        Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: ListView.builder(
            itemCount: posts.length,
              itemBuilder:(context,index){
              final post = posts[index];

              return ListTile(
                leading: CircleAvatar(
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
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                ),
              );
              },
          ),
          )
      ],
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () async {
          final message = await Navigator.push(//awaitがないと怒られますねえ。
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
        child: Icon(Icons.add),
      ),


      bottomNavigationBar:bottom_navigation(),
    );
  }
}
