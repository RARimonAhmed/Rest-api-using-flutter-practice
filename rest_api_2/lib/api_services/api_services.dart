import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_2/Models/users_model.dart';

class ApiServices {
  List<UsersModel> userList = [];
  String url = 'https://jsonplaceholder.typicode.com/users';
  Future<List<UsersModel>> getUserList() async {
    Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(UsersModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
}
