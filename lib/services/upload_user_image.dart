import 'dart:io';
import 'package:flutter/services.dart';
import 'package:gellary/helper/api.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../models/Image.dart';


class UploadUserImage {

  // static uploadMyImage(String title, File file,String token) async{
  //   var request = http.MultipartRequest("POST",Uri.parse("https://technichal.prominaagency.com/api/upload"));
  //   request.headers['Authorization'] = 'Bearer $token';
  //   request.fields['img'] = title;
  //   var picture = http.MultipartFile.fromBytes('image', (await rootBundle.load(file.path)).buffer.asUint8List(),
  //       filename: title);
  //   request.files.add(picture);
  //   var response = await request.send();
  //   var responseData = await response.stream.toBytes();
  //   var result = String.fromCharCodes(responseData);
  //   print(result);
  // }

  static Future<void> uploadUserImageToAPI(XFile imageFile, String token) async {
    final url = Uri.parse('https://technichal.prominaagency.com/api/upload');
    final request = http.MultipartRequest('POST', url);
    final fileStream = http.ByteStream(imageFile.openRead());
    final fileLength = await imageFile.length();
    final multipartFile = http.MultipartFile(
      'image',
      fileStream,
      fileLength,
      filename: imageFile.path.split('/').last,
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(multipartFile);
    final response = await request.send();
    if (response.statusCode == 200) {
      print('lol Image uploaded successfully');
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
    }
  }

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


