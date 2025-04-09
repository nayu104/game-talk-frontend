import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:vibration/vibration.dart';

import 'Widget/orange_button.dart';

class StudyTimer extends StatefulWidget {
const StudyTimer({super.key});

@override
State<StudyTimer> createState() => _StudyTimer();
}

// State クラス（画面の状態を管理）
class _StudyTimer extends State<StudyTimer> {
  // この _stopWatchTimer は StopWatchTimer クラスのインスタンス。
  //onStartTimer()やらを召喚するために使う
final _stopWatchTimer = StopWatchTimer();

void vibratePhone() {
  Vibration.vibrate(duration: 30); //バイブレーション関数
}

//リソースを解放
@override
void dispose(){
  _stopWatchTimer.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
    backgroundColor: Color(0xFF404040),
body: Center(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [

      //非同期で動くよ。
      //タイマーの現在時間（ミリ秒）が流れてくる「Stream」を監視して、
      //値が変わるたびに画面を自動で更新してくれるウィジェットだお
      StreamBuilder<int>(
        stream: _stopWatchTimer.rawTime,//タイマーのミリ秒で流れて来るデータ
        initialData: _stopWatchTimer.rawTime.value,//streamの値がまだ届いてないとき用の初期値（nullエラー防止）
        builder: (context,snapshot){
          //最新
          final value = snapshot.data!;//「！」はnullじゃないって保証する意味ね
          final displayTime = StopWatchTimer.getDisplayTime(
              value,
            milliSecond: false,//ミリタイム非表示
            hours: true,
          );//ミリ秒（例：83000）を「00:01:23」みたいな見やすい文字列に変える関数
          return Text(
            displayTime,
            style: GoogleFonts.inter(
              fontSize: 40,
              letterSpacing: 2.2,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          );
        },
      ),
      SizedBox(height: 50),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [

      OrangeButton(
          message: "スタート",
          fontSize: 10,
          onPressed:(){
            _stopWatchTimer.onStartTimer();
            vibratePhone();
          }
          ),

      OrangeButton(
        message: "ストップ"
        ,fontSize: 10,
        onPressed: () {
          _stopWatchTimer.onStopTimer();
          vibratePhone();
        },
      ),
      OrangeButton(message: "リセット"
        ,fontSize: 10,
        onPressed: () {
          _stopWatchTimer.onResetTimer();
          vibratePhone();
          (
          );
        },
      ),
  ],
      ),
      SizedBox(height: 20),
      OrangeButton(message: "終了",fontSize: 15,onPressed: _stopWatchTimer.onResetTimer,),
    ],
  ),

)
);
}
}