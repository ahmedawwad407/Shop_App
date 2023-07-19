class ShopHomeModel {
  dynamic status;
  dynamic data;

   ShopHomeModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    //convert Map to variables => UserData.fromJson(json['data'])
    data = HomeDataModel.fromJson(json['data']);

  }}

class HomeDataModel {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];

  //name_constructor
   HomeDataModel.fromJson(Map<String,dynamic> json){

     json['banners'].foreach((element){
        banners.add(BannersModel.fromJson(element));
     });

     json['products'].foreach((element){
       products.add(ProductsModel.fromJson(element));
     });
   }
}

class BannersModel{
  dynamic id;
  dynamic image;
  BannersModel.fromJson(Map<String,dynamic> json){

    id = json['id'];
    image = json['image'];
  }
  }
class ProductsModel{
  dynamic id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic in_favorites;
  dynamic in_cart;
  ProductsModel.fromJson(Map<String,dynamic> json){

    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    name = json['name'];
    image = json['image'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
  }

