import 'package:shop_app/Login_Screen/Login_Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/Remote/dioHelper.dart';
import 'package:shop_app/Network/end_points.dart';
import 'package:shop_app/models/LoginModel.dart';
class ShopLoginCubit extends Cubit<ShopLoginStates>{
  // ShopLoginCubit(super.ShopLoginInitialStates);


  ShopLoginCubit():super(ShopLoginInitialStates());
  ShopLoginModel ? loginModel;
  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }){
    emit(ShopLoginLoadingStates());
    DioHelper.postData(url:LOGIN,
        data: {
      'email':'$email',
      'password':'$password',
    }).then((value){
      loginModel=ShopLoginModel.fromJson(value.data);
      print(loginModel?.data?.token);
      // print(loginModel?.status);
      print(loginModel?.message);
      emit(ShopLoginSuccessStates(loginModel!));
    }).catchError((Error){
      emit(ShopLoginErrorStates(Error.toString()));
      print(Error.toString());
    });
  }
  bool showpassword=true;
   void changeSufix(){
    showpassword=!showpassword;
    emit(ChangePasswordStates());
  }
}
