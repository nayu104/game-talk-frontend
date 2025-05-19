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
  final String id;
  final String token;

  const ProfilePage({super.key,
    required this.avatar,
    required this.name,
    required this.id,
    required this.token,
  });

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {


  Future<Map<String,dynamic>> fetchFollowers(String token) async{
    final res = await http.get(
      Uri.parse("https://engineer-sns-436152672971.europe-west1.run.app/profile/followers"),
      headers: {//parseでUri型に変換
        "Authorization": "Bearer $token",
      },
    );
    if(res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return {
        'count': data['count'],
        'user': data['users']
      };
    }else{
      throw Exception("フォロワーの取得に失敗しました");
    }
  }

  Future<Map<String,dynamic>> fetchFollowing(String token) async{
    final res = await http.get(
      Uri.parse("https://engineer-sns-436152672971.europe-west1.run.app/profile/following"),
      headers: {//parseでUri型に変換
        "Authorization": "Bearer $token",
      },
    );
    if(res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return {
        'count': data['count'],
        'user': data['users']
      };
    }else{
      throw Exception("フォローの取得に失敗しました");
    }
  }





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
                      "なうい",
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
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text("フォロワー",style: GoogleFonts.inter(
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 14,
                    ),),
                        SizedBox(width: 20,),
                        Text("フォロー中",style: GoogleFonts.inter(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 14,
                        ),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 1),
            //  草のスクロール領域（ListView 横スクロール）

            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,//横スクロール
                children: [
                  SvgPicture.network(
                    'https://ghchart.rshah.org/${widget.name}',
                    placeholderBuilder:
                        (context) => Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black, thickness: 0.5,),

          ],
        ),
      ),
    );
  }
}
