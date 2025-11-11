class SupporterModel {
  final String cccd;
  final String hoTen;
  final String soDTzalo;
  final String tinhThanh;
  final String quanHuyen;
  final String xaPhuong;
  final String diaChiNha;
  final String? email;

  SupporterModel({
    required this.cccd,
    required this.hoTen,
    required this.soDTzalo,
    required this.tinhThanh,
    required this.quanHuyen,
    required this.xaPhuong,
    required this.diaChiNha,
    this.email,
  });

  factory SupporterModel.fromJson(Map<String, dynamic> json) {
    return SupporterModel(
      cccd: json['CCCD'],
      hoTen: json['HoTen'],
      soDTzalo: json['SoDTzalo'],
      tinhThanh: json['TinhThanh'],
      quanHuyen: json['QuanHuyen'],
      xaPhuong: json['XaPhuong'],
      diaChiNha: json['DiaChiNha'],
      email: json['Email'],
    );
  }
}
