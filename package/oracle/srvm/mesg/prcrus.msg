// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCrMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     06/04/09 - Add cause and action for messages
//     yizhang     05/26/09 - fix messages
//     agridnev    06/01/09 - fixed bug-8512560
//     agridnev    05/18/09 - fixed bug 8517905
//     sravindh    05/18/09 - Add message for ResourceName
//     yizhang     05/08/09 - fix bug 8488622
//     agridnev    05/08/09 - fixed bug-8492752
//     sravindh    05/02/09 - Adding dummy messages that have been removed to
//                            prevent lang files compile break
//     yizhang     04/22/09 - fix bugs of unwanted trailing characters
//     yizhang     04/15/09 - fix bug 8325167
//     yizhang     04/02/09 - Fix bug 8329666
//     dpham       03/17/09 - Fix "registered" typo
//     sowong      03/05/09 - fix bug7605771
//     agridnev    01/13/09 - added message for stopResources()
//     agridnev    12/19/08 - added message for evaluateRegisterEntity()
//     yizhang     10/13/08 - Fix bug 7373704
//     rxkumar     10/27/08 - add messages for ER bug-7520072
//     rxkumar     08/28/08 - add CRS_RELOCATE_SERVERS_FAILED
//     yizhang     08/21/08 - Fix RES_RELOCATE_FAILED
//     agridnev    08/20/08 - amended "cause" for 10101 per JC request
//     agridnev    08/19/08 - added message for bug-7323859
//     agridnev    08/06/08 - fixed bug-6470856: updated CRSNative related
//                            messages
//     rxkumar     07/22/08 - fix bug7142054
//     rsirigan    05/14/08 - fix bug7030393 
//     spavan      04/29/08 - 
//     rxkumar     05/08/08 - rm INVALID_RELOCATE_OPTION
//     yizhang     04/25/08 - Update RES_REMOVE_FAILED
//     spavan      04/08/08 - Fix cause/actions
//     agridnev    03/18/08 - added message to support getSeqNumber()
//     agridnev    03/12/08 - added messages to support getProcessedStat()
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file PrCrMsg.java
//     yizhang     02/29/08 - Fix message RES_NOT_EXISTS
//     agridnev    02/21/08 - added messages for purgePerX
//     spavan      02/21/08 - add spavan_nappbugs msgs
//     agridnev    02/11/08 - added msg for relocate options
//     agridnev    01/24/08 - updated start(count)/stop(count) messages
//     agridnev    01/18/08 - added msg for hasAdminRole()
//     agridnev    01/15/08 - adde msg for start(count)
//     rxkumar     01/02/08 - add GET/SET_RES_DEP_RES_FAILED
//     agridnev    12/20/07 - added msg for CRSAttributeNotFoundException
//     spavan      12/28/07 - Fixup message properly
//     spavan      12/21/07 - Add rolling upgrade messages
//     rxkumar     11/01/07 - fix  CRS_RI_GET_FAILED msg
//     agridnev    10/04/07 - new messages for bug-6410594's fix
//     yizhang     10/23/07 - Add RES_ALREADY_ENABLED/DISABLED_ON_NODES messages
//     agridnev    10/04/07 - neww messages for bug-6410594's fix
//     agridnev    08/14/07 - more relocate related messages
//     agridnev    07/16/07 - fix for bug-6158429
//     rxkumar     05/11/07 - add msg for CLU_MBR_CHECK_FAILED
//     rxkumar     05/04/07 - add RES_TYPE_ADD_FAILED
//     agridnev    05/01/07 - added msg for UnsupportedCRSOperationException
//     agridnev    04/02/07 - start(node/list) support
//     rxkumar     03/14/07 - add GET_SET_CARD
//     rsirigan    03/08/07 - fix bug5912308
//     agridnev    03/05/07 - added support for status
//     agridnev    02/09/07 - updated based on Raj's review
//     agridnev    02/07/07 - clean up
//     rxkumar     02/01/07 - add NOT_ORCL_CLUSTER
//     agridnev    01/29/07 - added type strings for CRSEntities
//     agridnev    01/19/07 - added server support
//     rxkumar     01/08/07 - add RES_REMOVE_PERX_FAILED
//     agridnev    01/04/07 - added filter support
//     rxkumar     01/02/07 - add RES_ATTR_NAME_INVALID
//     agridnev    12/27/06 - added unregister support
//     agridnev    12/20/06 - updates related to JC review
//     agridnev    12/12/06 - added CRSNative messages
//     rxkumar     12/08/06 - add RES_GETVERSION_FAILED
//     rxkumar     12/06/06 - add RES_STATE_INVALID
//     rxkumar     12/01/06 - INVALID_ATTR_VALUE
//     agridnev    11/29/06 - updated facility
//     agridnev    11/28/06 - review based updates
//     agridnev    11/26/06 - added OracleCM and Vendor Cluster support
//     rxkumar     11/22/06 - add RES_GET_PERM_FAILED
//     rxkumar     11/16/06 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, RES_ALREADY_EXISTS, "Resource {0} already exists"
//  *Cause: An attempt was made to create a resource that already exists.
// *Action: Check the resource using 'srvctl config <object>' command and if the resource should not exist then remove it using 'srvctl remove <object>' command.
/
1001, RES_NOT_EXISTS, "Resource {0} does not exist"
//  *Cause: An attempt was made to operate on a resource that does not exist.
// *Action: Check the resource using 'srvctl config <object>' command and if the resource does not exist then create it using 'srvcl add <object>' command.
/
1002, RES_ALREADY_ENABLED, "Resource {0} is already enabled"
//  *Cause: An attempt was made to enable a resource that is already enabled.
// *Action: If the resource is already enabled then no action is needed. Use 'srvctl status <object>' command to determine whether it is enabled.
/
1003, RES_ALREADY_DISABLED, "Resource {0} is already disabled"
//  *Cause: An attempt was made to disable a resource that is already disabled.
// *Action: If the resource is already disabled then no action is needed. Use 'srvctl status <object>' command to determine whether it is disabled.
/
1004, RES_ALREADY_RUNNING, "Resource {0} is already running"
//  *Cause: An attempt was made to start a resource that is already running.
// *Action: If the resource is already running then no action is needed. Use 'srvctl status <object>' command to determine whether it is running.
/
1005, RES_ALREADY_STOPPED, "Resource {0} is already stopped"
//  *Cause: An attempt was made to stop a resource that is already stopped.
// *Action: If the resource is already stopped then no action is needed. Use 'srvctl status <object>' command to determine whether it is stopped.
/
1006, RES_ADD_FAILED, "Failed to add resource {0} for {1}"
//  *Cause: An attempt to add the specified resource has failed.
// *Action: Check and resolve the underlying exception.
/
1007, RES_STAT_FAILED, "Failed to check status of resource {0}"
//  *Cause: An attempt to check status of specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1008, RES_GETVERSION_FAILED, "Failed to retrieve version of resource {0}"
//  *Cause: An attempt to  retrieve version of the specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1009, RES_GETPERM_FAILED, "Failed to retrieve permissions of resource {0}, ACL {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1010, RES_SETPERM_FAILED, "Failed to update permissions of resource {0}"
//  *Cause: An attempt to update permissions of specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1011, RES_ENABLE_FAILED, "Failed to enable resource {0}"
//  *Cause: An attempt to enable specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1012, RES_DISABLE_FAILED, "Failed to disable resource {0}"
//  *Cause: An attempt to disable specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1013, RES_START_FAILED, "Failed to start resource {0}"
//  *Cause: An attempt to start specified resource on several nodes failed.
// *Action: Check the help for the underlying exception.
/
1014, RES_STOP_FAILED, "Failed to stop resource {0}"
//  *Cause: An attempt to stop specified resource on several nodes failed.
// *Action: Check the help for the underlying exception.
/
1015, RES_RELOCATE_FAILED, "Failed to relocate resource {0}"
//  *Cause:An attempt to relocate specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1016, RES_MODIFY_FAILED, "Failed to modify resource {0}"
//  *Cause: An attempt to modify specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1017, RES_STAT_PERX_FAILED, "Dummy message: Failed to check status of resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1018, RES_ENABLE_PERX_FAILED, "Dummy message: Failed to enable resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1019, RES_DISABLE_PERX_FAILED, "Dummy message: Failed to disable resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1020, RES_START_PERX_FAILED, "Dummy message: Failed to start resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1021, RES_STOP_PERX_FAILED, "Dummy message: Failed to stop resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1022, RES_MODIFY_PERX_FAILED, "Dummy message: Failed to modify resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1023, RES_RELOCATE_PERX_FAILED, "Dummy message: Failed to relocate resource {0} from node {1} to node {2}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1024, RES_REMOVE_PERX_FAILED, "Failed to remove resource {0} on nodes {1}"
//  *Cause: An attempt to remove the resource on the specified nodes failed.
// *Action: Check the accompanying error messages for details. 
/
1025, RES_STILL_RUNNING, "Resource {0} is still running"
//  *Cause: The specified resource is not stopped.
// *Action: Check the accompanying error messages to decide whether to stop the specified resource.
/
1026, RES_NOT_RUNNING, "Resource {0} is not running"
//  *Cause: The specified resource is not started.
// *Action: Check the accompanying error messages to decide whether to start the specified resource.
/
1027, RES_PERX_NOT_RUNNING, "Dummy message: Resource {0} instance on node {1} is not running"
//  *Document: No
//  *Cause: Dummy message line
// *Action: 
/
1028, RES_REMOVE_FAILED, "Failed to remove resource {0}"
//  *Cause: An attempt to remove specified resource failed.
// *Action: Check the help for the underlying CRSException.
/
1029, RES_ATTR_NOT_EXISTS, "Attribute {0} does not exist in resource {1} definition"
//  *Cause: An attempt was made to get an attribute which is not defined for that resource type.
// *Action: Make sure that the attribute exists in the resource definition.
/
1030, RES_ATTR_NAME_INVALID, "Resource attribute name {0} is not valid"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1031, RES_ATTR_VALUE_INVALID, "Resource attribute {0} value {1} is not valid"
//  *Cause: Specified resource attribute value is not valid.
// *Action: Try recreating the resource attribute value using srvm APIs or recreating the resource using srvctl commands.
/
1032, RES_STATE_INVALID, "Current state of resource {0} is not valid"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1033, RES_TYPE_NOT_EXISTS, "Resource type {0} does not exist"
//  *Cause: An attempt to retrieve the type has failed.
// *Action: Make sure that the type exists.
/
1034, RES_TYPE_ADD_FAILED, "Dummy message: Failed to add resource type {0}"
//  *Document: No
//  *Cause: Dummy message line
// *Action: 
/
1035, RES_LOOKUP_FAILED, "Failed to look up CRS resource {0} for {1}"
//  *Cause: An attempt to access the specified resource failed because it did not exist.
// *Action: Check that the specified name and resource type are correct.
/
1036, RES_GET_CARD_FAILED, "Failed to retrieve cardinality of the resource {0}"
//  *Cause: An attempt to retrieve cardinality of resource has failed.
// *Action: Examine the accompanying error messages to determine how to respond.
/
1037, RES_SET_CARD_FAILED, "Failed to update cardinality of the resource {0} to {1}"
//  *Cause: An attempt to set cardinality of the resource has failed.
// *Action: Examine the accompanying error messages to determine how to respond.
/
1038, RES_UNSUPPORTED_OP, "Dummy message: {0} is not supported for resource {1}"
//  *Document: No
//  *Cause: Dummy message line
// *Action: 
/
1039, SERVER_POOL_NOT_EXISTS, "Server pool {0} does not exist"
//  *Cause: An attempt was made to retrieve the server pool which does not exists.
// *Action: Make sure that requested server pool exists.
/
1040, RES_ALREADY_ENABLED_ON_NODES, "Resource {0} is already enabled on node(s) {1}"
//  *Cause: An attempt was made to enable a resource that is already enable on nodes.
// *Action: The status of a resource can be checked by using the 'srvctl status <object>' command.
/
1041, RES_ALREADY_DISABLED_ON_NODES, "Resource {0} is already disabled on node(s) {1}"
//  *Cause: An attempt was made to disable a resource that is already disabled on nodes.
// *Action: The status of a resource can be checked by using the 'srvctl status <object>' command.
/
1042, RES_GET_DEP_RES_FAILED, "Failed to get dependent resources {0} of resource {1}: {2}"
//  *Cause: Failed to retrieve dependent resources of the given resource.
// *Action: Examine the accompanying error messages to determine how to respond. 
/
1043, RES_SET_DEP_RES_FAILED, "Failed to update dependent resources {0} of resource {1} to resource {2}"
//  *Cause: Failed to update dependent resources of the given resource.
// *Action: Examine the accompanying error messages to determine how to respond. 
/
1050, NOT_ORCL_CLUSTER, "Resource {0} is not configured in Oracle cluster environment"
//  *Cause: The environment for the specified resource is not Oracle Clusterware. 
// *Action: The specified commands or APIs can only be used when Oracle Clusterware is running. If the environment is configured as Oracle Restart, use the correspond commands and APIs for Oracle Restart.
/
1051, CLU_ORACM_NOT_FOUND, "OracleCM Cluster is not found on node {0}"
//  *Cause: The OracleCM Cluster was not found on the specified node because the library for OracleCM Cluster was not found.
// *Action: Install OracleCM Cluster on the specified node.
/
1052, CLU_ORACM_LIB_CHECK_FAILED, "Failed to find OracleCM Cluster library on node {0}"
//  *Cause: Failed to check OracleCM Cluster because of the error in executingthe command to find the file /etc/ORCLcluster/oracm/lib/libskgxn2.so.
// *Action: Make sure that the caller has the read and execute permission for the library file.
/
1053, CLU_VENDOR_NOT_FOUND, "Vendor Cluster is not found on node {0}"
//  *Cause: The Vendor Cluster was not installed and configured on the specified node.
// *Action: Install and configure the Vendor Cluster on the specified node.
/
1054, CLU_VENDOR_LIB_CHECK_FAILED, "Failed to find Vendor Cluster library on node {0}"
//  *Cause: Failed to check OracleCM Cluster because of the error in executingthe command to find the file /etc/ORCLcluster/lib/libskgxn2.so.
// *Action: Make sure that the caller has the read and execute permission for the library file.
/
1055, CLU_MBR_CHECK_FAILED, "Cluster membership check failed for node {0}"
//  *Cause: The specified node does not belong to the cluster.
// *Action: Check whether the node name is correct. 
/
1061, CRS_JNI_PERMISSIONS_FAILURE, "User permissions are insufficient"
//  *Cause: User permissions are insufficient to register resource/type.
// *Action: Make sure the user is crs-user or root.
/
1062, CRS_JNI_RESOURCE_GET_ATTRS_FAILED, "Failed to retrieve attributes of resource {0} on node {1}"
//  *Cause: An attempt to retrieve attributes of the resource has failed.
// *Action: Make sure that resource exists.
/
1063, CRS_JNI_CREATE_CTX_FAILED, "Failed to create context"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1064, CRS_JNI_RESOURCE_START_FAILED, "Failed to start resource {0} on node {1}"
//  *Cause: An attempt to start the resource has failed.
// *Action: Make sure that resource is ready to start on the node before starting it.
/
1065, CRS_JNI_RESOURCE_STOP_FAILED, "Failed to stop resource {0}"
//  *Cause: An attempt to stop the resource failed because the resource wasn't running or the running resource had dependent resources also running. 
// *Action:  Check the accompanying messages to identify dependent resources and stop them. Make sure that resource is running before stopping it. 
/
1067, CRS_FILTER_CREATE_FAILED, "Failed to create a filter"
//  *Cause: An attempt to create a filter has failed.
// *Action: Check the help for the underlying exception.
/
1068, CRS_JNI_QUERY_RESOURCES_FAILED, "Failed to query resources"
//  *Cause: An attempt to query the resource failed.
// *Action: Check the help for the underlying exception.
/
1069, CRS_JNI_ATTR_NOT_FOUND, "Attribute {0} of {1} {2} not found"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1070, CRS_JNI_IS_ENT_REGISTERED_FAILED, "Failed to check if {0} {1} is registered"
//  *Cause: Failed to check if resource is registered.
// *Action: Check the help for the underlying exception.
/
1071, CRS_JNI_REGISTER_ENT_FAILED, "Failed to register or update {0} {1}"
//  *Cause: An attempt to register or update the resource failed.
// *Action: Check the help for the underlying exception.
/
1072, CRS_JNI_UNREGISTER_ENT_FAILED, "Failed to unregister {0} {1}"
//  *Cause: An attempt to unregister specified resource failed.
// *Action: Check the help for the underlying exception. 
/
1074, CRS_JNI_ENT_STAT_FAILED, "Failed to retrieve attributes for {0} {1}"
//  *Cause: Failed to retrieve attributes for specified resource.
// *Action: Check the help for the underlying exception.
/
1075, CRS_JNI_STATUS_FAILED, "Failed to retrieve status for resource {0}"
//  *Cause: Failed to retrieve status for specified resource.
// *Action: Check the help for the underlying exception.
/
1076, CRS_JNI_STATUS_FIELD_MISSED, "Failed to retrieve status for resource {0}: {1} is missed"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1077, CRS_JNI_STATUS_UNKNOWN, "Failed to calculate status for resource {0}: {1}/{2}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1078, CRS_JNI_RESOURCE_GET_ATTRS_FAILED_NO_HOST, "Failed to retrieve attributes of resource {0}"
//  *Cause: An attempt to retrieve attributes of the resource has failed.
// *Action: Make sure that resource exists.
/
1079, CRS_JNI_RESOURCE_START_FAILED_NO_HOST, "Failed to start resource {0}"
//  *Cause: An attempt to start the resource has failed.
// *Action: Make sure that resource is ready to start before starting it.
/
1080, CRS_ENT_RESOURCE, "resource"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1081, CRS_ENT_RESOURCE_TYPE, "resource type"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1082, CRS_ENT_SERVER_POOL, "server pool"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1083, CRS_ENT_SERVER, "server"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1084, CRS_ENT_RESOURCE_INSTANCE, "resource instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1085, CRS_ENT_UNKNOWN_TYPESTRING, "Unknown typeAsString: {0}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1086, CRS_ENT_ALREADY_REGISTERED, "{0} {1} is already registered"
//  *Cause: An attempt to register specified resource failed.
// *Action: Make sure that a resource is not registered before register it.
/
1087, CRS_RI_GET_FAILED, "Failed to retrieve resource {0} instances"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1088, CRS_RI_STOP_FAILED, "Failed to stop resource {0}: it was not started on node {1}"
//  *Cause: The resource was not started on the node..
// *Action: Make sure that resource was started before stopping it.
/
1089, CRS_RELOCATE_FAILED, "Failed to relocate resource {0}."
//  *Cause: An attempt to relocate specified resource failed.
// *Action: Check the help for the underlying exception.
/
1090, CRS_RELOCATE_NOT_RUNNING, "Failed to relocate resource {0}. It is not running."
//  *Cause: The resource was not started.
// *Action: Make sure that resource was started before relocating it.
/
1091, CRS_RELOCATE_NOT_RUNNING_ON_NODE, "Failed to relocate resource {0}. It is not running on node {1}."
//  *Cause: The resource was not started on the node.
// *Action: Make sure that resource was started before relocating it.
/
1092, CRS_RELOCATE_NOT_SINGLETON, "Failed to relocate resource {0}. It is running on more than one node"
//  *Cause: The resource was started on more than one node.
// *Action: Make sure that resource is running on one node only before relocating it.
/
1093, CRS_RELOCATE_SAME_NODE, "Failed to relocate resource {0}. It is already running on node {1}"
//  *Cause: The resource is running that node.
// *Action: Make sure that resource is not running on a node before relocating it.
/
1094, CRS_START_FAILED_FILTER, "Failed to start resources on node {0}: {1}"
//  *Cause: Resources defined by filter cannot be started on the node.
// *Action: Make sure that resources are not running and ready to run before starting them. Make sure that the node is online.
/
1095, CRS_START_FAILED_FILTER_NOHOST, "Failed to start resources using filter {0}"
//  *Cause: Resources defined by filter cannot be started.
// *Action: Make sure that resources are not running and ready to run before starting them.
/
1096, CRS_JNI_FILTER_IS_NULL, "Filter cannot be null"
//  *Cause: An attempt to use filter has failed.
// *Action: Make sure that a filter is provided.
/
1097, CRS_ATTRIBUTE_NOT_FOUND, "Resource attribute not found: {0}"
//  *Cause: Requested resource attribute not found.
// *Action: Make sure that resource has requested attribute.
/
1098, UPGRADE_MODE_FAILED, "Could not set rolling upgrade mode {0}"
//  *Cause: An attempt to start the resource in rolling upgrade mode has failed.
// *Action: Make sure that the correct LD_LIBRARY_PATH is set and all shared libraries are present.
/
1099, CRS_JNI_START_COUNT_FAILED, "Cannot start resource {0} on {1} additional nodes because it would exceed the resource cardinality {2}. Resource is already running on {3} nodes "
//  *Cause: Resource cannot be started because of its cardinality restriction.
// *Action: Make sure that number of additional nodes does not exceed the resource cardinality.
/
1100, CRS_JNI_START_COUNT_FAILED_CARD, "Cannot start resource {0} on {1} nodes because it would exceed the resource cardinality {2}"
//  *Cause: Resource cannot be started because of its cardinality restriction.
// *Action: Make sure that number of nodes does not exceed the resource cardinality.
/
1101, CRS_JNI_STOP_COUNT_FAILED, "Cannot stop resource {0} on {1} nodes, it is running on {2} nodes."
//  *Cause: The resource does not have enough running instances to stop.
// *Action: Make sure that resource has enough running instances to stop.
/
1102, CRS_JNI_CRS_ADMIN_FAILED, "Failed to verify if user {0} has CRS admin role: {1}"
//  *Cause: Failed to verify if the user has CRS admin role.
// *Action: Resolve the reported error message and retry.
/
1104, UNSUPPORTED_RELOCATE_OPTION, "Unsupported relocate option {0}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1105, RES_RELOCATE_FAILED_NODE, "Failed to relocate resource {0} to node {1}"
//  *Cause: An attempt to relocate the resource to the specified node has failed.
// *Action: Examine accompanying message(s) that provide details of the error, and respond accordingly.
/
1106, RES_RELOCATE_FAILED_NODE_NODE, "Failed to relocate resource {0} from node {1} to node {2}"
//  *Cause: An attempt to relocate the resource from one specified node to another has  failed.
// *Action: Check the help for the underlying exception.
/
1107, DEP_RES_ATTR_ERR, "Error while trying to set default network as dependent resource for {0}"
//  *Cause: An attempt to set default network dependency for the specified resource failed.
// *Action: Examine the accompanying error message(s) for details.
/
1108,ONS_NETWORK_RES_NOT_EXISTS, "ONS cannot be created because default network is not configured."
//  *Cause: An attempt was made to create ONS resource with out creating the dependent default network resource.
// *Action: Network resource can be created using 'srvctl add nodeapps' command. Create the network resource and try this command again.
/
1109, PURGE_PERX_FAILED, "Failed to remove attributes \"{1}\" from resource {0}"
//  *Cause:  Possible reasons: Oracle Clusterware stack might not be active, CRS resource may not exist, or the CRS resource may not have given attributes set.
// *Action:  Make sure that Oracle Clusterware is active, the CRS resource exists and has given attributes set.
/
1110, CRS_JNI_PROCESSED_ATTRS_FAILED, "Failed to retrieve processed attributes of resource {0} for node {1}"
//  *Cause: Oracle Clusterware stack was not active or CRS resource did not not exist.
// *Action: Make sure that Oracle Clusterware is active, the CRS resource exists.
/
1111, CRS_JNI_PROCESSED_ATTRS_NO_RI, "Failed to retrieve processed attributes of resource {0} for node {1}"
//  *Cause: requested CRS resource did not exist.
// *Action: Make sure that the CRS resource exists.
/
1112, CRS_JNI_GET_SEQN_FAILED, "Failed to retrieve current event sequence number"
//  *Cause: Oracle Clusterware stack was not active.
//  *Action: Make sure that Oracle Clusterware is active.
/
1113, CRS_JNI_NO_MESSAGE, "Failed to create detailed error message, rc = {0}"
//  *Cause: Internal error
//  *Action: Contact Oracle Support Services.
/
1114, CRS_RELOCATE_SERVERS_FAILED, "Failed to relocate servers {0} into server pool {1}"
//  *Cause: Failed to relocate servers into the given server pool. This message may be accompanied by others providing additional details. A likely cause is violation of defined configuration attributes such as pool MIN_SIZE, SERVER_NAMES etc. 
// *Action: If the problem stems from violating configuration attributes, either modify the attributes or reformulate the request. Otherwise, contact Oracle Support Services.
/
1115, CRS_ENTITIES_GET_FAILED, "Failed to find entities of type {0} that match filters {1} and contain attributes {2}"
//  *Cause: Failed to look up entitites of given type that match given filters. This message may be accompanied by others providing additional details. A likely cause is that current user does not have permissions to read attributes of entities of given type. 
// *Action: If lack of permissions is the cause of this failure, then use 'srvctl config <object> -a' command to find the current owner of the entity and retry the query as that owner user. Otherwise, contact Oracle Support Services.
/
1116, CRS_JNI_EVAL_REGISTER_FAILED, "{0} {1} cannot be created and registered now"
//  *Cause:  Oracle Clusterware stack could not create and register an object.
// *Action: Check the help for the underlying exception.
/
1117, CRS_JNI_STOP_RESOURCES_FAILED, "Failed to stop resources using filter {0}"
// *Cause: An attempt to stop resources using specified filter failed.
// *Action: Respond based on the accompanying exception message.
/
1118, CREATE_RESOURCE_PERM_FAILED, "Failed to generate resource permissions for the resource"
//  *Cause: Creation of the Access Control List (permission) structures for the resource failed. This message is accompanied by others providing details of the error.
// *Action: Respond based on the accompanying exception message(s).
/
1119, RESTYPE_LOOKUP_FAILED, "Failed to look up CRS resources of {0} type"
//  *Cause: An attempt to find the resource for the specified resource type failed because it did not exist.
// *Action: Create a resource of the type.
/
1120, RESOURCES_ALREADY_RUNNING, "Resources are already running: {0}"
//   *Cause: An attempt to start resources failed because they are already running. For detailed information about resources review the accompanying error messages.
//  *Action: None.
/
1121, INVALID_PARAM_VALUE, "Value of parameter \"{0}\" cannot be null or empty"
//  *Cause: An attempt to construct ACFS resource name failed due to null or empty value for the indicated parameter.
// *Action: This is an internal error. Contact Oracle Support Services.
/
