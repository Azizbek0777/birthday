import 'package:birthday/utils/app_color.dart';
import 'package:birthday/utils/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../auth/sign-in.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Text("Настройки", style: AppStyle.SignIn),
                SizedBox(height: 11),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.black7),
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        // backgroundColor: Colors.red,
                        child: Image.asset("assets/png/Userpic.png"),
                      ),
                      title: Text("Рустам Шарапов", style: AppStyle.title3),
                      subtitle: Text("rsharapov.wmail@gmail.com",
                          style: AppStyle.title2),
                      trailing: Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: AppColor.black7,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/png/Media.png",
                                height: 28,
                                width: 28,
                              ),
                              SizedBox(width: 10),
                              Text("Купить премиум", style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                      const Divider(
                        thickness: 1,
                        height: 1,
                        color: AppColor.divider,
                        indent: 16,
                        endIndent: 16,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/comp.svg"),
                              SizedBox(width: 10),
                              Text("Список активных устройств",
                                  style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                      const Divider(
                        thickness: 1,
                        color: AppColor.divider,
                        indent: 16,
                        endIndent: 16,
                        height: 1,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/language.svg"),
                              SizedBox(width: 10),
                              Text("Язык", style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                      const Divider(
                        thickness: 1,
                        color: AppColor.divider,
                        indent: 16,
                        endIndent: 16,
                        height: 1,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/u.svg"),
                              SizedBox(width: 10),
                              Text("Уведомления", style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                      const Divider(
                        thickness: 1,
                        color: AppColor.divider,
                        indent: 16,
                        endIndent: 16,
                        height: 1,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/#.svg"),
                              SizedBox(width: 10),
                              Text("Теги", style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                      const Divider(
                        thickness: 1,
                        color: AppColor.divider,
                        indent: 16,
                        height: 1,
                        endIndent: 16,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/Icon.svg"),
                              SizedBox(width: 10),
                              Text("Общие настройки", style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColor.black7,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/key.svg",
                                height: 28,
                                width: 28,
                              ),
                              SizedBox(width: 10),
                              Text("Изменить пароль", style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                      const Divider(
                        thickness: 1,
                        height: 1,
                        color: AppColor.divider,
                        indent: 16,
                        endIndent: 16,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/t.svg"),
                              SizedBox(width: 10),
                              Text("Импорт", style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                      const Divider(
                        thickness: 1,
                        color: AppColor.divider,
                        indent: 16,
                        endIndent: 16,
                        height: 1,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/i.svg"),
                              SizedBox(width: 10),
                              Text("О приложении", style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColor.black7,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Theme(
                                    data: ThemeData.dark(),
                                    child: CupertinoAlertDialog(
                                      title: Text(
                                        "Выход",
                                        style: AppStyle.title,
                                      ),
                                      content: Text(
                                          "Вы уверены, что хотите выйти из \nаккаунта на этом устройстве?"),
                                      actions: <Widget>[
                                        CupertinoDialogAction(
                                          child: Text(
                                            "Да",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          onPressed: () async {
                                            await FirebaseAuth.instance
                                                .signOut();
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => SignIn(),
                                              ),
                                            );
                                          },
                                        ),
                                        CupertinoDialogAction(
                                          child: Text("Нет"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                            // showDialog(
                            //     context: context,
                            //     builder: (_) => Theme(
                            //       data: ThemeData.dark(),
                            //       child: CupertinoAlertDialog(
                            //
                            //         title: Text("Выход",style: AppStyle.title,),
                            //         content: Text("Вы уверены, что хотите выйти из \nаккаунта на этом устройстве?"),
                            //         actions: [
                            //           // Close the dialog
                            //           // You can use the CupertinoDialogAction widget instead
                            //           CupertinoDialogAction(
                            //               child: Text('Cancel'),
                            //               onPressed: () {
                            //                 Navigator.of(context).pop();
                            //               }),
                            //           CupertinoDialogAction(
                            //             child: Text('I agree'),
                            //             onPressed: () {
                            //               // Do something
                            //               print('I agreed');
                            //
                            //               // Then close the dialog
                            //               Navigator.of(context).pop();
                            //             },
                            //           )
                            //         ],
                            //       ),
                            //     ),);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/logout.svg"),
                              SizedBox(width: 10),
                              Text("Выход", style: AppStyle.enter),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
