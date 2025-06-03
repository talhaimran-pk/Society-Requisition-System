import 'package:flutter/material.dart';
// import '/widgets/custom_navbar.dart';

class ChairpersonDashboardScreen extends StatelessWidget {
  const ChairpersonDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      appBar: CustomAppBar(),
      // bottomNavigationBar: const CustomBottomNavBar(
      //   role: 'chairperson',
      //   currentIndex: 0,
      // ),
      backgroundColor: const Color(0xFFF1FFF3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hi, Jamil',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text('Good Day', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),

              CreateEventButton(
                onPressed: () {
                  // TODO: handle create event action
                },
              ),

              const SizedBox(height: 20),

              RecentRequestsCard(
                requests: [
                  {'title': 'TechFest', 'status': 'approved'},
                  {'title': 'Seminar', 'status': 'pending'},
                  {'title': 'Industrial Visit', 'status': 'rejected'},
                ],
              ),

              const SizedBox(height: 20),

              SummaryCard(approved: 5, rejected: 3, pending: 2),
            ],
          ),
        ),
      ),
    );
  }
}

// class DashboardTile extends StatelessWidget {
//   final String title;
//   final int count;
//   final IconData icon;
//   final Color color;

//   const DashboardTile({
//     required this.title,
//     required this.count,
//     required this.icon,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 3,
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: color,
//           child: Icon(icon, color: Colors.white),
//         ),
//         title: Text(title),
//         trailing: Text(
//           '$count',
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

// TODO: Build these widgets below one by one
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF00D09E),
      elevation: 0,
      title: const Text(''),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {
            // TODO: handle notifications
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF00D09E)),
            accountName: const Text('Jamil Sawar'),
            accountEmail: const Text('jamil@123.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/profile_pic.png',
              ), // replace with your asset
            ),
            otherAccountsPictures: [
              Text(
                'C.P Programming Society',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            onTap: () {
              // TODO: handle contact
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // TODO: handle logout
            },
          ),
        ],
      ),
    );
  }
}

class CreateEventButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateEventButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFEFFAF3),
        foregroundColor: const Color(0xFF093030),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      icon: const Icon(Icons.add_circle_outline),
      label: const Text('Create New Event Request'),
      onPressed: onPressed,
    );
  }
}

class RecentRequestsCard extends StatelessWidget {
  final List<Map<String, String>> requests;

  const RecentRequestsCard({required this.requests});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color(0xFF00D09E),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Requests',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ...requests.map(
              (req) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '- ${req['title']}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Status: ${_statusIcon(req['status'])}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _statusIcon(String? status) {
    switch (status) {
      case 'approved':
        return '✔';
      case 'pending':
        return '?';
      case 'rejected':
        return '✖';
      default:
        return '';
    }
  }
}

class SummaryCard extends StatelessWidget {
  final int approved;
  final int rejected;
  final int pending;

  const SummaryCard({
    required this.approved,
    required this.rejected,
    required this.pending,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Summary',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text('Total: ${approved + rejected + pending}'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [Text('Approved'), Text('$approved')]),
                const VerticalDivider(),
                Column(children: [Text('Rejected'), Text('$rejected')]),
                const VerticalDivider(),
                Column(children: [Text('Pending'), Text('$pending')]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
