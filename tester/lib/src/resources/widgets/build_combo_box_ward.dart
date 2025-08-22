import 'package:flutter/material.dart';

import 'package:tester/src/models/user_district.dart';
import 'package:tester/src/models/user_ward.dart';
import 'package:tester/src/models/user_province.dart';

class BuildComboBoxWard extends StatelessWidget {
  final String? selectedPhuongXa;
  final String? selectedQuanHuyen;
  final List<dynamic> phuongXaList;
  final List<dynamic> danhSachQuanHuyen;
  final ValueChanged<String?> onChanged;

  const BuildComboBoxWard({
    super.key,
    required this.selectedPhuongXa,
    required this.selectedQuanHuyen,
    required this.phuongXaList,
    required this.danhSachQuanHuyen,
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
                text: "Phường/Xã",
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
          value: selectedPhuongXa,
          hint: const Text("Chọn phường/xã"),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          items: selectedQuanHuyen != null
              ? [
                  ...phuongXaList
                      .where((phuongXa) =>
                          phuongXa.maQuanHuyen ==
                          danhSachQuanHuyen
                              .firstWhere(
                                (quanHuyen) =>
                                    quanHuyen.tenQuanHuyen == selectedQuanHuyen,
                              )
                              .maQuanHuyen)
                      .map((phuongXa) {
                    return DropdownMenuItem<String>(
                      value: phuongXa.tenPhuongXa,
                      child: Row(
                        children: [
                          const Icon(Icons.location_city, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(phuongXa.tenPhuongXa),
                        ],
                      ),
                    );
                  })
                ]
              : [],
          onChanged: onChanged,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
