import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_colors.dart';
import '../theme/app_size.dart';

class UserProfileUpdate extends StatefulWidget {
  const UserProfileUpdate({super.key});

  @override
  _UserProfileUpdateState createState() => _UserProfileUpdateState();
}

class _UserProfileUpdateState extends State<UserProfileUpdate> {
  int _currentIndex = 3;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cccdController =
      TextEditingController(); // Thêm controller cho CCCD

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString("name") ?? "Nguyễn Đăng Khoa";
      _emailController.text =
          prefs.getString("email") ?? "2221004199@sv.ufm.edu.vn";
      _phoneController.text = prefs.getString("phone") ?? "0393416574";
      _dobController.text = prefs.getString("dob") ?? "17/12/2004";
      _cccdController.text = prefs.getString("cccd") ?? "054204003257";
    });
  }

  Future<void> _updateProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", _nameController.text);
    await prefs.setString("email", _emailController.text);
    await prefs.setString("phone", _phoneController.text);
    await prefs.setString("dob", _dobController.text);
    await prefs.setString("cccd", _cccdController.text);

    _showSuccessDialog();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "TRANG CÁ NHÂN",
                    style: TextStyle(
                      color: MyColors.shadow,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField(
                  "CCCD của bạn", _cccdController, Icons.credit_card,
                  isEditable: false),
              _buildTextField("Tên của bạn", _nameController, Icons.person),
              _buildTextField("Địa chỉ Email", _emailController, Icons.email),
              _buildTextField("Số điện thoại", _phoneController, Icons.phone,
                  isEditable: false),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: _buildTextField(
                    "Ngày sinh", _dobController, Icons.calendar_today),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Center(
                  child: Text(
                    "CẬP NHẬT CHỈNH SỬA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cập nhật chỉ mục hiện tại
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Tab_Home.png",
              width: 24,
              height: 24,
            ),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Tab_XuHuong.png",
              width: 24,
              height: 24,
            ),
            label: "Xu hướng",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Tab_ThongBao.png",
              width: 24,
              height: 24,
            ),
            label: "Thông báo",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Tab_TrangCaNhan.png",
              width: 24,
              height: 24,
            ),
            label: "Trang cá nhân",
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon,
      {bool isEditable = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: MyColors.shadow,
            fontSize: MyFontSize.body_medium,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: !isEditable, // Điều chỉnh tính chỉnh sửa của trường
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, size: 24),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: isEditable
                ? Colors.white
                : Colors.grey[300], // Làm mờ các trường không chỉnh sửa
            hintText: isEditable
                ? null
                : "Không thể sửa", // Hiển thị thông báo không thể sửa nếu trường không chỉnh sửa
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 80),
                const SizedBox(height: 10),
                const Text(
                  "Cập nhật thành công!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Thông tin của bạn đã được lưu lại.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
