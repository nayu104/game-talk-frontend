import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//使用時はMyName(font_size:x)としてください。xは数値
class TextFormat extends StatelessWidget {
  final String message;//final状態変化対策,="";で二重初期化しないでね.コンストラクタで代入するから
  final double fontsize;
  const TextFormat({super.key,required this.message,required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
    message,
    style: GoogleFonts.inter(
    letterSpacing: 1.2,
    fontWeight: FontWeight.w600,
    color: Colors.white,
      fontSize: fontsize,
    ),
    );
  }
}