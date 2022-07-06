import 'package:birthday/utils/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../data/model/user_model.dart';
import '../../../serivice/service.dart';
import '../../../utils/app_color.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController name=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController birthday=TextEditingController();
  TextEditingController age=TextEditingController();
  final birthdayFormat = MaskTextInputFormatter(
    mask: '####-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );final ageFormat = MaskTextInputFormatter(
    mask: '##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: GestureDetector(
          child: Text("Отменить", style: AppStyle.blueText),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      child: SvgPicture.asset("assets/svg/user.svg"),
                      radius: 42,
                    ),
                  ),
                  SizedBox(height: 9),
                  Center(
                      child: Text("Добавить фото", style: AppStyle.blueText)),
                  SizedBox(height: 36),
                  Text("Имя", style: AppStyle.title4),
                  SizedBox(height: 12),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.black7,
                      ),
                      width: double.infinity,
                      height: 45,
                      child: Center(
                        child: TextFormField(
                          controller: name,
                          cursorColor: AppColor.white,
                          style: TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              fillColor: Colors.red,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintStyle: AppStyle.description1,
                              hintText: "Добавить имя"),
                        ),
                      )),
                  SizedBox(height: 10),
                  Text("Фамилия", style: AppStyle.title4),
                  SizedBox(height: 12),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.black7,
                      ),
                      width: double.infinity,
                      height: 45,
                      child: Center(
                        child: TextFormField(
                          controller: lastname,
                          cursorColor: AppColor.white,
                          style: TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              fillColor: Colors.red,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintStyle: AppStyle.description1,
                              hintText: "Фамилия"),
                        ),
                      )),
                  SizedBox(height: 10),
                  Text("День рождения", style: AppStyle.title4),
                  SizedBox(height: 12),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.black7,
                      ),
                      width: double.infinity,
                      height: 45,
                      child: Center(
                        child: TextFormField(
                          inputFormatters:[birthdayFormat],

                          controller: birthday,
                          cursorColor: AppColor.white,
                          style: TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              fillColor: Colors.red,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintStyle: AppStyle.description1,
                              hintText: "День рождения"),
                        ),
                      )),
                  SizedBox(height: 10),
                  Text("Возраст", style: AppStyle.title4),
                  SizedBox(height: 12),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.black7,
                      ),
                      width: double.infinity,
                      height: 45,
                      child: Center(
                        child: TextFormField(
                          inputFormatters:[ageFormat],

                          controller: age,
                          cursorColor: AppColor.white,
                          style: TextStyle(color: AppColor.white),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              fillColor: Colors.red,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintStyle: AppStyle.description1,
                              hintText: "Возраст"),
                        ),
                      )),
                  SizedBox(height: 66),
                  Center(
                    child: Container(
                      height: 50,
                      width: 250,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                    ),

                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.blue
                        ),
                        child: Text("Сохранить",style: AppStyle.whiteText),
                        onPressed: (){
                          final user = User1(
                            surname: lastname.text,
                            age: int.parse(age.text),
                            birthday: birthday.text,
                            name: name.text,
                          );
                          FirebaseFirestore.instance.collection('user');
                          createUser(user);
                          Navigator.pop(context);
                        },
                      ),
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
