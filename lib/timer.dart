import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StudyTimer extends StatefulWidget {
  const StudyTimer({super.key});

  @override
  State<StudyTimer> createState() => _StudyTimer();
}

// State クラス（画面の状態を管理）
class _StudyTimer extends State<StudyTimer> {
  final _stopWatchTimer = StopWatchTimer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // UIをここに追加する
    );
  }
}
