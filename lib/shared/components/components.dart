import 'package:f_project/modules/News_app/web_view/web_view.dart';
import 'package:f_project/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget defaultButton({
  double width = double.infinity,
  Color color = Colors.blue,
  bool isUpperCase = true,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      color: color,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0, // color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
Widget defaultTextButton({
  required Function() function,
  required String text,
}) => TextButton(
onPressed: function,
child: Text(
text.toUpperCase(),
  style: TextStyle(fontSize: 20),
),
style: ButtonStyle(
backgroundColor:
MaterialStateProperty.resolveWith((states) {
if (states.contains(MaterialState.pressed)) {
return Colors.lightBlueAccent;
}
}),
),
);



/*class EmailValidator {
  static String? validate(String? value) {
    return value==null ||  value.isEmpty ? "Email can't be empty" : null;
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    return value==null ||value.isEmpty ? "Password can't be empty" : null;
  }
}*/

Widget defaultTextFormField({
  //CommonUse
  required IconData prefixIcon,
  IconData? suffixIcon,
  required String label,
  bool isUpperCase = false,
  bool isObscure = false,
  required TextInputType type,
  Function()? onTap,
  double radius = 20.0,
  // required Function validate,
  required TextEditingController controller,
  bool isclickable = true,
  Function()? suffixPressed
}) {
  String? validate(String? value) {
    return value == null || value.isEmpty ? "Field can't be empty" : null;
  }
  return TextFormField(
    controller: controller,
    cursorColor: Colors.blue,
    keyboardType: type,
    obscureText: isObscure,
    onTap: onTap,
    validator: validate,
    enabled: isclickable,
    decoration: InputDecoration(
      //hintText: "Enter the Email",
        labelText: isUpperCase ? label.toUpperCase() : label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(
              suffixIcon
          ),
          onPressed: suffixPressed,
        )
    ),
  );
}


Widget buildItemTask(Map data, context) =>
    Dismissible(
      key: Key(data['id'].toString()),
      child: Padding(

        padding: const EdgeInsets.all(10.0),

        child: Row(

          children: [

            CircleAvatar(

              backgroundColor: Colors.black54,

              radius: 40,

              child: Text(

                '${data['time']}',

                style: TextStyle(

                    color: Colors.white,

                    fontSize: 18,

                    fontWeight: FontWeight.bold),

              ),

            ),

            SizedBox(

              width: 10,

            ),

            Expanded(

              child: Column(

                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(

                    '${data['title']}',

                    style: TextStyle(

                        color: Colors.black,

                        fontSize: 18,

                        fontWeight: FontWeight.bold),

                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,

                  ),

                  Text(

                    '${data['date']}',

                    style: TextStyle(color: Colors.black,

                        fontSize: 12),

                  ),

                ],

              ),

            ),

            SizedBox(

              width: 10,

            ),

            IconButton(

                onPressed: () {
                  AppCubit.getHomeCubit(context).updateSomeRecord(
                      status: 'done', id: data['id']);
                },

                icon: Icon(Icons.check_circle, color: Colors.green,)

            ),

            IconButton(

                onPressed: () {
                  AppCubit.getHomeCubit(context).updateSomeRecord(
                      status: 'archive', id: data['id']);
                },

                icon: Icon(Icons.archive, color: Colors.red,)

            ),

          ],

        ),

      ),
      onDismissed: (direction){
          AppCubit.getHomeCubit(context).deleteSomeRecord(id: data['id']);
      },
    );


Widget buildItemNews(Map dataApi,context) =>
InkWell(
  onTap: (){
    navigationTo(context, WebViewScreen(dataApi['url']));
  },
  child:   Padding(

  padding: EdgeInsetsDirectional.all(15),

  child: Row(

  children: [

  Container(

  width: 120,

  height: 120,

  decoration: BoxDecoration(

  borderRadius: BorderRadius.circular(10),

  image: DecorationImage(

   image: NetworkImage('${dataApi['urlToImage']}'),

  //image: NetworkImage('https://scontent.fgza9-1.fna.fbcdn.net/v/t39.30808-6/351467385_1425697011599325_2525309956581032621_n.png?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=gWXF0AR2g1cAX8mBgiI&_nc_ht=scontent.fgza9-1.fna&oh=00_AfDyikF-0of9JhglOav7nHI4qe4D28L_n7VaS3wAGcGxCQ&oe=64AB3100'),

  fit: BoxFit.cover,

  )

  ),

  ),

  SizedBox(

  width: 30,

  ),

  Expanded(

  child: Container(

  height: 120,

  child: Column(

  mainAxisSize: MainAxisSize.min,

  mainAxisAlignment: MainAxisAlignment.start,

  crossAxisAlignment: CrossAxisAlignment.start,

  children: [

  Expanded(

  child: Text(

    '${dataApi['title']}',

  maxLines: 2,

  overflow: TextOverflow.ellipsis,

  style: Theme.of(context).textTheme.headline6,

  ),

  ),

  Text(

    '${dataApi['publishedAt']}',

  style: TextStyle(

  fontSize: 20.0,

  fontWeight: FontWeight.bold,

  color: Colors.grey

  ),

  ),

  ],

  ),

  ),

  )

  ],

  ),

  ),
);


Widget myDivider() =>
    Container(
      margin: EdgeInsetsDirectional.only(start: 20),
      width: double.infinity,
      height: 1,
      color: Colors.blue,
    );

Widget listView(list,{isSearch = false}) {
 return  list.length <= 0 ?

 isSearch ? Container() :
 Center(child: CircularProgressIndicator())

     : ListView.separated(
      physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) =>
        buildItemNews(list[index],context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: 20);
}

Future<dynamic> navigationTo( context, screen){
   return Navigator.push(context,MaterialPageRoute(builder: (context) => screen));
}

Future<dynamic> navigationAndFinish( context, screen){
  return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
          (route) => false//anynomous fun
  );
}
// Widget listView()=>ListView.separated(
//     itemBuilder: (context,index) => buildItemTask(record[index]),
//     separatorBuilder: (context,index)=>
//     Container(
//       margin: EdgeInsetsDirectional.only(
//           start: 20
//       ),
//       width: double.infinity,
//       height: 1,
//       color: Colors.blue,
//     ),
//     itemCount: record.length);

/* showToast({String message,ToastStates state}) =>
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
*/

//class to made switch between any states
enum ToastStates{
  SUCCESS,
  ERROR,
  WARNING
}

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS: color= Colors.green;
    break;
    case ToastStates.ERROR: color= Colors.red;
    break;
    case ToastStates.WARNING: color= Colors.yellow;
    break;
  }
  return color;
}

