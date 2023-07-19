import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {

  late final int result;
  late final String gender;
  late final int age;
  BmiResult({
    required this.result,
    required this.gender,
    required this.age
});

/*  BmiResult(
      this.result,
      this.gender,
      this.age
      );*/
  // BmiResult(){
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Gender : $gender',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
            Text('Result : $result',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
            Text('Age : $age',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
    );
  }
}
