class ShopLoginModel {
   bool? status;
   String? message;
    UserData? data;

  ShopLoginModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    //convert Map to variables => UserData.fromJson(json['data'])
    data = (json['data'] != null ? UserData.fromJson(json['data']): null)!;

  }}

class UserData {
   String? id,name,email,phone,image,token;
   int? points,credit;

 /* UserData(
      this.id, this.name,
      this.email, this.phone,
      this.image, this.points,
      this.credit, this.token);*/

  //name_constructor
  UserData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];

  }
}
