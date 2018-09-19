/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:57
	See https://dbatools.io/Export-DbaScript for more information
*/
ALTER RESOURCE GOVERNOR WITH (CLASSIFIER_FUNCTION = NULL);
GO

ALTER RESOURCE GOVERNOR WITH (MAX_OUTSTANDING_IO_PER_VOLUME = DEFAULT);
GO

ALTER RESOURCE GOVERNOR RECONFIGURE;
GO

/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:57
	See https://dbatools.io/Export-DbaScript for more information
*/
CREATE RESOURCE POOL [Test Pool] WITH(min_cpu_percent=0, 
		max_cpu_percent=100, 
		min_memory_percent=0, 
		max_memory_percent=100, 
		cap_cpu_percent=100, 
		AFFINITY SCHEDULER = AUTO
, 
		min_iops_per_volume=0, 
		max_iops_per_volume=0)

GO

ALTER RESOURCE GOVERNOR RECONFIGURE;