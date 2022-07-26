USE [master]
GO
/****** Object:  Database [PRJ301_SHOP_Jewlry]    Script Date: 3/15/2022 8:55:01 AM ******/
CREATE DATABASE [PRJ301_SHOP_Jewlry]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_SHOP_Jewlry', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_SHOP_Jewlry.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_SHOP_Jewlry_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ301_SHOP_Jewlry_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_SHOP_Jewlry].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET QUERY_STORE = OFF
GO
USE [PRJ301_SHOP_Jewlry]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/15/2022 8:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[displayName] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/15/2022 8:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/15/2022 8:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/15/2022 8:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](500) NULL,
	[created_date] [date] NULL,
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/15/2022 8:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[describe] [nvarchar](255) NULL,
	[imageUrl] [nvarchar](500) NULL,
	[createdDate] [date] NULL,
	[categoryId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 3/15/2022 8:55:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [displayName], [address], [email], [phone]) VALUES (1, N'user1', N'123', N'User', N'HD', N'userHD@gamil.com', N'0974456789')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Rings')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Earrings')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Necklaces')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Bracelets')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Fashion Glasses')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (1, 1, N'Ring 1W', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/NTM_9789-1536x1536.jpg', 10, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (2, 1, N'Ring 2G', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N102C-1536x1536.jpg', 10, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (3, 2, N'Ring 2G', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N102C-1536x1536.jpg', 10, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (4, 2, N'Ring 3W', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N102-1536x1536.jpg', 10, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (5, 3, N'Ring 5W', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N106-1536x1536.jpg', 10, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (6, 3, N'Ring 3W', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N102-1536x1536.jpg', 10, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (1, 1, 30, N'size 6', CAST(N'2022-03-14' AS Date), 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (2, 1, 20, N'', CAST(N'2022-03-14' AS Date), 2)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (3, 1, 20, N'size 6', CAST(N'2022-03-14' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (1, N'Ring 1W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/NTM_9789-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (2, N'Ring 2G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N102C-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (3, N'Ring 3W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N102-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (4, N'Ring 4W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N105-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (5, N'Ring 5W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N106-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (6, N'Ring 6W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/N107-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (7, N'Ring 7W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2022/01/N104-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (8, N'Ring 8W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/12/N101-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (9, N'Ring 9W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/12/mn80e-3-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (10, N'Ring 10W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/12/mn73-1-1536x1536.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (11, N'Ring 11W', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/12/mn99-1-768x768.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (12, N'Ring 12G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/12/mn95b-768x768.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (13, N'Ring 13G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/12/mn31b-768x768.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (14, N'Ring 14G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/12/mn96b-2-768x768.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (15, N'Ring 15G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/11/mn59-1-768x768.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (16, N'Ring 16G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/07/photo_2021-11-18_16-07-22-768x768.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (17, N'Ring 17G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/10/mn04b-3-2-768x768.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (18, N'Ring 18G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/05/photo_2021-05-30_15-09-32-768x768.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (19, N'Ring 19G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/05/photo_2021-05-30_15-02-40-768x769.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (20, N'Ring 20G', 10, 10, N'High-grade Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/02/photo_2021-02-02_10-19-45-768x768.jpg', CAST(N'2021-08-23' AS Date), 1)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (21, N'Earring 1W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/07/photo_2021-11-18_16-07-24-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (22, N'Earring 2W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/11/photo_2021-11-15_09-24-28-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (23, N'Earring 3W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/11/photo_2021-11-15_10-28-42-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (24, N'Earring 4W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/05/photo_2021-05-25_16-55-06-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (25, N'Earring 5W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/05/photo_2021-05-25_16-55-07-2-768x769.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (26, N'Earring 6W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/05/mk74-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (27, N'Earring 7W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/photo_2021-03-31_11-58-27-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (28, N'Earring 8W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/photo_2021-03-31_11-58-26-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (29, N'Earring 9W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/photo_2021-03-03_15-11-52-1-768x769.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (30, N'Earring 10W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/photo_2021-03-19_15-47-34-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (31, N'Earring 11G', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/photo_2021-03-19_14-34-19-2-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (32, N'Earring 12B', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/photo_2021-03-19_14-43-25-3-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (33, N'Earring 13B', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/photo_2021-03-19_14-34-19-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (34, N'Earring 14G', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2020/12/mk56b-768x769.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (35, N'Earring 15B', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2019/12/photo_2019-12-11_13-41-47-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (36, N'Earring 16W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2019/12/photo_2019-12-11_13-42-15-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (37, N'Earring 17B', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2019/12/photo_2019-12-11_13-42-13-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (38, N'Earring 18W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2019/12/photo_2019-12-11_13-41-43-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (39, N'Earring 19B', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2019/12/photo_2019-12-11_13-42-04-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (40, N'Earring 20W', 10, 4, N'High quality Titanium alloy, not rust, not tarnish', N'http://mercury-jewels.vn/wp-content/uploads/2019/12/photo_2019-12-11_14-34-34-768x768.jpg', CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (41, N'Necklaces 1W 10mm', 10, 20, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/SC21-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (42, N'Necklaces 2W 6mm', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2022/03/SA21-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (43, N'Necklaces 3W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/07/photo_2021-11-18_16-07-16-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (44, N'Necklaces 4W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/06/photo_2021-06-01_12-04-30-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (45, N'Necklaces 5G', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/06/photo_2021-06-01_10-25-38-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (46, N'Necklaces 6W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/05/photo_2021-05-27_20-45-19-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (47, N'Necklaces 7W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2020/12/photo_2020-12-29_12-52-47-2-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (48, N'Necklaces 8G', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2020/12/photo_2020-12-29_12-52-45-2-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (49, N'Necklaces 9W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2020/12/sd08-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (50, N'Necklaces 10W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2020/12/photo_2020-12-29_12-52-46-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (51, N'Necklaces 11W', 10, 20, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2020/12/sc07-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (52, N'Bracelets 1W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2022/01/mv52-2-1536x1536.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (53, N'Hamsa Hand Necklaces', 10, 10, N'High quality Titanium alloy, not rust, not tarnish,length:60cm', N'http://mercury-jewels.vn/wp-content/uploads/2022/02/mc86-1-768x768.jpg', CAST(N'2021-04-09' AS Date), 3)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (54, N'Bracelets 2G', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2022/01/mv51b-2-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (55, N'Bracelets 2W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2022/01/mv51-2-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (56, N'Luxury Bracelets 3W', 10, 20, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/12/SV39-1-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (57, N'Bracelets 4G', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2022/01/mv50b-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (58, N'Luxury Bracelets 5G', 10, 20, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/12/photo_2021-11-12_16-10-01-600x600.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (59, N'Bracelets 6B', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/11/photo_2021-11-15_09-51-48-600x600.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (60, N'Bracelets 7W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/07/photo_2021-11-18_16-07-13-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (61, N'Bracelets 8B', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/05/photo_2021-05-24_16-00-31-2-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (62, N'Bracelets 9W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/mv38-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (63, N'Bracelets 10W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,freesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/mv24-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (64, N'Luxury Bracelets 11W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,f	reesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/03/photo_2021-03-16_14-57-50-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (65, N'Bracelets 12W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,freesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/01/31-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (66, N'Bracelets 13W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,freesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/01/31a-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (67, N'Bracelets 13G', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,freesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2021/01/31b-1.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (68, N'Bracelets 14G', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,freesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2020/09/mv26-2-1-768x768.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (69, N'Bracelets 15W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,freesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2020/09/mv36-768x769.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (70, N'Bracelets 16W', 10, 11, N'High quality Titanium alloy, not rust, not tarnish,freesize:wrist from 15-19cm', N'http://mercury-jewels.vn/wp-content/uploads/2022/01/mv52-2-1536x1536.jpg', CAST(N'2021-04-09' AS Date), 4)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (71, N'Fashion Glasses 1G', 10, 16, N'Material: PC plastic frame and Optical Resin eyes,easily replace near, far, shady eyes', N'http://mercury-jewels.vn/wp-content/uploads/2021/06/photo_2021-07-03_17-04-00-1-768x768.jpg', CAST(N'2021-04-09' AS Date), 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (72, N'Fashion Glasses 1B', 10, 16, N'Material: PC plastic frame and Optical Resin eyes,easily replace near, far, shady eyes', N'http://mercury-jewels.vn/wp-content/uploads/2021/06/photo_2021-07-03_17-04-02-1-1-768x768.jpg', CAST(N'2021-04-09' AS Date), 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (73, N'Fashion Glasses 2B', 10, 16, N'Material: PC plastic frame and Optical Resin eyes,easily replace near, far, shady eyes', N'http://mercury-jewels.vn/wp-content/uploads/2021/06/photo_2021-07-03_18-11-04-768x768.jpg', CAST(N'2021-04-09' AS Date), 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (74, N'Fashion Glasses 2G', 10, 16, N'Material: PC plastic frame and Optical Resin eyes,easily replace near, far, shady eyes', N'http://mercury-jewels.vn/wp-content/uploads/2021/06/photo_2021-07-03_17-04-06-1-768x768.jpg', CAST(N'2021-04-09' AS Date), 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (75, N'Fashion Glasses 3W', 10, 16, N'Material: PC plastic frame and Optical Resin eyes,easily replace near, far, shady eyes', N'http://mercury-jewels.vn/wp-content/uploads/2021/06/photo_2021-07-03_18-11-06-768x768.jpg', CAST(N'2021-04-09' AS Date), 5)
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [describe], [imageUrl], [createdDate], [categoryId]) VALUES (76, N'Fashion Glasses 13G', 10, 16, N'Material: PC plastic frame and Optical Resin eyes,easily replace near, far, shady eyes', N'http://mercury-jewels.vn/wp-content/uploads/2021/06/cg32a-768x768.jpg', CAST(N'2021-04-09' AS Date), 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1, N'Khang', N'0974421456789', N'HD')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (2, N'', N'', N'')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3, N'Khang', N'0974421456789', N'HD')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__30F848ED] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__30F848ED]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__account___2F10007B] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__account___2F10007B]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__shipping__300424B4] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__shipping__300424B4]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SHOP_Jewlry] SET  READ_WRITE 
GO
