import 'package:flutter/material.dart';
import '/widgets/custom_navbar.dart';
import 'cp_dashboard.dart';
// Import other necessary screens

class ChairpersonHomeScreen extends StatefulWidget {
  @override
  _ChairpersonHomeScreenState createState() => _ChairpersonHomeScreenState();
}

class _ChairpersonHomeScreenState extends State<ChairpersonHomeScreen> {
  int _selectedIndex = 0;

  // Define the screens dynamically here
  final List<Widget> _screens = [
    ChairpersonDashboardScreen(),
    ChairpersonDashboardScreen(),
    ChairpersonDashboardScreen(),
    // Add more screens as needed for the chairperson role
  ];

  // Handle the index change when a bottom nav item is tapped
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // Displays the selected screen
        children: _screens, // List of screens to show based on selection
      ),
      bottomNavigationBar: CustomBottomNavBar(
        role: "chairperson", // Pass role dynamically to navbar
        currentIndex: _selectedIndex, // Provide the current index
        onTap: _onNavItemTapped, // Handle navigation item tap
      ),
    );
  }
}
