import 'package:agent/config/flavor.config.dart';
import 'package:agent/features/authentication/repository/authentication.repository.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  static final String url = FlavorConfig.instance.values.baseUrl;

  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    // responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
    followRedirects: false,
    validateStatus: (status) {
      return status < 500;
    },
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options) => requestInterceptor(options),
            onError: (DioError e) async {
              return e.response.data;
            }),
      );
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    AuthenticationRepository authentication = AuthenticationRepository();
    String token = await authentication.getToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});
    options.contentType = Headers.jsonContentType;
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<dynamic> getHTTP(String _url) async {
    try {
      Response response = await baseAPI.get(_url);

      if (response.statusCode == 200 && response.data != null) {
        print(response.data);
        return response;
      }
      return 'Response failure from server';
    } on DioError catch (e) {
      if (e.message.isNotEmpty) {
        return '${e.message}';
      }
      return 'Response failure from server';
    }
  }

  Future<Response> postHTTP(String _url, dynamic _data) async {
    try {
      Response response = await baseAPI.post(_url, data: _data);
      return response;
    } on DioError catch (_) {
      return null;
    }
  }

  Future<Response> putHTTP(String _url, dynamic data) async {
    try {
      Response response = await baseAPI.put(_url, data: data);
      return response;
    } on DioError catch (_) {
      return null;
    }
  }

  Future<Response> deleteHTTP(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } on DioError catch (_) {
      return null;
    }
  }
}

class KeyValue {
  final String key;
  final String value;
  KeyValue(this.key, this.value);
}
