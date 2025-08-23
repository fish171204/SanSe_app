# Repositories

Thư mục này chứa các repository classes theo kiến trúc Clean Architecture.

## Notification Repository

### Cấu trúc:

- `notification/notification_repository.dart` - Chứa abstract class và implementation

### Chức năng:

- `NotificationRepository` - Abstract class định nghĩa các method cần thiết
- `NotificationRepositoryImpl` - Implementation cụ thể, hiện tại sử dụng mock data

### Lợi ích của việc tách repository:

1. **Separation of Concerns**: Cubit chỉ xử lý business logic, không quan tâm đến cách lấy data
2. **Testability**: Dễ dàng test cubit bằng cách mock repository
3. **Flexibility**: Có thể thay đổi data source (API, local database, etc.) mà không ảnh hưởng đến cubit
4. **Reusability**: Repository có thể được sử dụng ở nhiều nơi khác nhau

### Cách sử dụng:

```dart
// Trong view, inject repository vào cubit
BlocProvider(
  create: (context) => NotificationCubit(NotificationRepositoryImpl()),
  child: // Your widget
)
```

### Tương lai:

- Thay thế mock data bằng API calls thực tế
- Thêm caching mechanism
- Thêm error handling tốt hơn
- Thêm pagination support
