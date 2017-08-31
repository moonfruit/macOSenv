// Copyright (c) 2008, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrkhMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     wsun        09/09/08 - bug# 7013863
//     rxkumar     05/26/07 - add MAKE_DAEMON_FAILED
//     rxkumar     04/26/06 - fix bug5184535 
//     dliu        10/07/04 - 
//     jtellez     06/13/03 - add no such oracle home
//     jtellez     08/16/02 - msg tweeks
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     jtellez     06/28/02 - add UserNotFound, IsufficientPrivilege, and Util Exception msgs
//     jtellez     06/25/02 - add init failure
//     jtellez     06/06/02 - add CRSHOME not defd
//     jtellez     05/17/02 - Add caused by
//     jtellez     05/08/02 - jtellez_ha_lsnr
//     jtellez     04/29/02 - Creation
//  */
// 
// /**
//  * Message file for has package.
//  *
//  *  @version $Header: opsm/jsrc/oracle/ops/mgmt/has/resource/PrkhMsg.msg /main/2 2008/09/30 17:32:08 wsun Exp $
//  *  @author  jtellez 
//  *  @since   release specific (what release of product did this appear in)
//  */
// 
// PACKAGE=package oracle.ops.mgmt.has.resource;
// IMPORT=import java.util.ListResourceBundle;
// MSGIDTYPE=interface
1000, FAILURE_LOADING_SHARED_LIB, "Unable to load the SRVM HAS shared library"
//  *Cause: 
// *Action: 
/
1001, HAS_CONTEXT_INTERNAL_ERROR, "HASContext Internal Error"
//  *Cause: 
// *Action: 
/
1002, HAS_NATIVE_CALL_FAILURE, "Internal HASContext Error: JNI Native Call Failure"
//  *Cause: 
// *Action: 
/
1003, HAS_NOMEM, "Failed to allocate memory in native layer: "
//  *Cause: 
// *Action: 
/
1004, REMOTE_JOIN_ALIAS_FAILED, "Failed to execute remote join cluster alias {0} for nodes: "
//  *Cause: 
// *Action: 
/
1005, REMOTE_LEAVE_ALIAS_FAILED, "Failed to execute remote leave cluster alias {0} for nodes: "
//  *Cause: 
// *Action: 
/
1006, NODE_NOT_FOUND, "The following nodes are either not active or not configured: "
//  *Cause: 
// *Action: 
/
1007, CAUSED_BY, "Exception Caused by: "
//  *Cause: 
// *Action: 
/
1008, ILLEGAL_NULL_ARGUMENT, "Internal HASContext Error: Argument {0} must be set."
//  *Cause: 
// *Action: 
/
1009, CRSHOME_NOT_DEFINED, "CRS HOME must be defined in the environment or in the Oracle Cluster Registry"
//  *Cause: 
// *Action: 
/
1010, INIT_CRS_FAILED, "Unable to communicate with CRS services."
//  *Cause: 
// *Action: 
/
1011, INSUFFICIENT_PRIVILIGES, "Process does not have sufficient privileges to perform the requested operation. {0}"
//  *Cause: 
// *Action: 
/
1012, USER_NOT_FOUND, "Unable to find or resolve user {0}."
//  *Cause: 
// *Action: 
/
1013, NOSUCH_ORACLE_HOME, "The oracle home {0} does not exist."
//  *Cause: 
// *Action: 
/
1014, MISMATCH_OUSER, "Current user {0} is not the same as oracle owner {1} of oracle home {2}."
//  *Cause: 
// *Action: 
/
1015, MAKE_DAEMON_FAILED, "Failed to create daemon process from executable {0} with arguments {1} and environments {2}, {3}"
//  *Cause: 
// *Action: 
/
1016, GET_CSS_MODE_FAILED, "Failed to get CSS mode"
// *Cause: An error occurred on a Cluster Synchronization Services request.  This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise.
//     contact Oracle Support Services.
/
1050, BUFFER_2_SMALL, "Buffer is too small"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1051, CLUSTER_SKGXN_ERROR, "Cluster software (skgxn) error"
//  *Cause: An error occurred when Cluster Synchronization Services attempted to use non-Oracle vendor clusterware.  This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
1052, INVALID_ARGUMENTS, "Invalid arguments"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1053, SYNC_NOT_ACTIVE, "Cluster synchronization services are not active"
//  *Cause: CSS daemon is not running or unable to authenticate with CSS daemon
// *Action: Ensure that CSS daemon is running, e.g. with olsnodes.  On Unix, check /var/tmp/.oracle for Unix-domain sockets.
/
1054, COMMUNICATIONS_ERROR, "Communications error"
//  *Cause: CSS daemon is not running or unable to authenticate with CSS daemon
// *Action: Ensure that CSS daemon is running, e.g. with olsnodes.  On Unix, check /var/tmp/.oracle for Unix-domain sockets.
/
1055, OCR_ERROR, "Oracle Cluster Registry error"
//  *Cause: OCR returned an error while processing a CSS request
// *Action: Ensure that CRSD daemon is running e.g. with crsctl check clusterware
/
1056, UNEXPECTED_CSS_ERROR, "Unexpected CSS error"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
