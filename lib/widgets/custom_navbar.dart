import 'package:flutter/material.dart'; // Add more screens as needed

class CustomBottomNavBar extends StatelessWidget {
  final String role; // The role passed dynamically
  final int currentIndex; // The current selected index
  final ValueChanged<int> onTap; // Callback to handle item tap

  const CustomBottomNavBar({
    required this.role,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items;

    // Dynamically create navigation items based on the role
    if (role == 'chairperson' ||
        role == 'studentAffairs') {
      // These roles will have 3 items (for example)
      items = [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        const BottomNavigationBarItem(
          icon: Icon(Icons.pending),
          label: 'Status',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'All'),
      ];
    } else if (role == 'accountsOfficer') {
      items = [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        const BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Accept'),
        const BottomNavigationBarItem(icon: Icon(Icons.cancel), label: 'Reject'),
      ];
    } else {
      // Default roles with only 2 items
      items = [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Reports',
        ),
      ];
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: items,
      currentIndex: currentIndex, // Highlight the selected index
      onTap: (index) {
        // Call the provided onTap to update the selected index
        onTap(index);
      },
    );
  }
}
