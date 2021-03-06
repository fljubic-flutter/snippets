import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fuckarounds/riverpod/mvvm/joke_model.dart';
import 'package:http/http.dart' as http;

class JokeViewModel {
  static Future<JokeSingle> getDadJoke() async {
    final http.Response response = await http.get("https://icanhazdadjoke.com/",
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);

      return JokeSingle(text: decode["joke"]);
    } else {
      return JokeSingle(
        text: "No internet connection :(",
      );
    }
  }
}
