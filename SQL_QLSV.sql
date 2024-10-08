USE [master]
GO
/****** Object:  Database [QuanLySinhVien_CuoiKi]    Script Date: 22/05/2024 10:38:24 SA ******/
CREATE DATABASE [QuanLySinhVien_CuoiKi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLySinhVien_CuoiKi', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLySinhVien_CuoiKi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLySinhVien_CuoiKi_log', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLySinhVien_CuoiKi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLySinhVien_CuoiKi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET QUERY_STORE = OFF
GO
USE [QuanLySinhVien_CuoiKi]
GO
/****** Object:  User [hai]    Script Date: 22/05/2024 10:38:24 SA ******/
CREATE USER [hai] FOR LOGIN [hai] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[giao_vien]    Script Date: 22/05/2024 10:38:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giao_vien](
	[ma_gv] [char](7) NOT NULL,
	[ten_gv] [nvarchar](50) NOT NULL,
	[email] [varchar](100) NULL,
	[so_dien_thoai] [varchar](10) NULL,
	[bo_mon] [nvarchar](100) NULL,
	[ma_khoa] [char](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_gv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoc_phan]    Script Date: 22/05/2024 10:38:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoc_phan](
	[ma_hoc_phan] [char](7) NOT NULL,
	[ten_hoc_phan] [nvarchar](100) NULL,
	[so_tin_chi] [int] NULL,
	[ma_gv] [char](7) NULL,
	[ma_khoa] [char](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_hoc_phan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khoa]    Script Date: 22/05/2024 10:38:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khoa](
	[ma_khoa] [char](7) NOT NULL,
	[ten_khoa] [nvarchar](100) NULL,
	[ma_truong] [char](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_khoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lop_hoc_phan]    Script Date: 22/05/2024 10:38:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop_hoc_phan](
	[ma_sv] [char](14) NOT NULL,
	[ma_hoc_phan] [char](7) NOT NULL,
	[diem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_sv] ASC,
	[ma_hoc_phan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lopSinhHoat]    Script Date: 22/05/2024 10:38:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lopSinhHoat](
	[ma_lopSH] [char](7) NOT NULL,
	[ten_lopSH] [nvarchar](100) NULL,
	[ma_khoa] [char](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_lopSH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 22/05/2024 10:38:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinh_vien]    Script Date: 22/05/2024 10:38:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinh_vien](
	[ma_sv] [char](14) NOT NULL,
	[ten_sv] [nvarchar](50) NOT NULL,
	[ngay_sinh] [date] NULL,
	[gioi_tinh] [nvarchar](3) NULL,
	[email] [varchar](100) NULL,
	[so_dien_thoai] [varchar](10) NULL,
	[dia_chi] [nvarchar](255) NULL,
	[ma_lopSH] [char](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_sv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[truong]    Script Date: 22/05/2024 10:38:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[truong](
	[ma_truong] [char](7) NOT NULL,
	[ten_truong] [nvarchar](100) NULL,
	[dia_chi] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_truong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 22/05/2024 10:38:24 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV001  ', N'Nguyễn Văn Thanh Hải', N'nguyenthanhhai@email.com', N'0901234567', N'Lập trình cơ sở dữ liệu', N'CNTT   ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV002  ', N'Nguyễn Huy Hoàng', N'nguyenhuyhoang@email.com', N'0982345678', N'Thuật toán và lập trình', N'CNTT   ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV003  ', N'Lê Thị Lan', N'lethilan@email.com', N'0913456789', N'Hệ thống thông tin', N'CNTT   ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV004  ', N'Hoàng Minh Tuấn', N'hoangminhtuan@email.com', N'0354567890', N'Cơ sở dữ liệu', N'CK     ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV005  ', N'Phạm Đức Anh', N'phamducanh@email.com', N'0385678901', N'Kỹ thuật điều khiển tự động', N'CK     ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV006  ', N'Lê Thị Bích', N'lethibich@email.com', N'0906789012', N'Cơ khí chính xác', N'CK     ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV007  ', N'Trần Văn Dũng', N'tranvandung@email.com', N'0987890123', N'Kết cấu bê tông cốt thép', N'XD     ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV008  ', N'Nguyễn Thị Thảo', N'nguyenthithao@email.com', N'0918901234', N'Thẩm định giá xây dựng', N'XD     ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV009  ', N'Huỳnh Văn Nam', N'huynhvannam@email.com', N'0319012345', N'Quản lý dự án xây dựng', N'XD     ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV010  ', N'Phan Thị Kim Ngân', N'phanthikimngan@email.com', N'0350123456', N'Hợp tác xã trong xây dựng', N'XD     ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV011  ', N'Nga Nguyễn', N'Nga@gmail.com', N'0902323332', N'C#', N'CNTT   ')
INSERT [dbo].[giao_vien] ([ma_gv], [ten_gv], [email], [so_dien_thoai], [bo_mon], [ma_khoa]) VALUES (N'GV020  ', N'Nguyễn Hải', N'Hainguyen@gmail.com', N'0903413123', N'C#', N'CNTT   ')
GO
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HH001  ', N'Hoá học', 3, N'GV001  ', N'HH     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP001  ', N'Lập trình cơ sở dữ liệu', 3, N'GV001  ', N'CNTT   ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP002  ', N'Thuật toán và lập trình', 4, N'GV002  ', N'CNTT   ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP003  ', N'Hệ thống thông tin', 3, N'GV003  ', N'CNTT   ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP004  ', N'An toàn thông tin', 3, N'GV003  ', N'CNTT   ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP005  ', N'Kỹ thuật phần mềm', 4, N'GV001  ', N'CNTT   ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP006  ', N'Cơ sở dữ liệu', 3, N'GV004  ', N'CK     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP007  ', N'Cơ khí chính xác', 4, N'GV006  ', N'CK     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP008  ', N'Kỹ thuật điều khiển tự động', 3, N'GV005  ', N'CK     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP009  ', N'Trí tuệ nhân tạo', 3, N'GV004  ', N'CK     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP010  ', N'Toán cao cấp', 4, N'GV005  ', N'CK     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP011  ', N'Kết cấu bê tông cốt thép', 3, N'GV007  ', N'XD     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP012  ', N'Thẩm định giá xây dựng', 4, N'GV007  ', N'XD     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP013  ', N'Quản lý dự án xây dựng', 3, N'GV008  ', N'XD     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP014  ', N'Tiết kế kỹ thuật', 3, N'GV009  ', N'XD     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP015  ', N'Hợp tác xã trong xây dựng', 4, N'GV010  ', N'XD     ')
INSERT [dbo].[hoc_phan] ([ma_hoc_phan], [ten_hoc_phan], [so_tin_chi], [ma_gv], [ma_khoa]) VALUES (N'HP111  ', N'Hoá', 3, N'GV001  ', N'CK     ')
GO
INSERT [dbo].[khoa] ([ma_khoa], [ten_khoa], [ma_truong]) VALUES (N'CK     ', N'Khoa Cơ khí', N'UTE    ')
INSERT [dbo].[khoa] ([ma_khoa], [ten_khoa], [ma_truong]) VALUES (N'CKHH   ', N'Cơ khí hoá học', N'UTE    ')
INSERT [dbo].[khoa] ([ma_khoa], [ten_khoa], [ma_truong]) VALUES (N'CNTT   ', N'Khoa Công nghệ thông tin', N'UTE    ')
INSERT [dbo].[khoa] ([ma_khoa], [ten_khoa], [ma_truong]) VALUES (N'HH     ', N'Hoá Học', N'UTE    ')
INSERT [dbo].[khoa] ([ma_khoa], [ten_khoa], [ma_truong]) VALUES (N'XD     ', N'Khoa Xây dựng', N'UTE    ')
GO
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120001', N'HH001  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120001', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120001', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120001', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120001', N'HP004  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120001', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120001', N'HP014  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120002', N'HH001  ', 10)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120002', N'HP001  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120002', N'HP002  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120002', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120002', N'HP004  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120002', N'HP005  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120003', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120003', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120003', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120003', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120003', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120004', N'HP006  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120004', N'HP007  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120004', N'HP008  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120004', N'HP009  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120004', N'HP010  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120005', N'HP006  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120005', N'HP007  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120005', N'HP008  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120005', N'HP009  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120005', N'HP010  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120006', N'HP011  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120006', N'HP012  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120006', N'HP013  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120006', N'HP014  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120006', N'HP015  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120007', N'HP011  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120007', N'HP012  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120007', N'HP013  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120007', N'HP014  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120007', N'HP015  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120008', N'HP011  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120008', N'HP012  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120008', N'HP013  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120008', N'HP014  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120008', N'HP015  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120009', N'HP011  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120009', N'HP012  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120009', N'HP013  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120009', N'HP014  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120009', N'HP015  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120010', N'HP011  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120010', N'HP012  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120010', N'HP013  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120010', N'HP014  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120010', N'HP015  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120011', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120011', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120011', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120011', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120011', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120012', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120012', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120012', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120012', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120012', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120013', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120013', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120013', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120013', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120013', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120014', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120014', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120014', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120014', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120014', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120015', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120015', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120015', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120015', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120015', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120016', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120016', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120016', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120016', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120016', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120017', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120017', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120017', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120017', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120017', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120018', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120018', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120018', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120018', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120018', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120019', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120019', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120019', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120019', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120019', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120020', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120020', N'HP002  ', 7)
GO
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120020', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120020', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120020', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120021', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120021', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120021', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120021', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120021', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120022', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120022', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120022', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120022', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120022', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120023', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120023', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120023', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120023', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120023', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120024', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120024', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120024', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120024', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120024', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120025', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120025', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120025', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120025', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120025', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120026', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120026', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120026', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120026', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120026', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120027', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120027', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120027', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120027', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120027', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120028', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120028', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120028', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120028', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120028', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120029', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120029', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120029', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120029', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120029', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120030', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120030', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120030', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120030', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120030', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120031', N'HP001  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120031', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120031', N'HP003  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120031', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120031', N'HP005  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120033', N'HP001  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120033', N'HP002  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120033', N'HP003  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120033', N'HP004  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120033', N'HP005  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120034', N'HP001  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120034', N'HP002  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120034', N'HP003  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120034', N'HP004  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120034', N'HP005  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120035', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120035', N'HP002  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120035', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120035', N'HP004  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120035', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120036', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120036', N'HP002  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120036', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120036', N'HP004  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120036', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120037', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120037', N'HP002  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120037', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120037', N'HP004  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120037', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120038', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120038', N'HP002  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120038', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120038', N'HP004  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120038', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120039', N'HP001  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120039', N'HP002  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120039', N'HP003  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120039', N'HP004  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120039', N'HP005  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120040', N'HP006  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120040', N'HP007  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120040', N'HP008  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120040', N'HP009  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120040', N'HP010  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120041', N'HP006  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120041', N'HP007  ', 7)
GO
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120041', N'HP008  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120041', N'HP009  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120041', N'HP010  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120042', N'HP006  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120042', N'HP007  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120042', N'HP008  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120042', N'HP009  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120042', N'HP010  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120043', N'HP006  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120043', N'HP007  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120043', N'HP008  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120043', N'HP009  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120043', N'HP010  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120044', N'HP006  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120044', N'HP007  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120044', N'HP008  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120044', N'HP009  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120044', N'HP010  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120045', N'HP006  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120045', N'HP007  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120045', N'HP008  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120045', N'HP009  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120045', N'HP010  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120046', N'HP006  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120046', N'HP007  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120046', N'HP008  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120046', N'HP009  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120046', N'HP010  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120047', N'HP006  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120047', N'HP007  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120047', N'HP008  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120047', N'HP009  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120047', N'HP010  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120048', N'HP006  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120048', N'HP007  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120048', N'HP008  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120048', N'HP009  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120048', N'HP010  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120049', N'HP006  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120049', N'HP007  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120049', N'HP008  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120049', N'HP009  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120049', N'HP010  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120050', N'HP011  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120050', N'HP012  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120050', N'HP013  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120050', N'HP014  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120050', N'HP015  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120051', N'HP011  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120051', N'HP012  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120051', N'HP013  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120051', N'HP014  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120051', N'HP015  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120052', N'HP011  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120052', N'HP012  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120052', N'HP013  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120052', N'HP014  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120052', N'HP015  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120053', N'HP011  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120053', N'HP012  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120053', N'HP013  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120053', N'HP014  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120053', N'HP015  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120054', N'HP011  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120054', N'HP012  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120054', N'HP013  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120054', N'HP014  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120054', N'HP015  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120055', N'HP011  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120055', N'HP012  ', 8)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120055', N'HP013  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120055', N'HP014  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120055', N'HP015  ', 9)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120056', N'HP011  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120056', N'HP012  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120056', N'HP013  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120056', N'HP014  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120056', N'HP015  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120057', N'HP011  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120057', N'HP012  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120057', N'HP013  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120057', N'HP014  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120057', N'HP015  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120058', N'HP011  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120058', N'HP012  ', 6)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120058', N'HP013  ', 7)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120058', N'HP014  ', 5)
INSERT [dbo].[lop_hoc_phan] ([ma_sv], [ma_hoc_phan], [diem]) VALUES (N'21115053120058', N'HP015  ', 7)
GO
INSERT [dbo].[lopSinhHoat] ([ma_lopSH], [ten_lopSH], [ma_khoa]) VALUES (N'LSH01  ', N'21T1', N'CNTT   ')
INSERT [dbo].[lopSinhHoat] ([ma_lopSH], [ten_lopSH], [ma_khoa]) VALUES (N'LSH02  ', N'21T2', N'CNTT   ')
INSERT [dbo].[lopSinhHoat] ([ma_lopSH], [ten_lopSH], [ma_khoa]) VALUES (N'LSH03  ', N'21T3', N'CNTT   ')
INSERT [dbo].[lopSinhHoat] ([ma_lopSH], [ten_lopSH], [ma_khoa]) VALUES (N'LSH04  ', N'21CK1', N'CK     ')
INSERT [dbo].[lopSinhHoat] ([ma_lopSH], [ten_lopSH], [ma_khoa]) VALUES (N'LSH05  ', N'21CK2', N'CK     ')
INSERT [dbo].[lopSinhHoat] ([ma_lopSH], [ten_lopSH], [ma_khoa]) VALUES (N'LSH06  ', N'21XD1', N'XD     ')
INSERT [dbo].[lopSinhHoat] ([ma_lopSH], [ten_lopSH], [ma_khoa]) VALUES (N'LSH07  ', N'21XD2', N'XD     ')
INSERT [dbo].[lopSinhHoat] ([ma_lopSH], [ten_lopSH], [ma_khoa]) VALUES (N'LSH08  ', N'21XD3', N'XD     ')
INSERT [dbo].[lopSinhHoat] ([ma_lopSH], [ten_lopSH], [ma_khoa]) VALUES (N'LSH10  ', N'22T3', N'CK     ')
GO
SET IDENTITY_INSERT [dbo].[nguoidung] ON 

