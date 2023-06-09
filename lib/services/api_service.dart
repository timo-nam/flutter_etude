import 'dart:convert';

import 'package:flutter_etude/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const _baseUrl = 'https://randomuser.me/api';

  static Future<List<UserModel>> getUsersByGender() async {
    const results = 100;
    final userInstances = <UserModel>[];
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final Uri url = Uri.parse(
        '$_baseUrl/?results=$results&gender=${prefs.getString('gender') ?? GenderEnum.all.urlString}');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body)['results'];

      for (var user in users) {
        userInstances.add(UserModel.fromJson(user));
      }
      return userInstances;
    } else {
      throw Error();
    }
  }
}

enum GenderEnum {
  all,
  male,
  female;

  @override
  String toString() {
    switch (this) {
      case GenderEnum.all:
        return 'all';
      case GenderEnum.male:
        return 'male';
      case GenderEnum.female:
        return 'female';
    }
  }

  String get urlString {
    switch (this) {
      case GenderEnum.all:
        return '';
      case GenderEnum.male:
        return 'male';
      case GenderEnum.female:
        return 'female';
    }
  }
}
