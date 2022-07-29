class ImageModel {

  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJason(Map<String, dynamic> parsedJason) 
    : id = parsedJason['id'],
      url = parsedJason['url'],
      title = parsedJason['title'];
}