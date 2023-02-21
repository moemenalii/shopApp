import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/cubit/Cubit.dart';
import '../cubit/States.dart';
class SettingScreen extends StatelessWidget {
  var nameController =TextEditingController();
  var EmailController =TextEditingController();
  var PhoneController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state){} ,
      builder: (context,state)=>Column(children: [
        defultTextForm(controller:nameController, label: 'Name', prefixIcon: Icon(Icons.person), keyboardType: TextInputType.text),
        SizedBox(height: 10,),
        defultTextForm(controller:EmailController, label: 'E_mail Address', prefixIcon: Icon(Icons.mail_outline_outlined), keyboardType: TextInputType.emailAddress),
        SizedBox(height: 10,),
        defultTextForm(controller:PhoneController, label: 'Phone', prefixIcon: Icon(Icons.phone), keyboardType: TextInputType.phone),
        SizedBox(height: 10,),

      ],),
    );
  }
}
