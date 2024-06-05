import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_school_app/widgets/navigation/main_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final mainNavigation = MainNavigation();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: mainNavigation.routes,
    initialRoute: MAinNavigationRoutesName.toyInfo,
    onGenerateRoute: MainNavigation().onGenerateRoute,
  ));
}
