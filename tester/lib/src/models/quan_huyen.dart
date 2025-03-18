class QuanHuyen {
  final String maTinhThanh;
  final String maQuanHuyen;
  final String tenQuanHuyen;

  QuanHuyen({
    required this.maTinhThanh,
    required this.maQuanHuyen,
    required this.tenQuanHuyen,
  });
}

List<QuanHuyen> danhSachQuanHuyen = [
  QuanHuyen(
      maTinhThanh: '001', maQuanHuyen: '001', tenQuanHuyen: 'Huyện An Phú'),
  QuanHuyen(
      maTinhThanh: '001', maQuanHuyen: '002', tenQuanHuyen: 'Huyện Châu Phú'),
  QuanHuyen(
      maTinhThanh: '001', maQuanHuyen: '003', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '001', maQuanHuyen: '004', tenQuanHuyen: 'Huyện Chợ Mới'),
  QuanHuyen(
      maTinhThanh: '001', maQuanHuyen: '005', tenQuanHuyen: 'Huyện Phú Tân'),
  QuanHuyen(
      maTinhThanh: '001', maQuanHuyen: '006', tenQuanHuyen: 'Huyện Thoại Sơn'),
  QuanHuyen(
      maTinhThanh: '001', maQuanHuyen: '007', tenQuanHuyen: 'Huyện Tri Tôn'),
  QuanHuyen(
      maTinhThanh: '001',
      maQuanHuyen: '008',
      tenQuanHuyen: 'Thành phố Châu Đốc'),
  QuanHuyen(
      maTinhThanh: '001',
      maQuanHuyen: '009',
      tenQuanHuyen: 'Thành phố Long Xuyên'),
  QuanHuyen(
      maTinhThanh: '001', maQuanHuyen: '010', tenQuanHuyen: 'Thị xã Tân Châu'),
  QuanHuyen(
      maTinhThanh: '001', maQuanHuyen: '011', tenQuanHuyen: 'Thị xã Tịnh Biên'),
  QuanHuyen(
      maTinhThanh: '002', maQuanHuyen: '012', tenQuanHuyen: 'Huyện Châu Đức'),
  QuanHuyen(
      maTinhThanh: '002', maQuanHuyen: '013', tenQuanHuyen: 'Huyện Côn Đảo'),
  QuanHuyen(
      maTinhThanh: '002', maQuanHuyen: '014', tenQuanHuyen: 'Huyện Đất Đỏ'),
  QuanHuyen(
      maTinhThanh: '002', maQuanHuyen: '015', tenQuanHuyen: 'Huyện Long Điền'),
  QuanHuyen(
      maTinhThanh: '002', maQuanHuyen: '016', tenQuanHuyen: 'Huyện Xuyên Mộc'),
  QuanHuyen(
      maTinhThanh: '002', maQuanHuyen: '017', tenQuanHuyen: 'Thành phố Bà Rịa'),
  QuanHuyen(
      maTinhThanh: '002',
      maQuanHuyen: '018',
      tenQuanHuyen: 'Thành phố Vũng Tàu'),
  QuanHuyen(
      maTinhThanh: '002', maQuanHuyen: '019', tenQuanHuyen: 'Thị xã Phú Mỹ'),
  QuanHuyen(
      maTinhThanh: '003', maQuanHuyen: '020', tenQuanHuyen: 'Huyện Hiệp Hòa'),
  QuanHuyen(
      maTinhThanh: '003', maQuanHuyen: '021', tenQuanHuyen: 'Huyện Lạng Giang'),
  QuanHuyen(
      maTinhThanh: '003', maQuanHuyen: '022', tenQuanHuyen: 'Huyện Lục Nam'),
  QuanHuyen(
      maTinhThanh: '003', maQuanHuyen: '023', tenQuanHuyen: 'Huyện Lục Ngạn'),
  QuanHuyen(
      maTinhThanh: '003', maQuanHuyen: '024', tenQuanHuyen: 'Huyện Sơn Động'),
  QuanHuyen(
      maTinhThanh: '003', maQuanHuyen: '025', tenQuanHuyen: 'Huyện Tân Yên'),
  QuanHuyen(
      maTinhThanh: '003', maQuanHuyen: '026', tenQuanHuyen: 'Huyện Việt Yên'),
  QuanHuyen(
      maTinhThanh: '003', maQuanHuyen: '027', tenQuanHuyen: 'Huyện Yên Dũng'),
  QuanHuyen(
      maTinhThanh: '003', maQuanHuyen: '028', tenQuanHuyen: 'Huyện Yên Thế'),
  QuanHuyen(
      maTinhThanh: '003',
      maQuanHuyen: '029',
      tenQuanHuyen: 'Thành phố Bắc Giang'),
  QuanHuyen(
      maTinhThanh: '004', maQuanHuyen: '030', tenQuanHuyen: 'Huyện Ba Bể'),
  QuanHuyen(
      maTinhThanh: '004', maQuanHuyen: '031', tenQuanHuyen: 'Huyện Bạch Thông'),
  QuanHuyen(
      maTinhThanh: '004', maQuanHuyen: '032', tenQuanHuyen: 'Huyện Chợ Đồn'),
  QuanHuyen(
      maTinhThanh: '004', maQuanHuyen: '033', tenQuanHuyen: 'Huyện Chợ Mới'),
  QuanHuyen(
      maTinhThanh: '004', maQuanHuyen: '034', tenQuanHuyen: 'Huyện Na Rì'),
  QuanHuyen(
      maTinhThanh: '004', maQuanHuyen: '035', tenQuanHuyen: 'Huyện Ngân Sơn'),
  QuanHuyen(
      maTinhThanh: '004', maQuanHuyen: '036', tenQuanHuyen: 'Huyện Pác Nặm'),
  QuanHuyen(
      maTinhThanh: '004',
      maQuanHuyen: '037',
      tenQuanHuyen: 'Thành Phố Bắc Kạn'),
  QuanHuyen(
      maTinhThanh: '005', maQuanHuyen: '038', tenQuanHuyen: 'Huyện Đông Hải'),
  QuanHuyen(
      maTinhThanh: '005', maQuanHuyen: '039', tenQuanHuyen: 'Huyện Hoà Bình'),
  QuanHuyen(
      maTinhThanh: '005', maQuanHuyen: '040', tenQuanHuyen: 'Huyện Hồng Dân'),
  QuanHuyen(
      maTinhThanh: '005', maQuanHuyen: '041', tenQuanHuyen: 'Huyện Phước Long'),
  QuanHuyen(
      maTinhThanh: '005', maQuanHuyen: '042', tenQuanHuyen: 'Huyện Vĩnh Lợi'),
  QuanHuyen(
      maTinhThanh: '005',
      maQuanHuyen: '043',
      tenQuanHuyen: 'Thành phố Bạc Liêu'),
  QuanHuyen(
      maTinhThanh: '005', maQuanHuyen: '044', tenQuanHuyen: 'Thị xã Giá Rai'),
  QuanHuyen(
      maTinhThanh: '006', maQuanHuyen: '045', tenQuanHuyen: 'Huyện Gia Bình'),
  QuanHuyen(
      maTinhThanh: '006', maQuanHuyen: '046', tenQuanHuyen: 'Huyện Lương Tài'),
  QuanHuyen(
      maTinhThanh: '006', maQuanHuyen: '047', tenQuanHuyen: 'Huyện Tiên Du'),
  QuanHuyen(
      maTinhThanh: '006', maQuanHuyen: '048', tenQuanHuyen: 'Huyện Yên Phong'),
  QuanHuyen(
      maTinhThanh: '006',
      maQuanHuyen: '049',
      tenQuanHuyen: 'Thành phố Bắc Ninh'),
  QuanHuyen(
      maTinhThanh: '006', maQuanHuyen: '050', tenQuanHuyen: 'Thành phố Từ Sơn'),
  QuanHuyen(
      maTinhThanh: '006', maQuanHuyen: '051', tenQuanHuyen: 'Thị xã Quế Võ'),
  QuanHuyen(
      maTinhThanh: '006',
      maQuanHuyen: '052',
      tenQuanHuyen: 'Thị xã Thuận Thành'),
  QuanHuyen(
      maTinhThanh: '007', maQuanHuyen: '053', tenQuanHuyen: 'Huyện Ba Tri'),
  QuanHuyen(
      maTinhThanh: '007', maQuanHuyen: '054', tenQuanHuyen: 'Huyện Bình Đại'),
  QuanHuyen(
      maTinhThanh: '007', maQuanHuyen: '055', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '007', maQuanHuyen: '056', tenQuanHuyen: 'Huyện Chợ Lách'),
  QuanHuyen(
      maTinhThanh: '007', maQuanHuyen: '057', tenQuanHuyen: 'Huyện Giồng Trôm'),
  QuanHuyen(
      maTinhThanh: '007', maQuanHuyen: '058', tenQuanHuyen: 'Huyện Mỏ Cày Bắc'),
  QuanHuyen(
      maTinhThanh: '007', maQuanHuyen: '059', tenQuanHuyen: 'Huyện Mỏ Cày Nam'),
  QuanHuyen(
      maTinhThanh: '007', maQuanHuyen: '060', tenQuanHuyen: 'Huyện Thạnh Phú'),
  QuanHuyen(
      maTinhThanh: '007',
      maQuanHuyen: '061',
      tenQuanHuyen: 'Thành phố Bến Tre'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '062', tenQuanHuyen: 'Huyện An Lão'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '063', tenQuanHuyen: 'Huyện Hoài Ân'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '064', tenQuanHuyen: 'Huyện Phù Cát'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '065', tenQuanHuyen: 'Huyện Phù Mỹ'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '066', tenQuanHuyen: 'Huyện Tây Sơn'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '067', tenQuanHuyen: 'Huyện Tuy Phước'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '068', tenQuanHuyen: 'Huyện Vân Canh'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '069', tenQuanHuyen: 'Huyện Vĩnh Thạnh'),
  QuanHuyen(
      maTinhThanh: '008',
      maQuanHuyen: '070',
      tenQuanHuyen: 'Thành phố Quy Nhơn'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '071', tenQuanHuyen: 'Thị xã An Nhơn'),
  QuanHuyen(
      maTinhThanh: '008', maQuanHuyen: '072', tenQuanHuyen: 'Thị xã Hoài Nhơn'),
  QuanHuyen(
      maTinhThanh: '009',
      maQuanHuyen: '073',
      tenQuanHuyen: 'Huyện Bắc Tân Uyên'),
  QuanHuyen(
      maTinhThanh: '009', maQuanHuyen: '074', tenQuanHuyen: 'Huyện Bàu Bàng'),
  QuanHuyen(
      maTinhThanh: '009', maQuanHuyen: '075', tenQuanHuyen: 'Huyện Dầu Tiếng'),
  QuanHuyen(
      maTinhThanh: '009', maQuanHuyen: '076', tenQuanHuyen: 'Huyện Phú Giáo'),
  QuanHuyen(
      maTinhThanh: '009', maQuanHuyen: '077', tenQuanHuyen: 'Thành phố Dĩ An'),
  QuanHuyen(
      maTinhThanh: '009',
      maQuanHuyen: '078',
      tenQuanHuyen: 'Thành phố Tân Uyên'),
  QuanHuyen(
      maTinhThanh: '009',
      maQuanHuyen: '079',
      tenQuanHuyen: 'Thành phố Thủ Dầu Một'),
  QuanHuyen(
      maTinhThanh: '009',
      maQuanHuyen: '080',
      tenQuanHuyen: 'Thành phố Thuận An'),
  QuanHuyen(
      maTinhThanh: '009', maQuanHuyen: '081', tenQuanHuyen: 'Thị xã Bến Cát'),
  QuanHuyen(
      maTinhThanh: '010', maQuanHuyen: '082', tenQuanHuyen: 'Huyện Bù Đăng'),
  QuanHuyen(
      maTinhThanh: '010', maQuanHuyen: '083', tenQuanHuyen: 'Huyện Bù Đốp'),
  QuanHuyen(
      maTinhThanh: '010', maQuanHuyen: '084', tenQuanHuyen: 'Huyện Bù Gia Mập'),
  QuanHuyen(
      maTinhThanh: '010', maQuanHuyen: '085', tenQuanHuyen: 'Huyện Đồng Phú'),
  QuanHuyen(
      maTinhThanh: '010', maQuanHuyen: '086', tenQuanHuyen: 'Huyện Hớn Quản'),
  QuanHuyen(
      maTinhThanh: '010', maQuanHuyen: '087', tenQuanHuyen: 'Huyện Phú Riềng'),
  QuanHuyen(
      maTinhThanh: '010',
      maQuanHuyen: '088',
      tenQuanHuyen: 'Thành phố Đồng Xoài'),
  QuanHuyen(
      maTinhThanh: '010', maQuanHuyen: '089', tenQuanHuyen: 'Thị xã Bình Long'),
  QuanHuyen(
      maTinhThanh: '010',
      maQuanHuyen: '090',
      tenQuanHuyen: 'Thị xã Chơn Thành'),
  QuanHuyen(
      maTinhThanh: '010',
      maQuanHuyen: '091',
      tenQuanHuyen: 'Thị xã Phước Long'),
  QuanHuyen(
      maTinhThanh: '011', maQuanHuyen: '092', tenQuanHuyen: 'Huyện Bắc Bình'),
  QuanHuyen(
      maTinhThanh: '011', maQuanHuyen: '093', tenQuanHuyen: 'Huyện Đức Linh'),
  QuanHuyen(
      maTinhThanh: '011', maQuanHuyen: '094', tenQuanHuyen: 'Huyện Hàm Tân'),
  QuanHuyen(
      maTinhThanh: '011',
      maQuanHuyen: '095',
      tenQuanHuyen: 'Huyện Hàm Thuận Bắc'),
  QuanHuyen(
      maTinhThanh: '011',
      maQuanHuyen: '096',
      tenQuanHuyen: 'Huyện Hàm Thuận Nam'),
  QuanHuyen(
      maTinhThanh: '011', maQuanHuyen: '097', tenQuanHuyen: 'Huyện Phú Quí'),
  QuanHuyen(
      maTinhThanh: '011', maQuanHuyen: '098', tenQuanHuyen: 'Huyện Tánh Linh'),
  QuanHuyen(
      maTinhThanh: '011', maQuanHuyen: '099', tenQuanHuyen: 'Huyện Tuy Phong'),
  QuanHuyen(
      maTinhThanh: '011',
      maQuanHuyen: '100',
      tenQuanHuyen: 'Thành phố Phan Thiết'),
  QuanHuyen(
      maTinhThanh: '011', maQuanHuyen: '101', tenQuanHuyen: 'Thị xã La Gi'),
  QuanHuyen(
      maTinhThanh: '012', maQuanHuyen: '102', tenQuanHuyen: 'Huyện Cái Nước'),
  QuanHuyen(
      maTinhThanh: '012', maQuanHuyen: '103', tenQuanHuyen: 'Huyện Đầm Dơi'),
  QuanHuyen(
      maTinhThanh: '012', maQuanHuyen: '104', tenQuanHuyen: 'Huyện Năm Căn'),
  QuanHuyen(
      maTinhThanh: '012', maQuanHuyen: '105', tenQuanHuyen: 'Huyện Ngọc Hiển'),
  QuanHuyen(
      maTinhThanh: '012', maQuanHuyen: '106', tenQuanHuyen: 'Huyện Phú Tân'),
  QuanHuyen(
      maTinhThanh: '012', maQuanHuyen: '107', tenQuanHuyen: 'Huyện Thới Bình'),
  QuanHuyen(
      maTinhThanh: '012',
      maQuanHuyen: '108',
      tenQuanHuyen: 'Huyện Trần Văn Thời'),
  QuanHuyen(
      maTinhThanh: '012', maQuanHuyen: '109', tenQuanHuyen: 'Huyện U Minh'),
  QuanHuyen(
      maTinhThanh: '012', maQuanHuyen: '110', tenQuanHuyen: 'Thành phố Cà Mau'),
  QuanHuyen(
      maTinhThanh: '013', maQuanHuyen: '111', tenQuanHuyen: 'Huyện Cờ Đỏ'),
  QuanHuyen(
      maTinhThanh: '013', maQuanHuyen: '112', tenQuanHuyen: 'Huyện Phong Điền'),
  QuanHuyen(
      maTinhThanh: '013', maQuanHuyen: '113', tenQuanHuyen: 'Huyện Thới Lai'),
  QuanHuyen(
      maTinhThanh: '013', maQuanHuyen: '114', tenQuanHuyen: 'Huyện Vĩnh Thạnh'),
  QuanHuyen(
      maTinhThanh: '013', maQuanHuyen: '115', tenQuanHuyen: 'Quận Bình Thuỷ'),
  QuanHuyen(
      maTinhThanh: '013', maQuanHuyen: '116', tenQuanHuyen: 'Quận Cái Răng'),
  QuanHuyen(
      maTinhThanh: '013', maQuanHuyen: '117', tenQuanHuyen: 'Quận Ninh Kiều'),
  QuanHuyen(maTinhThanh: '013', maQuanHuyen: '118', tenQuanHuyen: 'Quận Ô Môn'),
  QuanHuyen(
      maTinhThanh: '013', maQuanHuyen: '119', tenQuanHuyen: 'Quận Thốt Nốt'),
  QuanHuyen(
      maTinhThanh: '014', maQuanHuyen: '120', tenQuanHuyen: 'Huyện Bảo Lạc'),
  QuanHuyen(
      maTinhThanh: '014', maQuanHuyen: '121', tenQuanHuyen: 'Huyện Bảo Lâm'),
  QuanHuyen(
      maTinhThanh: '014', maQuanHuyen: '122', tenQuanHuyen: 'Huyện Hạ Lang'),
  QuanHuyen(
      maTinhThanh: '014', maQuanHuyen: '123', tenQuanHuyen: 'Huyện Hà Quảng'),
  QuanHuyen(
      maTinhThanh: '014', maQuanHuyen: '124', tenQuanHuyen: 'Huyện Hoà An'),
  QuanHuyen(
      maTinhThanh: '014',
      maQuanHuyen: '125',
      tenQuanHuyen: 'Huyện Nguyên Bình'),
  QuanHuyen(
      maTinhThanh: '014', maQuanHuyen: '126', tenQuanHuyen: 'Huyện Quảng Hòa'),
  QuanHuyen(
      maTinhThanh: '014', maQuanHuyen: '127', tenQuanHuyen: 'Huyện Thạch An'),
  QuanHuyen(
      maTinhThanh: '014',
      maQuanHuyen: '128',
      tenQuanHuyen: 'Huyện Trùng Khánh'),
  QuanHuyen(
      maTinhThanh: '014',
      maQuanHuyen: '129',
      tenQuanHuyen: 'Thành phố Cao Bằng'),
  QuanHuyen(
      maTinhThanh: '015', maQuanHuyen: '130', tenQuanHuyen: 'Huyện Hòa Vang'),
  QuanHuyen(
      maTinhThanh: '015', maQuanHuyen: '131', tenQuanHuyen: 'Huyện Hoàng Sa'),
  QuanHuyen(
      maTinhThanh: '015', maQuanHuyen: '132', tenQuanHuyen: 'Quận Cẩm Lệ'),
  QuanHuyen(
      maTinhThanh: '015', maQuanHuyen: '133', tenQuanHuyen: 'Quận Hải Châu'),
  QuanHuyen(
      maTinhThanh: '015', maQuanHuyen: '134', tenQuanHuyen: 'Quận Liên Chiểu'),
  QuanHuyen(
      maTinhThanh: '015',
      maQuanHuyen: '135',
      tenQuanHuyen: 'Quận Ngũ Hành Sơn'),
  QuanHuyen(
      maTinhThanh: '015', maQuanHuyen: '136', tenQuanHuyen: 'Quận Sơn Trà'),
  QuanHuyen(
      maTinhThanh: '015', maQuanHuyen: '137', tenQuanHuyen: 'Quận Thanh Khê'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '138', tenQuanHuyen: 'Huyện Buôn Đôn'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '139', tenQuanHuyen: 'Huyện Cư Kuin'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '140', tenQuanHuyen: 'Huyện Cư M' 'gar'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '141', tenQuanHuyen: 'Huyện Ea H' 'leo'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '142', tenQuanHuyen: 'Huyện Ea Kar'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '143', tenQuanHuyen: 'Huyện Ea Súp'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '144', tenQuanHuyen: 'Huyện Krông A Na'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '145', tenQuanHuyen: 'Huyện Krông Bông'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '146', tenQuanHuyen: 'Huyện Krông Búk'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '147', tenQuanHuyen: 'Huyện Krông Năng'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '148', tenQuanHuyen: 'Huyện Krông Pắc'),
  QuanHuyen(maTinhThanh: '016', maQuanHuyen: '149', tenQuanHuyen: 'Huyện Lắk'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '150', tenQuanHuyen: 'Huyện M' 'Đrắk'),
  QuanHuyen(
      maTinhThanh: '016',
      maQuanHuyen: '151',
      tenQuanHuyen: 'Thành phố Buôn Ma Thuột'),
  QuanHuyen(
      maTinhThanh: '016', maQuanHuyen: '152', tenQuanHuyen: 'Thị Xã Buôn Hồ'),
  QuanHuyen(
      maTinhThanh: '017', maQuanHuyen: '153', tenQuanHuyen: 'Huyện Cư Jút'),
  QuanHuyen(
      maTinhThanh: '017', maQuanHuyen: '154', tenQuanHuyen: 'Huyện Đăk Glong'),
  QuanHuyen(
      maTinhThanh: '017', maQuanHuyen: '155', tenQuanHuyen: 'Huyện Đắk Mil'),
  QuanHuyen(
      maTinhThanh: '017',
      maQuanHuyen: '156',
      tenQuanHuyen: 'Huyện Đắk R' 'Lấp'),
  QuanHuyen(
      maTinhThanh: '017', maQuanHuyen: '157', tenQuanHuyen: 'Huyện Đắk Song'),
  QuanHuyen(
      maTinhThanh: '017', maQuanHuyen: '158', tenQuanHuyen: 'Huyện Krông Nô'),
  QuanHuyen(
      maTinhThanh: '017', maQuanHuyen: '159', tenQuanHuyen: 'Huyện Tuy Đức'),
  QuanHuyen(
      maTinhThanh: '017',
      maQuanHuyen: '160',
      tenQuanHuyen: 'Thành phố Gia Nghĩa'),
  QuanHuyen(
      maTinhThanh: '018', maQuanHuyen: '161', tenQuanHuyen: 'Huyện Điện Biên'),
  QuanHuyen(
      maTinhThanh: '018',
      maQuanHuyen: '162',
      tenQuanHuyen: 'Huyện Điện Biên Đông'),
  QuanHuyen(
      maTinhThanh: '018', maQuanHuyen: '163', tenQuanHuyen: 'Huyện Mường Ảng'),
  QuanHuyen(
      maTinhThanh: '018', maQuanHuyen: '164', tenQuanHuyen: 'Huyện Mường Chà'),
  QuanHuyen(
      maTinhThanh: '018', maQuanHuyen: '165', tenQuanHuyen: 'Huyện Mường Nhé'),
  QuanHuyen(
      maTinhThanh: '018', maQuanHuyen: '166', tenQuanHuyen: 'Huyện Nậm Pồ'),
  QuanHuyen(
      maTinhThanh: '018', maQuanHuyen: '167', tenQuanHuyen: 'Huyện Tủa Chùa'),
  QuanHuyen(
      maTinhThanh: '018', maQuanHuyen: '168', tenQuanHuyen: 'Huyện Tuần Giáo'),
  QuanHuyen(
      maTinhThanh: '018',
      maQuanHuyen: '169',
      tenQuanHuyen: 'Thành phố Điện Biên Phủ'),
  QuanHuyen(
      maTinhThanh: '018', maQuanHuyen: '170', tenQuanHuyen: 'Thị Xã Mường Lay'),
  QuanHuyen(
      maTinhThanh: '019', maQuanHuyen: '171', tenQuanHuyen: 'Huyện Cẩm Mỹ'),
  QuanHuyen(
      maTinhThanh: '019', maQuanHuyen: '172', tenQuanHuyen: 'Huyện Định Quán'),
  QuanHuyen(
      maTinhThanh: '019', maQuanHuyen: '173', tenQuanHuyen: 'Huyện Long Thành'),
  QuanHuyen(
      maTinhThanh: '019', maQuanHuyen: '174', tenQuanHuyen: 'Huyện Nhơn Trạch'),
  QuanHuyen(
      maTinhThanh: '019', maQuanHuyen: '175', tenQuanHuyen: 'Huyện Tân Phú'),
  QuanHuyen(
      maTinhThanh: '019', maQuanHuyen: '176', tenQuanHuyen: 'Huyện Thống Nhất'),
  QuanHuyen(
      maTinhThanh: '019', maQuanHuyen: '177', tenQuanHuyen: 'Huyện Trảng Bom'),
  QuanHuyen(
      maTinhThanh: '019', maQuanHuyen: '178', tenQuanHuyen: 'Huyện Vĩnh Cửu'),
  QuanHuyen(
      maTinhThanh: '019', maQuanHuyen: '179', tenQuanHuyen: 'Huyện Xuân Lộc'),
  QuanHuyen(
      maTinhThanh: '019',
      maQuanHuyen: '180',
      tenQuanHuyen: 'Thành phố Biên Hòa'),
  QuanHuyen(
      maTinhThanh: '019',
      maQuanHuyen: '181',
      tenQuanHuyen: 'Thành phố Long Khánh'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '182', tenQuanHuyen: 'Huyện Cao Lãnh'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '183', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '184', tenQuanHuyen: 'Huyện Hồng Ngự'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '185', tenQuanHuyen: 'Huyện Lai Vung'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '186', tenQuanHuyen: 'Huyện Lấp Vò'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '187', tenQuanHuyen: 'Huyện Tam Nông'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '188', tenQuanHuyen: 'Huyện Tân Hồng'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '189', tenQuanHuyen: 'Huyện Thanh Bình'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '190', tenQuanHuyen: 'Huyện Tháp Mười'),
  QuanHuyen(
      maTinhThanh: '020',
      maQuanHuyen: '191',
      tenQuanHuyen: 'Thành phố Cao Lãnh'),
  QuanHuyen(
      maTinhThanh: '020',
      maQuanHuyen: '192',
      tenQuanHuyen: 'Thành phố Hồng Ngự'),
  QuanHuyen(
      maTinhThanh: '020', maQuanHuyen: '193', tenQuanHuyen: 'Thành phố Sa Đéc'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '194', tenQuanHuyen: 'Huyện Chư Păh'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '195', tenQuanHuyen: 'Huyện Chư Prông'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '196', tenQuanHuyen: 'Huyện Chư Pưh'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '197', tenQuanHuyen: 'Huyện Chư Sê'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '198', tenQuanHuyen: 'Huyện Đăk Đoa'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '199', tenQuanHuyen: 'Huyện Đăk Pơ'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '200', tenQuanHuyen: 'Huyện Đức Cơ'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '201', tenQuanHuyen: 'Huyện Ia Grai'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '202', tenQuanHuyen: 'Huyện Ia Pa'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '203', tenQuanHuyen: 'Huyện KBang'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '204', tenQuanHuyen: 'Huyện Kông Chro'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '205', tenQuanHuyen: 'Huyện Krông Pa'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '206', tenQuanHuyen: 'Huyện Mang Yang'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '207', tenQuanHuyen: 'Huyện Phú Thiện'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '208', tenQuanHuyen: 'Thành phố Pleiku'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '209', tenQuanHuyen: 'Thị xã An Khê'),
  QuanHuyen(
      maTinhThanh: '021', maQuanHuyen: '210', tenQuanHuyen: 'Thị xã Ayun Pa'),
  QuanHuyen(
      maTinhThanh: '022', maQuanHuyen: '211', tenQuanHuyen: 'Huyện Bắc Mê'),
  QuanHuyen(
      maTinhThanh: '022', maQuanHuyen: '212', tenQuanHuyen: 'Huyện Bắc Quang'),
  QuanHuyen(
      maTinhThanh: '022', maQuanHuyen: '213', tenQuanHuyen: 'Huyện Đồng Văn'),
  QuanHuyen(
      maTinhThanh: '022',
      maQuanHuyen: '214',
      tenQuanHuyen: 'Huyện Hoàng Su Phì'),
  QuanHuyen(
      maTinhThanh: '022', maQuanHuyen: '215', tenQuanHuyen: 'Huyện Mèo Vạc'),
  QuanHuyen(
      maTinhThanh: '022', maQuanHuyen: '216', tenQuanHuyen: 'Huyện Quản Bạ'),
  QuanHuyen(
      maTinhThanh: '022', maQuanHuyen: '217', tenQuanHuyen: 'Huyện Quang Bình'),
  QuanHuyen(
      maTinhThanh: '022', maQuanHuyen: '218', tenQuanHuyen: 'Huyện Vị Xuyên'),
  QuanHuyen(
      maTinhThanh: '022', maQuanHuyen: '219', tenQuanHuyen: 'Huyện Xín Mần'),
  QuanHuyen(
      maTinhThanh: '022', maQuanHuyen: '220', tenQuanHuyen: 'Huyện Yên Minh'),
  QuanHuyen(
      maTinhThanh: '022',
      maQuanHuyen: '221',
      tenQuanHuyen: 'Thành phố Hà Giang'),
  QuanHuyen(
      maTinhThanh: '023', maQuanHuyen: '222', tenQuanHuyen: 'Huyện Bình Lục'),
  QuanHuyen(
      maTinhThanh: '023', maQuanHuyen: '223', tenQuanHuyen: 'Huyện Kim Bảng'),
  QuanHuyen(
      maTinhThanh: '023', maQuanHuyen: '224', tenQuanHuyen: 'Huyện Lý Nhân'),
  QuanHuyen(
      maTinhThanh: '023', maQuanHuyen: '225', tenQuanHuyen: 'Huyện Thanh Liêm'),
  QuanHuyen(
      maTinhThanh: '023', maQuanHuyen: '226', tenQuanHuyen: 'Thành phố Phủ Lý'),
  QuanHuyen(
      maTinhThanh: '023', maQuanHuyen: '227', tenQuanHuyen: 'Thị xã Duy Tiên'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '228', tenQuanHuyen: 'Huyện Ba Vì'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '229', tenQuanHuyen: 'Huyện Chương Mỹ'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '230', tenQuanHuyen: 'Huyện Đan Phượng'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '231', tenQuanHuyen: 'Huyện Đông Anh'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '232', tenQuanHuyen: 'Huyện Gia Lâm'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '233', tenQuanHuyen: 'Huyện Hoài Đức'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '234', tenQuanHuyen: 'Huyện Mê Linh'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '235', tenQuanHuyen: 'Huyện Mỹ Đức'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '236', tenQuanHuyen: 'Huyện Phú Xuyên'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '237', tenQuanHuyen: 'Huyện Phúc Thọ'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '238', tenQuanHuyen: 'Huyện Quốc Oai'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '239', tenQuanHuyen: 'Huyện Sóc Sơn'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '240', tenQuanHuyen: 'Huyện Thạch Thất'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '241', tenQuanHuyen: 'Huyện Thanh Oai'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '242', tenQuanHuyen: 'Huyện Thanh Trì'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '243', tenQuanHuyen: 'Huyện Thường Tín'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '244', tenQuanHuyen: 'Huyện Ứng Hòa'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '245', tenQuanHuyen: 'Quận Ba Đình'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '246', tenQuanHuyen: 'Quận Bắc Từ Liêm'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '247', tenQuanHuyen: 'Quận Cầu Giấy'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '248', tenQuanHuyen: 'Quận Đống Đa'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '249', tenQuanHuyen: 'Quận Hà Đông'),
  QuanHuyen(
      maTinhThanh: '024',
      maQuanHuyen: '250',
      tenQuanHuyen: 'Quận Hai Bà Trưng'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '251', tenQuanHuyen: 'Quận Hoàn Kiếm'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '252', tenQuanHuyen: 'Quận Hoàng Mai'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '253', tenQuanHuyen: 'Quận Long Biên'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '254', tenQuanHuyen: 'Quận Nam Từ Liêm'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '255', tenQuanHuyen: 'Quận Tây Hồ'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '256', tenQuanHuyen: 'Quận Thanh Xuân'),
  QuanHuyen(
      maTinhThanh: '024', maQuanHuyen: '257', tenQuanHuyen: 'Thị xã Sơn Tây'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '258', tenQuanHuyen: 'Huyện Cẩm Xuyên'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '259', tenQuanHuyen: 'Huyện Can Lộc'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '260', tenQuanHuyen: 'Huyện Đức Thọ'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '261', tenQuanHuyen: 'Huyện Hương Khê'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '262', tenQuanHuyen: 'Huyện Hương Sơn'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '263', tenQuanHuyen: 'Huyện Kỳ Anh'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '264', tenQuanHuyen: 'Huyện Lộc Hà'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '265', tenQuanHuyen: 'Huyện Nghi Xuân'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '266', tenQuanHuyen: 'Huyện Thạch Hà'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '267', tenQuanHuyen: 'Huyện Vũ Quang'),
  QuanHuyen(
      maTinhThanh: '025',
      maQuanHuyen: '268',
      tenQuanHuyen: 'Thành phố Hà Tĩnh'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '269', tenQuanHuyen: 'Thị xã Hồng Lĩnh'),
  QuanHuyen(
      maTinhThanh: '025', maQuanHuyen: '270', tenQuanHuyen: 'Thị xã Kỳ Anh'),
  QuanHuyen(
      maTinhThanh: '026', maQuanHuyen: '271', tenQuanHuyen: 'Huyện Bình Giang'),
  QuanHuyen(
      maTinhThanh: '026', maQuanHuyen: '272', tenQuanHuyen: 'Huyện Cẩm Giàng'),
  QuanHuyen(
      maTinhThanh: '026', maQuanHuyen: '273', tenQuanHuyen: 'Huyện Gia Lộc'),
  QuanHuyen(
      maTinhThanh: '026', maQuanHuyen: '274', tenQuanHuyen: 'Huyện Kim Thành'),
  QuanHuyen(
      maTinhThanh: '026', maQuanHuyen: '275', tenQuanHuyen: 'Huyện Ninh Giang'),
  QuanHuyen(
      maTinhThanh: '026', maQuanHuyen: '276', tenQuanHuyen: 'Huyện Thanh Hà'),
  QuanHuyen(
      maTinhThanh: '026', maQuanHuyen: '277', tenQuanHuyen: 'Huyện Thanh Miện'),
  QuanHuyen(
      maTinhThanh: '026', maQuanHuyen: '278', tenQuanHuyen: 'Huyện Tứ Kỳ'),
  QuanHuyen(
      maTinhThanh: '026',
      maQuanHuyen: '279',
      tenQuanHuyen: 'Thành phố Chí Linh'),
  QuanHuyen(
      maTinhThanh: '026',
      maQuanHuyen: '280',
      tenQuanHuyen: 'Thành phố Hải Dương'),
  QuanHuyen(
      maTinhThanh: '026', maQuanHuyen: '281', tenQuanHuyen: 'Thị xã Kinh Môn'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '282', tenQuanHuyen: 'Huyện An Dương'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '283', tenQuanHuyen: 'Huyện An Lão'),
  QuanHuyen(
      maTinhThanh: '027',
      maQuanHuyen: '284',
      tenQuanHuyen: 'Huyện Bạch Long Vĩ'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '285', tenQuanHuyen: 'Huyện Cát Hải'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '286', tenQuanHuyen: 'Huyện Kiến Thuỵ'),
  QuanHuyen(
      maTinhThanh: '027',
      maQuanHuyen: '287',
      tenQuanHuyen: 'Huyện Thuỷ Nguyên'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '288', tenQuanHuyen: 'Huyện Tiên Lãng'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '289', tenQuanHuyen: 'Huyện Vĩnh Bảo'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '290', tenQuanHuyen: 'Quận Đồ Sơn'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '291', tenQuanHuyen: 'Quận Dương Kinh'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '292', tenQuanHuyen: 'Quận Hải An'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '293', tenQuanHuyen: 'Quận Hồng Bàng'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '294', tenQuanHuyen: 'Quận Kiến An'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '295', tenQuanHuyen: 'Quận Lê Chân'),
  QuanHuyen(
      maTinhThanh: '027', maQuanHuyen: '296', tenQuanHuyen: 'Quận Ngô Quyền'),
  QuanHuyen(
      maTinhThanh: '028', maQuanHuyen: '297', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '028',
      maQuanHuyen: '298',
      tenQuanHuyen: 'Huyện Châu Thành A'),
  QuanHuyen(
      maTinhThanh: '028', maQuanHuyen: '299', tenQuanHuyen: 'Huyện Long Mỹ'),
  QuanHuyen(
      maTinhThanh: '028', maQuanHuyen: '300', tenQuanHuyen: 'Huyện Phụng Hiệp'),
  QuanHuyen(
      maTinhThanh: '028', maQuanHuyen: '301', tenQuanHuyen: 'Huyện Vị Thuỷ'),
  QuanHuyen(
      maTinhThanh: '028',
      maQuanHuyen: '302',
      tenQuanHuyen: 'Thành phố Ngã Bảy'),
  QuanHuyen(
      maTinhThanh: '028',
      maQuanHuyen: '303',
      tenQuanHuyen: 'Thành phố Vị Thanh'),
  QuanHuyen(
      maTinhThanh: '028', maQuanHuyen: '304', tenQuanHuyen: 'Thị xã Long Mỹ'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '305', tenQuanHuyen: 'Huyện Bình Chánh'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '306', tenQuanHuyen: 'Huyện Cần Giờ'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '307', tenQuanHuyen: 'Huyện Củ Chi'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '308', tenQuanHuyen: 'Huyện Hóc Môn'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '309', tenQuanHuyen: 'Huyện Nhà Bè'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '310', tenQuanHuyen: 'Quận 1'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '311', tenQuanHuyen: 'Quận 10'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '312', tenQuanHuyen: 'Quận 11'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '313', tenQuanHuyen: 'Quận 12'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '314', tenQuanHuyen: 'Quận 3'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '315', tenQuanHuyen: 'Quận 4'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '316', tenQuanHuyen: 'Quận 5'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '317', tenQuanHuyen: 'Quận 6'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '318', tenQuanHuyen: 'Quận 7'),
  QuanHuyen(maTinhThanh: '029', maQuanHuyen: '319', tenQuanHuyen: 'Quận 8'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '320', tenQuanHuyen: 'Quận Bình Tân'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '321', tenQuanHuyen: 'Quận Bình Thạnh'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '322', tenQuanHuyen: 'Quận Gò Vấp'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '323', tenQuanHuyen: 'Quận Phú Nhuận'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '324', tenQuanHuyen: 'Quận Tân Bình'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '325', tenQuanHuyen: 'Quận Tân Bình'),
  QuanHuyen(
      maTinhThanh: '029', maQuanHuyen: '326', tenQuanHuyen: 'Quận Tân Phú'),
  QuanHuyen(
      maTinhThanh: '029',
      maQuanHuyen: '327',
      tenQuanHuyen: 'Thành phố Thủ Đức'),
  QuanHuyen(
      maTinhThanh: '030', maQuanHuyen: '328', tenQuanHuyen: 'Huyện Cao Phong'),
  QuanHuyen(
      maTinhThanh: '030', maQuanHuyen: '329', tenQuanHuyen: 'Huyện Đà Bắc'),
  QuanHuyen(
      maTinhThanh: '030', maQuanHuyen: '330', tenQuanHuyen: 'Huyện Kim Bôi'),
  QuanHuyen(
      maTinhThanh: '030', maQuanHuyen: '331', tenQuanHuyen: 'Huyện Lạc Sơn'),
  QuanHuyen(
      maTinhThanh: '030', maQuanHuyen: '332', tenQuanHuyen: 'Huyện Lạc Thủy'),
  QuanHuyen(
      maTinhThanh: '030', maQuanHuyen: '333', tenQuanHuyen: 'Huyện Lương Sơn'),
  QuanHuyen(
      maTinhThanh: '030', maQuanHuyen: '334', tenQuanHuyen: 'Huyện Mai Châu'),
  QuanHuyen(
      maTinhThanh: '030', maQuanHuyen: '335', tenQuanHuyen: 'Huyện Tân Lạc'),
  QuanHuyen(
      maTinhThanh: '030', maQuanHuyen: '336', tenQuanHuyen: 'Huyện Yên Thủy'),
  QuanHuyen(
      maTinhThanh: '030',
      maQuanHuyen: '337',
      tenQuanHuyen: 'Thành phố Hòa Bình'),
  QuanHuyen(
      maTinhThanh: '031', maQuanHuyen: '338', tenQuanHuyen: 'Huyện Ân Thi'),
  QuanHuyen(
      maTinhThanh: '031', maQuanHuyen: '339', tenQuanHuyen: 'Huyện Khoái Châu'),
  QuanHuyen(
      maTinhThanh: '031', maQuanHuyen: '340', tenQuanHuyen: 'Huyện Kim Động'),
  QuanHuyen(
      maTinhThanh: '031', maQuanHuyen: '341', tenQuanHuyen: 'Huyện Phù Cừ'),
  QuanHuyen(
      maTinhThanh: '031', maQuanHuyen: '342', tenQuanHuyen: 'Huyện Tiên Lữ'),
  QuanHuyen(
      maTinhThanh: '031', maQuanHuyen: '343', tenQuanHuyen: 'Huyện Văn Giang'),
  QuanHuyen(
      maTinhThanh: '031', maQuanHuyen: '344', tenQuanHuyen: 'Huyện Văn Lâm'),
  QuanHuyen(
      maTinhThanh: '031', maQuanHuyen: '345', tenQuanHuyen: 'Huyện Yên Mỹ'),
  QuanHuyen(
      maTinhThanh: '031',
      maQuanHuyen: '346',
      tenQuanHuyen: 'Thành phố Hưng Yên'),
  QuanHuyen(
      maTinhThanh: '031', maQuanHuyen: '347', tenQuanHuyen: 'Thị xã Mỹ Hào'),
  QuanHuyen(
      maTinhThanh: '032', maQuanHuyen: '348', tenQuanHuyen: 'Huyện Cam Lâm'),
  QuanHuyen(
      maTinhThanh: '032', maQuanHuyen: '349', tenQuanHuyen: 'Huyện Diên Khánh'),
  QuanHuyen(
      maTinhThanh: '032', maQuanHuyen: '350', tenQuanHuyen: 'Huyện Khánh Sơn'),
  QuanHuyen(
      maTinhThanh: '032', maQuanHuyen: '351', tenQuanHuyen: 'Huyện Khánh Vĩnh'),
  QuanHuyen(
      maTinhThanh: '032', maQuanHuyen: '352', tenQuanHuyen: 'Huyện Trường Sa'),
  QuanHuyen(
      maTinhThanh: '032', maQuanHuyen: '353', tenQuanHuyen: 'Huyện Vạn Ninh'),
  QuanHuyen(
      maTinhThanh: '032',
      maQuanHuyen: '354',
      tenQuanHuyen: 'Thành phố Cam Ranh'),
  QuanHuyen(
      maTinhThanh: '032',
      maQuanHuyen: '355',
      tenQuanHuyen: 'Thành phố Nha Trang'),
  QuanHuyen(
      maTinhThanh: '032', maQuanHuyen: '356', tenQuanHuyen: 'Thị xã Ninh Hòa'),
  QuanHuyen(
      maTinhThanh: '033', maQuanHuyen: '357', tenQuanHuyen: 'Huyện An Biên'),
  QuanHuyen(
      maTinhThanh: '033', maQuanHuyen: '358', tenQuanHuyen: 'Huyện An Minh'),
  QuanHuyen(
      maTinhThanh: '033', maQuanHuyen: '359', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '033',
      maQuanHuyen: '360',
      tenQuanHuyen: 'Huyện Giang Thành'),
  QuanHuyen(
      maTinhThanh: '033',
      maQuanHuyen: '361',
      tenQuanHuyen: 'Huyện Giồng Riềng'),
  QuanHuyen(
      maTinhThanh: '033', maQuanHuyen: '362', tenQuanHuyen: 'Huyện Gò Quao'),
  QuanHuyen(
      maTinhThanh: '033', maQuanHuyen: '363', tenQuanHuyen: 'Huyện Hòn Đất'),
  QuanHuyen(
      maTinhThanh: '033', maQuanHuyen: '364', tenQuanHuyen: 'Huyện Kiên Hải'),
  QuanHuyen(
      maTinhThanh: '033', maQuanHuyen: '365', tenQuanHuyen: 'Huyện Kiên Lương'),
  QuanHuyen(
      maTinhThanh: '033', maQuanHuyen: '366', tenQuanHuyen: 'Huyện Tân Hiệp'),
  QuanHuyen(
      maTinhThanh: '033',
      maQuanHuyen: '367',
      tenQuanHuyen: 'Huyện U Minh Thượng'),
  QuanHuyen(
      maTinhThanh: '033', maQuanHuyen: '368', tenQuanHuyen: 'Huyện Vĩnh Thuận'),
  QuanHuyen(
      maTinhThanh: '033',
      maQuanHuyen: '369',
      tenQuanHuyen: 'Thành phố Hà Tiên'),
  QuanHuyen(
      maTinhThanh: '033',
      maQuanHuyen: '370',
      tenQuanHuyen: 'Thành phố Phú Quốc'),
  QuanHuyen(
      maTinhThanh: '033',
      maQuanHuyen: '371',
      tenQuanHuyen: 'Thành phố Rạch Giá'),
  QuanHuyen(
      maTinhThanh: '034', maQuanHuyen: '372', tenQuanHuyen: 'Huyện Đắk Glei'),
  QuanHuyen(
      maTinhThanh: '034', maQuanHuyen: '373', tenQuanHuyen: 'Huyện Đắk Hà'),
  QuanHuyen(
      maTinhThanh: '034', maQuanHuyen: '374', tenQuanHuyen: 'Huyện Đắk Tô'),
  QuanHuyen(
      maTinhThanh: '034',
      maQuanHuyen: '375',
      tenQuanHuyen: 'Huyện Ia H\' Drai'),
  QuanHuyen(
      maTinhThanh: '034', maQuanHuyen: '376', tenQuanHuyen: 'Huyện Kon Plông'),
  QuanHuyen(
      maTinhThanh: '034', maQuanHuyen: '377', tenQuanHuyen: 'Huyện Kon Rẫy'),
  QuanHuyen(
      maTinhThanh: '034', maQuanHuyen: '378', tenQuanHuyen: 'Huyện Ngọc Hồi'),
  QuanHuyen(
      maTinhThanh: '034', maQuanHuyen: '379', tenQuanHuyen: 'Huyện Sa Thầy'),
  QuanHuyen(
      maTinhThanh: '034', maQuanHuyen: '380', tenQuanHuyen: 'Huyện Tu Mơ Rông'),
  QuanHuyen(
      maTinhThanh: '034',
      maQuanHuyen: '381',
      tenQuanHuyen: 'Thành phố Kon Tum'),
  QuanHuyen(
      maTinhThanh: '035', maQuanHuyen: '382', tenQuanHuyen: 'Huyện Mường Tè'),
  QuanHuyen(
      maTinhThanh: '035', maQuanHuyen: '383', tenQuanHuyen: 'Huyện Nậm Nhùn'),
  QuanHuyen(
      maTinhThanh: '035', maQuanHuyen: '384', tenQuanHuyen: 'Huyện Phong Thổ'),
  QuanHuyen(
      maTinhThanh: '035', maQuanHuyen: '385', tenQuanHuyen: 'Huyện Sìn Hồ'),
  QuanHuyen(
      maTinhThanh: '035', maQuanHuyen: '386', tenQuanHuyen: 'Huyện Tam Đường'),
  QuanHuyen(
      maTinhThanh: '035', maQuanHuyen: '387', tenQuanHuyen: 'Huyện Tân Uyên'),
  QuanHuyen(
      maTinhThanh: '035', maQuanHuyen: '388', tenQuanHuyen: 'Huyện Than Uyên'),
  QuanHuyen(
      maTinhThanh: '035',
      maQuanHuyen: '389',
      tenQuanHuyen: 'Thành phố Lai Châu'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '390', tenQuanHuyen: 'Huyện Bảo Lâm'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '391', tenQuanHuyen: 'Huyện Cát Tiên'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '392', tenQuanHuyen: 'Huyện Đạ Huoai'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '393', tenQuanHuyen: 'Huyện Đạ Tẻh'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '394', tenQuanHuyen: 'Huyện Đam Rông'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '395', tenQuanHuyen: 'Huyện Di Linh'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '396', tenQuanHuyen: 'Huyện Đơn Dương'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '397', tenQuanHuyen: 'Huyện Đức Trọng'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '398', tenQuanHuyen: 'Huyện Lạc Dương'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '399', tenQuanHuyen: 'Huyện Lâm Hà'),
  QuanHuyen(
      maTinhThanh: '036',
      maQuanHuyen: '400',
      tenQuanHuyen: 'Thành phố Bảo Lộc'),
  QuanHuyen(
      maTinhThanh: '036', maQuanHuyen: '401', tenQuanHuyen: 'Thành phố Đà Lạt'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '402', tenQuanHuyen: 'Huyện Bắc Sơn'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '403', tenQuanHuyen: 'Huyện Bình Gia'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '404', tenQuanHuyen: 'Huyện Cao Lộc'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '405', tenQuanHuyen: 'Huyện Chi Lăng'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '406', tenQuanHuyen: 'Huyện Đình Lập'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '407', tenQuanHuyen: 'Huyện Hữu Lũng'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '408', tenQuanHuyen: 'Huyện Lộc Bình'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '409', tenQuanHuyen: 'Huyện Tràng Định'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '410', tenQuanHuyen: 'Huyện Văn Lãng'),
  QuanHuyen(
      maTinhThanh: '037', maQuanHuyen: '411', tenQuanHuyen: 'Huyện Văn Quan'),
  QuanHuyen(
      maTinhThanh: '037',
      maQuanHuyen: '412',
      tenQuanHuyen: 'Thành phố Lạng Sơn'),
  QuanHuyen(
      maTinhThanh: '038', maQuanHuyen: '413', tenQuanHuyen: 'Huyện Bắc Hà'),
  QuanHuyen(
      maTinhThanh: '038', maQuanHuyen: '414', tenQuanHuyen: 'Huyện Bảo Thắng'),
  QuanHuyen(
      maTinhThanh: '038', maQuanHuyen: '415', tenQuanHuyen: 'Huyện Bảo Yên'),
  QuanHuyen(
      maTinhThanh: '038', maQuanHuyen: '416', tenQuanHuyen: 'Huyện Bát Xát'),
  QuanHuyen(
      maTinhThanh: '038',
      maQuanHuyen: '417',
      tenQuanHuyen: 'Huyện Mường Khương'),
  QuanHuyen(
      maTinhThanh: '038', maQuanHuyen: '418', tenQuanHuyen: 'Huyện Si Ma Cai'),
  QuanHuyen(
      maTinhThanh: '038', maQuanHuyen: '419', tenQuanHuyen: 'Huyện Văn Bàn'),
  QuanHuyen(
      maTinhThanh: '038',
      maQuanHuyen: '420',
      tenQuanHuyen: 'Thành phố Lào Cai'),
  QuanHuyen(
      maTinhThanh: '038', maQuanHuyen: '421', tenQuanHuyen: 'Thị xã Sa Pa'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '422', tenQuanHuyen: 'Huyện Bến Lức'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '423', tenQuanHuyen: 'Huyện Cần Đước'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '424', tenQuanHuyen: 'Huyện Cần Giuộc'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '425', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '426', tenQuanHuyen: 'Huyện Đức Hòa'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '427', tenQuanHuyen: 'Huyện Đức Huệ'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '428', tenQuanHuyen: 'Huyện Mộc Hóa'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '429', tenQuanHuyen: 'Huyện Tân Hưng'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '430', tenQuanHuyen: 'Huyện Tân Thạnh'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '431', tenQuanHuyen: 'Huyện Tân Trụ'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '432', tenQuanHuyen: 'Huyện Thạnh Hóa'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '433', tenQuanHuyen: 'Huyện Thủ Thừa'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '434', tenQuanHuyen: 'Huyện Vĩnh Hưng'),
  QuanHuyen(
      maTinhThanh: '039', maQuanHuyen: '435', tenQuanHuyen: 'Thành phố Tân An'),
  QuanHuyen(
      maTinhThanh: '039',
      maQuanHuyen: '436',
      tenQuanHuyen: 'Thị xã Kiến Tường'),
  QuanHuyen(
      maTinhThanh: '040', maQuanHuyen: '437', tenQuanHuyen: 'Huyện Giao Thủy'),
  QuanHuyen(
      maTinhThanh: '040', maQuanHuyen: '438', tenQuanHuyen: 'Huyện Hải Hậu'),
  QuanHuyen(
      maTinhThanh: '040', maQuanHuyen: '439', tenQuanHuyen: 'Huyện Mỹ Lộc'),
  QuanHuyen(
      maTinhThanh: '040', maQuanHuyen: '440', tenQuanHuyen: 'Huyện Nam Trực'),
  QuanHuyen(
      maTinhThanh: '040', maQuanHuyen: '441', tenQuanHuyen: 'Huyện Nghĩa Hưng'),
  QuanHuyen(
      maTinhThanh: '040', maQuanHuyen: '442', tenQuanHuyen: 'Huyện Trực Ninh'),
  QuanHuyen(
      maTinhThanh: '040', maQuanHuyen: '443', tenQuanHuyen: 'Huyện Vụ Bản'),
  QuanHuyen(
      maTinhThanh: '040',
      maQuanHuyen: '444',
      tenQuanHuyen: 'Huyện Xuân Trường'),
  QuanHuyen(
      maTinhThanh: '040', maQuanHuyen: '445', tenQuanHuyen: 'Huyện Ý Yên'),
  QuanHuyen(
      maTinhThanh: '040',
      maQuanHuyen: '446',
      tenQuanHuyen: 'Thành phố Nam Định'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '447', tenQuanHuyen: 'Huyện Anh Sơn'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '448', tenQuanHuyen: 'Huyện Con Cuông'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '449', tenQuanHuyen: 'Huyện Diễn Châu'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '450', tenQuanHuyen: 'Huyện Đô Lương'),
  QuanHuyen(
      maTinhThanh: '041',
      maQuanHuyen: '451',
      tenQuanHuyen: 'Huyện Hưng Nguyên'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '452', tenQuanHuyen: 'Huyện Kỳ Sơn'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '453', tenQuanHuyen: 'Huyện Nam Đàn'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '454', tenQuanHuyen: 'Huyện Nghi Lộc'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '455', tenQuanHuyen: 'Huyện Nghĩa Đàn'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '456', tenQuanHuyen: 'Huyện Quế Phong'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '457', tenQuanHuyen: 'Huyện Quỳ Châu'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '458', tenQuanHuyen: 'Huyện Quỳ Hợp'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '459', tenQuanHuyen: 'Huyện Quỳnh Lưu'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '460', tenQuanHuyen: 'Huyện Tân Kỳ'),
  QuanHuyen(
      maTinhThanh: '041',
      maQuanHuyen: '461',
      tenQuanHuyen: 'Huyện Thanh Chương'),
  QuanHuyen(
      maTinhThanh: '041',
      maQuanHuyen: '462',
      tenQuanHuyen: 'Huyện Tương Dương'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '463', tenQuanHuyen: 'Huyện Yên Thành'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '464', tenQuanHuyen: 'Thành phố Vinh'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '465', tenQuanHuyen: 'Thị xã Cửa Lò'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '466', tenQuanHuyen: 'Thị xã Hoàng Mai'),
  QuanHuyen(
      maTinhThanh: '041', maQuanHuyen: '467', tenQuanHuyen: 'Thị xã Thái Hoà'),
  QuanHuyen(
      maTinhThanh: '042', maQuanHuyen: '468', tenQuanHuyen: 'Huyện Gia Viễn'),
  QuanHuyen(
      maTinhThanh: '042', maQuanHuyen: '469', tenQuanHuyen: 'Huyện Hoa Lư'),
  QuanHuyen(
      maTinhThanh: '042', maQuanHuyen: '470', tenQuanHuyen: 'Huyện Kim Sơn'),
  QuanHuyen(
      maTinhThanh: '042', maQuanHuyen: '471', tenQuanHuyen: 'Huyện Nho Quan'),
  QuanHuyen(
      maTinhThanh: '042', maQuanHuyen: '472', tenQuanHuyen: 'Huyện Yên Khánh'),
  QuanHuyen(
      maTinhThanh: '042', maQuanHuyen: '473', tenQuanHuyen: 'Huyện Yên Mô'),
  QuanHuyen(
      maTinhThanh: '042',
      maQuanHuyen: '474',
      tenQuanHuyen: 'Thành phố Ninh Bình'),
  QuanHuyen(
      maTinhThanh: '042',
      maQuanHuyen: '475',
      tenQuanHuyen: 'Thành phố Tam Điệp'),
  QuanHuyen(
      maTinhThanh: '043', maQuanHuyen: '476', tenQuanHuyen: 'Huyện Bác Ái'),
  QuanHuyen(
      maTinhThanh: '043', maQuanHuyen: '477', tenQuanHuyen: 'Huyện Ninh Hải'),
  QuanHuyen(
      maTinhThanh: '043', maQuanHuyen: '478', tenQuanHuyen: 'Huyện Ninh Phước'),
  QuanHuyen(
      maTinhThanh: '043', maQuanHuyen: '479', tenQuanHuyen: 'Huyện Ninh Sơn'),
  QuanHuyen(
      maTinhThanh: '043', maQuanHuyen: '480', tenQuanHuyen: 'Huyện Thuận Bắc'),
  QuanHuyen(
      maTinhThanh: '043', maQuanHuyen: '481', tenQuanHuyen: 'Huyện Thuận Nam'),
  QuanHuyen(
      maTinhThanh: '043',
      maQuanHuyen: '482',
      tenQuanHuyen: 'Thành phố Phan Rang-Tháp Chàm'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '444', tenQuanHuyen: 'Huyện Cẩm Khê'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '445', tenQuanHuyen: 'Huyện Đoan Hùng'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '446', tenQuanHuyen: 'Huyện Hạ Hoà'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '447', tenQuanHuyen: 'Huyện Lâm Thao'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '448', tenQuanHuyen: 'Huyện Phù Ninh'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '449', tenQuanHuyen: 'Huyện Tam Nông'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '450', tenQuanHuyen: 'Huyện Tân Sơn'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '451', tenQuanHuyen: 'Huyện Thanh Ba'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '452', tenQuanHuyen: 'Huyện Thanh Sơn'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '453', tenQuanHuyen: 'Huyện Thanh Thuỷ'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '454', tenQuanHuyen: 'Huyện Yên Lập'),
  QuanHuyen(
      maTinhThanh: '044',
      maQuanHuyen: '455',
      tenQuanHuyen: 'Thành phố Việt Trì'),
  QuanHuyen(
      maTinhThanh: '044', maQuanHuyen: '456', tenQuanHuyen: 'Thị xã Phú Thọ'),
  QuanHuyen(
      maTinhThanh: '045', maQuanHuyen: '496', tenQuanHuyen: 'Huyện Đồng Xuân'),
  QuanHuyen(
      maTinhThanh: '045', maQuanHuyen: '497', tenQuanHuyen: 'Huyện Phú Hoà'),
  QuanHuyen(
      maTinhThanh: '045', maQuanHuyen: '498', tenQuanHuyen: 'Huyện Sơn Hòa'),
  QuanHuyen(
      maTinhThanh: '045', maQuanHuyen: '499', tenQuanHuyen: 'Huyện Sông Hinh'),
  QuanHuyen(
      maTinhThanh: '045', maQuanHuyen: '500', tenQuanHuyen: 'Huyện Tây Hoà'),
  QuanHuyen(
      maTinhThanh: '045', maQuanHuyen: '501', tenQuanHuyen: 'Huyện Tuy An'),
  QuanHuyen(
      maTinhThanh: '045',
      maQuanHuyen: '502',
      tenQuanHuyen: 'Thành phố Tuy Hoà'),
  QuanHuyen(
      maTinhThanh: '045', maQuanHuyen: '503', tenQuanHuyen: 'Thị xã Đông Hòa'),
  QuanHuyen(
      maTinhThanh: '045', maQuanHuyen: '504', tenQuanHuyen: 'Thị xã Sông Cầu'),
  QuanHuyen(
      maTinhThanh: '046', maQuanHuyen: '505', tenQuanHuyen: 'Huyện Bố Trạch'),
  QuanHuyen(
      maTinhThanh: '046', maQuanHuyen: '506', tenQuanHuyen: 'Huyện Lệ Thủy'),
  QuanHuyen(
      maTinhThanh: '046', maQuanHuyen: '507', tenQuanHuyen: 'Huyện Minh Hóa'),
  QuanHuyen(
      maTinhThanh: '046', maQuanHuyen: '508', tenQuanHuyen: 'Huyện Quảng Ninh'),
  QuanHuyen(
      maTinhThanh: '046',
      maQuanHuyen: '509',
      tenQuanHuyen: 'Huyện Quảng Trạch'),
  QuanHuyen(
      maTinhThanh: '046', maQuanHuyen: '510', tenQuanHuyen: 'Huyện Tuyên Hóa'),
  QuanHuyen(
      maTinhThanh: '046',
      maQuanHuyen: '511',
      tenQuanHuyen: 'Thành Phố Đồng Hới'),
  QuanHuyen(
      maTinhThanh: '046', maQuanHuyen: '512', tenQuanHuyen: 'Thị xã Ba Đồn'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '474', tenQuanHuyen: 'Huyện Bắc Trà My'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '475', tenQuanHuyen: 'Huyện Đại Lộc'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '476', tenQuanHuyen: 'Huyện Đông Giang'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '477', tenQuanHuyen: 'Huyện Duy Xuyên'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '478', tenQuanHuyen: 'Huyện Hiệp Đức'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '479', tenQuanHuyen: 'Huyện Nam Giang'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '480', tenQuanHuyen: 'Huyện Nam Trà My'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '481', tenQuanHuyen: 'Huyện Nông Sơn'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '482', tenQuanHuyen: 'Huyện Núi Thành'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '483', tenQuanHuyen: 'Huyện Phú Ninh'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '484', tenQuanHuyen: 'Huyện Phước Sơn'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '485', tenQuanHuyen: 'Huyện Quế Sơn'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '486', tenQuanHuyen: 'Huyện Tây Giang'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '487', tenQuanHuyen: 'Huyện Thăng Bình'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '488', tenQuanHuyen: 'Huyện Tiên Phước'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '489', tenQuanHuyen: 'Thành phố Hội An'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '490', tenQuanHuyen: 'Thành phố Tam Kỳ'),
  QuanHuyen(
      maTinhThanh: '047', maQuanHuyen: '491', tenQuanHuyen: 'Thị xã Điện Bàn'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '531', tenQuanHuyen: 'Huyện Ba Tơ'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '532', tenQuanHuyen: 'Huyện Bình Sơn'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '533', tenQuanHuyen: 'Huyện Lý Sơn'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '534', tenQuanHuyen: 'Huyện Minh Long'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '535', tenQuanHuyen: 'Huyện Mộ Đức'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '536', tenQuanHuyen: 'Huyện Nghĩa Hành'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '537', tenQuanHuyen: 'Huyện Sơn Hà'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '538', tenQuanHuyen: 'Huyện Sơn Tây'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '539', tenQuanHuyen: 'Huyện Sơn Tịnh'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '540', tenQuanHuyen: 'Huyện Trà Bồng'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '541', tenQuanHuyen: 'Huyện Tư Nghĩa'),
  QuanHuyen(
      maTinhThanh: '048',
      maQuanHuyen: '542',
      tenQuanHuyen: 'Thành phố Quảng Ngãi'),
  QuanHuyen(
      maTinhThanh: '048', maQuanHuyen: '543', tenQuanHuyen: 'Thị xã Đức Phổ'),
  QuanHuyen(
      maTinhThanh: '049', maQuanHuyen: '544', tenQuanHuyen: 'Huyện Ba Chẽ'),
  QuanHuyen(
      maTinhThanh: '049', maQuanHuyen: '545', tenQuanHuyen: 'Huyện Bình Liêu'),
  QuanHuyen(
      maTinhThanh: '049', maQuanHuyen: '546', tenQuanHuyen: 'Huyện Cô Tô'),
  QuanHuyen(
      maTinhThanh: '049', maQuanHuyen: '547', tenQuanHuyen: 'Huyện Đầm Hà'),
  QuanHuyen(
      maTinhThanh: '049', maQuanHuyen: '548', tenQuanHuyen: 'Huyện Hải Hà'),
  QuanHuyen(
      maTinhThanh: '049', maQuanHuyen: '549', tenQuanHuyen: 'Huyện Tiên Yên'),
  QuanHuyen(
      maTinhThanh: '049', maQuanHuyen: '550', tenQuanHuyen: 'Huyện Vân Đồn'),
  QuanHuyen(
      maTinhThanh: '049',
      maQuanHuyen: '551',
      tenQuanHuyen: 'Thành phố Cẩm Phả'),
  QuanHuyen(
      maTinhThanh: '049',
      maQuanHuyen: '552',
      tenQuanHuyen: 'Thành phố Hạ Long'),
  QuanHuyen(
      maTinhThanh: '049',
      maQuanHuyen: '553',
      tenQuanHuyen: 'Thành phố Móng Cái'),
  QuanHuyen(
      maTinhThanh: '049',
      maQuanHuyen: '554',
      tenQuanHuyen: 'Thành phố Uông Bí'),
  QuanHuyen(
      maTinhThanh: '049',
      maQuanHuyen: '555',
      tenQuanHuyen: 'Thị xã Đông Triều'),
  QuanHuyen(
      maTinhThanh: '049', maQuanHuyen: '556', tenQuanHuyen: 'Thị xã Quảng Yên'),
  QuanHuyen(
      maTinhThanh: '050', maQuanHuyen: '557', tenQuanHuyen: 'Huyện Cam Lộ'),
  QuanHuyen(
      maTinhThanh: '050', maQuanHuyen: '558', tenQuanHuyen: 'Huyện Cồn Cỏ'),
  QuanHuyen(
      maTinhThanh: '050', maQuanHuyen: '559', tenQuanHuyen: 'Huyện Đa Krông'),
  QuanHuyen(
      maTinhThanh: '050', maQuanHuyen: '560', tenQuanHuyen: 'Huyện Gio Linh'),
  QuanHuyen(
      maTinhThanh: '050', maQuanHuyen: '561', tenQuanHuyen: 'Huyện Hải Lăng'),
  QuanHuyen(
      maTinhThanh: '050', maQuanHuyen: '562', tenQuanHuyen: 'Huyện Hướng Hóa'),
  QuanHuyen(
      maTinhThanh: '050',
      maQuanHuyen: '563',
      tenQuanHuyen: 'Huyện Triệu Phong'),
  QuanHuyen(
      maTinhThanh: '050', maQuanHuyen: '564', tenQuanHuyen: 'Huyện Vĩnh Linh'),
  QuanHuyen(
      maTinhThanh: '050',
      maQuanHuyen: '565',
      tenQuanHuyen: 'Thành phố Đông Hà'),
  QuanHuyen(
      maTinhThanh: '050', maQuanHuyen: '566', tenQuanHuyen: 'Thị xã Quảng Trị'),
  QuanHuyen(
      maTinhThanh: '051', maQuanHuyen: '567', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '051',
      maQuanHuyen: '568',
      tenQuanHuyen: 'Huyện Cù Lao Dung'),
  QuanHuyen(
      maTinhThanh: '051', maQuanHuyen: '569', tenQuanHuyen: 'Huyện Kế Sách'),
  QuanHuyen(
      maTinhThanh: '051', maQuanHuyen: '570', tenQuanHuyen: 'Huyện Long Phú'),
  QuanHuyen(
      maTinhThanh: '051', maQuanHuyen: '571', tenQuanHuyen: 'Huyện Mỹ Tú'),
  QuanHuyen(
      maTinhThanh: '051', maQuanHuyen: '572', tenQuanHuyen: 'Huyện Mỹ Xuyên'),
  QuanHuyen(
      maTinhThanh: '051', maQuanHuyen: '573', tenQuanHuyen: 'Huyện Thạnh Trị'),
  QuanHuyen(
      maTinhThanh: '051', maQuanHuyen: '574', tenQuanHuyen: 'Huyện Trần Đề'),
  QuanHuyen(
      maTinhThanh: '051',
      maQuanHuyen: '575',
      tenQuanHuyen: 'Thành phố Sóc Trăng'),
  QuanHuyen(
      maTinhThanh: '051', maQuanHuyen: '576', tenQuanHuyen: 'Thị xã Ngã Năm'),
  QuanHuyen(
      maTinhThanh: '051', maQuanHuyen: '577', tenQuanHuyen: 'Thị xã Vĩnh Châu'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '578', tenQuanHuyen: 'Huyện Bắc Yên'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '579', tenQuanHuyen: 'Huyện Mai Sơn'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '580', tenQuanHuyen: 'Huyện Mộc Châu'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '581', tenQuanHuyen: 'Huyện Mường La'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '582', tenQuanHuyen: 'Huyện Phù Yên'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '583', tenQuanHuyen: 'Huyện Quỳnh Nhai'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '584', tenQuanHuyen: 'Huyện Sông Mã'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '585', tenQuanHuyen: 'Huyện Sốp Cộp'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '586', tenQuanHuyen: 'Huyện Thuận Châu'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '587', tenQuanHuyen: 'Huyện Vân Hồ'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '588', tenQuanHuyen: 'Huyện Yên Châu'),
  QuanHuyen(
      maTinhThanh: '052', maQuanHuyen: '589', tenQuanHuyen: 'Thành phố Sơn La'),
  QuanHuyen(
      maTinhThanh: '053', maQuanHuyen: '590', tenQuanHuyen: 'Huyện Bến Cầu'),
  QuanHuyen(
      maTinhThanh: '053', maQuanHuyen: '591', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '053',
      maQuanHuyen: '592',
      tenQuanHuyen: 'Huyện Dương Minh Châu'),
  QuanHuyen(
      maTinhThanh: '053', maQuanHuyen: '593', tenQuanHuyen: 'Huyện Gò Dầu'),
  QuanHuyen(
      maTinhThanh: '053', maQuanHuyen: '594', tenQuanHuyen: 'Huyện Tân Biên'),
  QuanHuyen(
      maTinhThanh: '053', maQuanHuyen: '595', tenQuanHuyen: 'Huyện Tân Châu'),
  QuanHuyen(
      maTinhThanh: '053',
      maQuanHuyen: '596',
      tenQuanHuyen: 'Thành phố Tây Ninh'),
  QuanHuyen(
      maTinhThanh: '053', maQuanHuyen: '597', tenQuanHuyen: 'Thị xã Hòa Thành'),
  QuanHuyen(
      maTinhThanh: '053',
      maQuanHuyen: '598',
      tenQuanHuyen: 'Thị xã Trảng Bàng'),
  QuanHuyen(
      maTinhThanh: '054', maQuanHuyen: '599', tenQuanHuyen: 'Huyện Đông Hưng'),
  QuanHuyen(
      maTinhThanh: '054', maQuanHuyen: '600', tenQuanHuyen: 'Huyện Hưng Hà'),
  QuanHuyen(
      maTinhThanh: '054', maQuanHuyen: '601', tenQuanHuyen: 'Huyện Kiến Xương'),
  QuanHuyen(
      maTinhThanh: '054', maQuanHuyen: '602', tenQuanHuyen: 'Huyện Quỳnh Phụ'),
  QuanHuyen(
      maTinhThanh: '054', maQuanHuyen: '603', tenQuanHuyen: 'Huyện Thái Thụy'),
  QuanHuyen(
      maTinhThanh: '054', maQuanHuyen: '604', tenQuanHuyen: 'Huyện Tiền Hải'),
  QuanHuyen(
      maTinhThanh: '054', maQuanHuyen: '605', tenQuanHuyen: 'Huyện Vũ Thư'),
  QuanHuyen(
      maTinhThanh: '054',
      maQuanHuyen: '606',
      tenQuanHuyen: 'Thành phố Thái Bình'),
  QuanHuyen(
      maTinhThanh: '055', maQuanHuyen: '607', tenQuanHuyen: 'Huyện Đại Từ'),
  QuanHuyen(
      maTinhThanh: '055', maQuanHuyen: '608', tenQuanHuyen: 'Huyện Định Hóa'),
  QuanHuyen(
      maTinhThanh: '055', maQuanHuyen: '609', tenQuanHuyen: 'Huyện Đồng Hỷ'),
  QuanHuyen(
      maTinhThanh: '055', maQuanHuyen: '610', tenQuanHuyen: 'Huyện Phú Bình'),
  QuanHuyen(
      maTinhThanh: '055', maQuanHuyen: '611', tenQuanHuyen: 'Huyện Phú Lương'),
  QuanHuyen(
      maTinhThanh: '055', maQuanHuyen: '612', tenQuanHuyen: 'Huyện Võ Nhai'),
  QuanHuyen(
      maTinhThanh: '055',
      maQuanHuyen: '613',
      tenQuanHuyen: 'Thành phố Phổ Yên'),
  QuanHuyen(
      maTinhThanh: '055',
      maQuanHuyen: '614',
      tenQuanHuyen: 'Thành phố Sông Công'),
  QuanHuyen(
      maTinhThanh: '055',
      maQuanHuyen: '615',
      tenQuanHuyen: 'Thành phố Thái Nguyên'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '616', tenQuanHuyen: 'Huyện Bá Thước'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '617', tenQuanHuyen: 'Huyện Cẩm Thủy'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '618', tenQuanHuyen: 'Huyện Đông Sơn'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '619', tenQuanHuyen: 'Huyện Hà Trung'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '620', tenQuanHuyen: 'Huyện Hậu Lộc'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '621', tenQuanHuyen: 'Huyện Hoằng Hóa'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '622', tenQuanHuyen: 'Huyện Lang Chánh'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '623', tenQuanHuyen: 'Huyện Mường Lát'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '624', tenQuanHuyen: 'Huyện Nga Sơn'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '625', tenQuanHuyen: 'Huyện Ngọc Lặc'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '626', tenQuanHuyen: 'Huyện Như Thanh'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '627', tenQuanHuyen: 'Huyện Như Xuân'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '628', tenQuanHuyen: 'Huyện Nông Cống'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '629', tenQuanHuyen: 'Huyện Quan Sơn'),
  QuanHuyen(
      maTinhThanh: '056',
      maQuanHuyen: '630',
      tenQuanHuyen: 'Huyện Quảng Xương'),
  QuanHuyen(
      maTinhThanh: '056',
      maQuanHuyen: '631',
      tenQuanHuyen: 'Huyện Thạch Thành'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '632', tenQuanHuyen: 'Huyện Thiệu Hóa'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '633', tenQuanHuyen: 'Huyện Thọ Xuân'),
  QuanHuyen(
      maTinhThanh: '056',
      maQuanHuyen: '634',
      tenQuanHuyen: 'Huyện Thường Xuân'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '635', tenQuanHuyen: 'Huyện Triệu Sơn'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '636', tenQuanHuyen: 'Huyện Vĩnh Lộc'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '637', tenQuanHuyen: 'Huyện Yên Định'),
  QuanHuyen(
      maTinhThanh: '056',
      maQuanHuyen: '638',
      tenQuanHuyen: 'Thành phố Sầm Sơn'),
  QuanHuyen(
      maTinhThanh: '056',
      maQuanHuyen: '639',
      tenQuanHuyen: 'Thành phố Thanh Hóa'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '640', tenQuanHuyen: 'Thị xã Bỉm Sơn'),
  QuanHuyen(
      maTinhThanh: '056', maQuanHuyen: '641', tenQuanHuyen: 'Thị xã Nghi Sơn'),
  QuanHuyen(
      maTinhThanh: '057', maQuanHuyen: '642', tenQuanHuyen: 'Huyện A Lưới'),
  QuanHuyen(
      maTinhThanh: '057', maQuanHuyen: '643', tenQuanHuyen: 'Huyện Nam Đông'),
  QuanHuyen(
      maTinhThanh: '057', maQuanHuyen: '644', tenQuanHuyen: 'Huyện Phong Điền'),
  QuanHuyen(
      maTinhThanh: '057', maQuanHuyen: '645', tenQuanHuyen: 'Huyện Phú Lộc'),
  QuanHuyen(
      maTinhThanh: '057', maQuanHuyen: '646', tenQuanHuyen: 'Huyện Phú Vang'),
  QuanHuyen(
      maTinhThanh: '057', maQuanHuyen: '647', tenQuanHuyen: 'Huyện Quảng Điền'),
  QuanHuyen(
      maTinhThanh: '057', maQuanHuyen: '648', tenQuanHuyen: 'Thành phố Huế'),
  QuanHuyen(
      maTinhThanh: '057',
      maQuanHuyen: '649',
      tenQuanHuyen: 'Thị xã Hương Thủy'),
  QuanHuyen(
      maTinhThanh: '057', maQuanHuyen: '650', tenQuanHuyen: 'Thị xã Hương Trà'),
  QuanHuyen(
      maTinhThanh: '058', maQuanHuyen: '651', tenQuanHuyen: 'Huyện Cái Bè'),
  QuanHuyen(
      maTinhThanh: '058', maQuanHuyen: '652', tenQuanHuyen: 'Huyện Cai Lậy'),
  QuanHuyen(
      maTinhThanh: '058', maQuanHuyen: '653', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '058', maQuanHuyen: '654', tenQuanHuyen: 'Huyện Chợ Gạo'),
  QuanHuyen(
      maTinhThanh: '058',
      maQuanHuyen: '655',
      tenQuanHuyen: 'Huyện Gò Công Đông'),
  QuanHuyen(
      maTinhThanh: '058',
      maQuanHuyen: '656',
      tenQuanHuyen: 'Huyện Gò Công Tây'),
  QuanHuyen(
      maTinhThanh: '058',
      maQuanHuyen: '657',
      tenQuanHuyen: 'Huyện Tân Phú Đông'),
  QuanHuyen(
      maTinhThanh: '058', maQuanHuyen: '658', tenQuanHuyen: 'Huyện Tân Phước'),
  QuanHuyen(
      maTinhThanh: '058', maQuanHuyen: '659', tenQuanHuyen: 'Thành phố Mỹ Tho'),
  QuanHuyen(
      maTinhThanh: '058', maQuanHuyen: '660', tenQuanHuyen: 'Thị xã Cai Lậy'),
  QuanHuyen(
      maTinhThanh: '058', maQuanHuyen: '661', tenQuanHuyen: 'Thị xã Gò Công'),
  QuanHuyen(
      maTinhThanh: '059', maQuanHuyen: '662', tenQuanHuyen: 'Huyện Càng Long'),
  QuanHuyen(
      maTinhThanh: '059', maQuanHuyen: '663', tenQuanHuyen: 'Huyện Cầu Kè'),
  QuanHuyen(
      maTinhThanh: '059', maQuanHuyen: '664', tenQuanHuyen: 'Huyện Cầu Ngang'),
  QuanHuyen(
      maTinhThanh: '059', maQuanHuyen: '665', tenQuanHuyen: 'Huyện Châu Thành'),
  QuanHuyen(
      maTinhThanh: '059', maQuanHuyen: '666', tenQuanHuyen: 'Huyện Duyên Hải'),
  QuanHuyen(
      maTinhThanh: '059', maQuanHuyen: '667', tenQuanHuyen: 'Huyện Tiểu Cần'),
  QuanHuyen(
      maTinhThanh: '059', maQuanHuyen: '668', tenQuanHuyen: 'Huyện Trà Cú'),
  QuanHuyen(
      maTinhThanh: '059',
      maQuanHuyen: '669',
      tenQuanHuyen: 'Thành phố Trà Vinh'),
  QuanHuyen(
      maTinhThanh: '059', maQuanHuyen: '670', tenQuanHuyen: 'Thị xã Duyên Hải'),
  QuanHuyen(
      maTinhThanh: '060', maQuanHuyen: '671', tenQuanHuyen: 'Huyện Chiêm Hóa'),
  QuanHuyen(
      maTinhThanh: '060', maQuanHuyen: '672', tenQuanHuyen: 'Huyện Hàm Yên'),
  QuanHuyen(
      maTinhThanh: '060', maQuanHuyen: '673', tenQuanHuyen: 'Huyện Lâm Bình'),
  QuanHuyen(
      maTinhThanh: '060', maQuanHuyen: '674', tenQuanHuyen: 'Huyện Na Hang'),
  QuanHuyen(
      maTinhThanh: '060', maQuanHuyen: '675', tenQuanHuyen: 'Huyện Sơn Dương'),
  QuanHuyen(
      maTinhThanh: '060', maQuanHuyen: '676', tenQuanHuyen: 'Huyện Yên Sơn'),
  QuanHuyen(
      maTinhThanh: '060',
      maQuanHuyen: '677',
      tenQuanHuyen: 'Thành phố Tuyên Quang'),
  QuanHuyen(
      maTinhThanh: '061', maQuanHuyen: '678', tenQuanHuyen: 'Huyện Bình Tân'),
  QuanHuyen(
      maTinhThanh: '061', maQuanHuyen: '679', tenQuanHuyen: 'Huyện Long Hồ'),
  QuanHuyen(
      maTinhThanh: '061', maQuanHuyen: '680', tenQuanHuyen: 'Huyện Mang Thít'),
  QuanHuyen(
      maTinhThanh: '061', maQuanHuyen: '681', tenQuanHuyen: 'Huyện Tam Bình'),
  QuanHuyen(
      maTinhThanh: '061', maQuanHuyen: '682', tenQuanHuyen: 'Huyện Trà Ôn'),
  QuanHuyen(
      maTinhThanh: '061', maQuanHuyen: '683', tenQuanHuyen: 'Huyện Vũng Liêm'),
  QuanHuyen(
      maTinhThanh: '061',
      maQuanHuyen: '684',
      tenQuanHuyen: 'Thành phố Vĩnh Long'),
  QuanHuyen(
      maTinhThanh: '061', maQuanHuyen: '685', tenQuanHuyen: 'Thị xã Bình Minh'),
  QuanHuyen(
      maTinhThanh: '062', maQuanHuyen: '686', tenQuanHuyen: 'Huyện Bình Xuyên'),
  QuanHuyen(
      maTinhThanh: '062', maQuanHuyen: '687', tenQuanHuyen: 'Huyện Lập Thạch'),
  QuanHuyen(
      maTinhThanh: '062', maQuanHuyen: '688', tenQuanHuyen: 'Huyện Sông Lô'),
  QuanHuyen(
      maTinhThanh: '062', maQuanHuyen: '689', tenQuanHuyen: 'Huyện Tam Đảo'),
  QuanHuyen(
      maTinhThanh: '062', maQuanHuyen: '690', tenQuanHuyen: 'Huyện Tam Dương'),
  QuanHuyen(
      maTinhThanh: '062', maQuanHuyen: '691', tenQuanHuyen: 'Huyện Vĩnh Tường'),
  QuanHuyen(
      maTinhThanh: '062', maQuanHuyen: '692', tenQuanHuyen: 'Huyện Yên Lạc'),
  QuanHuyen(
      maTinhThanh: '062',
      maQuanHuyen: '693',
      tenQuanHuyen: 'Thành phố Phúc Yên'),
  QuanHuyen(
      maTinhThanh: '062',
      maQuanHuyen: '694',
      tenQuanHuyen: 'Thành phố Vĩnh Yên'),
  QuanHuyen(
      maTinhThanh: '063', maQuanHuyen: '695', tenQuanHuyen: 'Huyện Lục Yên'),
  QuanHuyen(
      maTinhThanh: '063',
      maQuanHuyen: '696',
      tenQuanHuyen: 'Huyện Mù Căng Chải'),
  QuanHuyen(
      maTinhThanh: '063', maQuanHuyen: '697', tenQuanHuyen: 'Huyện Trạm Tấu'),
  QuanHuyen(
      maTinhThanh: '063', maQuanHuyen: '698', tenQuanHuyen: 'Huyện Trấn Yên'),
  QuanHuyen(
      maTinhThanh: '063', maQuanHuyen: '699', tenQuanHuyen: 'Huyện Văn Chấn'),
  QuanHuyen(
      maTinhThanh: '063', maQuanHuyen: '700', tenQuanHuyen: 'Huyện Văn Yên'),
  QuanHuyen(
      maTinhThanh: '063', maQuanHuyen: '701', tenQuanHuyen: 'Huyện Yên Bình'),
  QuanHuyen(
      maTinhThanh: '063',
      maQuanHuyen: '702',
      tenQuanHuyen: 'Thành phố Yên Bái'),
  QuanHuyen(
      maTinhThanh: '063', maQuanHuyen: '703', tenQuanHuyen: 'Thị xã Nghĩa Lộ'),

  // Bạn có thể thêm nhiều huyện hơn tại đây nếu cần
];



// class QuanHuyen {
//   final String maQuanHuyen;
//   final String maTinhThanh;
//   final String tenQuanHuyen;

//   QuanHuyen({
//     required this.maQuanHuyen,
//     required this.maTinhThanh,
//     required this.tenQuanHuyen,
//   });

//   factory QuanHuyen.fromJson(Map<String, dynamic> json) {
//     return QuanHuyen(
//       maQuanHuyen: json['MaQuanHuyen'],
//       maTinhThanh: json['MaTinhThanh'],
//       tenQuanHuyen: json['TenQuanHuyen'],
//     );
//   }
// }
