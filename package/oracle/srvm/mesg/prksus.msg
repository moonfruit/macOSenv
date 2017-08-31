// Copyright (c) Oracle Corporation 2008.  All Rights Reserved.
//
// NAME
//    PrksMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     rxkumar     11/07/06  - fix bug5634145
//     rxkumar     04/27/06 -  fix bug4871662 
//     rxkumar     08/03/04 - add ASM_INSTANCE_UPDATE_ORAHOME_FAILED 
//     rxkumar     08/02/04 - add GET_ASM_NODES_FAILED 
//     dliu        04/19/04 - 
//     rxkumar     04/19/04 - add ASM_INSTANCE_UPDATE_SPFILE_FAILED
//     rxkumar     06/26/03 - fix typo in start msg
//     rxkumar     06/11/03 - add ASM_INSTANCE_CONFIG_NOT_EXIST
//     rxkumar     06/10/03 - add ASM_INSTANCE_GET_OHOME_FAILED
//     rxkumar     06/09/03 - add ASM configuration error messages
//     rxkumar     06/02/03 - add start/stop messages
//     rxkumar     05/30/03 - add modify messages
//     rxkumar     05/28/03 - Creation
//  */
// 
// /**
//  *  @version 1.0
//  *  @author  rxkumar
//  *  @since   10.1.0.1.0
//  */
// PACKAGE=package oracle.ops.mgmt.asm.resource;
// IMPORT=import java.util.ListResourceBundle;
// MSGIDTYPE=interface
1000, ASM_INSTANCE_EXISTS, "ASM instance \"{0}\" already exists on node \"{1}\""
//  *Cause: 
// *Action: 
/
1001, ASM_INSTANCE_NOT_EXISTS, "ASM instance \"{0}\" does not exist on node \"{1}\""
//  *Cause: 
// *Action: 
/
1002, ASM_INSTANCE_PROFILE_FAILED, "Failed to create CRS profile for ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1003, ASM_INSTANCE_REGISTER_FAILED, "Failed to register CRS resource for ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1004, ASM_UNREGISTER_FAILED, "Failed to unregister CRS resource for ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1005, ASM_INSTANCE_CREATE_FAILED, "Failed to create CRS resource for ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1006, ASM_INSTANCE_RUNNING, "ASM instance \"{0}\" is already running on node \"{1}\""
//  *Cause: 
// *Action: 
/
1007, ASM_INSTANCE_STILL_RUNNING, "ASM instance \"{0}\" is still running on node \"{1}\""
//  *Cause: 
// *Action: 
/
1008, ASM_INSTANCE_NOT_RUNNING, "ASM instance \"{0}\" is not running on node \"{1}\""
//  *Cause: 
// *Action: 
/
1009, ASM_INSTANCE_START_FAILED, "Failed to start ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1010, ASM_INSTANCES_START_FAILED, "Failed to start ASM instances \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1011, ASM_INSTANCE_STAT_FAILED, "Failed to check status of ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1012, ASM_INSTANCE_STOP_FAILED, "Failed to stop ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1013, ASM_INSTANCES_STOP_FAILED, "Failed to stop ASM instances \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1014, ASM_INSTANCE_ENABLE_FAILED, "Failed to enable CRS resource for ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1015, ASM_INSTANCES_ENABLE_FAILED, "Failed to enable CRS resources for ASM instances \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1016, ASM_INSTANCE_DISABLE_FAILED, "Failed to disable CRS resource for ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1017, ASM_INSTANCES_DISABLE_FAILED, "Failed to disable CRS resources for ASM instances \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1018, ASM_CONFIG_FAILED, "Failed to retrieve configuration for ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1019, ASM_CREATE_DEP_FAILED_DUE_TO_NODE, "Cannot create CRS dependency between database instance \"{0}\" configured on node \"{1}\" and ASM instance \"{2}\" configured on node \"{3}\""
//  *Cause: 
// *Action: 
/
1020, ASM_CREATE_DEP_FAILED, "Failed to create CRS dependency between database instance \"{0}\" and ASM instance \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1021, ASM_REMOVE_DEP_FAILED, "Failed to remove CRS dependency between database instance \"{0}\" and ASM instance \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1022, ASM_REMOVE_DEPS_FAILED, "Failed to remove CRS dependency between database instance \"{0}\" and ASM instances \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1023, ASM_INSTANCE_REMOVE_FAILED, "Failed to remove CRS resource for ASM instance \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1024, ASM_INSTANCE_START_INVALID_MODE, "Mode \"{0}\" is not valid mode for ASM instance startup"
//  *Cause: 
// *Action: 
/
1025, ASM_INSTANCE_STOP_INVALID_MODE, "Mode \"{0}\" is not valid mode for ASM instance shutdown"
//  *Cause: 
// *Action: 
/
1026, ASM_NODE_CONFIG_NOT_EXISTS, "ASM Configuration for node \"{0}\" does not exist in cluster registry."
//  *Cause: 
// *Action: 
/
1027, ASM_INSTANCE_CONFIG_NOT_EXISTS, "Configuration for ASM instance \"{0}\" does not exist in cluster registry."
//  *Cause: 
// *Action: 
/
1028, ASM_INSTANCE_ON_NODE_NOT_EXISTS, "Configuration for ASM instance \"{0}\" on node \"{1}\" does not exist in cluster registry."
//  *Cause: 
// *Action: 
/
1029, ASM_INSTANCE_CONFIG_VERSION_MISMATCH, "Client version \"{0}\" is not compatible with ASM instance configuration version \"{1}\" in cluster registry."
//  *Cause: 
// *Action: 
/
1030, ASM_INSTANCE_ADD_CONFIG_FAILED, "Failed to add configuration for ASM instance \"{0}\" on node \"{1}\" in cluster registry, [{2}]"
//  *Cause: 
// *Action: 
/
1031, ASM_INSTANCE_GET_CONFIG_FAILED, "Failed to retrieve configuration for ASM instance \"{0}\" on node \"{1}\" from cluster registry, [{2}]"
//  *Cause: 
// *Action: 
/
1032, ASM_INSTANCE_MODIFY_CONFIG_FAILED, "Failed to modify configuration for ASM instance \"{0}\" on node \"{1}\" in cluster registry, [{2}]"
//  *Cause: 
// *Action: 
/
1033, ASM_INSTANCE_REMOVE_CONFIG_FAILED, "Failed to remove configuration for ASM instance \"{0}\" on node \"{1}\" from cluster registry, [{2}]"
//  *Cause: 
// *Action: 
/
1034, ASM_INSTANCES_REMOVE_CONFIG_FAILED, "Failed to remove configuration for ASM instances \"{0}\" on node \"{1}\" from cluster registry, [{2}]"
//  *Cause: 
// *Action: 
/
1035, ASM_INSTANCE_GET_OHOME_FAILED, "Failed to retrieve ORACLE_HOME value for ASM instance \"{0}\" on node \"{1}\" from cluster registry, [{2}]"
//  *Cause: 
// *Action: 
/
1036, ASM_INSTANCE_NODE_VIP_NOT_EXISTS, "Dummy message line"
//  *Cause: 
// *Action: 
/
1037, ASM_INSTANCE_NODE_VIP_CHECK_FAILED, "Dummy message line"
//  *Cause: 
// *Action: 
/
1038, ASM_INSTANCE_UPDATE_SPFILE_FAILED, "Failed to configure server parameter file \"{0}\" for ASM instance \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1039, GET_ASM_NODES_FAILED, "Failed to retrieve ASM configured node names, [{0}]"
//  *Cause: 
// *Action: 
/
1040, ASM_INSTANCE_UPDATE_ORAHOME_FAILED, "Failed to update ORACLE_HOME \"{0}\" for ASM instance \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1041, ASM_INSTANCE_NAME_INVALID, "ASM instance name \"{0}\" is invalid, it must start with \"{1}\" character."
//  *Cause: 
// *Action: 
/
