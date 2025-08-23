import 'package:flutter/material.dart';

class BuildComboBoxDistrict extends StatelessWidget {
  final String? selectedQuanHuyen;
  final String? selectedTinhThanh;
  final List<dynamic> danhSachQuanHuyen;
  final List<dynamic> provinces;
  final ValueChanged<String?> onChanged;

  const BuildComboBoxDistrict({
    super.key,
    required this.selectedQuanHuyen,
    required this.selectedTinhThanh,
    required this.danhSachQuanHuyen,
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
                text: "Quận/Huyện",
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
          value: selectedQuanHuyen,
          hint: const Text("Chọn quận/huyện"),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          items: selectedTinhThanh != null
              ? [
                  ...danhSachQuanHuyen
                      .where((quanHuyen) =>
                          quanHuyen.maTinhThanh ==
                          provinces
                              .firstWhere(
                                (province) =>
                                    province.tenTinhThanh == selectedTinhThanh,
                              )
                              .maTinhThanh)
                      .map((quanHuyen) {
                    return DropdownMenuItem<String>(
                      value: quanHuyen.tenQuanHuyen,
                      child: Row(
                        children: [
                          const Icon(Icons.location_city, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(quanHuyen.tenQuanHuyen),
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
