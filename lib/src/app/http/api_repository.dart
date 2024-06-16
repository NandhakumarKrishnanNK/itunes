import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dio_client.dart';

enum HttpRequestType {
  get,
  post,
  put,
  patch,
  delete,
  upload,
  download,
  singleFileUpload
}

class ResponseData {
  dynamic data;
  bool success;
  int? statusCode;
  String? message;
  ResponseData(
      {required this.data,
      required this.success,
      this.statusCode,
      this.message});
}

class HttpRepository {
  //Progress sample model
  static void onReceiveProgress(int received, int total) {
    if (total != -1) {
      /*setState(() {
        _progress = (received / total * 100).toStringAsFixed(0) + "%";
      });*/
    }
  }

  static Future<ResponseData> apiRequest(
      HttpRequestType requestType, String urlString,
      {dynamic requestBodydata,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers,
      File? file,
      FormData? formDatas,
      String? savePath}) async {
    ResponseData? responseData;
    debugPrint(
        'Before Request --> urlString-->$urlString \n  requestBodydata-->$requestBodydata //Completed');

    try {
      Response<dynamic>? response;
      switch (requestType) {
        case HttpRequestType.get || HttpRequestType.delete:
          response = requestType == HttpRequestType.delete
              ? await DioClient.dioConfig(header: headers)
                  .delete(urlString, queryParameters: queryParams)
              : await DioClient.dioConfig(header: headers)
                  .get(urlString, queryParameters: queryParams);
          break;

        case HttpRequestType.upload:
          response = await DioClient.dioFileConfig(header: headers)
              .post(urlString, data: formDatas);
          break;

        case HttpRequestType.singleFileUpload:
          final FormData data = FormData.fromMap(
              {'file': await MultipartFile.fromFile(file!.path)});
          response = await DioClient.dioFileConfig(header: headers)
              .post(urlString, data: data);
          break;

        case HttpRequestType.download:
          response = await DioClient.dioConfig(header: headers).download(
              urlString, savePath,
              onReceiveProgress: onReceiveProgress);
          break;

        case HttpRequestType.put:
          response = await DioClient.dioConfig(header: headers).put(
            urlString,
            data: requestBodydata,
          );
          break;

        case HttpRequestType.post:
          response = await DioClient.dioConfig(header: headers).post(urlString,
              data: requestBodydata, queryParameters: queryParams);
          break;

        case HttpRequestType.patch:
          response = await DioClient.dioConfig(header: headers).patch(urlString,
              data: requestBodydata, queryParameters: queryParams);
          break;
      }
      debugPrint('<<<--- After Request --->>> '
          ' \n URL-->$urlString'
          ' \n RequestBodyData : $requestBodydata'
          ' \n Response : ${jsonDecode(response.toString())} //Completed'
          ' \n Message : ${response?.statusMessage}');

      responseData = ResponseData(
          success: true,
          data: jsonDecode(jsonEncode(response?.data)),
          statusCode: response?.statusCode,
          message: response?.statusMessage);
    } on DioException catch (e) {
      debugPrint('<<<--- Error Status --->>>: '
          ' \n  URL : $urlString'
          ' \n  RequestBodyData : $requestBodydata'
          ' \n  Response : ${e.response}'
          ' \n  Message : ${e.response}');
      responseData = ResponseData(
          success: false,
          data: e.response?.data,
          statusCode: e.response?.statusCode,
          message: DioClient.errorHandling(e).toString());
      DioClient.dioClose();
    }
    return responseData;
  }
}
