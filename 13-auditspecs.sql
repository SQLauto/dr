/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:56
	See https://dbatools.io/Export-DbaScript for more information
*/
CREATE SERVER AUDIT SPECIFICATION [ServerAuditSpecification-20160502-100608]
FOR SERVER AUDIT [Audit-20160502-100608]
ADD (DBCC_GROUP)
WITH (STATE = OFF)
GO

