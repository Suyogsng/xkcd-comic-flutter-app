import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> images;

  ImageList(this.images);

  Widget build(context){
    return ListView.builder(
      itemCount: images.length,
      itemBuilder:(context, int index){
        //return Image.network(List.of(images.reversed)[index].url);
        return buildImage(List.of(images.reversed)[index]);
      }
    );
  }

  Widget buildImage(ImageModel image){
    return Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey)
          ),
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding( 
                child: Image.network(image.url),
                padding: EdgeInsets.only(bottom:  8.0),
              ),
              Text(image.title),
            ]
          )
          //child: Image.network(image.url)
        );
  }
}