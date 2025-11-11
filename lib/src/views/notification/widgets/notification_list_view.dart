import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/notification_cubit.dart';
import '../cubit/notification_state.dart';
import '../widgets/notification_card_widget.dart';
import '../widgets/emergency_notification_card_widget.dart';
import '../../../models/notification/notification_model.dart';

class NotificationListView extends StatelessWidget {
  final bool isEmergency;
  final Function(NotificationCard) onNotificationTap;

  const NotificationListView({
    super.key,
    this.isEmergency = false,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NotificationError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                ElevatedButton(
                  onPressed: () {
                    context.read<NotificationCubit>().loadNotifications();
                  },
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          );
        }

        if (state is NotificationLoaded) {
          // Filter notifications based on type
          final filteredNotifications = state.filteredNotifications
              .where((notification) =>
                  notification.type == (isEmergency ? 'emergency' : 'normal'))
              .toList();

          if (filteredNotifications.isEmpty) {
            return Center(
              child: Text(isEmergency
                  ? 'Không có thông báo khẩn cấp nào'
                  : 'Không có thông báo nào'),
            );
          }

          return ListView.builder(
            itemCount: filteredNotifications.length,
            itemBuilder: (context, index) {
              final notification = filteredNotifications[index];

              if (isEmergency) {
                return EmergencyNotificationCardWidget(
                  notification: notification,
                  onTap: () => onNotificationTap(notification),
                );
              } else {
                return NotificationCardWidget(
                  notification: notification,
                  onTap: () => onNotificationTap(notification),
                );
              }
            },
          );
        }

        return const Center(child: Text('Không có dữ liệu'));
      },
    );
  }
}
