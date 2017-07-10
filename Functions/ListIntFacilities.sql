USE [FlightDeck]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetKidneyCareGroup]    Script Date: 05/13/2015 13:52:24 ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ListIntFacilities' AND ss.name = N'dbo')
DROP TYPE [dbo].[ListIntFacilities]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetKidneyCareGroup]    Script Date: 05/13/2015 13:52:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedTableType [dbo].[ListIntFacilities]    Script Date: 10/19/2015 16:40:57 ******/
CREATE TYPE [dbo].[ListIntFacilities] AS TABLE(
	[ListId] [int] NULL
)
GO


