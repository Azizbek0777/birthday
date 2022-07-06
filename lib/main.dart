import 'package:birthday/route/route_constants.dart';
import 'package:birthday/route/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Birthday',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteList.initial,
      onGenerateRoute: (RouteSettings settings) {
        final routes = Routes.getRoutes(settings);
        final WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}

