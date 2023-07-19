import 'package:f_project/layout/news_app/cubit/cubit.dart';
import 'package:f_project/modules/News_app/search_screen/search_screen.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text(
          'Setting Screen',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
    );
  }
}
