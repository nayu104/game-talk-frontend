// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:highlight/languages/http.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart';
// import 'create_group.dart'; // 作成画面をインポート
// import 'package:http/http.dart' as http;
//
// class GroupListPage extends StatelessWidget {
//
//   const GroupListPage({
//     super.key,
//
//   });
//
//
//   Future<void> _addPost(String message,int recruitment, {Map<String, dynamic>? replyTo}) async{
//     final response = await http.post(
//         Uri.parse("https://engineer-sns-436152672971.europe-west1.run.app/get_group/list"),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           //'media_url': mediaUrl,
//         })
//     );
//     // if(response.statusCode == 201){
//     //   final post = jsonDecode(response.body);
//     //   setState(() {
//     //     posts.insert(0, post);
//     //   });
//     // }else{
//     //   print("投稿失敗");
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('グループ一覧'),
//         leading: const BackButton(),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () async {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const GroupCreatePage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: 3, // 仮データ
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: const CircleAvatar(child: Icon(Icons.group)),
//             title: Text('グループ $index'),
//             subtitle: const Text('これはグループの説明です'),
//             onTap: () {
//               // TODO: グループ詳細ページへ遷移
//             },
//           );
//         },
//       ),
//     );
//   }
// }
