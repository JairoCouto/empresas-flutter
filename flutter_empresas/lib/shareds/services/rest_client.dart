import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_empresas/shareds/services/env.dart';
import 'package:flutter_empresas/shareds/session/user_storage.dart';
import 'package:http/http.dart' as http;

typedef S ClientRequest<S>();

class RestClient {
  late String _baseUrl;
  final _dioClient = Dio();

  RestClient(String baseUrl) {
    _baseUrl = baseUrl;
    _dioClient.interceptors.add(BasicInterceptor());
    _dioClient.interceptors.add(TokenInterceptor());
    _dioClient.options.baseUrl = Env.baseUrl;
    _dioClient.options.connectTimeout = 30;
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _dioClient.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response>? dioGet(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) {
    _dioClient.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }

  Future put(
    Uri url, {
    Map<String, String>? headers,
    dynamic body,
    Encoding? encoding,
  }) {
    return http.put(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  Future<dynamic> get(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? body,
  }) async {
    String finalUri = _baseUrl + url;

    return await fetch(
      () => http.get(
        Uri.parse(finalUri),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'access-token' : UserStorage.instance.token.toString(),
          'client' : UserStorage.instance.client.toString(),
          'uid' : UserStorage.instance.uid.toString()
        },
      ).timeout(Duration(seconds: 30)),
    );
  }

  Future<dynamic> getWithoutToken(String url,
      {Map<String, String>? headers}) async {
    final response = await http.get(Uri.parse(url), headers: headers);
    return response.body;
  }

  Future<dynamic> postWithoutToken(
    String url, {
    Map<String, String>? headers,
    dynamic body,
    Encoding? encoding,
  }) async {
    try {
      String finalUrl = _baseUrl + url;

      final response = await http.post(
        Uri.parse(finalUrl),
        headers: headers,
        body: body,
        encoding: encoding,
      ).timeout(Duration(seconds: 30));

    return response;
    } on TimeoutException catch (e) {
      log(e.toString());
      throw Exception('Ocorreu um erro ao se conectar com o servidor, tente mais tarde!');
    }
  }

  Future<dynamic> upload(String uploadUrl, {FormData? data}) async {
    _dioClient.post(
      uploadUrl,
      data: data,
      onSendProgress: (progress, total) {},
      options: Options(
        contentType: "multipart/form-data",
      ),
    );
  }

  Future<dynamic> fetch(ClientRequest request) async {
    try {

      dynamic response = await request();
    
      if (response.statusCode == 401) {
        response = await request();
      }

      return response;
    

    } on DioError catch (error) {
      return error;

    } catch (error) {
      return error;
    
    }
  }
}

class BasicInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler requesthandler,
  ) async {
    if (!Env.debug) {
      log("Realizando uma requisição");
    }

    return super.onRequest(options, requesthandler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler responsetHandler,
  ) async {
    if (!Env.debug) {
      log("Recebendo uma Resposta $response");
    }
    return super.onResponse(response, responsetHandler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handlerError) async {
    if (!Env.debug) {
      log("Error na requisição");
    }
    return super.onError(err, handlerError);
  }
}

class TokenInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler requestInterceptorHandler,
  ) async {
    final token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY0NzA0NDY1MSwiZXhwIjozNTM5MjA0NjUxLCJuYmYiOjE2NDcwNDQ2NTEsImp0aSI6Im9YeUhtTG40VTN2V2JhOW8iLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.Ms2EycE06Nkmg7fUtlN-1S9apraOifYq2q9z3Mz18qA";

    options.headers['Authorization'] = "Bearer $token";

    return super.onRequest(options, requestInterceptorHandler);
  }
}
