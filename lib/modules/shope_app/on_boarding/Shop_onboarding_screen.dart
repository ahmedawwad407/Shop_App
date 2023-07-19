import 'package:f_project/models/Shop_App/boarding_model/dataModel.dart';
import 'package:f_project/modules/shope_app/login/Shop_login_screen.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:f_project/shared/network/local/cache_helper.dart';
import 'package:f_project/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopOnBoardingScreen extends StatefulWidget {
  @override
  State<ShopOnBoardingScreen> createState() => _ShopOnBoardingScreenState();
}

class _ShopOnBoardingScreenState extends State<ShopOnBoardingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var boradController = PageController();
  bool isLast = false;
  List<BoardingModel> boarding = [
    BoardingModel('assets/images/on_boarding1.png', '1', 'body'),
    BoardingModel('assets/images/on_boarding2.png', '2', 'body'),
    BoardingModel('assets/images/on_boarding3.png', '3', 'body')
  ];

  void submit() {
  CachHelper.saveData(key: "OnBoarding", value: true).then((value){
    if(value){
      navigationAndFinish(context, ShopLoginScreen());
    }
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              function: () {
                submit();
          }, text: "SKIP")
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boradController,
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    isLast = false;
                  }
                },
                itemBuilder: (context, index) =>
                    builtItemBoard(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boradController,
                    effect: JumpingDotEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defaultColor,
                      dotHeight: 15,
                      spacing: 10,
                      dotWidth: 15,
                    ),
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(
                    child: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      if (isLast) {
                        submit();
                      }else{
                        boradController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.fastLinearToSlowEaseIn);

                      }
                       }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget builtItemBoard(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Text(
            '${model.body}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      );
}


