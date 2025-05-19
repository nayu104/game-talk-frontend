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
      appBar: AppBar(
        backgroundColor: Color(0xFF404040),
        elevation: 0,


      ),

    );
  }
}
