import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;

  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
 //get all data
  static dynamic  GetData ({
    required String Key,
  }){
    return sharedPreferences!.get(Key);

  }
  //save all data
  static Future<bool> saveData ({
    required String Key,
    required dynamic value,
  })async{
    if(value is String) return await  sharedPreferences!.setString(Key, value);
    if(value is bool) return await  sharedPreferences!.setBool(Key, value);
    if(value is int) return await  sharedPreferences!.setInt(Key, value);
    return await  sharedPreferences!.setDouble(Key, value);
  }
  static Future<bool>  removeData ({
    required String Key,
  })async{
    return await sharedPreferences!.remove(Key);

  }
}
// static Future<bool> PutData ({
//   required String Key,
//   required dynamic value,
// })async{
//   return await  sharedPreferences!.setBool(Key, value);
// }