import 'package:flutter/material.dart';

class NotificationFilterBottomSheet extends StatelessWidget {
  final bool isEmergency;
  final VoidCallback? onEmergencySelected;
  final VoidCallback? onNormalSelected;

  const NotificationFilterBottomSheet({
    super.key,
    this.isEmergency = false,
    this.onEmergencySelected,
    this.onNormalSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Bộ lọc",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.orange),
                title: const Text("Hoàn cảnh khó khăn thông thường"),
                trailing: !isEmergency
                    ? const Icon(Icons.check, color: Colors.blue)
                    : null,
                onTap: () {
                  Navigator.pop(context);
                  if (isEmergency && onNormalSelected != null) {
                    onNormalSelected!();
                  }
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.notification_important, color: Colors.red),
                title: const Text("Hoàn cảnh khó khăn khẩn cấp"),
                trailing: isEmergency
                    ? const Icon(Icons.check, color: Colors.red)
                    : null,
                onTap: () {
                  Navigator.pop(context);
                  if (!isEmergency && onEmergencySelected != null) {
                    onEmergencySelected!();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
