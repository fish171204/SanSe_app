import 'package:equatable/equatable.dart';
import '../../../models/notification/notification_model.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationCard> notifications;
  final List<NotificationCard> filteredNotifications;
  final String searchQuery;
  final String selectedType; // 'all', 'emergency', 'normal'

  const NotificationLoaded({
    required this.notifications,
    required this.filteredNotifications,
    this.searchQuery = '',
    this.selectedType = 'all',
  });

  NotificationLoaded copyWith({
    List<NotificationCard>? notifications,
    List<NotificationCard>? filteredNotifications,
    String? searchQuery,
    String? selectedType,
  }) {
    return NotificationLoaded(
      notifications: notifications ?? this.notifications,
      filteredNotifications:
          filteredNotifications ?? this.filteredNotifications,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedType: selectedType ?? this.selectedType,
    );
  }

  @override
  List<Object?> get props => [
        notifications,
        filteredNotifications,
        searchQuery,
        selectedType,
      ];
}

class NotificationError extends NotificationState {
  final String message;

  const NotificationError(this.message);

  @override
  List<Object?> get props => [message];
}

class NotificationMarkAsReadSuccess extends NotificationState {
  final String notificationId;

  const NotificationMarkAsReadSuccess(this.notificationId);

  @override
  List<Object?> get props => [notificationId];
}

class NotificationDeleteSuccess extends NotificationState {
  final String notificationId;

  const NotificationDeleteSuccess(this.notificationId);

  @override
  List<Object?> get props => [notificationId];
}
