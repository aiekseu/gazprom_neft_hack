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
  bool isAnalyzed = false;

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
          hitechMoves = 'Вычисляем риски...';
        });
      },
    ).then((value) {
      Future.delayed(
        Duration(seconds: 2),
        () {
          setState(() {
            hitechMoves = 'Готово!';
          });
        },
      );
    }).then((value) {
      Future.delayed(
        Duration(seconds: 3),
        () {
          setState(() {
            isAnalyzed = true;
          });
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
            if (!isAnalyzed) CircularProgressIndicator(),
            if (!isAnalyzed)
              Text(
                hitechMoves,
                style: TextStyle(fontSize: 20),
              ),
            if (isAnalyzed)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Проблема: ',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        children: [
                          TextSpan(
                            text:
                                'Риск по сетевому оборудованию (устаревшее оборудование, отсутствие поддержки производителя, отсутствие ЗИП, , отсутствие резервирования)',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    RichText(
                      text: TextSpan(
                        text: 'Корректирующее действие: ',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        children: [
                          TextSpan(
                            text:
                                'Немедленное устранение причин неработоспособности активных сетевых устройств локальных и глобальных сетей',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    RichText(
                      text: TextSpan(
                        text: 'Профилактическое действие: ',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        children: [
                          TextSpan(
                            text:
                                'Регулярное обновление устаревшего оборудования, контроль наличия поддержки производителя, наличия ЗИП, резервирования',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Понял',
                        style: TextStyle(fontSize: 22, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
    ;
  }
}
