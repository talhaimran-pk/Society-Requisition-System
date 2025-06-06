import 'package:flutter/material.dart';
import '../../widgets/custom_navbar.dart';

class ApprovedRequisitionsScreen extends StatefulWidget {
  const ApprovedRequisitionsScreen({Key? key}) : super(key: key);

  @override
  State<ApprovedRequisitionsScreen> createState() => _ApprovedRequisitionsScreenState();
}

class _ApprovedRequisitionsScreenState extends State<ApprovedRequisitionsScreen> {
  int _currentIndex = 3;
  String _search = '';

  final List<Map<String, String>> requisitions = [
    {'name': 'Event 3', 'date': '20/05/25'},
    {'name': 'Event 7', 'date': '26/05/25'},
    {'name': 'Event 9', 'date': '24/05/25'},
    {'name': 'Event 13', 'date': '28/05/25'},
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = requisitions.where((req) => req['name']!.toLowerCase().contains(_search.toLowerCase())).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
        title: Row(
          children: [
            const Text('Approved\nRequisitions', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.search, color: Colors.black54),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TextField(
                        onChanged: (val) => setState(() => _search = val),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        toolbarHeight: 70,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 8),
        decoration: const BoxDecoration(
          color: Color(0xFFE6F9F3),
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: const [
                  Expanded(
                    child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, i) {
                  final req = filtered[i];
                  return Container(
                    color: i % 2 == 0 ? const Color(0xFFD6F5E6) : Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    child: Row(
                      children: [
                        Expanded(child: Text(req['name']!, style: const TextStyle(fontSize: 16))),
                        Expanded(child: Text(req['date']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        role: 'accountsOfficer',
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
      ),
    );
  }
}
