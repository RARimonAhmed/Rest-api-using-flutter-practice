import 'dart:convert';

import 'package:rest_api_4/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // List<ProductsModel> productList = [];

  Future<ProductModel?> getProductList() async {
    String url =
        'https://dev-badhan-api.stylezworld.net/api/common/blood/groups';
    final response = await http.get(Uri.parse(url));

    print("Response = ${response.body}");
    if (response.statusCode == 200) {
      var data = response.body;

      return productModelFromJson(data);
    } else {
      return null;
    }
  }
}
