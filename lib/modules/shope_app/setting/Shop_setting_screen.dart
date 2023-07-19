import 'package:conditional_builder/conditional_builder.dart';
import 'package:f_project/layout/shope_app/cubit/cubit.dart';
import 'package:f_project/layout/shope_app/cubit/states.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/components/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var formKey = GlobalKey<FormState>();

    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.getHomeCubit(context);

        // nameController.text = cubit.profileModel!.data!.name!;
        // emailController.text = cubit.profileModel!.data!.email!;
        // phoneController.text = cubit.profileModel!.data!.phone!;

        return ConditionalBuilder(
          // condition: cubit.profileModel != null,
          condition: true,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    if(state is ShopUpadateProfileDataLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('PROFILE',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.black)),
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
                      height: 20.0,
                    ),
                    defaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            cubit.updateProfileData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                        text: 'UPDATE'),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                        function: () {
                          signOut(context);
                        },
                        text: 'LOGOUT')
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
