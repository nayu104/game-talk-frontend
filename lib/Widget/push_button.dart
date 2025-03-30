import 'package:flutter/material.dart';

class PushButton extends StatelessWidget {
  final String goto;
  final IconData icon;
  final double size;
  const PushButton({super.key, required this.goto, required this.icon,required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context,goto);//goto=fileパスをいれる
        },
        icon: Icon(icon, size: size, color: Colors.white),
        highlightColor: Colors.transparent,
      ),
    );
  }
}

//"/add_friend",,person_add_alt