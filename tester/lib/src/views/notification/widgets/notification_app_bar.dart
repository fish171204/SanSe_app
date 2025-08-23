import 'package:flutter/material.dart';

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int notificationCount;
  final VoidCallback onBackPressed;
  final bool isEmergency;

  const NotificationAppBar({
    super.key,
    required this.notificationCount,
    required this.onBackPressed,
    this.isEmergency = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: onBackPressed,
        child: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      title: const Text(
        'Thông báo',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(
                isEmergency
                    ? Icons.notification_important
                    : Icons.notifications,
                color: isEmergency ? Colors.red : Colors.black,
                size: isEmergency ? 26 : 24,
              ),
              onPressed: () {},
            ),
            if (notificationCount > 0)
              Positioned(
                right: isEmergency ? 5 : 10,
                top: isEmergency ? 2 : 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
