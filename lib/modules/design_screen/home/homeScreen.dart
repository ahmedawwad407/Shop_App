import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //AppBar -> preferredsizeWidget
        leading: Icon(Icons.menu),
        //menu (static) ->IconData
        title: Text("FirstApp"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        actions: [
          IconButton(onPressed: notif, icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () {
                print("hello");
              },
              icon: Text("hello")),
          Icon(Icons.search_sharp)
        ],
        elevation: 15.0,
        //shadow below
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(25.0)
                )
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,// Apply decoration to stack
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg'),
                    width: 300,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(.5),
                    margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    // padding: EdgeInsetsDirectional.only(bottom: 10,top: 10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Ahmed",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   color: Colors.deepPurpleAccent,
          //   child: Text(
          //       "Ahmed",
          //     style: TextStyle(
          //       fontSize: 40.0,
          //       color: Colors.white,
          //     ),
          //
          //   ),
          // ),
          // Container(
          //   color: Colors.amberAccent,
          //   child: Text(
          //     "Ahmed",
          //     style: TextStyle(
          //       fontSize: 40,
          //       color: Colors.white,
          //
          //
          //     ),
          //
          //   ),
          // ),
          // Container(
          //   color: Colors.red,
          //   child: Text(
          //     "Ahmed",
          //     style: TextStyle(
          //       fontSize: 40,
          //       color: Colors.white,
          //
          //     ),
          //
          //   ),
          // ),
          // Container(
          //   color: Colors.black,
          //   child: Text(
          //     "Ahmed",
          //     style: TextStyle(
          //       fontSize: 40,
          //       color: Colors.white,
          //
          //
          //     ),
          //
          //   ),
          // ),
        ],
      ),
    );
  }

  void notif() {
    print("notifications");
  }
}
