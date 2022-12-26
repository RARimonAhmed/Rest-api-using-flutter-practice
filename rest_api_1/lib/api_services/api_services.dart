import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_1/models/post_model.dart';

class ApiServices {
  String url = 'https://jsonplaceholder.typicode.com/posts';

  final List<Posts> postList = [];
  Future<List<Posts>> getPostsList() async {
    Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(Posts.FromJSON(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
}
