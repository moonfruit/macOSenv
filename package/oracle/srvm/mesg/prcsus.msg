// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCsMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     06/04/09 - Add Action and Cause for messages
//     yizhang     05/26/09 - fix messages
//     agridnev    06/03/09 - fixed EVAL_SRVGRP_CREATION_FAILED message
//     agridnev    05/28/09 - added message for evaluateServerGroupCreation
//     yizhang     04/30/09 - fix bugs to delete unwanted trailing characters
//     yizhang     04/27/09 - fix bug 8448135
//     yizhang     04/22/09 - fix bugs for unwanted trailing characters
//     rwessman    03/13/09 - Added GNS_NOT_EXIST.
//     rxkumar     01/16/09 - fix bug7674918
//     agridnev    01/02/09 - performed review based changes
//     rxkumar     12/31/08 - fix bug7677051
//     agridnev    12/23/08 - added message for evaluateServerPoolCreation()
//     rxkumar     11/05/08 - fix bug-7534439
//     rxkumar     10/10/08 - add SP_GET_RUNNING_DB_INSTS_FAILED, ER bug-7520072
//     rxkumar     09/15/08 - fix bug7394683
//     rxkumar     08/27/08 - add RELOCATE_SERVERS_FAILED, bug7356633
//     rxkumar     08/04/08 - add SP_GET_CHILDREN_FAILED
//     rwessman    08/08/08 - 
//     rxkumar     07/22/08 - fix bug7142054: sg->sp
//     rwessman    06/20/08 - Added GNS internal errors.
//     yizhang     04/25/08 - Add SCAN_VIP_ALREADY_CREATED, remove
//                            SCAN_NAME_MISMATCH, SCAN_VIP_NET_MISMATCH,
//                            SCAN_VIP_NUM_MISMATCH
//     rxkumar     04/17/08 - move out msgs to PrCcMsg
//     spavan      04/10/08 - Fix cause/action field
//     yizhang     03/21/08 - Define SCAN_LSNR_ONE_TCP_PORT
//     rxkumar     03/25/08 - add ServerPool & ServerGroup specific msgs
//     rxkumar     03/19/08 - add NO_CRS_ADMIN_ROLE
//     rxkumar     03/18/08 - add SG_NOT_HOST_DB
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file PrCsMsg.java
//     rwessman    03/21/08 - Added GNS messages.
//     yizhang     03/04/08 - Change INVALID_SG_TYPE to INVALID_BUILTIN_SG
//     yizhang     02/26/08 - Fix bug 6834900
//     rxkumar     02/06/08 - add SVIP_FOR_SLSNR_NOT_FOUND
//     rxkumar     02/04/08 - add SCAN_LSNR_MODIFY_FAILED
//     yizhang     01/10/08 - Add SCAN_MODIFY_FAILED
//     yizhang     12/24/07 - Add SCAN_LSNR_NAME_MISMATCH, SCAN_LSNR_PORT_MISMATCH
//     rxkumar     12/13/07 - use SCAN
//     sowong      11/15/07 - add SP_NOT_EXISTS_CLUSTER
//     yizhang     10/19/07 - Add messages for SCAN VIP and SCAN Listener
//     rxkumar     04/12/07 - msgs for bug5981762
//     rxkumar     02/13/07 - add SP_LOOKUP_FAILED
//     rxkumar     12/26/06 - add SCAN msgs
//     rxkumar     12/11/06 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
// IMPORT=import oracle.ops.mgmt.nls.MessageKey;
1000, GET_ENABLED_FAILED, "Failed to get enabled status of {0}"
//  *Cause: An attempt to check whether a server is enabled failed.
// *Action: Examine the accompanying error messages for details.
/
1001, ENABLE_FAILED, "Failed to enable {0}"
//  *Cause: An attempt to enable the specified server failed.
// *Action: Examine the accompanying error messages for details.
/
1002, DISABLE_FAILED, "Failed to disable {0}"
//  *Cause: An attempt to disable the specified server failed.
// *Action: Examine the accompanying error messages for details.
/
1005, SVR_CREATE_FAILED, "Failed to create server {0} "
//  *Cause: An attempt to create the specified server failed.
// *Action: Examine the accompanying error messages for details.
/
1006, SVR_GET_FAILED, "Failed to get server for node {0} "
//  *Cause: An attempt to get server for the specified node failed.
// *Action: Examine the accompanying error messages for details.
/
1007, SP_ALREADY_EXISTS, "Server pool {0} already exists"
//  *Cause: The specified server pool already exists.
// *Action: Examine the accompanying error messages for details.
/
1008, SP_NOT_EXISTS, "Server pool {0} does not exist"
//  *Cause: The specified server pool does not exist.
// *Action: Use the srvctl command to create server pool.
/
1009, SP_CREATE_FAILED, "Failed to create server pool {0} "
//  *Cause: An attempt to create specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1010, SP_GET_FAILED, "Failed to get {0} of server pool {1}"
//  *Cause: An attempt to get the attribute value of the specified server pool failed. 
// *Action: Examine the accompanying error messages for details.
/
1011, SP_MODIFY_FAILED, "Failed to modify server pool {0}"
//  *Cause: An attempt to modify the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1012, SP_REMOVE_FAILED, "Failed to remove server pool {0}"
//  *Cause: Failed to unregister server pool. This message is followed by the reason for failure.
// *Action: Retry after resolving the issue reported in the failure message.
/
1013, SP_LOOKUP_FAILED, "Failed to look up server pool {0}"
//  *Cause: An attempt to get the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1014, SERVER_EXISTS_IN_SP, "Server {0} is already part of server pool {1}"
//  *Cause: An attempt to add the server as a candidate for the specified server pool failed because the server is already in the pool's SERVER_NAME attribute.
// *Action: No action is needed.
/
1015, SERVER_NOT_EXISTS_IN_SP, "Server {0} is not part of server pool {1}"
//  *Cause: An attempt to remove the server from the SERVER_NAMES attribute of the server pool failed because the specified server is not in the pool's SERVER_NAME attribute.
// *Action: Add the server to the server pool.
/
1016, SCAN_LOOKUP_FAILED, "Failed to resolve Single Client Access Name {0}"
//  *Cause: An attempt to resolve specified Single Client Access Name to a list of IP addresses failed because Single Client Access Name could not be resolved in DNS using nslookup or using other lookup methods.
// *Action: Check whether the specified Single Client Access Name is correct. Review the underlying error messages that provide the details of which resource failed to resolve. Check the cause and action for the individual error. If Single Client Access Name should be resolved in DNS, check the configuration of Single Client Access Name in DNS.
/
1017, SCAN_CREATE_FAILED, "Failed to configure Single Client Access Name {0}"
//  *Cause: An attempt to add cluster configuration for Single Client Access Name failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to create. Check the cause and action for the individual resource creation failure.
/
1018, SCAN_LSNR_CREATE_FAILED, "Failed to add cluster configuration for Single Client Access Name listener {0}"
//  *Cause: An attempt to configure Single Client Access Name listener failed because endpoints were not specified correctly or other reasons. 
// *Action: Review the underlying error messages that provide the details of which resources failed to create. Check the cause and action for the individual resource creation failure. If the endpoints were not specified correctly, correct endpoints. 
/
1019, SCAN_LSNR_REMOVE_FAILED, "Failed to remove the configuration for Single Client Access Name listener {0}"
//  *Cause: An attempt to remove the configuration of Single Client Access Name listener failed because other resources depended on it or other reasons.
// *Action: Review the underlying error messages that provide the details of which resources failed to remove. Stop Single Client Access Name listener resource before removing it. Can consider using force flag to remove Single Client Access Name listener resources if no other resources depend on it.
/
1020, SCAN_ENABLE_FAILED, "Failed to enable Single Client Access Name resources {0}"
//  *Cause: An attempt to enable Single Client Access Name resources failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to enable. Check the cause and action for the individual resource creation failure.
/
1021, SCAN_DISABLE_FAILED, "Failed to disable Single Client Access Name resources {0}"
//  *Cause: An attempt to disable Single Client Access Name resources failed because current user did not have sufficient privileges to perform this operation or other reasons.
// *Action: Review the underlying error messages that provide the details of which resources failed to disable. Check the cause and action for the individual resource failure. Make sure that the user has root privileges on Linux/Unix's and Administrator on Windows.
/
1022, SCAN_START_FAILED, "Failed to start Single Client Access Name resources {0}"
//  *Cause: An attempt to start Single Client Access Name resources failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to start. 
/
1023, SCAN_STOP_FAILED, "Failed to stop Single Client Access Name resources {0}"
//  *Cause: An attempt to stop Single Client Access Name resources failed because Single Client Access Name listeners were not stopped/relocated or other reasons.
// *Action: Review the underlying error messages that provides the details of which resources failed to stop. Check the cause and action for the individual resource creation failure. Stop Single Client Access Name listeners first or use force flag to stop Single Client Access Name Virtual Internet Protocol(VIP) resources if no other resources depend on them.
/
1024, SCAN_REMOVE_FAILED, "Failed to remove Single Client Access Name Virtual Internet Protocol(VIP) resources {0}"
//  *Cause: Could not remove Single Client Access Name Virtual Internet Protocol(VIP) resources because the resources are running or Single Client Access Name listeners depend on or other reasons.
// *Action: Review the underlying error messages that provides the details of which resources failed to remove. Stop the Single Client Access Name VIPs and Single Client Access Name listeners, then remove Single Client Access Name listeners. Or use force flag to remove Single Client Access Name Virtual Internet Protocol(VIP) resources if no other resources depend on them.
/
1025, SCAN_VIPS_NOT_FOUND, "Could not find Single Client Access Name Virtual Internet Protocol(VIP) resources {0}"
//  *Cause: Could not find Single Client Access Name Virtual Internet Protocol(VIP) resources.
// *Action: Check the resource name and check the underlying error messages that provides the details of which resources failed to be found. 
/
1026, SCAN_LSNRS_NOT_FOUND, "Could not find Single Client Access Name listener resources {0}"
//  *Cause: An attempt to find Single Client Access Name listener resources failed.
// *Action: Check the resource name. Review the underlying error messages that provides the details of which resources failed to be found. 
/
1027, SCAN_LSNR_NOT_FOUND, "Could not find any Single Client Access Name listener with ordinal number {0}"
//  *Cause: Could not find the Single Client Access Name listener for specified ordinal number.
// *Action: Use 'srvctl config scan_listener' to check available ordinal number.  
/
1028, SCAN_LSNR_ALREADY_CREATED, "Single Client Access Name listeners already exist"
//  *Cause: Single Client Access Name listeners were already created.
// *Action: Use 'srvctl modify scan_listener' to modify attributes if needed.
/
1031, SCAN_LSNR_MODIFY_FAILED, "Failed to modify Single Client Access Name listeners using endpoints {0}"
//  *Cause: An attempt to modify Single Client Access Name listeners failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to modify. Resolve the reported problem and retry.
/
1032, NO_SP_FOUND, "No server pool was found that matches the query {0}"
//  *Cause: An attempt to find server pools that match the given query found no matching server pool. 
// *Action: Either configure a server pool via 'srvctl add srvpool' command or modify existing a server pool via 'srvctl modify srvpool' command to match the query and retry the request.
/
1034, SCAN_MODIFY_FAILED, "Failed to modify Single Client Access Name {0}"
//  *Cause: Failed to modify the configuration of Single Client Access Name because the endpoints were not specified correctly or extra Single Client Access Name VIPs could not be removed or other reasons. 
// *Action: Review the underlying error messages that provides the details of which resources failed to modify. Resolve the reported problem and retry. If to modify the endpoints, specify correct endpoints. If to update the number of Single Client Access Name VIPs, stop the Single Client Access Name listeners that depend on.
/
1035, SCAN_LSNR_ONE_TCP_PORT, "Zero or Multiple TCP ports {0} are not allowed for SCAN Listener"
//  *Cause: Either no ports were specified, or more than one port was specified.
// *Action: Specify only one port number for TCP protocol for SCAN Listener.
/
1037, SCAN_VIP_ALREADY_CREATED, "Single Client Access Name VIPs already exist"
//  *Cause: An attempt was made to add SCAN VIPs when SCAN VIPs are already configured.  Only one SCAN per cluster can be configured.
// *Action: Remove existing SCAN and add new SCAN. Or modify scan to use new SCAN name or have the existing SCAN name to map to different SCAN VIPs.
/
1038, SVIP_FOR_SLSNR_NOT_FOUND, "Failed to find Single Client Access Name Virtual Internet Protocol(VIP) associated with listener {0}"
//  *Cause: Cannot find Single Client Access Name Virtual Internet Protocol(VIP) associated with the given listener. 
// *Action: Examine the accompanying error messages to determine how to respond.
/
1039, SLSNR_FOR_SVIP_NOT_FOUND, "Failed to find Single Client Access Name listener associated with the given Virtual Internet Protocol(VIP) {0}"
//  *Cause: Cannot find Single Client Access Name listener associated with the given Virtual Internet Protocol(VIP).
// *Action: Examine the accompanying error messages to determine how to respond.
1040, NO_CRS_ADMIN_ROLE, "User {0} does not have CRS administrator role"
//  *Cause: Specified user did not have CRS administrator role.
// *Action: Grant CRS administator role to the user by using 'crsctl add crs administrator -u <user_name>' command and retry.
/
1041, INVALID_BUILTIN_SP, "Invalid builtin server pool name {0}"
//  *Cause: The specified builtin server pool name is invalid.
// *Action: Provide a valid builtin server pool name. It can be Generic or Free.
/
1042, SP_NOT_HOSTING_DB, "Server pool {0} is not hosting any database currently"
// *Cause: No database could be found referencing the given server pool. 
// *Action: Create database configuration using 'srvctl add database ... -g <server_pool>' command and retry.
/
1043, SP_NOT_HOSTING_SVC, "Server pool {0} is not hosting any database service currently"
// *Cause: No service could be found referencing the given server pool. 
// *Action: Create service configuration using 'srvctl add service ... -g <server_pool>' command and retry.
/
1046, INVALID_NAME, "Name {0} is not valid"
// *Cause: Specified name was not valid.
// *Action: Specify a valid string name, and retry.
/
1047, INVALID_MIN_SIZE, "Minimum size of {0} is not valid"
// *Cause: Specified minimum size was not valid.
// *Action: Specify minimum size to be an integer equal to or greater than zero and less than the maximum size (other than -1), and retry.
/
1048, INVALID_MAX_SIZE, "Maximum size of {0} is not valid"
// *Cause: Specified maximum size was not valid.
// *Action: Specify maximum size to be an integer greater than or equal to -1 and retry.
/
1049, INVALID_IMPORTANCE, "Importance of {0} is not valid"
// *Cause: Specified importance was not valid.
// *Action: Specify importance value to be an integer greater than or equal to 0 and retry.
/
1050, GNS_VIP_NAME_MISMATCH, "Could not add GNS VIP {0} because another one with name {1} already exists"
//  *Cause: The name of the GNS VIP to be added matches one that already existed.
// *Action: Specify another name.
/
1051, GNS_VIP_NET_MISMATCH, "Could not add GNS VIP using network {0} because registered another one using network {1} already exists"
//  *Cause: The network specified for the GNS VIP to be added matches one that already existed.
// *Action: Specify another network.
/
1053, GNS_LOOKUP_FAILED, "failed to resolve address for Grid Naming Service VIP {0}:\n{1}"
//  *Cause: The address specified for the GNS VIP could not be resolved.
// *Action: Specify a valid address.
/
1054, GNS_CREATE_FAILED, "Failed to configure VIP for Grid Naming Service VIP {0}"
//  *Cause: The creation of the GNS VIP failed.
// *Action: Examine the accompanying error message for details.
/
1055, GNS_MODIFY_FAILED, "Failed to modify Grid Naming Service VIP {0}"
//  *Cause: The modification of the GNS VIP failed.
// *Action: Examine the accompanying error message for details.
/
1056, GNS_VIP_NOT_FOUND, "Could not find resources for Grid Naming Service Virtual Internet Protocol(VIP) {0}"
//  *Cause: The specified GNS VIP did not exist.
// *Action: Specify a valid GNS VIP name.
/
1057, GNS_INTERNAL_ERROR_NO_ATTRIBUTES, "INTERNAL ERROR: no attributes specified."
// *Cause: No attributes to modify GNS with were passed to a method.
// *Action: This is an internal error. Please contact Oracle Customer Support.
/
1058, GNS_INTERNAL_ERROR_BAD_QUERY_TYPE, "INTERNAL ERROR: unsupported query type: \"${0}\""
// *Cause: The type of query to be made to GNS is unrecognized.
// *Action: This is an internal error and should not be visible. Please contact
//          Oracle Customer Support.
/
1059, SP_GET_CHILDREN_FAILED, "Failed to get sub-server pools of server pool {0}"
//  *Cause: Failed to look up PARENT_POOLS attribute of server pools containing the given server pool name. Ensure that current user has read permissions on the given server pool and its sub-server pools.
// *Action: Grant read permissions on the given server pool and its sub-server pools.
/
1060, SP_RELOCATE_SERVERS_FAILED, "Failed to relocate servers {0} into server pool {1}"
//  *Cause:  Failed to relocate servers into the given server pool. This message may be accompanied by others providing additional details. A likely cause is violation of defined configuration attributes such as pool MIN_SIZE, SERVER_NAMES etc.
// *Action: If the problem stems from violating configuration attributes, either modify the attributes or reformulate the request. Otherwise, contact Oracle Support Services. 
/
/
1061, SP_GET_RUNNING_DB_INSTS_FAILED, "Failed to find running database instances hosted by server pool {0}"
//  *Cause:  Failed to find running database instances hosted by the servers in the given server pool. This message is accompanied by others providing additional details. A likely cause is that current user may not have permissions to query profiles of databases hosted by the given server pool. 
// *Action: If lack of permissions is the cause of this failure, then use 'srvctl config <object> -a' command to find the current owner of entity and retry the query as that owner user. Otherwise, contact Oracle Support Services. 
/
1062, IS_SP_CHECK_FAILED, "Failed to determine whether server pool {0} has any parents or children"
//  *Cause:  Failed to find parents or children of the given server pool. A likely cause is that current user may not have permissions to query profile of given server pool or profiles of other server pools whose PARENT_POOLS attribute contains this server pool name.
// *Action: If lack of permissions is the cause of this failure, then use 'srvctl config serverpool <serverpool> -a' command to find the current owner of the server pool and retry the query as that owner user. Otherwise, contact Oracle Support Services. 
/
1063, EVAL_SRVPOOL_CREATION_FAILED, "Server pool {0} with minimum size {1}, maximum size {2}, importance {3} and server list ({4}) can not be created"
//  *Cause: Specified server pool cannot be created because of the reason provided by an accompanying exception message.
// *Action: Respond based on the accompanying exception message.
/
1064, SP_LOOKUP_VIA_FILTER_FAILED, "Failed to find server pools using filter {0}"
//  *Cause: Attempt to look up server pool entitites using given filter failed. A likely cause is that current user does not have permissions to query server pool entities
// *Action: If lack of permissions is the cause of this failure, then use 'srvctl config serverpool -a' command to find the current owner of the server pools and retry the query as that owner user. Otherwise, contact Oracle Support Services.
/
1064, UNASSIGNED_SERVER, "Server {0} is not assigned to any server pool"
//  *Cause: Given server is not yet recognized by Oracle Clusterware and therefore is not active in any server pool. 
// *Action: Check state of the server using 'crsctl stat server <server> -f' and contact Oracle Support Services.
/
1065, GNS_NOT_EXIST, "GNS is not configured."
// *Cause:  GNS has not been configured on the cluster. 
// *Action: Configure GNS by executing "srvctl add gns".
/
1066, EVAL_SRVGRP_CREATION_FAILED, "Server group {0} with  server list ({1}) can not be created"
//  *Cause: Specified server group cannot be created because of the reason provided by an accompanying exception message.
// *Action: Respond based on the accompanying exception message.
/
