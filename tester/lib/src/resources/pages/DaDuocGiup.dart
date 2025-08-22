import 'package:tester/src/resources/pages/DsGiupDo1.dart';
import 'package:flutter/material.dart';

class Daduocgiup extends StatelessWidget {
  const Daduocgiup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFFFFFFFF),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 28, right: 7),
                            height: 230,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/nguoikhokhan4.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 94, left: 25),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(
                                                  context); // Quay lại màn hình trước đó
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 12),
                                              width: 35,
                                              height: 32,
                                              child: Image.asset(
                                                "assets/quaylai.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: SizedBox(),
                                            ),
                                          ),
                                          IntrinsicHeight(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xFFE9E9E9),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              width: 150,
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Bệnh hiểm nghèo",
                                                    style: TextStyle(
                                                      color: Color(0xFFFF0303),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFEAEAEA),
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 7, bottom: 7, left: 10, right: 10),
                                    margin: const EdgeInsets.only(left: 260),
                                    width: 150,
                                    height: 36,
                                    child: Row(children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 14,
                                          height: 20,
                                          child: Image.asset(
                                            "assets/location.png",
                                            fit: BoxFit.fill,
                                          )),
                                      const Expanded(
                                        child: IntrinsicHeight(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "Thừa Thiên Huế",
                                              style: TextStyle(
                                                color: Color(0xFFFF0303),
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ]),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              color: const Color(0xFFE9E9E9),
                              padding: const EdgeInsets.only(
                                  top: 16, bottom: 16, left: 23, right: 23),
                              margin: const EdgeInsets.only(bottom: 15),
                              width: double.infinity,
                              child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "XIN GIÚP ĐỠ KINH PHÍ CHỮA BỆNH CHO EM NGUYỄN VĂN HIẾU , 16 TUỔI",
                                        style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 8, left: 14, right: 14),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 11),
                                    width: 42,
                                    height: 40,
                                    child: Image.asset(
                                      "assets/onghuy.png",
                                      fit: BoxFit.fill,
                                    )),
                                IntrinsicHeight(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 70),
                                    width: 153,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 5),
                                            child: const Text(
                                              "Nguyễn Trí Khang",
                                              style: TextStyle(
                                                color: Color(0xFF0866FF),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 6),
                                            child: Row(
                                              mainAxisSize: MainAxisSize
                                                  .min, // This ensures the row takes the minimum space required by its children
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.asset(
                                                    "assets/dahoanthanh.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    width:
                                                        5), // Space between the image and the text
                                                const Text(
                                                  "Đã hoàn thành",
                                                  style: TextStyle(
                                                    color: Color(0xFFFF0303),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                    width: 40,
                                    height: 38,
                                    child: Image.asset(
                                      "assets/zalo.png",
                                      fit: BoxFit.fill,
                                    )),
                              ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 0, left: 65, right: 30),
                              width: double.infinity,
                              child: const Row(children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SizedBox(),
                                  ),
                                ),
                                IntrinsicHeight(
                                  child: Text(
                                    "Thông tin liên lạc",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, left: 66),
                            child: const Text(
                              "Tiền mặt: 5,000,000 VND",
                              style: TextStyle(
                                color: Color(0xFF675F5F),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, left: 66),
                            child: const Text(
                              "Ngày đăng: 30/03/2025",
                              style: TextStyle(
                                color: Color(0xFF675F5F),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, left: 66),
                            child: const Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Ensures the row sizes based on its children
                              children: [
                                Text(
                                  "Thời gian: 20 ngày",
                                  style: TextStyle(
                                    color: Color(0xFF675F5F),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        5), // Space between the text and the icon
                                Icon(
                                  Icons.access_time, // Time icon
                                  color: Color(
                                      0xFF675F5F), // Same color as the text
                                  size: 20, // Icon size
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Chuyển đến màn hình Donate khi nhấn vào bất kỳ thành phần nào trong IntrinsicHeight
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DsGiupDo1()),
                              );
                            },
                            child: IntrinsicHeight(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF3555FF),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                margin: const EdgeInsets.only(
                                    bottom: 18, left: 20, right: 20),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IntrinsicHeight(
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        child: const Text(
                                          "Thông tin nhà hảo tâm",
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14,
                                      height: 12,
                                      child: Image.asset(
                                        "assets/giupdo.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 17, left: 14),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Mô tả hoàn cảnh:\n",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Kính gửi Quý Nhà Hảo Tâm, tôi đại diện xin kêu gọi sự giúp đỡ của quý nhà hảo tâm đến hoàn cảnh của Em Nguyễn Văn Hiếu sinh năm 2008 16 tuổi Ở tại thôn k4 xã hương Phú huyện Nam Đông tỉnh Thừa -Thiên -Huế . Một tuổi trẻ với biết bao ước mơ cho tương lai , 1 chỗ dựa cho cha mẹ lúc về già ,nhưng nay thật k may e ấy đã mắc phải căng bệnh ung thư xương phải cắt bỏ chân trái nên những ngày tháng của tương lai còn gặp nhiều khó khăn !!! E nghĩ học năm mới học lớp 7 để theo vào nam làm dàn kính , trong quá trình làm việc thì bị ngã dàn rạn sương sườn k đi làm được nữa nên phải trở về quê . khi về quê thì e có đc ng anh thấy thương nên cưu mang cho về học nghề sữa xe máy tại Vinh An,đang học được khoảng 1 năm thì e ấy thấy trong xương hay đau nhức , nên đã đi khám trong quá trình thăm khám và nhiều lần thăm khám từ bệnh viện tuyến huyện qua tuyến tỉnh thì e ấy được kết luận là bị ung thư xương ,sau gần 2 năm điều trị bằng nhiều phương pháp hóa trị cùng với nhiều lần mổ ,và thăm khám ở bệnh viện tỉnh nhưng vẫn k có dấu hiệu hồi phục thì đến nay bác sĩ đưa ra kết luận là phải cắt bỏ chân trái . Đối với 1 con ng đang tuổi trẻ với biết bao nhiêu mơ ước mà nay vì bệnh tật nên phải đành như vậy thì thật là khó khăn ,xót xa và thương cho e ấy .. ",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
