import 'package:flutter/material.dart';
import 'package:rest_api_1/api_services/api_services.dart';
import 'package:rest_api_1/models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
              future: apiServices.getPostsList(),
              builder: ((context, AsyncSnapshot<List<Posts>> snapshot) {
                if (snapshot.hasData) {
                  List<Posts>? posts = snapshot.data;
                  return ListView.builder(
                      itemCount: posts!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              child: ListTile(
                                leading: Text(posts[index].id.toString()),
                                title: Text(
                                  // snapshot.data![index].title.toString(),
                                  posts[index].title.toString(),
                                ),
                                subtitle: Text(posts[index].body.toString()),
                                trailing: Text(posts[index].userId.toString()),
                              ),
                            ),
                          ],
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.pink,
                    ),
                  );
                }
              })),
        ),
      ],
    );
  }
}
