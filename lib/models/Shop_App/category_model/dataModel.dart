class ShopCategoriesModel {
  bool? status;
  CategoriesDataModel? data;

  ShopCategoriesModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);
  }}

class CategoriesDataModel {
dynamic current_page ;
List<CategoryModel>? data = [];

  //name_constructor
  CategoriesDataModel.fromJson(Map<String,dynamic> json){

    current_page = json['current_page'];

     json['data'].foreach((element){
       data?.add(CategoryModel.fromJson(element));
     });
   }
}

class CategoryModel{
  dynamic id;
  dynamic name;
  dynamic image;

  CategoryModel.fromJson(Map<String,dynamic> json){

    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  }


