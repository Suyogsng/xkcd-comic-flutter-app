class ImageModel{
  int id;
  String url;
  String title;

  ImageModel(this.id,this.url,this.title);

  ImageModel.fromJason(Map<String, dynamic> parsedJson){
    id = parsedJson['num'];
    url = parsedJson['img'];
    title = parsedJson['title'];
  }
}