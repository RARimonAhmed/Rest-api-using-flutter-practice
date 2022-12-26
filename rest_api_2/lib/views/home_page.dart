import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rest_api_2/Models/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_2/api_services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ApiServices apiServices = ApiServices();
  var data;
  Future<void> getUser() async {
    Response respose =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (respose.statusCode == 200) {
      print(respose.statusCode);
      data = jsonDecode(respose.body.toString());
    } else {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
              future: getUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );

                  // return Text(userlist![5].id.toString());
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(
                                data[index]['address']['geo'].toString(),
                              ),
                              subtitle: Text(
                                data[index]['address']['geo']['lat'].toString(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              }),
        ),
      ],
    );
  }
}
