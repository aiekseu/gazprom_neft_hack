import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gazprom_hack/app/authorization/auth_page.dart';
import 'package:gazprom_hack/app/main/main_page.dart';

class AnalyzePage extends StatefulWidget {
  const AnalyzePage({Key? key}) : super(key: key);

  @override
  _AnalyzePageState createState() => _AnalyzePageState();
}

class _AnalyzePageState extends State<AnalyzePage> {
  String hitechMoves = 'Анализируем...';

  @override
  void initState() {
    _goOn();
    super.initState();
  }

  void _goOn() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        setState(() {
          hitechMoves = 'Вносим запись в блокчейн...';
        });
      },
    ).then((value) {
          Future.delayed(
            Duration(seconds: 2),
            () {
              setState(() {
                hitechMoves = 'Добрый вечер, Алексей!';
              });
            },
          );
        })
    .then((value) {
      Future.delayed(
        Duration(seconds: 4),
            () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => MainPage(),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text(hitechMoves, style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
    ;
  }
}
