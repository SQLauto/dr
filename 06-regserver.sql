/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on DatabaseEngineServerGroup at 09/14/2018 14:02:46
	See https://dbatools.io/Export-DbaScript for more information
*/
Declare @server_group_id int
EXEC msdb.dbo.sp_sysmanagement_add_shared_server_group @parent_id=1, @name=N'Site1', @description=N'', @server_type=0, @server_group_id=@server_group_id OUTPUT
Select @server_group_id

GO

Declare @server_group_id int
EXEC msdb.dbo.sp_sysmanagement_add_shared_server_group @parent_id=1, @name=N'Site2', @description=N'', @server_type=0, @server_group_id=@server_group_id OUTPUT
Select @server_group_id

GO

/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on Site1 at 09/14/2018 14:02:46
	See https://dbatools.io/Export-DbaScript for more information
*/
Declare @server_id int
EXEC msdb.dbo.sp_sysmanagement_add_shared_registered_server @server_group_id=8, @name=N'sql2016', @server_name=N'sql2016', @description=N'', @server_type=0, @server_id=@server_id OUTPUT
Select @server_id

GO

Declare @server_id int
EXEC msdb.dbo.sp_sysmanagement_add_shared_registered_server @server_group_id=9, @name=N'sql2017', @server_name=N'sql2017', @description=N'', @server_type=0, @server_id=@server_id OUTPUT
Select @server_id

GO

