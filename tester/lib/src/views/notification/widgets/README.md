# Notification Widgets

Thư mục này chứa các reusable widgets cho notification feature.

## Cấu trúc:

### 📱 UI Components

- **`notification_card_widget.dart`** - Widget hiển thị notification card cho hoàn cảnh thường
- **`emergency_notification_card_widget.dart`** - Widget hiển thị notification card cho hoàn cảnh khẩn cấp (có border đỏ và badge)
- **`notification_app_bar.dart`** - AppBar với notification count badge
- **`notification_filter_button.dart`** - Button bộ lọc
- **`notification_filter_bottom_sheet.dart`** - Bottom sheet chọn loại notification

### 📋 List Components

- **`notification_list_view.dart`** - ListView hiển thị danh sách notifications với error handling

## ✨ Lợi ích của việc tách widgets:

### 1. **Reusability**

- Widgets có thể được sử dụng ở nhiều screens khác nhau
- Dễ dàng maintain và update UI

### 2. **Separation of Concerns**

- Mỗi widget chỉ focus vào 1 chức năng cụ thể
- Screen chỉ tập trung vào logic navigation và state management

### 3. **Testability**

- Dễ test từng widget riêng biệt
- Mock props và verify rendering

### 4. **Clean Code**

- Code dễ đọc và hiểu
- Giảm complexity của main screens

## 🎯 Cách sử dụng:

```dart
// Trong screen
NotificationListView(
  isEmergency: false,
  onNotificationTap: (notification) => handleTap(notification),
)

// AppBar
NotificationAppBar(
  notificationCount: count,
  onBackPressed: () => handleBack(),
  isEmergency: false,
)
```

## 🔮 Tương lai:

- Thêm animation cho notifications
- Thêm pull-to-refresh functionality
- Thêm infinite scroll/pagination
- Thêm customization options (themes, colors)
