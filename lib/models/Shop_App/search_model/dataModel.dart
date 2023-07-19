class ShopSearchModel {
  bool? status;
  Null message;
  SearchDataModel? data;

  ShopSearchModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    data = SearchDataModel.fromJson(json['data']);
  }}

class SearchDataModel {
dynamic current_page ;
List<ProductsModel> data = [];
dynamic firstPageUrl ;
dynamic from ;
dynamic lastPage ;
dynamic lastPageUrl ;
dynamic nextPageUrl ;
dynamic path ;
dynamic perPage ;
dynamic prevPageUrl ;
dynamic to ;
dynamic total ;


  //name_constructor
  SearchDataModel.fromJson(Map<String,dynamic> json){
    current_page = json['current_page'];
    if(json['data'] != null){

      json['data'].foreach((element){
        data.add(ProductsModel.fromJson(element));
      });

    }

    firstPageUrl = json['first_page_url'];
    firstPageUrl = json['from'];
    firstPageUrl = json['last_page'];
    firstPageUrl = json['last_page_url'];
    firstPageUrl = json['next_page_url'];
    firstPageUrl = json['path'];
    firstPageUrl = json['per_page'];
    firstPageUrl = json['prev_page_url'];
    firstPageUrl = json['to'];
    firstPageUrl = json['total'];

  }
}

class ProductsModel{
  dynamic id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic desc;



  ProductsModel(
      {this.id,
      this.price,
      this.old_price,
      this.discount,
      this.image,
      this.name,
      this.desc,
      });

  ProductsModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    name = json['name'];
    image = json['image'];
    desc = json['description'];
    }

  Map<String,dynamic> toJson(){
    final  Map<String,dynamic> data = new Map<String,dynamic>();

     data['id'] = this.id;
     data['price'] = this.price;
     data['old_price'] = this.old_price;
     data['discount'] = this.discount;
     data['image'] = this.image;
     data['name'] = this.name;
     data['description'] = this.desc;

    return data;
  }
  }


