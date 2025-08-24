import 'package:flutter/material.dart';

class MsgDialog {
  static void showMsgDialog(BuildContext context, String title, String msg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(msg),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(MsgDialog());
                    },
                    child: const Text("OK"))
              ],
            ));
  }
}



// AlertDialog là một hộp thoại cảnh báo (popup) trong Flutter, hiển thị trên màn hình để thông báo hoặc yêu cầu xác nhận từ người dùng. Nó thường được sử dụng để:

// ✅ Hiển thị cảnh báo hoặc thông báo quan trọng
// ✅ Yêu cầu người dùng xác nhận (OK, Cancel, Yes, No,...)
// ✅ Hiển thị biểu mẫu nhập dữ liệu (input form)
