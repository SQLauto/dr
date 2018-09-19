/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:46
	See https://dbatools.io/Export-DbaScript for more information
*/
EXEC master.dbo.sp_addumpdevice  @devtype = N'disk', @logicalname = N'sup baw', @physicalname = N'C:\temp\sup baw.bak'
GO

