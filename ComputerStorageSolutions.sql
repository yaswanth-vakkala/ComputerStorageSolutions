USE [master]
GO
/****** Object:  Database [ComputerStorageSolutions]    Script Date: 01-09-2024 14:40:05 ******/
CREATE DATABASE [ComputerStorageSolutions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ComputerStorageSolutions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ComputerStorageSolutions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ComputerStorageSolutions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ComputerStorageSolutions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ComputerStorageSolutions] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ComputerStorageSolutions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ComputerStorageSolutions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET ARITHABORT OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ComputerStorageSolutions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ComputerStorageSolutions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ComputerStorageSolutions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ComputerStorageSolutions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET RECOVERY FULL 
GO
ALTER DATABASE [ComputerStorageSolutions] SET  MULTI_USER 
GO
ALTER DATABASE [ComputerStorageSolutions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ComputerStorageSolutions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ComputerStorageSolutions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ComputerStorageSolutions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ComputerStorageSolutions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ComputerStorageSolutions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ComputerStorageSolutions', N'ON'
GO
ALTER DATABASE [ComputerStorageSolutions] SET QUERY_STORE = ON
GO
ALTER DATABASE [ComputerStorageSolutions] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ComputerStorageSolutions]
GO
/****** Object:  Table [dbo].[CART]    Script Date: 01-09-2024 14:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[CartId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[ProductId] [uniqueidentifier] NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 01-09-2024 14:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 01-09-2024 14:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[BillingAddress] [nvarchar](255) NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 01-09-2024 14:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NULL,
	[ProductId] [uniqueidentifier] NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01-09-2024 14:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[OrderStatus] [nvarchar](50) NULL,
	[ShippingAddress] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01-09-2024 14:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Status] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 01-09-2024 14:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01-09-2024 14:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[RoleId] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (1, N'SSD', N'Solid State Drives')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (2, N'HDD', N'Hard Disk Drives')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (3, N'Flash Drives', N'USB Flash Drives')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (4, N'Memory Cards', N'SD Cards and MicroSD Cards')
GO
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'956d4615-f6a2-4ce0-061c-08dcc937b3f8', N'1ec9ce77-53f7-4662-f41a-08dcc937b3ce', N'790abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'1c7945d0-dad7-4ff8-024d-08dcc982242b', N'd0b51978-cd04-41fa-a4b7-08dcc982240e', N'790abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'd8923bea-222d-49f8-82bf-08dcc9c078af', N'e3444fca-f2e7-44e2-6a22-08dcc9c0788c', N'790abb90-0766-ef11-acd5-00bb607b40c7', 5, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'cd2f2f02-5874-405c-82c0-08dcc9c078af', N'e3444fca-f2e7-44e2-6a22-08dcc9c0788c', N'7a0abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'c7462114-39a3-42d1-82c1-08dcc9c078af', N'e3444fca-f2e7-44e2-6a22-08dcc9c0788c', N'7b0abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'e606b56f-380b-4d7a-82c2-08dcc9c078af', N'e3444fca-f2e7-44e2-6a22-08dcc9c0788c', N'7c0abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'1bc927f5-382d-4dc5-9c14-08dcc9c1979e', N'6725f21c-314a-47aa-8d5f-08dcc9c19775', N'790abb90-0766-ef11-acd5-00bb607b40c7', 5, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'a21dd931-a683-4538-9c15-08dcc9c1979e', N'6725f21c-314a-47aa-8d5f-08dcc9c19775', N'7a0abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'48f3f89d-1f21-4118-9c16-08dcc9c1979e', N'6725f21c-314a-47aa-8d5f-08dcc9c19775', N'7b0abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'd1e0de0c-a44b-455e-9c17-08dcc9c1979e', N'6725f21c-314a-47aa-8d5f-08dcc9c19775', N'7c0abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'32ddd330-1e15-4579-9c18-08dcc9c1979e', N'ad6d348a-6072-4162-8d60-08dcc9c19775', N'790abb90-0766-ef11-acd5-00bb607b40c7', 5, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'f8a6ccce-e46e-4db4-9c19-08dcc9c1979e', N'ad6d348a-6072-4162-8d60-08dcc9c19775', N'7a0abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'8b31ecd6-2333-424e-9c1a-08dcc9c1979e', N'ad6d348a-6072-4162-8d60-08dcc9c19775', N'7b0abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(80.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'e510f1a6-40c1-4bea-9c1b-08dcc9c1979e', N'ad6d348a-6072-4162-8d60-08dcc9c19775', N'7c0abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'50aa6132-1ec5-44cb-9c1c-08dcc9c1979e', N'de9f9e61-d1de-4d33-8d61-08dcc9c19775', N'790abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (N'ccb901f9-a01a-4bd8-9c1d-08dcc9c1979e', N'a2ab953d-983f-4069-8d62-08dcc9c19775', N'790abb90-0766-ef11-acd5-00bb607b40c7', 1, CAST(120.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderDate], [TotalAmount], [OrderStatus], [ShippingAddress]) VALUES (N'1ec9ce77-53f7-4662-f41a-08dcc937b3ce', N'ce30a304-73ff-47ca-c96c-08dcc90668a7', CAST(N'2024-08-31T02:37:05.637' AS DateTime), CAST(120.00 AS Decimal(10, 2)), N'Order Placed', N'fjyrf, xfrkyrf, ytky, ytky')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderDate], [TotalAmount], [OrderStatus], [ShippingAddress]) VALUES (N'd0b51978-cd04-41fa-a4b7-08dcc982240e', N'ce30a304-73ff-47ca-c96c-08dcc90668a7', CAST(N'2024-08-31T11:29:56.733' AS DateTime), CAST(120.00 AS Decimal(10, 2)), N'Order Placed', N'xfryjkyr, ettjetj, etjet, zdetkjtr')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderDate], [TotalAmount], [OrderStatus], [ShippingAddress]) VALUES (N'e3444fca-f2e7-44e2-6a22-08dcc9c0788c', N'ce30a304-73ff-47ca-c96c-08dcc90668a7', CAST(N'2024-08-31T18:56:07.273' AS DateTime), CAST(800.00 AS Decimal(10, 2)), N'Order Placed', N'gwrhrwh, wrhwrh, erwhrwe, wRHWR')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderDate], [TotalAmount], [OrderStatus], [ShippingAddress]) VALUES (N'6725f21c-314a-47aa-8d5f-08dcc9c19775', N'ce30a304-73ff-47ca-c96c-08dcc90668a7', CAST(N'2024-08-31T19:04:08.630' AS DateTime), CAST(800.00 AS Decimal(10, 2)), N'Order Placed', N'QEGWEG, weghweG, weqhgw, EWHGWEg')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderDate], [TotalAmount], [OrderStatus], [ShippingAddress]) VALUES (N'ad6d348a-6072-4162-8d60-08dcc9c19775', N'ce30a304-73ff-47ca-c96c-08dcc90668a7', CAST(N'2024-08-31T19:04:24.903' AS DateTime), CAST(800.00 AS Decimal(10, 2)), N'Order Placed', N'QEGWEG, weghweG, weqhgw, EWHGWEg')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderDate], [TotalAmount], [OrderStatus], [ShippingAddress]) VALUES (N'de9f9e61-d1de-4d33-8d61-08dcc9c19775', N'ce30a304-73ff-47ca-c96c-08dcc90668a7', CAST(N'2024-08-31T19:21:03.697' AS DateTime), CAST(120.00 AS Decimal(10, 2)), N'Order Placed', N'zejhnted, zetj, zetjt, zteajt')
INSERT [dbo].[Orders] ([OrderId], [UserId], [OrderDate], [TotalAmount], [OrderStatus], [ShippingAddress]) VALUES (N'a2ab953d-983f-4069-8d62-08dcc9c19775', N'ce30a304-73ff-47ca-c96c-08dcc90668a7', CAST(N'2024-08-31T19:30:55.333' AS DateTime), CAST(120.00 AS Decimal(10, 2)), N'Order Placed', N'WQF, qwF, Qef, WQF')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description], [Price], [StockQuantity], [ImageUrl], [Status]) VALUES (N'790abb90-0766-ef11-acd5-00bb607b40c7', N'1TB SSD', 1, N'High-speed SSD with 1TB capacity', CAST(120.00 AS Decimal(10, 2)), 38, N'/images/1tb_ssd.png', N'Available')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description], [Price], [StockQuantity], [ImageUrl], [Status]) VALUES (N'7a0abb90-0766-ef11-acd5-00bb607b40c7', N'500GB SSD', 1, N'Mid-range SSD with 500GB capacity', CAST(70.00 AS Decimal(10, 2)), 73, N'/images/500gb_ssd.png', N'Available')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description], [Price], [StockQuantity], [ImageUrl], [Status]) VALUES (N'7b0abb90-0766-ef11-acd5-00bb607b40c7', N'2TB HDD', 2, N'Reliable HDD with 2TB capacity', CAST(80.00 AS Decimal(10, 2)), 28, N'/images/2tb_hdd.png', N'Available')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description], [Price], [StockQuantity], [ImageUrl], [Status]) VALUES (N'7c0abb90-0766-ef11-acd5-00bb607b40c7', N'1TB HDD', 2, N'Affordable HDD with 1TB capacity', CAST(50.00 AS Decimal(10, 2)), 98, N'/images/1tb_hdd.png', N'Available')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description], [Price], [StockQuantity], [ImageUrl], [Status]) VALUES (N'7d0abb90-0766-ef11-acd5-00bb607b40c7', N'64GB Flash Drive', 3, N'Compact 64GB USB Flash Drive', CAST(15.00 AS Decimal(10, 2)), 200, N'/images/64gb_flash.png', N'Available')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description], [Price], [StockQuantity], [ImageUrl], [Status]) VALUES (N'7e0abb90-0766-ef11-acd5-00bb607b40c7', N'128GB Flash Drive', 3, N'High-capacity 128GB USB Flash Drive', CAST(25.00 AS Decimal(10, 2)), 150, N'/images/128gb_flash.png', N'Available')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description], [Price], [StockQuantity], [ImageUrl], [Status]) VALUES (N'7f0abb90-0766-ef11-acd5-00bb607b40c7', N'32GB Memory Card', 4, N'32GB MicroSD Memory Card', CAST(10.00 AS Decimal(10, 2)), 300, N'/images/32gb_sd.png', N'Available')
INSERT [dbo].[Products] ([ProductId], [ProductName], [CategoryId], [Description], [Price], [StockQuantity], [ImageUrl], [Status]) VALUES (N'800abb90-0766-ef11-acd5-00bb607b40c7', N'64GB Memory Card', 4, N'64GB MicroSD Memory Card', CAST(20.00 AS Decimal(10, 2)), 250, N'/images/64gb_sd.png', N'Available')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (N'572ebc78-233f-4efc-80f5-39c07264bd85', N'Customer')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (N'9dfb14d0-0311-417c-a93f-abd781aabde2', N'Admin')
GO
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'95200ef0-0af9-47ab-1878-08dcc82e7e86', N'test', N'PHlZ6DVfGctsegI+RgmeXqnvI8xMdWddFTs2Yon6HR3xgTQimCW3UGTGpOhtl+P6brqu0sHajJNQACTDw/T/1A==', N'Test@gamil.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-08-29T18:58:39.513' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'ce30a304-73ff-47ca-c96c-08dcc90668a7', N'test', N'PHlZ6DVfGctsegI+RgmeXqnvI8xMdWddFTs2Yon6HR3xgTQimCW3UGTGpOhtl+P6brqu0sHajJNQACTDw/T/1A==', N'test@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-08-30T20:44:14.223' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'0f2f85be-55dc-43c6-c96d-08dcc90668a7', N'Test', N'PHlZ6DVfGctsegI+RgmeXqnvI8xMdWddFTs2Yon6HR3xgTQimCW3UGTGpOhtl+P6brqu0sHajJNQACTDw/T/1A==', N'test1@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-08-30T20:48:56.197' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'0ffa505a-1597-4c53-c96e-08dcc90668a7', N'wrhgrwgh', N'PHlZ6DVfGctsegI+RgmeXqnvI8xMdWddFTs2Yon6HR3xgTQimCW3UGTGpOhtl+P6brqu0sHajJNQACTDw/T/1A==', N'weeghwr@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-08-30T21:13:30.697' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'a94fe448-bb0e-4d0f-c96f-08dcc90668a7', N'wrhgrwgh', N'PHlZ6DVfGctsegI+RgmeXqnvI8xMdWddFTs2Yon6HR3xgTQimCW3UGTGpOhtl+P6brqu0sHajJNQACTDw/T/1A==', N'weeghwg@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-08-30T21:14:49.770' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'743ae7b8-c28d-4aea-c5fa-08dcc9f9a395', N'ghrwh', N'2oyVv/+z/ZdluZqXx198nUZ3/LU7TZBsNw3lvixkegeWEH4PJAgyDpzXwRnP3m88Lp27hKtojkW5ctMvNHs+hw==', N'ghrwh@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-09-01T01:45:20.457' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'0844075f-d524-4c45-8d6b-08dcca03b958', N'asfeaf', N'PHlZ6DVfGctsegI+RgmeXqnvI8xMdWddFTs2Yon6HR3xgTQimCW3UGTGpOhtl+P6brqu0sHajJNQACTDw/T/1A==', N'test10@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-09-01T02:57:32.283' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'1681bf7a-e705-4a16-8d6c-08dcca03b958', N'feaqGF', N'PHlZ6DVfGctsegI+RgmeXqnvI8xMdWddFTs2Yon6HR3xgTQimCW3UGTGpOhtl+P6brqu0sHajJNQACTDw/T/1A==', N'sgfs@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-09-01T02:58:30.613' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'07b54b8b-74ce-4f66-8d6d-08dcca03b958', N'wrgrw', N'PHlZ6DVfGctsegI+RgmeXqnvI8xMdWddFTs2Yon6HR3xgTQimCW3UGTGpOhtl+P6brqu0sHajJNQACTDw/T/1A==', N'EQGe@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-09-01T02:59:34.403' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'fde2e53e-34cb-40a2-bd5b-27b12327729a', N'admin', N'password', N'admin1@gmail.com', N'9dfb14d0-0311-417c-a93f-abd781aabde2', CAST(N'2024-08-11T10:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'9a1bd1d1-e6d5-4970-bb5e-3fa487365581', N'johndoe', N'hashed_pw2', N'johndoe@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-08-11T10:10:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [RoleId], [CreatedDate], [IsActive]) VALUES (N'cbaace4c-2aa0-434b-abae-614930bcf4ba', N'janedoe', N'hashed_pw3', N'janedoe@gmail.com', N'572ebc78-233f-4efc-80f5-39c07264bd85', CAST(N'2024-08-11T10:20:00.000' AS DateTime), 1)
GO
ALTER TABLE [dbo].[CART] ADD  DEFAULT (newid()) FOR [CartId]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (newid()) FOR [InvoiceId]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT (newsequentialid()) FOR [OrderDetailId]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (newid()) FOR [OrderId]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (newsequentialid()) FOR [ProductId]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
USE [master]
GO
ALTER DATABASE [ComputerStorageSolutions] SET  READ_WRITE 
GO
