USE [QL_Covid19]
GO
/****** Object:  Table [dbo].[Cach_Ly]    Script Date: 11/2/2020 7:32:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cach_Ly](
	[stt] [int] IDENTITY(1,1) NOT NULL,
	[id_nhan_khau] [int] NOT NULL,
	[muc_do] [varchar](5) NOT NULL,
	[thoi_gian_bat_dau] [datetime] NOT NULL,
	[tiep_xuc_trong_tdp] [nvarchar](1) NULL,
	[trang_thai_test] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[stt] ASC,
	[id_nhan_khau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KQ_Test]    Script Date: 11/2/2020 7:32:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KQ_Test](
	[stt] [int] IDENTITY(1,1) NOT NULL,
	[id_nhan_khau] [int] NOT NULL,
	[lan_test] [tinyint] NOT NULL,
	[thoi_gian_ghi_nhan] [datetime] NOT NULL,
	[hinh_thuc_test] [nvarchar](20) NOT NULL,
	[ket_qua] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thong_Tin_Dich_Te]    Script Date: 11/2/2020 7:32:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thong_Tin_Dich_Te](
	[stt] [int] IDENTITY(1,1) NOT NULL,
	[id_nhan_khau] [int] NOT NULL,
	[vung_dich_di_qua] [nvarchar](1) NULL,
	[ngay_di] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thong_Tin_Ho_Khau]    Script Date: 11/2/2020 7:32:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thong_Tin_Ho_Khau](
	[id_ho_khau] [smallint] IDENTITY(1,1) NOT NULL,
	[dia_chi] [nvarchar](100) NOT NULL,
	[id_chu_ho] [int] NOT NULL,
	[so_thanh_vien] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ho_khau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thong_Tin_Nhan_Khau]    Script Date: 11/2/2020 7:32:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thong_Tin_Nhan_Khau](
	[id_nhan_khau] [int] IDENTITY(1,1) NOT NULL,
	[id_ho_khau] [smallint] NOT NULL,
	[ho_va_ten] [nvarchar](50) NOT NULL,
	[ngay_sinh] [datetime] NOT NULL,
	[gioi_tinh] [varchar](3) NOT NULL,
	[cccd] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_nhan_khau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thong_Tin_Suc_Khoe]    Script Date: 11/2/2020 7:32:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thong_Tin_Suc_Khoe](
	[stt] [int] IDENTITY(1,1) NOT NULL,
	[id_nhan_khau] [int] NOT NULL,
	[tinh_trang] [nvarchar](20) NOT NULL,
	[bieu_hien] [nvarchar](100) NULL,
	[ngay_ghi_nhan] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cach_Ly]  WITH CHECK ADD FOREIGN KEY([id_nhan_khau])
REFERENCES [dbo].[Thong_Tin_Nhan_Khau] ([id_nhan_khau])
GO
ALTER TABLE [dbo].[KQ_Test]  WITH CHECK ADD FOREIGN KEY([id_nhan_khau])
REFERENCES [dbo].[Thong_Tin_Nhan_Khau] ([id_nhan_khau])
GO
ALTER TABLE [dbo].[Thong_Tin_Dich_Te]  WITH CHECK ADD FOREIGN KEY([id_nhan_khau])
REFERENCES [dbo].[Thong_Tin_Nhan_Khau] ([id_nhan_khau])
GO
ALTER TABLE [dbo].[Thong_Tin_Ho_Khau]  WITH CHECK ADD FOREIGN KEY([id_chu_ho])
REFERENCES [dbo].[Thong_Tin_Nhan_Khau] ([id_nhan_khau])
GO
ALTER TABLE [dbo].[Thong_Tin_Nhan_Khau]  WITH CHECK ADD FOREIGN KEY([id_ho_khau])
REFERENCES [dbo].[Thong_Tin_Ho_Khau] ([id_ho_khau])
GO
ALTER TABLE [dbo].[Thong_Tin_Suc_Khoe]  WITH CHECK ADD FOREIGN KEY([id_nhan_khau])
REFERENCES [dbo].[Thong_Tin_Nhan_Khau] ([id_nhan_khau])
GO
