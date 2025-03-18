// TuThienTrucTiep
class TuThienTrucTiep {
  final int idTTTT;
  final String idKK;
  final String hoTenKK;
  final DateTime ngay;
  final String hinhThucGD;
  final double? soTienTT;
  final String hoanCanhKK;
  final List<int>? hinhAnh;
  final int idNhaHT;
  final String hoTenNHT;
  final String? idNguoiHoTro;
  final String? hoTenNguoiHoTro;
  final String? idNguoiLamChung;
  final String? hoTenNLC;
  final bool kkXacNhan;
  final bool nhaHTXacNhan;
  final List<int>? minhChungTT;
  final String daHoanThanh;

  TuThienTrucTiep({
    required this.idTTTT,
    required this.idKK,
    required this.hoTenKK,
    required this.ngay,
    required this.hinhThucGD,
    this.soTienTT,
    required this.hoanCanhKK,
    this.hinhAnh,
    required this.idNhaHT,
    required this.hoTenNHT,
    this.idNguoiHoTro,
    this.hoTenNguoiHoTro,
    this.idNguoiLamChung,
    this.hoTenNLC,
    required this.kkXacNhan,
    required this.nhaHTXacNhan,
    this.minhChungTT,
    required this.daHoanThanh,
  });

  factory TuThienTrucTiep.fromJson(Map<String, dynamic> json) {
    return TuThienTrucTiep(
      idTTTT: json['IDTTTT'],
      idKK: json['IDKK'],
      hoTenKK: json['HoTenKK'],
      ngay: DateTime.parse(json['Ngay']),
      hinhThucGD: json['HinhThucGD'],
      soTienTT: json['SoTienTT'],
      hoanCanhKK: json['HoanCanhKK'],
      hinhAnh: json['HinhAnh'],
      idNhaHT: json['IDNhaHT'],
      hoTenNHT: json['HoTenNHT'],
      idNguoiHoTro: json['IDNguoiHoTro'],
      hoTenNguoiHoTro: json['HoTenNguoiHoTro'],
      idNguoiLamChung: json['IDNguoiLamChung'],
      hoTenNLC: json['HoTenNLC'],
      kkXacNhan: json['KKXacNhan'] == 1,
      nhaHTXacNhan: json['NhaHTXacNhan'] == 1,
      minhChungTT: json['MinhChungTT'],
      daHoanThanh: json['DaHoanThanh'],
    );
  }
}
