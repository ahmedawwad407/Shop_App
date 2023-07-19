import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 75,
        titleSpacing: 15,
        backgroundColor: Colors.black,
        elevation: 0.0,
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 20),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/80257246?s=96&v=4'),
          ),
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            decoration: TextDecoration.underline,
            decorationColor: Colors.amberAccent,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.grey[900],
                radius: 15.0,
                child: Icon(
                  Icons.camera_alt,
                  size: 17.0,
                  color: Colors.white,
                ),
              )),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.grey[900],
                radius: 15.0,
                child: Icon(
                  Icons.edit,
                  size: 17.0,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[900],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildStoryItem();
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 5,
              ),
                 ListView.separated(
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: 10),

            ],
          ),
        ),
      ),
    );
  }

  //ListView
// 1 build Item
// 2 build List
// 3 add item to list

  //1 build Item
  //Arrow Function
  Widget buildChatItem() => Row(
        children: [
          Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/80257246?s=96&v=4'),
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 9,
            ),
            CircleAvatar(
              backgroundColor: Colors.green[600],
              radius: 8,
            ),
          ]),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AhmedAw',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'AhmedAw : 11:48 am',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          //borderRadius: BorderRadius.circular(50),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '11:48 am',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );

  Container buildStoryItem() => Container(
        width: 60,
        child: Column(
          children: [
            Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 37,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/80257246?s=96&v=4'),
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 9,
              ),
              CircleAvatar(
                backgroundColor: Colors.green[600],
                radius: 8,
              ),
            ]),
            Text(
              'Ahmed Wadie Moh Awwad',
              style: TextStyle(
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
