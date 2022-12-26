import 'package:flutter/material.dart';
import 'package:rest_api_3/api_services/api_services.dart';

import 'package:rest_api_3/models/photos_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: apiServices.getPhotos(),
                builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              snapshot.data![index].title.toString(),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString(),
                              ),
                            ),
                            trailing: Text(snapshot.data![index].id.toString()),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    ));
  }
}
