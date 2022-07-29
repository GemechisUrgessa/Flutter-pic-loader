import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/images_mode.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> images = [];

  fetchImage() async {
    var response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    counter++;
    var imageModel = ImageModel.fromJason(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: const Center(
            child: Text(
              'HD Pics!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 10, 1, 1)),
            ),
          ),
        ),
      ),
    );
  }
}
