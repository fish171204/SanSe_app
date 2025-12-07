import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tester/src/views/ayns/GD1.dart';
import 'package:tester/src/views/ayns/XemBaiDemo.dart';
import 'package:tester/src/views/ayns/post_video_test_id1.dart';
import 'package:tester/src/views/ayns/post_video_test_id2.dart';
import 'package:tester/src/views/ayns/post_video_test_id3.dart';
import 'package:tester/src/views/ayns/post_video_test_id4.dart';
import 'package:tester/src/views/ayns/post_video_test_id5.dart';
import 'package:tester/src/views/ayns/post_video_test_id6.dart';
import 'package:tester/src/views/ayns/post_video_test_id7.dart';
import 'package:tester/src/views/ayns/post_video_test_id8.dart';
import 'package:tester/src/views/post/post_needy_detail_test.dart';

// --- 1. ENUM DANH HIỆU TỪ THIỆN ---
enum DonationRank {
  bronze("Người Bạn Đồng Hành", Color(0xFFCD7F32), 0),
  silver("Tấm Lòng Vàng", Color(0xFF9E9E9E), 10000000), // Bạc
  gold("Quý Ông Thiện Nguyện", Color(0xFFFFD700), 50000000), // Vàng
  platinum("Đại Sứ Nhân Ái", Color(0xFFE5E4E2), 200000000), // Bạch kim
  diamond("Trái Tim Kim Cương", Color(0xFF00BFFF), 500000000); // Kim cương

  final String title;
  final Color color;
  final double minAmount;

  const DonationRank(this.title, this.color, this.minAmount);
}

// --- 2. MODEL DỮ LIỆU ---
class MapCampaignModel {
  final String id;
  final String title;
  final String imageUrl;
  final int supportCount;
  final int daysLeft;
  final String raisedAmount;
  final double progress;
  late final String userDonatedAmount;
  final String? donationDate;

  // Getter để parse date cho việc lọc
  DateTime? get parsedDate {
    if (donationDate == null) return null;
    try {
      return DateFormat('dd/MM/yyyy').parse(donationDate!);
    } catch (e) {
      return null;
    }
  }

  MapCampaignModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.supportCount,
    required this.daysLeft,
    required this.raisedAmount,
    required this.progress,
    this.donationDate,
  }) {
    userDonatedAmount = _calculateUserDonation(raisedAmount, progress);
  }

  String _calculateUserDonation(
      String raisedAmountStr, double progressPercent) {
    try {
      String cleanAmount =
          raisedAmountStr.replaceAll('.', '').replaceAll('đ', '').trim();
      double totalAmount = double.parse(cleanAmount);
      double donatedValue = totalAmount * (progressPercent / 100);
      final currencyFormatter = NumberFormat('#,###', 'vi_VN');
      return "${currencyFormatter.format(donatedValue)} đ";
    } catch (e) {
      return "0 đ";
    }
  }
}

class HistoryCampaignScreen extends StatefulWidget {
  const HistoryCampaignScreen({super.key});

  @override
  State<HistoryCampaignScreen> createState() => _HistoryCampaignScreenState();
}

class _HistoryCampaignScreenState extends State<HistoryCampaignScreen> {
  final Color primaryColor = const Color(0xFF0288D1);
  final Color backgroundColor = const Color(0xFFF5F7FA);

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  String _selectedTimeFilter = "Tất cả";
  DateTime? _startDate;
  DateTime? _endDate;

