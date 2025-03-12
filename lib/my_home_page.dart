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
    List user = ["んd", "BB", "こんちわ"]; //ここに入れないとホットリロードで更新されない。あとで修正する
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "フレンド一覧",
          style: GoogleFonts.inter(
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: SizedBox(
          width: 50,
          height: 50,
          child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        ),
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, size: 35),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.person),
          Text(
            "nayuなゆ",
            style: GoogleFonts.inter(
              fontSize: 20,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, size: 15),
              Text(
                "99999999",
                style: GoogleFonts.robotoMono(
                  fontSize: 15,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    user[index],
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      height: 2,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
