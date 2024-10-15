// ignore_for_file: public_member_api_docs, sort_constructors_first
class PhotoModel {
  String? url;
  ScrModel? src;

  PhotoModel({this.url,  this.src});
  factory PhotoModel.fromJson(Map<String, dynamic> jsonData) {
    return PhotoModel(
      url: jsonData["url"],
      src: ScrModel.fromJson(jsonData["src"]),
    );
  }
}

class ScrModel {
  String? portrait;
  String? landscape;
  String? large;
  String? medium;

  ScrModel({this.portrait, this.landscape, this.large, this.medium});

  factory ScrModel.fromJson(Map<String, dynamic> jsonData) {
    return ScrModel(
      landscape: jsonData["landscape"],
      large: jsonData["large"],
      medium: jsonData["medium"],
      portrait: jsonData["portrait"],
    );
  }
}
