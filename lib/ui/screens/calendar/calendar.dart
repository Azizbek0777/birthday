import 'package:birthday/route/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_style.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteList.calendarSecond);
                    },
                    child: Text("Календарь", style: AppStyle.blueText),
                  )),
              Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "События",
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
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/bollon.png",height: 128,width: 128,),
          Text("Список событий пока пуст :(", style: AppStyle.whiteText),
          SizedBox(height: 10),
          Container(
            height: 50,
            width: 250,
            child: TextButton(style: TextButton.styleFrom(
              backgroundColor: AppColor.blue,
            ),
                onPressed: () {
              Navigator.pushNamed(context, RouteList.addUser);
                },
                child: Text(
                  "+ Добавить человека",
                  style: AppStyle.texButton,
                )),
          )
        ],
      )),
    );
  }
}
