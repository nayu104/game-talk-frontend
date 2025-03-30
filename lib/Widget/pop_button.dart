import 'package:flutter/material.dart';

//使用時はMyName(font_size:x)としてください。xは数値
class PopButton extends StatelessWidget {
  final IconData icon;
  final double size;
  const PopButton({super.key, required this.icon,required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(icon, size: size, color: Colors.white),
        highlightColor: Colors.transparent,
      ),
    );
  }
}