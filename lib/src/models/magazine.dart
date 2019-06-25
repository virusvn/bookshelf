class Magazine {
  int _id;
  int _media_id;
  String _name;
  String _url;
  String _description;
  String _image;
  String _published_time;
  String _number;

  Magazine(result) {
    _id = int.parse(result["id"]);
    _media_id = int.parse(result["media_id"]);
    _url = result["url"];
    _description = result["description"];
    _image = result["image"];
    _published_time = result["publish_time"];
    _number = result["number"];
    _name = result["name"];
  }
  int get id => _id;
  int get media_id => _media_id;
  String get name => _name;
  String get url => _url;
  String get description => _description;
  String get image => _image;
  String get published_time => _published_time;
  String get number => _number;
}
