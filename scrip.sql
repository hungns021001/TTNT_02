USE [Gaming_Center]
GO
/****** Object:  Table [dbo].[ChiTietDichVu]    Script Date: 01/07/2021 11:30:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDichVu](
	[IdDichVu] [nvarchar](100) NOT NULL,
	[MaMay] [nvarchar](100) NOT NULL,
	[IdMon] [int] NULL,
	[LoaiDichVu] [nvarchar](100) NULL,
	[TenDichVu] [nvarchar](100) NULL,
	[SoLuong] [int] NULL,
	[GiaDichVu] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 01/07/2021 11:30:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaMay] [nvarchar](100) NOT NULL,
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[IdDichVu] [nvarchar](100) NULL,
	[TongGiaDichVu] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoanhThu]    Script Date: 01/07/2021 11:30:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoanhThu](
	[MaDoanhThu] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaMay] [nvarchar](100) NULL,
	[NgayThang] [nvarchar](100) NULL,
	[SoTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDoanhThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 01/07/2021 11:30:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] NOT NULL,
	[MaMay] [nvarchar](100) NOT NULL,
	[IdNhanVien] [int] NULL,
	[NgayThang] [date] NULL,
	[GioSuDung] [time](7) NULL,
	[GioKetthuc] [time](7) NULL,
	[GiaDichVu] [nvarchar](100) NULL,
	[TongTien] [float] NULL,
	[TienKhachDua] [float] NULL,
	[TienTraLai] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[May]    Script Date: 01/07/2021 11:30:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[May](
	[MaMay] [nvarchar](100) NOT NULL,
	[TenMay] [varchar](100) NOT NULL,
	[HangSanXuat] [varchar](100) NOT NULL,
	[CauHinh] [varchar](100) NOT NULL,
	[TinhTrang] [varchar](100) NULL DEFAULT ('Tr?ng'),
PRIMARY KEY CLUSTERED 
(
	[MaMay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 01/07/2021 11:30:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMon] [int] IDENTITY(1,1) NOT NULL,
	[LoaiDichVu] [nvarchar](100) NULL,
	[TenDichVu] [nvarchar](100) NULL,
	[GiaDichVu] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 01/07/2021 11:30:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[IdNhanVien] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SoDienThoai] [nvarchar](10) NOT NULL,
	[IdTaiKhoan] [int] NULL,
	[Username] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 01/07/2021 11:30:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[IdTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NULL,
	[Password] [nvarchar](1000) NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[IdTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ChiTietDichVu]  WITH CHECK ADD FOREIGN KEY([IdMon])
REFERENCES [dbo].[Menu] ([IdMon])
GO
ALTER TABLE [dbo].[ChiTietDichVu]  WITH CHECK ADD FOREIGN KEY([IdMon])
REFERENCES [dbo].[Menu] ([IdMon])
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD FOREIGN KEY([MaMay])
REFERENCES [dbo].[May] ([MaMay])
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD FOREIGN KEY([MaMay])
REFERENCES [dbo].[May] ([MaMay])
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDichVu] FOREIGN KEY([IdDichVu])
REFERENCES [dbo].[ChiTietDichVu] ([IdDichVu])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_ChiTietDichVu]
GO
ALTER TABLE [dbo].[DoanhThu]  WITH CHECK ADD FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[DoanhThu]  WITH CHECK ADD FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([IdNhanVien])
REFERENCES [dbo].[NhanVien] ([IdNhanVien])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([IdNhanVien])
REFERENCES [dbo].[NhanVien] ([IdNhanVien])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[DichVu] ([MaHoaDon])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[DichVu] ([MaHoaDon])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_May] FOREIGN KEY([MaMay])
REFERENCES [dbo].[May] ([MaMay])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_May]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([IdTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([IdTaiKhoan])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([IdTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([IdTaiKhoan])
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 01/07/2021 11:30:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_GetTableList]
 As select * from May
GO
