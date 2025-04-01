import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_database/firebase_database.dart";

class FirAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.ref().child("users");

  // Hàm đăng ký
  void signUp(
      String cccd,
      String hoten,
      String dtzalo,
      String ngaysinh,
      String matkhau,
      String email,
      Function onSuccess,
      Function(String) onRegisterError) {
    // Kiểm tra xem CCCD đã có trong database chưa
    _userRef.orderByChild("cccd").equalTo(cccd).once().then((snapshot) {
      if (snapshot.snapshot.value != null) {
        onRegisterError("CCCD này đã được đăng ký!");
      } else {
        // Sử dụng cccd làm email để tạo tài khoản
        _firebaseAuth
            .createUserWithEmailAndPassword(
                email: cccd, password: matkhau) // Sử dụng CCCD làm email
            .then((userCredential) {
          User? user = userCredential.user;
          if (user != null) {
            _createUser(user.uid, cccd, hoten, dtzalo, ngaysinh, email,
                onSuccess, onRegisterError);
          }
        }).catchError((error) {
          print("Error from Firebase signUp: $error");
          if (error is FirebaseAuthException) {
            print("FirebaseAuthException: ${error.code}, ${error.message}");
          }
          onRegisterError("Đăng ký thất bại: ${error.toString()}");
        });
      }
    }).catchError((error) {
      // Lỗi khi truy vấn Realtime Database
      onRegisterError("Lỗi khi kiểm tra dữ liệu, vui lòng thử lại.");
    });
  }

  // Hàm đăng nhập
  void signIn(String cccd, String pass, void Function() onSuccess,
      void Function(String) onSignInError) {
    // Dùng cccd làm email để đăng nhập
    _firebaseAuth
        .signInWithEmailAndPassword(email: cccd, password: pass)
        .then((userCredential) {
      print("Đăng nhập thành công");
      onSuccess();
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        _onSignInErr(error.code, onSignInError);
      } else {
        onSignInError("Lỗi không xác định khi đăng nhập.");
      }
    });
  }

  // Hàm tạo người dùng trong Firebase Realtime Database
  void _createUser(
      String userId,
      String cccd,
      String hoten,
      String dtzalo,
      String ngaysinh,
      String email,
      Function onSuccess,
      Function(String) onRegisterError) {
    var user = {
      "cccd": cccd,
      "name": hoten,
      "phone": dtzalo,
      "dateOfBirth": ngaysinh,
      "email": email
    };

    _userRef.child(userId).set(user).then((_) {
      // Thành công
      onSuccess();
    }).catchError((error) {
      // Lỗi khi thêm vào Realtime Database
      onRegisterError("Đăng ký không thành công, vui lòng thử lại.");
    });
  }

  // Xử lý lỗi khi đăng ký
  void _onSignUpErr(String code, Function(String) onRegisterError) {
    print("SignUp Error: $code");

    switch (code) {
      case "email-already-in-use":
        onRegisterError("Tài khoản với CCCD này đã tồn tại.");
        break;
      case "weak-password":
        onRegisterError("Mật khẩu quá yếu, vui lòng chọn mật khẩu mạnh hơn.");
        break;
      case "operation-not-allowed":
        onRegisterError("Chức năng đăng ký đang bị vô hiệu hóa.");
        break;
      case "network-request-failed":
        onRegisterError("Lỗi kết nối mạng, vui lòng kiểm tra Internet.");
        break;
      default:
        onRegisterError("Đăng ký thất bại. Lỗi: $code");
    }
  }

  // Xử lý lỗi khi đăng nhập
  void _onSignInErr(String code, Function(String) onSignInError) {
    print("SignIn Error: $code");

    switch (code) {
      case "invalid-email":
        onSignInError("CCCD không hợp lệ.");
        break;
      case "user-disabled":
        onSignInError("Tài khoản này đã bị vô hiệu hóa.");
        break;
      case "wrong-password":
        onSignInError("Mật khẩu không đúng. Vui lòng thử lại.");
        break;
      case "user-not-found":
        onSignInError("Không tìm thấy tài khoản với CCCD này.");
        break;
      case "network-request-failed":
        onSignInError("Lỗi kết nối mạng. Vui lòng kiểm tra Internet.");
        break;
      default:
        onSignInError("Đăng nhập thất bại. Lỗi: $code");
    }
  }
}
