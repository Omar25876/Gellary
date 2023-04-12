import '../helper/api.dart';
import '../models/Image.dart';


class GetUserImage {
  static Future<MyImage> GetImages({required String MyToken}) async {
    Map<String, dynamic> data = await
    Api().get(url:'https://technichal.prominaagency.com/api/my-gallery',
      token: MyToken,
    );
    print(MyImage.fromJson(data).message);
    return MyImage.fromJson(data);
  }
}
