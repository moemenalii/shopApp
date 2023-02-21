class ShopLoginModel{

 bool? status;
 String? message;
UserData? data;
 ShopLoginModel.fromJson(Map<String,dynamic> json){
   status=json['status'];
   message=json['message'];
   data=json['data']!=null ?UserData.fromJson(json['data']) :null  ;
 }
}

class UserData{
  int? id;
  int? points;
  int? credit;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  //named constructor
UserData.fromJson(Map<String,dynamic> json){
  image=json['image'];
  credit=json['credit'];
  email=json['email'];
  name=json['name'];
  phone=json['phone'];
  id=json['id'];
  points=json['points'];
  token=json['token'];
}

//   UserData({
//     this.image,
//     this.credit,
//     this.email,
//     this.id,
//     this.name,
//     this.phone,
//     this.points,
//     this.token,
//
// });
}