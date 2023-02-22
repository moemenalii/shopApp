import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        builder: (context ,state)=>Scaffold(
          body: ListView.separated(
              itemBuilder:(context,state)=>Row(children: [

          ],) ,
              separatorBuilder:(context,state)=>Container(height: 1,width: double.infinity,) ,
              itemCount: 20),
        ),
        listener: (context ,state){});
  }
}
