import 'package:birthday/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../route/route_constants.dart';
import '../../../serivice/service.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_style.dart';

class CalendarSecond extends StatefulWidget {
  const CalendarSecond({Key? key}) : super(key: key);

  @override
  State<CalendarSecond> createState() => _CalendarSecondState();
}

class _CalendarSecondState extends State<CalendarSecond> {
  final auth = FirebaseAuth.instance;
  String value1 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Container(
          padding: EdgeInsets.only(top: 45, right: 15, left: 15),
          color: AppColor.black75,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios, color: AppColor.blue),
                          Text("Назад", style: AppStyle.blueText),
                        ],
                      ))),
              Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "События",
                  style: AppStyle.SignIn,
                ),
              ),
              SizedBox(height: 11),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Theme(
            data: ThemeData.dark(),
            child: CalendarDatePicker(
                initialDate: DateTime.now(),
                onDateChanged: (DateTime value) {
                  print(value);
                  value1 = value.toString();
                  setState(() {
                    readUsers();
                  });
                },
                firstDate: DateTime(1800),
                lastDate: DateTime(2200)),
          ),
          Expanded(
              child: StreamBuilder<List<User1>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(
                    "Something went wrong! ${snapshot.hasError} ${snapshot.error}");
              } else if (snapshot.hasData) {
                final users = snapshot.data!;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      if (users[index]
                              .birthday
                              .replaceAll(" 00:00:00.000", '') ==
                          value1.replaceAll(" 00:00:00.000", '')) {
                        return Container(
                          height: 80,
                          width: 355,
                          decoration: BoxDecoration(
                            color: AppColor.black7,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.all(8.0),
                          child: Center(
                            child: ListTile(
                              leading: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    child:
                                        Image.asset("assets/png/Userpic.png"),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 11.5,
                                        backgroundColor: Colors.green,
                                        child: Center(
                                            child: Text(
                                          users[index].age.toString(),
                                          style: AppStyle.cir,
                                        )),
                                      ))
                                ],
                              ),
                              title: Text(
                                "${users[index].name} ${users[index].surname}",
                                style: AppStyle.title,
                              ),
                              subtitle: Text(
                                  "День рождения\n${users[index].birthday.replaceAll("00:00:00.000", '')}",
                                  style: AppStyle.SubiTitle),
                              trailing: Icon(Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey),
                              onTap: () {},
                            ),
                          ),
                        );
                      }
                      return SizedBox();
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ))
        ],
      ),
    );
  }
}
