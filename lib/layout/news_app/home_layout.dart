import 'package:f_project/layout/news_app/cubit/cubit.dart';
import 'package:f_project/layout/news_app/cubit/states.dart';
import 'package:f_project/modules/News_app/Setting/SettingScreen.dart';
import 'package:f_project/modules/News_app/search_screen/search_screen.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewAppCubit, NewsAppStates>(
    listener: (BuildContext context,NewsAppStates state) {

    },
    builder: (BuildContext context,NewsAppStates state) {
      var cubit = NewAppCubit.getHomeCubit(context);
      return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed:(){
                navigationTo(context,SearchScreen());

              }, icon: Icon(
                Icons.search
              )),
              IconButton(onPressed:(){
                navigationTo(context,SettingScreen());
              }, icon: Icon(
                  Icons.settings
              )),
              IconButton(onPressed:(){

                cubit.changeAppMode();

              }, icon: cubit.isDark ?Icon(Icons.brightness_4_outlined):Icon(Icons.brightness_4)
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(

            child: Icon(
              Icons.add
            ),
              onPressed: () {

              }),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 25,
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
