import 'package:f_project/layout/news_app/cubit/cubit.dart';
import 'package:f_project/layout/news_app/cubit/states.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewAppCubit, NewsAppStates>(
        listener: (BuildContext context, NewsAppStates state) {},
        builder: (BuildContext context, NewsAppStates state) {
          var list = NewAppCubit.getHomeCubit(context).sports;
          return listView(list);
        });
  }}
