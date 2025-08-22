import 'package:flutter/material.dart';
import 'package:tester/src/models/user_province.dart';

import 'package:flutter/material.dart';

class ComboBoxTinhThanh extends StatelessWidget {
  final String? selectedTinhThanh;
  final List<dynamic> provinces;
  final ValueChanged<String?> onChanged;

  const ComboBoxTinhThanh({
    super.key,
    required this.selectedTinhThanh,
    required this.provinces,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Tỉnh/Thành phố",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextSpan(
                text: " *",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedTinhThanh,
          hint: const Text("Chọn tỉnh/thành"),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          items: provinces.map((province) {
            return DropdownMenuItem<String>(
              value: province.tenTinhThanh,
              child: Row(
                children: [
                  const Icon(Icons.location_city, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(province.tenTinhThanh),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
