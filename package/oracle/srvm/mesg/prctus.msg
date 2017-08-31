// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCtMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     06/08/09 - Add cause and action for messages
//     yizhang     05/26/09 - fix messages
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     ccharits    04/03/09 - add message to validate the number of fields
//                            returned by the oifcfg command
//     sowong      01/13/09 - add messages for bug7522237
//     ccharits    11/07/08 - Add message for getcrshome
//     yizhang     07/10/08 - Add cause and action for
//                            FAILED_TO_GET_LOCAL_NODE_NAME
//     sowong      08/20/08 - add messages for bug7321167
//     spavan      08/21/08 - Add failure message for startRemoteExecServer
//     ccharits    07/28/08 - Add messages for oifcfg
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file PrCsMsg.java
//     sowong      03/17/08 - add messages for asmcmd
//     ksviswan    01/09/08 - addnl messages for olsnodes
//     ksviswan    11/20/07 - add messages for olsnodesutil
//     sravindh    08/30/07 - Add messages for ofsutil
//     sowong      04/10/07 - rename PrktMsg to PrCtMsg
//     nvira       03/21/07 - fix missing resource exception remove
//     nvira       02/27/07 - fix bug5867248
//     nvira       01/12/07 - add message for failure in getting database name
//                            from datbase resource name
//     nvira       01/08/07 - add message for crsctl failure
//     nvira       12/13/06 - Move from oracle/cluster/cmdtools/resources to oracle/cluster/resources
//     rxkumar     11/15/06 - use Enums
//     sowong      10/04/06 - Creation
//  */
//
// /**
//  *  @version $Header: opsm/jsrc/oracle/cluster/resources/PrCtMsg.msg /main/16 2009/06/09 09:09:24 yizhang Exp $
//  *  @author  sowong
//  *  @since   release specific (what release of product did this appear in)
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, NULL_FILE_PATH, "File path is null"
//  *Cause: The supplied path is set to null.
// *Action: Oracle internal error. Contact customer support.
/
1001, NULL_NODE_NAME, "Node name is null"
//  *Cause: The supplied node name is set to null.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1002, COMMAND_TOOL_EXCEPTION, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1003, COMMAND_TOOL_FAIL, "Failed to run \"{0}\" on node \"{1}\""
//  *Cause: Failed to execute the specified command on the specifed node.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1004, NULL_DIR_NAME, "Directory name passed was null"
//  *Cause: The supplied directory name is set to null.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1005, NO_SUCH_DIRECTORY, "Directory {0} does not exist"
//  *Cause: The supplied directory path does not exist.
// *Action: Oracle internal error. Contact customer support.
/
1006, FAILED_TO_GET_CLUSTER_NAME, "Failed to retrieve cluster name from node \"{0}\""
//  *Cause: Failed to get the cluster name using 'olsnodes -c' from the specified node.
// *Action: Execute 'olsnodes -c' from the specified node and check the output of the command. Fix the problem according to the error message given in the command output.
/
1007, FAILED_TO_GET_LOCAL_NODE_NAME, "Failed to retrieve local node name"
//  *Cause: Underlying call failed to get the local hostname.
// *Action: Please check the underlying error message.
/
1008, FAILED_TO_GET_NODE_NAMES, "Failed to retrieve node names"
//  *Cause: Failed to get the node names using 'olsnodes' command.
// *Action: Execute command 'olsnodes' and check the output of the command. Fix the problem according to the error message given in the command output.
/
1009, CRSCTL_FAIL, "crsctl execution failed. Detailed error:\n{0}"
//  *Cause: Failed to execute crsctl command.
// *Action: Examine the accompanying error message for details. 
/
1010, CRSCTL_NODE_FAIL, "crsctl execution failed on node {0}. Detailed error:\n{1}"
//  *Cause: Failed to execute crsctl command on the specifed node.
// *Action: Examine the accompanying error message for details.
/
1011, COMMAND_TOOL_LOCAL_NODE_FAIL, "Failed to run \"{0}\""
//  *Cause: Failed to execute the specified command on the local node.
// *Action: Execute the specified command from the console and check the result. Fix the problem according to the error message given in the command output.
/
1012, INVALID_FILE_PATH, "Invalid file path {0}"
//  *Cause: The supplied path does not exist.
// *Action: Oracle internal error. Contact customer support.
/
1013, REMOTEEXECSERVER_FAILED_ON_LOCAL_NODE, "Failed to start remote execution server on local node."
//  *Cause: A remote execution server is required on this platform, but an attempt to start one on this node failed.  This message is accompanied by other(s) providing details on the failure.
//  *Action: Correct the problem indicated by the accompanying error messages.  On Windows systems, make sure that the current user has authority to remove and create directories and files in the Temp directory and to create and delete registry entries.
/
1050, KFOD_PARSE_OUTPUT_FAIL, "Failed to parse output returned by kfod when executing kfod at location {0}"
//  *Cause: Failed to parse the output returned by executing kfod because the output string is null or has fewer rows than expected
// *Action: This is an internal error. Contact Oracle Support Services.
/
1051, KFOD_PARSE_OUTPUT_NODE_FAIL, "Failed to parse the output returned by kfod for node {0} when executing kfod at location {1}"
//  *Cause: Failed to parse the output returned by executing kfod on the specified node because the output string is null or has fewer rows than expected.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1052, KFOD_PARSE_VALUE_FAIL, "Failed to parse output {0} returned by kfod when executing kfod at location {1}"
//  *Cause: Failed to parse the output returned by executing kfod because the output has fewer columns than expected.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1053, KFOD_PARSE_VALUE_NODE_FAIL, "Failed to parse output {0} returned by kfod for node {1} when executing kfod at location {2}"
//  *Cause: Failed to parse the output returned by executing kfod on the specified node because the output has fewer columns than expected.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1054, ASM_ACTIVE_VERSION_FAIL, "Fail to retrieve ASM active version for local node"
//  *Cause: Failed to get the active version of ASM by executing 'kfod nohdr=true op=version hostlist=<hostlist>'.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1055, KFOD_ASM_ACTIVE_VERSION_NODE_FAIL, "Fail to retrieve ASM active version for node {0}. kfod execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Failed to get the active version of ASM by executing 'kfod nohdr=true op=version hostlist=<hostlist>' on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1056, KFOD_ASM_INSTANCE_TYPE_FAIL, "Fail to retrieve ASM instance type. kfod execution failed at location {0}. Detailed error:\n{1}"
//  *Cause: Failed to get the instance type for ASM instance by executing 'kfod nohdr=true op=version'.
// *Action: Examine the accompanying error messages for details.
/
1057, KFOD_WRONG_ASM_INST_TYPE_OUTPUT, "The value of ASM instance type {0} is not correct"
//  *Cause: The value of ASM instance type is invalid.
// *Action: The instance type of ASM can only be YES or NO.
/
1058, KFOD_CHECK_ASM_RUNNING_FAIL, "Fail to check if ASM is running on node {0}. kfod execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Failed to check whether ASM is running by executing 'kfod nohdr=true op=insts hostlist=<hostlist>'.
// *Action: Examine the accompanying error messages for details.
/
1059, KFOD_GET_DISKGROUP_NAMES_FAIL, "Fail to retrieve list of disk group names for node {0}. kfod execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Failed to get the diskgroup names by executing 'kfod nohdr=true op=groups hostlist=<hostlist>'.
// *Action: Examine the accompanying error messages for details.
/
1100, OFS_ACTIVE_VERSION_FAIL, "Failed to retrieve ACFS active version for local node"
//  *Cause: Failed to execute acfsutil to retrieve the ACFS active version on the local node.
// *Action: Review the underlying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1101, OFS_ACTIVE_VERSION_NODE_FAIL, "Failed to retrieve ACFS active version for node {0}. acfsutil execution failed at file location {1}. Detailed error:\n{2}"
//  *Cause: Failed to execute acfsutil to retrieve the ACFS active version on the supplied node.
// *Action: Review the underlying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1102, OFS_PARSE_OUTPUT_FAIL, "Failed to parse output when executing acfsutil at file location {0}"
//  *Cause: Unable to parse output returned by acfsutil.
// *Action: Oracle internal error. Contact customer support.
/
1103, OFS_PARSE_OUTPUT_NODE_FAIL, "Failed to parse the output for node {0} when executing acfsutil at file location {1}"
//  *Cause: Unable to parse output returned by acfsutil on the supplied node.
// *Action: Oracle internal error. Contact customer support.
/
1104, OFS_PARSE_VALUE_FAIL, "Failed to parse output {0} when executing acfsutil at file location {1}"
//  *Cause: Unable to parse output returned by acfsutil at specified location.
// *Action: Oracle internal error. Contact customer support.
/
1105, OFS_PARSE_VALUE_NODE_FAIL, "Failed to parse output {0} for node {1} when executing acfsutil at file location {2}"
//  *Cause: Unable to parse output returned by acfsutil at specified location on the supplied node.
// *Action: Oracle internal error. Contact customer support.
/
1106, OFSUTIL_INVALID_LOCATION, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1107, OFSUTIL_NODE_FAIL, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1108, OFSUTIL_INVALID_NODE, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1109, OFSUTIL_PARSE_DISKGROUPNAMES_FAIL, "Failed to get diskgroup names for node {0}"
//  *Cause: Unable to parse disgkroup names returned by acfsutil on the supplied node.
// *Action: Oracle internal error. Contact customer support.
/
1110, OFSUTIL_EMPTY_RESULT, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1111, OFSUTIL_EMPTY_RESULT1, "Received empty result while getting ACFS Mount Points on node {1}"
//  *Cause: The output returned by acfsutil is empty.
// *Action: Oracle internal error. Contact customer support.
/
1112, OFSUTIL_COMMAND_FAIL, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1113, OFSUTIL_NULL_LOCATION, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1114, OFSUTIL_COMMAND_FAIL_WITH_PATH, "Execution of acfsutil command failed on node {0} for location {1}"
//  *Cause: Failed to execute acfsutil on the supplied node at the specified location.
// *Action: Review the underlying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1115, OFSUTIL_NODE_FAIL_WITH_MSG, "Execution of acfsutil failed on node {0} with result {1}"
//  *Cause: Failed to execute acfsutil on the supplied node.
// *Action: Review the underlying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1116, OFSUTIL_INVALID_LOCATION_NODE, "Invalid partition path {0} specified to acfsutil on node {1}"
//  *Cause: The supplied path path does not exist.
// *Action: Supply a valid partition path and retry.
/
1117, OFSUTIL_EMPTY_RESULT2, "Received empty result while getting ACFS Disk Groups on node {1}"
//  *Cause: The output returned by acfsutil is empty.
// *Action: Oracle internal error. Contact customer support.
/
1118, OFSUTIL_EMPTY_RESULT3, "Received empty result while getting total space at file location {0} on node {1}"
//  *Cause: The output returned by acfsutil is empty.
// *Action: Oracle internal error. Contact customer support.
/
1119, OFSUTIL_EMPTY_RESULT4, "Received empty result while getting free space at file location {0} on node {1}"
//  *Cause: The output returned by acfsutil is empty.
// *Action: Oracle internal error. Contact customer support.
/
1120, OFSUTIL_NULL_LOCATION_NODE, "A NULL path has been specified for the location on node {0}"
//  *Cause: A null path was provided for the location.
// *Action: Oracle internal error. Contact customer support.
/
1121, OFSUTIL_FAIL_WITH_MSG, "Execution of acfsutil failed on local node with result {0}"
//  *Cause: Execution of acfsutil failed on the local node.
// *Action: Review the underlying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1122, OFSUTIL_EMPTY_RESULT_MTPOINT, "Received empty result while getting mountpoint for path {0} on the local node"
//  *Cause: acfsutil returned an empty value when querying for the mountpoint of a specified path.
// *Action: Oracle internal error. Contact customer support.
/
1123, OFSUTIL_INVALID_MTPOINT, "The mountpoint is either set to null or empty"
//  *Cause: The supplied mountpoint is either an empty string or is set to null.
// *Action: Oracle internal error. Contact customer support.
/
1124, OFSUTIL_EMPTY_RESULT_VOLDEVICE, "Received empty result while getting volume device for mountpoint {0} on the local node"
//  *Cause: acfsutil returned an empty value when querying for the volume device of a specified mountpoint.
// *Action: Oracle internal error. Contact customer support.
/
1125, INVALID_VOLDEVICE, "The volume device is either set to null or empty"
//  *Cause: The supplied volume device is either an empty string or is set to null.
// *Action: Oracle internal error. Contact customer support.
/
1126, ACFSUTIL_DEV_EMPTY_RESULT_MTPOINT, "Received empty result while getting mountpoint for volume device {0} on the local node"
//  *Cause: acfsutil returned an empty value when querying for the volume device of a specified mountpoint.
// *Action: Oracle internal error. Contact customer support.
/
1127, ACFSUTIL_EMPTY_RESULT_VOLDEVICES, "Received empty result while getting all volume devices on the local node"
//  *Cause: No ACFS volume devices has been created.
// *Action: Use usmca to create ACFS volume devices.
/
1128, ACFS_NOT_SUPPORTED, "ACFS is not supported on this operating system"
//  *Cause: ACFS is not supported on the underlying operating system.
// *Action: Run srvctl filesystem command on a supported operating system.
/
1129, USM_DRIVER_FAIL_WITH_MSG, "Execution of usm_driver_state failed on local node with result {0}"
//  *Cause: Execution of usm_driver_state failed on the local node
// *Action: Review the underlying error messages that provides the details of why usm_driver_state execution failed. Resolve the reported problem and retry.
/
1130, ADVMUTIL_FAIL_WITH_MSG, "Execution of advmutil failed on local node with result {0}"
//  *Cause: Execution of advmutil failed on the local node
// *Action: Review the underlying error messages that provides the details of why advmutil execution failed. Resolve the reported problem and retry.
/
1150, FAILED_TO_GET_ORCL_CLUSTER_NAME, "Failed to retrieve cluster name"
//  *Cause: Clusterware is not running.
// *Action: Make sure the clusterware is running.
/
1151, FAILED_TO_GET_NODE_STATUS, "Failed to retrieve cluster nodes status"
//  *Cause: Clusterware is not running.
// *Action: Make sure the clusterware is running.
/
1152, OLSNODES_EMPTY_RESULT, "Received empty result while getting cluster nodes Status Map"
//  *Cause: The olsnodes command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1153, OLSNODES_EMPTY_RESULT1, "Received empty result while getting a list of pinned and unpinned nodes in the cluster"
//  *Cause: The olsnodes command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1200, ASMCMD_GET_DG_FAIL, "Failed to retrieve disk group name for volume device {0}. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Unable to retrieve the disk group name for the specified volume device
// *Action: Check that ASM instance is running on the local node.
/
1201, ASMCMD_GET_VOL_NAME_FAIL, "Failed to retrieve volume name for volume device {0}. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Unable to retrieve the volume name for the specified volume device
// *Action: Check that ASM instance is running on the local node.
/
1202, ASMCMD_PARSE_OUTPUT_FAIL, "Failed to parse output returned by asmcmd when executing asmcmd at location {0}"
//  *Cause: Unable to parse output returned by asmcmd.
// *Action: Oracle internal error. Contact customer support.
/
1203, ASMCMD_PARSE_OUTPUT_NODE_FAIL, "Failed to parse the output returned by asmcmd for node {0} when executing asmcmd at location {1}"
//  *Cause: This is an internal error.
// *Action: Contact Oracle customer support.
/
1204, ASMCMD_VOL_DEVICE_NOT_EXIST, "Failed to find volume device {0}. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Volume device does not exist.
// *Action: Create the volume device using asm tools.
/
1205, ASMCMD_PARSE_VALUE_FAIL, "Failed to parse output {0} returned by asmcmd when executing asmcmd at location {1}"
//  *Cause: Unable to parse the specified output returned by asmcmd.
// *Action: Oracle internal error. Contact customer support.
/
1206, ASMCMD_PARSE_VALUE_NODE_FAIL, "Failed to parse output {0} returned by asmcmd for node {1} when executing asmcmd at location {2}"
//  *Cause: Unable to parse the specified output returned by asmcmd on specified node.
// *Action: Oracle internal error. Contact customer support.
/
1207, ASMCMD_ORACLE_SID_FAIL, "Failed to set the ORACLE_SID for running asmcmd from CRS home location {0}"
//  *Cause: Unable to retrieve the ASM instance name on the local node to generate the ORACLE_SID value.
// *Action: Use crsctl to make sure that the CRS stack is up; use 'srvctl status asm' to make sure that the ASM resource is running on the local node.
/
1300, OIFCFG_FAIL, "oifcfg execution failed. Detailed error:\n{0}"
//  *Cause: Failed to execute the oifcfg command for the local node. See the underlying error message for further details.
// *Action: Try to execute the oifcfg command manually.
/
1301, OIFCFG_NODE_FAIL, "oifcfg execution failed on node {0}. Detailed error:\n{1}"
//  *Cause: Failed to execute the oifcfg command for the remote node. See the underlying error message for further details.
// *Action: Try to execute the oifcfg command manually.
/
1302, INVALID_IPADDR_FORMAT, "The \"{0}\" has an invalid IP address format"
//  *Cause: The format of the subnet number and/or the subnet mask is an invalid IP address format.
// *Action: Make sure that both the subnet number and the subnet mask have a valid IP address format.
/
1303, NOT_ENOUGH_OIFCFG_RESULT_FIELDS, "The oifcfg command returned as result the line \"{0}\" that has less than 4 fields"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1400, GETCRSHOME_FAIL, "getcrshome execution failed. Detailed error:\n{0}"
//  *Cause: Failed to execute the getcrshome command. See the underlying error message for further details.
// *Action: Try to execute the getcrshome command manually.
/
1401, GETCRSHOME_NODE_FAIL, "getcrshome execution failed on node {0}. Detailed error:\n{1}"
//  *Cause: Failed to execute the getcrshome command. See the underlying error message for further details.
// *Action: Try to execute the getcrshome command manually.
/
