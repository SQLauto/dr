/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:57
	See https://dbatools.io/Export-DbaScript for more information
*/
Declare @condition_id int
EXEC msdb.dbo.sp_syspolicy_add_condition @name=N'hello', @description=N'', @facet=N'ApplicationRole', @expression=N'<Operator>
  <TypeClass>Bool</TypeClass>
  <OpType>EQ</OpType>
  <Count>2</Count>
  <Attribute>
    <TypeClass>DateTime</TypeClass>
    <Name>CreateDate</Name>
  </Attribute>
  <Function>
    <TypeClass>DateTime</TypeClass>
    <FunctionType>DateTime</FunctionType>
    <ReturnType>DateTime</ReturnType>
    <Count>1</Count>
    <Constant>
      <TypeClass>String</TypeClass>
      <ObjType>System.String</ObjType>
      <Value>2018-09-14T00:00:00.0000000</Value>
    </Constant>
  </Function>
</Operator>', @is_name_condition=0, @obj_name=N'', @condition_id=@condition_id OUTPUT
Select @condition_id

GO

/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:57
	See https://dbatools.io/Export-DbaScript for more information
*/
Declare @object_set_id int
EXEC msdb.dbo.sp_syspolicy_add_object_set @object_set_name=N'awesome_ObjectSet', @facet=N'Certificate', @object_set_id=@object_set_id OUTPUT
Select @object_set_id
 Declare @target_set_id int
EXEC msdb.dbo.sp_syspolicy_add_target_set @object_set_name=N'awesome_ObjectSet', @type_skeleton=N'Server/Database/Certificate', @type=N'CERTIFICATE', @enabled=True, @target_set_id=@target_set_id OUTPUT
Select @target_set_id

EXEC msdb.dbo.sp_syspolicy_add_target_set_level @target_set_id=@target_set_id, @type_skeleton=N'Server/Database/Certificate', @level_name=N'Certificate', @condition_name=N'', @target_set_level_id=0
EXEC msdb.dbo.sp_syspolicy_add_target_set_level @target_set_id=@target_set_id, @type_skeleton=N'Server/Database', @level_name=N'Database', @condition_name=N'', @target_set_level_id=0

GO

Declare @object_set_id int
EXEC msdb.dbo.sp_syspolicy_add_object_set @object_set_name=N'awesome_ObjectSet_1', @facet=N'ApplicationRole', @object_set_id=@object_set_id OUTPUT
Select @object_set_id
 Declare @target_set_id int
EXEC msdb.dbo.sp_syspolicy_add_target_set @object_set_name=N'awesome_ObjectSet_1', @type_skeleton=N'Server/Database/ApplicationRole', @type=N'APPLICATION ROLE', @enabled=True, @target_set_id=@target_set_id OUTPUT
Select @target_set_id

EXEC msdb.dbo.sp_syspolicy_add_target_set_level @target_set_id=@target_set_id, @type_skeleton=N'Server/Database/ApplicationRole', @level_name=N'ApplicationRole', @condition_name=N'', @target_set_level_id=0
EXEC msdb.dbo.sp_syspolicy_add_target_set_level @target_set_id=@target_set_id, @type_skeleton=N'Server/Database', @level_name=N'Database', @condition_name=N'', @target_set_level_id=0

GO

/*
	Created by WORKSTATION\loulou using dbatools Export-DbaScript for objects on workstation$sql2016 at 09/14/2018 14:02:57
	See https://dbatools.io/Export-DbaScript for more information
*/
Declare @policy_id int
EXEC msdb.dbo.sp_syspolicy_add_policy @name=N'awesome', @condition_name=N'hello', @policy_category=N'', @description=N'', @help_text=N'', @help_link=N'', @schedule_uid=N'00000000-0000-0000-0000-000000000000', @execution_mode=0, @is_enabled=False, @policy_id=@policy_id OUTPUT, @root_condition_name=N'', @object_set=N'awesome_ObjectSet_1'
Select @policy_id

GO

