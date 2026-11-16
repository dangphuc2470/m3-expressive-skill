# Material 3 Component Specifications & Metrics

Tài liệu quy chuẩn kích thước hình học, khoảng cách lề (padding) và vùng chạm (touch target) chuẩn mực của Google Material Design 3 (M3). Mọi AI agent khi sinh code UI cho Web hoặc Mobile bắt buộc phải đối chiếu với các thông số vật lý dưới đây.

---

## 1. Nguyên tắc Vùng Chạm (Touch Target & Accessibility)

- **Mobile Touch Target:** Tối thiểu **48x48 dp** cho mọi thành phần có thể nhấn (Button, Icon Button, Checkbox, Switch, Tab). Nếu phần hiển thị trực quan nhỏ hơn (ví dụ Icon 24dp hoặc Badge 16dp), phải mở rộng padding vô hình để đạt vùng chạm 48dp.
- **Desktop / Web Pointer Target:** Tối thiểu **40x40 px** cho chuột hoặc bút stylus.
- **Khoảng cách an toàn giữa 2 nút cạnh nhau:** Tối thiểu **8dp** để tránh bấm nhầm.

---

## 2. Buttons & Actions

| Loại Button | Chiều cao (Height) | Bo góc (Corner) | Padding Ngang | Kích thước Icon |
| :--- | :--- | :--- | :--- | :--- |
| **Standard Button** (Filled, Tonal, Outlined, Text) | 40 dp | 20 dp (Full Pill) | 24 dp (16 dp nếu có icon) | 18 - 20 dp |
| **Small Button / Dense** | 32 dp | 16 dp | 16 dp (12 dp nếu có icon) | 16 dp |
| **Connected Button Item** | 40 dp | Đầu ngoài: 16-20dp, Trong: 0dp | 16 dp | 18 dp |
| **Icon Button** (Standard, Filled, Tonal, Outlined) | 40x40 dp | 20 dp (tròn 50%) | 8 dp (touch target 48x48) | 24 dp |
| **Floating Action Button (FAB) Small** | 40x40 dp | 12 dp | - | 24 dp |
| **Floating Action Button (FAB) Regular** | 56x56 dp | 16 dp | - | 24 dp |
| **Floating Action Button (FAB) Large** | 96x96 dp | 28 dp | - | 36 dp |
| **Extended FAB** | 56 dp | 16 dp | 16 dp trước icon, 20 dp sau text | 24 dp |

---

## 3. Cards & Containers

- **Standard Card (Elevated / Filled / Outlined):**
  - **Bo góc mặc định:** `corner-large` (**16 dp**).
  - **Padding nội dung:** **16 dp** (màn hình nhỏ) hoặc **20 - 24 dp** (màn hình rộng).
  - **Đường viền Outlined Card:** Độ dày `1 dp`, màu `outline-variant`.
- **Hero Card / Large Metric Card:**
  - **Bo góc:** `corner-extra-large` (**28 dp**).
  - **Padding nội dung:** **24 dp**.
- **Bottom Sheet / Modal Dialog:**
  - **Bo góc:** `corner-extra-large` (**28 dp**). Dialog bo đều 4 góc; Bottom Sheet chỉ bo 2 góc trên (`28dp 28dp 0 0`).
  - **Padding nội dung:** **24 dp**.

---

## 4. Input Fields & Search Bars

- **Text Field (Filled / Outlined):**
  - **Chiều cao tối thiểu:** **56 dp**.
  - **Bo góc Outlined Field:** `corner-extra-small` (**4 dp**) hoặc `corner-small` (**8 dp**).
  - **Bo góc Filled Field:** Bo 2 góc trên 4dp (`4dp 4dp 0 0`), đáy thẳng có thanh indicator 1dp (focus 2dp).
  - **Padding ngang bên trong:** **16 dp**.
  - **Supporting text / Error text:** Kích cỡ chữ `body-small` (12sp), padding trên 4dp, thụt lề ngang 16dp.
- **Search Bar (M3 Search Pill):**
  - **Chiều cao chuẩn:** **56 dp**.
  - **Bo góc:** `corner-full` (**28 dp**).
  - **Padding ngang:** **16 dp** (Leading search icon 24dp, Trailing avatar/filter icon 24dp).
  - **Nền:** `surface-container-high`.

---

## 5. Navigation Components

- **Navigation Bar (Bottom Bar trên Mobile):**
  - **Chiều cao chuẩn:** **80 dp** (bao gồm vùng active indicator dạng viên thuốc cao 32dp x rộng 64dp).
  - **Nền:** `surface-container`. Không dùng shadow nổi cộm, phân tách bằng màu nền hoặc viền mờ `outline-variant`.
- **Navigation Rail (Thanh dọc cho Tablet / Màn hình ngang):**
  - **Chiều rộng chuẩn:** **80 dp** (compact) hoặc mở rộng **192 - 256 dp**.
  - **Căn lề trên/dưới:** FAB đặt ở đỉnh rail, các tab phân bố cách nhau 12dp.
- **Navigation Drawer:**
  - **Chiều rộng chuẩn:** **360 dp** (Modal) hoặc **280 - 320 dp** (Standard).
  - **Bo góc Drawer Sheet:** Bo 2 góc phải `28 dp`.

---

## 6. Lớp Phản hồi Tương tác (State Layer Opacity)

Mọi hiệu ứng hover, focus, press trong M3 đều dùng một lớp phủ bán trong suốt (`state-layer`) đặt trên bề mặt:

| Trạng thái | Lớp phủ Opacity (Color = On-Surface hoặc On-Primary) |
| :--- | :--- |
| **Hover** | `8%` (0.08) |
| **Focus** | `10%` (0.10) |
| **Press (Active / Ripple)** | `10% - 12%` (0.10 - 0.12) |
| **Drag** | `16%` (0.16) |
| **Disabled Container** | `12%` (0.12) |
| **Disabled Content (Text / Icon)** | `38%` (0.38) |
