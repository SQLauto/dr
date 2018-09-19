
USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'distributor_admin') CREATE LOGIN [distributor_admin] WITH PASSWORD = 0x020003B7EF95BAFFE49F455A61F0F68A0FEC64255D06F250798357361E6E0C837F931C1FFEC63376896178810420F182B5464BE4E6C63CAE1D9FD70F70E3D9FF6706F60F61FF HASHED, SID = 0x242BC2672E6B7A43BB0A7CFACEA6EB63, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF, DEFAULT_LANGUAGE = [us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [distributor_admin]
GO

USE master

GO
Grant CONNECT SQL TO [distributor_admin]  AS [sqladmin]
GO

USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'login1') CREATE LOGIN [login1] WITH PASSWORD = 0x02005FAD571282CB024102679F31754BCC12D705B4DF864C816D2D1CD63E9CA6E1499E7B9ED2B84F36D4FFACD4E8A84238CE0E172028F44008165A028F1F96EC87B186757CCE HASHED, SID = 0xA67ABE5A12A9E14BAA37F927C84315C2, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = ON, DEFAULT_LANGUAGE = [us_english]
GO
ALTER SERVER ROLE [whattup] ADD MEMBER [login1]
GO

USE master

GO
Grant CONNECT SQL TO [login1]  AS [sqladmin]
GO

USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'login2') CREATE LOGIN [login2] WITH PASSWORD = 0x020018365749000326D9F062EB42E68F30899AF8AE56EBFA73865A8DD135DEB5F798F8F358B38644F5FE3451701822830CEDD5DE8B7544418E9D77D3922153888A9C31E80C52 HASHED, SID = 0x970DFD42C12E6341B96C04CFB4F94E10, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = ON, DEFAULT_LANGUAGE = [us_english]
GO
ALTER SERVER ROLE [whattup] ADD MEMBER [login2]
GO

USE master

GO
Grant CONNECT SQL TO [login2]  AS [sqladmin]
GO

USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'login3') CREATE LOGIN [login3] WITH PASSWORD = 0x0200C3CFA151AF3DC4C671A408B7427C06FC7F716CC44A0C56EAFBB7B02554F87830EF30F580733B2E9F4047FF072FEB6810F5B58D2DA2874F8F6CE5F04F6771B74D7526B053 HASHED, SID = 0xE95C8D42F6267B459C35F6A1D9D637B6, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = ON, DEFAULT_LANGUAGE = [us_english]
GO
ALTER SERVER ROLE [whattup] ADD MEMBER [login3]
GO

USE master

GO
Grant CONNECT SQL TO [login3]  AS [sqladmin]
GO

USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'login4') CREATE LOGIN [login4] WITH PASSWORD = 0x0200FB30BFD8CF7716BB8AB24A544AC97B3B01711CDBDE62608216D46BB36D2D5A472A700DFED1857CEE3821D664F195ECFBE851D6A05E100F2C99E91912D619F25C68AA15F1 HASHED, SID = 0x92821130F6BCB94786097E6D69BA85BE, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = ON, DEFAULT_LANGUAGE = [us_english]
GO
ALTER SERVER ROLE [whattup] ADD MEMBER [login4]
GO

USE master

GO
Grant CONNECT SQL TO [login4]  AS [sqladmin]
GO

USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'login5') CREATE LOGIN [login5] WITH PASSWORD = 0x0200C97ECDD84EB8769DE782886ED4FA77DFFE61237CB9F70B7B0F1CDBCB512249AF23F45D37EA9AEBF232B641C172B8BA4E65D530C7FE556F1A4593846EFDE171D5A0C8EA04 HASHED, SID = 0x69F2118926049446B7A43018091C397A, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = ON, DEFAULT_LANGUAGE = [us_english]
GO

USE master

GO
Grant CONNECT SQL TO [login5]  AS [sqladmin]
GO

USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'sqladmin') CREATE LOGIN [sqladmin] WITH PASSWORD = 0x0200FE25FB750460D14DBDCF0F4A8E49F3DCBCC2850F863E3A18D45C69D8D627B69258F5D5156B898ED9B73FFC2E52D7C7147BE0EA4955826275ADC7F2943B9D32C7A9BEC16E HASHED, SID = 0x01, DEFAULT_DATABASE = [master], CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF, DEFAULT_LANGUAGE = [us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [sqladmin]
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'CommandLog Cleanup', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'DatabaseBackup - SYSTEM_DATABASES - FULL', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'DatabaseBackup - USER_DATABASES - DIFF', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'DatabaseBackup - USER_DATABASES - FULL', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'DatabaseBackup - USER_DATABASES - LOG', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'DatabaseIntegrityCheck - SYSTEM_DATABASES', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'DatabaseIntegrityCheck - USER_DATABASES', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'IndexOptimize - USER_DATABASES', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'Output File Cleanup', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'sp_delete_backuphistory', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'sp_purge_jobhistory', @owner_login_name=N'sqladmin'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'syspolicy_purge_history', @owner_login_name=N'sqladmin'
GO

USE master

GO
Grant CONNECT SQL TO [sqladmin]  AS [sqladmin]
GO

USE [master]

GO
CREATE USER [dbo] FOR LOGIN [sqladmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo]
GO
Grant CONNECT TO [sqladmin]  AS [dbo]
GO

USE [tempdb]

GO
CREATE USER [dbo] FOR LOGIN [sqladmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo]
GO
Grant CONNECT TO [sqladmin]  AS [dbo]
GO

USE [model]

GO
CREATE USER [dbo] FOR LOGIN [sqladmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo]
GO
Grant CONNECT TO [sqladmin]  AS [dbo]
GO

USE [msdb]

GO
CREATE USER [dbo] FOR LOGIN [sqladmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo]
GO
Grant CONNECT TO [sqladmin]  AS [dbo]
GO

USE [distribution]

GO
CREATE USER [dbo] FOR LOGIN [sqladmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo]
GO
Grant CONNECT TO [sqladmin]  AS [dbo]
GO

USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'WORKSTATION\loulou') CREATE LOGIN [WORKSTATION\loulou] FROM WINDOWS WITH DEFAULT_DATABASE = [master], DEFAULT_LANGUAGE = [us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [WORKSTATION\loulou]
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'Agent history clean up: distribution', @owner_login_name=N'WORKSTATION\loulou'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'Distribution clean up: distribution', @owner_login_name=N'WORKSTATION\loulou'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'Expired subscription clean up', @owner_login_name=N'WORKSTATION\loulou'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'Reinitialize subscriptions having data validation failures', @owner_login_name=N'WORKSTATION\loulou'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'Replication agents checkup', @owner_login_name=N'WORKSTATION\loulou'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'Replication monitoring refresher for distribution.', @owner_login_name=N'WORKSTATION\loulou'
GO

USE msdb

GO
EXEC msdb.dbo.sp_update_job @job_name=N'WORKSTATION\SQL2016-anotherdb-pubz-1', @owner_login_name=N'WORKSTATION\loulou'
GO

USE master

GO
Grant CONNECT SQL TO [WORKSTATION\loulou]  AS [sqladmin]
GO

USE [dbwithsprocs]

GO
CREATE USER [dbo] FOR LOGIN [WORKSTATION\loulou] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo]
GO
Grant CONNECT TO [WORKSTATION\loulou]  AS [dbo]
GO

USE [anotherdb]

GO
CREATE USER [dbo] FOR LOGIN [WORKSTATION\loulou] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo]
GO
Grant CONNECT TO [WORKSTATION\loulou]  AS [dbo]
GO

USE [db1]

GO
CREATE USER [dbo] FOR LOGIN [WORKSTATION\loulou] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo]
GO
Grant CONNECT TO [WORKSTATION\loulou]  AS [dbo]
GO

USE [shipped]

GO
CREATE USER [dbo] FOR LOGIN [WORKSTATION\loulou] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbo]
GO
Grant CONNECT TO [WORKSTATION\loulou]  AS [dbo]
GO

USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'WORKSTATION\powershell') CREATE LOGIN [WORKSTATION\powershell] FROM WINDOWS WITH DEFAULT_DATABASE = [master], DEFAULT_LANGUAGE = [us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [WORKSTATION\powershell]
GO

USE master

GO
Grant CONNECT SQL TO [WORKSTATION\powershell]  AS [sqladmin]
GO

USE master

GO
IF NOT EXISTS (SELECT loginname FROM master.dbo.syslogins WHERE name = 'WORKSTATION\sqlserver') CREATE LOGIN [WORKSTATION\sqlserver] FROM WINDOWS WITH DEFAULT_DATABASE = [master], DEFAULT_LANGUAGE = [us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [WORKSTATION\sqlserver]
GO

USE master

GO
Grant CONNECT SQL TO [WORKSTATION\sqlserver]  AS [sqladmin]
GO
