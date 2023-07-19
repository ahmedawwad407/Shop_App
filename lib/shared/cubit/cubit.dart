import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:f_project/modules/todo_app/archive_tasks/archive_task.dart';
import 'package:f_project/modules/todo_app/done_tasks/done_task.dart';
import 'package:f_project/modules/todo_app/new_task/new_task.dart';
import 'package:f_project/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialStates());// not state but start is

  static AppCubit getHomeCubit (context) => BlocProvider.of(context);


  int currentIndex = 0;
  bool isShowBottomSheet = true;
  var icon = Icons.edit;


  List<Widget> screens = [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchiveTaskScreen(),
  ];

  List<String> titles = [
    'New Task',
    'Done Task',
    'Archive Task',
  ];

  void myCurrentIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());

  }
  void changeBottomSheet(bool isShow,IconData fabIcon){
     isShowBottomSheet = isShow;
     icon = fabIcon;
     emit(AppChangeBottomSheetState());
  }


  late Database db;
  final String tableTodo = 'mytask';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnDate = 'date';
  final String columnTime = 'time';
  final String columnStatus = 'status';

  List<Map> newRecord= [];
  List<Map> doneRecord= [];
  List<Map> archiveRecord= [];



  void createDB() async{
    db = await openDatabase(
        'mydatabase.db',
        version: 1,
        onCreate: (database,version) async{
          print('created db');
          await  database.execute('''
  CREATE TABLE IF NOT EXISTS $tableTodo ( 
  $columnId INTEGER PRIMARY KEY, 
  $columnTitle TEXT,
  $columnDate TEXT,
  $columnTime TEXT,
  $columnStatus TEXT
  );''').then((value){
            print('created table');
          }).catchError((error){
            print('$error');
          });
        },
        onOpen: (database){

          getRecords(database).then((value){
          //  newRecord = value;

            value.forEach((element) {
              if(element['$columnStatus'] == 'new'){
                newRecord.add(element);
              }else if(element['$columnStatus'] == 'done'){
                doneRecord.add(element);
              }else if(element['$columnStatus'] == 'archive'){
                archiveRecord.add(element);
              }
            });
            print(value);

            emit(AppGetRecordsState());
          });

          print('opened db');
        }
    );
    emit(AppCreateDBState());
  }

  Future inserToDB(String title, String date, String time, String status) async {
    //
    return await db.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO $tableTodo($columnTitle,$columnDate,$columnTime,$columnStatus) VALUES("$title","$date","$time","$status")');
    }).then((value){
      print('$value inserted Successuflly');
      emit(AppInsertToDBState());

    }).catchError((onError){
      print('inserted NotSuccessuflly ${onError.toString()}');
    });



  }

  Future<List<Map>> getRecords(database) async{
    newRecord= [];
    doneRecord= [];
    archiveRecord= [];
    emit(AppGetRecordsLoadingState());
    return await database.rawQuery('SELECT * FROM $tableTodo');
    //print(myData);//list<map>
  }

  void updateSomeRecord({
  required String status, required int id
}) async{
     db.rawUpdate(''
        'UPDATE $tableTodo SET $columnStatus = ? WHERE $columnId = ?', ['$status', id])
         .then((value){
           //print(value);
       getRecords(db).then((value){
         value.forEach((element) {
           if(element['$columnStatus'] == 'new'){
             newRecord.add(element);
           }else if(element['$columnStatus'] == 'done'){
             doneRecord.add(element);
           }else if(element['$columnStatus'] == 'archive'){
             archiveRecord.add(element);
           }
         });
         print(value);

         emit(AppGetRecordsState());
       });
          emit(AppUpdateDataState());
     });
  }


  void deleteSomeRecord({required int id}) async{
    db.rawDelete('DELETE FROM $tableTodo WHERE $columnId = ?', [id])
        .then((value){
      //print(value);
      getRecords(db).then((value){
        value.forEach((element) {
          if(element['$columnStatus'] == 'new'){
            newRecord.add(element);
          }else if(element['$columnStatus'] == 'done'){
            doneRecord.add(element);
          }else if(element['$columnStatus'] == 'archive'){
            archiveRecord.add(element);
          }
        });
        print(value);

        emit(AppGetRecordsState());
      });
      emit(AppDeleteDataState());
    });
  }

}