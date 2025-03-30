import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  final double? Width;
  final TextInputType?  keyboardType;
  final IconData? iconData;
  const SearchTextField({super.key,this.Width,this.keyboardType,this.iconData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Width, //幅300
      height: 50, //高さ50
      child: TextField(
        style: GoogleFonts.inter(
          //入力時のフォント
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          //入力フィールドないしicon
          prefixIcon: iconData != null
          ? Icon(iconData, size: 20, color: Colors.white)
          : null,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          //入力領域の余白を０
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white, //入力モードの色と枠線幅
              width: 1.5,
            ),
          ),
        ),
        keyboardType: keyboardType,//example：TextInputType.number
      ),
    );
  }
}