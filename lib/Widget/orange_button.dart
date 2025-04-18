import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//使用時はMyName(font_size:x)としてください。xは数値

//onPressedに何も入れないと灰色のボタンになります！

class OrangeButton extends StatelessWidget {
  final String? message;
  final double? fontSize;
  final VoidCallback? onPressed;
  const OrangeButton({super.key, this.message, this.fontSize,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),//ボタン内の余白指定,整形のため
      ),
      child: Text(//text内で背景色指定するとマーカーになる
        message??"",
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