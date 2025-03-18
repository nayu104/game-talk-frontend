import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

// State クラス（画面の状態を管理）
class _TimerWidgetState extends State<TimerWidget> {

  final _stopWatchTimer = StopWatchTimer();

  @override
  void initState() {
    super.initState();
    // ストップウォッチの初期化
    _stopWatchTimer.setPresetTime(StopWatchTime(5 * 60 * 1000)); // 5分をミリ秒で設定
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stopwatch Timer',
          style: GoogleFonts.lato(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ストップウォッチの表示
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: 0,
              builder: (context, snapshot) {
                final displayTime = StopWatchTimer.getDisplayTime(snapshot.data ?? 0);
                return Text(
                  displayTime,
                  style: GoogleFonts.lato(fontSize: 50),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _stopWatchTimer.onStartTimer();
                  },
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _stopWatchTimer.onStopTimer();
                  },
                  child: Text('Stop'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _stopWatchTimer.onResetTimer();
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }
}
