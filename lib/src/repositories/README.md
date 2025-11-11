# Repositories

Thư mục này chứa các repository classes theo kiến trúc Clean Architecture.

## Notification Repository

### Cấu trúc:

- `notification/notification_repository.dart` - Chứa abstract class và implementation

### Chức năng:

- `NotificationRepository` - Abstract class định nghĩa các method cần thiết
- `NotificationRepositoryImpl` - Implementation cụ thể, hiện tại sử dụng mock data

## Campaign Repository

### Cấu trúc:

- `campaign/campaign_repository.dart` - Chứa abstract class và implementation

### Chức năng:

- `CampaignRepository` - Abstract class định nghĩa các method cần thiết
- `CampaignRepositoryImpl` - Implementation cụ thể, hiện tại sử dụng mock data

## Lợi ích của việc tách repository:

### 1. **Separation of Concerns**

- Cubit chỉ xử lý business logic, không quan tâm đến cách lấy data
- Repository xử lý data access logic

### 2. **Testability**

- Dễ dàng test cubit bằng cách mock repository
- Unit test isolated và reliable

### 3. **Flexibility**

- Có thể thay đổi data source (API, local database, cache) mà không ảnh hưởng đến cubit
- Easy to switch between mock và production data

### 4. **Reusability**

- Repository có thể được sử dụng ở nhiều cubit/usecase khác nhau
- Shared data access logic

### 5. **Error Handling**

- Centralized error handling cho data operations
- Consistent error messaging

## Cách sử dụng:

```dart
// Notification
BlocProvider(
  create: (context) => NotificationCubit(NotificationRepositoryImpl()),
  child: YourWidget(),
)

// Campaign
BlocProvider(
  create: (context) => CampaignListCubit(CampaignRepositoryImpl()),
  child: YourWidget(),
)
```

## Tương lai:

### Notification Repository

- Thay thế mock data bằng API calls thực tế
- Thêm caching mechanism
- Thêm error handling tốt hơn
- Thêm pagination support

### Campaign Repository

- Integrate với backend API
- Implement caching strategy
- Add offline support
- Thêm campaign creation/update functionality
