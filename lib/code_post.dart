import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/python.dart'; // ←ここは言語に応じて
import 'package:flutter_highlight/themes/monokai-sublime.dart'; // ←テーマインポート！
import 'package:flutter_highlight/themes/github.dart';

class CodePostScreen extends StatefulWidget {
  @override
  _CodePostScreenState createState() => _CodePostScreenState();
}

class _CodePostScreenState extends State<CodePostScreen> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(
      //ここで入力フォームをクリアにする
      text: '', //なくても動くけど、
      language: python, // ← 言語指定だけ
    );
  }

  @override
  void dispose() {
    //画面は閉じたのに、CodeControllerがメモリ上にずっと残るので、これ書いた方がメモリ効率がいいらしい
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF404040),
      appBar: AppBar(
        title: Text('コード投稿'),
        backgroundColor: Color(0xFF404040),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final code = _codeController!.text;
              Navigator.pop(context, code);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
          child: CodeTheme(
            data: CodeThemeData(styles: githubTheme), // ここでテーマ適用

            child:
            Container(
              color: Color(0xFF404040),
            child: CodeField(
              controller: _codeController!,
              lineNumberStyle: LineNumberStyle(
                width: 0,
                textStyle: TextStyle(color: Colors.transparent, fontSize: 0),
              //textStyle: TextStyle(fontFamily: 'SourceCode'),//公式ドキュメントにあったから書いたけど、
            ), //変わんないから,なくてもいいような気がする。
            ),

          ),
        ),
      ),
    );
  }
}
