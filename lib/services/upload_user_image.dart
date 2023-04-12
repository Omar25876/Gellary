import 'dart:io';
import 'package:flutter/services.dart';
import 'package:gellary/helper/api.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../models/Image.dart';


class UploadUserImage {


  static Future<void> uploadNewImage(ImageSource goSource,String token) async {
    final imageFile = await ImagePicker().pickImage(source: goSource,);
    final url = Uri.parse('https://technichal.prominaagency.com/api/upload');
    final request = http.MultipartRequest('POST', url);
    final fileStream = http.ByteStream(imageFile!.readAsBytes().asStream());
    final fileLength = await imageFile.length();
    final multipartFile = http.MultipartFile(
      'img',
      fileStream,
      fileLength,
      filename: imageFile.path.split('/').last,
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(multipartFile);
    final response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
    }
  }
}


