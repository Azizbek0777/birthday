import 'package:birthday/route/route_constants.dart';
import 'package:birthday/utils/app_color.dart';
import 'package:birthday/utils/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../all_users/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: Container(
      child: Wrap(
        spacing: 4,
        runSpacing: 60,
        alignment: WrapAlignment.center,
        children: [
        Text("У вас еще нет учетной записи?",style: AppStyle.description),
GestureDetector(child: Text("Регистрация",style: TextStyle(color: Colors.blue),),)

        ],),
    ),
      // child: Row(
 //        mainAxisAlignment: MainAxisAlignment.center,
 //        crossAxisAlignment: CrossAxisAlignment.center,
 //        children: [
 // Text("У вас еще нет учетной записи?\nРегистрация",style: AppStyle.description)
 //        ],
 //      ),

        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(

            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(top: 54, left: 24),
              //       child: IconButton(
              //         icon: const Icon(
              //           Icons.close,
              //           color: AppColor.close,
              //           size: 32,
              //         ),
              //         onPressed: () {},
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(height: 65),
              Image.asset("assets/bollon.png"),
              const SizedBox(height: 20),
              Text("Вход", style: AppStyle.SignIn),
              const SizedBox(height: 10),
              Text("С вовзращением!", style: AppStyle.description),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 42, right: 42),
                child: TextFormField(cursorColor: Colors.white,
                  controller: phoneController,style: const TextStyle(color: Colors.white),
                  decoration:  InputDecoration(
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    label: Text("Номер",style:AppStyle.description1,),
                    border:  UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.description)),
                 focusColor: Colors.white
                  ),
                  maxLength: 13,
                  keyboardType: TextInputType.phone,
                ),
              ),
                 const SizedBox(height: 15),
              Visibility(
                visible: otpVisibility,
                child: Padding(
                  padding: const EdgeInsets.only(left: 42, right: 42),
                  child: TextFormField(
                  style: TextStyle(color: Colors.white),
                    controller: otpController,

                    decoration:  InputDecoration(
                      label: Text("Пароль",style:AppStyle.description1,),

                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.description)),
                    ),
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 42, right: 42),
                child: Container(
                  height: 50,
                  width: 290,
                  child: TextButton(
                    onPressed: () {
                      if (otpVisibility) {
                        verifyOTP();
                      } else {
                        loginWithPhone();
                      }
                    },
                    child:  Center(
                      child: Text(otpVisibility ? "Пароль" : "Войти",style: TextStyle(color: Colors.white,),),
                    ),
                    style: TextButton.styleFrom(
                     backgroundColor: Colors.blue
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Забыли пароль?",style: TextStyle(color: Colors.blue,fontSize: 16),),
            ],
          ),
        ));
  }
  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber:  phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
          (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
          () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushNamed(context,RouteList.mainScreen);
        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}
