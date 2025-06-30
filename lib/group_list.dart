import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:highlight/languages/http.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';
import 'create_group.dart'; // 作成画面をインポート
import 'package:http/http.dart' as http;

class GroupListPage extends StatelessWidget {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('グループ一覧'),
        leading: const BackButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              // 仮のグループ作成画面遷移
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => GroupCreatePage(
                        group_name: '',
                        group_explanation: '',
                        group_participants: '',
                        media_url: '',
                      ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3, // 仮データ
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.group)),
            title: Text('グループ $index'),
            subtitle: const Text('これはグループの説明です'),
            onTap: () {
              // TODO: グループ詳細ページへ遷移
            },
          );
        },
      ),
    );
  }
}
