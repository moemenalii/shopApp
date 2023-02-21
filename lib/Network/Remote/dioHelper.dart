import 'package:dio/dio.dart';
class DioHelper{
  static Dio? dio ;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl:'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData(
      {
        required String url ,
        Map<String,dynamic> ? query,
        String lang ='ar',
        token,
      })async{
    dio?.options.headers={
      'lang':lang,
      'Content-Type':'application/json',
      'authorization':token??'',
    };
    return await dio!.get(
        url,
        queryParameters: query);

  }
  static Future<Response> postData(
      {
        required String url ,
        required Map<String,dynamic> data,
        String lang ='ar',
         token,
      })async{
    dio?.options.headers={
      'lang':lang,
      'Content-Type':'application/json',
      'authorization':token??'',
    };
    return await dio!.post(
        url,data:data
    );

  }
}
//*****************************************************************

// POST
// UPDATE
// DELETE
//
// GET
//
// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca
//*****************************************************************
