import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_style.dart';

class Wishes extends StatefulWidget {
  const Wishes({Key? key}) : super(key: key);

  @override
  State<Wishes> createState() => _WishesState();
}

class _WishesState extends State<Wishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: Container(
          padding: EdgeInsets.only(top: 35, right: 15, left: 15),
          color: AppColor.black75,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Text("Фильтр", style: AppStyle.blueText)),
              Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Пожелания",
                  style: AppStyle.SignIn,
                ),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
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
              title: Text(
                "Желаю, чтобы в твоей жизни преобладали только яркие цвета! Наслаждайся каждым ",
                style: AppStyle.title2,
              ),
              subtitle:
                  Text("Теги: друзья, коллеге", style: AppStyle.SubiTitle),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
              onTap: () {},
            ),
          ),
        );
      }),
    );
  }
}
