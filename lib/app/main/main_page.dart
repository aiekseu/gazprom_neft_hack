import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gazprom_hack/app/problem/pick_place.dart';

import 'main_page_provider.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final horoscope = watch(horoscopeProvider);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 105,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                child: Image.asset(
                  'assets/avatar.png',
                ),
                borderRadius: BorderRadius.circular(180.0),
              ),
            ),
            Text(
              'Алексей Кудашкин',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Text(
              'Бурильщик скважины в г. Новокузнецк\nЗнак зодиака: Весы',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PickPlacePage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Сообщить о проблеме',
                  style: TextStyle(fontSize: 22, color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Заполнить дневник',
                  style: TextStyle(fontSize: 22, color: Colors.orange),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text('Гороскоп на сегодня:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),),
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: horoscope.when(
                data: (data) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) => Text(data, style: TextStyle(fontSize: 22),),
                    ),
                  ),
                ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (e, stack) => Text('error: ${e}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
