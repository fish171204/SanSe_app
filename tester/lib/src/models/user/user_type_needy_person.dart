// NguoiKhoKhan
class NguoiKhoKhan {
  final String cccd;
  final String hoTen;
  final String soDTzalo;
  final String tinhThanh;
  final String quanHuyen;
  final String xaPhuong;
  final String diaChiNha;
  final String? email;
  final String matKhau;
  final String? idNguoiHoTro;

  NguoiKhoKhan({
    required this.cccd,
    required this.hoTen,
    required this.soDTzalo,
    required this.tinhThanh,
    required this.quanHuyen,
    required this.xaPhuong,
    required this.diaChiNha,
    this.email,
    required this.matKhau,
    this.idNguoiHoTro,
  });

  factory NguoiKhoKhan.fromJson(Map<String, dynamic> json) {
    return NguoiKhoKhan(
      cccd: json['CCCD'],
      hoTen: json['HoTen'],
      soDTzalo: json['SoDTzalo'],
      tinhThanh: json['TinhThanh'],
      quanHuyen: json['QuanHuyen'],
      xaPhuong: json['XaPhuong'],
      diaChiNha: json['DiaChiNha'],
      email: json['Email'],
      matKhau: json['MatKhau'],
      idNguoiHoTro: json['IDNguoiHoTro'],
    );
  }
}
