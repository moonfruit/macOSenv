// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrkrMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     05/28/09 - fix messages
//     rxkumar     03/19/09 - fix bug8340873
//     sravindh    07/25/08 - Add message for OCR locations retreival failure
//     rajkris     02/14/07 - add CLUSTER_DETECTION_FAILED
//     rxkumar     04/19/06 - fix VERSION_MISMATCH msg 
//     bkannike    04/21/06 - 
//     rxkumar     01/04/05 - fix BAD_ARGUMENT message 
//     samjo       04/14/03 - Changing from repository to registry
//     rdasari     10/22/02 - add OCR_INIT_ERROR message
//     surchatt    11/06/02 - 
//     surchatt    11/05/02 - adding new message
//     rdasari     09/17/02 - add HA_DAEMONS_RUNNING message
//     surchatt    09/12/02 - adding messages
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     dliu        07/19/02 - change #paras in MOV_INST
//     rdasari     07/30/02 - add banner for vip_range export
//     samjo       04/08/02 - Changing from raw device to configuration repository
//     surchatt    03/05/02 - changing strange messages.
//     jcreight    02/06/02 - Clarify srvconfig -init option.
//     rxkumar     11/16/01 - add string for NULL_CONFIG.
//     dliu        10/29/01 - change #parameters in ADD_INST.
//     sowong      11/12/01 - Add new message for getting uid
//     dliu        10/29/01 - change #parameters in ADD_INST.
//     dliu        09/06/01 - add new mesgs for services.
//     surchatt    02/08/01 - 
//     surchatt    02/08/01 - changing for OPS to ORAC name change
//     dliu        12/05/00 - add NO_ENV.
//     rxkumar     11/03/00 - change version 8.2->9.0
//     rxkumar     08/17/00 - fix BUSY_RAW_DEVICE message.
//     rxkumar     08/07/00 - add INVALID_REGISTRY_ENTRY
//     rxkumar     07/18/00 - change RawDeviceUtil references to opsconfig.
//     rxkumar     07/13/00 - add RawDeviceUtil related messages.
//     rxkumar     07/07/00 - add INVALID_RAW_DEVICE
//     rxkumar     06/12/00 - add Raw Device version related messages.
//     jcreight    06/09/00 - Add message for listParallelServers
//     rxkumar     05/26/00 - add NO_CONFIG_LOC error message.
//     rxkumar     05/23/00 - fix compilation error.
//     rxkumar     05/19/00 - add more messages.
//     rxkumar     05/15/00 - define more error messages.
//     rxkumar     05/12/00 - add PrkrMsg.java file
//     rxkumar     05/12/00 - Creation
//  */
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/mgmt/resources/PrkrMsg.msg /main/4 2009/06/07 21:18:00 yizhang Exp $
//  *  @author  rxkumar
//  *  @since   1.0
//  */
// 
// PACKAGE=package oracle.ops.mgmt.resources;
// MSGIDTYPE=interface
1001, NO_OPS, "cluster database {0} does not exist"
//  *Cause: The cluster database was never registered in the repository.
// *Action: Check if the database has been configured by printing a list of all cluster databases using 'srvctl config'.
/
1002, OPS_EXISTS, "cluster database {0} already exists"
//  *Cause: An attempt was made to register a cluster database which already existed in the repository.
// *Action: Check if the database has already been configured by printing a list of all cluster databases using 'srvctl config'.
/
1003, NO_INST, "instance {0} does not exist"
//  *Cause: The named instance was never registered in the repository.
// *Action: Use 'srvctl config instance' to check if the instance is registered in the repository.
/
1004, INST_EXISTS, "instance {0} already exists"
//  *Cause: 
// *Action: 
/
1005, ADD_CONFIG, "adding of cluster database {0} configuration failed, {1}"
//  *Cause: Internal error.
// *Action: Contact your customer support representative.
/
1006, DEL_CONFIG, "deleting of cluster database {0} configuration failed, {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1007, GET_CONFIG, "getting of cluster database {0} configuration failed, {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1008, ADD_INST, "adding of instance {0} on node {1} to cluster database {2} failed."
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1009, DEL_INST, "deleting of instance {0} from cluster database {1} failed, {2}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1010, MOV_INST, "moving of instance {0} to node {1} of cluster database {2} failed."
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1011, REN_INST, "renaming of instance {0} to instance {1} of cluster database {2} failed, {3}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1012, SERIAL_CONFIG, "error {0} while serializing configuration of cluster database {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1013, DESERIAL_CONFIG, "error {0} while deserializing configuration of cluster database {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1014, SERIAL_DIR, "error {0} while serializing directory"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1015, DESERIAL_DIR, "error {0} while deserializing directory"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1016, READ_CONFIG, "reading of cluster database {0} configuration failed, {1}, {2}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1017, WRITE_CONFIG, "writing of cluster database {0} configuration failed, {1}, {2}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1018, READ_DIR, "reading of directory failed, {0}, {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1019, WRITE_DIR, "writing of directory failed, {0}, {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1020, READ_VERSION, "reading of version information failed, {0}, {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1021, WRITE_VERSION, "writing of version information failed, {0}, {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1022, INCOMPATIBLE, "Cluster registry {0} contains incompatible version, {1} != {2}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1023, FILE_NOT_FOUND, "file {0} does not exist"
//  *Cause: The named file did not exist.
// *Action: Specify a file that exists.
/
1024, NO_FILE_PERMS, "file {0} does not have {1} permissions"
//  *Cause: The named file did not have the specified permission.
// *Action: Try changing the permission on the file to the specified permission.
/
1025, PROPERTY_NOT_FOUND, "file {0} does not contain property {1}"
//  *Cause: The file did not contain the specified property.
// *Action: Contact Oracle Support Services.
/
1026, PROPERTY_NOT_SET, "property {0} not set in file {1}"
//  *Cause: The file did not contain the specified property.
// *Action: Contact Oracle Support Services.
/
1027, NO_OPS_LIST, "failed to retrieve list of cluster databases"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1028, INVALID_RAW_DEVICE, "Cluster registry {0} is invalid\n[HINT: initialize cluster registry by using \"srvconfig\" tool]"
//  *Cause: The management repository was never initialized.
// *Action: Use 'srvconfig -init' to initialize the repository.
/
1029, UTIL_BANNER, "Usage: srvconfig [options]\n\nwhere options include:"
//  *Cause: 
// *Action: 
/
1030, UTIL_HELP, "	-help        display command-line help message"
//  *Cause: 
// *Action: 
/
1031, UTIL_QMARK, "	-?           same as -help option"
//  *Cause: 
// *Action: 
/
1032, UTIL_INIT, "	-init        initialize cluster registry (if not already initialized)"
//  *Cause: 
// *Action: 
/
1033, UTIL_INITF, "	-init -f     force intialization of configuration even if initialized"
//  *Cause: 
// *Action: 
/
1034, UTIL_EXPORT, "	-exp <file>  export cluster registry contents to given text file"
//  *Cause: 
// *Action: 
/
1035, UTIL_IMPORT, "	-imp <file>  import given text file contents to the cluster registry"
//  *Cause: 
// *Action: 
/
1036, UTIL_CONVERT, "	-conv <file> convert given config file contents into 9.0 style configuration"
//  *Cause: 
// *Action: 
/
1037, UTIL_VERSION, "	-version     display cluster database configuration version information"
//  *Cause: 
// *Action: 
/
1038, INVALID_INIT, "invalid argument {0} specified to -init option"
//  *Cause: 
// *Action: 
/
1039, INVALID_OPT, "invalid option {0} specified"
//  *Cause: The specified option was invalid.
// *Action: Check the command documentation or the inline help display for usage details.
/
1040, MISSING_FILE, "missing <file> argument for {0} option"
//  *Cause: The specified option was invalid for srvconfig.
// *Action: Check the command documentation or the inline help display for usage details.
/
1041, SUCC_INIT, "srvconfig successfully initialized cluster registry"
//  *Cause: 
// *Action: 
/
1042, SUCC_IMPORT, "srvconfig successfully imported configurations from file \"{0}\" for cluster databases {1}"
//  *Cause: 
// *Action: 
/
1043, SUCC_EXPORT, "srvconfig successfully exported cluster database configurations to file \"{0}\""
//  *Cause: 
// *Action: 
/
1044, SUCC_CONVERT, "srvconfig successfully converted configuration of cluster database \"{0}\""
//  *Cause: 
// *Action: 
/
1048, EXPORT_BANNER, "# PLEASE DO NOT EDIT THIS FILE - it is \"srvconfig\" generated"
//  *Cause: 
// *Action: 
/
1049, CONFIG_BANNER, "\n########## Configuration of cluster database \"{0}\" follows ##########\n"
//  *Cause: 
// *Action: 
/
1050, FILE_CREATE, "file {0} creation in {1} directory failed"
//  *Cause: Either the directory did not exist or it did not have the required permissions.
// *Action: Create the directory if it did not exist or change the permission of the directory.
/
1051, NO_ORATAB_ENTRY, "file {0} does not contain an entry for dbname {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1052, INVALID_CONFIG_FILE, "file name {0} is not of <cluster database name>.conf form"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1053, INVALID_RANGE_SPEC, "invalid range {0} specified in node_list = {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1054, INVALID_PARAM_SPEC, "invalid parameter {0} specified in inst_oracle_sid = {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1055, EXTRA_ARGS, "invalid extra arguments {0} specified to {1} option"
//  *Cause: Provided invalid arguments to srvconfig.
// *Action: Check the command documentation or the inline help display for usage details.
/
1056, INVALID_REGISTRY_ENTRY, "invalid registry entry {0} found; should be of form {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1057, NO_ENV, "environment variable does not exist"
//  *Cause: Attempted to retrieve non existing environment variable.
// *Action: Set the environment variable.
/
1058, NO_SERV, "Service {0} does not exist in cluster database {1}."
//  *Cause: 
// *Action: 
/
1059, NO_NODE, "Node {0} does not exist."
//  *Cause: 
// *Action: 
/
1060, ADD_NODECONF_FAIL, "Failed to add configuration for node {0}"
//  *Cause: 
// *Action: 
/
1061, REMOTE_COMMAND_FAIL, "Failed to run remote command to get node configuration for node {0}"
//  *Cause: 
// *Action: 
/
1062, NODECONF_NOT_FOUND, "Failed to find configuration for node {0}"
//  *Cause: 
// *Action: 
/
1063, VIP_EXISTS, "VIP {0} is already existing"
//  *Cause: 
// *Action: 
/
1064, OCR_ERROR, "SRVM configuration operation failed due to Oracle Cluster Registry error :"
//  *Cause: 
// *Action: 
/
1066, DOMAIN_MISMATCH, "cluster database domain does not match"
//  *Cause: 
// *Action: 
/
1067, DB_GETENV, "Failed to get environment for cluster database {0}, {1}"
//  *Cause: 
// *Action: 
/
1068, INST_GETENV, "Failed to get environment for instance {1} of cluster database {0}, {2}"
//  *Cause: 
// *Action: 
/
1069, DB_SETENV, "Failed to set environment for cluster database {0}, {1}"
//  *Cause: 
// *Action: 
/
1070, INST_SETENV, "Failed to set environment for instance {1} of cluster database {0}, {2}"
//  *Cause: 
// *Action: 
/
1071, DB_UNSETENV, "Failed to unset environment for cluster database {0}, {1}"
//  *Cause: 
// *Action: 
/
1072, INST_UNSETENV, "Failed to unset environment for instance {1} of cluster database {0}, {2}"
//  *Cause: 
// *Action: 
/
1073, NODEAPPS_CONFIG_BANNER, "\n########## Configuration of nodeapps follows ##########\n"
//  *Cause: 
// *Action: 
/
1074, VIPRANGE_CONFIG_BANNER, "\n########## Configuration of vip_range follows ##########\n"
//  *Cause: 
// *Action: 
/
1075, NO_HA_PRIVILEGES, "Insufficient privileges for doing this operation"
//  *Cause: 
// *Action: 
/
1076, HA_DAEMONS_RUNNING, "This command cannot run when the RAC daemons (crsd, evmd, ocssd) are running. Make sure the daemons are not running before invoking this command"
//  *Cause: 
// *Action: 
/
1077, BAD_ARGUMENT, "Argument {0} passed to the method {1} is not valid"
//  *Cause: 
// *Action: 
/
1078, VERSION_MISMATCH, "Database {0} of version {1} cannot be administered using current version of srvctl. Instead run srvctl from {2}"
//  *Cause: An attempt was made to access configuration of database using srvctl that was of different version than that of the database. 
// *Action: Perform the operation using srvctl from the ORACLE_HOME mentioned in the error message.
/
1079, OCR_INIT_ERROR, "Failed to initialize the Oracle Cluster Registry"
//  *Cause: 
// *Action: 
/
1080, SETENV_DUP, "Failed to set environment values as duplicate entries were found for the following names {0} "
//  *Cause: 
// *Action: 
/
1081, CLUSTER_DETECTION_FAILED, "Failed to detect cluster: {0}"
//  *Cause: 
// *Action: 
/
1082, GET_OCR_LOCATIONS_FAILED, "Failed to get OCR locations"
// *Cause: An error occurred while attempting to retrieve the OCR locations, possibly due to missing or incorrrect OCR locations file, or incomplete OCR configuration, or due to missing or incorrect SRVM shared libraries.
// *Action: Verify that the Clusterware has been correctly installed and configured. Verify that the ocr.loc file is present and readable in the appropriate location for your platform.
/
