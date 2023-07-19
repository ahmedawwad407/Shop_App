

import 'package:bloc/bloc.dart';
import 'package:f_project/models/Shop_App/search_model/dataModel.dart';
import 'package:f_project/modules/shope_app/search/cubit/states.dart';
import 'package:f_project/shared/components/constant.dart';
import 'package:f_project/shared/network/end_points/end_points.dart';
import 'package:f_project/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopSearchCubit extends Cubit<ShopSearchStates> {
  ShopSearchCubit() : super(ShopSearchInitialStates());

  static ShopSearchCubit getHomeCubit(context) => BlocProvider.of(context);

  ShopSearchModel? searchModel;

  void getDataSearch(String text) {
    emit(ShopGetDataSearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token:token,
      data: {
        'text':text
      }
    ).then((value) {
      searchModel = ShopSearchModel.fromJson(value.data);
      emit(ShopGetDataSearchSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopGetDataSearchErrorState(onError.toString()));
    });
  }


}