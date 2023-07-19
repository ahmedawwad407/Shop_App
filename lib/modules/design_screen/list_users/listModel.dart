import 'package:f_project/models/user/dataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListModel  extends StatelessWidget {

    List<Users> listUsers=[
      Users(id: 1,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 2,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 3,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 4,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 5,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 6,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 1,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 2,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 3,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 4,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 5,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
      Users(id: 6,name: 'Ahmed',message: 'aaaaaaaaaaaa'),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context,index)=>buildItemList(listUsers[index]),
          separatorBuilder: (context,inndex)=>Container(
            margin: EdgeInsetsDirectional.only(
              start: 20
            ),
            width: double.infinity,
            height: 1,
            color: Colors.blue,
          ),
          itemCount: listUsers.length),
    );
  }


 Widget buildItemList(Users user)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 25,
          child: Text(
              '${user.id.toString()}',
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
                user.name.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ), Text(
                user.message.toString(),
                style: TextStyle(color: Colors.black,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
