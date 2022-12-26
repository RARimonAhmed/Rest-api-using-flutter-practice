import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_3/models/photos_model.dart';

class ApiServices {
  List<PhotoModel> photoList = [];

  Future<List<PhotoModel>> getPhotos() async {
    String url =
        'https://dev-badhan-api.stylezworld.net/api/common/blood/groups';
    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      for (Map<String, dynamic> values in data) {
        photoList.add(PhotoModel.fromJSON(values));
      }
      return photoList;
    } else {
      return photoList;
    }
  }
}
