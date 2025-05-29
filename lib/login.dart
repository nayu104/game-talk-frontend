import 'package:flutter/material.dart';
import 'package:stu/Widget/text_format.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';
import 'main_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> GitHub_login() async {
    var url = Uri.parse(
      "https://engineer-sns-436152672971.europe-west1.run.app/login/github?platform=flutter",
    );
    if (await canLaunchUrl(url)) {
      //awaitなのはネットの状況やスマホの状態によって時間がかかる可能性があるから
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      ); //mode:LaunchMode.externalApplicationは外部ブラウザで開くモード
    } else {
      throw "開けないアル$url";
    }
  }

  final AppLinks appLinks = AppLinks(); //リンク来た判定に使う

  @override
  void initState() {
    super.initState();

    // 初回起動時のリンクがきたかチェック
    appLinks.getInitialAppLink().then(_handleUri);

    // アプリ起動中にリンクが来たかチェック、きたら_handleUriにリンクを渡す
    appLinks.uriLinkStream.listen(_handleUri);

    print("DeepLink 完了");
  }

  void _handleUri(Uri? uri) {
    print("URI受信: $uri");
    if (uri?.scheme == "techcircle") {
      final this_id = uri?.queryParameters["id"] ?? "";
      final this_name = uri?.queryParameters["name"] ?? "";
      final this_avatar = uri?.queryParameters["avatar"] ?? "";
      final this_token = uri?.queryParameters["token"] ?? "";

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => MainScreen(
                  id: this_id,
                  name: this_name,
                  avatar: this_avatar,
                  token: this_token,
                ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar: AppBar(backgroundColor: Color(0xFF404040), elevation: 0),

      body: Center(
        child: Column(
          children: [
            TextFormat(message: "ようこそ！", fontsize: 25),

            SizedBox(height: 40), //行間

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // GitHubのイメージに合わせた黒
                foregroundColor: Colors.white, // テキストとアイコンを白に
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
              ),
              icon: Image.asset(
                'assets/images/GitHub_Invertocat_Light.png', // 公式のGitHubロゴ
                height: 30,
                width: 50,
              ),
              label: const Text('GitHubで登録/ログイン'),
              onPressed: () {
                GitHub_login();
              },
            ),
          ],
        ),
      ),
    );
  }
}
