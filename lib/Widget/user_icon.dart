import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserIcon extends StatelessWidget {
  final double size;
  const UserIcon({super.key,required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, //ウィジェットを中央に重ねる
      children: [
        Container(
          padding: EdgeInsets.all(size),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              //ここでぼかし影つくるよ
              BoxShadow(
                color: Colors.orange,
                blurRadius: 1, //ぼかし具合
                spreadRadius: 1.5, //幅
              ),
            ],
          ),
        ),

        CircleAvatar(
          //アイコン
          radius: size, //半径,フレンドリストのトップ自分はsize=30;
          backgroundImage: AssetImage('assets/images/test01.jpg'),
        ),
      ],
    );
  }
}
