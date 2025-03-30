import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPoint_Row extends StatelessWidget {

  const MyPoint_Row({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 15, color: Colors.amberAccent),
        Text(
          "999",
          style: GoogleFonts.robotoMono(
            fontSize: 15,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}