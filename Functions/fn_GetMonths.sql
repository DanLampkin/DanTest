USE [FlightDeck]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetMonths]    Script Date: 05/13/2015 13:52:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetMonths]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetMonths]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetMonths]    Script Date: 05/13/2015 13:52:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_GetMonths]  
(   
   
 @Startdate datetime,  
 @Duedate datetime  
)  
RETURNS @Months TABLE (    
   MonthValue INT  
)  
AS    
BEGIN    
  
  DECLARE @SDate INT
  DECLARE @EDate INT
  --SET @SDate=DATEPART(MONTH,@Startdate)
  --SET @EDate=DATEPART(MONTH,@Duedate)
  -- select @Startdate
  --select @Duedate
  --select @SDate
  --select @EDate
WHILE @Startdate <= @Duedate    
BEGIN    
INSERT INTO @Months VALUES (MONTH(@Startdate))    
 SET  @Startdate = DATEADD(MONTH,1,@Startdate)
 
 IF DATEPART(MONTH,@Startdate) = DATEPART(MONTH,@Duedate)
  SET @Startdate = @Duedate
  --SET @SDate=DATEPART(MONTH,@Startdate)     
END    
RETURN;  
  
END
GO


