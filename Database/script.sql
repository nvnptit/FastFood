USE [master]
GO
/****** Object:  Database [FASTFOOD]    Script Date: 17/10/2021 11:00:05 PM ******/
CREATE DATABASE [FASTFOOD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FASTFOOD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FASTFOOD.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FASTFOOD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FASTFOOD_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FASTFOOD] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FASTFOOD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FASTFOOD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FASTFOOD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FASTFOOD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FASTFOOD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FASTFOOD] SET ARITHABORT OFF 
GO
ALTER DATABASE [FASTFOOD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FASTFOOD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FASTFOOD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FASTFOOD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FASTFOOD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FASTFOOD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FASTFOOD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FASTFOOD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FASTFOOD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FASTFOOD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FASTFOOD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FASTFOOD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FASTFOOD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FASTFOOD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FASTFOOD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FASTFOOD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FASTFOOD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FASTFOOD] SET RECOVERY FULL 
GO
ALTER DATABASE [FASTFOOD] SET  MULTI_USER 
GO
ALTER DATABASE [FASTFOOD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FASTFOOD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FASTFOOD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FASTFOOD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FASTFOOD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FASTFOOD', N'ON'
GO
USE [FASTFOOD]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 17/10/2021 11:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[IdOrderDetail] [int] IDENTITY(1,1) NOT NULL,
	[IdOrder] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[IdOrderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17/10/2021 11:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[IdUser] [int] NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 17/10/2021 11:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/10/2021 11:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([IdOrderDetail], [IdOrder], [IdProduct], [Number], [Price]) VALUES (1, 1, 1, 1, 20000)
INSERT [dbo].[OrderDetails] ([IdOrderDetail], [IdOrder], [IdProduct], [Number], [Price]) VALUES (2, 2, 2, 1, 15000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([IdOrder], [Name], [Address], [IdUser], [Phone], [Price], [OrderTime]) VALUES (1, N'order1', N'Q9', 1, N'0966189810', 20000, CAST(N'2021-10-16 00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([IdOrder], [Name], [Address], [IdUser], [Phone], [Price], [OrderTime]) VALUES (2, N'order2', N'Q12', 2, N'0254632159', 15000, CAST(N'2021-10-17 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (1, N'cocacola', N'Drink', 20000, N'cocacola.jpg', 32)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (2, N'Bánh bao', N'Food', 15000, N'banhBao.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (3, N'Bánh gạo', N'Food', 20000, N'banhGao.jpg', 15)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (6, N'Bánh mì', N'Food', 15000, N'banhMi.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (7, N'Bánh Su', N'Food', 10000, N'banhSu.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (9, N'Bánh tráng nướng', N'Food', 25000, N'banhTrangNuong.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (10, N'Gà rán', N'Food', 45000, N'FriedChicken.jpg', 10)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (11, N'Hamberger', N'Food', 30000, N'hamberger.jpg', 15)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (12, N'Hot dog', N'Food', 30000, N'hotdog.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (13, N'Khoai tây chiên', N'Food', 25000, N'khoaiTayChien.jpg', 15)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (14, N'pizza', N'Food', 150000, N'pizza.jpg', 10)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (15, N'Salad', N'Food', 20000, N'salad.jpg', 5)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (16, N'Sandwich', N'Food', 15000, N'sandwich.jpg', 10)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (17, N'Sandwich lạt Otto', N'Food', 15000, N'sandwichOtto.jpg', 25)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (18, N'Xúc xích', N'Food', 25000, N'sausage.jpg', 25)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (20, N'Xiên que', N'Food', 15000, N'xienQue.jpg', 15)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (21, N'7up', N'Drink', 15000, N'7up.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (22, N'Nước giải khát 247', N'Drink', 15000, N'247.jpg', 15)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (23, N'Aquafina', N'Drink', 10000, N'aquafina.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (24, N'Nước dừa', N'Drink', 12000, N'coconut.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (25, N'Fanta', N'Drink', 12000, N'fanta.jpg', 15)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (26, N'Fanta vị nho', N'Drink', 12000, N'fantaNho.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (27, N'Ice vị đào', N'Drink', 12000, N'IceViDao.jpg', 15)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (28, N'Lipton Sữa', N'Drink', 15000, N'lipton_sua.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (29, N'Lipton vị chanh', N'Drink', 20000, N'liptonIceTea.jpg', 15)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (30, N'Mirinda vị cam', N'Drink', 15000, N'MirindaOrange.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (31, N'Mirinda Soda kem', N'Drink', 15000, N'MirindaSodaKem.jpg', 25)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (32, N'Mirinda Xá xị', N'Drink', 15000, N'mirindaXaXi.png', 25)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (33, N'Number 1', N'Drink', 12000, N'number1.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (34, N'Pepsi', N'Drink', 11000, N'pepsi.jpg', 25)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (35, N'Red bull', N'Drink', 10000, N'redBull.jpg', 20)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (36, N'Revive', N'Drink', 9000, N'revive.jpg', 25)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (37, N'Revive vị chanh muối', N'Drink', 9000, N'reviveChanhMuoi.jpg', 25)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (38, N'StrongBow', N'Drink', 15000, N'strongBow.jpg', 25)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (39, N'Trà đào sả', N'Drink', 20000, N'traDaoSa.jpg', 25)
INSERT [dbo].[Product] ([IdProduct], [Name], [Type], [Price], [Image], [Number]) VALUES (40, N'Trà xanh không độ', N'Drink', 12000, N'traXanhKhongDo.jpg', 20)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IdUser], [Username], [Password], [Name], [Address], [Phone], [Email]) VALUES (1, N'NguyenDiu', N'12345', N'Dịu', N'Quận 9', N'0966189810', N'huyendiusmilef5@gmail.com')
INSERT [dbo].[Users] ([IdUser], [Username], [Password], [Name], [Address], [Phone], [Email]) VALUES (2, N'admin', N'admin', N'Admin', N'Q12', N'0867426463', N'n18dccn027@ptithcm.edu.vn')
INSERT [dbo].[Users] ([IdUser], [Username], [Password], [Name], [Address], [Phone], [Email]) VALUES (3, N'MaiNgan', N'123456', N'Ngân', N'Q13', N'0356476980', N'huyendiusmilef5@gmail.com')
INSERT [dbo].[Users] ([IdUser], [Username], [Password], [Name], [Address], [Phone], [Email]) VALUES (4, N'nvn', N'nvn', N'Nhất', N'Q1', N'0235641789', N'nhatNguyen@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Orders] ([IdOrder])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
USE [master]
GO
ALTER DATABASE [FASTFOOD] SET  READ_WRITE 
GO
