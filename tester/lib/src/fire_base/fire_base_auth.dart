import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_database/firebase_database.dart";

class FirAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.ref().child("users");

  void signUp(
      String cccd,
      String hoten,
      String dtzalo,
      String ngaysinh,
      String matkhau,
      String email,
      Function onSuccess,
      Function(String) onRegisterError) {
    // Trước khi gọi createUserWithEmailAndPassword, kiểm tra xem CCCD đã có trong _userRef
    _userRef.orderByChild("cccd").equalTo(cccd).once().then((snapshot) {
      if (snapshot.snapshot.value != null) {
        onRegisterError("CCCD này đã được đăng ký!");
      } else {
        _firebaseAuth
            .createUserWithEmailAndPassword(
                email: "$cccd@cccd.com", password: matkhau)
            .then((userCredential) {
          User? user = userCredential.user;
          if (user != null) {
            _createUser(user.uid, cccd, hoten, dtzalo, ngaysinh, email,
                onSuccess, onRegisterError);
          }
        }).catchError((error) {
          if (error is FirebaseAuthException) {
            _onSignUpErr(error.code, onRegisterError);
          } else {
            onRegisterError("Lỗi không xác định: ${error.toString()}");
          }
        });
      }
    });
  }

  void signIn(String cccd, String pass, void Function() onSuccess,
      void Function(String) onSignInError) {
    // Tạo email giả từ CCCD
    String fakeEmail = "$cccd@cccd.com";

    _firebaseAuth
        .signInWithEmailAndPassword(email: fakeEmail, password: pass)
        .then((userCredential) {
      print("On sign in success");
      onSuccess();
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        _onSignInErr(error.code, onSignInError);
      } else {
        onSignInError("Lỗi không xác định khi đăng nhập.");
      }
    });
  }

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
      // success
      onSuccess();
    }).catchError((error) {
      // TODO
      onRegisterError("SignUp fail, please try again");
    });
  }

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

  void _onSignInErr(String code, Function(String) onSignInError) {
    print("SignIn Error: $code"); // In lỗi ra console để debug

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


// Bước 1: Gọi createUserWithEmailAndPassword() để đăng ký tài khoản.

// Bước 2: Nếu đăng ký thành công (then), lấy thông tin user.

// Bước 3: Nếu user != null, gọi hàm _createUser() để lưu thông tin vào Firebase Database.

// Bước 4: Nếu có lỗi (catchError), gọi onError(error.message) để báo lỗi.