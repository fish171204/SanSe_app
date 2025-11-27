import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:tester/src/models/admin/admin_post_model.dart';

class PdfExportService {
  /// Hàm chính để xuất PDF
  Future<void> exportPostsToPdf(List<AdminPostModel> posts) async {
    final pdf = pw.Document();

    // 1. Load Font hỗ trợ tiếng Việt (Sử dụng Google Fonts để tiện lợi)
    final font = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();

    // 2. Chuẩn bị dữ liệu bảng
    final List<List<String>> tableData = [];

    // Header (khớp với columnWidths bên dưới)
    tableData.add([
      'Tiêu đề',
      'Số tiền',
      'Tiến độ (%)',
      'Trạng thái',
      'Chi tiết',
    ]);

    // Data rows
    for (var post in posts) {
      tableData.add([
        post.title,
        post.amount,
        '${post.progress}%', // Format string
        post.status == 'available'
            ? "Đang chạy"
            : "Đã xong", // Status text tiếng Việt
        post.subtitle,
      ]);
    }

    // 3. Tạo trang PDF
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        // Thiết lập theme font cho toàn bộ trang
        theme: pw.ThemeData.withFont(
          base: font,
          bold: fontBold,
        ),
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 0,
              child: pw.Center(
                child: pw.Text(
                  'BÁO CÁO DANH SÁCH BÀI ĐĂNG',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                'Ngày xuất: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
                style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey),
              ),
            ),
            pw.SizedBox(height: 20),

            // Gọi hàm dựng bảng
            _buildTable(tableData),
          ];
        },
      ),
    );

    // 4. Mở trình xem/in PDF (Thay vì chỉ lưu file, ta mở preview luôn cho tiện trên Mobile)
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'BaoCao_BaiDang_${DateTime.now().millisecondsSinceEpoch}.pdf',
    );
  }

  /// Hàm dựng bảng (Helper)
  pw.Widget _buildTable(List<List<String>> data) {
    return pw.Table.fromTextArray(
      context: null,
      border: pw.TableBorder.all(),
      cellStyle: const pw.TextStyle(fontSize: 9),
      headerStyle: pw.TextStyle(
          fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.white),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.blue),
      cellAlignment: pw.Alignment.centerLeft,
      headerAlignment: pw.Alignment.center,
      data: data,
      columnWidths: {
        0: const pw.FlexColumnWidth(3), // Tiêu đề
        1: const pw.FlexColumnWidth(2), // Số tiền
        2: const pw.FlexColumnWidth(1.2), // Tiến độ
        3: const pw.FlexColumnWidth(1.5), // Trạng thái
        4: const pw.FlexColumnWidth(3), // Mô tả
      },
    );
  }
}
