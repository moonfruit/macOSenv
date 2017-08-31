// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrkcMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     05/27/09 - fix messages
//     sravindh    03/13/09 - Add TRIVIAL_NODE_LIST mesg
//     sravindh    01/06/09 - Add messages for path assert
//     jgrout      03/11/09 - Add message for SIHA software version failure
//     sravindh    01/06/09 - Add ,essages for path assert
//     sravindh    12/29/08 - Add message for drive letters failure
//     sravindh    07/25/08 - Messages for OCR locations retrieval failure
//     rxkumar     06/05/08 - add GET_LOCAL_HOSTNAME_FAILED
//     sravindh    12/06/07 - Review comments(DS)
//     sravindh    12/03/07 - New message for group from UnixSystem class
//     agridnev    09/10/07 - fixed typo
//     agridnev    08/23/07 - added message for umask and permissions
//     nvira       03/26/07 - add message for file not found
//     sowong      03/12/07 - add messages for new createservice
//     nvira       12/14/06 - add messages for olr & ocr config read errors
//     bkannike    06/29/06 - Adding unable to find version message 
//     bkannike    06/16/06 - Add Version not found message 
//     sowong      05/11/06 - add new message for bug4244888 
//     sowong      03/09/05 - fix bug 4229562 
//     rxkumar     12/08/04 - fix bug4055008 
//     sowong      11/16/04 - add NULL_DEPENDENCY_LIST 
//     rxkumar     07/26/04 - add SET_PERMS_FAILED 
//     rxkumar     10/07/04 - add NULL_VERSION 
//     khsingh     09/30/04 - add INVALID_IF_PARAM_TYPE (bug 3351186)
//     rxkumar     10/05/04 - fix bug3892547
//     rxkumar     10/03/04 - fix bug3896992
//     rxkumar     09/22/04 - fix er bug3906335
//     rxkumar     09/15/04 - add REMOVE_FILE_FAILED, bug3892710
//     sowong      08/25/04 - add msg for failing to get css home
//     sowong      07/28/04 - add message for bug 3757074
//     khsingh     08/06/04 - add PORT_ALREADY_IN_USE
//     khsingh     08/03/04 - add NULL_IPADDRESSES
//     sowong      08/03/04 - add FAIL_TO_CREATE_NEWLIST
//     sowong      08/02/04 - add ERROR_REGISTER_OCX and ERROR_REBOOT_NODE
//     khsingh     07/26/04 - add GET_CRS_ACTIVE_VERSION_FAIL (3700947)
//     khsingh     07/30/04 - add specific messages for transfer APIs
//     rxkumar     07/29/04 - add ERROR_UPDATE_ENV
//     khsingh     07/26/04 - add EMPTY_INCL_FILE
//     khsingh     07/21/04 - add FAILED_TO_LIST_FILES_FOR_TRANSFER
//     rxkumar     07/21/04 - add UNKNOWN_PATH_TYPE
//     khsingh     07/20/04 - add GET_NODE_VIP_FAIL
//     rxkumar     07/19/04 - add GET_PRIVATE_NODE_NAME_FAIL
//     khsingh     07/12/04 - add TRANSFER_LISTED_DIRS_FATAL_ERROR
//     khsingh     06/28/04 - add NULL_ORACLE_HOME
//     sowong      06/28/04 - add new messages for transferfile apis
//     rxkumar     06/15/04 - add NO_USER_EQUIVALENCE msg
//     khsingh     06/07/04 - add add TRANSFER_DIR_TO_NODES_FAILED
//     khsingh     06/03/04 - add message for remote file op exception
//     rxkumar     06/08/04 - update ENVIRONMENT_FAIL msg
//     rxkumar     06/01/04 - add NODE_LIVENESS msg
//     rxkumar     05/19/04 - add ERROR_GET_SUBKEY
//     rxkumar     05/07/04 - add GET_PRIV_HOSTNAME_FAIL
//     rxkumar     04/26/04 - add NULL_FILE_NAME
//     rxkumar     04/28/04 - add GET_NODE_NUMBER_FAIL
//     rxkumar     03/31/04 - add NODE_LIST msgs
//     rxkumar     03/30/04 - add DIR_LIST_ERROR
//     rxkumar     07/14/03 - add CLUSTER_MISCONFIGURED
//     rdasari     06/05/03 - add HOSTNAME_KEY_NULL mesg
//     khsingh     05/21/03 - add msg
//     khsingh     05/19/03 - add msg INVALID_DATA_FOR_REGISTRY_KEY
//     khsingh     05/13/03 - add message
//     surchatt    05/23/03 - adding message for node not accessible
//     rdasari     05/14/03 - add GET_HOSTNAME_FAIL msg
//     rxkumar     02/05/03 - change text for CRS service
//     rxkumar     02/03/03 - add CRS services related messages
//     dsaggi      11/26/02 - add messages
//     surchatt    11/15/02 - changing message
//     surchatt    11/13/02 - adding new messages
//     dsaggi      10/13/02 - add messages
//     jtellez     08/16/02 - cshea edits
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     rdasari     08/22/02 - add FILE_CREATE_FAIL message
//     dliu        09/07/01 - new mesg.
//     surchatt    02/08/01 -
//     surchatt    02/08/01 - changing for OPS to ORAC name change
//     rxkumar     09/07/00 - add NO_SUCH_NODE
//     surchatt    07/28/00 - adding messages
//     surchatt    06/08/00 - Adding messages related to daemon restart
//     surchatt    06/05/00 - adding failure strings for link and getEnvironment A
//     surchatt    05/15/00 - Messages for cluster component
//     surchatt    05/15/00 - Creation
//  */
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/mgmt/resources/PrkcMsg.msg /main/8 2009/06/07 21:18:00 yizhang Exp $
//  *  @author  surchatt
//  *  @since   release specific (what release of product did this appear in)
//  */
// PACKAGE=package oracle.ops.mgmt.resources;
// MSGIDTYPE=interface
1000, NO_CLUSTER, "No active nodes detected in the cluster"
//  *Cause: The active node list of the cluster could not be retrieved. This could occur if the operating system dependent clusterware was not functioning properly in one or more nodes in the cluster, or because there was no clusterware installed on the system.
// *Action: Check the state of the cluster by running 'lsnodes' binary from your ORACLE_HOME/bin and see if it prints the node list correctly.
/
1001, NO_SUBMIT, "Error submitting commands in the buffer"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1002, PARTIAL_SUCCESS, "All the submitted commands did not execute successfully"
//  *Cause: Either a node failed in the middle of a manageability operation, or the communication between nodes was disrupted.
// *Action: Check the state of your cluster by running  'lsnodes' binary from your ORACLE_HOME/bin and see if it prints the node list correctly. 
/
1003, INTERRUPTED, "Interrupted while blocked"
//  *Cause: 
// *Action: 
/
1004, COPY_FAIL, "Problem in copying file to nodes"
//  *Cause: Attempted file copy operation(s) from the local node to one or more nodes in the cluster and one or multiple of those copy file operations failed. Possible causes:
//         1) One or more file copy operations to nodes in the cluster failed.
//         2) The destination directory did not have write permission for the user on one or more of the nodes .the source file did not exist.
//         3) The 'rcp' command to one or more nodes failed on UNIX platforms.
// *Action: 
//         1) Check that the source file exists. 
//         2) Check that all nodes in the cluster are up. 
//         3) Check that destination directory has write permission for the user. 
//         4) On UNIX based platforms check that user can do 'rcp' to all the nodes.
/
1005, REMOVE_FAIL, "Problem in removing file from nodes"
//  *Cause: Attempted file remove operation(s) from the local node to one or more nodes in the cluster and one or multiple of those file remove operations failed. Possible causes:
//         1) One or more nodes failed during the operation.
//         2) The destination directory did not have write permission for the user on one or more of the nodes.
//         3) The source file did not exist.
//         4) The 'rcp' command to one or more nodes failed on UNIX platforms.
// *Action: Check the accompanying error messages for details.
/
1006, MOVE_FAIL, "Problem in moving file to nodes"
//  *Cause: Attempted file move operation(s) from the local node to one or more nodes in the cluster and one or multiple of those move file operations failed. Possible causes:
//         1)  One or more nodes failed during the operation.
//         2)  The destination directory did not have write permission for the user on one or more of the nodes.
//         3)  The source file did not exist.
//         4)  The 'rcp' command to one or more nodes failed on UNIX platforms.
// *Action: Check the accompanying error messages for details.
/
1007, DIR_CREATE_FAIL, "Problem in creating directories on the nodes"
//  *Cause:  Attempted directory create operation(s) from the local node to one or more nodes in the cluster and one or multiple of those directory create operations failed. Possible causes:
//         1) One or more nodes failed during the operation.
//         2) The destination directory did not have write permission for the user on one or more of the nodes.
//         3)  The 'rcp' command to one or more nodes failed on UNIX platforms.
// *Action: Check the accompanying error messages for details. 
/
1008, DIR_REMOVE_FAIL, "Problem in removing directories from the nodes"
//  *Cause: 
// *Action: 
/
1009, START_SERVICE, "Failed to start the service on all nodes"
//  *Cause: The service failed to start on one or more nodes of the cluster.
// *Action: Check if all the nodes in cluster are up and look in the clusterware alert log. 
/
1010, STOP_SERVICE, "Failed to stop the service on all nodes"
//  *Cause: The service failed to stop on one or more nodes of the cluster.
// *Action: Check if all the nodes in cluster are up and service is still up on failed nodes. Look in the clusterware alert log.
/
1011, DELETE_SERVICE, "Failed to delete the service from all nodes"
//  *Cause: The service failed to be deleted on one or more nodes of the cluster.
// *Action: Check if all the nodes in cluster are up and service is still registered. Look in the clusterware alert log.
/
1012, CREATE_SERVICE, "Failed to create the service on all nodes"
//  *Cause: The service failed to be created on one or more nodes of the cluster.
// *Action: Check if all the nodes in cluster are up. Look in the clusterware alert log.
/
1013, PREPARE_PHASE, "Prepare phase of transaction failed...transaction rolled back"
//  *Cause: 
// *Action: 
/
1014, SECOND_PHASE, "Second phase of transaction failed...use manual procedures to clean up"
//  *Cause: 
// *Action: 
/
1015, LINK_FAIL, "Problem in creating symbolic links between files"
//  *Cause: 
// *Action: 
/
1016, ENVIRONMENT_FAIL, "Failed to retrieve value of the enviornment variable \"{0}\", {1}"
//  *Cause: Attempted to retrieve value of an environment variable which was not defined.
// *Action: Define the environment variable.
/
1017, NO_RESTART, "Problem restarting GSD"
//  *Cause: GSD (Global Services Daemon) could not be started on the local node. This could occur if the operating system dependent clusterware was not functioning properly or there is already a running GSD.
// *Action: Check the state of your clusterware by running 'lsnodes' from ORACLE_HOME/bin. It should list the nodes in the cluster. Try 'gsdctl stop' and then 'gsdctl start' again.
/
1018, NO_COORDINATOR, "Error getting coordinator node"
//  *Cause: This could occur if the operating system dependent clusterware was not functioning properly.
// *Action: Use 'gsdctl stop' on each node to stop the GSDs. Use 'gsdctl start' on each node in the cluster.
/
1019, NO_DAEMON_HANDLE, "Error creating handle to GSD daemon on the node {0}"
//  *Cause: Global Services Daemon was not running on the node.
// *Action: Use 'gsdctl stat' to check the status of the daemon. Use 'gsdctl start' to start it.
/
1020, REMOTE_EXCEPTION, "Exception while executing the operation on the remote node {0}"
//  *Cause: Attempted to execute an operation on the remote node when the Global Services Daemon was not up on the remote node {0}.
// *Action: Start the Global Services Daemon on the remote node using 'gsdctl start'.
/
1021, SKGXN_PROBLEM, "Problem in the clusterware"
//  *Cause: The operating system dependent clusterware could not be contacted. This could occur because the operating system dependent clusterware was not functioning properly.
// *Action: Check the state of the operating system dependent clusterware.
/
1022, NO_SUCH_NODE, "Could not get node name for node {0} in {1}"
//  *Cause: The operating system dependent clusterware could not be contacted. This could occur because the operating system dependent clusterware was not functioning properly.
// *Action:  Check the state of the operating system dependent clusterware using 'lsnodes -n'.
/
1023, INVALID_IP, "Invalid IP address format: {0}"
//  *Cause: 
// *Action: 
/
1024, INVALID_NETMASK, "Invalid netmask: {0}"
//  *Cause: 
// *Action: 
/
1025, FILE_CREATE_FAIL, "Failed to create a file under the filepath {0} because the filepath is not executable or writable"
//  *Cause: The directory of the specified filepath did not have execute or write permission. So the temporary file could not be created to test whether the filepath was shared among nodes.
// *Action: Make the directory of the specified filepath executable and writable.
/
1026, FILE_IO_FAIL, "Failed doing I/O to file {0}"
//  *Cause: 
// *Action: 
/
1027, FILE_EXISTS_FAIL, "Error checking existence of file {0} on {1}"
//  *Cause: 
// *Action: 
/
1028, DIR_WRITABLE_FAIL, "Error checking write permission for directory {0} on  {1}"
//  *Cause: 
// *Action: 
/
1029, MODIFICATION_TIME_FAIL, "Failed to get modification time for file {0} on node {1}, [{2}]"
//  *Cause: 
// *Action: 
/
1030, NODE_ACCESSIBLE_FAIL, "Error checking  accessibility for node {0}, {1}"
//  *Cause: 
// *Action: 
/
1031, FREE_SPACE_FAIL, "Error checking free space for {0} on {1}"
//  *Cause: 
// *Action: 
/
1032, NO_SUCH_DIRECTORY, "Directory {0} does not exist"
//  *Cause: 
// *Action: 
/
1033, NO_SUCH_EXECUTABLE, "Executable {0} does not exist"
//  *Cause: 
// *Action: 
/
1034, NO_LOCAL_NODE_NAME, "No local node name found for host {0}"
//  *Cause: 
// *Action: 
/
1035, NO_NODE_NAMES, "Node names for this cluster could not be retrieved"
//  *Cause: 
// *Action: 
/
1036, NULL_CRSHOME_NAME, "CRS_HOME name passed to the method was null"
//  *Cause: 
// *Action: 
/
1037, LISTED_FILE_REMOVE_FAIL, "Error removing files listed in {0} from node {1}"
//  *Cause: 
// *Action: 
/
1038, LISTED_FILE_COPY_FAIL, "Error copying files listed in {0} to node {1}"
//  *Cause: 
// *Action: 
/
1039, LISTED_DIR_CREATE_FAIL, "Error creating directories listed in {0} on node {1}"
//  *Cause: 
// *Action: 
/
1040, UNKNOWN_REMOTE_SHELL, "Remote Shell is not known yet."
//  *Cause: 
// *Action: 
/
1041, UNKNOWN_REMOTE_COPY, "Remote Copy command is not known yet."
//  *Cause: 
// *Action: 
/
1042, INVALID_REMOTE_SHELL, "The Remote Shell {0} requested by client is not recognized "
//  *Cause: 
// *Action: 
/
1043, INVALID_REMOTE_COPY, "The Remote Copy command {0} requested by client is not recognized"
//  *Cause: 
// *Action: 
/
1044, REMOTE_SETUP_CHK_FAIL, "Failed to check remote command execution setup for node {0} using shells {1} and {2} "
//  *Cause: 
// *Action: 
/
1045, NULL_NODE_NAME, "Node name is null"
//  *Cause: 
// *Action: 
/
1046, NULL_FILE_LIST, "The file list passed to the method was null"
//  *Cause: 
// *Action: 
/
1047, NULL_DIR_LIST, "The directory list passed to the method was null"
//  *Cause: 
// *Action: 
/
1048, NO_SUPPORT_ON_WINDOWS, "{0} is not supported on Windows platform"
//  *Cause: 
// *Action: 
/
1049, CRS_NOT_SUPPORTED, "CRS is not supported in version {0}. It is supported from version {1} onwards"
//  *Cause: 
// *Action: 
/
1050, EVM_NOT_SUPPORTED, "EVM is not supported in version {0}. It is supported from version {1} onwards"
//  *Cause: 
// *Action: 
/
1051, INVALID_DATA_FOR_REGISTRY_KEY, "Invalid data to set for registry key {0}."
//  *Cause: 
// *Action: 
/
1052, UNKNOWN_REGISTRY_KEY_DATA_TYPE, "Invalid data type for registry key {0}."
//  *Cause: 
// *Action: 
/
1053, ERROR_RETURNED_FROM_NODE, "Error returned from node {0} is \"{1}\""
//  *Cause: 
// *Action: 
/
1054, NODE_NOT_ACCESSIBLE, "Node {0} is not accessible"
//  *Cause: 
// *Action: 
/
1055, NULL_DIR_NAME, "Directory name passed was null"
//  *Cause: 
// *Action: 
/
1056, GET_HOSTNAME_FAIL, "Failed to get the hostname for node {0}"
//  *Cause: 
// *Action: 
/
1057, COMPUTERNAME_MISMATCH, "The computername and hostname do not match for node {0}. Make sure that they match."
//  *Cause: 
// *Action: 
/
1058, HOSTNAME_KEY_NULL, "The hostname registry key {0} has an empty value on node {1}"
//  *Cause: 
// *Action: 
/
1059, COMPUTERNAME_KEY_NULL, "The computername registry key {0} has an empty value on node {1}"
//  *Cause: 
// *Action: 
/
1060, CLUSTER_MISCONFIGURED, "Cluster misconfigured on node \"{0}\", \"{1}\" property in {2} does not match with configured data in Oracle Cluster Registry"
//  *Cause: 
// *Action: 
/
1061, DIR_LIST_ERROR, "Failed to list contents of the directory {0}"
//  *Cause: 
// *Action: 
/
1062, NULL_NODE_LIST, "Node list is null"
//  *Cause: 
// *Action: 
/
1063, INVALID_NODE_LIST, "Node list {0} contained {1} nodes, minimum number of nodes required is {2}"
//  *Cause: 
// *Action: 
/
1064, NODE_LIST_GT_CLUSTER_LIST, "Node list {0} contained {1} nodes whereas the cluster has {2} nodes"
//  *Cause: 
// *Action: 
/
1065, NON_CLUSTER_NODES, "Nodes {0} do not belong to this cluster"
//  *Cause: 
// *Action: 
/
1066, GET_NODE_NUMBER_FAIL, "Failed to retrieve node number for node \"{0}\""
//  *Cause: 
// *Action: 
/
1067, NULL_FILE_NAME, "File name is null"
//  *Cause: 
// *Action: 
/
1068, GET_PRIV_HOSTNAME_FAIL, "Failed to get private interconnect node name for node {0}, {1}"
//  *Cause: 
// *Action: 
/
1069, ERROR_GET_SUBKEY, "Failed to get sub keys of \"{0}\" registry key, {1}"
//  *Cause: 
// *Action: 
/
1070, ERROR_GET_SUBKEY_ON_NODE, "Failed to get sub keys of \"{0}\" registry key on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1071, ERROR_NODE_LIVENESS, "Nodes \"{0}\" did not respond to ping in \"{1}\" seconds, {2}"
//  *Cause: 
// *Action: 
/
1072, NO_SUCH_NODE_FOR_OPERATION, "Invalid node \"{0}\" specified for checking the result of operation."
//  *Cause: 
// *Action: 
/
1073, TRANSFER_DIR_FATAL_ERROR, "Failed to transfer directory \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1074, ERROR_MSG_ON_NODE, "Error on node {0}:{1}"
//  *Cause: 
// *Action: 
/
1075, NO_USER_EQUIVALENCE, "User equivalence does not exist with nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1076, NULL_ORACLE_HOME, "Oracle Home is null"
//  *Cause: 
// *Action: 
/
1077, INVALID_FILES_SPECIFIED, "List file {0} has the following invalid files:{1}"
//  *Cause: 
// *Action: 
/
1078, TRANSFER_LISTED_DIRS_FATAL_ERROR, "Failed to transfer directories listed in \"{0}\" to any of the given nodes \"{1}\": {2}"
//  *Cause: 
// *Action: 
/
1079, NOT_SUBSET_OF_ORACLE_HOME, "{0} is not contained within an Oracle Home"
//  *Cause: 
// *Action: 
/
1080, TRANSFER_FILE_FATAL_ERROR, "Failed to transfer file \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1081, TRANSFER_LISTEDFILE_FATAL_ERROR, "Failed to transfer listed files in \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1082, CREATE_LISTED_DIR_FATAL_ERROR, "Failed to create listed directory in \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1083, REMOVE_LISTED_DIR_FATAL_ERROR, "Failed to remove listed directory in \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1084, CREATE_PATH_ERROR, "Failed to create path \"{0}\" in any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1085, GET_PRIVATE_NODE_NAME_FAIL, "Failed to retrieve Oracle private name for node \"{0}\""
//  *Cause: 
// *Action: 
/
1086, UNKNOWN_PATH_TYPE, "Unknown path type \"{0}\" specified for path \"{1}\" existence check"
//  *Cause: 
// *Action: 
/
1087, GET_NODE_VIP_FAIL, "Failed to retrieve virtual IP for node \"{0}\""
//  *Cause: 
// *Action: 
/
1088, FAILED_TO_LIST_FILES_FOR_TRANSFER, "Failed to recursively list files from the directories specified in file: {0}"
//  *Cause: 
// *Action: 
/
1089, EMPTY_INCL_FILE, "List file {0} is empty."
//  *Cause: 
// *Action: 
/
1090, ERROR_UPDATE_ENV, "Failed to update environment on nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1091, NULL_INCL_LIST_FILE, "The include list file passed is null"
//  *Cause: 
// *Action: 
/
1092, GET_CSS_VOTEDISKS_FAIL, "Failed to retrieve the location of votedisks: {0}"
//  *Cause: 
// *Action: 
/
1093, GET_CRS_SOFTWARE_VERSION_FAIL, "Failed to retrieve the version of crs software on node \"{0}\" : {1}"
//  *Cause: 
// *Action: 
/
1094, GET_CRS_ACTIVE_VERSION_FAIL, "Failed to retrieve the active version of crs: {0}"
//  *Cause: 
// *Action: 
/
1095, ERROR_REGISTER_OCX, "OLE initialization or OCX load error while registering OCX library on nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1096, ERROR_REBOOT_NODE, "Failed to do node reboot on nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1097, NOT_OCX_FILE, "The file, \"{0}\" is not an OCX"
//  *Cause: 
// *Action: 
/
1098, FAIL_TO_CREATE_NEWLIST, "Failed to create new listfile with proper UNC path from the path specified in file: {0}"
//  *Cause: 
// *Action: 
/
1099, NULL_IPADDRESSES, "The host names or IP addresses passed as an argument are null."
//  *Cause: 
// *Action: 
/
1100, PORT_ALREADY_IN_USE, "The network port {0} is already in use."
//  *Cause: 
// *Action: 
/
1101, PORT_NOT_AVAILABLE, "The network port {0} is not available for use."
//  *Cause: 
// *Action: 
/
1102, NOT_LOCAL_CSS_ERROR, "CSS is not configured with local-only OCR on node \"{0}\""
//  *Cause: 
// *Action: 
/
1103, CHECK_CSS_STATUS_FATAL_ERROR, "Failed to check CSS status for any of the given nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1104, PROP_NOT_FOUND_IN_FILE_ERROR, "Property, \"{0}\" is not found in file \"{1}\""
//  *Cause: 
// *Action: 
/
1105, LOCAL_CSS_HOME_FAIL, "Failed to retrieve the local CSS home for node \"{0}\""
//  *Cause: 
// *Action: 
/
1106, REMOVE_FILE_FAILED, "Failed to remove file \"{0}\" on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1107, LINK_FILE_FAILED, "Failed to create symbolic link from file \"{0}\" to \"{1}\" on node \"{2}\", {3}"
//  *Cause: 
// *Action: 
/
1108, COPY_FILE_FAILED, "Failed to copy file \"{0}\" on node \"{1}\" to file \"{2}\" on node \"{3}\", {4}"
//  *Cause: 
// *Action: 
/
1109, MOVE_FILE_FAILED, "Failed to move file \"{0}\" to file \"{1}\" on node \"{2}\", {3}"
//  *Cause: 
// *Action: 
/
1110, CREATE_DIR_FAILED, "Failed to create directory \"{0}\" on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1111, REMOVE_DIR_FAILED, "Failed to remove directory \"{0}\" on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1112, LIST_DIR_FAILED, "Failed to list contents of directory \"{0}\" on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1113, NO_SUCH_DIR_ON_NODE, "Directory \"{0}\" does not exist on node \"{1}\""
//  *Cause: 
// *Action: 
/
1114, NULL_REG_KEY_NAME, "Registry key name is null"
//  *Cause: 
// *Action: 
/
1115, NULL_REG_SUBKEY_NAME, "Registry subkey name is null"
//  *Cause: 
// *Action: 
/
1116, REG_CREATE_KEY_FAILED, "Failed to create registry subkey \"{0}\" under key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1117, REG_DELETE_KEY_FAILED, "Failed to delete registry subkey \"{0}\" under key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1118, REG_EXIST_KEY_FAILED, "Failed to check existence of registry key \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1119, SET_REG_DATA_FAILED, "Failed to set data for value \"{0}\" of registry key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1120, GET_REG_DATA_FAILED, "Failed to retrieve data for value \"{0}\" of registry key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1121, DELETE_REG_VALUE_FAILED, "Failed to delete value \"{0}\" of registry key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1122, NULL_SVC_NAME, "Service name is null"
//  *Cause: 
// *Action: 
/
1123, CREATE_SVC_FAILED, "Failed to create service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1124, CREATE_SVC_DEP_FAILED, "Failed to create service dependency between services \"{0}\" and \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1125, START_SVC_FAILED, "Failed to start service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1126, STOP_SVC_FAILED, "Failed to stop service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1127, DELETE_SVC_FAILED, "Failed to delete service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1128, INVALID_IF_PARAM_TYPE, "Invalid Interface type {0} is specified as an argument."
//  *Cause: 
// *Action: 
/
1129, INVALID_IP_PARAM_TYPE, "Invalid IP address type {0} is specified as an argument."
//  *Cause: 
// *Action: 
/
1130, NULL_VERSION, "Version argument is null."
//  *Cause: 
// *Action: 
/
1131, SET_USER_PERMS_FAILED, "Failed to set user permissions on path {0} on nodes {1}, [{2}]"
//  *Cause: 
// *Action: 
/
1132, SET_ADMIN_PERMS_FAILED, "Failed to set administrator permissions on path {0} on nodes {1}, [{2}]"
//  *Cause: 
// *Action: 
/
1133, NULL_DEPENDENCY_LIST, "The list of services, on which the service \"{0}\" is dependent, is null."
//  *Cause: 
// *Action: 
/
1134, REMOVE_SVC_DEP_FAILED, "Failed to remove service dependency between services \"{0}\" and \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1135, INVALID_REG_KEY_NAME, "Registry key name {0} is not valid, it must be fully defined registry key path"
//  *Cause: 
// *Action: 
/
1136, UNABLE_TO_FIND_DBVERSION, "Unable to find version for database with name  {0} "
//  *Cause: 
// *Action: 
/
1137, UNABLE_TO_FIND_VERSION, "Unable to find Version object with string value {0} "
//  *Cause: 
// *Action: 
/
1138, CHECK_SVC_FAILED, "Failed to check the state of service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1139, CHECK_OCR_CONFIGURED_FAILED, "Failed to check the state of ocr configuration on node \"{0}\""
//  *Cause: 
// *Action: 
/
1140, CHECK_OLR_CONFIGURED_FAILED, "Failed to check the state of olr configuration on node \"{0}\""
//  *Cause: 
// *Action: 
/
1141, SI_HA_NOT_SUPPORTED, "SI HA is not supported in version {0}. It is supported from version {1} onwards"
//  *Cause: 
// *Action: 
/
1142, NULL_USER_NAME, "User name is null"
//  *Cause: 
// *Action: 
/
1143, NULL_DOMAIN_NAME, "Domain name is null"
//  *Cause: 
// *Action: 
/
1144, FILE_NOT_FOUND, "File \"{0}\" not found."
//  *Cause: 
// *Action: 
/
1145, UMASK_FAILED, "Failed to execute umask: {0}"
//  *Cause: 
// *Action: 
/
1146, INVALID_PERMISSION, "Invalid permissions"
//  *Cause: 
// *Action: 
/
1147, INVALID_GROUP_REQUESTED, "Request to fetch an invalid group type \"{0}\" "
//  *Cause: 
// *Action: 
/
1148, GET_LOCAL_HOSTNAME_FAILED, "Failed to get host name for the local computer"
// *Cause: An error occurred while attempting to retrieve the TCP/IP host name
           via an Operating System interface. Additional messages describing 
           this error will also appear.
