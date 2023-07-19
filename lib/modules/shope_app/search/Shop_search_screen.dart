import 'package:f_project/modules/shope_app/search/cubit/cubit.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class ShopSearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopSearchCubit(),
      child: BlocConsumer<ShopSearchCubit, ShopSearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ShopSearchCubit.getHomeCubit(context);

            return Scaffold(
              appBar: AppBar(
                title: Text('salla'),
              ),
              body: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                          style: TextStyle(
                            color: defaultColor,
                          ),
                          controller: searchController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Text to Search";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            cubit.getDataSearch(value);
                          },
                          decoration: InputDecoration(
                            fillColor: defaultColor,
                            labelText: 'Search',
                            labelStyle: TextStyle(color: defaultColor),
                            hoverColor: Colors.green,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (state is ShopGetDataSearchLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is ShopGetDataSearchSuccessState)

                      /*ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>
                            buildItemSearch(context,cubit.searchModel.data.data[index])  ,
                            buildItemSearch(context)  ,
                        separatorBuilder: (context,index)=> myDivider(),
                        itemCount: 20) ,
                        itemCount: cubit.searchModel!.data!.data.length) ,*/
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                buildItemSearch(context),
                            separatorBuilder: (context, index) => myDivider(),
                            itemCount: 20),
                      ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  // Widget buildItemCategory(context,ProductsModel model) =>
  Widget buildItemSearch(context) => Padding(
        padding: EdgeInsetsDirectional.all(15),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    //image: NetworkImage(model.image),
                    image: AssetImage('assets/images/phone.png'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              //model.name,
              'title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6,
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      );
}
