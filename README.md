# Họ và tên: Nguyễn Thanh Hải, Msv: 21115053120212, Lớp học phần: 223LTC01

# QuanLySinhVien_CuoiKy

## Giới thiệu
QuanLySinhVien_CuoiKy là một ứng dụng ASP.NET Core MVC để quản lý  sinh viên và các hoạt động liên quan khác. Tài liệu này cung cấp hướng dẫn chi tiết để cài đặt và chạy dự án trên máy tính của bạn.
## Yêu cầu
Trước khi bắt đầu, hãy đảm bảo rằng bạn đã cài đặt các công cụ sau trên hệ thống của mình:
- [.NET SDK](https://dotnet.microsoft.com/download)
- [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- [Visual Studio 2022](https://visualstudio.microsoft.com/)
## Cài đặt

### 1. Clone Repository
Clone dự án từ GitHub về máy tính của bạn bằng lệnh sau:

```sh
git clone https://github.com/haiezdev/QuanLySinhVien_CuoiKi.git
cd QuanLySinhVien_CuoiKy
```
### 2. Chạy File Sql Trong SqlServer 
Tạo cơ sở dữ liệu bằng cách Execute file SQL_QLSV.sql
### 3. Khôi phục các gói phụ thuộc
Di chuyển đến thư mục dự án và khôi phục các gói NuGet cần thiết:

```sh
dotnet restore
```
### 4.Thiết lập cơ sở dữ liệu
Thiết lập SQL Server và tạo một cơ sở dữ liệu mới. Cập nhật chuỗi kết nối trong file appsettings.json với thông tin cơ sở dữ liệu của bạn.
Ví dụ appsettings.json:
```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*",
  "ConnectionStrings": {
    "QuanLySinhVienCuoiKiConnection": "Your connection string"
  }
}

```
### 5. Áp dụng Migrations(Nếu cần thiết)
Áp dụng các migrations để tạo các schema cơ sở dữ liệu cần thiết:

```sh
dotnet ef database update
```
### 6. Chạy ứng dụng 
Chạy ứng dụng bằng lệnh sau:

```sh
dotnet run
```
Chạy ứng dụng bằng giao diện người dùng:
Chọn IIE Express và Click chuột Run

Bạn có thể truy cập ứng dụng tại https://localhost:your_port
### 7. Tính năng
  #### 7.1. Sinh Viên
  -Quản lý thông tin cá nhân của sinh viên.
  
  -Gồm các thông tin như mã sinh viên, họ và tên, ngày sinh, địa chỉ, email, số điện thoại,...

  #### 7.2. Giáo Viên
  -Quản lý thông tin cá nhân của giáo viên.
  
  -Gồm các thông tin như mã giáo viên, họ và tên, ngày sinh, địa chỉ, email, số điện thoại,...
  
  #### 7.3. Lớp Học Phần
  -Quản lý thông tin về các lớp học phần trong học kỳ.

  -Gồm các thông tin như mã lớp, tên môn học, giảng viên phụ trách,...
  
  -Cập nhật thông tin lớp học phần.
  #### 7.4. Lớp sinh hoạt
  -Quản lý thông tin về các lớp sinh hoạt của sinh viên.
  
  -Cập nhật thông tin lớp sinh hoạt.
  #### 7.5. Khoa
  -Quản lý thông tin về các khoa trong trường.
  
  -Cập nhật thông tin về các khoa trong trường.
  #### 7.6. Trường
  -Quản lý thông tin về trường.
### 8. Khắc phục sự cố
-Đảm bảo SQL Server đang chạy và có thể truy cập.

-Kiểm tra chuỗi kết nối trong appsettings.json để đảm bảo chính xác.

-Đảm bảo bạn có quyền ghi vào cơ sở dữ liệu.
### 9. Đóng góp
Mọi đóng góp đều được chào đón! Hãy tạo một pull request với mô tả chi tiết về các thay đổi của bạn.
