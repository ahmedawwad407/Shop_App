import 'package:f_project/layout/shope_app/home_layout.dart';
import 'package:f_project/modules/shope_app/login/cubit/cubit.dart';
import 'package:f_project/modules/shope_app/login/cubit/states.dart';
import 'package:f_project/modules/shope_app/register/Shop_register_screen.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/components/constant.dart';
import 'package:f_project/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if(state is ShopLoginSuccessState){
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

          var cubit = ShopLoginCubit.getHomeCubit(context);
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
                        Text('LOGIN',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.black)),
                        SizedBox(
                          height: 40.0,
                        ),
                        defaultTextFormField(
                            prefixIcon: Icons.email,
                            label: 'email',
                            type: TextInputType.emailAddress,
                            controller: emailController),
                        SizedBox(
                          height: 10.0,
                        ),
                        defaultTextFormField(
                          prefixIcon: Icons.lock,
                          suffixIcon: cubit.suffix,
                          label: 'password',
                          type: TextInputType.visiblePassword,
                          isObscure: cubit.isShow,
                          suffixPressed: () {
                            cubit.changeShowPasswordIcon();
                          },
                          controller: passwordController,

                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        state is! ShopLoginLoadingState
                            ? defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    navigationAndFinish(context, ShopLayout());
                                    cubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                text: 'login')
                            : Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(color: Colors.grey),
                              ),
                              defaultTextButton(
                                  function: () {
                                    navigationTo(context, ShopRegisterScreen());
                                  },
                                  text: "RegisterNow")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
