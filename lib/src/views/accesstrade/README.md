# Affiliate Marketing Feature

## Cấu trúc Clean Architecture

### Models

- `affiliate_item.dart`: Model đại diện cho một item affiliate marketing
  - Chứa thông tin: image, title, url
  - Có phương thức fromMap và toMap để chuyển đổi dữ liệu

### Repository

- `affiliate_repository.dart`: Interface và implementation cho data layer
  - `AffiliateRepository`: Abstract class định nghĩa các method
  - `AffiliateRepositoryImpl`: Implementation cụ thể, sử dụng dữ liệu từ `ac_category_data.dart`
  - Các method:
    - `getCategories()`: Lấy danh sách categories
    - `getItemsByCategory()`: Lấy items theo category
    - `searchItems()`: Tìm kiếm items trong category

### Cubit (Business Logic)

- `affiliate_state.dart`: Định nghĩa các state

  - `AffiliateInitial`: State ban đầu
  - `AffiliateLoading`: State đang tải
  - `AffiliateLoaded`: State đã tải xong với dữ liệu
  - `AffiliateError`: State lỗi

- `affiliate_cubit.dart`: Quản lý business logic
  - `loadInitialData()`: Load dữ liệu ban đầu
  - `selectCategory()`: Chọn category mới
  - `searchItems()`: Tìm kiếm items
  - `openUrl()`: Mở URL

### View

- `affiliate_marketing_screen.dart`: UI screen sử dụng BlocProvider và BlocBuilder
  - Tách biệt hoàn toàn logic và UI
  - Sử dụng dependency injection với repository
  - Responsive với các state khác nhau

## Ưu điểm của cấu trúc này:

1. **Separation of Concerns**: Logic và UI hoàn toàn tách biệt
2. **Testability**: Dễ dàng test từng layer riêng biệt
3. **Maintainability**: Dễ bảo trì và mở rộng
4. **Reusability**: Repository có thể được sử dụng lại cho các feature khác
5. **State Management**: Quản lý state một cách rõ ràng và có thể dự đoán được

## Cách sử dụng:

```dart
// Thay thế widget cũ bằng widget mới
const AffiliateMarketing()
```

Thay vì sử dụng `affiliateMarkteting` cũ, giờ sử dụng `AffiliateMarketing` mới với Clean Architecture.
