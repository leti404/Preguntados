USE [master]
GO
/****** Object:  Database [PreguntadoORT]    Script Date: 26/8/2024 08:19:45 ******/
CREATE DATABASE [PreguntadoORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadoORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadoORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadoORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadoORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadoORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadoORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadoORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadoORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadoORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadoORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadoORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadoORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadoORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadoORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadoORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadoORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadoORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadoORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadoORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadoORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadoORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadoORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadoORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadoORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadoORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadoORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadoORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadoORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadoORT] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadoORT] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadoORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadoORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadoORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadoORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadoORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadoORT', N'ON'
GO
ALTER DATABASE [PreguntadoORT] SET QUERY_STORE = OFF
GO
USE [PreguntadoORT]
GO
/****** Object:  User [alumno]    Script Date: 26/8/2024 08:19:45 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 26/8/2024 08:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Foto] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 26/8/2024 08:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 26/8/2024 08:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [varchar](255) NOT NULL,
	[Foto] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 26/8/2024 08:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](255) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Geografía', N'https://static.wikia.nocookie.net/preguntados-juego/images/b/b3/Tito.png/revision/latest?cb=20240811234304&path-prefix=es')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Historia', N'https://static.wikia.nocookie.net/preguntados-juego/images/8/82/Hector1.jpg/revision/latest?cb=20171007014322&path-prefix=es')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Ciencia', N'https://static.wikia.nocookie.net/preguntados-juego/images/b/b5/Albert3.png/revision/latest?cb=20180801223910&path-prefix=es')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Entretenimiento', N'https://static.wikia.nocookie.net/preguntados-juego/images/9/96/Pop_gafas_y_soda.png/revision/latest?cb=20240811214445&path-prefix=es')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Fácil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Difícil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿Cuál es la capital de Francia?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Flag_of_France_%281794%E2%80%931815%2C_1830%E2%80%931974%29.svg/200px-Flag_of_France_%281794%E2%80%931815%2C_1830%E2%80%931974%29.svg.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 1, 2, N'¿Cuál es el río más largo del mundo?', N'https://definicion.de/wp-content/uploads/2009/02/rio-1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 1, 3, N'¿En qué continente se encuentra el desierto del Sahara?', N'https://resizer.glanacion.com/resizer/v2/el-sahara-se-extiende-a-lo-largo-de-4800-AEPKCH33KZHFZGWCOFTRTHXTEM.jpg?auth=d3cfa3a833cc0fa628c1f499f877071cdc88920d493f02f15a2963fab9c3731f&width=880&height=586&quality=70&smart=true')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 2, 1, N'¿Quién fue el primer presidente de los Estados Unidos?', N'https://i.pinimg.com/originals/41/60/27/416027403fc19c7e26f1afe3acb5baf9.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 2, 2, N'¿En qué año comenzó la Segunda Guerra Mundial?', N'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/a42a/live/bef87880-5d01-11ef-b384-e1f879f99da3.jpg.webp')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 2, 3, N'¿Qué imperio construyó la Gran Muralla China?', N'https://historia.nationalgeographic.com.es/medio/2014/06/12/china2_1787x2000.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 3, 1, N'¿Qué partícula subatómica tiene una carga positiva?', N'https://www.autopista.es/uploads/s1/10/86/56/01/ilustracion-de-particulas-elementales-en-el-atomo.jpeg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 3, 2, N'¿Cuál es el planeta más grande del sistema solar?', N'https://i.pinimg.com/originals/cc/26/26/cc2626ede5716f0ee8369fb2f2fc4822.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 3, 3, N'¿Qué ley describe la gravedad?', N'https://img.freepik.com/vector-gratis/ilustracion-dibujada-mano-isaac-newton_23-2151338877.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 4, 1, N'¿Cuál es el nombre del ratón famoso creado por Walt Disney?', N'https://yt3.googleusercontent.com/ytc/AIdro_nEM2eQdOgDE0tizSIhvOc6MwDBn2yIWb94RALYC7sBMNE=s900-c-k-c0x00ffffff-no-rj')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 4, 2, N'¿Qué película ganó el Oscar a la Mejor Película en 1994?', N'https://fenixbms.es/wp-content/uploads/2024/01/oscars_cover.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 4, 3, N'¿Quién es el creador de la serie de televisión "Breaking Bad"?', N'https://example.com/imagenes/breaking_bad.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 4, 1, N'¿Qué actor interpretó a Iron Man en las películas de Marvel?', N'https://mir-s3-cdn-cf.behance.net/project_modules/hd/8f20a2125369651.6117b5e015cf8.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 4, 2, N'¿Cuál es el nombre del mago en la serie "Harry Potter"?', N'https://example.com/imagenes/harry_potter.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 4, 3, N'¿En qué año se estrenó la primera película de Star Wars?', N'https://example.com/imagenes/star_wars.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 1, 1, N'¿Cuál es el país más grande del mundo por superficie?', N'https://example.com/imagenes/rusia.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 2, 2, N'¿Quién fue conocido como "El Libertador" en América del Sur?', N'https://example.com/imagenes/bolivar.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 3, 3, N'¿Qué elemento químico tiene el símbolo "O"?', N'https://example.com/imagenes/oxigeno.jpg')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (1, 1, 1, N'París', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (2, 1, 2, N'Londres', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (3, 1, 3, N'Berlín', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (4, 2, 1, N'Nilo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (5, 2, 2, N'Amazonas', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (6, 2, 3, N'Yangtsé', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (7, 3, 1, N'Asia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (8, 3, 2, N'África', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (9, 3, 3, N'Australia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (10, 4, 1, N'George Washington', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (11, 4, 2, N'Abraham Lincoln', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (12, 4, 3, N'Thomas Jefferson', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (13, 5, 1, N'1914', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (14, 5, 2, N'1939', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (15, 5, 3, N'1945', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (16, 6, 1, N'Imperio Romano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (17, 6, 2, N'Imperio Chino', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (18, 6, 3, N'Imperio Otomano', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (19, 7, 1, N'Electrón', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (20, 7, 2, N'Protón', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (21, 7, 3, N'Neutrón', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (22, 8, 1, N'Saturno', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (23, 8, 2, N'Júpiter', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (24, 8, 3, N'Neptuno', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (25, 9, 1, N'Ley de Coulomb', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (26, 9, 2, N'Ley de Newton', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (27, 9, 3, N'Ley de Ohm', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (28, 10, 1, N'Mickey Mouse', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (29, 10, 2, N'Bugs Bunny', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (30, 10, 3, N'Donald Duck', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (31, 11, 1, N'Pulp Fiction', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (32, 11, 2, N'Forrest Gump', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (33, 11, 3, N'Titanic', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (34, 12, 1, N'Vince Gilligan', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (35, 12, 2, N'David Chase', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (36, 12, 3, N'J.J. Abrams', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (37, 13, 1, N'Robert Downey Jr.', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (38, 13, 2, N'Chris Hemsworth', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (39, 13, 3, N'Mark Ruffalo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (40, 14, 1, N'Hermione Granger', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (41, 14, 2, N'Harry Potter', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (42, 14, 3, N'Ron Weasley', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (43, 15, 1, N'1977', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (44, 15, 2, N'1980', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (45, 15, 3, N'1983', 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [PreguntadoORT] SET  READ_WRITE 
GO
