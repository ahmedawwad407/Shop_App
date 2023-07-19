import 'package:f_project/layout/news_app/cubit/cubit.dart';
import 'package:f_project/layout/news_app/cubit/states.dart';
import 'package:f_project/modules/News_app/Setting/SettingScreen.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = NewAppCubit.getHomeCubit(context);
        var list = NewAppCubit.getHomeCubit(context).searchFilter;

        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                  onPressed: () {
                    navigationTo(context, SettingScreen());
                  },
                  icon: Icon(Icons.settings)),
              IconButton(
                  onPressed: () {
                    cubit.changeAppMode();
                  },
                  icon: cubit.isDark
                      ? Icon(Icons.brightness_4_outlined)
                      : Icon(Icons.brightness_4)),
            ],
          ),
          body:  Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty){
                     return "Field can't be empty";
                    }
                    return null;
                  },
                    onChanged: (value){
                    cubit.getDataSearch(value);
                    },
                  decoration: InputDecoration(
                    fillColor: Colors.deepOrange,
                      labelText: 'Search',
                    labelStyle: TextStyle(
                      color: Colors.deepOrange
                    ),
                    hoverColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                  )
                  ),
              ),
              Expanded(
                  child: listView(list,isSearch: true)
              )
            ],
          ),
        );
      }
    );
  }
}
