// import 'package:f_project/shared/components/constant.dart';
// import 'package:sqflite/sqflite.dart';
//
// class My_DB{
//
//  late Database db;
//  final String tableTodo = 'mytask';
//  final String columnId = 'id';
//  final String columnTitle = 'title';
//  final String columnDate = 'date';
//  final String columnTime = 'time';
//  final String columnStatus = 'status';
//
//
//  void createDB() async{
//   db = await openDatabase(
//       'mydatabase.db',
//       version: 1,
//       onCreate: (database,version) async{
//        print('created db');
//        await  database.execute('''
//   CREATE TABLE IF NOT EXISTS $tableTodo (
//   $columnId INTEGER PRIMARY KEY,
//   $columnTitle TEXT,
//   $columnDate TEXT,
//   $columnTime TEXT,
//   $columnStatus TEXT
//   );''').then((value){
//         print('created table');
//        }).catchError((error){
//         print('$error');
//        });
//       },
//
//       onOpen: (database){
//         getRecords(database).then((value){
//           record = value;
//               //print(value);
//         });
//        print('opened db');
//
//       }
//
//   );
//
//  }
//
//  Future inserToDB(String title, String date, String time, String status) async {
//
//  return await db.transaction((txn) async {
//       txn.rawInsert(
//         'INSERT INTO $tableTodo($columnTitle,$columnDate,$columnTime,$columnStatus) VALUES("$title","$date","$time","$status")');
//     }).then((value){
//       print('$value inserted Successuflly');
//   }).catchError((onError){
//      print('inserted NotSuccessuflly ${onError.toString()}');
//    });
//
//
//  }
//
//  Future<List<Map>> getRecords(database) async{
//
//    return await database.rawQuery('SELECT * FROM $tableTodo');
//   //print(myData);//list<map>
//  }
//
// void updateSomeRecord({
//   required String status, required int id
// }) async{
//   db.rawUpdate(''
//       'UPDATE $tableTodo SET $columnStatus = ? WHERE $columnId = ?',
//       ['$status', id])
//       .then((value){
//     print(value);
//     emit(AppUpdateDataState());
//   });
// }
// }
