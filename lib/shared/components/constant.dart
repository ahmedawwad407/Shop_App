// List<Map> record= [];

//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=49eb501f30aa4a279ece145de1a12542
//https://newsapi.org/v2/everything?q=tesla&apiKey=49eb501f30aa4a279ece145de1a12542
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=49eb501f30aa4a279ece145de1a12542

import 'package:f_project/modules/shope_app/login/Shop_login_screen.dart';
import 'package:f_project/shared/network/local/cache_helper.dart';

import 'components.dart';

void signOut(context){
  CachHelper.removeData(key: 'token').then((value){
    if(value) {
      navigationAndFinish(context, ShopLoginScreen());
    }});
}


var token = '';