import 'package:f_project/layout/shope_app/cubit/cubit.dart';
import 'package:f_project/layout/shope_app/cubit/states.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopFavoritesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (BuildContext context, ShopAppStates state) {},
        builder: (BuildContext context, ShopAppStates state) {
          var cubit = ShopAppCubit.getHomeCubit(context);

          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>
                  buildItemCategory(context)  ,
              separatorBuilder: (context,index)=> myDivider(),
              itemCount: 20);
        });
  }




  // Widget buildItemCategory(context,CategoryModel model) =>
  Widget buildItemCategory(context) =>
      Padding(
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
            Icon(
                Icons.arrow_forward_ios
            )
          ],
        ),
      );

}