  final List<MapCampaignModel> allDonations = [
    MapCampaignModel(
      id: '12',
      title: 'Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan',
      imageUrl: 'assets/images/HinhAnh_Demo.jpg',
      supportCount: 1,
      daysLeft: 20,
      raisedAmount: '5.000.000 đ',
      progress: 100.0,
      donationDate: '12/12/2025',
    ),
    MapCampaignModel(
      id: '1',
      title: 'Trái tim cho em An',
      imageUrl: 'assets/videos/image_1.png',
      supportCount: 1,
      daysLeft: 23,
      raisedAmount: '15.500.000 đ',
      progress: 19.3,
      donationDate: '20/11/2025',
    ),
    MapCampaignModel(
      id: '2',
      title: 'Mái ấm cho em',
      imageUrl: 'assets/videos/image_2.png',
      supportCount: 1,
      daysLeft: 36,
      raisedAmount: '18.000.000 đ',
      progress: 72.0,
      donationDate: '18/11/2025',
    ),
    MapCampaignModel(
      id: '3',
      title: 'Hỗ trợ sinh hoạt phí & sửa lều',
      imageUrl: 'assets/videos/image_3.png',
      supportCount: 1,
      daysLeft: 38,
      raisedAmount: '4.200.000 đ',
      progress: 84.0,
      donationDate: '15/11/2025',
    ),
    MapCampaignModel(
      id: '8',
      title: 'Gánh hàng rong của Ngoại',
      imageUrl: 'assets/videos/image_8.png',
      supportCount: 1,
      daysLeft: 39,
      raisedAmount: '2.000.000 đ',
      progress: 10.0,
      donationDate: '12/11/2025',
    ),
    MapCampaignModel(
      id: '5',
      title: 'Hỗ trợ sinh hoạt phí tuổi già',
      imageUrl: 'assets/videos/image_5.png',
      supportCount: 1,
      daysLeft: 33,
      raisedAmount: '8.500.000 đ',
      progress: 75.0,
      donationDate: '10/01/2025',
    ),
    MapCampaignModel(
      id: '4',
      title: 'Giúp cụ Lành nuôi con bại liệt',
      imageUrl: 'assets/videos/image_4.png',
      supportCount: 1,
      daysLeft: 22,
      raisedAmount: '20.000.000 đ',
      progress: 60.0,
      donationDate: '05/11/2025',
    ),
    MapCampaignModel(
      id: '6',
      title: 'Giúp ông cụ bán vé số',
      imageUrl: 'assets/videos/image_6.png',
      supportCount: 1,
      daysLeft: 15,
      raisedAmount: '12.500.000 đ',
      progress: 31.2,
      donationDate: '01/11/2025',
    ),
    MapCampaignModel(
      id: '7',
      title: 'Tiếp sức mưu sinh',
      imageUrl: 'assets/videos/image_7.png',
      supportCount: 1,
      daysLeft: 31,
      raisedAmount: '20.000.000 đ',
      progress: 20.0,
      donationDate: '28/11/2025',
    ),
    MapCampaignModel(
      id: '9',
      title: '3 cha con sống trong căn nhà 2m2',
      imageUrl: 'assets/images/nguoikhokhan1.jpg',
      supportCount: 1,
      daysLeft: 20,
      raisedAmount: '20.000.000 đ',
      progress: 20.0,
      donationDate: '25/11/2025',
    ),
    MapCampaignModel(
      id: '10',
      title: 'Cụ bà 90 tuổi bị 4 con bỏ rơi, tự bò ngoài đường...',
      imageUrl: 'assets/images/nguoikhokhan8.jpg',
      supportCount: 1,
      daysLeft: 44,
      raisedAmount: '10.000.000 đ',
      progress: 10.0,
      donationDate: '20/11/2025',
    ),
    MapCampaignModel(
      id: '11',
      title: 'Mẹ già 80 tuổi còng lưng chăm con trai suy thận',
      imageUrl: 'assets/images/nguoikhokhan9.jpg',
      supportCount: 1,
      daysLeft: 22,
      raisedAmount: '40.000.000 đ',
      progress: 5.0,
      donationDate: '15/11/2025',
    ),
  ];

