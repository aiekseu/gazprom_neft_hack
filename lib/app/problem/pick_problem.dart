import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gazprom_hack/app/main/main_page.dart';

import 'analyze_problem.dart';

class SendProblem extends StatefulWidget {
  const SendProblem({Key? key}) : super(key: key);

  @override
  _SendProblemState createState() => _SendProblemState();
}

enum ProblemGrade { pojar, dush, server }

class _SendProblemState extends State<SendProblem> {
  ProblemGrade problem = ProblemGrade.dush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Проблема в Барак'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: ListView(
          children: [
            RadioListTile<ProblemGrade>(
              value: ProblemGrade.dush,
              title: Text('Сломался душ'),
              groupValue: problem,
              onChanged: (ProblemGrade? value) {
                setState(() {
                  problem = value!;
                });
              },
            ),
            RadioListTile<ProblemGrade>(
              value: ProblemGrade.server,
              title: Text('Сломался сервер барака'),
              groupValue: problem,
              onChanged: (ProblemGrade? value) {
                setState(() {
                  problem = value!;
                });
              },
            ),
            RadioListTile<ProblemGrade>(
              value: ProblemGrade.pojar,
              title: Text('Барак горит'),
              groupValue: problem,
              onChanged: (ProblemGrade? value) {
                setState(() {
                  problem = value!;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 7,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Описание проблемы',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnalyzePage(),
                  ),
                );
              },
              child: Text(
                'Рассчитать риск и отправить',
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
