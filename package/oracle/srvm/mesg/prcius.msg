// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCiMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     06/04/09 - Add cause and action for messages
//     yizhang     05/29/09 - fix messages
//     sravindh    05/13/09 - Add messages for ACFS check API
//     sravindh    05/05/09 - Review comments
//     sravindh    05/03/09 - Bug 8416623
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     ccharits    08/07/08 - add messages for length mismatch between the IP address and the subnet mask
//                            and for invalid format of the result after applying the mask to the IP address
//     ksviswan    06/03/08 - add message for getClustername failure
//     nvira       04/17/08 - add message for isHAConfig failure without HAhome
//     nvira       02/29/08 - add method for active version in a non cluster
//                            env error
//     sowong      02/27/08 - add messages for bug6660902
//     ksviswan    01/08/08 - add message for dynamic VIP check
//     nvira       03/27/07 - change id() to name()
//     sowong      03/23/07 - add message for install failures
//     nvira       01/12/07 - review comments
//     nvira       01/02/07 - add message for null db name
//     nvira       12/15/06 - Message file for ClusterwareInfo
//     nvira       12/15/06 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
1000, GET_INSTALL_INFO_FAILED, "Failed to retrieve install information on local node using OUI location {0}"
//  *Cause: An attempt to retrieve install information on the local node from the specified location failed.
// *Action: Examine the accompanying error messages for details.
/
1001, GET_REMOTE_INSTALL_INFO_FAILED, "Failed to retrieve install information on remote node {0} using OUI location {1}"
//  *Cause: An attempt to retrieve install information on a remote node from the specified location failed.
// *Action: Examine the accompanying error messages for details.
/
1100, GET_VENDOR_CLUSTER_FAILED, "Failed to get Vendor Cluster for CRS home {0}"
//  *Cause: Unable to locate vendor cluster library or execute lsnodes.
// *Action: Install Vendor Clusterware. Then try to run lsnodes again.
/
1101, GET_VENDOR_CLUSTER_NODE_FAILED, "Failed to get Vendor Cluster for CRS home {0} on node {1}"
//  *Cause: Unable to locate vendor cluster library or execute lsnodes on the specified node.
// *Action: Install Vendor Clusterware on the specified node. Then try to run lsnodes again.
/
1102, GET_ORACLECM_CLUSTER_FAILED, "Failed to get OracleCM Cluster for CRS home {0}"
//  *Cause: Failed to get OracleCM Cluster for the local node using CRS home provided.
// *Action: Install Oracle 9i and make sure that /etc/ORCLcluster exists.
/
1103, GET_ORACLECM_CLUSTER_NODE_FAILED, "Failed to get OracleCM Cluster for CRS home {0} on node {1}"
//  *Cause: Failed to get OracleCM Cluster for the specified node using CRS home provided.
// *Action: Examine the accompanying error messages for details.
/
1104, HA_RUNNING_CHECK_FAILED, "Failed to check Oracle Restart running state for Oracle Restart home {0}"
//  *Cause: Failed to check whether Oracle Restart is running from the specified home on the local node.
// *Action: Examine the accompanying error messages for details.
/
1105, HA_RUNNING_NODE_CHECK_FAILED, "Failed to check Oracle Restart running state for Oracle Restart home {0} on node {1}"
//  *Cause: Failed to check whether Oracle Restart is running from the specified home on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1106, HA_CONFIGURED_NODE_CHECK_FAILED, "Failed to check Oracle Restart configuration state for Oracle Restart home {0} on node {1}"
//  *Cause: Failed to check whether Oracle Restart is configured for the specified home on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1107, CRS_RUNNING_CHECK_FAILED, "Failed to check CRS running state for CRS home {0}"
//  *Cause: Failed to check whether Oracle Clusterware is running from the specified home on the local node.
// *Action: Examine the accompanying error messages for details.
/
1108, CRS_RUNNING_NODE_CHECK_FAILED, "Failed to check CRS running state for CRS home {0} on node {1}"
//  *Cause: Failed to check whether Oracle Clusterware is running from the specified home on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1109, CRS_CONFIGURED_CHECK_FAILED, "Failed to check CRS configuration state for CRS home {0}"
//  *Cause: Failed to check whether Oracle Clusterware is configured for the specified home on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1110, CRS_CONFIGURED_NODE_CHECK_FAILED, "Failed to check CRS configuration state for CRS home {0} on node {1}"
//  *Cause: Failed to check whether Oracle Clusterware is configured for the specified home on the local node.
// *Action: Examine the accompanying error messages for details.
/
1111, NULL_FILE_PATH, "File path is null"
//  *Cause: The specified file is null or an empty string.
// *Action: Provide a valid file path that is not null. 
/
1112, NULL_DIR_NAME, "Directory name passed was null"
//  *Cause: The specified directory name is null or an empty string.
// *Action: Provide a valid directory name that is not null.
/
1113, NO_SUCH_DIRECTORY, "Directory {0} does not exist"
//  *Cause: Could not find the specified directory or it was a file instead of a directory.
// *Action: Provide an existing directory name.
/
1114, NULL_NODE_NAME, "Node name is null"
//  *Cause: The specified node name is null or an empty string.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1115, NULL_DB_NAME, "argument passed is null"
//  *Cause: The specified database name is null or an empty string.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1116, DB_EXISTS_CHECK_FAILED, "Failed to check if a database named {0} exists"
//  *Cause: Failed to execute the command 'crsctl stat resource <database_resource_name>' to decide whether the specified database exists or not.
// *Action: Examine the accompanying error messages for details.
/
1117, GET_HA_MANAGED_DB_FAILED, "Failed to retrieve list of databases under high availability management"
//  *Cause: Failed to execute the command 'crsctl stat resource -w TYPE=ora.database.type <filter>' in order to get the list of databases managed by Oracle Restart.
// *Action: Examine the accompanying error messages for details.
/
1118, ASM_DEPENDENCY_CHECK_FAILED, "Failed to determine if database {0} depends on Automatic Storage Management"
//  *Cause: Failed to execute crsctl command to decide whether the specified database depended on Automatic Storage Management (ASM).
// *Action: Examine the accompanying error messages for details.
/
1119, DB_EXISTS_CHECK_NODE_FAILED, "Failed to check if a database named {0} exists on node {1}"
//  *Cause: Failed to decide whether the specified database exists or not on the specified node because the specified node is null or an invalid node or crsctl command execution failed. 
// *Action: Examine the accompanying error messages for details.
/
1120, GET_HA_MANAGED_DB_NODE_FAILED, "Failed to retrieve list of databases under high availability management for node {0}"
//  *Cause: Failed to get the list of database managed by Oracle Restart on the specified node because the specified node is null or an invalid node or crsctl command execution failed. 
// *Action: Examine the accompanying error messages for details.
/
1121, ASM_DEPENDENCY_CHECK_NODE_FAILED, "Failed to determine if database {0} depends on Automatic Storage Management on node {1}"
//  *Cause: Failed to execute crsctl command to decide whether the specified database depended on Automatic Storage Management (ASM) on the specified node because the specified node is null or an invalid node or crsctl command execution failed. 
// *Action: Examine the accompanying error messages for details.
/
1122, VIP_DHCP_CHECK_FAILED, "Failed to determine if the public network is using dynamic address assignment (DHCP)"
//  *Cause: An attempt to determine whether the public network is using dynamic address assignment (DHCP) failed.
// *Action: Examine the accompanying error messages for details.
/
1123, CRS_NOT_EXIST, "CRS home does not exist on the local node"
//  *Cause: CRS home is not installed on the local node.
// *Action: Install a CRS home using the Oracle Universal Installer.
/
1124, HA_NOT_EXIST, "Oracle Restart home does not exist on the local node"
//  *Cause: Oracle Restart home is not installed.
// *Action: Install an Oracle Restart home using the Oracle Universal Installer.
/
1125, CRS_NOT_EXIST_NODE, "CRS home does not exist on node {0}"
//  *Cause: CRS home is not installed on the specified node.
// *Action: Install a CRS home using the Oracle Universal Installer.
/
1126, HA_NOT_EXIST_NODE, "Oracle Restart home does not exist on node {0}"
//  *Cause: Oracle Restart home is not installed on the specified node.
// *Action: Install an Oracle Restart home using the Oracle Universal Installer.
/
1127, GET_ACTV_VRSN_FAILED_CRS_NOT_CONFIG, "CRS active version cannot be queried in a non-cluster environment"
//  *Cause: Clusterware is not configured.
// *Action: Ensure that Clusterware is configured.
/
1128, HA_CONFIGURED_CHECK_FAILED, "Failed to check Oracle Restart configuration state for Oracle Restart home {0}"
//  *Cause: Oracle Restart may not be configured
// *Action: Ensure that Oracle Restart is installed and configured
/
1128, HA_CONFIGURED_NO_HOME_CHECK_FAILED, "Failed to check Oracle Restart configuration state"
//  *Cause: Oracle Restart may not be configured
// *Action: Ensure that Oracle Restart is installed and configured
/
1129, HA_CONFIGURED_NODE_NO_HOME_CHECK_FAILED, "Failed to check Oracle Restart configuration state on node {1}"
//  *Cause: Oracle Restart may not be configured
// *Action: Ensure that Oracle Restart is installed and configured
/
1130, CRS_CONFIGURED_NO_HOME_CHECK_FAILED, "Failed to check CRS configuration state"
//  *Cause: Clusterware CRS may not be configured
// *Action: Ensure that Clusterware CRS is installed and configured
/
1131, CRS_CONFIGURED_NODE_NO_HOME_CHECK_FAILED, "Failed to check CRS configuration state on node {1}"
//  *Cause: Clusterware CRS may not be configured
// *Action:  Ensure that Clusterware CRS is installed and configured
/
1132, GET_CLUSTERNAME_FAILED, "Failed to get clustername for CRS home {0} and version {1}"
//  *Cause: Clusterware is not configured and CRS stack is not up
// *Action:  Ensure that Clusterware CRS is installed and configured and the stack is up.
/
1133, IPADDR_SUBNETMASK_LENGTH_MISMATCH, "The IP address {0} does not have the same number of fields with the subnet mask {1}"
//  *Cause: IP address is in IPv4 address format while the subnet mask is in IPv6 address format or the other way around. 
// *Action:  Ensure that both the IP address and the subnet mask use the same representation (the longer required among IPv4 and IPv6).
/
1134, INVALID_RESULTING_SUBNET_FORMAT, "Applying subnet mask {0} to IP address {1} resulted in an invalid IP address format"
//  *Cause: This won't ever happen. Message added just in case.  
// *Action: N/A
/
1135, ISPATHONACFS_CHECK_FAILED, "Failed to check if path {0} on node {1} is on ACFS"
// *Cause:  An attempt to determine if the specified path is on ACFS failed.
//     This can occur because:
//     1. The Clusterware stack is down on the specified node.
//     2. ASM is down on the specified node.
//     3. A diskgroup associated with the path is not online.
//     4. The path is not mounted.
// *Action: Perform checks corresponding to the above causes:
//     1. Ensure the Clusterware stack is running on the specified node.
//     2. Ensure that ASM is running on the specified node.
//     3. Ensure that the diskgroup associated with the path is online.
//     4. Ensure that the file system is mounted on the node.
/
1136, PATH_NOT_ON_ACFS, "The specified path {0} is not on Oracle Automatic Storage Manager Cluster File System (ACFS)"
// *Cause: The specified path is not on ACFS.
// *Action: Specify a path that is on ACFS. This check will only accept paths on ACFS.
/
