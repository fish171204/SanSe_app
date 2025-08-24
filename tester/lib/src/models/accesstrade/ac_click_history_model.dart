class ClickHistoryModel {
  final int idClick;
  final int idDoanhNghiep;
  final String? idNhaHaoTam;
  final String? idNguoiKhoKhan;

  ClickHistoryModel({
    required this.idClick,
    required this.idDoanhNghiep,
    this.idNhaHaoTam,
    this.idNguoiKhoKhan,
  });

  factory ClickHistoryModel.fromJson(Map<String, dynamic> json) {
    return ClickHistoryModel(
      idClick: json['IDClick'],
      idDoanhNghiep: json['IDDoanhNghiep'],
      idNhaHaoTam: json['IDNhaHaoTam'],
      idNguoiKhoKhan: json['IDNguoiKhoKhan'],
    );
  }
}
