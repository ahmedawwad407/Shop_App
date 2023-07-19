import 'package:f_project/modules/bmi_app/bmi/bmiCalculater.dart';
import 'package:f_project/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,// not apply -> solution center widget
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultTextFormField(
                      prefixIcon: Icons.email,
                      label: 'email',
                      type: TextInputType.emailAddress,
                      // validate: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Field must not Empty';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      controller: emailController),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultTextFormField(
                    prefixIcon: Icons.lock,
                    suffixIcon: isShow ? Icons.visibility : Icons.visibility_off,
                    label: 'password',
                    type: TextInputType.visiblePassword,
                    // validate: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Field must not Empty';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    isObscure: isShow,
                    suffixPressed: () {
                      setState(() {
                        /*if(isShow){
                            isShow = false;
                          }else{
                            isShow = true;
                          }*/

                        isShow = !isShow;
                      });
                    },
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),defaultButton(
                      // width: 200.0,
                      // color: Colors.green,
                      // isUpperCase: false,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>BmiCalculater()
                              )
                          );
                        }

                      },
                      text: 'login'),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          height: 40,
                          color: Colors.black38,
                          child: TextButton(
                            onPressed: () => print('object'),
                            child: Text(
                              "RegisterNow",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.red;
                                }
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
