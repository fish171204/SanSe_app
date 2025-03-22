import 'package:flutter/material.dart';
import '../../constants/MyColors.dart';
import 'package:tester/src/resources/pages/DaDuocGiup.dart';

class DsGiupDo1 extends StatefulWidget {
  const DsGiupDo1({super.key});
  @override
  _DsGiupDo1State createState() => _DsGiupDo1State();
}

class _DsGiupDo1State extends State<DsGiupDo1> {
  @override
  final List<Map<String, dynamic>> nhaHaoTamData = [
    {
      "name": "Nguyễn Đăng Khoa",
      "details": "Giúp đỡ thành công 3.000.000 VNĐ",
      "avatar":
          "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/05daa1d4-d0ac-4702-8370-3885cb2c4c6b" // Link ảnh đại diện
    },
    {
      "name": "Trương Quốc Thái",
      "details": "Giúp đỡ thành công 1.000.000 VNĐ",
      "avatar":
          "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/ca0c79b1-51ca-4d97-bff4-7d5268dc6080"
    },
    {
      "name": "Nguyễn Kim Dũng",
      "details": "Giúp đỡ thành công 1.000.000 VNĐ",
      "avatar":
          "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/aaa75e67-4385-439b-871f-1d664ebb4b48"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Loại bỏ bóng cho AppBar
        backgroundColor: Colors.blue.shade700, // Màu nền AppBar
        automaticallyImplyLeading: false, // Tùy chỉnh nút quay lại
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Quay lại màn hình trước đó
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                Navigator.pop(context); // Quay lại màn hình trước đó
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.blue, // Icon màu trắng để nổi bật
                  size: 28,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "Danh sách nhà hảo tâm",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              // Hành động cho nút yêu thích
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: MyColors.surfaceContainerLowest,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount:
                      nhaHaoTamData.length, // Số lượng phần tử trong danh sách
                  itemBuilder: (context, index) {
                    final nhaHaoTam =
                        nhaHaoTamData[index]; // Lấy dữ liệu từng mục
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(nhaHaoTam["avatar"]), // Ảnh đại diện
                          backgroundColor: Colors.grey.shade300,
                        ),
                        title: Text(
                          nhaHaoTam["name"], // Tên nhà hảo tâm
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle:
                            Text(nhaHaoTam["details"]), // Chi tiết đóng góp
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        onTap: () {
                          // Hành động khi bấm vào
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(nhaHaoTam["name"]),
                              content: Text(nhaHaoTam["details"]),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Đóng"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              // Footer
            ],
          ),
        ),
      ),
    );
  }
}



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           constraints: const BoxConstraints.expand(),
//           color: MyColors.surfaceContainerLowest,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: MyColors.surfaceContainerLowest,
//                   ),
//                   width: double.infinity,
//                   height: double.infinity,
//                   child: SingleChildScrollView(
//                       padding:
//                           const EdgeInsets.only(top: 50, left: 18, right: 18),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           IntrinsicHeight(
//                             child: Container(
//                               margin: const EdgeInsets.only(bottom: 21),
//                               width: double.infinity,
//                               child: Row(children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const Daduocgiup(), // Thay bằng tên widget của bạn
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     margin: const EdgeInsets.only(right: 26),
//                                     width: 29,
//                                     height: 28,
//                                     child: Image.network(
//                                       "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/777222d5-dde5-404d-a2b0-aadd44ac8bba",
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                                 const Expanded(
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     child: Text(
//                                       "Danh sách nhà hảo tâm",
//                                       style: TextStyle(
//                                         color: MyColors.shadow,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ]),
//                             ),
//                           ),
//                           IntrinsicHeight(
//                             child: Container(
//                               margin: const EdgeInsets.only(bottom: 30),
//                               width: double.infinity,
//                               child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                         margin:
//                                             const EdgeInsets.only(right: 16),
//                                         width: 50,
//                                         height: 50,
//                                         child: Image.network(
//                                           "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/aaa75e67-4385-439b-871f-1d664ebb4b48",
//                                           fit: BoxFit.fill,
//                                         )),
//                                     IntrinsicHeight(
//                                       child: Container(
//                                         margin: const EdgeInsets.only(
//                                             top: 9, right: 7),
//                                         width: 128,
//                                         child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 margin: const EdgeInsets.only(
//                                                     bottom: 11),
//                                                 width: double.infinity,
//                                                 child: const Text(
//                                                   "Nguyễn Kim Dũng",
//                                                   style: TextStyle(
//                                                     color: MyColors.shadow,
//                                                     fontSize: 15,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                               const SizedBox(
//                                                 width: double.infinity,
//                                                 child: Text(
//                                                   "2,000,000 VND",
//                                                   style: TextStyle(
//                                                     color: Color(0xFF675F5F),
//                                                     fontSize: 13,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]),
//                                       ),
//                                     ),
//                                     Container(
//                                         margin: const EdgeInsets.only(top: 5),
//                                         width: 24,
//                                         height: 24,
//                                         child: Image.network(
//                                           "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/c953c247-bec4-4654-a470-54d899ada733",
//                                           fit: BoxFit.fill,
//                                         )),
//                                   ]),
//                             ),
//                           ),
//                           IntrinsicHeight(
//                             child: Container(
//                               margin: const EdgeInsets.only(bottom: 32),
//                               width: double.infinity,
//                               child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                         margin:
//                                             const EdgeInsets.only(right: 16),
//                                         width: 50,
//                                         height: 50,
//                                         child: Image.network(
//                                           "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/ca0c79b1-51ca-4d97-bff4-7d5268dc6080",
//                                           fit: BoxFit.fill,
//                                         )),
//                                     IntrinsicHeight(
//                                       child: Container(
//                                         margin: const EdgeInsets.only(
//                                             top: 9, right: 6),
//                                         width: 129,
//                                         child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 margin: const EdgeInsets.only(
//                                                     bottom: 11),
//                                                 width: double.infinity,
//                                                 child: const Text(
//                                                   "Trương Quốc Thái",
//                                                   style: TextStyle(
//                                                     color: MyColors.shadow,
//                                                     fontSize: 15,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                               const SizedBox(
//                                                 width: double.infinity,
//                                                 child: Text(
//                                                   "1,000,000 VND",
//                                                   style: TextStyle(
//                                                     color: Color(0xFF675F5F),
//                                                     fontSize: 13,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]),
//                                       ),
//                                     ),
//                                     Container(
//                                         margin: const EdgeInsets.only(top: 5),
//                                         width: 24,
//                                         height: 24,
//                                         child: Image.network(
//                                           "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/9652539a-5c33-4fc1-ab72-877fdf29b698",
//                                           fit: BoxFit.fill,
//                                         )),
//                                   ]),
//                             ),
//                           ),
//                           IntrinsicHeight(
//                             child: SizedBox(
//                               width: double.infinity,
//                               child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                         margin:
//                                             const EdgeInsets.only(right: 16),
//                                         width: 50,
//                                         height: 50,
//                                         child: Image.network(
//                                           "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/05daa1d4-d0ac-4702-8370-3885cb2c4c6b",
//                                           fit: BoxFit.fill,
//                                         )),
//                                     IntrinsicHeight(
//                                       child: Container(
//                                         margin: const EdgeInsets.only(
//                                             top: 9, right: 5),
//                                         width: 137,
//                                         child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 margin: const EdgeInsets.only(
//                                                     bottom: 11),
//                                                 width: double.infinity,
//                                                 child: const Text(
//                                                   "Nguyễn Đăng Khoa",
//                                                   style: TextStyle(
//                                                     color: MyColors.shadow,
//                                                     fontSize: 15,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                               const SizedBox(
//                                                 width: double.infinity,
//                                                 child: Text(
//                                                   "2,000,000 VND",
//                                                   style: TextStyle(
//                                                     color: Color(0xFF675F5F),
//                                                     fontSize: 13,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ]),
//                                       ),
//                                     ),
//                                     Container(
//                                         margin: const EdgeInsets.only(top: 5),
//                                         width: 24,
//                                         height: 24,
//                                         child: Image.network(
//                                           "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/2faa319b-c25e-4e51-98bd-2aed5c63f0fd",
//                                           fit: BoxFit.fill,
//                                         )),
//                                   ]),
//                             ),
//                           ),
//                         ],
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
