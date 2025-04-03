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
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.timer),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.note_alt_outlined),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.people_outline),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.settings),
          ),
        ],
      );
  }
}