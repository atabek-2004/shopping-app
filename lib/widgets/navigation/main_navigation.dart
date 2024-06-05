import 'package:flutter/material.dart';
import 'package:smart_school_app/widgets/login_widget/information_widget.dart';
import 'package:smart_school_app/widgets/login_widget/login_widget.dart';
import 'package:smart_school_app/widgets/register_widget/registration_widget.dart';
import 'package:smart_school_app/widgets/shop_screen/shop_home_widgets.dart';
import 'package:smart_school_app/widgets/shop_screen/toy_information.dart';

class MAinNavigationRoutesName {
  static const information = '/information';
  static const registrtion = '/information/registration';
  static const login = '/information/registration/login';
  static const homePage = '/information/registration/login/home';
  static const toyInfo = '/information/registration/login/home/toy_info';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MAinNavigationRoutesName.information: (context) =>
        const InformationWidget(),
    MAinNavigationRoutesName.registrtion: (context) =>
        const RegistrationWidget(),
    MAinNavigationRoutesName.login: (context) => const LoginWidget(),
    MAinNavigationRoutesName.homePage: (context) => const HomePageWidget(),
  };

  Route<Object>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MAinNavigationRoutesName.toyInfo:
        final arguments = settings.arguments;
        final argument = arguments is int ? arguments : 0;
        return MaterialPageRoute(builder: (context) {
          return ToyInformationWidget(id: argument);
        });
      default:
        const widget = Text('Navigation errorr!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
