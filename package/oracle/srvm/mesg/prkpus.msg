// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrkpMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//       yizhang   06/17/09 - fix action for message STOP_LISTENER
//       yizhang   05/28/09 - fix messages
//       rxkumar   04/06/09 - add GET_DB_CONFIG_FAILED
//       rajkris   10/04/06 - Bug fix 4675276
//       rxkumar   08/01/05 - fix bug4531124 
//       rxkumar   05/10/05 - add MAX_SVC_LIMIT 
//       rxkumar   04/25/05 - fix bug4322821 
//       rxkumar   12/27/04 - fix bug4091940
//       rxkumar   11/29/04 - fix bug4021341 
//       dliu      10/20/04 - add SERV_START_DB_DISABLED 
//       rxkumar   06/17/04 - add ERROR_PROFILE_ATTR_VALUE 
//       rxkumar   02/20/04 - add NULL_INSTANCE_NAME 
//       dliu      06/25/03 - change mesg for critical standby
//       dliu      05/12/03 - add SERV_LAST_PREF
//       dliu      02/12/03 - add SERV_MOD_REL_FAIL
//       dliu      01/28/03 - add CREATE_DB_EXISTS
//       dliu      01/20/03 - add SERV_CREATE_DOMAIN_CONFLICT
//       dliu      01/08/03 - add INVALID_SERV_NAME
//       dliu      12/26/02 - mesg for critical standby support
//       dliu      01/03/03 - add DOMAIN_CONFLICT_SERVNAMES
//       rdasari   10/29/02 - add DB_MOD_FAIL message
//       dliu      11/01/02 - new mesg for service start/stop
//       rdasari   08/09/02 - add SERV_RM_FAIL message
//       mhbauer   08/13/02 - edit messages
//       jtellez   08/12/02 - Message Improvements
//       rdasari   07/18/02 - add service env related messages
//       rdasari   04/17/02 - adding resource enable/disable failed messages.
//       rxkumar   04/09/02 - fix RELOAD_LISTENER_N.
//       rxkumar   03/22/02 - add RELOAD_LISTENER.
//       dliu      04/04/02 - add SERV_MOD_FAIL
//       rxkumar   11/16/01 - add NULL_RESULT msg.
//       rdasari   10/31/01 - .
//       dliu      10/26/01 - add mesgs for create db.
//       dliu      09/07/01 - .
//       dliu      09/06/01 - .
//       dliu      09/05/01 - add mesgs for Service not existing.
//       dliu      08/30/01 - .
//       dliu      08/23/01 - huron mesgs.
//       surchatt  02/08/01 - changing for OPS to ORAC name change
//       rxkumar   09/07/00 - define UNDEFINED_ENV
//       rxkumar   08/17/00 - add environment related error messages.
//       jcreight  05/30/00 - 2nd try at fixing listener status message
//       jcreight  05/30/00 - Fix listener status message
//       surchatt  05/25/00 - adding check listener related error messages
//       rxkumar   05/23/00 - fix compilation error.
//       surchatt  05/19/00 - Adding message for getListener operation
//       surchatt  05/16/00 - Adding Listener related messages
//       jcreight  05/11/00 - Database messages
//  */
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/mgmt/resources/PrkpMsg.msg /main/4 2009/06/18 11:06:08 yizhang Exp $
//  *  @author  jcreight
//  *  @since   1.0
//  */
// 
// PACKAGE=package oracle.ops.mgmt.resources;
// MSGIDTYPE=interface
1000, NO_CONFIG, "Cannot retrive configuration for cluster database {0}"
//  *Cause: The cluster database configuration could not be retrieved from the repository. This could occur either because the database was never registered, or because the repository itself had not been created.
// *Action: Check if the database has been configured by printing a list of all cluster databases using 'srvctl config'. If the repostitory has not been created, use 'srvconfig -init' to create it.
/
1001, START_INST, "Error starting database instance {0} on node {1}"
//  *Cause: The instance could not be started using the SQL*Plus startup command.
// *Action: Try starting the named instance manually using SQL*Plus to see why it failed and examine the database instance alert log.
/
1002, STOP_INST, "Error stopping database instance {0} on node {1}"
//  *Cause: The SQL*Plus shutdown command returned an error while stopping the instance.
// *Action:  Try stopping the named instance manually using SQL*Plus to see why it failed and examine the database instance alert log.
/
1003, PARTIAL_START, "Startup operation partially failed"
//  *Cause: Some components of the cluster database could not be started.
// *Action: Check the accompanying error messages for details.
/
1004, PARTIAL_STOP, "Shutdown operation partially failed"
//  *Cause: Some components of the cluster database reported errors while being stopped.
// *Action: Check the accompanying error messages for details.
/
1005, START_OPS, "Failed to start up cluster database {0}"
//  *Cause: The cluster database could not be started.
// *Action: Check the accompanying error messages for details.
/
1006, STOP_OPS, "Failed to shut down cluster database {0}"
//  *Cause: The cluster database reported errors while being shut down.
// *Action: Check the accompanying error messages for details.
/
1007, START_LISTENER, "Failed to start all the listeners associated with all the instances of cluster database {0}"
//  *Cause: Internal error.
// *Action: Contact your customer support representative.
/
1008, START_LISTENER_I, "Failed to start listeners associated with instance {0} on node {1}"
//  *Cause: Internal error.
// *Action: Contact your customer support representative.
/
1009, STOP_LISTENER, "Failed to stop all the listeners associated with all the instances of cluster database {0}"
//  *Cause: Either the listener name associated with an instance could not be determined, or 'lsnrctl stop' failed for a listener.
// *Action:  Verify that listener.ora contains a SID_LIST entry for each instance of the named database, and that the 'lsnrctl stop' command succeeds for those listeners.
/
1010, STOP_LISTENER_I, "Failed to stop all the listeners associated with instance {0} on node {1}"
//  *Cause: Either the listener name associated with an instance could not be determined, or 'lsnrctl stop' failed for a listener.
// *Action: Verify that listener.ora contains a SID_LIST entry for each instance of the named database, and that the 'lsnrctl stop' command succeeds for those listeners.
/
1011, GET_LISTENER, "Failed to get all the listeners associated with instance {0} on node {1}"
//  *Cause: The listener name associated with an instance could not be determined.
// *Action: Ensure that listener.ora contains a SID_LIST entry for the named instance.
/
1012, INVALID_ENV, "Invalid environment variable {0} setting for cluster database {1}"
//  *Cause: The argument to the -t option was not of the form <name>=<value> or it contained special characters.
// *Action: Ensure that the -t option has an argument of the form <name>=<value>.  Enclose the argument to the -t flag in quotes.
/
1013, UNDEFINED_ENV_OPS, "{0}: undefined environment variable for cluster database {1}"
//  *Cause: The named environment variable is not defined for the named cluster database
// *Action: Set a value for the variable with 'srvctl setenv'.
/
1014, UNDEFINED_ENV_INST, "{0}: undefined environment variable for instance {1} of cluster database {2}"
//  *Cause: The named environment variable is not defined for the given instance
// *Action: Set a value for the variable with 'srvctl setenv'.
/
1015, UNDEFINED_ENV, "{0}: undefined environment variable"
//  *Cause: The named environment variable is not defined
// *Action: Set a value for the named environment variable with 'srvctl setenv'.
/
1016, DB_ALREADY_ENABLED, "Database {0} already enabled."
//  *Cause: 
// *Action: 
/
1017, INST_ALREADY_ENABLED, "Instance {0} already enabled."
//  *Cause: 
// *Action: 
/
1018, SERV_ALREADY_ENABLED, "Service {0} already enabled."
//  *Cause: 
// *Action: 
/
1019, DB_ALREADY_DISABLED, "Database {0} already disabled."
//  *Cause: 
// *Action: 
/
1020, INST_ALREADY_DISABLED, "Instance {0} already disabled."
//  *Cause: 
// *Action: 
/
1021, SERV_ALREADY_DISABLED, "Service {0} already disabled."
//  *Cause: 
// *Action: 
/
1022, DB_STILL_RUNNING, "The database {0} is still running."
//  *Cause: 
// *Action: 
/
1023, INST_STILL_RUNNING, "The instance {0} is still running."
//  *Cause: 
// *Action: 
/
1024, SERV_STILL_RUNNING, "The service {0} is still running."
//  *Cause: 
// *Action: 
/
1025, SERV_NOT_EXIST, "The service {0} does not exist."
//  *Cause: 
// *Action: 
/
1026, NO_INST, "No instance found for database {0}."
//  *Cause: 
// *Action: 
/
1027, INST_NOT_FOUND, "Instance {0} is not found for database {1}."
//  *Cause: 
// *Action: 
/
1028, SERV_NO_PREF_INST, "No preferred instance(s) for service {0}."
//  *Cause: 
// *Action: 
/
1029, SERV_REG_FAIL, "Failed to register the service {0}."
//  *Cause: 
// *Action: 
/
1030, SERV_START_FAIL, "Failed to start the service {0}."
//  *Cause: 
// *Action: 
/
1031, SERV_STOP_FAIL, "Failed to stop the service {0}."
//  *Cause: 
// *Action: 
/
1032, SERV_START_DISABLED, "Cannot start the disabled service {0}."
//  *Cause: 
// *Action: 
/
1033, SERV_RELOCATE_FAIL, "Cannot relocate service {0} from instance {1} to instance {2}."
//  *Cause: 
// *Action: 
/
1034, UNDEFINED_ENV_NODE, "{0}: undefined environment variable for node {1}."
//  *Cause: 
// *Action: 
/
1035, INVALID_ENV_NODE, "Invalid environment variable {0} setting for node {1}."
//  *Cause: 
// *Action: 
/
1036, UNREG_FAIL, "Failed to unregister HA resource {0}."
//  *Cause: 
// *Action: 
/
1037, CREATE_DB_FAIL, "Failed to create cluster database {0}."
//  *Cause: 
// *Action: 
/
1038, INVALID_SERV_INSTANCE, "Invalid instance {0} specified for the Service {1}."
//  *Cause: 
// *Action: 
/
1039, NULL_RESULT, "operation result is null"
//  *Cause: 
// *Action: 
/
1040, CHECK_LISTENER_I, "Failed to get status of the listeners associated with instance {0} on node{1}"
//  *Cause: 
// *Action: 
/
1041, RELOAD_LISTENER, "Failed to reload all the listeners associated with cluster database {0}"
//  *Cause: 
// *Action: 
/
1042, RELOAD_LISTENER_I, "Failed to reload all the listeners associated with instance {0} on node{1}"
//  *Cause: 
// *Action: 
/
1043, RELOAD_LISTENER_N, "Failed to reload listeners on node {0}"
//  *Cause: 
// *Action: 
/
1044, DB_ENABLE_FAILED, "Failed to enable the database {0}."
//  *Cause: 
// *Action: 
/
1045, DB_DISABLE_FAILED, "Failed to disable the database {0}."
//  *Cause: 
// *Action: 
/
1046, INST_ENABLE_FAILED, "Failed to enable the instance {0}."
//  *Cause: 
// *Action: 
/
1047, INST_DISABLE_FAILED, "Failed to disable the instance {0}."
//  *Cause: 
// *Action: 
/
1048, SERV_MOD_FAIL, "Failed to change configuration for service {0}."
//  *Cause: 
// *Action: 
/
1049, UNDEFINED_ENV_SERV, "{0}: undefined environment variable for service {1} of cluster database {2}"
//  *Cause: 
// *Action: 
/
1050, SERV_RM_FAIL, "Failed to remove the service {0}."
//  *Cause: 
// *Action: 
/
1051, SERV_MEMB_RM_FAIL, "Failed to remove the service {0} on instance {1}."
//  *Cause: 
// *Action: 
/
1052, SERV_ENABLE_FAILED, "Failed to enable the service {0}."
//  *Cause: 
// *Action: 
/
1053, SERV_DISABLE_FAILED, "Failed to disable the service {0}."
//  *Cause: 
// *Action: 
/
1054, SERV_MEMB_ENABLE_FAIL, "Failed to enable the service {0} on instance {1}."
//  *Cause: 
// *Action: 
/
1055, SERV_MEMB_DISABLE_FAIL, "Failed to disable the service {0} on instance {1}."
//  *Cause: 
// *Action: 
/
1056, RESOURCE_STAT_FAIL, "Failed to get the status of the resource {0}."
//  *Cause: 
// *Action: 
/
1057, SERV_SETENV_FAIL, "Failed to set the environment for service {0}."
//  *Cause: 
// *Action: 
/
1058, SERV_UNSETENV_FAIL, "Failed to unset the environment for service {0}."
//  *Cause: 
// *Action: 
/
1059, SERV_GETENV_FAIL, "Failed to get the environment for service {0}."
//  *Cause: 
// *Action: 
/
1060, HAS_HOME_NULL, "Failed to get CRS home."
//  *Cause: 
// *Action: 
/
1061, DB_MOD_FAIL, "Failed to modify the database {0}. "
//  *Cause: 
// *Action: 
/
1062, SERV_ALREADY_RUNNING, "Service {0} is already running."
//  *Cause: 
// *Action: 
/
1063, SERV_ALREADY_STOPPED, "Service {0} is already stopped."
//  *Cause: 
// *Action: 
/
1064, SERV_MEMBER_ALREADY_RUNNING, "Service {0} is already running on instance {1}."
//  *Cause: 
// *Action: 
/
1065, SERV_MEMBER_ALREADY_STOPPED, "Service {0} is already stopped on instance {1}."
//  *Cause: 
// *Action: 
/
1066, SERV_NOT_AVAIL, "Instance {0} is not an available instance for service {1}."
//  *Cause: 
// *Action: 
/
1067, SERV_LAST_AVAIL, "Instance {0} is the last available instance for service {1}. Try modify service instead."
//  *Cause: 
// *Action: 
/
1068, DONT_STOP_CRITICAL_STANDBY, "Cannot stop the critical instance {0} in critical standby database {1} because it would result in a shutdown of the primary database."
//  *Cause: 
// *Action: 
/
1069, DOMAIN_CONFLICT_SERVNAMES, "Failed to change domain of the database {0} to {1}, because this domain name is already used by service {2} configured under the database."
//  *Cause: 
// *Action: 
/
1070, INVALID_SERV_NAME, "Service name {0} contains illegal characters."
//  *Cause: 
// *Action: 
/
1071, INVALID_SP_NAME, "Database unique name or instance name {0} contains illegal characters {1}."
//  *Cause: 
// *Action: 
/
1072, SERV_CREATE_DOMAIN_CONFLICT, "Failed to create service {0} for database {1}, because the specified service domain name is the same as the database domain {2}."
//  *Cause: 
// *Action: 
/
1073, CREATE_DB_EXISTS, "Cannot create database {0} because a database named {1} already exists."
//  *Cause: 
// *Action: 
/
1074, SERV_MOD_REL_FAIL, "Failed to relocate a service resource to instance {0} during modifying service configuration for service {1}."
//  *Cause: 
// *Action: 
/
1075, SERV_LAST_PREF, "Instance {0} is the last preferred instance for service {1}."
//  *Cause: 
// *Action: 
/
1076, NULL_INSTANCE_NAME, "Instance name passed to the method is null"
//  *Cause: 
// *Action: 
/
1077, NULL_ORACLE_HOME, "Oracle home is null for the cluster database {0}"
//  *Cause: 
// *Action: 
/
1078, ERROR_PROFILE_ATTR_VALUE, "Failed to retrieve \"{0}\" attribute value from \"{1}\" file, {2}"
//  *Cause: 
// *Action: 
/
1079, SERV_START_DB_DISABLED, "Cannot start service {0} on disabled database {1}."
//  *Cause: 
// *Action: 
/
1080, SERV_START_INST_DISABLED, "Cannot start service {0} on disabled instance {1}."
//  *Cause: 
// *Action: 
/
1081, NULL_DB_NAME, "Database name passed to the method is null"
//  *Cause: 
// *Action: 
/
1082, NO_SUCH_INSTANCE, "Instance \"{0}\" does not exist in database \"{1}\"."
//  *Cause: 
// *Action: 
/
1083, SERV_EXISTS, "The service {0} already exists."
//  *Cause: 
// *Action: 
/
1084, MAX_SVC_LIMIT, "Database \"{0}\" cannot have more than \"{1}\" services."
//  *Cause: 
// *Action: 
/
1085, ERR_DB_DEFAULT_SVC, "Service name cannot be same as the database default service name \"{0}\"."
//  *Cause: 
// *Action: 
/
1086, SERV_NO_MEMBER_TO_START, "Can not find a service member to start for service {0}."
//  *Cause: 
// *Action: 
/
1087, INVALID_SERV_OPTIONS, "{0} is specified as both preferred and available instance lists for service {1}"
//  *Cause: 
// *Action: 
/
1088, GET_DB_CONFIG_FAILED, "Failed to retrieve configuration of cluster database {0}"
//  *Cause: Attempt to retrieve configuration of cluster database failed. This failure is most likely due to user incorrectly using a tool, such as SRVCTL, that is of different version than that of database's configuration. 
// *Action: If error is due to user using SRVCTL that is of different version than than of the database's, then run SRVCTL tool from the ORACLE_HOME reported in the error message. Otherwise, contact Oracle support services.
/
