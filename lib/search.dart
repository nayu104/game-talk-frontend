import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/Widget/text_format.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Widget/avatar_app_bar.dart';
import 'Widget/push_button.dart';
import 'Widget/format_text_field.dart';
import 'Widget/orange_button.dart';
import 'package:url_launcher/link.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';
import 'home.dart';

class Search extends StatefulWidget {
  final String avatar;
  const Search({super.key, required this.avatar,});

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar:
      AppBar(
        backgroundColor: Color(0xFF404040),
        title: FormatTextField(
          Width: 300,
          Height: 40,
          iconData: Icons.search,
          labelText: "検索",
        ),
        leading: AvatarAppBar(avatarUrl: widget.avatar,),
      ),
    );
  }
}
