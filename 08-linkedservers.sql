EXEC master.dbo.sp_addlinkedserver @server = N'localhost', @srvproduct=N'SQL Server'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'localhost',@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL

EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'collation compatible', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'data access', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'dist', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'pub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'rpc', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'rpc out', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'sub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'connect timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'collation name', @optvalue=null
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'lazy schema validation', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'query timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'use remote collation', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'localhost', @optname=N'remote proc transaction promotion', @optvalue=N'true'
EXEC master.dbo.sp_addlinkedserver @server = N'repl_distributor', @srvproduct=N'SQL Server'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'repl_distributor',@useself=N'False',@locallogin=NULL,@rmtuser=N'distributor_admin',@rmtpassword='0D6E1509-F04F-422D-B8A9-C8611095AE47'

EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'collation compatible', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'data access', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'dist', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'pub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'rpc', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'rpc out', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'sub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'connect timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'collation name', @optvalue=null
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'lazy schema validation', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'query timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'use remote collation', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'repl_distributor', @optname=N'remote proc transaction promotion', @optvalue=N'false'
EXEC master.dbo.sp_addlinkedserver @server = N'SQL2012', @srvproduct=N'SQLSERVER', @provider=N'SQLNCLI', @datasrc=N'SQL2012'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'SQL2012',@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL

EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'collation compatible', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'data access', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'dist', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'pub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'rpc', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'rpc out', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'sub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'connect timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'collation name', @optvalue=null
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'lazy schema validation', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'query timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'use remote collation', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'SQL2012', @optname=N'remote proc transaction promotion', @optvalue=N'true'
EXEC master.dbo.sp_addlinkedserver @server = N'SQL2014', @srvproduct=N'SQL Server'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'SQL2014',@useself=N'False',@locallogin=NULL,@rmtuser=N'sa',@rmtpassword='sa'

EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'collation compatible', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'data access', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'dist', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'pub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'rpc', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'rpc out', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'sub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'connect timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'collation name', @optvalue=null
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'lazy schema validation', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'query timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'use remote collation', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'SQL2014', @optname=N'remote proc transaction promotion', @optvalue=N'true'
EXEC master.dbo.sp_addlinkedserver @server = N'SQL2016', @srvproduct=N'SQL Server'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'SQL2016',@useself=N'False',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL

EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'collation compatible', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'data access', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'dist', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'pub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'rpc', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'rpc out', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'sub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'connect timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'collation name', @optvalue=null
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'lazy schema validation', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'query timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'use remote collation', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'SQL2016', @optname=N'remote proc transaction promotion', @optvalue=N'true'
EXEC master.dbo.sp_addlinkedserver @server = N'SQL2016A', @srvproduct=N'SQL Server'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'SQL2016A',@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL

EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'collation compatible', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'data access', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'dist', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'pub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'rpc', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'rpc out', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'sub', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'connect timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'collation name', @optvalue=null
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'lazy schema validation', @optvalue=N'false'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'query timeout', @optvalue=N'0'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'use remote collation', @optvalue=N'true'
EXEC master.dbo.sp_serveroption @server=N'SQL2016A', @optname=N'remote proc transaction promotion', @optvalue=N'true'
