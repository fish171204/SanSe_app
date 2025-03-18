class TinhThanh {
  final String maTinhThanh; // Mã Tỉnh/Thành phố
  final String tenTinhThanh; // Tên Tỉnh/Thành phố

  TinhThanh({required this.maTinhThanh, required this.tenTinhThanh});
}

final List<TinhThanh> provinces = [
  TinhThanh(maTinhThanh: '001', tenTinhThanh: 'An Giang'),
  TinhThanh(maTinhThanh: '002', tenTinhThanh: 'Bà Rịa - Vũng Tàu'),
  TinhThanh(maTinhThanh: '003', tenTinhThanh: 'Bắc Giang'),
  TinhThanh(maTinhThanh: '004', tenTinhThanh: 'Bắc Kạn'),
  TinhThanh(maTinhThanh: '005', tenTinhThanh: 'Bạc Liêu'),
  TinhThanh(maTinhThanh: '006', tenTinhThanh: 'Bắc Ninh'),
  TinhThanh(maTinhThanh: '007', tenTinhThanh: 'Bến Tre'),
  TinhThanh(maTinhThanh: '008', tenTinhThanh: 'Bình Định'),
  TinhThanh(maTinhThanh: '009', tenTinhThanh: 'Bình Dương'),
  TinhThanh(maTinhThanh: '010', tenTinhThanh: 'Bình Phước'),
  TinhThanh(maTinhThanh: '011', tenTinhThanh: 'Bình Thuận'),
  TinhThanh(maTinhThanh: '012', tenTinhThanh: 'Cà Mau'),
  TinhThanh(maTinhThanh: '013', tenTinhThanh: 'Cần Thơ'),
  TinhThanh(maTinhThanh: '014', tenTinhThanh: 'Cao Bằng'),
  TinhThanh(maTinhThanh: '015', tenTinhThanh: 'Đà Nẵng'),
  TinhThanh(maTinhThanh: '016', tenTinhThanh: 'Đắk Lắk'),
  TinhThanh(maTinhThanh: '017', tenTinhThanh: 'Đắk Nông'),
  TinhThanh(maTinhThanh: '018', tenTinhThanh: 'Điện Biên'),
  TinhThanh(maTinhThanh: '019', tenTinhThanh: 'Đồng Nai'),
  TinhThanh(maTinhThanh: '020', tenTinhThanh: 'Đồng Tháp'),
  TinhThanh(maTinhThanh: '021', tenTinhThanh: 'Gia Lai'),
  TinhThanh(maTinhThanh: '022', tenTinhThanh: 'Hà Giang'),
  TinhThanh(maTinhThanh: '023', tenTinhThanh: 'Hà Nam'),
  TinhThanh(maTinhThanh: '024', tenTinhThanh: 'Hà Nội'),
  TinhThanh(maTinhThanh: '025', tenTinhThanh: 'Hà Tĩnh'),
  TinhThanh(maTinhThanh: '026', tenTinhThanh: 'Hải Dương'),
  TinhThanh(maTinhThanh: '027', tenTinhThanh: 'Hải Phòng'),
  TinhThanh(maTinhThanh: '028', tenTinhThanh: 'Hậu Giang'),
  TinhThanh(maTinhThanh: '029', tenTinhThanh: 'Hồ Chí Minh'),
  TinhThanh(maTinhThanh: '030', tenTinhThanh: 'Hòa Bình'),
  TinhThanh(maTinhThanh: '031', tenTinhThanh: 'Hưng Yên'),
  TinhThanh(maTinhThanh: '032', tenTinhThanh: 'Khánh Hòa'),
  TinhThanh(maTinhThanh: '033', tenTinhThanh: 'Kiên Giang'),
  TinhThanh(maTinhThanh: '034', tenTinhThanh: 'Kon Tum'),
  TinhThanh(maTinhThanh: '035', tenTinhThanh: 'Lai Châu'),
  TinhThanh(maTinhThanh: '036', tenTinhThanh: 'Lâm Đồng'),
  TinhThanh(maTinhThanh: '037', tenTinhThanh: 'Lạng Sơn'),
  TinhThanh(maTinhThanh: '038', tenTinhThanh: 'Lào Cai'),
  TinhThanh(maTinhThanh: '039', tenTinhThanh: 'Long An'),
  TinhThanh(maTinhThanh: '040', tenTinhThanh: 'Nam Định'),
  TinhThanh(maTinhThanh: '041', tenTinhThanh: 'Nghệ An'),
  TinhThanh(maTinhThanh: '042', tenTinhThanh: 'Ninh Bình'),
  TinhThanh(maTinhThanh: '043', tenTinhThanh: 'Ninh Thuận'),
  TinhThanh(maTinhThanh: '044', tenTinhThanh: 'Phú Thọ'),
  TinhThanh(maTinhThanh: '045', tenTinhThanh: 'Phú Yên'),
  TinhThanh(maTinhThanh: '046', tenTinhThanh: 'Quảng Bình'),
  TinhThanh(maTinhThanh: '047', tenTinhThanh: 'Quảng Nam'),
  TinhThanh(maTinhThanh: '048', tenTinhThanh: 'Quảng Ngãi'),
  TinhThanh(maTinhThanh: '049', tenTinhThanh: 'Quảng Ninh'),
  TinhThanh(maTinhThanh: '050', tenTinhThanh: 'Quảng Trị'),
  TinhThanh(maTinhThanh: '051', tenTinhThanh: 'Sóc Trăng'),
  TinhThanh(maTinhThanh: '052', tenTinhThanh: 'Sơn La'),
  TinhThanh(maTinhThanh: '053', tenTinhThanh: 'Tây Ninh'),
  TinhThanh(maTinhThanh: '054', tenTinhThanh: 'Thái Bình'),
  TinhThanh(maTinhThanh: '055', tenTinhThanh: 'Thái Nguyên'),
  TinhThanh(maTinhThanh: '056', tenTinhThanh: 'Thanh Hóa'),
  TinhThanh(maTinhThanh: '057', tenTinhThanh: 'Thừa Thiên - Huế'),
  TinhThanh(maTinhThanh: '058', tenTinhThanh: 'Tiền Giang'),
  TinhThanh(maTinhThanh: '059', tenTinhThanh: 'Trà Vinh'),
  TinhThanh(maTinhThanh: '060', tenTinhThanh: 'Tuyên Quang'),
  TinhThanh(maTinhThanh: '061', tenTinhThanh: 'Vĩnh Long'),
  TinhThanh(maTinhThanh: '062', tenTinhThanh: 'Vĩnh Phúc'),
  TinhThanh(maTinhThanh: '063', tenTinhThanh: 'Yên Bái'),
];

// class TinhThanh {
//   final String maTinhThanh;
//   final String tenTinhThanh;
 

//   TinhThanh({
//     required this.maTinhThanh,
//     required this.tenTinhThanh,
//   });

//   factory TinhThanh.fromJson(Map<String, dynamic> json) {
//     return TinhThanh(
//       maTinhThanh: json['MaTinhThanh'],
//       tenTinhThanh: json['TenTinhThanh'],
//     );
//   }
// }
