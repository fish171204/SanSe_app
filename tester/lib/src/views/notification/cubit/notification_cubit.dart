import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/notification/notification_model.dart';
import '../../../repositories/notification/notification_repository.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository _repository;

  NotificationCubit(this._repository) : super(NotificationInitial());

  List<NotificationCard> _allNotifications = [];

  Future<void> loadNotifications() async {
    emit(NotificationLoading());

    try {
      _allNotifications = await _repository.getNotifications();

      emit(NotificationLoaded(
        notifications: _allNotifications,
        filteredNotifications: _allNotifications,
      ));
    } catch (e) {
      emit(NotificationError('Failed to load notifications: $e'));
    }
  }

  void searchNotifications(String query) {
    if (state is NotificationLoaded) {
      final currentState = state as NotificationLoaded;
      final filtered = _filterNotifications(
        _allNotifications,
        query,
        currentState.selectedType,
      );

      emit(currentState.copyWith(
        searchQuery: query,
        filteredNotifications: filtered,
      ));
    }
  }

  void filterByType(String type) {
    if (state is NotificationLoaded) {
      final currentState = state as NotificationLoaded;
      final filtered = _filterNotifications(
        _allNotifications,
        currentState.searchQuery,
        type,
      );

      emit(currentState.copyWith(
        selectedType: type,
        filteredNotifications: filtered,
      ));
    }
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      await _repository.markAsRead(notificationId);

      // Update local data
      _allNotifications = _allNotifications.map((notification) {
        if (notification.id == notificationId) {
          return notification.copyWith(isRead: true);
        }
        return notification;
      }).toList();

      if (state is NotificationLoaded) {
        final currentState = state as NotificationLoaded;
        final filtered = _filterNotifications(
          _allNotifications,
          currentState.searchQuery,
          currentState.selectedType,
        );

        emit(currentState.copyWith(
          notifications: _allNotifications,
          filteredNotifications: filtered,
        ));
      }

      emit(NotificationMarkAsReadSuccess(notificationId));
    } catch (e) {
      emit(NotificationError('Failed to mark notification as read: $e'));
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      await _repository.deleteNotification(notificationId);

      // Update local data
      _allNotifications = _allNotifications
          .where((notification) => notification.id != notificationId)
          .toList();

      if (state is NotificationLoaded) {
        final currentState = state as NotificationLoaded;
        final filtered = _filterNotifications(
          _allNotifications,
          currentState.searchQuery,
          currentState.selectedType,
        );

        emit(currentState.copyWith(
          notifications: _allNotifications,
          filteredNotifications: filtered,
        ));
      }

      emit(NotificationDeleteSuccess(notificationId));
    } catch (e) {
      emit(NotificationError('Failed to delete notification: $e'));
    }
  }

  void markAllAsRead() async {
    try {
      await _repository.markAllAsRead();

      _allNotifications = _allNotifications.map((notification) {
        return notification.copyWith(isRead: true);
      }).toList();

      if (state is NotificationLoaded) {
        final currentState = state as NotificationLoaded;
        final filtered = _filterNotifications(
          _allNotifications,
          currentState.searchQuery,
          currentState.selectedType,
        );

        emit(currentState.copyWith(
          notifications: _allNotifications,
          filteredNotifications: filtered,
        ));
      }
    } catch (e) {
      emit(NotificationError('Failed to mark all notifications as read: $e'));
    }
  }

  List<NotificationCard> _filterNotifications(
    List<NotificationCard> notifications,
    String searchQuery,
    String selectedType,
  ) {
    List<NotificationCard> filtered = notifications;

    // Filter by type
    if (selectedType != 'all') {
      filtered = filtered
          .where((notification) => notification.type == selectedType)
          .toList();
    }

    // Filter by search query
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((notification) {
        return notification.title
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            notification.message
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
      }).toList();
    }

    // Sort by timestamp (newest first)
    filtered.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return filtered;
  }
}
