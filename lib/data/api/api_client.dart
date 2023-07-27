import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeader;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeader = {
      'Content-type': 'Application/json; charset = UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(Uri) async {
    try {
      Response response = await get(Uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
