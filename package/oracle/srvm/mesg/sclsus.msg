// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    SclsMsg.msg
//
// DESCRIPTION
//  Defines message IDs for Super Cluster (vertical) tier implementation 
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     05/26/09 - fix messages
//     spavan      10/03/08 - fix bug7417758
//     rxkumar     07/10/08 - add EONS_RUNTIME_NOT_ACTIVE
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file SclsMsg.java
//     rxkumar     09/06/07 - add GET_MBRLIST_FAILED
//     rxkumar     06/18/07 - Creation
//  */
//
// PACKAGE=package oracle.supercluster.resources;
// IMPORT=import oracle.ops.mgmt.nls.MessageKey;
1000, SCREP_CREATE_FAILED, "Failed to create super cluster representative server for tier {0}, {1}"
//  *Cause: Failed to create super cluster representative server for the given tier.
// *Action: Retry after resolving cause stated in message.
/
1001, GET_ONS_FAILED, "Failed to get ONS runtime of {0}"
//  *Cause: Failed to get ONS runtime of the given server.
// *Action: Retry after resolving cause stated in message.
/
1002, GET_MBRLIST_FAILED, "Failed to get current member list of tier {0}"
//  *Cause: Failed to get current member list of the given tier.
// *Action: Retry after resolving cause stated in message.
/
1003, EONS_RUNTIME_NOT_ACTIVE, "eONS runtime was not running for tier {0}"
//  *Cause: eONS runtime was stopped abnormally.
// *Action: In cluster environment, try srvctl stop nodeapps -n <node> and srvctl start nodeapps -n <node>. In Oracle Restart environment, try srvctl stop eons and srvctl start eons.
/
1004, EONS_SETLISTENPORT_FAILED, "Failed to set listening port to {0} for {1}"
//  *Cause: Failed to update listening port of the eONS runtime for this tier.
// *Action: Make sure that user has permission to update resource attribute. In cluster environment make sure that the clusterware stack is up. 
/
1005, INVALID_LOCALPORT_NUMBER, "Invalid listening port {0} specified for eONS"
//  *Cause: The specified eONS listening port number is invalid.
// *Action: Valid port numbers on Unix are from 1025 to 65535. Provide a valid port number for eONS to listen on. 
/
