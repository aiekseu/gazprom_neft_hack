import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final horoscopeProvider = FutureProvider<String>((ref) async {
  final response =
      await http.get(Uri.parse('https://ohmanda.com/api/horoscope/libra'));

  print(jsonDecode(response.body)['horoscope']);
  return jsonDecode(response.body)['horoscope'];
});
