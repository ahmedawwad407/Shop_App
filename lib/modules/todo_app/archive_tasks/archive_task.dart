import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/cubit/cubit.dart';
import 'package:f_project/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchiveTaskScreen extends StatefulWidget {

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<ArchiveTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state) {
          var tasks= AppCubit.getHomeCubit(context).archiveRecord;
          return tasks.length == 0 ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu,
                  size: 100,
                  color: Colors.grey,),
                Text('No tasks yet, please add some tasks',
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            ),
          )  :  ListView.separated(
              itemBuilder: (context, index) => buildItemTask(tasks[index], context),
              separatorBuilder: (context, inndex) =>
                  Container(
                    margin: EdgeInsetsDirectional.only(
                        start: 20
                    ),
                    width: double.infinity,
                    height: 1,
                    color: Colors.blue,
                  ),
              itemCount: tasks.length);
        });
  }
}
