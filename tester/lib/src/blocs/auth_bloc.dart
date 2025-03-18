// import 'dart:async';
// import 'package:tester/src/fire_base/fire_base_auth.dart';

// class AuthBloc {
//   final _fireAuth = FirAuth();

//   // Khai báo StreamControllers
//   final StreamController _cccdController = StreamController();
//   final StreamController _nameController = StreamController();
//   final StreamController _phoneController = StreamController();
//   final StreamController _dateOfBirthController = StreamController();
//   final StreamController _emailController = StreamController();
//   final StreamController _passController = StreamController();

//   // Getter để truy cập Stream
//   Stream get cccdStream => _cccdController.stream;
//   Stream get dateOfBirthStream => _dateOfBirthController.stream;
//   Stream get nameStream => _nameController.stream;
//   Stream get emailStream => _emailController.stream;
//   Stream get passStream => _passController.stream;
//   Stream get phoneStream => _phoneController.stream;

//   // Hàm kiểm tra tính hợp lệ
//   bool isValid(String name, String email, String pass, String phone) {
//     bool isValid = true; // Ban đầu giả định tất cả hợp lệ

//     if (name.isEmpty) {
//       _nameController.sink.addError("Nhập tên");
//       isValid = false;
//     } else {
//       _nameController.sink.add("");
//     }

//     if (phone.isEmpty) {
//       _phoneController.sink.addError("Nhập số điện thoại");
//       isValid = false;
//     } else {
//       _phoneController.sink.add("");
//     }

//     if (email.isEmpty) {
//       _emailController.sink.addError("Nhập email hợp lệ");
//       isValid = false;
//     } else {
//       _emailController.sink.add("");
//     }

//     if (pass.isEmpty) {
//       _passController.sink.addError("Nhập mật khẩu");
//       isValid = false;
//     } else {
//       _passController.sink.add("");
//     }

//     return isValid;
//   }

//   bool isValidSignIn(String email, String pass) {
//     bool isValid = true;

//     if (email.isEmpty) {
//       _emailController.sink.addError("Nhập email hợp lệ");
//       isValid = false;
//     } else {
//       _emailController.sink.add("");
//     }

//     if (pass.isEmpty) {
//       _passController.sink.addError("Nhập mật khẩu");
//       isValid = false;
//     } else {
//       _passController.sink.add("");
//     }

//     return isValid;
//   }

//   void signUp(String email, String pass, String phone, String name,
//       Function onSuccess, Function(String) onRegisterError) {
//     _fireAuth.signUp(email, pass, name, phone, onSuccess, onRegisterError);
//   }

//   void signIn(String email, String pass, Function onSuccess,
//       Function(String) onSignInError) {
//     _fireAuth.signIn(email, pass, onSuccess, onSignInError);
//   }

//   void dispose() {
//     _emailController.close();
//     _nameController.close();
//     _passController.close();
//     _phoneController.close();
//   }
// }
