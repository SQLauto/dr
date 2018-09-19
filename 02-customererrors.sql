/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:44
	See https://dbatools.io/Export-DbaScript for more information
*/
EXEC master.dbo.sp_addmessage @msgnum=50001, @lang=N'us_english', 
		@severity=16, 
		@msgtext=N'Percentage expects a value between 20 and 100.   
   Please reexecute with a more appropriate value.', 
		@with_log=false
GO

