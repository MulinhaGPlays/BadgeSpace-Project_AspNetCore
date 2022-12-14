CREATE DATABASE BadgeSpace
GO
USE [BadgeSpace]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/11/2022 11:24:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudantes]    Script Date: 17/11/2022 11:24:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudantes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](max) NOT NULL,
	[CPF] [nvarchar](max) NOT NULL,
	[Codigo] [nvarchar](max) NOT NULL,
	[Curso] [nvarchar](max) NOT NULL,
	[Tipo] [nvarchar](max) NOT NULL,
	[Nivel] [nvarchar](max) NOT NULL,
	[Tempo] [nvarchar](max) NOT NULL,
	[Imagem] [varbinary](max) NULL,
	[Descricao] [nvarchar](max) NOT NULL,
	[EmpresaId] [int] NOT NULL,
	[Status] [bit] NULL,
	[DataInclusao] [datetime2](7) NOT NULL,
	[DataAlteracao] [datetime2](7) NULL,
 CONSTRAINT [PK_Estudantes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/11/2022 11:24:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[NormalizedEmail] [nvarchar](max) NOT NULL,
	[CPFouCNPJ] [nvarchar](max) NOT NULL,
	[Imagem] [varbinary](max) NULL,
	[Senha] [nvarchar](max) NOT NULL,
	[Claim] [bit] NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
	[DataInclusao] [datetime2](7) NOT NULL,
	[DataAlteracao] [datetime2](7) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Estudantes]  WITH CHECK ADD  CONSTRAINT [FK_Estudantes_Usuarios_EmpresaId] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Estudantes] CHECK CONSTRAINT [FK_Estudantes_Usuarios_EmpresaId]
GO
