/// status : "success"
/// data : {"images":["http://localhost:8000/media/1/IMG_1460.JPG","http://localhost:8000/media/2/IMG_1460.JPG","http://localhost:8000/media/3/IMG_1460.JPG"]}
/// message : "Gallery retrieved successfully"

class MyImage {
  MyImage({
      this.status, 
      this.data, 
      this.message,});

  MyImage.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  String? status;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

/// images : ["http://localhost:8000/media/1/IMG_1460.JPG","http://localhost:8000/media/2/IMG_1460.JPG","http://localhost:8000/media/3/IMG_1460.JPG"]

class Data {
  Data({
      this.images,});

  Data.fromJson(dynamic json) {
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = images;
    return map;
  }

}