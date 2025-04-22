import 'package:flutter/material.dart';

class Test extends StatelessWidget {

  const Test({super.key});


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 50, //余白
        child: Divider(
          //線で区切る
          thickness: 0.5, //太さ
          color: Colors.grey,
          indent: 5, //右余白
          endIndent: 5, //左余白
        )
    );

  }
}