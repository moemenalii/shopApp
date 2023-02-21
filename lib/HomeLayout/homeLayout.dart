import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Login_Screen/Login_Screen.dart';
import 'package:shop_app/Network/Local/Cache_helper.dart';
import 'package:shop_app/SearchScreen/SearchScreen.dart';
import 'package:shop_app/cubit/Cubit.dart';
import 'package:shop_app/cubit/States.dart';
class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit=ShopCubit.get(context);
    return BlocConsumer<ShopCubit,ShopStates>(
        builder: (context,state){return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(),));
          }, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.brightness_4_outlined)),
        ],
      ),
          bottomNavigationBar: cubit.BottomNav(),

      body: cubit.Screens[cubit.Curentindex],
    );},
        listener: (context,state){});
  }
}
