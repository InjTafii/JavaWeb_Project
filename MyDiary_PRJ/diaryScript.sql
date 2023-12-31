USE [master]
GO
/****** Object:  Database [jspDiary]    Script Date: 3/23/2023 4:35:04 PM ******/
CREATE DATABASE [jspDiary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jspDiary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TAI\MSSQL\DATA\jspDiary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jspDiary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TAI\MSSQL\DATA\jspDiary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [jspDiary] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jspDiary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jspDiary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jspDiary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jspDiary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jspDiary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jspDiary] SET ARITHABORT OFF 
GO
ALTER DATABASE [jspDiary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jspDiary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jspDiary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jspDiary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jspDiary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jspDiary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jspDiary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jspDiary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jspDiary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jspDiary] SET  ENABLE_BROKER 
GO
ALTER DATABASE [jspDiary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jspDiary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jspDiary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jspDiary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jspDiary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jspDiary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jspDiary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jspDiary] SET RECOVERY FULL 
GO
ALTER DATABASE [jspDiary] SET  MULTI_USER 
GO
ALTER DATABASE [jspDiary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jspDiary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jspDiary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jspDiary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [jspDiary] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [jspDiary] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'jspDiary', N'ON'
GO
ALTER DATABASE [jspDiary] SET QUERY_STORE = OFF
GO
USE [jspDiary]
GO
/****** Object:  Table [dbo].[diary]    Script Date: 3/23/2023 4:35:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diary](
	[diary_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[date_of_diary] [datetime] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[visibility] [bit] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[favourite] [bit] NULL,
 CONSTRAINT [PK__diary__339232C8CE01FBD1] PRIMARY KEY CLUSTERED 
(
	[diary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 3/23/2023 4:35:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [varchar](32) NOT NULL,
 CONSTRAINT [PK__user__B9BE370F9A8C6EFA] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[diary] ON 

INSERT [dbo].[diary] ([diary_id], [user_id], [date_of_diary], [content], [visibility], [title], [favourite]) VALUES (1, 1, CAST(N'2023-03-19T08:16:30.000' AS DateTime), N'saadasd', 1, N'First', 0)
INSERT [dbo].[diary] ([diary_id], [user_id], [date_of_diary], [content], [visibility], [title], [favourite]) VALUES (5, 2, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'kienbeo237', 1, N'kienbeo237', 1)
INSERT [dbo].[diary] ([diary_id], [user_id], [date_of_diary], [content], [visibility], [title], [favourite]) VALUES (6, 3, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Bao ngày Mẹ ngóng, bao ngày Mẹ trông
Bao ngày Mẹ mong con chào đời
Ấp trong đáy lòng, có chăng tiếng cười
Của một hài nhi đang lớn dần.

Mẹ chợt tỉnh giấc, và Mẹ nhìn thấy
Hình hài nhỏ bé như thiên thần
Tiếng con khóc òa, mắt Mẹ lệ nhòa
Cám ơn vì con đến bên Mẹ.

[ĐK1:]
Này con yêu ơi, con biết không
Mẹ yêu con, yêu con nhất đời
Ngắm con ngoan nằm trong nôi
Mắt xoe tròn, ôi bé cưng.

Nhìn Cha con, Cha đang rất vui
Giọt nước mắt lăn trên khóe môi
Con hãy nhìn kìa, Cha đang khóc vì con.
', 1, N'Nhật Ký Của Mẹ - Hiền Thục', 0)
INSERT [dbo].[diary] ([diary_id], [user_id], [date_of_diary], [content], [visibility], [title], [favourite]) VALUES (8, 3, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Có đôi lần rơi vào trạng thái hoang mang, hụt hẫng, chới với, vô định trước tất cả những gì cuộc sống mang đến cho mình, tôi trở nên dè dặt, đắn đo, ngập ngừng và sợ hãi con đường phía trước. Nhưng rồi tôi hiểu, nếu lót dưới bước chân mình một niềm tin mãnh liệt vào cuộc sống thì nỗi sợ hãi sẽ không là gì cả.
Chẳng ai trong chúng ta sống mà không có niềm tin, chỉ là niềm tin tồn tại như thế nào thôi. Bởi đây không phải thứ đồ vật có thể nhìn, sờ mó, cầm nắm, và dĩ nhiên càng không thể thấy được nó khi ta bao phủ mình một sự hoài nghi về chính bản thân, cũng như sự hoài nghi về cuộc sống.
Cuộc sống mang đến cho ta tất cả những gì nó muốn, chứ không phải những gì ta muốn, và dù muốn hay không ta cũng phải đón nhận những thứ cuộc sống gửi đến cho mình. Tuy nhiên, ta có quyền lựa chọn một cách, một thái độ để đón nhận. Gượng ép hay cởi mở với niềm tin yêu cuộc sống?
Cuộc sống có bao giờ trơn tru, hoàn hảo, bằng phẳng với ai đó trong chúng ta đâu. Mỗi người có một nỗi niềm, tâm tư, khó khăn, trở ngại riêng và những nỗi đau không ai giống ai, nhưng sống với niềm tin giúp ta cảm thấy mọi thứ trở nên tốt hơn.
Khi những thử thách của cuộc sống làm ta đau đớn, ta sẽ tìm thấy sự an ủi cần thiết nơi những người thân, những người bạn, nhưng họ chỉ là người khơi dậy niềm tin nơi ta mà thôi. Chính ta mới là người nuôi dưỡng niềm tin, và làm cho niềm tin sống và tồn tại. Hãy nuôi dưỡng nó bằng sự nhẫn nại, kiên trì, ý chí kiên định, bằng nghị lực đủ lớn để cảm thấy ta có thể tiếp tục bước về phía trước, mà không tìm cho mình một ngã rẽ nào khác tiêu cực hơn.
Vì sao ta có hai mắt, hai tai, hai lỗ mũi, hai tay, hai chân? Nhưng chỉ có một cái đầu, một cái miệng và một trái tim. Ta sinh ra và có một hình hài như thế đều có ý nghĩa cả! Ta có hai con mắt bởi cuộc sống muốn ta nhìn, quan sát nhiều hơn và biết trân trọng những gì ta đang có.
Ta có hai cái tai, bởi ta cần phải lắng nghe nhiều hơn những âm thanh cuộc sống muốn gửi đến. Ta có hai lỗ mũi, để hít thở nhiều hơn và cảm ơn những gì cuộc sống đã ban tặng. Ta có hai cái tay, để làm việc, cầm nắm và trao tặng yêu thương cho mọi người. Ta có hai cái chân, để bước đi nhiều hơn, đến những nơi mà ta muốn, và rồi những bước chân đó sẽ cho ta biết đâu là bến đỗ cuộc đời mình.
Vậy tại sao ta có một cái đầu? Một cái miệng? Và một con tim? Ta có một cái đầu, vì ta cần gom lại tất cả những gì đã thấy, đã nghe, đã làm, đã đi, quy tụ về làm một trong suy nghĩ của mình, để soi xét và phân tích tất cả mọi việc dưới ánh sáng của niềm tin. Ta có một cái miệng, chẳng phải ta cần nói ít lại những lời than vãn, trách móc, than phiền hơn đó sao? Vì than vãn, trách móc, than phiền chỉ làm cho niềm tin của ta bị bào mòn, hoen rỉ, rạn nứt, mục rữa đi mà thôi. Trái tim chính là cái "kho" chứa đựng của tâm hồn, không cần phải có đến hai cái đâu, bởi con tim có thể lưu trữ tất cả những gì nó muốn và giới hạn là vô tận, là nơi cho niềm tin cư ngự và được che chắn trước những sóng gió của cuộc đời.
Vậy đấy! Niềm tin là một ngôn từ hết sức đơn giản mà ai cũng có thể nói được, đọc được. Nhưng để có được niềm tin là một điều kỳ diệu mà mỗi người cần nỗ lực giành lấy. Niềm tin sẽ giúp ta đứng vững trước vòng xoáy cuộc đời và khi bạn có niềm tin bạn sẽ làm được những điều tưởng chừng không thể.', 1, N'Nhật ký cảm xúc', 1)
INSERT [dbo].[diary] ([diary_id], [user_id], [date_of_diary], [content], [visibility], [title], [favourite]) VALUES (9, 3, CAST(N'2023-03-22T00:00:00.000' AS DateTime), N'', 1, N'', 1)
INSERT [dbo].[diary] ([diary_id], [user_id], [date_of_diary], [content], [visibility], [title], [favourite]) VALUES (11, 3, CAST(N'2023-03-22T00:00:00.000' AS DateTime), N'hello my name is Tai', 1, N'Tài', 1)
INSERT [dbo].[diary] ([diary_id], [user_id], [date_of_diary], [content], [visibility], [title], [favourite]) VALUES (12, 3, CAST(N'2023-03-22T00:00:00.000' AS DateTime), N'okokokok
', 1, N'ok', 1)
INSERT [dbo].[diary] ([diary_id], [user_id], [date_of_diary], [content], [visibility], [title], [favourite]) VALUES (13, 3, CAST(N'2023-03-23T01:36:18.000' AS DateTime), N'Đôi khi ta vấp ngã, cảm thấy dường như mọi thứ sụp đổ và không còn tin vào bản thân mình nữa...
Nhưng hãy luôn nhớ rằng bạn luôn có một gia đình để dựa vào và những người bạn luôn bên mình để sẻ chia mọi thứ...
Cuộc sống không chỉ có màu hồng và cũng chẳng phải toàn một màu đen... Nó muôn màu muôn vẻ... Hãy vui và buồn như một đứa trẻ bạn sẽ hạnh phúc như hồi còn bé :)
Sau cơn mưa, trời lại sáng !!!', 1, N'Ngày hôm nay của bạn như thế nào?', 0)
INSERT [dbo].[diary] ([diary_id], [user_id], [date_of_diary], [content], [visibility], [title], [favourite]) VALUES (14, 3, CAST(N'2023-03-23T15:36:25.000' AS DateTime), N'meo meo meo meo', 1, N'Tùng ơi', 0)
SET IDENTITY_INSERT [dbo].[diary] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [first_name], [last_name], [email], [password]) VALUES (1, N'Nguyen Trong', N'Tai', N'trongtai123@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__AB6E616410A37626]    Script Date: 3/23/2023 4:35:04 PM ******/
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [UQ__user__AB6E616410A37626] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[diary] ADD  CONSTRAINT [DF__diary__date_of_d__276EDEB3]  DEFAULT (getdate()) FOR [date_of_diary]
GO
ALTER TABLE [dbo].[diary] ADD  CONSTRAINT [DF__diary__visibilit__286302EC]  DEFAULT ((0)) FOR [visibility]
GO
USE [master]
GO
ALTER DATABASE [jspDiary] SET  READ_WRITE 
GO
