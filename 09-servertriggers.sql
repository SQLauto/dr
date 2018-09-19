/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:47
	See https://dbatools.io/Export-DbaScript for more information
*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

GO
CREATE TRIGGER [dbatoolsci-trigger] -- Trigger name
			ON ALL SERVER FOR LOGON -- Tells you it's a logon trigger
			AS
			BEGIN
			return;
			END
GO

GO
ENABLE TRIGGER [dbatoolsci-trigger] ON ALL SERVER
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

GO
CREATE TRIGGER tr_MScdc_db_ddl_event on all server for ALTER_DATABASE, DROP_DATABASE
		             as 
					set ANSI_NULLS ON
					set ANSI_PADDING ON
					set ANSI_WARNINGS ON
					set ARITHABORT ON
					set CONCAT_NULL_YIELDS_NULL ON
					set NUMERIC_ROUNDABORT OFF
					set QUOTED_IDENTIFIER ON

					declare @EventData xml, @retcode int
					set @EventData=EventData()  
					if object_id('sys.sp_MScdc_db_ddl_event' ) is not null
					begin 
						exec @retcode = sys.sp_MScdc_db_ddl_event @EventData
						if @@error <> 0 or @retcode <> 0 
						begin
							rollback tran
						end
					end		 

GO

GO
ENABLE TRIGGER [tr_MScdc_db_ddl_event] ON ALL SERVER
GO


