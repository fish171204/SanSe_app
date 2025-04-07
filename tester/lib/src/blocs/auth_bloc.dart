import 'dart:async';
import 'package:tester/src/fire_base/fire_base_auth.dart';

class AuthBloc {
  final _fireAuth = FirAuth();

  final StreamController _cccdController = StreamController();
  final StreamController _nameController = StreamController();
  final StreamController _phoneController = StreamController();
  final StreamController _dateOfBirthController = StreamController();
  final StreamController _emailController = StreamController();
  final StreamController _passController = StreamController();

  Stream get cccdStream => _cccdController.stream;
  Stream get dateOfBirthStream => _dateOfBirthController.stream;
  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;

  bool isValid(String name, String email, String pass, String phone) {
    bool isValid = true;

    if (name.isEmpty) {
      _nameController.sink.addError("Nhập tên");
      isValid = false;
    } else {
      _nameController.sink.add(null);
    }

    if (phone.isEmpty) {
      _phoneController.sink.addError("Nhập số điện thoại");
      isValid = false;
    } else {
      _phoneController.sink.add(null);
    }

    if (email.isEmpty || !_isValidEmail(email)) {
      _emailController.sink.addError("Nhập email hợp lệ");
      isValid = false;
    } else {
      _emailController.sink.add(null);
    }

    if (pass.isEmpty || pass.length < 6) {
      _passController.sink.addError("Mật khẩu phải có ít nhất 6 ký tự");
      isValid = false;
    } else {
      _passController.sink.add(null);
    }

    return isValid;
  }

  bool isValidSignIn(String email, String pass) {
    bool isValid = true;

    if (email.isEmpty || !_isValidEmail(email)) {
      _emailController.sink.addError("Nhập email hợp lệ");
      isValid = false;
    } else {
      _emailController.sink.add(null);
    }

    if (pass.isEmpty) {
      _passController.sink.addError("Nhập mật khẩu");
      isValid = false;
    } else {
      _passController.sink.add(null);
    }

    return isValid;
  }

  void signUp(
    String cccd,
    String hoten,
    String dtzalo,
    String ngaysinh,
    String matkhau,
    String email,
    Function onSuccess,
    Function(String) onRegisterError,
  ) {
    _fireAuth.signUp(cccd, hoten, dtzalo, ngaysinh, matkhau, cccd, onSuccess,
        onRegisterError);
  }

  void signIn(String cccd, String pass, void Function() onSuccess,
      void Function(String) onSignInError) {
    _fireAuth.signIn(cccd, pass, onSuccess, onSignInError);
  }

  void dispose() {
    _emailController.close();
    _nameController.close();
    _passController.close();
    _phoneController.close();
    _dateOfBirthController.close();
    _cccdController.close();
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return regex.hasMatch(email);
  }
}
