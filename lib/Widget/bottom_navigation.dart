import 'package:flutter/material.dart';

class bottom_navigation extends StatefulWidget {
  const bottom_navigation({super.key});

  @override
  State<bottom_navigation> createState() => _bottom_navigation();
}

class _bottom_navigation extends State<bottom_navigation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.home))),
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.timer))),
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.note_alt_outlined))),
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.people_outline))),
        Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.settings))),
      ],
    );
  }
}
