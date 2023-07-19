import 'package:conditional_builder/conditional_builder.dart';
import 'package:f_project/layout/shope_app/home_layout.dart';
import 'package:f_project/modules/bmi_app/bmi/bmiCalculater.dart';
import 'package:f_project/modules/shope_app/login/Shop_login_screen.dart';
import 'package:f_project/modules/shope_app/register/cubit/states.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/components/constant.dart';
import 'package:f_project/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

class ShopRegisterScreen extends StatelessWidget {


  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
          listener: (context, state) {
            if(state is ShopRegisterSuccessState){
              if(state.loginModel.status != null){
                print(state.loginModel.message);
                CachHelper.saveData(key: 'token', value: state.loginModel.data!.token).then((value){
                  token =state.loginModel.data!.token!;
                  navigationAndFinish(context, ShopLayout());
                });
                //toast
              }else{
                //toast
                print(state.loginModel.message);
              }
            }
          },
          builder: (context, state) {
            var cubit = ShopRegisterCubit.getHomeCubit(context);

            return Scaffold(
              appBar: AppBar(
                title: Text('Salla'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,// not apply -> solution center widget
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Register',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline3
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          defaultTextFormField(
                              prefixIcon: Icons.person,
                              label: 'User Name',
                              type: TextInputType.text,
                              controller: nameController),
                          SizedBox(
                            height: 10.0,
                          ),
                          defaultTextFormField(
                              prefixIcon: Icons.email,
                              label: 'Email',
                              type: TextInputType.emailAddress,

                              controller: emailController),
                          SizedBox(
                            height: 10.0,
                          ),
                          defaultTextFormField(
                              prefixIcon: Icons.phone,
                              label: 'Phone',
                              type: TextInputType.phone,
                              controller: phoneController),
                          SizedBox(
                            height: 10.0,
                          ),
                          defaultTextFormField(
                            prefixIcon: Icons.lock,
                            suffixIcon: isShow ? Icons.visibility : Icons
                                .visibility_off,
                            label: 'password',
                            type: TextInputType.visiblePassword,
                            isObscure: isShow,
                            suffixPressed: () {
                                cubit.changeShowPasswordIcon();
                            },
                            controller: passwordController,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),

                               ConditionalBuilder(
                                 condition: state is! ShopRegisterLoadingState,
                                 builder:(context) => defaultButton(
                                     function: () {
                                       if (formKey.currentState!.validate()) {
                                        // navigationTo(context, ShopLoginScreen());
                                         cubit.userRegister(
                                             name: nameController.text,
                                             email: emailController.text,
                                             phone: phoneController.text,
                                             password: passwordController.text);
                                       }},
                                     text: 'REGISTER'),
                                 fallback: (context) => Center(child: CircularProgressIndicator()),
                               )
                            ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      ),);
  }
}
