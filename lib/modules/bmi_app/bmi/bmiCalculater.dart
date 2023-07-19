import 'dart:math';

import 'package:f_project/modules/bmi_app/bmi_result/bmiResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiCalculater extends StatefulWidget {
  @override
  _BmiCalculaterState createState() => _BmiCalculaterState();
}

class _BmiCalculaterState extends State<BmiCalculater> {

    bool isMale = true;
    double height = 100;

    late String gender;

    int weight = 40;
    int age = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            'BMI Calculator',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: (){
                            setState(() {
                              isMale = true;
                              gender = 'Male';
                            });
                      },
                      child: Container(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/images/male.png',
                              ),
                              height: 70,
                              width: 70,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'Male',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            color: isMale ? Colors.blue : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                              isMale = false;
                              gender = 'Female';

                          });
                        },
                        child: Container(
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/female.png',
                                ),
                                height: 70,
                                width: 70,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  'Female',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                              ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isMale ? Colors.grey[400] : Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${height.round()}',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'CM',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      value: height,
                      max: 300,
                      min: 50,
                      onChanged: (value){
                        setState(() {

                        });
                          height = value;
                  }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400]
                        ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                                '$age',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                heroTag: 'age-',
                                mini: true,
                                child: Icon(Icons.remove),
                                  ),
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                heroTag: 'age+',
                                mini: true,
                                child: Icon(Icons.add),
                                  ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400]
                        ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                                '$weight',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                heroTag: 'weight-',
                                mini: true,
                                child: Icon(Icons.remove),
                                  ),
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                heroTag: 'weight+',
                                mini: true,
                                child: Icon(Icons.add),
                                  ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(2)
              ),
                color: Colors.blue
            ),
            child: MaterialButton(
              textColor: Colors.white,
               // color: Colors.grey,
                onPressed: () {

                var result = weight / pow(height / 100,2);
                print(result.round());
                Navigator.push(
                    context, MaterialPageRoute(
                        builder: (context)=>BmiResult(
                          age: age,
                          gender: gender,
                          result: result.round(),
                        )
                    )
                );
                },
              child: Text(
                'Calculate',
              style: TextStyle(
                fontSize: 30
              ),),
                ),
          )
        ],
      ),
    );
  }
}
