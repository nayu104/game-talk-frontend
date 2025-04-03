import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/Widget/text_format.dart';
import 'Widget/bottom_navigation.dart';
import 'Widget/push_button.dart';
import 'Widget/format_text_field.dart';
import 'Widget/orange_button.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF404040),
      appBar:
      AppBar(backgroundColor: Color(0xFF404040),
      ),

      body: Center(
        child:Column(
          children: [
            TextFormat(message: "ニックネーム",fontsize: 30),
            SizedBox(height: 10),
            FormatTextField(Width: 300,iconData: Icons.person_2),
            OrangeButton(message: 'はじめる',fontSize: 22),
        ],
        ),
      ),
    );
  }
}
