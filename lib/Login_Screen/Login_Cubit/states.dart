import 'package:shop_app/models/LoginModel.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialStates extends ShopLoginStates{}

class ShopLoginSuccessStates extends ShopLoginStates{
  final ShopLoginModel loginModel;

  ShopLoginSuccessStates(this.loginModel);
}

class ShopLoginLoadingStates extends ShopLoginStates{}

class ChangePasswordStates extends ShopLoginStates{}

class ShopLoginErrorStates extends ShopLoginStates{
  final String Error;

  ShopLoginErrorStates(this.Error);
}