import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:itunes/src/app/http/logging.dart';

class DioClient extends DioMixin implements Dio {
  static Dio dioConfig({Map<String, dynamic>? header}) {
    final Dio dio = Dio(
      BaseOptions(
        // baseUrl: HttpUrls.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        followRedirects: true,
        headers: header,
        contentType: 'application/json',
      ),
    )..interceptors.add(LogInterceptor(responseBody: true));

    // dio.httpClientAdapter = IOHttpClientAdapter(
    //     createHttpClient: () {
    //       final SecurityContext context = SecurityContext();
    //       HttpClient client = HttpClient(context: context);

    //       client.badCertificateCallback =
    //           (X509Certificate cert, String host, int port) => false;
    //       context.setTrustedCertificatesBytes(base64Decode(Env.sslCertKey));
    //       return client;
    //     },
    //     // validateCertificate: (cert, host, port) {
    //     //   // Check that the cert fingerprint matches the one we expect
    //     //   // We definitely require _some_ certificate
    //     //   if (cert == null) return false;
    //     //   // Validate it any way you want. Here we only check that
    //     //   // the fingerprint matches the OpenSSL SHA256.
    //     //   final f = sha256.convert(cert.der).toString();
    //     //   print(f);
    //     //   return fingerprint == f;
    //     // },
    //   );

    return dio;
  }

  static dynamic dioFileConfig({Map<String, dynamic>? header}) {
    final Dio dio = Dio(
      BaseOptions(
        // baseUrl: HttpUrls.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        //60s
        receiveTimeout: const Duration(seconds: 60),
        //60s
        followRedirects: true,
        headers: header,
        contentType: 'multipart/form-data',
      ),
    )..interceptors.add(Logging());

    return dio;
  }

  static dynamic dioClose() {
    final Dio dio = Dio();
    dio.close(force: true);
  }

  static dynamic errorHandling(DioException e) {
    /// When the server response, but with a incorrect status, such as 404, 503
    if (e.type == DioExceptionType.badResponse) {
      return DioExceptionType.badResponse;
    }
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Please check your internet connection';
    }
    if (e.type == DioExceptionType.receiveTimeout) {
      return 'Unable to connect to the server';
    }
    if (e.type == DioExceptionType.badCertificate) {
      return 'Unauthorized access';
    }
    if (e.type == DioExceptionType.unknown) {
      return 'Something went wrong';
    }

    /// When the request is cancelled, dio will throw a error with this type.
    if (e.type == DioExceptionType.cancel) {
      return 'Something went wrong';
    }
  }

  @override
  Future<Response> download(String urlPath, savePath,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      Object? data,
      Options? options}) {
    // TODO: implement download
    throw UnimplementedError();
  }
}
