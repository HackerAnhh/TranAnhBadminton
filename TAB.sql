USE [master]
GO

CREATE DATABASE [TranAnhBadminton]
GO

USE [TranAnhBadminton] 
GO
SELECT * FROM Product
GO

/****** Object:  Database TranAnhBadminton    Script Date: 18/04/2024 10:29:59 CH ******/
CREATE DATABASE TranAnhBadminton
GO
ALTER DATABASE TranAnhBadminton SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE TranAnhBadminton SET ANSI_NULLS OFF 
GO
ALTER DATABASE TranAnhBadminton SET ANSI_PADDING OFF 
GO
ALTER DATABASE TranAnhBadminton SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE TranAnhBadminton SET ARITHABORT OFF 
GO
ALTER DATABASE TranAnhBadminton SET AUTO_CLOSE ON 
GO
ALTER DATABASE TranAnhBadminton SET AUTO_SHRINK OFF 
GO
ALTER DATABASE TranAnhBadminton SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE TranAnhBadminton SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE TranAnhBadminton SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE TranAnhBadminton SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE TranAnhBadminton SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE TranAnhBadminton SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE TranAnhBadminton SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE TranAnhBadminton SET  ENABLE_BROKER 
GO
ALTER DATABASE TranAnhBadminton SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE TranAnhBadminton SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE TranAnhBadminton SET TRUSTWORTHY OFF 
GO
ALTER DATABASE TranAnhBadminton SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE TranAnhBadminton SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE TranAnhBadminton SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE TranAnhBadminton SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE TranAnhBadminton SET RECOVERY SIMPLE 
GO
ALTER DATABASE TranAnhBadminton SET  MULTI_USER 
GO
ALTER DATABASE TranAnhBadminton SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE TranAnhBadminton SET DB_CHAINING OFF 
GO
ALTER DATABASE TranAnhBadminton SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE TranAnhBadminton SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE TranAnhBadminton SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE TranAnhBadminton SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE TranAnhBadminton SET QUERY_STORE = OFF
GO
USE TranAnhBadminton
GO
/****** Object:  Table [dbo].[Account]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Phone] [varchar](13) NULL,
	[CreateDate] [datetime] NULL,
	[LastLogin] [datetime] NULL,
	[RoleId] [int] NULL,
	[IsActived] [bit] NOT NULL,
	[Randomkey] [nchar](10) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attribute]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attribute](
	[AttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttributePrices]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributePrices](
	[AttributePriceID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [int] NULL,
	[IsActived] [bit] NULL,
 CONSTRAINT [PK_AttributePrices] PRIMARY KEY CLUSTERED 
(
	[AttributePriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NOT NULL,
	[Descriptions] [nvarchar](250) NULL,
	[ParentID] [int] NOT NULL,
	[Levels] [int] NULL,
	[Ordering] [int] NULL,
	[IsPublished] [bit] NOT NULL,
	[ThumbImg] [nvarchar](250) NULL,
	[Title] [nvarchar](200) NULL,
	[Alias] [nvarchar](250) NULL,
	[Cover] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustommerID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[BirthDay] [datetime] NULL,
	[Avatar] [nvarchar](250) NULL,
	[Address] [nvarchar](max) NULL,
	[Mail] [nvarchar](max) NULL,
	[Phone] [varchar](13) NULL,
	[District] [nvarchar](max) NULL,
	[Ward] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[LastLogin] [datetime] NULL,
	[IsActived] [bit] NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Province] [nvarchar](max) NULL,
	[Randomkey] [nvarchar](10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustommerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[TransactionStatusID] [int] NULL,
	[IsDeleted] [bit] NULL,
	[IsPaid] [bit] NULL,
	[Note] [nvarchar](max) NULL,
	[TotalMoney] [decimal](18, 2) NULL,
	[District] [nvarchar](max) NULL,
	[Province] [nvarchar](max) NULL,
	[Ward] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[Total] [decimal](18, 2) NULL,
	[CreateDate] [datetime] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ShortDesc] [nvarchar](255) NULL,
	[Descriptions] [nvarchar](255) NULL,
	[CateID] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Discount] [int] NULL,
	[ThumbImg] [nvarchar](max) NULL,
	[Video] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[IsBestsellers] [bit] NOT NULL,
	[Homeflag] [bit] NOT NULL,
	[IsActived] [bit] NOT NULL,
	[Tag] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Alias] [nvarchar](max) NULL,
	[UnitInStock] [int] NULL,
	[BrandID] [int] NULL,
	[SalesPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Descriptions] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](200) NULL,
	[Phone] [varchar](13) NULL,
	[Company] [nvarchar](255) NULL,
	[Shipdate] [datetime] NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactStatus]    Script Date: 18/04/2024 10:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactStatus](
	[TransactionStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Descriptions] [nvarchar](50) NULL,
 CONSTRAINT [PK_TransactStatus] PRIMARY KEY CLUSTERED 
(
	[TransactionStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([UserID], [Username], [Password], [Email], [FullName], [Phone], [CreateDate], [LastLogin], [RoleId], [IsActived], [Randomkey]) VALUES (1, N'Admin', N'4bf41f4c0bfebbdda7750cb50fb10884', N'kudoshinichi2804@gmail.com', N'Trân Anh Badminton', N'0932690343', NULL, CAST(N'2024-04-18T20:32:10.860' AS DateTime), 3, 1, N'4@163     ')
INSERT [dbo].[Account] ([UserID], [Username], [Password], [Email], [FullName], [Phone], [CreateDate], [LastLogin], [RoleId], [IsActived], [Randomkey]) VALUES (2, N'Staff', N'a1dbfc5e025cfab8d57d8039b76f09b4', N'mahdi.noal@zooants.com', N'Staff', N'0968454612', NULL, NULL, 2, 1, N'*rcj9     ')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [BrandName], [Logo]) VALUES (104, N'Yonex', N'yonex.png')
INSERT [dbo].[Brand] ([BrandID], [BrandName], [Logo]) VALUES (105, N'Lining', N'lining.jpg')
INSERT [dbo].[Brand] ([BrandID], [BrandName], [Logo]) VALUES (106, N'Victor', N'victor.png')
INSERT [dbo].[Brand] ([BrandID], [BrandName], [Logo]) VALUES (107, N'Mizuno', N'mizuno.png')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CateID], [CategoryName], [Descriptions], [ParentID], [Levels], [Ordering], [IsPublished], [ThumbImg], [Title], [Alias], [Cover]) VALUES (1, N'Votcaulong', N'<p>Vợt cầu lông</p>', 0, NULL, NULL, 1, N'votcaulong.png', N'Vợt cầu lông', N'votcaulong', NULL)
INSERT [dbo].[Category] ([CateID], [CategoryName], [Descriptions], [ParentID], [Levels], [Ordering], [IsPublished], [ThumbImg], [Title], [Alias], [Cover]) VALUES (2, N'Caulong', N'<p>Cầu lông</p>', 0, NULL, NULL, 1, N'caulong.jpg', N'Cầu lông', N'caulong', NULL)
INSERT [dbo].[Category] ([CateID], [CategoryName], [Descriptions], [ParentID], [Levels], [Ordering], [IsPublished], [ThumbImg], [Title], [Alias], [Cover]) VALUES (3, N'Phukien', N'<p>Phụ kiện</p>', 0, NULL, NULL, 1, N'thumb-6.jpg', N'Phụ kiện', N'phukien', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustommerID], [Password], [FullName], [BirthDay], [Avatar], [Address], [Mail], [Phone], [District], [Ward], [CreateDate], [LastLogin], [IsActived], [Username], [Province], [Randomkey]) VALUES (1, N'ed67f7c2a101dc645d8c0894ed874a8c', N'Lại Huy Hà', NULL, N'avatar.png', N'41 Nguyễn Đường', N'laihuyha@gmail.com', N'0968454617', N'Huyện Chư Păh', N'Thị trấn Phú Hòa', CAST(N'2021-11-27T17:50:58.063' AS DateTime), NULL, 1, N'AdministratorAx102', N'Gia Lai', N'yvbv6')
INSERT [dbo].[Customers] ([CustommerID], [Password], [FullName], [BirthDay], [Avatar], [Address], [Mail], [Phone], [District], [Ward], [CreateDate], [LastLogin], [IsActived], [Username], [Province], [Randomkey]) VALUES (2, N'9bb2b0e7c5b2e9219c7f0bc21827b908', N'Trần Vũ Hải', NULL, N'avatar.png', N'adfasdfasdf', N'abctest@gmail.com', N'0911974341', N'Huyện Tu Mơ Rông', N'Xã Ngọk Lây', CAST(N'2021-11-27T17:52:01.250' AS DateTime), NULL, 1, N'Member1', N'Kon Tum', N'2giil')
INSERT [dbo].[Customers] ([CustommerID], [Password], [FullName], [BirthDay], [Avatar], [Address], [Mail], [Phone], [District], [Ward], [CreateDate], [LastLogin], [IsActived], [Username], [Province], [Randomkey]) VALUES (3, N'daf06c530fe903775bd6a087181f3e98', N'Huỳnh Đại Tấn', NULL, N'avatar.png', N'ádfasdfasdf', N'abctes1t@gmail.com', N'0968454612', N'Huyện Long Mỹ', N'Xã Vĩnh Thuận Đông', CAST(N'2021-11-27T17:52:58.303' AS DateTime), NULL, 1, N'Member2', N'Hậu Giang', N'lngpq')
INSERT [dbo].[Customers] ([CustommerID], [Password], [FullName], [BirthDay], [Avatar], [Address], [Mail], [Phone], [District], [Ward], [CreateDate], [LastLogin], [IsActived], [Username], [Province], [Randomkey]) VALUES (4, N'0021318def839b86c1fd0a935675cf7e', N'Huỳnh Phan Quốc Huy', NULL, N'avatar.png', NULL, N'huyhuynh28082002@gmail.com', N'0369872808', NULL, NULL, CAST(N'2024-04-18T10:19:01.317' AS DateTime), NULL, 1, N'huy', N'Tỉnh thành', N'g4w6d')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDesc], [Descriptions], [CateID], [Price], [Discount], [ThumbImg], [Video], [DateCreated], [DateModified], [IsBestsellers], [Homeflag], [IsActived], [Tag], [Title], [Alias], [UnitInStock], [BrandID], [SalesPrice]) VALUES (27, N'Vợt Cầu Lông Yonex Astrox 02 Clear Chính Hãng', NULL, NULL, 1, CAST(1239000.00 AS Decimal(18, 2)), 1, N'vtculngyonexastrox02clearchnhhng.png', NULL, CAST(N'2024-04-18T12:18:39.000' AS DateTime), CAST(N'2024-04-18T12:34:14.707' AS DateTime), 1, 1, 1, NULL, N'Vợt Cầu Lông Yonex Astrox 02 Clear Chính Hãng', N'vtculngyonexastrox02clearchnhhng', 50, 104, CAST(1226610.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDesc], [Descriptions], [CateID], [Price], [Discount], [ThumbImg], [Video], [DateCreated], [DateModified], [IsBestsellers], [Homeflag], [IsActived], [Tag], [Title], [Alias], [UnitInStock], [BrandID], [SalesPrice]) VALUES (28, N'Vợt Cầu Lông Lining Axforce 9 Blue Chính Hãng', NULL, NULL, 1, CAST(480000.00 AS Decimal(18, 2)), 0, N'vtculngliningaxforce9bluechnhhng.png', NULL, CAST(N'2024-04-18T12:19:51.000' AS DateTime), CAST(N'2024-04-18T12:34:47.000' AS DateTime), 1, 1, 1, NULL, N'Vợt Cầu Lông Lining Axforce 9 Blue Chính Hãng', N'vtculngliningaxforce9bluechnhhng', 50, 105, CAST(480000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDesc], [Descriptions], [CateID], [Price], [Discount], [ThumbImg], [Video], [DateCreated], [DateModified], [IsBestsellers], [Homeflag], [IsActived], [Tag], [Title], [Alias], [UnitInStock], [BrandID], [SalesPrice]) VALUES (29, N'Cặp Vợt Cầu Lông Lining Axforce 9 - Black Purple/White Blue Chính Hãng', NULL, NULL, 1, CAST(850000.00 AS Decimal(18, 2)), 0, N'cpvtculngliningaxforce9-blackpurplewhitebluechnhhng.png', NULL, CAST(N'2024-04-18T12:20:27.000' AS DateTime), CAST(N'2024-04-18T12:35:42.207' AS DateTime), 1, 1, 1, NULL, N'Cặp Vợt Cầu Lông Lining Axforce 9 - Black Purple/White Blue Chính Hãng', N'cpvtculngliningaxforce9-blackpurplewhitebluechnhhng', 50, 105, CAST(850000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDesc], [Descriptions], [CateID], [Price], [Discount], [ThumbImg], [Video], [DateCreated], [DateModified], [IsBestsellers], [Homeflag], [IsActived], [Tag], [Title], [Alias], [UnitInStock], [BrandID], [SalesPrice]) VALUES (30, N'Vợt Cầu Lông Victor Auraspeed HS Plus Chính Hãng', NULL, NULL, 1, CAST(3550000.00 AS Decimal(18, 2)), 0, N'vtculngvictorauraspeedhspluschnhhng.png', NULL, CAST(N'2024-04-18T12:21:11.000' AS DateTime), CAST(N'2024-04-18T12:35:58.333' AS DateTime), 1, 1, 1, NULL, N'Vợt Cầu Lông Victor Auraspeed HS Plus Chính Hãng', N'vtculngvictorauraspeedhspluschnhhng', 50, 106, CAST(3550000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDesc], [Descriptions], [CateID], [Price], [Discount], [ThumbImg], [Video], [DateCreated], [DateModified], [IsBestsellers], [Homeflag], [IsActived], [Tag], [Title], [Alias], [UnitInStock], [BrandID], [SalesPrice]) VALUES (31, N'Vợt Cầu Lông Victor Spider Man Limited 2024 Chính Hãng', NULL, NULL, 1, CAST(4990000.00 AS Decimal(18, 2)), 0, N'vtculngvictorspidermanlimited2024chnhhng.png', NULL, CAST(N'2024-04-18T12:21:38.000' AS DateTime), CAST(N'2024-04-18T12:36:31.843' AS DateTime), 1, 1, 1, NULL, N'Vợt Cầu Lông Victor Spider Man Limited 2024 Chính Hãng', N'vtculngvictorspidermanlimited2024chnhhng', 50, 106, CAST(4990000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDesc], [Descriptions], [CateID], [Price], [Discount], [ThumbImg], [Video], [DateCreated], [DateModified], [IsBestsellers], [Homeflag], [IsActived], [Tag], [Title], [Alias], [UnitInStock], [BrandID], [SalesPrice]) VALUES (32, N'Vợt Cầu Lông Mizuno Fortius 11 Power (Mã JP)', NULL, NULL, 1, CAST(3550000.00 AS Decimal(18, 2)), 0, N'vtculngmizunofortius11powermjp.png', NULL, CAST(N'2024-04-18T12:22:37.000' AS DateTime), CAST(N'2024-04-18T12:37:02.497' AS DateTime), 1, 1, 1, NULL, N'Vợt Cầu Lông Mizuno Fortius 11 Power (Mã JP)', N'vtculngmizunofortius11powermjp', 50, 107, CAST(3550000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDesc], [Descriptions], [CateID], [Price], [Discount], [ThumbImg], [Video], [DateCreated], [DateModified], [IsBestsellers], [Homeflag], [IsActived], [Tag], [Title], [Alias], [UnitInStock], [BrandID], [SalesPrice]) VALUES (33, N'Vợt Cầu Lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt Cầu Lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt Cầ', NULL, NULL, 1, CAST(4990000.00 AS Decimal(18, 2)), 0, N'vtculngmizunoacrospeed01focusmjpvtculngmizunoacrospeed01focusmjpvtc.png', NULL, CAST(N'2024-04-18T12:23:10.000' AS DateTime), CAST(N'2024-04-18T12:37:15.690' AS DateTime), 1, 1, 1, NULL, N'Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt cầu lông Mizuno Acrospeed 01 Focus (Mã JP) Vợt Cầu Lông Mizuno Acrospeed 01 Focus (Mã JP)', N'vtculngmizunoacrospeed01focusmjpvtculngmizunoacrospeed01focusmjpvtc', 50, 107, CAST(4990000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDesc], [Descriptions], [CateID], [Price], [Discount], [ThumbImg], [Video], [DateCreated], [DateModified], [IsBestsellers], [Homeflag], [IsActived], [Tag], [Title], [Alias], [UnitInStock], [BrandID], [SalesPrice]) VALUES (34, N'Trái Cầu Lông Nhựa Yonex MAV 2000 - Trắng (Nội Địa)', NULL, NULL, 2, CAST(55000.00 AS Decimal(18, 2)), 0, N'triculngnhayonexmav2000-trngnida.png', NULL, CAST(N'2024-04-18T12:22:37.000' AS DateTime), CAST(N'2024-04-18T12:45:11.113' AS DateTime), 1, 1, 1, NULL, N'Trái Cầu Lông Nhựa Yonex MAV 2000 - Trắng (Nội Địa)', N'triculngnhayonexmav2000-trngnida', 50, 104, CAST(55000.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([ProductID], [ProductName], [ShortDesc], [Descriptions], [CateID], [Price], [Discount], [ThumbImg], [Video], [DateCreated], [DateModified], [IsBestsellers], [Homeflag], [IsActived], [Tag], [Title], [Alias], [UnitInStock], [BrandID], [SalesPrice]) VALUES (35, N'Túi Đựng Vợt Cầu Lông Lining FBJG208-1000 Màu Trắng', NULL, NULL, 3, CAST(1140000.00 AS Decimal(18, 2)), 0, N'tidngvtculngliningfbjg208-1000mutrng.png', NULL, CAST(N'2024-04-18T12:23:10.000' AS DateTime), CAST(N'2024-04-18T12:45:35.287' AS DateTime), 1, 1, 1, NULL, N'Túi Đựng Vợt Cầu Lông Lining FBJG208-1000 Màu Trắng', N'tidngvtculngliningfbjg208-1000mutrng', 50, 105, CAST(1140000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName], [Descriptions]) VALUES (2, N'Staff', N'Staff')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [Descriptions]) VALUES (3, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactStatus] ON 

INSERT [dbo].[TransactStatus] ([TransactionStatusID], [Status], [Descriptions]) VALUES (1, N'Đơn hàng đã đặt', N'Đơn hàng đã đặt')
INSERT [dbo].[TransactStatus] ([TransactionStatusID], [Status], [Descriptions]) VALUES (2, N'Xác nhận thông tin thanh toán', N'Xác nhận thông tin thanh toán')
INSERT [dbo].[TransactStatus] ([TransactionStatusID], [Status], [Descriptions]) VALUES (3, N'Đang vận chuyển', N'Đang vận chuyển')
INSERT [dbo].[TransactStatus] ([TransactionStatusID], [Status], [Descriptions]) VALUES (4, N'Đơn hàng đã nhận', N'Đơn hàng đã nhận')
INSERT [dbo].[TransactStatus] ([TransactionStatusID], [Status], [Descriptions]) VALUES (5, N'Đơn hàng đã giao', N'Đơn hàng đã giao')
SET IDENTITY_INSERT [dbo].[TransactStatus] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'') FOR [FullName]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsPublished]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ('0001-01-01T00:00:00.000') FOR [OrderDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Homeflag]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (N'') FOR [Descriptions]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Roles]
GO
ALTER TABLE [dbo].[AttributePrices]  WITH CHECK ADD  CONSTRAINT [FK_AttributePrices_Attribute] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attribute] ([AttributeID])
GO
ALTER TABLE [dbo].[AttributePrices] CHECK CONSTRAINT [FK_AttributePrices_Attribute]
GO
ALTER TABLE [dbo].[AttributePrices]  WITH CHECK ADD  CONSTRAINT [FK_AttributePrices_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[AttributePrices] CHECK CONSTRAINT [FK_AttributePrices_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustommerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TransactStatus] FOREIGN KEY([TransactionStatusID])
REFERENCES [dbo].[TransactStatus] ([TransactionStatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TransactStatus]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([CateID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE TranAnhBadminton SET  READ_WRITE 
GO
