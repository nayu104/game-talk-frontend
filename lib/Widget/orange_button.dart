import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//使用時はMyName(font_size:x)としてください。xは数値
class OrangeButton extends StatelessWidget {
  final String message;//final状態変化対策,="";で二重初期化しないで.コンストラクタで代入するから
  final double fontSize;
  final VoidCallback? onPressed;
  const OrangeButton({super.key, required this.message, required this.fontSize,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),//ボタン内の余白指定,整形のため
      ),
      child: Text(//text内で背景色指定するとマーカーになる
        message,
        style: GoogleFonts.inter(
          fontSize: fontSize,
          letterSpacing: 2.2,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}