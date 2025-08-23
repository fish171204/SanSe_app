class AffiliateMarketing {
  final int idDoanhNghiep;
  final String tenDoanhNghiep;
  final String logoURL;
  final String linkWebsite;
  final String? moTa;
  final int? idMuaHang;

  AffiliateMarketing({
    required this.idDoanhNghiep,
    required this.tenDoanhNghiep,
    required this.logoURL,
    required this.linkWebsite,
    this.moTa,
    this.idMuaHang,
  });

  factory AffiliateMarketing.fromJson(Map<String, dynamic> json) {
    return AffiliateMarketing(
      idDoanhNghiep: json['IDDoanhNghiep'],
      tenDoanhNghiep: json['TenDoanhNghiep'],
      logoURL: json['LogoURL'],
      linkWebsite: json['LinkWebsite'],
      moTa: json['MoTa'],
      idMuaHang: json['IDMuaHang'],
    );
  }
}
