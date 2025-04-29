import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/python.dart'; // ←ここは言語に応じて
import 'package:flutter_highlight/themes/monokai-sublime.dart'; // ←テーマインポート！

class CodePostScreen extends StatefulWidget {
  @override
  _CodePostScreenState createState() => _CodePostScreenState();
}

class _CodePostScreenState extends State<CodePostScreen> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(//ここで入力フォームをクリアにするのです
      text: '',//なくても動くけど、
      language: python, // ← 言語指定だけ
    );
  }

  @override
  void dispose() {//画面は閉じたのに、CodeControllerがメモリ上にずっと残るので、これ書いた方がメモリ効率がいいらしい
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('コード投稿'),
        backgroundColor: Colors.black,
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
          data: CodeThemeData(styles: monokaiSublimeTheme), // ここでテーマ適用
          child: CodeField(
            controller: _codeController!,
           //textStyle: TextStyle(fontFamily: 'SourceCode'),//公式ドキュメントにあったから書いたけど、
          ),                                              //変わんないから,なくてもいいような気がする。
        ),
      ),
    );
  }
}
