import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/widgets/custom_text_field.dart';
import '/widgets/password_field.dart';
import '/widgets/custom_button.dart';
import '/widgets/custom_toggle.dart';
import '/models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  // Dummy user
  final User dummyUser = User(
    id: '1',
    name: 'Jamil Sawar',
    email: 'jamil@123.com',
    designation: 'C.P Programming Society',
    profilePictureUrl: '', // leave empty or provide a dummy URL
    role: UserRole.chairperson,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FFF3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                color: Color(0xFF00D09E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF093030),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email Address',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 20),
                    PasswordField(controller: passwordController),
                    const SizedBox(height: 10),
                    CustomToggle(
                      value: rememberMe,
                      label: 'Remember Me',
                      onChanged: (val) {
                        setState(() {
                          rememberMe = val;
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomButton(text: 'Log In', onPressed: _handleLogin),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == 'account@gmail.com' && password == '1234') {
      final prefs = await SharedPreferences.getInstance();
      if (rememberMe) {
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('userRole', 'AccountOfficer');
      }
      debugPrint('Login successful for Account Officer');
      Navigator.pushReplacementNamed(context, '/account_home');
      return;
    }

    if (email == dummyUser.email && password == '1234') {
      final prefs = await SharedPreferences.getInstance();
      if (rememberMe) {
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('userRole', _mapRoleToString(dummyUser.role));
      }
      debugPrint('Login successful for ${dummyUser.name}');
      Navigator.pushReplacementNamed(
        context,
        _getHomeRoute(_mapRoleToString(dummyUser.role)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  String _mapRoleToString(UserRole role) {
    switch (role) {
      case UserRole.chairperson:
        return 'Chairperson';
      case UserRole.studentAffairs:
        return 'StudentAffairs';
      case UserRole.accountsOfficer:
        return 'AccountOfficer';
      case UserRole.staffHead:
        return 'StaffHead';
      case UserRole.itHead:
        return 'ITHead';
    }
  }

  String _getHomeRoute(String role) {
    switch (role) {
      case 'Chairperson':
        return '/cp_home';
      case 'StudentAffairs':
        return '/sa_home';
      case 'AccountOfficer':
        return '/account_home';
      case 'StaffHead':
        return '/staff_home';
      case 'ITHead':
        return '/it_home';
      default:
        return '/login';
    }
  }
}
