// Copyright (c) Oracle Corporation 2008.  All Rights Reserved.
//
// NAME
//    PrknMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     dsaggi      10/27/06 - add UNKNOWN_LOCAL_HOST_NAME
//     dsaggi      05/17/05 - correct upgrade/downgrade text
//     dsaggi      05/13/05 - error getting release version 
//     rxkumar     01/11/05 - add UNKNOWN_LIBRARY 
//     rxkumar     01/26/05 - fix bug4046190 
//     rxkumar     01/20/05 - fix bug4130989 
//     bhamadan    01/10/05 - adding FILE_NOT_FOUND_IN_DIRS 
//     bhamadan    11/03/04 - adding markServiceDelete related msgs 
//     sowong      11/01/04 - add error message for query service dependency 
//     rxkumar     10/22/04 - fix bug3960238 
//     bhamadan    09/08/04 - adding DIR_CREATE_ERR 
//     sowong      08/06/04 - add API_NOT_SUPPORTED_ON_LOCALNODE 
//     bhamadan    07/08/04 - adding REMEXEC_ERR, CPY_ERR,SERVICE_CREATE/START_ERR
//     rxkumar     06/04/04 - add ERROR_ENV msg 
//     rxkumar     05/17/04 - add API_NOT_SUPPORTED 
//     rxkumar     07/28/03 - add GET_REGKEY_DATA_FAILED
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     jtellez     07/17/02 - add NotAClusterException
//     jtellez     05/24/02 - load lib change
//     jtellez     05/23/02 - add internal error
//     jtellez     05/17/02 - Add load library failure
//     rdasari     08/08/01 - Merged rdasari_nativecode_changes
//     rdasari     07/30/01 - Adding generic error messages for clusterware errors and native OS errors.
//     rdasari     07/19/01 - Adding more messages,.
//     rdasari     06/26/01 - adding more messages.
//     rdasari     06/26/01 - Creation
//  */
// 
// /**
//  *  @version $Header: PrknMsg.java 27-oct-2006.02:10:07 dsaggi Exp $
//  *  @author  rdasari 
//  *  @since   release specific (what release of product did this appear in)
//  */
// 
// PACKAGE=package oracle.ops.mgmt.resources;
// MSGIDTYPE=interface
1001, BIG_GRPNAME, "Groupname cannot exceed 12 characters"
//  *Cause: 
// *Action: 
/
1002, REG_CW_FAIL, "Could not register with the clusterware"
//  *Cause: 
// *Action: 
/
1003, INIT_CW_FAIL, "Unable to initialize with the clusterware"
//  *Cause: 
// *Action: 
/
1004, OUT_OF_MEM, "Cannot allocate memory"
//  *Cause: 
// *Action: 
/
1005, BIG_DATA, "Too big private or public member data"
//  *Cause: 
// *Action: 
/
1006, CW_ERR, "Error from the Clusterware layer"
//  *Cause: 
// *Action: 
/
1007, OS_ERR, "Error from the Operating System layer"
//  *Cause: 
// *Action: 
/
1008, FAILURE_LOADING_SHARED_LIB, "Unable to load the shared library \"{0}\"\n  or a dependent library, from\n  {1}=\"{2}\"\n  [{3}]"
//  *Cause: 
// *Action: 
/
1009, NATIVE_INTERNAL_ERROR, "Native System Internal Error"
//  *Cause: 
// *Action: 
/
1010, NOT_A_CLUSTER, "This system is not properly configured as a cluster."
//  *Cause: 
// *Action: 
/
1011, GET_REGKEY_DATA_FAILED, "Failed to retrieve value for \"{0}\" under registry key \"{1}\" on node \"{2}\", {3}"
//  *Cause: 
// *Action: 
/
1012, API_NOT_SUPPORTED, "\"{0}\" API is not supported on \"{1}\" platform"
//  *Cause: 
// *Action: 
/
1013, ERROR_ENV, "Failed to locate \"{0}\", set \"{1}\" environment variable to installed path of {2}"
//  *Cause: 
// *Action: 
/
1014, REMEXEC_ERR, "Failed to execute remote command \"{1}\" on node \"{0}\"."
//  *Cause: 
// *Action: 
/
1015, CPY_ERR, "Failed to copy file \"{0}\" to destination \"{1}\" on node \"{2}\", Error: \"{3}\". "
//  *Cause: 
// *Action: 
/
1016, SERVICE_CREATE_ERR, "Failed to create service \"{0}\" on node \"{1}\", Error: \"{2}\"."
//  *Cause: 
// *Action: 
/
1017, SERVICE_START_ERR, "Failed to start service \"{0}\" on node \"{1}\", Error: \"{2}\" ."
//  *Cause: 
// *Action: 
/
1018, API_NOT_SUPPORTED_ON_LOCALNODE, "\"{0}\" API is not supported on the local node"
//  *Cause: 
// *Action: 
/
1019, DIR_CREATE_ERR, "Failed to create directory \"{0}\" on node \"{1}\", Error: \"{2}\" ."
//  *Cause: 
// *Action: 
/
1020, LIB_VERSION_MISMATCH, "The library \"{0}\" version \"{1}\" does not match the expected version \"{2}\""
//  *Cause: 
// *Action: 
/
1021, SERVICE_MARK_DELETE_ERR, "Failed to mark service \"{0}\" for deletion on node \"{1}\", Error: \"{2}\" ."
//  *Cause: 
// *Action: 
/
1022, QUERY_SERVICE_DEPENDENY_FAILED, "Failed to retrieve the dependencies for service \"{0}\" on node \"{1}\". Error: \"{2}\". "
//  *Cause: 
// *Action: 
/
1023, UNKNOWN_DEPENDENCIES, "Some of dependencies specified in the dependency list \"{0}\" are not dependent on the service \"{1}\" on node \"{2}\"."
//  *Cause: 
// *Action: 
/
1024, FILE_NOT_FOUND_IN_DIRS, "Could not find file(s) \"{0}\" in following location(s) \"{1}\"."
//  *Cause: 
// *Action: 
/
1025, FILE_NOT_EXISTS, "File \"{0}\" does not exist on node \"{1}\""
//  *Cause: 
// *Action: 
/
1026, UNKNOWN_HOST_NAME, "Failed to retrieve IP address of unknown host \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1027, UNKNOWN_LIBRARY, "Cannot load unrecognized library \"{0}\""
//  *Cause: 
// *Action: 
/
1028, GET_RELVER_FAIL, "Failed to retrieve database release version"
//  *Cause: 
// *Action: 
/
1029, UTIL_UPGRADE, "	-upgrade -dbname <database> -orahome <oracle_home_path> upgrade the database configuration to Oracle Database 10.2"
//  *Cause: 
// *Action: 
/
1030, UTIL_DOWNGRADE, "	-downgrade -dbname <database> -orahome <oracle_home_path> -version <versionstring> downgrade the database configuration to Oracle Database 10.0 or 9.2 based on value of versionstring"
//  *Cause: 
// *Action: 
/
1031, UNKNOWN_LOCAL_HOST_NAME, "Failed to retrieve local host name"
//  *Cause: 
// *Action: 
/
