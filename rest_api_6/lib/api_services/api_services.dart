import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  String postUrl = 'https://reqres.in/api/login';
  void login(String email, String passwrod) async {
    try {
      Response response = await http.post(Uri.parse(postUrl), body: {
        'email': email,
        'password': passwrod,
      });
      if (response.statusCode == 200) {
        print(response.body.toString());
        print('Account created successfully');
      } else {
        print('Something is wrong');
      }
    } catch (Exception) {
      print("Exception is " + Exception.toString());
    }
  }
}
