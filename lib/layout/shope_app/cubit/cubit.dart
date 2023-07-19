import 'package:bloc/bloc.dart';
import 'package:f_project/layout/shope_app/cubit/states.dart';
import 'package:f_project/models/Shop_App/category_model/dataModel.dart';
import 'package:f_project/models/Shop_App/home_model/dataModel.dart';
import 'package:f_project/models/Shop_App/login_model/dataModel.dart';
import 'package:f_project/modules/shope_app/categories/Shop_categories_screen.dart';
import 'package:f_project/modules/shope_app/favorites/Shop_favorites_screen.dart';
import 'package:f_project/modules/shope_app/products/Shop_products_screen.dart';
import 'package:f_project/modules/shope_app/setting/Shop_setting_screen.dart';
import 'package:f_project/shared/components/constant.dart';
import 'package:f_project/shared/network/end_points/end_points.dart';
import 'package:f_project/shared/network/local/cache_helper.dart';
import 'package:f_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit() : super(ShopAppInitialStates());

  static ShopAppCubit getHomeCubit(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isShowBottomSheet = true;
  var icon = Icons.edit;
  var isDark = true;

  ShopHomeModel? homeModel;
  ShopCategoriesModel? categoryModel;
  ShopLoginModel? profileModel;

  List<Widget> screens = [
    ShopProductsScreen(),
    ShopCategoriesScreen(),
    ShopFavoritesScreen(),
    ShopSettingScreen(),

  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Categories'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;

  /*  if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }*/
    emit(ShopAppChangeBottomNavBarState());
  }

  void getHomeData() {
    emit(ShopGetHomeDataLoadingState());
      DioHelper.getData(
        url: HOME,
        token: token
      ).then((value) {
        homeModel = ShopHomeModel.fromJson(value.data);
        print(homeModel?.status);
        print(homeModel?.data?.banners.toString());
        emit(ShopGetHomeDataSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(ShopGetHomeDataErrorState(onError.toString()));
      });

  }


  void getCategoriesData() {
    emit(ShopGetCategoriesDataLoadingState());
    DioHelper.getData(
        url: CATEGORIES,
        token: token,
        lang: 'en'
    ).then((value) {
      categoryModel = ShopCategoriesModel.fromJson(value.data);

      emit(ShopGetCategoriesDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopGetCategoriesDataErrorState(onError.toString()));
    });

  }


  void getProfileData() {
    emit(ShopGetProfileDataLoadingState());
    DioHelper.getData(
        url: PROFILE,
        token: token,
    ).then((value) {
      profileModel = ShopLoginModel.fromJson(value.data);
      print(profileModel!.data!.name);
      emit(ShopGetProfileDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopGetProfileDataErrorState(onError.toString()));
    });

  }


  void updateProfileData({required name,required email,required phone}) {
    emit(ShopUpadateProfileDataLoadingState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone}
    ).then((value) {
      profileModel = ShopLoginModel.fromJson(value.data);
      print(profileModel!.data!.name);
      emit(ShopUpadateProfileDataSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopUpadateProfileDataErrorState(onError.toString()));
    });

  }


  void changeAppMode({bool? fromSahred}) {
    if (fromSahred != null) {
      isDark = fromSahred;
      emit(changeAppModeState());
    }else{
      isDark = !isDark;
      emit(changeAppModeState());
      CachHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(changeAppModeState());
      });
    }

  }
}
