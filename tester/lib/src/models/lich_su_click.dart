class LichSuClick {
  final int idClick;
  final int idDoanhNghiep;
  final String? idNhaHaoTam;
  final String? idNguoiKhoKhan;

  LichSuClick({
    required this.idClick,
    required this.idDoanhNghiep,
    this.idNhaHaoTam,
    this.idNguoiKhoKhan,
  });

  factory LichSuClick.fromJson(Map<String, dynamic> json) {
    return LichSuClick(
      idClick: json['IDClick'],
      idDoanhNghiep: json['IDDoanhNghiep'],
      idNhaHaoTam: json['IDNhaHaoTam'],
      idNguoiKhoKhan: json['IDNguoiKhoKhan'],
    );
  }
}
