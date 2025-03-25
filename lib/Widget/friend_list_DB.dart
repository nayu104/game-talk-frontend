import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendListDB extends StatelessWidget {
  final List user;

  const FriendListDB({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: user.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(1.0),//行間隔
          child: Text(
            user[index]["name"], //nameカラム指定でnameだけ取り出す
            style: GoogleFonts.inter(
              fontSize: 20,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
              height: 2,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
