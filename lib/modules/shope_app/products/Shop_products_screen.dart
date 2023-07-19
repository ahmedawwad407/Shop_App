import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:f_project/layout/shope_app/cubit/cubit.dart';
import 'package:f_project/layout/shope_app/cubit/states.dart';
import 'package:f_project/models/Shop_App/category_model/dataModel.dart';
import 'package:f_project/models/Shop_App/home_model/dataModel.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.getHomeCubit(context);
       /*  return ConditionalBuilder(
             condition:  cubit.homeModel != null && cubit.categoryModel != null,
             builder: (context) {
               return buildProductItems(cubit.homeModel,cubit.categoryModel);
             },
             fallback: (context) {
               return Center(child: CircularProgressIndicator());
             }
         );
*/
        return buildProductItems(cubit.homeModel,cubit.categoryModel);
      },
    );
  }

/*  Widget buildProductItems(ShopHomeModel? model)=>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
                items: [
                  Image(
                    image: AssetImage('assets/images/on_boarding1.png'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage('assets/images/on_boarding2.png'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage('assets/images/on_boarding3.png'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                    height: 250,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 28 , fontWeight: FontWeight.w800),
                  ),
                  Container(
                    height: 130,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildCategoryItem(categoryModel!.data.data[index]);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        width: 5,
                      ),
                      itemCount: categoryModel!.data.data.length,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "New Products",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.grey,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                childAspectRatio: 1 / 1.6,
                children:
                List.generate(
                    model!.data!.products.length,
                        (index) => buildGridViewItem(model.data!.products[index])
                ),
              ),
            )
        ],),
      );*/

  Widget buildProductItems(ShopHomeModel? model,ShopCategoriesModel? categoryModel) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: [
                  Image(
                    image: AssetImage('assets/images/on_boarding1.png'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage('assets/images/on_boarding2.png'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage('assets/images/on_boarding3.png'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                    height: 250,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 28 , fontWeight: FontWeight.w800),
                  ),
                  Container(
                    height: 130,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                       // return buildCategoryItem(categoryModel!.data.data[index]);
                        return buildCategoryItem();
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        width: 5,
                      ),
                      itemCount: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "New Products",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.grey,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                childAspectRatio: 1 / 1.6,
                children:
                    // List.generate(
                    //     model!.data!.products.length,
                    //         (index) => buildGridViewItem(model.data!.products[index])
                    // ),
                    List.generate(20, (index) => buildGridViewItem()),
              ),
            )
          ],
        ),
      );

//Widget buildGridViewItem(ProductsModel model) =>
  Widget buildGridViewItem() => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image(
            //   image: NetworkImage(model.image),
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: AssetImage('assets/images/phone.png'),
                  width: double.infinity,
                  height: 200,
                ),
                //  if(model.discount != 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadiusDirectional.circular(20)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // model.name,
                    "DescriptionDescriptionDescriptionDescriptionDescription"
                    "DescriptionDescriptionDescriptionDescriptionDescriptionDescription",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        // '${model.price}',
                        'Price',
                        style: TextStyle(fontSize: 12, color: defaultColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      //if(model.discount != 0)
                      Text(
                        // '${model.old_price}',
                        'discount',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),

                      Spacer(),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadiusDirectional.circular(30),

                        ),
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.favorite_border)),
                      ),
                      // IconButton(onPressed: (){
                      //
                      // },
                      //     icon: Icon(
                      //   Icons.shopping_cart_outlined
                      // )
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

 // Widget buildCategoryItem(CategoryModel model) =>
  Widget buildCategoryItem() =>
      Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            //image: NetworkImage(model.image),
            image: AssetImage('assets/images/phone.png'),
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(.8),
            width: 100,
            child: Text(
             // '${model.name}',
              'Categories',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
}
