import 'package:bloc/bloc.dart';
import 'package:f_project/layout/news_app/cubit/states.dart';
import 'package:f_project/modules/News_app/business/BusinessScreen.dart';
import 'package:f_project/modules/News_app/science/ScienceScreen.dart';
import 'package:f_project/modules/News_app/sports/SportsScreen.dart';
import 'package:f_project/shared/network/local/cache_helper.dart';
import 'package:f_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewAppCubit extends Cubit<NewsAppStates> {
  NewAppCubit() : super(AppInitialStates());

  static NewAppCubit getHomeCubit(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isShowBottomSheet = true;
  var icon = Icons.edit;
  var isDark = false;

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> searchFilter = [];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: 'Sport'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;

    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(AppChangeBottomNavBarState());
  }

  void changeBottomSheet(bool isShow, IconData fabIcon) {
    isShowBottomSheet = isShow;
    icon = fabIcon;
    emit(AppChangeBottomSheetState());
  }

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': '78244035e9af482e9f6582f04a382d5b',
        },
      ).then((value) {
        business = value.data['articles'];
        // print(value.data['articles'][0]['source']['id'].toString());
        print(business);
        emit(NewsGetBusinessSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetBusinessErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  void getSports() {
    emit(NewsGetSportLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '78244035e9af482e9f6582f04a382d5b',
        },
      ).then((value) {
        sports = value.data['articles'];
        // print(value.data['articles'][0]['source']['id'].toString());
        print(sports);
        emit(NewsGetSportSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSportErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '78244035e9af482e9f6582f04a382d5b',
        },
      ).then((value) {
        science = value.data['articles'];
        // print(value.data['articles'][0]['source']['id'].toString());
        print(science);
        emit(NewsGetScienceSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetScienceErrorState(onError.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getDataSearch(String value) {
    emit(NewsGetDataSearchLoadingState());
    searchFilter = [];
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': '78244035e9af482e9f6582f04a382d5b',
        },
      ).then((value) {
        searchFilter = value.data['articles'];
        // print(value.data['articles'][0]['source']['id'].toString());
        print(searchFilter);
        emit(NewsGetDataSearchSuccessState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetDataSearchErrorState(onError.toString()));
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
