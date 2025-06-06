import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart';

class ReviewRequisitionScreen extends StatefulWidget {
  const ReviewRequisitionScreen({Key? key}) : super(key: key);

  @override
  State<ReviewRequisitionScreen> createState() => _ReviewRequisitionScreenState();
}

class _ReviewRequisitionScreenState extends State<ReviewRequisitionScreen> {
  int _currentIndex = 2;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
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
                      const Text('Review\nRequisition',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications_none, color: Colors.black, size: 26),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  color: const Color(0xFFECFFF7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label('Chairperson:'),
                      _readonlyField('Dr Saeed'),
                      _label('Event Venue:'),
                      _readonlyField('Biit'),
                      _label('Event Budget:'),
                      _readonlyField('50,000 PKR'),
                      _label('Event Date'),
                      _readonlyField('April 3, 2025'),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _actionButton('Accept', const Color(0xFF00D09E), Colors.white, () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Accepted')));
                          }),
                          const SizedBox(width: 18),
                          _actionButton('Reject', const Color(0xFFFF4B4B), Colors.white, () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Rejected')));
                          }),
                        ],
                      ),
                      const SizedBox(height: 18),
                      const Text('Attach Comment (Optional)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFDFF7ED),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: TextField(
                          controller: _commentController,
                          maxLines: 3,
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                        ),
                      ),
                    ],
                  ),
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

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }

  Widget _readonlyField(String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFDFF7ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }

  Widget _actionButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return SizedBox(
      width: 120,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
        ),
      ),
    );
  }
}
