import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/Widget/text_format.dart';
import 'Widget/bottom_navigation.dart';
import 'Widget/push_button.dart';
import 'Widget/format_text_field.dart';
import 'Widget/orange_button.dart';


class SignUP extends StatefulWidget {
  const SignUP({super.key});
  @override
  State<SignUP> createState() => _SignUP();
}
class _SignUP extends State<SignUP> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signup() async{
    final name = nameController.text;
    final pass = passwordController.text;

    final url = Uri.http("172.20.10.4:5000","/signup");

    final response = await http.post(
      url,
      headers: {"Content-Type":"application/json"},//jsonで送る合図
      body: jsonEncode({//json変換＆postする中身
        "username":name,
        "password":pass,
      }),
    );
  }

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

            FormatTextField(
              Width: 300,
              iconData: Icons.person_2,
              labelText: "ユーザーID",
              Controller: nameController,//入力内容をnameControllerに渡す
            ),

            FormatTextField(
              Width: 300,
              iconData: Icons.key,
              labelText: "パスワード",
              Controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
            ),

            OrangeButton(message: 'はじめる',fontSize: 12,onPressed: signup,),
        ],
        ),
      ),
    );
  }
}
