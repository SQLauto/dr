/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:56
	See https://dbatools.io/Export-DbaScript for more information
*/
CREATE ENDPOINT [endpoint_mirroring] 
	STATE=STARTED
	AS TCP (LISTENER_PORT = 7022, LISTENER_IP = ALL)
	FOR DATA_MIRRORING (ROLE = ALL, AUTHENTICATION = WINDOWS KERBEROS
, ENCRYPTION = SUPPORTED ALGORITHM RC4)
GO