INSERT [dbo].[nguoidung] ([id], [username], [password]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[nguoidung] ([id], [username], [password]) VALUES (2, N'admin1', N'admin')
SET IDENTITY_INSERT [dbo].[nguoidung] OFF
GO
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120001', N'Nguyễn Thanh Hải ', CAST(N'2001-05-30' AS Date), N'Nam', N'nguyenthanhha@student.com', N'0901234567', N'Đà Nẵng', N'LSH01  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120002', N'Nguyễn Huy Hoàn', CAST(N'2001-03-13' AS Date), N'Nam', N'nguyenhuyhoan@student.com', N'0982345678', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120003', N'Lê Thị Lan', CAST(N'2001-09-23' AS Date), N'Nữ', N'lethilan@student.com', N'0913456789', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120004', N'Hoàng Minh Tuấn', CAST(N'2001-02-17' AS Date), N'Nam', N'hoangminhtuan@student.com', N'0354567890', N'Đà Nẵng', N'LSH04  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120005', N'Phạm Đức Anh', CAST(N'2001-10-29' AS Date), N'Nam', N'phamducanh@student.com', N'0385678901', N'Đà Nẵng', N'LSH05  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120006', N'Lê Thị Bích', CAST(N'2001-05-17' AS Date), N'Nữ', N'lethibich@student.com', N'0906789012', N'Đà Nẵng', N'LSH06  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120007', N'Trần Văn Dũng', CAST(N'2001-05-14' AS Date), N'Nam', N'tranvandung@student.com', N'0987890123', N'Đà Nẵng', N'LSH07  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120008', N'Nguyễn Thị Thảo', CAST(N'2001-05-15' AS Date), N'Nữ', N'nguyenthithao@student.com', N'0918901234', N'Đà Nẵng', N'LSH07  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120009', N'Huỳnh Văn Nam', CAST(N'2001-02-13' AS Date), N'Nam', N'huynhvannam@student.com', N'0319012345', N'Đà Nẵng', N'LSH07  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120010', N'Phan Thị Kim Ngân', CAST(N'2001-01-13' AS Date), N'Nữ', N'phanthikimngan@student.com', N'0350123456', N'Đà Nẵng', N'LSH08  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120011', N'Trần Minh Tuấn', CAST(N'2001-01-11' AS Date), N'Nam', N'tranminhtuan@student.com', N'0908765432', N'Đà Nẵng', N'LSH01  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120012', N'Nguyễn Thị Hằng', CAST(N'2001-04-13' AS Date), N'Nữ', N'nguyenthihang@student.com', N'0987654321', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120013', N'Lê Văn Dũng', CAST(N'2001-05-18' AS Date), N'Nam', N'levandung@student.com', N'0912345678', N'Đà Nẵng', N'LSH01  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120014', N'Hoàng Văn Tài', CAST(N'2001-06-19' AS Date), N'Nam', N'hoangvantai@student.com', N'0987654321', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120015', N'Trần Thị Hà', CAST(N'2001-01-14' AS Date), N'Nữ', N'tranthiha@student.com', N'0909876543', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120016', N'Nguyễn Văn An', CAST(N'2001-02-19' AS Date), N'Nam', N'nguyenvanan@student.com', N'0976543210', N'Đà Nẵng', N'LSH04  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120017', N'Trần Thị Bảo', CAST(N'2001-01-12' AS Date), N'Nữ', N'tranbaonu@student.com', N'0965432109', N'Đà Nẵng', N'LSH05  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120018', N'Đặng Văn Lâm', CAST(N'2001-03-20' AS Date), N'Nam', N'dangvanlam@student.com', N'0954321098', N'Đà Nẵng', N'LSH06  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120019', N'Lê Thị Thanh', CAST(N'2001-05-25' AS Date), N'Nữ', N'lethithanh@student.com', N'0943210987', N'Đà Nẵng', N'LSH07  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120020', N'Phạm Văn Phong', CAST(N'2001-03-13' AS Date), N'Nam', N'phamvanphong@student.com', N'0932109876', N'Đà Nẵng', N'LSH08  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120021', N'Nguyễn Thị Trang', CAST(N'2001-12-14' AS Date), N'Nữ', N'nguyenthitrang@student.com', N'0901111222', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120022', N'Trần Văn Tú', CAST(N'2001-10-15' AS Date), N'Nam', N'tranvantu@student.com', N'0901111333', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120023', N'Lê Thị Tâm', CAST(N'2001-09-13' AS Date), N'Nữ', N'lethitam@student.com', N'0901111444', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120024', N'Phạm Văn Sơn', CAST(N'2001-02-13' AS Date), N'Nam', N'phamvanson@student.com', N'0381111555', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120025', N'Nguyễn Thị Thảo', CAST(N'2001-06-13' AS Date), N'Nữ', N'nguyenthithao@student.com', N'0901111666', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120026', N'Hoàng Văn Quân', CAST(N'2001-04-13' AS Date), N'Nam', N'hoangvanquan@student.com', N'0901111777', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120027', N'Lê Thị Thu', CAST(N'2001-07-13' AS Date), N'Nữ', N'lethithu@student.com', N'0901111888', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120028', N'Phạm Văn Khoa', CAST(N'2001-03-13' AS Date), N'Nam', N'phamvankhoa@student.com', N'0901111999', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120029', N'Nguyễn Thị Nhung', CAST(N'2001-08-13' AS Date), N'Nữ', N'nguyenthinhung@student.com', N'0901112000', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120030', N'Trần Văn Hùng', CAST(N'2001-12-13' AS Date), N'Nam', N'tranvanhung@student.com', N'0901112111', N'Đà Nẵng', N'LSH02  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120031', N'Nguyễn Văn Nam', CAST(N'2001-11-13' AS Date), N'Nam', N'nguyenvannam@student.com', N'0902222333', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120032', N'Trần Thị Thu', CAST(N'2001-10-13' AS Date), N'Nữ', N'tranthithu@student.com', N'0902222444', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120033', N'Lê Văn Lâm', CAST(N'2001-09-13' AS Date), N'Nam', N'levanlam@student.com', N'0902222555', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120034', N'Phạm Thị Mai', CAST(N'2001-03-13' AS Date), N'Nữ', N'phamthimai@student.com', N'0902222666', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120035', N'Nguyễn Văn Hải', CAST(N'2001-06-03' AS Date), N'Nam', N'nguyenvanhai@student.com', N'0902222777', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120036', N'Trần Thị Thảo', CAST(N'2001-05-23' AS Date), N'Nữ', N'tranthithao@student.com', N'0902222888', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120037', N'Lê Văn Hoàng', CAST(N'2001-05-14' AS Date), N'Nam', N'levanhoang@student.com', N'0902222999', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120038', N'Phạm Thị Hương', CAST(N'2001-01-20' AS Date), N'Nữ', N'phamthihuong@student.com', N'0902223000', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120039', N'Phạm Thị Hương Lan', CAST(N'2001-11-20' AS Date), N'Nữ', N'phamthihuonglan@student.com', N'0902223400', N'Đà Nẵng', N'LSH03  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120040', N'Trần Thị Lan', CAST(N'2001-05-20' AS Date), N'Nữ', N'tranthilan@student.com', N'0903333444', N'Đà Nẵng', N'LSH04  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120041', N'Lê Văn Long', CAST(N'2001-05-15' AS Date), N'Nam', N'levanlong@student.com', N'0903333555', N'Đà Nẵng', N'LSH04  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120042', N'Phạm Thị Kim', CAST(N'2001-01-14' AS Date), N'Nữ', N'phamthikim@student.com', N'0903333666', N'Đà Nẵng', N'LSH04  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120043', N'Nguyễn Văn Hải', CAST(N'2001-01-20' AS Date), N'Nam', N'nguyenvanhai@student.com', N'0903333777', N'Đà Nẵng', N'LSH04  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120044', N'Trần Thị Thuận', CAST(N'2001-06-17' AS Date), N'Nữ', N'tranthithuan@student.com', N'0903333888', N'Đà Nẵng', N'LSH04  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120045', N'Lê Văn Tùng', CAST(N'2001-05-30' AS Date), N'Nam', N'levantung@student.com', N'0904444555', N'Đà Nẵng', N'LSH05  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120046', N'Phạm Thị Ngọc', CAST(N'2001-02-17' AS Date), N'Nữ', N'phamthingoc@student.com', N'0384444666', N'Đà Nẵng', N'LSH05  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120047', N'Nguyễn Văn Duy', CAST(N'2001-12-13' AS Date), N'Nam', N'nguyenvanduy@student.com', N'0904444777', N'Đà Nẵng', N'LSH05  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120048', N'Trần Thị Hà', CAST(N'2001-04-11' AS Date), N'Nữ', N'tranthiha@student.com', N'0904444888', N'Đà Nẵng', N'LSH05  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120049', N'Lê Văn Khoa', CAST(N'2001-05-18' AS Date), N'Nam', N'levankhoa@student.com', N'0904444999', N'Đà Nẵng', N'LSH05  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120050', N'Phạm Thị Hương', CAST(N'2001-06-13' AS Date), N'Nữ', N'phamthihuong@student.com', N'0905555666', N'Đà Nẵng', N'LSH06  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120051', N'Trần Văn Hiếu', CAST(N'2001-07-13' AS Date), N'Nam', N'tranvanhieu@student.com', N'0905555777', N'Đà Nẵng', N'LSH06  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120052', N'Nguyễn Thị Loan', CAST(N'2001-08-13' AS Date), N'Nữ', N'nguyenthiloan@student.com', N'0905555888', N'Đà Nẵng', N'LSH06  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120053', N'Nguyễn Văn Hà Duy', CAST(N'2001-12-13' AS Date), N'Nam', N'nguyenvanduy@student.com', N'0384444787', N'Đà Nẵng', N'LSH07  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120054', N'Trần Thị Hà Hi', CAST(N'2001-04-11' AS Date), N'Nữ', N'tranthiha@student.com', N'0904444888', N'Đà Nẵng', N'LSH07  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120055', N'Lê Văn Khoa Học', CAST(N'2001-05-18' AS Date), N'Nam', N'levankhoa@student.com', N'0384444999', N'Đà Nẵng', N'LSH07  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120056', N'Nguyễn Văn Hà Huy Duy', CAST(N'2001-12-13' AS Date), N'Nam', N'nguyenvanduy@student.com', N'0904444888', N'Đà Nẵng', N'LSH08  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120057', N'Trần Thị Hà Hải', CAST(N'2001-04-11' AS Date), N'Nữ', N'tranthiha@student.com', N'0904444888', N'Đà Nẵng', N'LSH08  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120058', N'Lê Văn Khoa Học Hi', CAST(N'2001-05-18' AS Date), N'Nam', N'levankhoa@student.com', N'0904444888', N'Đà Nẵng', N'LSH08  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120212', N'Nguyễn Hải', CAST(N'2003-10-26' AS Date), N'Nam', N'hai@gmail.com', N'0902321322', N'Đà Nẵng', N'LSH01  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120213', N'Hải Lê Văn', CAST(N'2003-10-25' AS Date), N'Nam', N'hain@gmail.com', N'0902323122', N'Vinh', N'LSH01  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120267', N'Hải Nguyễn', CAST(N'2003-10-26' AS Date), N'Nam', N'Hai@gmail.com', N'0904232232', N'Đà Nẵng', N'LSH06  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120268', N'Nguyễn Thanh Hải', CAST(N'2003-12-01' AS Date), N'Nam', N'hai@gmail.com', N'0902333333', N'Đà Nẵng', N'LSH05  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120275', N'Hải Đây Nè', CAST(N'2001-10-26' AS Date), N'Nam', N'haixclk@gmail.com', N'0904212312', N'Việt Nam', N'LSH01  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120288', N'Hải Nguyễn Nè', CAST(N'2001-10-25' AS Date), N'Nam', N'hainguyen@gmail.com', N'0942161036', N'Đà Nẵng', N'LSH06  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115053120312', N'Lộc Nguyễn', CAST(N'2003-02-12' AS Date), N'N?', N'Loc@gmail.com', N'0901020202', N'TP. Hồ Chí Minh', N'LSH01  ')
INSERT [dbo].[sinh_vien] ([ma_sv], [ten_sv], [ngay_sinh], [gioi_tinh], [email], [so_dien_thoai], [dia_chi], [ma_lopSH]) VALUES (N'21115932929929', N'Hải Nguyễn nè', CAST(N'2003-10-26' AS Date), N'Nam', N'hai@gmail.com', N'0900120302', N'Đà Nẵng', N'LSH06  ')
GO
INSERT [dbo].[truong] ([ma_truong], [ten_truong], [dia_chi]) VALUES (N'UTE    ', N'Đại học Sư phạm Kỹ thuật Đà Nẵng', N'87 Cao Thắng')
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__nguoidun__F3DBC572613A7734]    Script Date: 22/05/2024 10:38:24 SA ******/
ALTER TABLE [dbo].[nguoidung] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572731D7947]    Script Date: 22/05/2024 10:38:24 SA ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[giao_vien]  WITH CHECK ADD FOREIGN KEY([ma_khoa])
REFERENCES [dbo].[khoa] ([ma_khoa])
GO
ALTER TABLE [dbo].[hoc_phan]  WITH CHECK ADD FOREIGN KEY([ma_gv])
REFERENCES [dbo].[giao_vien] ([ma_gv])
GO
ALTER TABLE [dbo].[hoc_phan]  WITH CHECK ADD FOREIGN KEY([ma_khoa])
REFERENCES [dbo].[khoa] ([ma_khoa])
GO
ALTER TABLE [dbo].[khoa]  WITH CHECK ADD FOREIGN KEY([ma_truong])
REFERENCES [dbo].[truong] ([ma_truong])
GO
ALTER TABLE [dbo].[lop_hoc_phan]  WITH CHECK ADD FOREIGN KEY([ma_hoc_phan])
REFERENCES [dbo].[hoc_phan] ([ma_hoc_phan])
GO
ALTER TABLE [dbo].[lop_hoc_phan]  WITH CHECK ADD FOREIGN KEY([ma_sv])
REFERENCES [dbo].[sinh_vien] ([ma_sv])
GO
ALTER TABLE [dbo].[lopSinhHoat]  WITH CHECK ADD FOREIGN KEY([ma_khoa])
REFERENCES [dbo].[khoa] ([ma_khoa])
GO
ALTER TABLE [dbo].[sinh_vien]  WITH CHECK ADD FOREIGN KEY([ma_lopSH])
REFERENCES [dbo].[lopSinhHoat] ([ma_lopSH])
GO
ALTER TABLE [dbo].[giao_vien]  WITH CHECK ADD CHECK  ((len([so_dien_thoai])=(10) AND (substring([so_dien_thoai],(1),(3))='038' OR substring([so_dien_thoai],(1),(3))='035' OR substring([so_dien_thoai],(1),(3))='031' OR substring([so_dien_thoai],(1),(3))='091' OR substring([so_dien_thoai],(1),(3))='098' OR substring([so_dien_thoai],(1),(3))='090')))
GO
ALTER TABLE [dbo].[giao_vien]  WITH CHECK ADD CHECK  ((len([ten_gv])>=(10) AND len([ten_gv])<=(50)))
GO
ALTER TABLE [dbo].[sinh_vien]  WITH CHECK ADD CHECK  ((len([ten_sv])>=(10) AND len([ten_sv])<=(50)))
GO
USE [master]
GO
ALTER DATABASE [QuanLySinhVien_CuoiKi] SET  READ_WRITE 
GO
