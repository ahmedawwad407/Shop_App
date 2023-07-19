import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      //https://newsapi.org/
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Length':'<calculated when request is sent>',
        //   'Host':'<calculated when request is sent>',
        //   'User-Agent':'PostmanRuntime/7.26.8',
        //   'Accept':'*/*',
        //   'Accept-Encoding':'gzip,deflate,br',
        //   'Connection':'keep-alive',
        //   'Content-Type':'application/json',
        // }
    )
    );
  }

 static Future<Response> getData(
      {required String url,
        Map<String, dynamic>? query,
        String lang ='en',
        String? token}
     ) async{

    //clear headers and put new headers
   dio!.options.headers = {
     'Content-Type':'application/json',
      'lang':'$lang',
      'Authorization':'$token',
       };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
        required Map<String, dynamic> data,
        Map<String, dynamic>? query,
        String lang ='en',
        String? token}
      ) async{

    dio!.options.headers = {
      'Content-Type':'application/json',
      'lang':'$lang',
      'Authorization':'$token',
    };
    return await dio!.post(url,queryParameters: query,data: data);
  }


  static Future<Response> putData(
      {required String url,
        required Map<String, dynamic> data,
        Map<String, dynamic>? query,
        String lang ='en',
        String? token}
      ) async{

    dio!.options.headers = {
      'Content-Type':'application/json',
      'lang':'$lang',
      'Authorization':'$token',
    };
    return await dio!.put(url,queryParameters: query,data: data);
  }

}
