import 'package:bloc/bloc.dart';
import 'package:f_project/models/Shop_App/login_model/dataModel.dart';
import 'package:f_project/modules/shope_app/register/cubit/states.dart';
import 'package:f_project/shared/network/end_points/end_points.dart';
import 'package:f_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialStates());

  static ShopRegisterCubit getHomeCubit(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isShow = true;
 late ShopLoginModel loginModel;

  void userRegister({required name,required email,required phone,required password}){
    emit(ShopRegisterLoadingState());
      DioHelper.postData(
        url: REGISTER,
        data:{
          'name': name,
          'email': email,
          'password': password,
          'phone': phone
        }
      ).then((value) {
        //name_constructor
        loginModel = ShopLoginModel.fromJson(value.data);
        emit(ShopRegisterSuccessState(loginModel));
      }).catchError((onError) {
        print(onError);
        emit(ShopRegisterErrorState(onError.toString()));
      });


  }

  void changeShowPasswordIcon() {
    isShow = !isShow;
    suffix = isShow ? Icons.visibility:Icons.visibility_off;
    emit(changeShowPasswordIconRegisterState());

  }


}
