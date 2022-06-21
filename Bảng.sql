create database Gaming_Center
go
use Gaming_Center
go
--
Create table TaiKhoan
(
IdTaiKhoan int identity(1,1) primary key,
Username nvarchar (100) not null,
DisplayName nvarchar(100),
Password nvarchar (1000) not null default 1
)
go
--
Create table NhanVien
(
 IdNhanVien	int identity(1,1) primary key,
 HoTen nvarchar (100) not null,
 NgaySinh date,
 DiaChi nvarchar(50) not null,
 SoDienThoai nvarchar (10) not null,
 IdTaiKhoan int foreign key (IdTaiKhoan) references TaiKhoan,
 Username nvarchar (100) not null
 )
 go
 --
 Alter table NhanVien
 alter column NgaySinh nvarchar(100);
 --
 Alter table NhanVien
 alter column NgaySinh date;
 --
 create table May
 (
 MaMay nvarchar (100) not null primary key,
 TenMay varchar (100) not null,
 HangSanXuat varchar (100) not null,
 CauHinh varchar (100) not null,
 TinhTrang varchar (100) default 'Trống' 
 )
 go
 --
 create table DichVu
 (
 MaMay nvarchar (100) not null,
 MaHoaDon int identity(1,1) primary key,
 IdDichVu nvarchar (100),
 TongGiaDichVu float
 foreign key (MaMay) references May(MaMay)
 )
 go
  --
 Create table Menu
 (
 IdMon int identity(1,1) primary key,
 LoaiDichVu nvarchar (100),
 TenDichVu nvarchar (100) ,
 GiaDichVu nvarchar (100) not null
 )
 go
 --
 create table ChiTietDichVu
 (
 IdDichVu nvarchar (100) primary key,
 MaMay nvarchar (100) not null,
 [IdMon] int foreign key (IdMon) references Menu,
 LoaiDichVu nvarchar (100),
 TenDichVu nvarchar (100) ,
 SoLuong int ,
 GiaDichVu nvarchar (100) not null
 )
 go
 --
 create table HoaDon
 (
 [MaHoaDon] int foreign key (MaHoaDon) references DichVu  primary key,
 MaMay nvarchar (100) not null,
 [IdNhanVien] int foreign key (IdNhanVien) references NhanVien,
 NgayThang date,
 GioSuDung  time,
 GioKetthuc time,
 GiaDichVu nvarchar (100) ,
 TongTien float,
 TienKhachDua float,
 TienTraLai float
 )
 go
 --
 create table DoanhThu
 (
 MaDoanhThu int identity(1,1) primary key,
 [MaHoaDon] int foreign key (MaHoaDon) references HoaDon,
 MaMay nvarchar (100),
 NgayThang nvarchar (100),
 SoTien float
 )
 go
 --
 Alter table DichVu
 Add Constraint FK_ChiTietDichVu foreign key (IdDichVu) references ChiTietDichVu(IdDichVu)
 --
 Alter table HoaDon	
 Add constraint FK_May foreign key (MaMay) references May(MaMay)
 --
 Select * from TaiKhoan
 --
 Select * from NhanVien
 --
 Select * from ChiTietDichVu
 --
 Select * from Menu
 --
 Select * from May
 --
 Select * from DichVu
 --
 Select * from HoaDon
 --
 Select * from DoanhThu
 --
 create PROC USP_GetTableList
 As select * from May
 go
