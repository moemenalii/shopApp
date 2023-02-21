import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/Login_Screen/Login_Screen.dart';
import 'package:shop_app/Network/Local/Cache_helper.dart';
import 'package:shop_app/Style/Colors.dart';
///////////////////////////////defultTextForm//////////////////////////
Widget defultTextForm(
{
   validate ,
   onChanged,
   onTab,
   sufixIcon,
  hintText,
  sufixPressed,
  required TextEditingController controller,
  required String label,
  required Icon prefixIcon,
  required var keyboardType,
 bool ispassword=false,
}
    )=>TextFormField(

  controller:controller,
  validator: validate,
  onTap:onTab ,
  onChanged: onChanged,
  keyboardType:keyboardType ,
  obscureText:ispassword ,
  decoration: InputDecoration(
    suffixIcon: sufixIcon,
    prefixIcon: prefixIcon,
    label: Text(label),
    labelStyle:const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400),
    hintText: hintText,
    hintStyle: TextStyle(backgroundColor: Colors.white10),
    border: OutlineInputBorder(),

  ),
);
//////////////////////////////////defultButton/////////////////////////////////////////////
Widget defultButton({
  required label,
  required onPressed,
})=> Container(
    color: defultcolor,
    height: 50,
    width: double.infinity,
    child:
    TextButton(onPressed: onPressed,
      child: Text(label,style: TextStyle(color:Colors.white,fontSize: 20),),));
//////////////////////////////////ToastFLutter//////////////////////////////////////
void toast({
  required Color color,
  required String text,
})=>   Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0
);
/////////////////////////////////////SIGNOUT////////////////////////
void signOut(context)=> CacheHelper.removeData(Key: 'token').then((value){
if(value){
Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
}
});
/////////
//     bottomNavigationBar: BottomNavigationBar(
//   backgroundColor:Colors.brown,
//     unselectedItemColor:Colors.grey,
//     selectedItemColor:Colors.brown,
//   items: [
//   BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
//   BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
//   BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
//   BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
// ],
//   currentIndex: cubit.Curentindex,
//   onTap: (index){
//     cubit.changeScreen(index);
//   },),