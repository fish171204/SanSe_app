// NhaHaoTam
class NhaHaoTam {
  final int idNhaHT;
  final String cccd;
  final String hoTen;
  final String matKhau;
  final String soDT;
  final DateTime ngaySinh;
  final String diaChi;
  final bool? ddChoDN;
  final String? tenDN;
  final String? websiteDN;

  NhaHaoTam({
    required this.idNhaHT,
    required this.cccd,
    required this.hoTen,
    required this.matKhau,
    required this.soDT,
    required this.ngaySinh,
    required this.diaChi,
    this.ddChoDN,
    this.tenDN,
    this.websiteDN,
  });

  factory NhaHaoTam.fromJson(Map<String, dynamic> json) {
    return NhaHaoTam(
      idNhaHT: json['IDNhaHT'],
      cccd: json['CCCD'],
      hoTen: json['HoTen'],
      matKhau: json['MatKhau'],
      soDT: json['SoDT'],
      ngaySinh: DateTime.parse(json['NgaySinh']),
      diaChi: json['DiaChi'],
      ddChoDN: json['DDChoDN'] == 1,
      tenDN: json['TenDN'],
      websiteDN: json['WebsiteDN'],
    );
  }
}
