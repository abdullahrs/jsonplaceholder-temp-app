import '../constants/request_types.dart';
import 'package:http/http.dart';

abstract class ApiServiceManager {
  final String _baseURL;

  ApiServiceManager({
    required String baseURL,
  }) : _baseURL = baseURL;

  Future<Response> createRequestAndSend({
    required String endPoint,
    Map<String, String>? bodyFields,
    String? body,
    Map<String, dynamic>? queryParams,
    required RequestType method,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Uri uri;

    if (queryParams != null) {
      uri = Uri.https(_baseURL, endPoint, queryParams);
    } else {
      uri = Uri.https(_baseURL, endPoint);
    }

    Request request = Request(method.name, uri);
    if (bodyFields != null) {
      request.bodyFields = bodyFields;
    }
    if (body != null) {
      request.body = body;
    }
    request.headers.addAll(headers);

    try {
      StreamedResponse streamedResponse = await request.send();
      Response response = await Response.fromStream(streamedResponse);
      if (response.statusCode != 200) {
        throw Exception(
            "unsuccessful request status code : ${response.statusCode}");
      }
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
