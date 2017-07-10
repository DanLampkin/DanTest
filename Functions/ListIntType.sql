USE [FlightDeck]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetKidneyCareGroup]    Script Date: 05/13/2015 13:52:24 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ListInt' AND ss.name = N'dbo')
DROP TYPE [dbo].[ListInt]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetKidneyCareGroup]    Script Date: 05/13/2015 13:52:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedTableType [falcon].[ListInt]    Script Date: 05/14/2015 20:34:05 ******/
CREATE TYPE [dbo].[ListInt] AS TABLE(
	[ListId] [int] NULL
)
GO

