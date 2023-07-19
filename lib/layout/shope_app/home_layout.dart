import 'package:f_project/modules/shope_app/login/Shop_login_screen.dart';
import 'package:f_project/modules/shope_app/search/Shop_search_screen.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
    listener: (BuildContext context,ShopAppStates state) {

    },
    builder: (BuildContext context,ShopAppStates state) {
      var cubit = ShopAppCubit.getHomeCubit(context);
      return Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [
              IconButton(onPressed:(){
                navigationTo(context,ShopSearchScreen());

              }, icon: Icon(
                Icons.search
              )),
              IconButton(onPressed:(){

                cubit.changeAppMode();

              }, icon: cubit.isDark ?Icon(Icons.brightness_4_outlined):Icon(Icons.brightness_4)
              ),
            ],
          ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 20,
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            cubit.changeBottomNav(index);
          },
          items:cubit.bottomItems,
        ),
        body: cubit.screens[cubit.currentIndex],

      );
    });
  }
}
