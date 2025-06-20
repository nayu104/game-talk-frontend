import 'dart:convert';

import 'package:flutter/material.dart';

class GroupCreatePage extends StatelessWidget {
  final String group_name;
  final String group_explanation;
  final String group_participants;
  final String media_url;
  const GroupCreatePage({
    super.key,
    required this.group_name,
    required this.group_explanation,
    required this.group_participants,
    required this.media_url,
  });

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('グループ作成'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("アイコンを設定"),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'タイトル'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: '説明（どんなグループ？）',
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // TODO: バックエンドにPOST送信
                print("タイトル: ${titleController.text}");
                print("説明: ${descController.text}");
              },
              child: const Text('作成'),
            ),
          ],
        ),
      ),
    );
  }
}
