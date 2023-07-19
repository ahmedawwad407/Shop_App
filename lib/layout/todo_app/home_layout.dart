// import 'package:conditional_builder/conditional_builder.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/cubit/cubit.dart';
import 'package:f_project/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {


  var keyForm = GlobalKey<FormState>();
  var scaffoledKey = GlobalKey<ScaffoldState>();

  //var db = My_DB();

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var statusController = TextEditingController();



/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.createDB();
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDB(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context,AppStates state) {
                if(state is AppInsertToDBState){
                      Navigator.pop(context);
                }
          },
          builder: (BuildContext context,AppStates state) {
            AppCubit cubit =  AppCubit.getHomeCubit(context);

            return  Scaffold(
            key: scaffoledKey,
            appBar: AppBar(
            title: Text('${cubit.titles[cubit.currentIndex]}'),
            ),
            floatingActionButton: FloatingActionButton(
            onPressed: () {
            //   print(await getName());

            /* try{
               print(await getName());
              throw ('some error!!!!!');
              print(await getName());

            }catch(error){
              print('Error!!!!!!!!!!!!!${error.toString()}');
            }*/

            /*   getName().then((value) {
              print(value);
              throw ('some error!!!!!');
            }).catchError((error) {
              print('Error!!!!!!!!!!!!!${error.toString()}');
            });*/

            /*   if(db.inserToDB()){
            print('true');
          }else{
            print('false');
          }*/


            if (cubit.isShowBottomSheet) {
            scaffoledKey.currentState!.showBottomSheet((context) =>
            Container(
            color: Colors.grey[200],
            child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
            key: keyForm,
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            defaultTextFormField(
            prefixIcon: Icons.title,
            label: 'Enter the Title',
            type: TextInputType.text,
            controller: titleController),
            SizedBox(
            height: 5,
            ),
            defaultTextFormField(
            prefixIcon: Icons.date_range,
            label: 'Enter the Date',
            onTap: () {
            showDatePicker(context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.parse(
            '2023-05-12')
            ).then((value) {
            dateController.text =
            DateFormat.yMMMd().format(
            value!);
            });
            },
            type: TextInputType.datetime,
            controller: dateController),
            SizedBox(
            height: 5,
            ),
            defaultTextFormField(
            prefixIcon: Icons.access_time,
            label: 'Enter the Time',
            onTap: () {
            showTimePicker(
            context: context,
            initialTime: TimeOfDay.now()
            ).then((value) {
            // print(value!.format(context));
            //بعطيه قيمة
            timeController.text =
            value!.format(context)
                .toString();
            });
            },
            type: TextInputType.datetime,
            controller: timeController),
            SizedBox(
            height: 5,
            ),

            defaultTextFormField(
            prefixIcon: Icons.real_estate_agent,
            label: 'Enter the Status',
            type: TextInputType.text,
            controller: statusController),
            ],
            ),
            ),
            ),
            ),
            elevation: 20,
            ).closed.then((value) {

            /*  setState(() {
                  icon = Icons.edit;
                  isShowBottomSheet = true;
                });*/

              cubit.changeBottomSheet(true, Icons.edit);
            });

            /*    setState(() {
                icon = Icons.add;
                isShowBottomSheet = false;
              });*/


            cubit.changeBottomSheet(false, Icons.add);

            } else {
            if (keyForm.currentState!.validate()) {
            cubit.inserToDB(
            titleController.text,
            dateController.text,
            timeController.text,
            statusController.text
            ).then((value) {
                  cubit.getRecords(cubit.db).then((value) {
            //Navigator.pop(context);
           /* setState(() {
            icon = Icons.edit;
            isShowBottomSheet = true;
            record = value;
            });*/
            cubit.changeBottomSheet(true, Icons.edit);
            //cubit.newRecord = value;
            //print(value);

            value.forEach((element) {
              if(element['${cubit.columnStatus}'] == 'new'){
                cubit.newRecord.add(element);
              }else if(element['${cubit.columnStatus}'] == 'done'){
                cubit.doneRecord.add(element);
              }else if(element['${cubit.columnStatus}'] == 'archive'){
                cubit.archiveRecord.add(element);
              }
            });

            });
            });
            }
            }
            },
            child: Icon(
                  cubit.icon,
            ),
            ),
            bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 15,
            backgroundColor: Colors.blueGrey,
            fixedColor: Colors.white,
            selectedFontSize: 18,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
            /*setState(() {
              currentIndex = index;
            });*/ // rebuild
              cubit.myCurrentIndex(index);
            // print(currentIndex);
            },
            items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined), label: 'Tasks'),
            BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline), label: 'Done'),
            BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined), label: 'Archive'),
            ],
            ),
            body: state is AppGetRecordsLoadingState ? Center(
            child: CircularProgressIndicator()) : cubit.screens[cubit.currentIndex],


              // body: ConditionalBuilder(
            //     condition: record.length > 0,
            //     builder:(context) => screens[currentIndex],
            //     fallback: (context) => Center(child: CircularProgressIndicator()),
            // ),

            ) ;
          }

      ),
    );
  }

// Future<String> getName() async {
//   return titles[currentIndex];
// }


}
