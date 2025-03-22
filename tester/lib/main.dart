import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/resources/pages/Welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}


// import 'package:tester/MainNguoiKK.dart';
// import 'package:tester/MainNhaHT.dart';
// import 'package:tester/DangKyNhap.dart';
// import 'package:tester/SharedPreferences.dart';
// import 'package:flutter/material.dart';
// import 'package:tester/MyNavigationBar.dart';
// import '../constants/MyColors.dart';
// import '../constants/MyFontSize.dart';

// import 'package:tester/XemBaiDangKhoKhan2.dart';
// import 'package:tester/Donate.dart';
// import 'package:tester/updateProfile.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:tester/models/category_data.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Thông tin chuyển khoản'),
//         backgroundColor: Colors.blue,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context); // Quay lại màn hình trước
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Ngày 14 Thg 8 2024, 20:45',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildInfoRow('Tên ngân hàng:', 'Sacombank'),
//             _buildInfoRow('Số tài khoản:', '0123456789'),
//             _buildInfoRow('Tên chủ tài khoản:', 'Nguyễn Văn A'),
//             _buildInfoRow('Số tiền ủng hộ:', '5.000 VND',
//                 valueColor: Colors.blue),
//             const SizedBox(height: 16),
//             const Text(
//               'Nội dung:',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Text(
//               'vui lòng sao chép mã dưới đây vào nội dung để chúng tôi biết bạn là người ủng hộ',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade100,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Center(
//                 child: Text(
//                   'ABKVUWDMVU8VSV7CS9f',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String value, {Color? valueColor}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Text(
//               value,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: valueColor ?? Colors.black87,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
