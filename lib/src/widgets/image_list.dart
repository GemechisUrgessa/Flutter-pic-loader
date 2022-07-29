import 'package:flutter/material.dart';
import '../models/images_mode.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> images;

  ImageList (this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index){
        return containerBox(images[index]);
      },
    );
    
  } 
  Widget containerBox(ImageModel image) {
      return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey)
          ),
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          child: Column (
            children: <Widget>[
              Padding(
                child: Image.network(image.url),
                padding: EdgeInsets.only(
                bottom: 9.0,
              )
              ),
              Text(image.title),
            ],)
        );
  }
}