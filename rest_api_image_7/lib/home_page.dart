import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;
  final pickar = ImagePicker();
  bool showSpinner = false;
  Future getImage() async {
    XFile? pickedImage = await pickar.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedImage != null) {
      image = File(pickedImage.path);
      setState(() {});
    } else {
      print('No image selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = http.MultipartRequest('POST', uri);
    request.fields['title'] = "From Rimon";
    var multiport = http.MultipartFile('image', stream, length);
    request.files.add(multiport);
    var response = await request.send();
    print("Status code is : ${response}");
    if (response.statusCode == 200) {
      print("Image Uploaded");
      setState(() {
        showSpinner = false;
      });
    } else {
      print("Failed to upload");
      setState(() {
        showSpinner = false;
      });
    }
    // try {} catch (Exception) {
    //   print("Exception is $Exception");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  Text("Hi Flutter"),
          GestureDetector(
            onTap: () {
              getImage();
            },
            child: Container(
              child: image == null
                  ? const Center(
                      child: Text('Pick Image'),
                    )
                  : SizedBox(
                      child: Center(
                        child: Image.file(
                          File(image!.path).absolute,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          GestureDetector(
            onTap: () {
              uploadImage();
            },
            child: const Center(
              child: Text(
                "Upload",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
