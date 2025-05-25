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

class DirectMessage extends StatefulWidget {
  final String senderId;
  final String senderName;
  final String sender_avatar_url;
  final String receiverId;
  final String receiverName;

  // final String receiver_avatar_url;

  const DirectMessage({
    super.key,
    required this.senderId,
    required this.senderName,
    required this.sender_avatar_url,
    required this.receiverId,
    required this.receiverName,
    // required this.receiver_avatar_url,
  });

  @override
  State<DirectMessage> createState() => _DirectMessage();
}

class _DirectMessage extends State<DirectMessage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  void _sendMessage() {
    final text = _controller.text.trim(); //	前後の空白（スペースや改行）を削除する
    if (text.isEmpty) return;
    setState(() {
      messages.add({
        'sender': widget.senderId,
        'text': text,
        'timestamp': DateTime.now(), //送信した瞬間の時刻
      });
      _controller.clear();
    });
  }

  bool isTyping = false;
  @override
  void _initTypingListener() {
    _controller.addListener(() {
      setState(() {
        isTyping = _controller.text.trim().isNotEmpty;//isNotEmpty：文字列が1文字以上 → true
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _initTypingListener();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar: AppBar(backgroundColor: Color(0xFF404040), elevation: 0),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // 最新を下に
              itemCount: messages.length,
              itemBuilder: (_, index) {
                final msg = messages[index];
                return ListTile(
                  title: Text(
                    msg['text'],
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    msg['timestamp'].toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: FormatTextField(
                    Width: double.infinity,
                    Height: 50,
                    iconData: Icons.textsms,
                    Controller: _controller,
                    labelText: "メッセージを入力",
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isTyping ? Icons.send : Icons.mic, // ← 条件で切り替え！
                    color: Colors.white,
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
