import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyName extends StatelessWidget {
  final String my_name;
  const MyName({super.key, required this.my_name});

  @override
  Widget build(BuildContext context) {
    return Text(
      my_name,
      style: GoogleFonts.inter(
        fontSize: 20, //20が標準
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}