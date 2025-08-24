# Admin Management Features - Clean Architecture

## Cấu trúc Clean Architecture

### Models

- `admin_user.dart`: Model đại diện cho User

  - Chứa thông tin: name, cccd, avatar, lastLoginDate, status
  - Method `getDaysInactive()` để tính số ngày không hoạt động
  - Có phương thức fromMap, toMap, copyWith

- `admin_post.dart`: Model đại diện cho Post
  - Chứa thông tin: imagePath, title, subtitle, amount, progress, originalProgress, isDeleted, status
  - Property `isCompleted` và `statusText` để kiểm tra trạng thái
  - Có phương thức fromMap, toMap, copyWith

### Repositories

- `user_repository.dart`: Data layer cho User

  - `UserRepository`: Abstract class
  - `UserRepositoryImpl`: Implementation với mock data
  - Methods:
    - `getAllUsers()`: Lấy tất cả users
    - `getFilteredUsers(int filterDays)`: Lọc users theo số ngày không hoạt động
    - `deleteUser(String cccd)`: Xóa user
    - `suspendUser(String cccd)`: Tạm khóa user
    - `unlockUser(String cccd)`: Mở khóa user

- `post_repository.dart`: Data layer cho Post
  - `PostRepository`: Abstract class
  - `PostRepositoryImpl`: Implementation với mock data
  - Methods:
    - `getAllPosts()`: Lấy tất cả posts
    - `searchPosts(String query)`: Tìm kiếm posts
    - `getFilteredPosts(String filter)`: Lọc posts theo trạng thái
    - `deletePost(String title)`: Xóa post
    - `updatePostStatus(String title, String newStatus)`: Cập nhật trạng thái post

### Cubit (Business Logic)

#### User Management

- `user_management_state.dart`: Định nghĩa states

  - `UserManagementInitial`: State ban đầu
  - `UserManagementLoading`: State đang tải
  - `UserManagementLoaded`: State đã tải với dữ liệu users
  - `UserManagementError`: State lỗi
  - `UserManagementActionSuccess`: State thành công với thông báo

- `user_management_cubit.dart`: Business logic cho User Management
  - `loadUsers()`: Load danh sách users
  - `filterUsers(int filterDays)`: Lọc users theo ngày
  - `deleteUser(String cccd)`: Xóa user
  - `suspendUser(String cccd)`: Tạm khóa user
  - `unlockUser(String cccd)`: Mở khóa user

#### Post Management

- `post_management_state.dart`: Định nghĩa states

  - `PostManagementInitial`: State ban đầu
  - `PostManagementLoading`: State đang tải
  - `PostManagementLoaded`: State đã tải với dữ liệu posts
  - `PostManagementError`: State lỗi
  - `PostManagementActionSuccess`: State thành công

- `post_management_cubit.dart`: Business logic cho Post Management
  - `loadPosts()`: Load danh sách posts
  - `searchPosts(String query)`: Tìm kiếm posts
  - `filterPosts(String filter)`: Lọc posts theo trạng thái
  - `deletePost(String title)`: Xóa post
  - `updatePostStatus(String title, String newStatus)`: Cập nhật trạng thái

### Views

- `user_management_screen.dart`: UI cho quản lý Users

  - Sử dụng BlocProvider và BlocConsumer
  - Hiển thị danh sách users với filter
  - Các action: Xóa, Tạm khóa, Mở khóa
  - Dialog xác nhận và thông báo thành công

- `post_management_screen.dart`: UI cho quản lý Posts

  - Sử dụng BlocProvider và BlocConsumer
  - Search bar và filter dropdown
  - Hiển thị danh sách posts với progress bar
  - Các action: Xóa, Available/Unavailable
  - Dialog xác nhận và thông báo thành công

- `admin_screen.dart`: Main Admin Screen
  - TabBar với 2 tabs: User Management và Post Management
  - AppBar với logout button
  - Sử dụng các screen mới với Clean Architecture

## Ưu điểm của cấu trúc mới:

1. **Separation of Concerns**: Logic, data access và UI hoàn toàn tách biệt
2. **Testability**: Có thể test từng layer riêng biệt
3. **Maintainability**: Dễ bảo trì và mở rộng
4. **State Management**: Quản lý state rõ ràng với Bloc pattern
5. **Error Handling**: Xử lý lỗi tập trung và nhất quán
6. **Reusability**: Repository có thể tái sử dụng cho các feature khác

## Migration từ old code:

### Trước đây:

```dart
// Widget StatefulWidget với setState
// Logic trộn lẫn với UI
// Hard-coded data trong widget
// Không có error handling tập trung
```

### Bây giờ:

```dart
// Clean Architecture với Bloc pattern
// Logic tách biệt trong Cubit
// Data access thông qua Repository
// Centralized error handling và state management
```

## Cách sử dụng:

Thay thế widget cũ bằng:

```dart
const AdminScreen() // Sử dụng admin_screen.dart mới
```

Thay vì sử dụng các file cũ, giờ sử dụng Clean Architecture với tất cả benefit của pattern này!
