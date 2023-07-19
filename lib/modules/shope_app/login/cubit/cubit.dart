import 'package:bloc/bloc.dart';
import 'package:f_project/models/Shop_App/login_model/dataModel.dart';
import 'package:f_project/modules/shope_app/login/cubit/states.dart';
import 'package:f_project/shared/network/end_points/end_points.dart';
import 'package:f_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialStates());

  static ShopLoginCubit getHomeCubit(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isShow = true;
 late ShopLoginModel loginModel;

  void userLogin({required email,required password}){
    emit(ShopLoginLoadingState());
      DioHelper.postData(
        url: LOGIN,
        data:{
          'email': email,
          'password': password
        }
      ).then((value) {

        //name_constructor
        loginModel = ShopLoginModel.fromJson(value.data);

        print(loginModel.status);
        print(loginModel.message);
        print(loginModel.data?.name);
        emit(ShopLoginSuccessState(loginModel));
      }).catchError((onError) {
        print(onError);
        emit(ShopLoginErrorState(onError.toString()));
      });


  }

  void changeShowPasswordIcon() {
    isShow = !isShow;
    suffix = isShow ? Icons.visibility:Icons.visibility_off;
    emit(changeShowPasswordIconState());

  }


}
