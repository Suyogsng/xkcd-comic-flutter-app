// import helper library
import 'package:flutter/material.dart';
import'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget{
  createState(){
    return AppState();
  }
}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{
    counter++;
    final current = 
      await get('https://xkcd.com/info.0.json');
    final currentImageModel = ImageModel.fromJason(json.decode(current.body));
    int num = currentImageModel.id - counter;
    final response = 
      await get('https://xkcd.com/$num/info.0.json');
    final imageModel = ImageModel.fromJason(json.decode(response.body));
    setState((){
      images.add(imageModel);
    });

  } 

  Widget build(context){
    return MaterialApp(
    home: Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('xkcd comics'),
      ),
    ),
  );
  
  }
}

