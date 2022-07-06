import 'package:birthday/route/route_constants.dart';
import 'package:birthday/utils/app_color.dart';
import 'package:birthday/utils/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../data/model/user_model.dart';
import '../../../serivice/service.dart';
import '../auth/sign-in.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = "";
  final auth = FirebaseAuth.instance;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: Container(
          padding: EdgeInsets.only(top: 35, right: 15, left: 15),
          color: AppColor.black75,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 33,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Люди",
                  style: AppStyle.SignIn,
                ),
              ),
              SizedBox(height: 11),
              Center(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.black7,
                    ),
                    width: double.infinity,
                    height: 36,
                    child: Center(
                      child: TextFormField(
                        // textAlign: TextAlign.center,

                        cursorColor: AppColor.white,
                        style: TextStyle(color: AppColor.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            fillColor: Colors.red,
                            prefixIcon:
                                Icon(Icons.search, color: AppColor.description),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintStyle: AppStyle.description1,
                            hintText: "Поиск"),
                      ),
                    )),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),floatingActionButton: FloatingActionButton(
      onPressed: (){
Navigator.pushNamed(context, RouteList.cats);
      },
    ),
      body: StreamBuilder<List<User1>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong! ${snapshot.hasError} ${snapshot.error}");
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
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
                              child: Image.asset("assets/png/Userpic.png"),
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
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
