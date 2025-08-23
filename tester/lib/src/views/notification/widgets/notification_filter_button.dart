import 'package:flutter/material.dart';

class NotificationFilterButton extends StatelessWidget {
  final VoidCallback onTap;

  const NotificationFilterButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFAFCEFF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFE7F0FF),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: 20,
              height: 20,
              child: Image.asset(
                "assets/images/danhmuc.png",
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              "Bộ lọc",
              style: TextStyle(
                color: Color(0xFF0866FF),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
