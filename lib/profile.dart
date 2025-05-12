import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/Widget/text_format.dart';
import 'Home.dart';
import 'Widget/avatar_app_bar.dart';
import 'Widget/push_button.dart';
import 'Widget/format_text_field.dart';
import 'Widget/orange_button.dart';
import 'code_post.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  final String avatar;
  final String name;

  const ProfilePage({super.key, required this.avatar, required this.name});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar: AppBar(
        backgroundColor: Color(0xFF404040),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Rowにユーザー情報入れた。親がColumnなのはリストビューの都合
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.avatar),
                  radius: 30,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.inter(
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "@${widget.name}", // ← 動的にしておくと親切
                      style: GoogleFonts.inter(
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 1),
            // 🔽 草のスクロール領域（ListView 横スクロール）

            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,//横スクロール
                children: [
                  SvgPicture.network(
                    'https://ghchart.rshah.org/${widget.name}',
                    placeholderBuilder:
                        (context) => Center(child: CircularProgressIndicator()),
                    semanticsLabel: 'GitHub contributions',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
