import 'package:flutter/material.dart';
import 'package:stu/Widget/ui_divider_widget.dart';

class bottom_navigation extends StatefulWidget {
  const bottom_navigation({super.key});

  @override
  State<bottom_navigation> createState() => _bottom_navigation();
}

class _bottom_navigation extends State<bottom_navigation> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: const BoxDecoration(
            border: Border(//四方の枠線を定義するプロパティ
              top: BorderSide(color:Colors.orangeAccent,width: 0.6),
            ),
          ),
    child:  Row(
      children: [
      Divider(color: Colors.white,),//TODOなぜか下線が表示されない！
        SizedBox(height: 20,),
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.home,color: Colors.white))),
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.timer,color: Colors.white))),
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.note_alt_outlined,color: Colors.white))),
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.people_outline,color: Colors.white))),
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.settings,color: Colors.white))),
      ],//ボタンの形ださくね？
     ),
    );
  }
}