// *Action: Correct the problem indicated by the accompanying error messages.
/
1149, GET_OCR_LOCATIONS_FAILED, "Failed to get OCR locations"
// *Cause: An error occurred while attempting to retrieve the OCR locations, possibly due to missing or incorrrect OCR locations file, or incomplete OCR configuration, or due to missing or incorrect SRVM shared libraries.
// *Action: Verify that the Clusterware has been correctly installed and configured. Verify that the ocr.loc file is present and readable in the appropriate location for your platform.
/
1150, ERROR_GET_DRIVE_LETTERS, "Failed to get drive letters used on following nodes: \"{0}\" "
// *Cause: An error occurred while attempting to retrieve used drive letters on one or more nodes.
// *Action: Look at the accompanying messages and fix the error(s). The messages typically relate to a node not being reachable, or the remote execution service not running on the node, or some permissions issue when attempting to use the remote execution service on the remote node.
/
1151, PATH_DOES_NOT_EXIST, "The given path \"{0}\" does not exist"
// *Cause: The specified path may not have been created or an incorrect path has been specified.
// *Action: Make sure that the given path exists by specifying a correct existing path.
/
1152, PATH_NOT_DIRECTORY, "The specified path \"{0}\" is not a directory"
// *Cause: The specified path may be a file, not a directory, or an incorrect path may have been specified.
// *Action: Make sure to specify a path that is a valid directory path.
/
1153, REMOTE_EXEC_DIR_NOT_AVAIL, "No directory is available on the remote node \"{0}\" to copy the binary RemoteExecService.exe"
// *Cause: Either the path defined by value of registry key HKEY_LOCAL_MACHINE/System/CurrentControlSet/Services/OracleRemExecService is not available on the remote node, or the c:/temp/ directory is not available or not accessible on the specified remote node. 
// *Action: Make sure that the required path is available on the remote node.
/
1154, GET_SIHA_SOFTWARE_VERSION_FAIL, "Failed to retrieve the version of siha software on node \"{0}\" : {1}"
//  *Cause: 
// *Action: 
/
1155, TRIVIAL_NODE_LIST, "The node list provided had only one entry or had multiple entries that were duplicates of a single nodename entry"
//  *Cause: The list of nodes provided for the shared path check was either only one node, or the list included entries that were duplicates of the same single node.
// *Action: Please provide the correct nodelist for the cluster on which the check is being called, making sure that there are at least two distinct entries.
/
