import 'dart:convert';

import 'package:flutter_task/data/models.dart';
import 'package:http/http.dart' as http;

class Repository {
  final String newsApi = 'https://api.first.org/data/v1/news';
  final String registerApi = 'https://nodejs-register-login-app.herokuapp.com';
  final String loginApi =
      'https://nodejs-register-login-app.herokuapp.com/login';

  Future<List<News>> getNewsList() async {
    Uri newsUri = Uri.tryParse(newsApi);

    final response = await http.get(newsUri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> rawJson = json.decode(response.body);

      List<dynamic> data = rawJson['data'];

      List<News> newsList = [];

      data.forEach((news) => newsList.add(News.fromJson(news)));

      return newsList;
    } else {
      // Error decoding
      print('Error getting data!');
      return null;
    }
  }

  Future<bool> register(
      String email, String password, String passwordConf) async {
    Uri registerUri = Uri.tryParse(registerApi);

    Map<String, String> registerBody = {
      "email": email,
      "password": password,
      "passwordConf": passwordConf,
    };

    final response =
        await http.post(registerUri, body: jsonEncode(registerBody));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      /// For now REGISTER API is giving an empty response
      ///
      /// Hence for now the below chack has been hardcoded to TRUE

      // final Map<String, dynamic> rawResponse = json.decode(response.body);

      // if ((rawResponse['Success'] ?? "") != "") return true;
    }
    return true;
    // return false;
  }

  Future<bool> login(String email, String password) async {
    Uri loginUri = Uri.tryParse(loginApi);

    Map<String, String> loginBody = {
      "email": email,
      "password": password,
    };

    final response = await http.post(loginUri, body: jsonEncode(loginBody));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> rawResponse = json.decode(response.body);

      /// For now LOGIN API cannot be used as the REGISTER API is
      /// giving an empty response
      ///
      /// Hence for now the below chack has been hardcoded to TRUE

      // if ((rawResponse['Success'] ?? "") != "") return true;
    }
    return true;
    // return false;
  }
}
