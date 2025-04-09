import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Widget/bottom_navigation.dart';
import 'Widget/format_text_field.dart';
import 'Widget/ui_divider_widget.dart';
import 'Widget/user_icon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
          title:FormatTextField(Width: 300,iconData: Icons.search),
          leading:UserIcon(size: 30)//TODOサイズが意図どおりに動かない,なんでだ
      ),
      ),

      body:Row(
        children: [
          UIDivider(),//TODO:DB接続＆掲示板実装、2025.03.31
      ],
      ),

      bottomNavigationBar:bottom_navigation(),
    );
  }
}
