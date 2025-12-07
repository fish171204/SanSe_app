import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../repositories/admin/post_management_repository.dart';
import '../../models/admin/admin_post_model.dart';
import 'cubit/post_approval_cubit.dart';
import 'cubit/post_approval_state.dart';

class PostApprovalScreen extends StatelessWidget {
  const PostApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostApprovalCubit(PostRepositoryImpl())..loadPendingPosts(),
      child: const _PostApprovalView(),
    );
  }
}

class _PostApprovalView extends StatefulWidget {
  const _PostApprovalView();

  @override
  State<_PostApprovalView> createState() => _PostApprovalViewState();
}

class _PostApprovalViewState extends State<_PostApprovalView> {
  // --- 1. HÀM XỬ LÝ EXPORT ---
  Future<void> _handleExport(BuildContext context, List<AdminPostModel> posts,
      String title, bool isSpamMode) async {
    if (posts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Danh sách trống, không có gì để xuất!"),
            backgroundColor: Colors.orange),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await _exportToPdf(context, posts, title, isSpamMode);
      if (context.mounted) Navigator.pop(context);
    } catch (e) {
      if (context.mounted) Navigator.pop(context);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Lỗi xuất PDF: $e"), backgroundColor: Colors.red),
        );
      }
    }
  }

  // --- 2. HÀM TẠO PDF ---
  Future<void> _exportToPdf(BuildContext context, List<AdminPostModel> posts,
      String title, bool isSpamMode) async {
    final doc = pw.Document();
    final font = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();
    final fontItalic = await PdfGoogleFonts.robotoItalic();

    List<String> headers;
    List<List<dynamic>> data;
    Map<int, pw.TableColumnWidth> columnWidths;

    if (isSpamMode) {
      headers = [
        'STT',
        'Tiêu đề bài viết',
        'Người đăng',
        'Số tiền',
        'Ngày đăng',
        'Số lượng'
      ];
      columnWidths = {
        0: const pw.FixedColumnWidth(30), // Cột STT nhỏ
        1: const pw.FlexColumnWidth(3), // Tên
        2: const pw.FlexColumnWidth(2), // Người đăng
        3: const pw.FlexColumnWidth(1.5), // Tiền
        4: const pw.FlexColumnWidth(1.2), // Ngày
        5: const pw.FlexColumnWidth(0.8), // Số lượng
      };

      // Gom nhóm
      Map<String, int> spamCounts = {};
      Map<String, AdminPostModel> uniqueSpamPosts = {};

      for (var post in posts) {
        final key = "${post.title}_${post.senderName}";
        if (!spamCounts.containsKey(key)) {
          spamCounts[key] = 0;
          uniqueSpamPosts[key] = post;
        }
        spamCounts[key] = spamCounts[key]! + 1;
      }

      final uniqueList = uniqueSpamPosts.entries.toList();

      data = List.generate(uniqueList.length, (index) {
        final entry = uniqueList[index];
        final post = entry.value;
        final count = spamCounts[entry.key];
        return [
          (index + 1).toString(),
          post.title,
          post.senderName,
          post.amount,
          post.submissionDate,
          count.toString(),
        ];
      });
    } else {
      headers = [
        'STT',
        'Tiêu đề bài viết',
        'Người đăng',
        'Số tiền',
        'Ngày gửi'
      ];
      columnWidths = {
        0: const pw.FixedColumnWidth(35),
        1: const pw.FlexColumnWidth(3),
        2: const pw.FlexColumnWidth(2),
        3: const pw.FlexColumnWidth(1.5),
        4: const pw.FlexColumnWidth(1.2),
      };

      data = List.generate(posts.length, (index) {
        final post = posts[index];
        return [
          (index + 1).toString(), // STT = index + 1
          post.title,
          post.senderName,
          post.amount,
          post.submissionDate,
        ];
      });
    }

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.withFont(
          base: font,
          bold: fontBold,
          italic: fontItalic,
        ),
        build: (pw.Context context) {
          return [
            // Header
            pw.Header(
              level: 0,
              child: pw.Center(
                child: pw.Text(
                  title.toUpperCase(),
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
            ),
            pw.SizedBox(height: 20),

            // Table
            pw.TableHelper.fromTextArray(
              context: context,
              border: pw.TableBorder.all(),
              headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, color: PdfColors.white),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.blue),
              cellAlignment: pw.Alignment.centerLeft,
              headerAlignment: pw.Alignment.center,
              columnWidths: columnWidths,
              headers: headers,
              data: data,
            ),

            // Footer
            pw.SizedBox(height: 20),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                "Ngày xuất: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}",
                style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey),
              ),
            ),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
      name: isSpamMode ? 'danh_sach_spam.pdf' : 'danh_sach_cho_duyet.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostApprovalCubit, PostApprovalState>(
      listener: (context, state) {
        if (state is PostApprovalActionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.message), backgroundColor: Colors.green),
          );
        } else if (state is PostApprovalError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        if (state is PostApprovalLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostApprovalLoaded) {
          return Column(
            children: [
              _buildControlBar(context, state),
              if (state.isFilterSpamActive && state.pendingPosts.isNotEmpty)
                _buildBulkActionBar(context, state),
              Expanded(
                child: state.pendingPosts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_outline,
                                size: 60, color: Colors.grey[300]),
                            const SizedBox(height: 10),
                            Text(
                              state.isFilterSpamActive
                                  ? "Không phát hiện bài đăng trùng lặp!"
                                  : "Không có bài đăng nào cần duyệt.",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: state.pendingPosts.length,
                        itemBuilder: (ctx, index) {
                          final post = state.pendingPosts[index];
                          final isSelected =
                              state.selectedPostTitles.contains(post.title);

                          return _buildApprovalCard(context, post, isSelected,
                              state.isFilterSpamActive);
                        },
                      ),
              ),
            ],
          );
        } else if (state is PostApprovalError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildControlBar(BuildContext context, PostApprovalLoaded state) {
    final isFilterActive = state.isFilterSpamActive;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Danh sách chờ duyệt",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  context.read<PostApprovalCubit>().toggleSpamFilter();
                },
                icon: Icon(
                  isFilterActive ? Icons.filter_alt_off : Icons.filter_alt,
                  color: isFilterActive ? Colors.white : Colors.orange,
                ),
                label: Text(
                  isFilterActive ? "Tắt lọc Spam" : "Check Spam",
                  style: TextStyle(
                    color: isFilterActive ? Colors.white : Colors.orange,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                      isFilterActive ? Colors.orange : Colors.white,
                  side: const BorderSide(color: Colors.orange),
                ),
              ),
              const SizedBox(width: 8),
              // --- NÚT PDF ---
              IconButton(
                onPressed: () {
                  String pdfTitle = isFilterActive
                      ? "DANH SÁCH SPAM CẦN XỬ LÝ"
                      : "DANH SÁCH BÀI ĐĂNG CHỜ DUYỆT";

                  _handleExport(
                      context, state.pendingPosts, pdfTitle, isFilterActive);
                },
                icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
                tooltip: "Xuất PDF danh sách này",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBulkActionBar(BuildContext context, PostApprovalLoaded state) {
    final selectedCount = state.selectedPostTitles.length;
    final uniqueTitlesCount =
        state.pendingPosts.map((e) => e.title).toSet().length;
    final isAllSelected =
        selectedCount == uniqueTitlesCount && uniqueTitlesCount > 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      color: Colors.red[50],
      child: Row(
        children: [
          Checkbox(
            value: isAllSelected,
            activeColor: Colors.red,
            onChanged: (val) {
              context.read<PostApprovalCubit>().toggleAllSelection();
            },
          ),
          const Text("Chọn tất cả",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          if (selectedCount > 0)
            ElevatedButton.icon(
              onPressed: () => _confirmBulkAction(context, selectedCount),
              icon:
                  const Icon(Icons.delete_sweep, color: Colors.white, size: 20),
              label: Text("Từ chối ($selectedCount nhóm)",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildApprovalCard(BuildContext context, AdminPostModel post,
      bool isSelected, bool isSpamMode) {
    final cubit = context.read<PostApprovalCubit>();

    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? const BorderSide(color: Colors.red, width: 1.5)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: isSpamMode ? () => cubit.togglePostSelection(post.title) : null,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isSpamMode)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 20),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: isSelected,
                          activeColor: Colors.red,
                          onChanged: (val) =>
                              cubit.togglePostSelection(post.title),
                        ),
                      ),
                    ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      post.imagePath,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.person,
                                size: 14, color: Colors.blueGrey),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "Người đăng: ${post.senderName}",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: isSpamMode
                                        ? Colors.red
                                        : Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text("Số tiền: ${post.amount}",
                            style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text("Gửi lúc: ${post.submissionDate}",
                                style: const TextStyle(
                                    fontSize: 12, fontStyle: FontStyle.italic)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _confirmAction(
                        context,
                        "Từ chối bài viết",
                        "Bạn có chắc muốn từ chối bài viết này?",
                        () => cubit.rejectPost(post.title)),
                    icon: const Icon(Icons.close, color: Colors.red),
                    label: const Text("Từ chối",
                        style: TextStyle(color: Colors.red)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () => _confirmAction(
                        context,
                        "Duyệt bài viết",
                        "Xác nhận duyệt bài viết này lên hệ thống?",
                        () => cubit.approvePost(post.title)),
                    icon: const Icon(Icons.check, color: Colors.white),
                    label: const Text("Duyệt bài",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmAction(BuildContext context, String title, String content,
      VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onConfirm();
            },
            child: const Text("Đồng ý",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _confirmBulkAction(BuildContext context, int count) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Xác nhận xóa hàng loạt"),
        content: Text(
            "Bạn có chắc chắn muốn từ chối $count bài đăng đã chọn không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<PostApprovalCubit>().rejectSelectedPosts();
            },
            child: const Text("Xóa tất cả",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
