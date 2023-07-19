

import 'package:flutter/material.dart';

class RowScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(//AppBar -> preferredsizeWidget
        leading: Icon(
            Icons.menu
        ),//menu (static) ->IconData
        title: Text(
            "FirstApp"
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        actions:
        [
          IconButton(onPressed:notif ,icon: Icon(Icons.notifications)
          ),
          IconButton(onPressed: () {
            print("hello");
          }, icon: Text("hello")
          ),
          Icon(Icons.search_sharp)
        ],
        elevation: 15.0,//shadow below
        backgroundColor: Colors.red,
      ),
      body: Container(
      color: Colors.teal,
        // height: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children:
          [
            Container(
              child: Container(
              color: Colors.green,
              child: Text(
                  "Ahmed",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                textAlign: TextAlign.center,
              ),
          ),
            ),
            Container(
              child: Container(
                color: Colors.red,
                child: Text(
                  "Ahmed",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              child: Container(
                color: Colors.blue,
                child: Text(
                  "Ahmed",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              child: Container(
                color: Colors.amberAccent,
                child: Text(
                  "Ahmed",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      )

  );
  }


  void notif() {
    print("notifications");
  }

}