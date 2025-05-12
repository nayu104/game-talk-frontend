import 'package:flutter/material.dart';

class Reply extends StatefulWidget {
  final Map<String, dynamic>? replyTo; // ← リプライ対象の投稿

  const Reply({
    super.key,
    this.replyTo,
  });

  @override
  State<Reply> createState() => _ReplyState();
}

class _ReplyState extends State<Reply> {
  // 再帰的にリプライを表示する関数
  Widget buildReplyChain(Map<String, dynamic>? post, [int depth = 0]) {
    if (post == null) return SizedBox();

    return Padding(
      padding: EdgeInsets.only(left: 16.0 * depth), // インデント
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(post["avatar"]),
                radius: 16,
              ),
              SizedBox(width: 8),
              Text(
                "@${post["name"]}",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            post["message"],
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 8),
          buildReplyChain(post["replyTo"], depth + 1), // 再帰呼び出し
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar: AppBar(
        backgroundColor: Color(0xFF404040),
        elevation: 0,
        title: Text("返信"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildReplyChain(widget.replyTo), // 無限入れ子表示
        ),
      ),
    );
  }
}
