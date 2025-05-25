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
import 'dm.dart'; // ← これが個別DM画面
import '';

class DirectMessage_Home extends StatefulWidget {
  final String id;
  final String name;
  final String avatar;

  const DirectMessage_Home({
    super.key,
    required this.id,
    required this.name,
    required this.avatar,
  });

  @override
  State<DirectMessage_Home> createState() => _DirectMessage_HomeState();
}

class _DirectMessage_HomeState extends State<DirectMessage_Home> {
  // 変数や状態はこっちに
  List<Map<String, String>> userList = [
    {'id': '1', 'name': 'Alice'},
    {'id': '2', 'name': 'Bob'},
    {'id': '3', 'name': 'Charlie'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF404040),
      appBar: AppBar(
        backgroundColor: const Color(0xFF404040),
        elevation: 0,
        title: const Text("メッセージ"),
        leading: AvatarAppBar(avatarUrl: widget.avatar),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            title: Text(
              user['name']!,
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DirectMessage(
                    senderId: widget.id,
                    senderName: widget.name,
                    sender_avatar_url: widget.avatar,
                    receiverId: user['id']!,
                    receiverName: user['name']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
