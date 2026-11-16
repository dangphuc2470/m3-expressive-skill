# Material 3 Screen Archetypes & Page Blueprints

Tài liệu hướng dẫn cấu trúc layout và tư duy xây dựng các màn hình thực tế trong Material Design 3 Expressive. Áp dụng cho cả Web (Responsive) và Mobile (Android Compose, Flutter).

---

## 1. Landing Page & Product Showcase (Tư duy Anti-Slop)

Khi xây dựng Landing Page hoặc trang giới thiệu sản phẩm / Design System bằng M3:

- **Bài học từ Taste Skill:** Tránh xa các thiết kế "AI Slop" rập khuôn (tiêu đề căn giữa mờ nhạt, một hàng 3 thẻ icon bóng bóng có nền tím gradient, nút bấm phát sáng vô hồn).
- **Nguyên tắc Hero Section:**
  - **Live Product Fragment:** Tâm điểm của Hero Section phải là một lát cắt giao diện thực tế (Interactive Fragment: bảng điều khiển thật, thẻ dữ liệu đang nhảy số thật, hoặc thanh điều hướng đang hoạt động). Người dùng nhìn vào là thấy sản phẩm thật chứ không phải ảnh minh họa trừu tượng.
  - **Pure Typography:** Tiêu đề lớn (Headline Large / Display Medium) đĩnh đạc, rõ ràng. Không kẹp các icon trang trí nhí nhảnh cạnh chữ.
  - **Chất liệu M3 Expressive:** Sử dụng các container `surface-container-low` với bo góc `corner-extra-large` (28px), viền mờ `outline-variant` 1px, tạo cảm giác bề mặt vật lý tinh tế.

---

## 2. Archetype 1: Bảng điều khiển Số liệu (Analytics & KPI Dashboard)

Phù hợp cho màn hình giám sát, quản lý đội xe, phân tích tài chính hoặc chỉ số vận hành.

- **Cấu trúc khung:**
  1. **Sticky Header:** Pure Typography (Display Small hoặc Headline Medium), bên phải chứa filter thời gian (Segmented Button hoặc Filter Chip).
  2. **Metric Summary Grid:** Lưới thẻ chỉ số (2 cột trên mobile, 3-4 cột trên tablet/desktop).
     - Nền: `surface-container-lowest` hoặc `surface-container-low`.
     - Bo góc: 16px.
     - Watermark đồ họa: Đặt chìm ở góc dưới bên phải, độ trong suốt 0.10 - 0.20, đường nét đồ họa mang ý nghĩa riêng của metric (ví dụ con đường cho km, vệt lướt gió cho tốc độ, cột sóng cho mạng).
  3. **Visual Representation (Charts & Maps):** Bản đồ hoặc biểu đồ nằm trong container lớn bo góc 24px-28px.
  4. **Activity Stream / Recent Log:** Danh sách sự kiện gần nhất với avatar/icon trạng thái.

---

## 3. Archetype 2: Cài đặt & Biểu mẫu (Settings & Form Flow)

Phù hợp cho màn hình cấu hình, thông tin tài khoản, tạo mới đơn hàng hoặc nhập liệu.

- **Cấu trúc khung:**
  1. **Top App Bar:** Tiêu đề Title Large, nút Back và nút Action phụ.
  2. **Grouped Card Surface:** Thay vì rải rác từng input lẻ tẻ, nhóm các cài đặt liên quan vào trong từng khối `surface-container-low` bo góc 16px.
  3. **Row Layouts (Setting Tiles):**
     - Leading: Icon đại diện 24dp trong hộp tròn `surface-container-high`.
     - Center: Tiêu đề Title Medium và mô tả phụ Body Small.
     - Trailing: Switch toggle, Dropdown menu hoặc mũi tên Chevron dẫn sang trang con.
     - Divider: Phân cách bằng nét đứt hoặc viền mờ `outline-variant`, thụt lề 56dp (bằng lề text).
  4. **Primary Action:** Nút Filled Button đặt cố định ở đáy màn hình hoặc trôi nổi trong Floating Capsule.

---

## 4. Archetype 3: Danh sách & Bảng biểu (List / Data Table & Master-Detail)

Phù hợp cho danh sách sản phẩm, quản lý đơn hàng, danh bạ hoặc log hệ thống.

- **Cấu trúc khung:**
  1. **Search & Filter Bar:**
     - Search Bar Pill 56dp ở trên cùng.
     - Ngay dưới là hàng Filter Chips cuộn ngang (Scrollable Chip Row) với các trạng thái: Tất cả, Đang xử lý, Hoàn tất, Lỗi.
  2. **List Items (M3 List Tiles):**
     - Chiều cao mỗi dòng: 72 - 88 dp cho item có 2 dòng text + thumbnail; 56 dp cho item đơn giản.
     - Leading: Thumbnail bo góc 8dp hoặc Circle Avatar 40dp.
     - Headline + Supporting Text.
     - Trailing: Meta badge (ví dụ pill trạng thái xanh/đỏ) hoặc giá tiền.
  3. **Tablet / Desktop Master-Detail Layout:**
     - Cột trái (360dp - 400dp): Danh sách cuộn độc lập.
     - Cột phải (Flex 1): Khung chi tiết của item được chọn, chứa đầy đủ thông tin sâu và các nút thao tác.

---

## 5. Archetype 4: Bố cục thích ứng Đa màn hình (Adaptive Scaffold)

Nguyên tắc chuyển đổi giao diện linh hoạt giữa Điện thoại, Máy tính bảng và Máy tính để bàn:

| Kích thước màn hình | Breakpoint Width | Điều hướng chính (Navigation) | Bố cục nội dung |
| :--- | :--- | :--- | :--- |
| **Compact (Điện thoại)** | `< 600 dp` | **Navigation Bar** đáy màn hình (80dp) | 1 cột đơn, cuộn dọc |
| **Medium (Tablet đứng / Foldable)** | `600 - 839 dp` | **Navigation Rail** thu gọn (80dp) bên trái | 2 cột linh hoạt |
| **Expanded (Tablet ngang / Desktop)** | `840 - 1199 dp` | **Navigation Rail** mở rộng (256dp) | Master-Detail (2 panel) |
| **Extra-Large (Màn hình lớn)** | `>= 1200 dp` | **Standard Navigation Drawer** cố định | 3 panel (Nav - List - Detail) |
