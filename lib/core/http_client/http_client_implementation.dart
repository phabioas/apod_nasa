import 'package:apod_nasa/core/http_client/http_client.dart';
import 'package:http/http.dart' as http;

class HttpClientImplementation implements HttpClient {
  final _client = http.Client();

  @override
  Future<HttpResponse> get(String url) async {
    final response = await _client.get(Uri.parse(url));
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url, {required Map<String, dynamic> map}) {
    throw UnimplementedError();
  }
}
