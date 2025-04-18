import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Widget/bottom_navigation.dart';
import 'Widget/format_text_field.dart';
import 'Widget/ui_divider_widget.dart';
import 'Widget/user_icon.dart';

class Home extends StatefulWidget {

  final String id;
  final String name;
  final String avatar;

  const Home({
    super.key,
    required this.id,
    required this.name,
    required this.avatar,
  });

  @override
  State<Home> createState() => _MyHome();
}

class _MyHome extends State<Home> {


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
              Padding(padding: const EdgeInsets.all(8.0),
              child:
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatar),
            radius: 30,//半径ね
          )//TODOサイズが意図どおりに動かない,なんでだ
      ),
              ),
    ),

      body:Row(
        children: [
          UIDivider(),//TODO:DB接続＆掲示板実装、2025.03.31
          Text("ようこそ、${widget.name}さん")
      ],
      ),
      bottomNavigationBar:bottom_navigation(),
    );
  }
}
