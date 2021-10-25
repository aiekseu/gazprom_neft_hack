import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gazprom_hack/app/authorization/camera_page.dart';

import 'auth_providers.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userPhoneStr = watch(userPhoneNumStrProvider);
    final userPhone = watch(userPhoneNumProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              'Логин:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              userPhoneStr.state,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Slider(
              value: userPhone.state,
              min: 9000000000,
              max: 9999999999,
              onChanged: (value) {
                userPhone.state = value;
                userPhoneStr.state =
                    '+7 (${userPhone.state ~/ 10000000}) ${userPhone.state ~/ 10000 % 1000}-${userPhone.state ~/ 100 % 100}-${(userPhone.state % 100).toInt()}';
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: OutlinedButton(
                child: Text(
                  'Войти по фото',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AuthViaCameraPage()));

                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/1c.png',
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Войти через 1С: детдом',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
