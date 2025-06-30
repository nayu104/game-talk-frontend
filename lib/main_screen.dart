import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stu/board.dart';
import 'package:vibration/vibration.dart';
import 'create_group.dart';
import 'dm_home.dart';
import 'group_list.dart';
import 'home.dart';
import 'invitation.dart';
import 'notice.dart';

class MainScreen extends StatefulWidget {
  final String id;
  final String name;
  final String avatar;
  final String token;

  const MainScreen({
    super.key,
    required this.id,
    required this.name,
    required this.avatar,
    required this.token,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      Home(
        id: widget.id,
        name: widget.name,
        avatar: widget.avatar,
        token: widget.token,
      ), //募集
      Board(
        id: widget.id,
        name: widget.name,
        avatar: widget.avatar,
        token: widget.token,
      ), // 総合掲示板
      GroupListPage(), // ← グループ一覧画面に修正
      Notice(avatar: widget.avatar), // 通知
      // GroupListPage()
    ];
  }

  void vibratePhone() {
    Vibration.vibrate(duration: 30); //バイブレーション関数
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //複数の画面を全部重ねて隠しておいて、指定された番号の画面だけを見せる
      //これないと真っ白になる（表示されない）
      body: IndexedStack(index: _currentIndex, children: _screens),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //これがないと背景が効かない
        currentIndex: _currentIndex, // selectedItemColorらで使う
        backgroundColor: Color(0xFF404040), // 背景色
        selectedItemColor: Colors.white, // 選択中アイコンの色
        unselectedItemColor: Colors.white70, // 未選択アイコンの色

        selectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
        //押されたら、表示する画面をその番号（index）に切り替える
        onTap: (index) {
          vibratePhone();
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'おすすめ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            label: '招待グループ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'グループ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: '通知',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'マイページ',
          ),
        ],
      ),
    );
  }
}
