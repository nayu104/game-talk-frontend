import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//使用時はMyName(font_size:x)としてください。xは数値
class MyName extends StatelessWidget {
  final double font_size;
  const MyName({super.key, required this.font_size});

  @override
  Widget build(BuildContext context) {
    return Text(
      "nayuなゆ",
      style: GoogleFonts.inter(
        fontSize: font_size, //20が標準
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}