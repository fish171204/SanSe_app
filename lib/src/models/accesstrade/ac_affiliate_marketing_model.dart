class AffiliateMarketingModel {
  final int idDoanhNghiep;
  final String tenDoanhNghiep;
  final String logoURL;
  final String linkWebsite;
  final String? moTa;
  final int? idMuaHang;

  AffiliateMarketingModel({
    required this.idDoanhNghiep,
    required this.tenDoanhNghiep,
    required this.logoURL,
    required this.linkWebsite,
    this.moTa,
    this.idMuaHang,
  });

  factory AffiliateMarketingModel.fromJson(Map<String, dynamic> json) {
    return AffiliateMarketingModel(
      idDoanhNghiep: json['IDDoanhNghiep'],
      tenDoanhNghiep: json['TenDoanhNghiep'],
      logoURL: json['LogoURL'],
      linkWebsite: json['LinkWebsite'],
      moTa: json['MoTa'],
      idMuaHang: json['IDMuaHang'],
    );
  }
}
