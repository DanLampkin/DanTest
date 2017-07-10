USE [FlightDeck]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetKidneyCareGroup]    Script Date: 05/13/2015 13:52:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_GetKidneyCareGroup]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_GetKidneyCareGroup]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetKidneyCareGroup]    Script Date: 05/13/2015 13:52:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_GetKidneyCareGroup]
(
	@facilityId INT,
	@regionCode VARCHAR(10),
	@divisionCode VARCHAR(10),
	@groupCode VARCHAR(10)
)
RETURNS @KidneyCareGroup TABLE (
   FacilityId INT NULL,
   RegionId INT NULL,
   DivisionId INT NULL,
   GroupId INT NULL,
   [Group] VARCHAR(100) NULL,
   Division VARCHAR(100) NULL,
   Region VARCHAR(100) NULL
)
AS
/* ====================================================================================================
   Author       : Karthik
   fn Name      : fn_GetKidneyCareGroup
   Create Date  : 13/05/2015
   Project      : FlightDeck
   Description  : Returns Kidney Care Group
   Test With    : SELECT * FROM dbo.fn_GetKidneyCareGroup(32, NULL, NULL, NULL)
   Comments     : 
   ====================================================================================================
*/
BEGIN

	IF @facilityId IS NOT NULL
	BEGIN
		INSERT INTO @KidneyCareGroup( FacilityId, RegionId, DivisionId, GroupId, [Group], Division, Region )
		SELECT f.FacilityId, r.RegionId, d.DivisionId, g.GroupId, g.Name, d.Name, r.Name
		FROM Groups AS g
		JOIN Divisions AS d ON g.GroupId = d.GroupId
		JOIN Regions AS r ON d.DivisionId = r.DivisionId
		JOIN Facilities AS f ON r.RegionId = f.RegionId
		WHERE f.FacilityId = @facilityid
			AND f.IsActive = 1 AND r.IsActive = 1 AND d.IsActive = 1 AND g.IsActive = 1
	END
	ELSE IF @regionCode IS NOT NULL
	BEGIN
		INSERT INTO @KidneyCareGroup( RegionId, DivisionId, GroupId, [Group], Division, Region )
		SELECT r.RegionId, d.DivisionId, g.GroupId, g.Name, d.Name, r.Name
		FROM Groups AS g
		JOIN Divisions AS d ON g.GroupId = d.GroupId
		JOIN Regions AS r ON d.DivisionId = r.DivisionId
		WHERE r.RegionCode = @regionCode
			AND r.IsActive = 1 AND d.IsActive = 1 AND g.IsActive = 1
	END
	ELSE IF @divisionCode IS NOT NULL
	BEGIN
		INSERT INTO @KidneyCareGroup( DivisionId, GroupId, [Group], Division )
		SELECT d.DivisionId, g.GroupId, g.Name, d.Name
		FROM Groups AS g
		JOIN Divisions AS d	ON g.GroupId = d.GroupId
		WHERE d.DivisionCode = @divisionCode
			AND d.IsActive = 1 AND g.IsActive = 1
	END
	ELSE IF @groupCode IS NOT NULL
	BEGIN
		INSERT INTO @KidneyCareGroup( GroupId, [Group] )
		SELECT g.GroupId, g.Name
		FROM Groups AS g
		WHERE g.GroupCode = @groupCode
			AND g.IsActive = 1
	END

	RETURN;
END

GO
