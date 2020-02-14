USE [MaxMinManufacturingDM]
GO

/****** Object:  Table [dbo].[DimBatch]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimBatch](
	[BatchNumber] [int] NOT NULL,
	[BatchName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimBatch] PRIMARY KEY CLUSTERED 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimCountry]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCountry](
	[CountryKey] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
	[CountryName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_DimCountry] PRIMARY KEY CLUSTERED 
(
	[CountryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimMachine]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimMachine](
	[MachineNumber] [int] NOT NULL,
	[MachineName] [nvarchar](50) NOT NULL,
	[MachineTypeKey] [int] NOT NULL,
	[PlantNumber] [int] NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[DateOfPurchase] [date] NOT NULL,
 CONSTRAINT [PK_DimMachine] PRIMARY KEY CLUSTERED 
(
	[MachineNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimMachineType]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimMachineType](
	[MachineTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[MachineType] [nvarchar](30) NOT NULL,
	[MaterialKey] [int] NOT NULL,
 CONSTRAINT [PK_DimMachineType] PRIMARY KEY CLUSTERED 
(
	[MachineTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimMaterial]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimMaterial](
	[MaterialKey] [int] IDENTITY(1,1) NOT NULL,
	[Material] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_DimMaterial] PRIMARY KEY CLUSTERED 
(
	[MaterialKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimPlant]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimPlant](
	[PlantNumber] [int] NOT NULL,
	[PlantName] [nvarchar](30) NOT NULL,
	[CountryKey] [int] NOT NULL,
 CONSTRAINT [PK_DimPlant] PRIMARY KEY CLUSTERED 
(
	[PlantNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimProduct]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProduct](
	[ProductCode] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductSubtypeCode] [int] NOT NULL,
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimProductSubtype]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProductSubtype](
	[ProductSubtypeCode] [int] NOT NULL,
	[ProductSubtypeName] [nvarchar](50) NOT NULL,
	[ProductTypeCode] [int] NOT NULL,
 CONSTRAINT [PK_DimProductSubtype] PRIMARY KEY CLUSTERED 
(
	[ProductSubtypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimProductType]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProductType](
	[ProductTypeCode] [int] NOT NULL,
	[ProductTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FactInventory]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactInventory](
	[InventoryLevel] [int] NOT NULL,
	[NumberOnBackorder] [int] NOT NULL,
	[DateOfInventory] [date] NOT NULL,
	[ProductCode] [int] NOT NULL,
	[MaterialKey] [int] NOT NULL,
 CONSTRAINT [PK_FactInventory] PRIMARY KEY CLUSTERED 
(
	[DateOfInventory] ASC,
	[ProductCode] ASC,
	[MaterialKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FactManufacturing]    Script Date: 2019-01-11 16:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactManufacturing](
	[AcceptedProducts] [int] NOT NULL,
	[RejectedProducts] [int] NOT NULL,
	[ElapsedTimeForManufacture] [decimal](6, 0) NOT NULL,
	[DateOfManufacture] [date] NOT NULL,
	[ProductCode] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[MachineNumber] [int] NOT NULL,
 CONSTRAINT [PK_FactManufacturing] PRIMARY KEY CLUSTERED 
(
	[DateOfManufacture] ASC,
	[ProductCode] ASC,
	[BatchNumber] ASC,
	[MachineNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Batch Dimension populated from the Manufacturing Automation system export file.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimBatch'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country Dimension populated from the Accounting System.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimCountry'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Machine Dimension populated from the Manufacturing Automation System export file.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimMachine'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Machine Type Dimension populated from the Accounting System.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimMachineType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Material Dimension populated from the Accounting System.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimMaterial'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Plant Dimension populated from the Accounting System.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimPlant'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Dimension populated from the Manufacturing Automation System export file.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimProduct'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ProductSubtype Dimension populated from the Accounting System.ProductSubtype table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimProductSubtype'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Type Dimension populated from the Manufacturing Automation System export file.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimProductType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inventory Fact populated from the Order Processing System database' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FactInventory'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Manufacturing Fact populated from the Manufacturing Automation System export file.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FactManufacturing'
GO


