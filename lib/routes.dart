import 'package:flutter/material.dart';
import '../screens/common/splash_screen.dart';
import '../screens/common/login_screen.dart';
import '../screens/chairperson/cp_home.dart';
import './screens/accounts_officer/account_officer.dart';
import './screens/accounts_officer/account_home.dart';
import './screens/accounts_officer/accept_req_account.dart';
import './screens/accounts_officer/reject_req_account.dart';

// import other screens here...

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/cp_home': (context) => ChairpersonHomeScreen(),
  '/account_home': (context) => AccountHomeScreen(),
  '/review_requisition': (context) => ReviewRequisitionScreen(),
  '/approved_requisitions': (context) => ApprovedRequisitionsScreen(),
  '/rejected_requisitions': (context) => RejectedRequisitionsScreen(),
};
