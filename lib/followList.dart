// follower_list_page.dart
import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  final List<dynamic> users;
  final String title;

  const UserListPage({super.key, required this.users, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF404040),
          title: Text(title)
      ),
      backgroundColor: Color(0xFF404040),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user['avatar_url'] ?? ''),
            ),
            title: Text(user['login'] ?? '不明', style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