  // --- HÀM CHUYỂN TRANG CHI TIẾT ---
  void _navigateToDetail(BuildContext context, String id) {
    Widget? page;
    switch (id) {
      case '1':
        page = const PostVideoTestPageId1();
        break;
      case '2':
        page = const PostVideoTestPageId2();
        break;
      case '3':
        page = const PostVideoTestPageId3();
        break;
      case '4':
        page = const PostVideoTestPageId4();
        break;
      case '5':
        page = const PostVideoTestPageId5();
        break;
      case '6':
        page = const PostVideoTestPageId6();
        break;
      case '7':
        page = const PostVideoTestPageId7();
        break;
      case '8':
        page = const PostVideoTestPageId8();
        break;
      case '9':
        page = const XemBaiDangKhoKhan2();
        break;
      case '10':
        page = const XemBaiDemo();
        break;
      case '12':
        page = const GD1();
        break;
      default:
        // Xử lý nếu id không tồn tại trong danh sách
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Chi tiết chiến dịch chưa khả dụng")),
        );
        return;
    }

    // Thực hiện chuyển trang nếu page không null
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page!),
    );
  }

  double _calculateTotalLifetimeDonation() {
    double total = 0;
    for (var item in allDonations) {
      if (item.userDonatedAmount.isNotEmpty) {
        String cleanAmount = item.userDonatedAmount
            .replaceAll('.', '')
            .replaceAll(' đ', '')
            .trim();
        total += double.tryParse(cleanAmount) ?? 0;
      }
    }
    return total;
  }

  DonationRank _calculateRank(double totalAmount) {
    if (totalAmount >= DonationRank.diamond.minAmount) {
      return DonationRank.diamond;
    }
    if (totalAmount >= DonationRank.platinum.minAmount) {
      return DonationRank.platinum;
    }
    if (totalAmount >= DonationRank.gold.minAmount) return DonationRank.gold;
    if (totalAmount >= DonationRank.silver.minAmount)
      return DonationRank.silver;
    return DonationRank.bronze;
  }

  // --- LOGIC LỌC DỮ LIỆU ---
  List<MapCampaignModel> get _filteredList {
    return allDonations.where((item) {
      // 1. Lọc theo Search Text
      bool matchesSearch =
          item.title.toLowerCase().contains(_searchQuery.toLowerCase());
      if (!matchesSearch) return false;

      // 2. Lọc theo Thời gian
      if (_selectedTimeFilter == "Tất cả") return true;

      final date = item.parsedDate;
      if (date == null) return false;

      const currentYear = 2025;
      const currentMonth = 12;

      if (_selectedTimeFilter == "Tháng này") {
        return date.month == currentMonth && date.year == currentYear;
      }

      if (_selectedTimeFilter == "Năm nay") {
        return date.year == currentYear;
      }

      // Logic lọc theo khoảng ngày tùy chỉnh
      if (_selectedTimeFilter == "Tùy chỉnh") {
        if (_startDate != null && _endDate != null) {
          DateTime itemDate = DateTime(date.year, date.month, date.day);
          DateTime start =
              DateTime(_startDate!.year, _startDate!.month, _startDate!.day);
          DateTime end =
              DateTime(_endDate!.year, _endDate!.month, _endDate!.day);

          return (itemDate.isAtSameMomentAs(start) ||
                  itemDate.isAfter(start)) &&
              (itemDate.isAtSameMomentAs(end) || itemDate.isBefore(end));
        }
      }

      return true;
    }).toList();
  }

  // --- HÀM CHỌN KHOẢNG NGÀY ---
  Future<void> _pickDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor,
            colorScheme: ColorScheme.light(primary: primaryColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
        _selectedTimeFilter = "Tùy chỉnh";
      });
    }
  }

  // --- HÀM SHOW DIALOG DANH HIỆU ---
  void _showRankInfoDialog(BuildContext context, double currentTotal) {
    final currencyFormatter = NumberFormat('#,###', 'vi_VN');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Các mốc danh hiệu"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: DonationRank.values.map((rank) {
                bool isCurrentRank = _calculateRank(currentTotal) == rank;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isCurrentRank
                        ? rank.color.withOpacity(0.1)
                        : Colors.white,
                    border: Border.all(
                      color: isCurrentRank ? rank.color : Colors.grey.shade300,
                      width: isCurrentRank ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.military_tech, color: rank.color, size: 32),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rank.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color:
                                    isCurrentRank ? rank.color : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Mục tiêu: ${currencyFormatter.format(rank.minAmount)} đ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isCurrentRank)
                        const Icon(Icons.check_circle,
                            color: Colors.green, size: 20),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Đóng"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalLifetime = _calculateTotalLifetimeDonation();
    final currentRank = _calculateRank(totalLifetime);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Hành trình nhân ái",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSummaryHeader(totalLifetime, currentRank),
          _buildFilterBar(),
          Expanded(
            child: _filteredList.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredList.length,
                    itemBuilder: (context, index) {
                      return _buildHistoryCard(_filteredList[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryHeader(double totalDonated, DonationRank rank) {
    final currencyFormatter = NumberFormat('#,###', 'vi_VN');
    String formattedTotal = "${currencyFormatter.format(totalDonated)} đ";

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tổng số tiền bạn đã chia sẻ",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 6),
                Text(
                  formattedTotal,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "${allDonations.length} hoàn cảnh đã được giúp đỡ",
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          // Bên phải: Danh hiệu
          GestureDetector(
            onTap: () => _showRankInfoDialog(context, totalDonated),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: rank.color, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: rank.color.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Icon(Icons.military_tech, color: rank.color, size: 40),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: rank.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    rank.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: rank.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Thanh công cụ lọc & tìm kiếm
  Widget _buildFilterBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: "Tìm kiếm chiến dịch...",
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                prefixIcon:
                    const Icon(Icons.search, color: Colors.grey, size: 20),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                filled: true,
                fillColor: const Color(0xFFF0F2F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Icon(Icons.filter_list, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                _buildFilterChip("Tất cả"),
                const SizedBox(width: 8),
                _buildFilterChip("Tháng này"),
                const SizedBox(width: 8),
                _buildFilterChip("Năm nay"),
                const SizedBox(width: 8),
                _buildCustomDateChip(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedTimeFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTimeFilter = label;
          _startDate = null;
          _endDate = null;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomDateChip() {
    bool isSelected = _selectedTimeFilter == "Tùy chỉnh";
    String label = "Tùy chỉnh";

    if (isSelected && _startDate != null && _endDate != null) {
      String start = DateFormat('dd/MM').format(_startDate!);
      String end = DateFormat('dd/MM').format(_endDate!);
      label = "$start - $end";
    }

    return GestureDetector(
      onTap: () {
        _pickDateRange();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade700,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 4),
              const Icon(Icons.calendar_month, color: Colors.white, size: 12),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 60, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            "Không tìm thấy kết quả nào",
            style: TextStyle(color: Colors.grey[500], fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(MapCampaignModel item) {
    bool isCompleted = item.progress >= 100;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,
                        size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 6),
                    Text(
                      item.donationDate ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.green[50] : Colors.orange[50],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isCompleted
                          ? Colors.green[200]!
                          : Colors.orange[200]!,
                      width: 0.5,
                    ),
                  ),
                  child: Text(
                    isCompleted ? "Thành công" : "Đang vận động",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color:
                          isCompleted ? Colors.green[700] : Colors.orange[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _buildImage(item.imageUrl),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1F5FE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "Bạn đã ủng hộ:",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF0277BD)),
                            ),
                            const Spacer(),
                            Text(
                              item.userDonatedAmount,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mục tiêu chiến dịch:",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    Text(
                      item.raisedAmount,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: item.progress / 100,
                    minHeight: 6,
                    backgroundColor: Colors.grey[200],
                    color: isCompleted ? Colors.green : Colors.orange,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                    // --- GỌI HÀM CHUYỂN TRANG Ở ĐÂY ---
                    onPressed: () => _navigateToDetail(context, item.id),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryColor.withOpacity(0.5)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Xem lại chiến dịch",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String url) {
    if (url.startsWith('http')) {
      return Image.network(
        url,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    } else {
      return Image.asset(
        url,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }
  }

  Widget _placeholder() {
    return Container(
      width: 90,
      height: 90,
      color: Colors.grey[200],
      child: Icon(Icons.image, color: Colors.grey[400]),
    );
  }
}
