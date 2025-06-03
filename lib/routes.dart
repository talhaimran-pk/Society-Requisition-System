import 'package:flutter/material.dart';
import '../screens/common/splash_screen.dart';
import '../screens/common/login_screen.dart';
import '../screens/chairperson/cp_home.dart';

// import other screens here...

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/cp_home': (context) => ChairpersonHomeScreen(),
};
