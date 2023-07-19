import 'package:bloc/bloc.dart';
import 'package:f_project/layout/news_app/cubit/cubit.dart';
import 'package:f_project/layout/news_app/cubit/states.dart';
import 'package:f_project/layout/shope_app/cubit/cubit.dart';
import 'package:f_project/layout/shope_app/cubit/states.dart';
import 'package:f_project/modules/shope_app/login/Shop_login_screen.dart';
import 'package:f_project/shared/bloc_observer.dart';
import 'package:f_project/shared/components/constant.dart';
import 'package:f_project/shared/network/local/cache_helper.dart';
import 'package:f_project/shared/network/remote/dio_helper.dart';
import 'package:f_project/shared/styles/Themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_app/home_layout.dart';
import 'layout/shope_app/home_layout.dart';
import 'modules/shope_app/on_boarding/Shop_onboarding_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  //SharedPreferences
 await CachHelper.init();

 CachHelper.saveData(key: 'token', value: 'b676yF4HQTAGtP9bYNM2kjAw3VZ6vd63Ar7dr7jQvhISokVKIK5K3Emr4tiPctOBgBlZhV');

    //SharedPreferences
  var isDark = CachHelper.getData(key: 'isDark');
  var onBoarding = CachHelper.getData(key: 'OnBoarding');
   token = CachHelper.getData(key: 'token');

  Widget widget;

    if(onBoarding != null){
      if(token != null) widget = ShopLayout();
      else  widget = ShopLoginScreen();
    }else{
      widget = ShopOnBoardingScreen();
  }

  runApp(MyApp(isDark: isDark,startWidget: widget));


  // MyApp m = MyApp();
  // Widget w = MyApp();
}

class MyApp extends StatelessWidget {
   var  isDark;
   Widget  startWidget;
   MyApp({this.isDark, required this.startWidget});



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopAppCubit()..getHomeData()..getCategoriesData()..getProfileData()..changeAppMode(fromSahred: isDark)),
        BlocProvider(create: (context) => NewAppCubit()..getBusiness()..changeAppMode(fromSahred: isDark)),
      //  BlocProvider(create: (context) => NewAppCubit()..getBusiness()..getSports()..getScience()),
   /*     BlocProvider(create: (context) => NewAppCubit()..getBusiness()),
        BlocProvider(create: (context) => NewAppCubit()..getSports()),
        BlocProvider(create: (context) => NewAppCubit()..getScience()),*/
      ],
      child: BlocConsumer<ShopAppCubit,ShopAppStates>(
        listener: (context, states) {},
        builder: (context, states) {

          // var isDark = NewAppCubit.getHomeCubit(context).isDark;
          var isDark = ShopAppCubit.getHomeCubit(context).isDark;

          return MaterialApp(
            //disable banner
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:  isDark ? ThemeMode.dark :  ThemeMode.light,
            home: Directionality(
                textDirection: TextDirection.ltr,
                child:startWidget),
          );
        },
      ),
    );
  }
}
