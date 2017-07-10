USE [FlightDeck]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetKidneyCareGroup]    Script Date: 05/13/2015 13:52:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[udf_Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[udf_Split]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetKidneyCareGroup]    Script Date: 05/13/2015 13:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf_Split](    
    @delimited as NVARCHAR(MAX),    
    @delimiter as NVARCHAR(100)    
) RETURNS @t TABLE (id INT IDENTITY(1,1), val NVARCHAR(MAX))    
AS    
BEGIN    
    DECLARE @xml XML    
  if @delimited is not null and @delimited != ''    
   BEGIN    
 SELECT @delimited = Replace(@delimited, '&', '&amp;')     
 SELECT @delimited = Replace(@delimited, '<', '<')     
 SELECT @delimited = Replace(@delimited, '>', '>')    
 SELECT @delimited = Replace(@delimited, '"', '&quot;')    
 END    
    SET @xml = N'<t>' + REPLACE(@delimited,@delimiter,'</t><t>') + '</t>'    
    INSERT INTO @t(val)    
    SELECT  r.value('.','varchar(MAX)') as item    
    FROM  @xml.nodes('/t') as records(r)    
    RETURN    
END
GO 
  