import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//使用時はMyName(font_size:x)としてください。xは数値
class smallText extends StatelessWidget {
  final String message;//final状態変化対策,="";で二重初期化しないでね.コンストラクタで代入するから
  const smallText({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: GoogleFonts.inter(
        fontSize: 10,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}