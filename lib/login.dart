import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stu/Widget/text_format.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Widget/bottom_navigation.dart';
import 'Widget/push_button.dart';
import 'Widget/format_text_field.dart';
import 'Widget/orange_button.dart';
import 'package:url_launcher/link.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> GitHub_login() async{
    var url = Uri.https("dart-study-db.onrender.com","login/github");
    if(await canLaunchUrl(url)){//awaitなのはネットの状況やスマホの状態によって時間がかかる可能性があるから
      await launchUrl(url,mode:LaunchMode.externalApplication);//mode:LaunchMode.externalApplicationは外部ブラウザで開くモード
    }else{
      throw "開けないアル$url";
    }
  }
  final AppLinks appLinks = AppLinks();//DeepLinkには欠かせませんねえ。リンク来た判定に使う

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

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Home(id: this_id, name: this_name, avatar: this_avatar),
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF404040),
      appBar:
      AppBar(backgroundColor: Color(0xFF404040),
      ),
      
      body: Center(
        child:Column(
          children: [

            TextFormat(message: "GitHubでログイン",fontsize: 25),

            SizedBox(height: 40),//行間

            OrangeButton(
              message: 'ログイン',
              fontSize: 10,
            onPressed: (){
              GitHub_login();
            },
            ),
          ],
        ),
      ),
    );
  }
}
