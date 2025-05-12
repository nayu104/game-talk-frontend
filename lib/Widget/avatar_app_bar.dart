import 'package:flutter/material.dart';

class AvatarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String avatarUrl;

  const AvatarAppBar({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF404040),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
          radius: 18,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
