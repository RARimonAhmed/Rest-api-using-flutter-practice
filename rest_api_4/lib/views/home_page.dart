import 'package:flutter/material.dart';
import 'package:rest_api_4/api_services/api_services.dart';
import 'package:rest_api_4/models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices = ApiServices();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   apiServices.getProductList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: Column(children: [
            Expanded(
                child: FutureBuilder<ProductModel?>(
                    future: apiServices.getProductList(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: ListView.builder(
                                      itemCount: snapshot.data!.data!.length,
                                      itemBuilder: ((context, possition) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          // decoration: const BoxDecoration(
                                          //   image: DecorationImage(
                                          //     image: NetworkImage(''),
                                          //   ),
                                          // ),
                                          child: Text(snapshot
                                              .data!.data![possition].id
                                              .toString()),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              );
                            });
                      }
                    }))
          ])),
    );
  }
}
