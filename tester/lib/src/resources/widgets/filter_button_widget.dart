import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const FilterButtonWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.3),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        icon: Icon(icon, size: 18, color: Colors.white),
        label: Text(text, style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
