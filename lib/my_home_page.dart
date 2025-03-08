import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// StatefulWidget（状態を持つウィジェット）
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State クラス（画面の状態を管理）
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("フレンド一覧",
          style:
          GoogleFonts.inter(
          letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
        ),
        ),
        centerTitle: true,
        leading: SizedBox(
          width: 80,
          height: 60,
          child:  IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_back_ios)),
        ),
        actions: [
          SizedBox(
            width: 80,
            height: 60,
          child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.person_add_alt,size: 30)),
          ),
        ],
      ),
      body:  Text("nayuなゆ",
        style:
        GoogleFonts.inter(
          fontSize: 20,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}