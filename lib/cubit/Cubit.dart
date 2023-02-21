import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/Remote/dioHelper.dart';
import 'package:shop_app/Network/constant.dart';
import 'package:shop_app/Network/end_points.dart';
import 'package:shop_app/cubit/States.dart';
import 'package:shop_app/models/HomeModel.dart';
import '../CategoriesScreen/CategoriesScreen.dart';
import '../FavouriteScreen/FavouriteScreen.dart';
import '../ProductsScreen/ProductsScreen.dart';
import '../SettingsScreen/SettingsScreen.dart';
class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopIntialStates());
  static ShopCubit get(context) =>BlocProvider.of(context);
  int Curentindex=0;
  List<Widget>Screens=[
    ProductScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    SettingScreen(),
  ];
void changeScreen(int index){
  Curentindex=index;
  emit(ChangeBottomNav());
}
dynamic BottomNav()=>CurvedNavigationBar(
  backgroundColor: Colors.white,
  color: Colors.brown,
  animationCurve: Curves.easeIn,
  animationDuration: Duration(milliseconds: 200),
  items: const[
    CurvedNavigationBarItem(
      child: Icon(Icons.home_outlined,),
      label: 'Home',
    ),
    CurvedNavigationBarItem(
      child: Icon(Icons.apps),
      label: 'Categories',
    ),
    CurvedNavigationBarItem(
      child: Icon(Icons.favorite),
      label: 'Favorite',
    ),
    CurvedNavigationBarItem(
      child: Icon(Icons.settings),
      label: 'Settings',
    ),
  ],
  index: Curentindex,
  onTap: (index){
   changeScreen(index);
  },
);
  HomeModel ?homeModel;
void getHomeData(){
  emit(ShopLoadingHomeState());
  DioHelper.getData(
    url: HOME,
    token: token,
  ).then((value) {
    print(homeModel!.data!.banners![0].image);
    print(homeModel!.status);
    print('{$value}');
    homeModel=HomeModel.fromJson(value.data);
    emit(ShopSuccessHomeState());
  }).catchError((error){
    print(error.toString());
    emit(ShopErrorHomeState());
  });
}

}