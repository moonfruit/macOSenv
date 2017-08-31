// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCdMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     06/03/09 - Add cause and action for messages
//     yizhang     05/28/09 - fix messages
//     yizhang     05/18/09 - fix message DISKGROUP_NOT_EXIST
//     yizhang     05/07/09 - fix bug 8481969
//     rxkumar     05/12/09 - sync db config types with docs
//     agridnev    04/28/09 - fixed bug 8460971
//     sowong      04/26/09 - add mesage for bug-7190209
//     sowong      04/24/09 - fix bug8211423
//     agridnev    04/16/09 - fixed bug-8427829
//     agridnev    04/12/09 - fixed bug-8417254
//     agridnev    04/01/09 - fixed bug-8338015
//     sowong      03/13/09 - fix bug8329309
//     rxkumar     03/04/09 - fix bug8295755
//     rxkumar     02/17/09 - fix bug8249717
//     sowong      12/16/08 - add message for acfs resource not found during
//                            setting up of dependencies for db
//     agridnev    11/24/08 - fixed bug-7381394
//     sowong      10/10/08 - add message for bug6874976
//     sowong      08/07/08 - add message for bug6922518
//     lmortime    08/04/08 - 
//     agridnev    07/28/08 - review based changes
//     agridnev    07/24/08 - fix for bug-7198789
//     rxkumar     07/22/08 - fix bug7142054: sg->sp
//     agridnev    07/07/08 - added message for empty prefered list in
//                            HAService.modify()
//     sowong      07/02/08 - fix bug6954822
//     agridnev    06/19/08 - added messages for HAServiceImpl
//     agridnev    06/12/08 - added message for isDBCentric
//     agridnev    06/10/08 - fixed typos
//     agridnev    06/09/08 - added message as a part of fix for 6883108
//     agridnev    06/02/08 - fixed (once again) names for database/service
//                            centric configs
//     rxkumar     06/02/08 - add CANNOT_RELOCATE_UNIFORM_DB/SVC
//     sowong      05/28/08 - fix bug7132107
//     rxkumar     05/12/08 - add CREATE_PRECONNECT_SVC_FAILED
//     rxkumar     05/08/08 - add INVALID_RELOCATE_OPTION
//     rxkumar     05/06/08 - add CANNOT_CHANGE_ENUM_VALUE
//     sowong      05/07/08 - add messages for bug7019447
//     spavan      05/07/08 - Fix bug6960890
//     sowong      04/22/08 - add messages for bug6974139
//     sowong      04/09/08 - add GET_DB_UNIQUE_NAME_FAILED
//     sowong      04/03/08 - add QUERY_PRE_TB_DB_FAILED
//     sowong      03/25/08 - add message for ofs dependency
//     sravindh    03/18/08 - Transfer cause and action from java file
//     sowong      02/21/08 - add message for database domain
//     sowong      01/22/08 - add new message for database instance
//     sowong      01/11/08 - remove text containing service or db centric
//     agridnev    01/03/08 - added suppor for FailoverMethod
//     agridnev    12/13/07 - added support for ServerSideTAF
//     agridnev    11/28/07 - added failed to modify service
//     agridnev    11/26/07 - added messages to support service getArgs() and
//                            modify()
//     agridnev    11/16/07 - updated SET_DBROLE_FAILED
//     agridnev    11/09/07 - added UPDATE_PULLUP_FAILED
//     sowong      10/09/07 - add INVALID_MGMT_POLICY, etc
//     sowong      09/07/07 - add message for validating network and server group
//     sowong      07/20/07 - add messages for rac db and services implementation
//     sowong      12/28/06 - add new messages for database and services
//     rxkumar     12/14/06 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, DB_ALREADY_EXISTS, "Database {0} already exists"
//  *Cause: The specified database resource was already registered in Oracle Clusterware. 
// *Action: No action is needed.
/
1001, DB_NOT_EXISTS, "Database {0} does not exist"
//  *Cause: The specified database resource was not registered in Oracle Clusterware.
// *Action: Register the database resource using 'srvctl add database'.
/
1002, DB_DEP_ON_SP, "Database {0} is dependent upon server pool {1}"
//  *Cause: An attempt to remove the specified server pool failed because the server pool is in use.
// *Action: Remove the specified database before removing the server pool.
/
1003, SVC_ALREADY_EXISTS, "Service {0} already exists"
//  *Cause: The specified service was already created and registered in Oracle Clusterware.
// *Action: No action is needed.
/
1004, SVC_DEP_ON_SP, "Service {0} is dependent upon server pool {1}"
//  *Cause: An attempt to remove the specified server pool failed because the server pool is in use.
// *Action: Remove the specified service before removing the server pool.
/
1005, SRVG_NOT_EXIST, "Server pool {0} for the database {1} does not exist"
//  *Cause: The specified server pool used by the database was removed by force.
// *Action: Create the server pool using 'srvctl create srvpool'.
/
1006, DBNAME_NOT_EXIST, "Dummy message line"
//  *Document: No
//  *Cause: Message is not used. 
// *Action: 
/
1007, GET_DBNAME_FAILED, "Failed to retrieve the database name"
//  *Cause: Failed in retrieving the DB_NAME resource attribute.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1008, SPFILE_NOT_EXIST, "Server parameter file does not exist for database {0}"
//  *Cause: Failed in retrieving the SPFILE resource attribute.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1009, GET_SPFILE_FAILED, "Failed to retrieve server parameter file of database {0}"
//  *Cause: Cannot retrieve the server parameter file for the specified database.
// *Action: Retry the request after ensuring that the CRS stack is running, the database resource has been configured, and the user has read permission on the database resource.
/
1010, SET_SPFILE_FAILED, "Failed to update server parameter file {0} of database {1}"
//  *Cause: Unable to update the server parameter file for the specified database.
// *Action: Retry the request after ensuring that the CRS stack is running, the database resource has been configured, and the user has update permission on the database resource.
/
1011, GET_IS_CLUSTERDB_FAILED, "Failed to identify whether this database {0} is a multi-instance database"
//  *Cause: Failed in retrieving the CLUSTER_DATABASE resource attribute.
// *Action: Examine the accompanying error messages for details.
/
1012, GET_DISKGROUP_FAILED, "Failed to retrieve disk group list for database {0}."
//  *Cause: Failed to retrieve the diskgroups from the start dependencies of the specified database.
// *Action: Examine the accompanying error messages for details. Create the diskgroup using sqlplus if the specified diskgroup does not exist. Mount the diskgroup in database which registers the diskgroup with Oracle Clusterware.
/
1013, SET_DISKGROUP_FAILED, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1014, GET_DBDOMAIN_FAILED, "Failed to retrieve database domain of database {0}"
//  *Cause: Failed to get the domain of the specified database from its USR_ORA_DOMAIN attribute.
// *Action: Examine the accompanying error messages for details.
/
1015, CARDINALITY_TAF_ERROR, "Combination of service cardinality {0} and TAF {1} is not allowed for service {2}"
//  *Cause: The specified service cardinality can not be used with the specified TAF policy.
// *Action: Change the cardinality or find a matching TAF policy. PRECONNECT can only be used with SINGLETON cardinality.
/
1016, SRVG_FAILURE, "Failure encountered while accessing server pool {0} for database {1}"
//  *Cause: An attempt to look up the server pools referenced by the database SERVER_POOLS attribute failed.
// *Action: Examine the accompanying error messages for details.
/
1017, SRVG_PARENT_DB_UNMATCHED, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1018, AGENT_FILENAME_NOT_EXISTS, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1019, GET_ORACLE_HOME_FAILED, "Failed to retrieve Oracle home of database {0}"
//  *Cause: An attempt to retrieve the TAF_POLICY attribute of the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1020, GET_SERVICE_TAF_FAILED, "Failed to retrieve TAF policy for service {0}"
//  *Cause: An attempt to retrieve the ORACLE_HOME attribute of the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1021, SET_SERVICE_TAF_FAILED, "Failed to update TAF policy  {0} for service {1}"
//  *Cause: An attempt to set the TAF_POLICY attribute of the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1022, SINGLE_INST_ALREADY_EXISTS, "Cannot add a second instance to a single instance database"
//  *Cause: Unable to add an instance to a single instance database.
// *Action: Multiple instances are not supported for a single instance database. Convert to a RAC database if multiple instances are desired.
/
1023, INST_ALREADY_EXISTS, "An Instance has already been added to node {0} for database {1}."
//  *Cause: Unable to add an instance to the database on the specified node because another instance has already been added to the node. 
// *Action: Use srvctl modify instance command to change the instance name on the specified node.
/
1024, GET_INSTANCE_LIST_FAILED, "Failed to retrieve instance list for database {0}"
//  *Cause: An attempt to get the list of the instances for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1025, CREATE_DB_FAILED, "Failed to create database {0}"
//  *Cause: An attempt to create Clusterware resources for the specified database failed. Either the request was issued by the wrong OS userid or a problem was detected inside Oracle Clusterware.
// *Action: Examine the accompanying error messages for details. Login in as the user of the Oracle Home to issue the command 'srvctl add database'. 
/
1026, CREATE_SERVICE_FAILED, "Failed to create service {0} for database {1}"
//  *Cause: An attempt to create the specified service failed because the command 'srvctl add service' was not issued by the Oracle Home owner.
// *Action: Examine the accompanying error messages for details. Login in as the user of the Oracle Home to issue the command 'srvctl add service'. 
/
1027, GET_DB_FAILED, "Failed to retrieve database {0}"
//  *Cause: An attempt to get the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1028, GET_SERVICE_FAILED, "Failed to retrieve service resource {0} for database {1}"
//  *Cause: An attempt to get the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1029, DISKGROUP_NOT_EXIST, "Disk group {0} for database {1} does not exist"
//  *Cause: The disk group for the specified database does not exist.
// *Action: Use 'srvctl add diskgroup' to add the specified disk group.
/
1030, IS_CARDINAL_FAILED, "Failed to determine whether the database {0} has cardinality"
//  *Cause: Failed to determine whether the specified database is cardinality based or not based on its VERSION attribute.
// *Action: Examine the accompanying error messages for details.
/
1031, IS_SVC_CARDINAL_FAILED, "Failed to determine whether the service {0} has cardinality"
//  *Cause: Failed to check whether the specified service is cardinality based or not.
// *Action: Examine the accompanying error messages for details.
/
1032, REMOVE_DB_FAILED, "Failed to remove database resource {0}"
//  *Cause: Failed to remove the specified database.
// *Action: Examine the accompanying error messages for details.
/
1033, PARENT_GROUPS_DIFFERENCE, "The server pool of service {0} is different from the server pool of database {1}"
//  *Cause: The specified server pool is not the child of the database's server pool.
// *Action: Use a server pool which is the child of the database's server pool.
/
1034, NOT_SINGLE_INST_DB, "{0} is the database unique name of a cluster database, not a single instance database"
//  *Cause: The specified database is not a single instance database. 
// *Action: Provide a database name for a single instance database.
/
1035, NOT_CLUSTER_DB, "{0} is the database unique name of a single instance database, not a cluster database"
//  *Cause: The specified database is not a cluster database.
// *Action: Provide a database name for a RAC database.
/
1036, SET_ORACLE_HOME_FAILED, "Failed to set Oracle home {0} for database {1}"
//  *Cause: An attempt to update Oracle home for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1037, SET_PERX_ORACLE_HOME_FAILED, "Failed to set Oracle home {0} for database {1} on node {2}"
//  *Cause: An attempt to update Oracle home for the specified database on the specified node failed. 
// *Action: Examine the accompanying error messages for details.
/
1038, CREATE_CLUSTDB_ON_NON_CLUSTER, "Cannot create a RAC database {0} in a non cluster environment"
//  *Cause: Failed to create the specified RAC database because Oracle Clusterware is not installed and configured.
// *Action: Install and configure Oracle Clusterware before creating the RAC database.
/
1039, GET_SERVICE_DB_FAILED, "Failed to retrieve database for service {0}"
//  *Cause: An attempt to get the database that the specified service depended on failed. This is an internal error.
// *Action: Contact Oracle Support Services.
/
1040, EXISTING_DB_CENTRIC_CONFIG, "Specified server pool {0} for {1} is already hosting an administrator-managed configuration for databases {2} and services {3}"
//  *Cause: Server pool is hosting administrator-managed databases and service.
// *Action: Specify a server pool that is not hosting an administrator-managed database and service.
/
1041, INVALID_DB_CENTRIC_CONFIG, "The administrator-managed database {1} can have only one server pool {0}"
//  *Cause: Multiple server pools cannot be configured for an administrator-managed database
// *Action: Contact Oracle Support.
/
1042, SERVICE_DB_SERV_CENTRIC_CONFIG, "The database {1} is administrator-managed and a policy-managed service {0} cannot be created on it."
//  *Cause: The specified database does not support policy-managed services.
// *Action: Provide a database which supports policy-managed services.
/
1043, SERVICE_DB_DB_CENTRIC_CONFIG, "The service {0} is not a uniform or a singleton service and therefore it cannot be created as policy-managed service. This service can only be created as administrator-managed service using preferred, and optionally available instance lists."
//  *Cause: The service to be created was an administrator-managed service and the database that the service depended on was a policy-managed database.   
// *Action: Use perferred and available instance lists to create an adminstrator-managed service for an adminstrator-managed database.
/
1044, GET_NODELIST_FAILED, "Failed to retrieve the list of nodes where instances have been configured for database {0}"
//  *Cause: An attempt failed to get the list of nodes where the instances of the specified database were configured.
// *Action: Examine the accompanying error messages for details.
/
1045, ADD_INST_NOT_SUPPORTED_DB_OPT, "Database {0} is policy managed and does not support add instance option"
//  *Cause: The specified database does not support add instance option
// *Action: 
//      1) Provide an administrator-managed database. 
//      -or-
//      2) For policy-managed database, add a server to a server pool which manages the database using 'srvctl modify srvpool' or 'srvctl relocate server'.
/
1046, REM_INST_NOT_SUPPORTED_DB_OPT, "Database {0} is policy managed and does not support the remove instance option"
//  *Cause: The specified database does not support the remove instance option.
// *Action: 
//      1) Provide an administrator-managed database. 
//      -or-
//      2) For policy-managed database, stop the database on a server and then remove that server from the server pool which manages the database using 'srvctl modify srvpool' or 'srvctl relocate server'.
/
1047, GET_SERVICES_LIST_FAILED, "Failed to retrieve list of services for database {0}"
//  *Cause: An attempt to get the list of services for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1048, SINGLE_INST_NOT_REMOVED, "Cannot remove instance from the single instance database {0}"
//  *Cause: An attempt to remove the instance from the single instance database failed.
// *Action: Remove the database using 'srvctl remove database'.
/
1049, SET_DB_SP_FAILED, "Failed to update server pool {0} for database {1}"
//  *Cause: An attempt to update the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1050, SET_AUTO_START_FAILED, "Failed to update auto start value of service {0}"
//  *Cause: An attempt to update the auto start value for the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1051, ADD_INSTANCE_FAILED, "Failed to add instance to database {0}"
//  *Cause: An attempt to add an instance to the specified database failed because the node of the instance is not a node of the cluster or other errors. 
// *Action: Examine the accompanying error messages for details.
/
1052, REMOVE_INSTANCE_FAILED, "Failed to remove instance from database {0}"
//  *Cause: An attempt to remove the specified instance failed because the services depended on the instance or other errors.
// *Action: Examine the accompanying error messages for details.
/
1053, GET_PROVIDER_INST_FAILED, "Failed to retrieve the database instances providing service {0}"
//  *Cause: An attempt to get the database instances that provide the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1054, NULL_DB_NAME, "Database name is null"
//  *Cause: The database name given by the user is null.
// *Action: Provide a valid database name that is not a null string.
/
1055, NULL_INSTANCE_NAME, "Instance name is null"
//  *Cause: The instance name given by the user is null.
// *Action: Provide a valid instance name that is not a null string.
/
1056, INVALID_DB_NAME, "Database name {0} contains invalid characters"
//  *Cause:  The supplied database name contains invalid characters.
// *Action:  Supply a valid database name. The valid character set for database name is [a-zA-Z0-9$#_].
/
1057, INVALID_INSTANCE_NAME, "Instance name {0} is not valid"
//  *Cause:  The supplied instance name is not of the correct format.
// *Action:  Supplied a valid instance name. The valid character set for instance name is [a-zA-Z0-9_-].
/
1058, INVALID_SINGLEDB_SP_LIST, "Invalid server pool list {0} supplied for single instance database {1}"
//  *Cause: The server pool size was not one when creating a single instance database on a cluster.
// *Action: Use one server pool with only one server when creating the single instance database.
/
1060, MISSING_CLUST_SP_ARG, "Server pool has not been supplied for creating cluster service {0} for database {1}"
//  *Cause: No server pool argument has been supplied when configuring a cluster database.
// *Action: Supply an existing server pool when configuring a cluster database.
/
1061, DB_NOT_EXIST, "No database exists"
//  *Cause: No database has been configured.
// *Action: Configured database and retry.
/
1062, INVALID_SERVICE_CARDINALITY, "Invalid service cardinality {0}"
//  *Cause: The service cardinality supplied is not valid.
// *Action: Supply a valid service cardinality.
/
1063, INVALID_SERVICE_TAF, "Invalid service taf policy {0}"
//  *Cause: The service taf policy supplied is not valid.
// *Action: Supply a valid service taf policy.
/
1064, INVALID_DATABASE_ROLE, "Invalid database role {0}"
//  *Cause: The database role supplied is not valid.
// *Action: Supply a valid database role.
/
1065, INVALID_MGMT_POLICY, "Invalid managment policy {0}"
//  *Cause: The management policy supplied is not valid.
// *Action: Supply a valid management policy. The management policy should be automatic or manual.
/
1066, INVALID_START_OPTION, "Invalid start option {0}"
//  *Cause: The start option supplied is not valid.
// *Action: Supply a valid start option.
/
1067, INVALID_STOP_OPTION, "Invalid stop option {0}"
//  *Cause: The stop option supplied is not valid.
// *Action: Supply a valid stop option.
/
1068, MODIFY_INST_DB_CENTRIC_FAILED, "Failed to modify instance {0} on node {1} for database {2}"
//  *Cause: The instance for the specified node does not exist on the database.
// *Action: Use srvctl add instance to add the per-X instance.
/
1069, MODIFY_INST_FAILED, "Failed to modify instance {0} on node {1} for database {2}"
//  *Cause: The instance for the specified node cannot not be updated.
// *Action: Make sure that the crs stack is up and running; the oracle user has the permission to modify the instance; and then retry.
/
1070, GET_START_OPTION_FAILED, "Failed to retrieve startup options for database {0}"
//  *Cause: Unable to retrieve the startup options for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1071, SET_START_OPTION_FAILED, "Failed to update startup options for database {0}"
//  *Cause: Unable to update the startup options for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1072, GET_STOP_OPTION_FAILED, "Failed to retrieve stop options for database {0}"
//  *Cause: Unable to retrieve the stop options for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1073, SET_STOP_OPTION_FAILED, "Failed to update stop options for database {0}"
//  *Cause: Unable to update the stop options for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1074, GET_DBROLE_FAILED, "Failed to retrieve the database role for database {0}"
//  *Cause: Unable to retrieve the database role for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1075, SET_DBROLE_FAILED, "Failed to set the database role {1} for database {0}"
//  *Cause: Unable to update the database role for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1076, GET_MGMT_POLICY_FAILED, "Failed to retrieve the management policy for database {0}"
//  *Cause: Unable to retrieve the management policy for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1077, SET_MGMT_POLICY_FAILED, "Failed to update the management policy for database {0}"
//  *Cause: Unable to update the managment policy for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1078, SET_DBNAME_FAILED, "Failed to update the db name {0} of database {1}"
//  *Cause: Unable to update the db name for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1079, UPDATE_PULLUP_FAILED, "Failed to update pullup for service {0}: {1}"
//  *Cause: Failed to update pullup modifier for the service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1080, GET_SERV_ARGS_FAILD, "Failed to get attributes for service {0}"
//  *Cause: Failed to get attributes for the service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1081, SET_SERV_ARGS_FAILD, "Failed to set attributes for service {0}"
//  *Cause: Failed to set attributes for the service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1082, SERV_MODIFY_BAD_ARG, "Failed to modify service {0}: Unsupported attribute {1}"
//  *Cause: Operation doesn't support modification of attribute.
// *Action: Fix your application.
/
1083, SERV_MODIFY_FAILED, "Failed to modify service {0}"
//  *Cause: Failed to modify service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1084, SERV_START_FAILED, "Failed to start service {0}"
//  *Cause: Failed to start the service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1085, SERV_STOP_FAILED, "Failed to stop service {0}"
//  *Cause: Failed to stop the service.
// *Action: Make sure that the crs stack is up, the service is running and then retry.
/
1086, INVALID_RLBGOAL, "Invalid rlb goal {0}"
//  *Cause: The rlb goal supplied is not valid.
// *Action: Supply a valid rlb goal.
/
1087, INVALID_FAILOVER_TYPE, "Invalid failover type {0}"
//  *Cause: The failover type supplied is not valid.
// *Action: Supply a valid failover type.
/
1088, INVALID_CLBGOAL, "Invalid connection load balancing goal {0}"
//  *Cause: The clb goal supplied is not valid.
// *Action: Supply a valid clb goal.
/
1089, INVALID_FAILOVER_METHOD, "Invalid failover method {0}"
//  *Cause: The failover method supplied is not valid.
// *Action: Supply a valid failover method.
/
1090, GET_PERX_ORACLE_HOME_FAILED, "Failed to retrieve Oracle home of database {0} on node {1}"
//  *Cause: No Oracle home of the database has been set on the specified node.
// *Action: Set the Oracle home of the database on the specified node.
/
1091, CREATE_DBINST_FAILED, "Failed to create database instance {0} for database {1}"
//  *Cause: Unable to create database instance for the specified instance name.
// *Action: Make sure that the local node can be used for creating a database instance; the instance name provided is valid. The valid character set for instance name is [a-zA-Z0-9_-].
/
1092, CREATE_DBINST_FAILED_NODE, "Failed to create database instance {0} for database {1} on node {2}"
//  *Cause: Unable to create database instance for the specified instance name and node name.
// *Action: Make sure that the specified node can be used to create a database; the instance name provided is valid. The valid character set for instance name is [a-zA-Z0-9_-].
/
1093, SET_DBDOMAIN_FAILED, "Failed to update the domain {0} of database {1}"
//  *Cause:  Unable to update the domain for the database.
// *Action:  Make sure that the crs stack is up and running and then retry.
/
1094, OFS_CREATE_STARTDEP_FAILED, "Failed to create start dependency for database {0} on the asm filesystem where oracle home {1} is residing"
//  *Cause:  Unable to modify the database resource to include a start dependency on the ASM filesystem for the database's Oracle home.
// *Action:  Make sure that the asm instance is running; the OFS driver exists in the driver directory and the underlying ofs devices are accessible.
/
1095, QUERY_PRE_TB_DB_FAILED, "Failed to retrieve databases for version 11.1 and earlier"
//  *Cause:  Unable to read OCR configuration to get databases for version 11.1 and earlier
// *Action:  Make sure that the Oracle clusterware is up and running and the primary group of the user running srvctl is the same as the primary group of the user who installed the Oracle clusterware home. Also, run 11.1 srvctl config to verify that the database configuration exists in OCR.
/
1096, GET_DB_UNIQUE_NAME_FAILED, "Failed to retrieve the database unique name"
//  *Cause: Unable to read the attribute value for database unique name.
// *Action: Make sure that the Oracle clusterware is up and running and then retry.
/
1097, GET_DB_ACTIVE_SERVERS_FAILED, "Failed to retrieve the active servers of server pool {0} for database {1}"
//  *Cause: Unable to read the active servers attribute value for the database underlying server pools.
// *Action: Make sure that the Oracle clusterware is up and running; the database underlying server pools exist; the user has the permission to access the database underlying server pools and then retry.
/
1098, GET_DB_CONFIGURED_SERVERS_FAILED, "Failed to retrieve the configured servers of server pool {0} for database {1}"
//  *Cause: Unable to read the servers attribute value for the database underlying server pool.
// *Action: Make sure that the Oracle clusterware is up and running; the database underlying server pool exists and then retry.
/
1099, CANNOT_CHANGE_ENUM_VALUE, "{0} enum member has a constant value that cannot be changed to given value {1}"
//  *Cause: An attempt was made to change value of read-only valued enum member.
// *Action: Contact Oracle Support Services.
/
1100, INVALID_RELOCATE_OPTION, "Invalid relocate option {0}"
//  *Cause: Supplied relocate option is unknown.
// *Action: Contact Oracle Support Services.
/
1101, REMOVE_RUNNING_INST_FAILED, "Failed to remove running instance {0} for database {1}"
//  *Cause: Unable to remove the instance configuration for the database because the instance was still running.
// *Action: Stop the running instance using srvctl stop instance command and then retry.
/
1102, CREATE_PRECONNECT_SVC_FAILED, "Failed to create preconnect service for service {0}"
//  *Cause: An attempt to register service failed due to failure to register its corresponding preconnect service.
// *Action: Contact Oracle Support Services.
/
1103, GET_MAX_CARDINALITY_FAILED, "Failed to retrieve the maximum cardinality for database {0}"
//  *Cause: Unable to query the number of servers in the server pool used to manage the database.
// *Action: Make sure that the Oracle clusterware is up and running; the database underlying server pool exists and then retry.
/
1104, CANNOT_RELOCATE_UNIFORM_DB, "A source server must be specified to relocate cluster database {0}"
//  *Cause: Cluster database cannot be relocated without specifying source server to relocate instance from.
// *Action: Supply source and target servers for database relocation.
/
1105, CANNOT_RELOCATE_UNIFORM_SVC, "A source server must be specified to relocate service {0} "
//  *Cause: Cluster database service cannot be relocated without specifying source server to relocate service member from.
// *Action: Supply source and target servers for service relocation.
/
1106, REMOVE_SERVICE_FAILED_SP, "Failed remove service {0}: could not get data for its underlying server pool"
//   *Cause: Server pool data is not found.
//  *Action: Make sure that the Oracle clusterware is up and running; the service underlying server pool exists.
/
1107, REMOVE_SERVICE_FAILED_SP2, "Removed service {0} but failed to remove its underlying server pool {1}"
//   *Cause: Failed to remove the server pool.
//  *Action: Make sure that the Oracle clusterware is running and remove the server pool manually.
/
1108, IS_DBCETRIC_FAILED, "Failed to identify whether database {0} is an administrator-managed database"
//  *Cause: Failed to get database attributes.
// *Action: Make sure that the Oracle clusterware is up and running; the database exists.
/
1109, GET_HASERVICE_FAILED, "Failed to find administrator-managed service {0} of database {1} because the database is a policy-managed database."
//  *Cause: The database does not support administrator-managed services.
// *Action: Provide an administrator-managed database and make sure that the service exists within that database.
/
1110, NO_INSTANCES_FOUND, "Database {0} does not have instances {1}"
//  *Cause: The database does not have instances mentioned in the message.
// *Action: Make sure that database name is correct and the database has requested instances.
/
1111, CANNOT_GET_ENUM_VALUE, "The type of service cardinality for this operation should be {1}, not {0}"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1112, SERVICE_GETPREF_FAILED, "Failed to get preferred instances of service {0}"
//  *Cause: The service does not exist or the Oracle clusterware is down.
// *Action: Make sure that the Oracle clusterware is up and running and the service exists.
/
1113, SERVICE_MODIFY_FAILED, "Failed to modify service {0}"
//  *Cause: The service does not exist or the Oracle clusterware is down.
// *Action: Make sure that the Oracle clusterware is up and running and the service exists.
/
1114, SERVICE_ENABINST_FAILED, "Failed to enable service {0} on one or more instances"
//  *Cause: The service does not exist or enabled on all database instances. The Oracle clusterware is down.
// *Action: make sure that the Oracle clusterware is up and running; the service exists and disabled on at least one database instance.
/
1115, SERVICE_DISABINST_FAILED, "Failed to disable service {0} on one or more instances"
//  *Cause: The service does not exist or disabled on all database instances. The Oracle clusterware is down.
// *Action: Make sure that the Oracle clusterware is up and running; the service exists and enabled on at least one database instance.
/
1116, SERVICE_GETAVAIL_FAILED, "Failed to get available instances of service {0}"
//  *Cause: The service does not exist or the Oracle clusterware is down.
// *Action: Make sure that the Oracle clusterware is up and running and the service exists.
/
1117, SERVICE_EMPTY_PREF, "Failed to modify service {0}, the service should have at least one preferred instance"
//  *Cause: An attempt was made to remove all preferred instances of the service.
// *Action: Make sure that there is at least one instance provided in the service preferred instance list.
/
1118, SERVICE_MODIFY_CARD_FAILED, "Failed to set service {0} to {1} because it runs on more than one node"
//   *Cause: The service was running on more than one node.
//  *Action: Make sure that the service is not running or running on one node only.
/
1119, DBUNIQUE_NAME_UNIQUENESS_FAILED, "Failed to create database {0} because the database unique name matches that of database {1} in the first 8 characters"
//   *Cause:  The database unique name is not unique in the first 8 characters. It is a requirement because the name is used to generate ORACLE_SID.
//  *Action: Ensure that the name supplied to either DBCA or srvctl during database creation is sufficiently unique, and retry the command.
/
1120, DB_RES_NOT_EXIST, "The resource for database {0} could not be found."
//  *Cause: The resource for the specified database name could not be found. Either the database name was misspelled or the database has not been created.
// *Action: Correct the database name spelling or use the 'srvctl add database' command to create the database configuration.
/
1121, EXISTING_DB_CENTRIC_CONFIG_DB, "Specified server pool {0} for {1} is already hosting an administrator-managed configuration for database(s) {2}"
//  *Cause: Server pool is hosting administrator-managed databases.
// *Action: Specify a server pool that is not hosting an administrator-managed database.
/
1122, EXISTING_DB_CENTRIC_CONFIG_SERV, "Specified server pool {0} for {1} is already hosting an administrator-managed configuration for service(s) {2}"
//  *Cause: Server pool is hosting administrator-managed services.
// *Action: Specify a server pool that is not hosting an administrator-managed service.
/
1123, DB_ACFS_RESOURCE_NOT_EXIST, "Oracle Clusterware resource does not exist for ACFS filesystem of volume device {0}. A filesystem resource is required for the filesystem containing Oracle home {1}."
//  *Cause: ACFS filesystem resource does not exist for the database which has its Oracle home stored on an ACFS filesystem. An ACFS filesystem resource is required for database homes on ACFS filesystems so that Oracle Clusterware can track the database's dependency on the filesystem. Database homes cannot be mounted via the ACFS registry.
// *Action: Add the ACFS filesystem resource with 'srvctl add filesystem'.
/
1124, STOP_DB_FAILED, "Failed to stop database {0} and its services"
// *Cause: Attempt to stop the database has failed.
// *Action: Ensure that user attempting to stop the database has execute privileges on the database resource. Also, review the accompanying error messages for details about failure to stop database. Retry after resolving those issues or contact Oracle Support Services.
/
1125, ACFS_CREATE_STOPDEP_FAILED, "Failed to create dependency from database {0} to its Oracle home {1} that is located on the ASM cluster filesystem"
//  *Cause:  An attempt to modify the database resource to include a stop dependency on the ASM cluster filesystem for the database's Oracle home failed.
// *Action:  Make sure that the asm instance is running; the ACFS driver exists in the driver directory and the underlying ACFS devices are accessible.
/
1126, REMOVE_PREF_INSTANCE, "Instance {0} cannot be removed because it is the only preferred instance for service(s) {1} for database {2}"
//   *Cause: An attempt was made to remove the instance which is the only preferred instance for specified services.
//  *Action: Make sure that specified services have more than one preferred instance or modify services to not have the instance as a preferred instance.
/
1127, THE_ONLY_PREF_INSTANCE_FAILED, "Failed to verify if instance {0} is the only preferred instance for any service"
//   *Cause: An attempt to verify if the instance is the only preferred instance for any service failed.
//  *Action: Make sure that the Oracle clusterware is up and running. Also, review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1128, REMOVE_SERVICES_FAILED, "Failed to remove all services configured for database {0}"
//   *Cause: An attempt to remove all services configured for database.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1129, START_NAMED_INST_FAILED, "Failed to start instance {0} for database {1}"
//   *Cause: An attempt to start an instance with the specified name failed.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1130, CONVERT_DB_FAILED, "Failed to convert administrator-managed database {0} into a policy-managed database to use server pool {1}"
//   *Cause: An attempt to convert the database from an administrator-managed configuration to a policy-managed configuration failed.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1131, STOP_DB_ON_NODES_FAILED, "Failed to stop database {0} and its services on node(s) {1}"
// *Cause: Attempt to stop the database on  given nodes has failed.
// *Action: Ensure that user attempting to stop the database has execute privileges on the database resource. Also, review the accompanying error messages for details about failure to stop database. Retry after resolving those issues or contact Oracle Support Services.
/
1132, DB_START_WRONG_SERVICES, "Database {0} doesn't have defined service(s) {1}"
//   *Cause: An attempt to start/stop services on the given database failed.
//  *Action: Make sure that every service you want to start or stop is configured for the given database.
/
1133, DB_START_SERVICES_FAILED, "Failed to start services for database {0}"
//   *Cause: An attempt to start given services on the given database failed because those service(s) are not configured for the database.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
