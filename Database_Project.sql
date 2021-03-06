USE [master]
GO
/****** Object:  Database [ShoppingMall]    Script Date: 4/11/2021 1:53:16 PM ******/
CREATE DATABASE [ShoppingMall]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingMall', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShoppingMall.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingMall_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShoppingMall_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShoppingMall] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingMall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingMall] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingMall] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingMall] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingMall] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingMall] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingMall] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoppingMall] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingMall] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingMall] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingMall] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingMall] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingMall] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingMall] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingMall] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingMall] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoppingMall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingMall] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingMall] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingMall] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingMall] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingMall] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ShoppingMall] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingMall] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingMall] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingMall] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingMall] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingMall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingMall] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoppingMall] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoppingMall] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShoppingMall] SET QUERY_STORE = OFF
GO
USE [ShoppingMall]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/11/2021 1:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 4/11/2021 1:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [nvarchar](max) NULL,
	[TeaId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Carts] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/11/2021 1:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[TeaId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/11/2021 1:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Username] [nvarchar](max) NULL,
	[FirstName] [nvarchar](160) NOT NULL,
	[LastName] [nvarchar](160) NOT NULL,
	[Address] [nvarchar](70) NOT NULL,
	[City] [nvarchar](40) NOT NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sups]    Script Date: 4/11/2021 1:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sups](
	[SupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Sups] PRIMARY KEY CLUSTERED 
(
	[SupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teas]    Script Date: 4/11/2021 1:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teas](
	[TeaId] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[SupId] [int] NOT NULL,
	[Title] [nvarchar](160) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[TeaArtUrl] [nvarchar](1024) NULL,
 CONSTRAINT [PK_dbo.Teas] PRIMARY KEY CLUSTERED 
(
	[TeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 4/11/2021 1:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Types] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202104101738406_InitialCreate', N'WecareMVC.Models.MusicStoreEntities', 0x1F8B0800000000000400DD5C5B6FE4B6157E2FD0FF20E8A92D1C8FED5D3489314EE08ED78191F5A51E7BD3B7052DD163A1BA4C44CAB051E497E5A13FA97FA12475E35522A519CDB4F08B4D89E71C1E9E1BA9F3F93FBFFF7BFEE35B127BAF304751969EF9C78747BE07D3200BA37475E617F8F99BEFFC1F7FF8E31FE69FC2E4CDFB52BFF781BE4766A6E8CC7FC1787D3A9BA1E00526001D26519067287BC6874196CC4098CD4E8E8EBE9F1D1FCF2021E1135A9E37BF2F521C2590FD41FE5C646900D7B800F17516C21855E3E4C99251F56E4002D11A04F0CCFF05062087D75F1687E5BBBE771E4780C8B184F1B3EF8134CD30C044CAD347049738CFD2D5724D0640FCF0BE86E4BD67102358497FDABE6EBB90A313BA90593BB126151408678923C1E30F956666F2F441FAF51BCD11DD7D223AC6EF74D54C7F67FE02E4D8F76446A78B38A72FA9AA3DA4130EBC66F8A031006227F4E7C05B14312E727896C202E7203EF0EE8AA7380A7E86EF0FD93F617A961671CC0B45C422CF8401327497676B98E3F77BF85C897A0F832C0FAF42DF9B89B367F2F466B232B35CD4558A3F9CF8DE0D11043CC5B0D97F4E014B9CE5F02798C21C6018DE018C614EB6EF2A844C838A0C1247AAA5961F3139E23BBE770DDE3EC374855FCE7CF2ABEF5D466F30AC472A191ED388B81A9984F302F6B17980A07F553D9266C4EFC691B8202A5AE4902AAA2644871E8837F7D3BA01AFD18AE95C5D9BEFDDC3983D432FD1BA746766805FD9C3CB3C4BEEB3B852371DFBBACC8A3C204C1E32E9C103C857108BDCE7B3D61D3A9D847173F011F2FE6E5CA4B20757FFB032A3CD3907E533D66C97C57A2C898708C7B0C3458FFF7A64E5A28E6CEFF22868D85EC0204A40EC7B7739F9AD4AB8DFF9DE320094E0804541709EE3C73CEE5AD8D1C9C721C1C7E8AAB77908F30B88414473AFC667B91764D7951E358E5A7BB0FCBCF6705BD988A1684562B4E8B356946A480922F5B82E86744630B2017ADEE4015D0C12B8D7838A0ADA27BAC55B47314E934ED18C9BB79BA8C6093024BA49D3A78A728CEDE818353EC1FFBD0095BC63A890C880371CB9BAC389398E7C15C38D144A84A7FA6822BEE21A504C7589438C93038C29060E77737707DFA16B0F76EAC9DD9996B5EE25AEEC4A8830064957E9B199D3C16594237CD3CD694B45CE67B02BCEE7619843843A187FBB15BE0B2EC46A987EDC4E2D99210CE20521D059EE6D65BDF4DC98EF60C92F59DAB55ACBD2D691EBA784554DA31DD635FD93E0154F95717B0B7897C4AB4D71FADC3C28CBB1D2DD21C791F77793E1AA83AA6B7EB33ADF6E2EBBF5C4EA21F9C8FE76851D935CAE57C8F08EEE57AA9B0BE70B16AB1B8FBDDE4ECDB51F44411EADCB8BE94DF3EA2ABFF521AAE750AD1CEA95E3B68DF19E2394051163CD874E31328A2BF994865E7F982CD5D7845AA24262C2D19A182D9182C4795F36CEDBF402C61043EF3C28BF2C2C000A40A86A92AC247490A839314912D51707A25C7F51D811678139B5525A97A488B85F9462D5B3A23488D620EED58C34D3E51041D7DE30929F5CC0354CA937F56A62A4040D236957FAF4349F71B6666182DCC9B373B775C7D0815B6DA6AC31227624DEA2510FB73B556E9B2DD75EB5BB9B9CBA1DA3984F606DF5C5A9C916945BD44E1BE8B22AF9DE95A3C4CABF7DB326495E9B8DD456874E5624A97B14D329ACA7C9D2C65D5753366741AC569C24376AEEE31D2D799811C9CBB78A07DABAD4CD8EE4E58EE33B8129351F824D3BA87E156E37B0EC7BB08F45CA87E47D4F6DB2C0D3E43459E5FB95CCCA9A9ECC2139971CAD2AFED7058A0276E062CF238834A7D14704AB0329AA4E2CB2A550D24B8839E32474DA538460778A998993CB538C3297D959CF54F18A462121D47736A48C447AA7932CA39BCC3277DFFAA99A750A60D15F9ACCEDB524BB745FC5BD68BED5928DD0EAF4D6C8DF2A4DB166AB43974CA8915D8E11E2A26D15C27F9D3268C3748CB03A48588A6F7574E06895EE305A05CD177F75E9DA9AB6B3AAED11AFB38EE5E6964E327E69EDDD876671FA92ABA7E8E21758BA63D70A955A69F3DBD7F67DA94BD49702DDC500276115AC3B16A8A4FFE1EBABAF969A34D43C9BCFCAD6D66A603E33F4C0CEAFC17A1DA52BAE27B61AF1966543ECE29BA57BAF6852D2980582A1C849B3E14412265841E929FD2E1442F6E1F10260F004E84DDF224C94D73449D790136A867C5E5537AACE14F5DBF4F77286B68355539854332FC9AA125AD0B4C2B546A24EF3683F3288416E6C395D647191A4DD2DAC5D94EA56529E4E3D664FA52AB2782286BAAB4392B2555410A41CB2A721F48AF29484072ABDF94CDA1FA55A546C4029AB4583B2323743D874B0364D54B23036EDAC6DEE6D7D921388184E77662AD5CD024FC470D9D02149D9962908520ED9D3A83A95781AD59093C7D49D949266EBE1BDB1D29E0AD6C15AF9F381BBD576CE36E9596ACFE375DDD9F8D74B534B6DFAA8D9F6DFF164DA517B4A5C0F1E4F8A1BDE2F8BDC842D0EB54247FBDB80AD700D62AA0DB361879D6E5AC4848D6E46ED29713D603C296ED89E56DBD4C5936A47ED29354D5A3CA166D0A12251FC6AE1E8537C0795902EB871C70A299745AA071DA42A9B9C0481CA217B1A55CB124FA31A72887F65FF9110FFCAA1BD8934EC043D2ACE680EFE1651463B6B9B7591EA7926AFDB55ADCCAE09C615CBF4826F40B5AC9DB6DD52D77E3B8C4721BE7F46380AF10F26DE5EE576427EA5E1DEDC5248B711F3EA66A01FB6AB5C1594AFD006C7EC350AE935C1F21D61981CD2170E97BFC68B3882F4BC59BF700DD2E819225C7675F92747C72712F6777F70B83384C25873B3228371C5BD9A18191B51EDF6369FB9B60A0B60D8F415E4C10BC8FF9480B73FF3B49C01AF4C58E54BCD551AC2B733FF5F6CC6A977F58FAF6CD281C72AB153EFC8FB6D1C4896B11D0F910DC91FB81F3FE004521D603B9B808C6EC56AC49E49EBBD66B3466DB6D07A6BCB974D1AC55680A3D64EA22226C6A04DC3ADA34DF57233BC6997A30FC2300E30F66D2009B762FC12BCC9D60AAB69E3EC7037215686290E89B20A4871A4C13B62EE861AE406F06FDB33421EF26699B2341B2341DE46D5000AAC6D63C15246AD6D8CB0044AD3D2FDD69D2C8F39D3D2FC382061289032434C1F8B18DB98C03C204C4B54CC3EEE782FA3B5BA63B8A60A486A83EE6460A5AD84229D575A040F370CD290EA792380A07D5299E6ECA2E27C36B005E39134BB45CDD44D74D3E364A6C5C4183F06FEAFA260580BD184DDBBFB6037FA26842D835AF6ACF9D71DC9C29A0527049D38D9E8862C43FFF1634B4095FF1374CACE1029935985E13BCC768027B6B169AFB126BBCB2A25A2C019DAB2E779C4D0A4B97FE811B5DF55DE28151862C485941FC0C831F129235B5A96D4DAE6641D64C48418D111D5F62C776049FAA0243A1E9D08062D2F33D6C448BF9F32CBDA7A188A8EAAB6235F075031E253B4FAD6B5D04F0B5D51E119B6B80C13B063DF60299C0F344DB4BB5FE228D80967BC4DD7490FD4A44F05BB82972890921D2C642486C4D5C0F858DF6208B60215519B2E48A6E3FEA33A49B0285AB524E8FF574F6120E4B8E69DABF439AB33AD2451FD8A7447744DBC252409F03CC7D1330830791C4084D83F83F902E2825DA93EC1F02ABD2DF0BAC064C930798A85A6389AB2BBF8333C8C28F3FC965D4BA14D2C818819D10F1CB7E9DF8A280E1BB92F35D7B00612B416A86EF0E85E627A93B77A6F28DD281D7C264295FA9A12E60126EB981043B7E912BCC221B23D22F819AE40F05EF7CE9889F46F84A8F6F945045639485045A39D4FFE24361C266F3FFC17DA6EE9A458600000, N'6.1.1-30610')
GO
SET IDENTITY_INSERT [dbo].[Sups] ON 

INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (1, N'Maurizio Pollini')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (2, N'Vinícius De Moraes')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (3, N'Cláudio Zoli')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (4, N'Guns N'' Roses')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (5, N'Gilberto Gil')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (6, N'Royal Philharmonic Orchestra & Sir Thomas Beecham')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (7, N'Jamiroquai')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (8, N'Milton Nascimento')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (9, N'London Symphony Orchestra & Sir Charles Mackerras')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (10, N'Scholars Baroque Ensemble')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (11, N'Kent Nagano and Orchestre de l''Opéra de Lyon')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (12, N'Buddy Guy')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (13, N'Audioslave')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (14, N'Orchestra of The Age of Enlightenment')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (15, N'Stone Temple Pilots')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (16, N'Santana')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (17, N'Donna Summer')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (18, N'Marillion')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (19, N'Legião Urbana')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (20, N'Chic')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (21, N'Eric Clapton')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (22, N'Judas Priest')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (23, N'Aaron Goldberg')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (24, N'Falamansa')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (25, N'Caetano Veloso')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (26, N'Deep Purple')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (27, N'Miles Davis')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (28, N'Men At Work')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (29, N'Ed Motta')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (30, N'Van Halen')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (31, N'Motörhead')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (32, N'Jota Quest')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (33, N'Amy Winehouse')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (34, N'Marisa Monte')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (35, N'Julian Bream')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (36, N'Ton Koopman')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (37, N'Barry Wordsworth & BBC Concert Orchestra')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (38, N'Billy Cobham')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (39, N'Fretwork')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (40, N'Cássia Eller')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (41, N'Antônio Carlos Jobim')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (42, N'Incognito')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (43, N'Spyro Gyra')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (44, N'Joe Satriani')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (45, N'Berliner Philharmoniker & Herbert Von Karajan')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (46, N'Aisha Duo')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (47, N'The Cult')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (48, N'Britten Sinfonia, Ivor Bolton & Lesley Garrett')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (49, N'Gerald Moore')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (50, N'Dennis Chambers')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (51, N'Soundgarden')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (52, N'Nirvana')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (53, N'Mela Tenenbaum, Pro Musica Prague & Richard Kapp')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (54, N'English Concert & Trevor Pinnock')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (55, N'Accept')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (56, N'Martin Roscoe')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (57, N'The Posies')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (58, N'Metallica')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (59, N'Lulu Santos')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (60, N'Scorpions')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (61, N'U2')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (62, N'Tim Maia')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (63, N'Sir Georg Solti & Wiener Philharmoniker')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (64, N'Chico Science & Nação Zumbi')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (65, N'Alice In Chains')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (66, N'James Levine')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (67, N'Choir Of Westminster Abbey & Simon Preston')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (68, N'Sergei Prokofiev & Yuri Temirkanov')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (69, N'Raul Seixas')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (70, N'O Terço')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (71, N'Rush')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (72, N'The Black Crowes')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (73, N'Aaron Copland & London Symphony Orchestra')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (74, N'Pink Floyd')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (75, N'Black Label Society')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (76, N'Led Zeppelin')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (77, N'Pearl Jam')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (78, N'Roger Norrington, London Classical Players')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (79, N'Les Arts Florissants & William Christie')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (80, N'Michael Tilson Thomas & San Francisco Symphony')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (81, N'Skank')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (82, N'The 12 Cellists of The Berlin Philharmonic')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (83, N'Terry Bozzio, Tony Levin & Steve Stevens')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (84, N'Gustav Mahler')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (85, N'Bruce Dickinson')
INSERT [dbo].[Sups] ([SupId], [Name]) VALUES (86, N'Faith No More')
SET IDENTITY_INSERT [dbo].[Sups] OFF
GO
SET IDENTITY_INSERT [dbo].[Teas] ON 

INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (1, 1, 1, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (2, 1, 3, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (3, 1, 9, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (4, 1, 20, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (5, 1, 23, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (6, 1, 24, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (7, 1, 40, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (8, 1, 4, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (9, 1, 31, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (10, 1, 48, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (11, 1, 50, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (12, 1, 50, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (13, 1, 43, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (14, 1, 19, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (15, 2, 2, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (16, 2, 11, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (17, 2, 17, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (18, 2, 22, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (19, 2, 27, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (20, 2, 33, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (21, 2, 47, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (22, 2, 51, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (23, 2, 19, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (24, 2, 68, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (25, 2, 4, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (26, 2, 45, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (27, 2, 73, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (28, 2, 40, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (29, 3, 4, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (30, 3, 10, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (31, 3, 14, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (32, 3, 30, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (33, 3, 2, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (34, 3, 42, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (35, 3, 54, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (36, 3, 55, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (37, 3, 58, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (38, 3, 60, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (39, 3, 61, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (40, 3, 62, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (41, 3, 32, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (42, 3, 15, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (43, 3, 81, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (44, 4, 5, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (45, 4, 31, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (46, 4, 20, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (47, 4, 80, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (48, 4, 82, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (49, 4, 83, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (50, 5, 6, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (51, 5, 8, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (52, 5, 21, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (53, 5, 13, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (54, 5, 37, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (55, 5, 39, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (56, 5, 41, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (57, 5, 53, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (58, 5, 11, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (59, 5, 63, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (60, 5, 72, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (61, 5, 78, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (62, 5, 86, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (63, 5, 38, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (64, 5, 30, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (65, 6, 7, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (66, 6, 13, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (67, 6, 26, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (68, 6, 34, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (69, 6, 35, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (70, 6, 38, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (71, 6, 25, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (72, 6, 44, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (73, 6, 3, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (74, 6, 41, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (75, 6, 53, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (76, 6, 64, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (77, 6, 51, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (78, 6, 69, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (79, 6, 29, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (80, 6, 77, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (81, 6, 84, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (82, 6, 85, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (83, 7, 12, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (84, 7, 28, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (85, 7, 29, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (86, 7, 32, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (87, 7, 43, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (88, 7, 44, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (89, 7, 46, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (90, 7, 28, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (91, 7, 55, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (92, 7, 57, N'Chân châu mắm tôm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (93, 7, 2, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (94, 7, 66, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (95, 7, 67, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (96, 7, 1, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (97, 7, 74, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (98, 7, 76, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (99, 7, 59, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
GO
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (100, 7, 36, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (101, 8, 15, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (102, 8, 16, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (103, 8, 13, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (104, 8, 19, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (105, 8, 25, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (106, 8, 45, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (107, 8, 49, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (108, 8, 37, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (109, 8, 50, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (110, 8, 56, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (111, 8, 59, N'Chân châu trà chanh', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (112, 8, 65, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (113, 8, 60, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (114, 8, 22, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (115, 8, 60, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (116, 8, 4, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (117, 8, 79, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (118, 9, 18, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (119, 9, 7, N'Chân châu đậu đỏ', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (120, 9, 36, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (121, 9, 52, N'Chân châu dâu tây', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (122, 9, 48, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (123, 9, 42, N'Chân châu nước mắm', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (124, 9, 70, N'Chân châu đậu đen', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (125, 9, 71, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (126, 9, 75, N'Chân châu ngô', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua10.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (127, 9, 66, N'Chân châu thịt gà', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (128, 9, 18, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (129, 9, 23, N'Chân châu canh cua', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua01.jpg')
INSERT [dbo].[Teas] ([TeaId], [TypeId], [SupId], [Title], [Price], [TeaArtUrl]) VALUES (130, 9, 2, N'Chân châu khoai lang', CAST(8.99 AS Decimal(18, 2)), N'/Content/Images/Product/trasua09.jpg')
SET IDENTITY_INSERT [dbo].[Teas] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([TypeId], [Name], [Description]) VALUES (1, N'Châu trâu thượng hạng', NULL)
INSERT [dbo].[Types] ([TypeId], [Name], [Description]) VALUES (2, N'Loại cấm', NULL)
INSERT [dbo].[Types] ([TypeId], [Name], [Description]) VALUES (3, N'Loại đắt tiền', NULL)
INSERT [dbo].[Types] ([TypeId], [Name], [Description]) VALUES (4, N'Loại ngon', NULL)
INSERT [dbo].[Types] ([TypeId], [Name], [Description]) VALUES (5, N'Ít đường', NULL)
INSERT [dbo].[Types] ([TypeId], [Name], [Description]) VALUES (6, N'Tăng cân', NULL)
INSERT [dbo].[Types] ([TypeId], [Name], [Description]) VALUES (7, N'Mật ong', NULL)
INSERT [dbo].[Types] ([TypeId], [Name], [Description]) VALUES (8, N'Giảm béo', NULL)
INSERT [dbo].[Types] ([TypeId], [Name], [Description]) VALUES (9, N'Phổ biến', NULL)
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
/****** Object:  Index [IX_TeaId]    Script Date: 4/11/2021 1:53:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeaId] ON [dbo].[Carts]
(
	[TeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderId]    Script Date: 4/11/2021 1:53:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeaId]    Script Date: 4/11/2021 1:53:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeaId] ON [dbo].[OrderDetails]
(
	[TeaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupId]    Script Date: 4/11/2021 1:53:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_SupId] ON [dbo].[Teas]
(
	[SupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TypeId]    Script Date: 4/11/2021 1:53:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_TypeId] ON [dbo].[Teas]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Carts_dbo.Teas_TeaId] FOREIGN KEY([TeaId])
REFERENCES [dbo].[Teas] ([TeaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_dbo.Carts_dbo.Teas_TeaId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Teas_TeaId] FOREIGN KEY([TeaId])
REFERENCES [dbo].[Teas] ([TeaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Teas_TeaId]
GO
ALTER TABLE [dbo].[Teas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Teas_dbo.Sups_SupId] FOREIGN KEY([SupId])
REFERENCES [dbo].[Sups] ([SupId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teas] CHECK CONSTRAINT [FK_dbo.Teas_dbo.Sups_SupId]
GO
ALTER TABLE [dbo].[Teas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Teas_dbo.Types_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([TypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teas] CHECK CONSTRAINT [FK_dbo.Teas_dbo.Types_TypeId]
GO
USE [master]
GO
ALTER DATABASE [ShoppingMall] SET  READ_WRITE 
GO
