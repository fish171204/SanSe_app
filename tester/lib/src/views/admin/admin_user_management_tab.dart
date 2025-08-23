import 'package:flutter/material.dart';

class UserManagementTab extends StatefulWidget {
  final List<Map<String, dynamic>> users; 

  const UserManagementTab({super.key, required this.users});

  @override
  _UserManagementTabState createState() => _UserManagementTabState();
}

class _UserManagementTabState extends State<UserManagementTab> {
  int _filterDays = 0;

  int _calculateDaysInactive(String lastLoginDate) {
    DateTime lastLogin = DateTime.parse(lastLoginDate);
    DateTime now = DateTime.now();
    return now.difference(lastLogin).inDays;
  }

  List<Map<String, dynamic>> _getFilteredUsers() {
    return widget.users.where((user) {
      int daysInactive = _calculateDaysInactive(user['lastLoginDate']);
      return daysInactive >= _filterDays;
    }).toList();
  }

  void _deleteUser(int index) {
    String userName = widget.users[index]['name'];
    String userCCCD = widget.users[index]['cccd'];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Xác nhận xóa"),
        content: Text("Bạn có chắc muốn xóa $userName không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.users.removeAt(index);
              });
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 300), () {
                _showSuccessDialog(userName, userCCCD);
              });
            },
            child: const Text("Xóa", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

// Hiển thị thông báo xóa thành công với icon
  void _showSuccessDialog(String name, String cccd) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 60,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Xóa người dùng thành công!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "Người dùng: $name\nCCCD: $cccd",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Hàm để tạm khóa người dùng với thông báo xác nhận
  void _suspendUser(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Xác nhận tạm khóa"),
        content: Text(
            "Bạn có chắc muốn tạm khóa ${widget.users[index]['name']} không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.users[index]['status'] = 'Tạm khóa';
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Tạm khóa người dùng thành công")),
              );
            },
            child:
                const Text("Tạm khóa", style: TextStyle(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  // Hàm mở khóa người dùng
  void _unlockUser(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Xác nhận mở khóa"),
        content: Text(
            "Bạn có chắc muốn mở khóa ${widget.users[index]['name']} không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.users[index]['status'] = 'Hoạt động';
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Mở khóa người dùng thành công")),
              );
            },
            child: const Text("Mở khóa", style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Bộ lọc số ngày không hoạt động
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Lọc theo số ngày hoạt động:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 10),
              DropdownButton<int>(
                value: _filterDays,
                onChanged: (newValue) {
                  setState(() {
                    _filterDays = newValue!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: 0,
                    child: Text('Tất cả người dùng'),
                  ),
                  DropdownMenuItem(
                    value: 30,
                    child: Text('30 ngày trở đi'),
                  ),
                  DropdownMenuItem(
                    value: 60,
                    child: Text('60 ngày trở đi'),
                  ),
                  DropdownMenuItem(
                    value: 90,
                    child: Text('90 ngày trở đi'),
                  ),
                  DropdownMenuItem(
                    value: 365,
                    child: Text('1 năm trở đi'),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Danh sách người dùng sau khi lọc
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            itemCount: _getFilteredUsers().length,
            itemBuilder: (context, index) {
              Map<String, dynamic> user = _getFilteredUsers()[index];
              int daysInactive = _calculateDaysInactive(user['lastLoginDate']);

              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(user['avatar']),
                  ),
                  title: Text(
                    user['name']!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CCCD: ${user['cccd']}"),
                      Row(
                        children: [
                          const Text("Trạng thái: "),
                          Text(
                            user['status'] ?? 'Hoạt động',
                            style: TextStyle(
                              color:
                                  (user['status'] ?? 'Hoạt động') == 'Hoạt động'
                                      ? Colors.green
                                      : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text("Số ngày không hoạt động: $daysInactive ngày"),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'delete') {
                        _deleteUser(index);
                      } else if (value == 'suspend') {
                        _suspendUser(index);
                      } else if (value == 'unlock') {
                        _unlockUser(index);
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Text('Xóa'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'suspend',
                        child: Text('Tạm khóa'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'unlock',
                        child: Text('Mở khóa'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
