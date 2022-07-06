import 'package:birthday/route/route_constants.dart';
import 'package:birthday/ui/screens/add_user/add_user.dart';
import 'package:birthday/ui/screens/all_users/home.dart';
import 'package:birthday/ui/screens/auth/sign-in.dart';
import 'package:birthday/ui/screens/main_screen/main_screen.dart';
import 'package:flutter/cupertino.dart';
import '../ui/screens/cats/cats.dart';
import '../ui/screens/calendar/calendar_second.dart';

class Routes {

  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
    RouteList.initial: (context) => SignIn(),
  RouteList.home:(context)=>Home(),
  RouteList.mainScreen:(context)=>MainScreen(),
  RouteList.calendarSecond:(context)=>CalendarSecond(),
  RouteList.addUser:(context)=>AddUser(),
  RouteList.cats:(context)=>CatsBlocView(),
  };
}
