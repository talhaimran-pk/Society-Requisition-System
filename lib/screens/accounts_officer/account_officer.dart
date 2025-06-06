import 'package:flutter/material.dart';
import '../../widgets/custom_navbar.dart';

class ReviewRequisitionScreen extends StatefulWidget {
  const ReviewRequisitionScreen({Key? key}) : super(key: key);

  @override
  State<ReviewRequisitionScreen> createState() => _ReviewRequisitionScreenState();
}

class _ReviewRequisitionScreenState extends State<ReviewRequisitionScreen> {
  int _currentIndex = 0;
  final TextEditingController _commentController = TextEditingController();

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    // TODO: Implement navigation logic for each tab
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped tab: ${index + 1}')),
    );
  }

  void _onAccept() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Requisition Accepted!')),
    );
  }

  void _onReject() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Requisition Rejected!')),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Review Requisition', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Chairperson:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  _readonlyField('Dr Saeed'),
                  const SizedBox(height: 16),
                  const Text('Event Venue:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  _readonlyField('Biit'),
                  const SizedBox(height: 16),
                  const Text('Event Budget:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  _readonlyField('50,000 PKR'),
                  const SizedBox(height: 16),
                  const Text('Event Date', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  _readonlyField('April 3, 2025'),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00D09E),
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: _onAccept,
                          child: const Text('Accept', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: _onReject,
                          child: const Text('Reject', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Attach Comment (Optional)', style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: _commentController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        role: 'accountsOfficer',
        currentIndex: _currentIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  Widget _readonlyField(String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F9F3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        value,
        style: const TextStyle(color: Colors.black54, fontSize: 16),
      ),
    );
  }
}
