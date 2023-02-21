import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/HomeLayout/homeLayout.dart';
import 'package:shop_app/Login_Screen/Login_Cubit/cubit.dart';
import 'package:shop_app/Login_Screen/Login_Screen.dart';
import 'package:shop_app/Network/Local/Cache_helper.dart';
import 'package:shop_app/Network/Remote/dioHelper.dart';
import 'package:shop_app/cubit/Cubit.dart';
import 'ON Boarding/onBoardingScreen.dart';
import 'Style/Colors.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();// when fun main is async..
  DioHelper.init();
  await CacheHelper.init();
  // bool isdark=CacheHelper.GetData(Key: "isdark")??false;
  Widget? widget;
  bool  onboarding=CacheHelper.GetData(Key: 'boarding')??false;
  String ?token=CacheHelper.GetData(Key: 'token');
  if(onboarding ==true ){
    if(token != null ){
      widget=ShopLayout();
    }
    else{
      widget=LoginScreen();
    }
  }else{
    widget=onBoardingScreen();
  }

  runApp( MyApp(widget,onboarding,));
}
class MyApp extends StatelessWidget {
  final Widget widget;
  final bool onboarding;
  MyApp(this.widget,this.onboarding);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context)=>ShopLoginCubit()),
        BlocProvider(create: (context)=>ShopCubit()..getHomeData()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme:AppBarTheme(color: defultcolor),
          floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: defultcolor,),
        primarySwatch: Colors.brown,
        ),
        home:widget,
      ),
    );
  }
}
