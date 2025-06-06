import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart';

class RejectOfficeRequisitionsScreen extends StatefulWidget {
  const RejectOfficeRequisitionsScreen({Key? key}) : super(key: key);

  @override
  State<RejectOfficeRequisitionsScreen> createState() => _RejectOfficeRequisitionsScreenState();
}

class _RejectOfficeRequisitionsScreenState extends State<RejectOfficeRequisitionsScreen> {
  int _currentIndex = 2;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _requisitions = [
    {'name': 'Event 1', 'date': '20/05/25'},
    {'name': 'Event 4', 'date': '22/05/25'},
    {'name': 'Event 10', 'date': '22/05/25'},
    {'name': 'Event 15', 'date': '22/05/25'},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
      // TODO: Implement navigation logic for each tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECFFF7),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.only(left: 8, right: 20, top: 16, bottom: 16),
              color: const Color(0xFF00D09E),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 22),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: 8),
                      const Text('Rejected\nOffice Requisitions',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 90,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDFF7ED),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                style: const TextStyle(fontSize: 15),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                  border: InputBorder.none,
                                  hintText: '',
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Icon(Icons.search, size: 18, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications_none, color: Colors.black, size: 26),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFECFFF7),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFDFF7ED),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: _requisitions.length,
                        separatorBuilder: (context, index) => const Divider(height: 0, color: Color(0xFFE0E0E0)),
                        itemBuilder: (context, index) {
                          final req = _requisitions[index];
                          final bool isEven = index % 2 == 0;
                          return Container(
                            color: isEven ? const Color(0xFFDFF7ED) : Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(req['name']!, style: const TextStyle(fontSize: 15)),
                                Text(req['date']!, style: const TextStyle(fontSize: 15)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        role: 'accountsOfficer',
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
