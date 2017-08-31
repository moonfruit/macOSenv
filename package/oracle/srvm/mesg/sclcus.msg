// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    SclcMsg.msg
//
// DESCRIPTION
//    Defines message IDs for Super Cluster implementation for
//    the cluster/database tier.
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     06/05/09 - fix messages
//     rxkumar     09/30/08 - LOGGER_CONFIG_FAILED
//     rxkumar     08/06/08 - add NO_ARGS
//     rxkumar     07/10/08 - update DESCRIPTION
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file ]SclcMsg.java
//     rxkumar     01/03/08 - rename gossipserver to discoveryserver
//     rxkumar     01/02/08 - rm GET/SET_CHANNEL_NAME
//     rxkumar     11/09/07 - rm primary/secondary msgs
//     rxkumar     10/30/07 - add CREATE_GOSSIPSERVER_FAILED
//     rxkumar     10/11/07 - add GET_SCREP_FAILED
//     rxkumar     06/05/07 - add FILTER msgs
//     rxkumar     05/31/07 - add SERVER_NOT_RUNNING
//     rxkumar     05/30/07 - fix actions
//     rxkumar     05/26/07 - add GET_TDI_FAILED
//     rxkumar     05/24/07 - add EONSServer msgs
//     rxkumar     05/14/07 - add GET_CLUSTER_TIER_FAILED
//     rxkumar     05/11/07 - add msgs for get/set primary
//     rxkumar     03/13/07 - Creation
//  */
//
// PACKAGE=package oracle.supercluster.resources;
1000, GET_ADDR_FAILED, "Failed to retrieve address of {0}, {1}"
//  *Cause: Failed to retrieve current address of the resource.
// *Action: Make sure that resource is running and that user has read permission on resource profile and try again.
/
1001, GET_REFRESH_RATE_FAILED, "Dummy message line"
//  *Cause: 
// *Action: 
/
1002, SET_REFRESH_RATE_FAILED, "Dummy message line"
//  *Cause: 
// *Action: 
/
1003, GET_TIER_NAMES_FAILED, "Failed to retrieve tier names registered with {0}, {1}"
//  *Cause: Failed to retrieve tier names.
// *Action: Make sure that resource is running and try again.
/
1004, GET_TIER_MBRS_FAILED, "Failed to retrieve members of tier {0} registered with {1}, {2}"
//  *Cause: Failed to retrieve tier members.
// *Action: Make sure that resource is running and try again.
/
1005, GET_TIERS_FAILED, "Failed to get member tiers, {0}"
//  *Cause: Failed to get member tiers.
// *Action: Make sure that tier specific representatives are running and try again.
/
1006, GET_CLUSTER_TIER_FAILED, "Failed to get cluster tier instance, {0}"
//  *Cause: Failed to get cluster tier instance.
// *Action: Make sure that cluster tier is configured and try again.
/
1007, GET_TDI_FAILED, "Failed to get discovery information for tier {0}, {1}"
//  *Cause: Failed to get tier discovery information
// *Action: Retry after resolving cause stated in message
/
1008, GET_FILTERS_FAILED, "Failed to get filters at location {0} for tier {1}"
//  *Cause: Failed to get filters registered at the given location of the tier.
// *Action: Retry after resolving cause stated in message
/
1009, SET_FILTERS_FAILED, "Failed to set filters {0} at location {1} of the tier {2}, {3}"
//  *Cause: Failed to set filters at the given location of the tier.
// *Action: Retry after resolving cause stated in message
/
1010, CREATE_GOSSIPSERVER_FAILED, "Failed to create Discovery Server, {0}"
//  *Cause: Failed to initialize Discovery Server
// *Action: Retry after resolving cause stated in message.
/
1011, GET_GOSSIPSERVER_FAILED, "Failed to get Discovery Server reference, {0}"
//  *Cause: Failed to get Discovery Server reference
// *Action: Discovery server is not configured properly, contact Oracle support.
/
1012, GET_EONSSERVER_FAILED, "Dummy message line"
//  *Cause: 
// *Action: 
/
1013, GET_SCREP_FAILED, "Failed to get Super Cluster Representative reference, {0}"
//  *Cause: Failed to get Super Cluster Representative reference
// *Action: Super Cluster Representative is not running, start it and retry.
/
1014, NOT_MCAST_ADDRESS, "Address {0} is not a multicast address"
//  *Cause: Given IP Address is not a multicast address and therefore cannot be used for multicast discovery.
// *Action: Supply a multicast IP address and try again.
/
1015, GET_MCAST_ADDR_FAILED, "Failed to retrieve configured multicast address for tier {0}"
//  *Cause: Failed to retrieve multicast address.
// *Action: Retry after resolving cause stated in message
/
1016, GET_DISC_METHOD_FAILED, "Failed to retrieve discovery method for tier {0}"
//  *Cause: Failed to retrieve discovery method for the given tier.
// *Action: Retry after resolving cause stated in message
/
1017, NOT_MCAST_DISC_METHOD, "Multicast discovery method is not configured for tier {0}, {1}"
//  *Cause: Multicast discovery method is not configured.
// *Action: This operation is applicable only for Multicast discovery method. Try it after configuring multicast discovery method for this tier.
/
1018, NOT_GOSSIPSERVER_DISC_METHOD, "Discovery Server discovery method is not configured for tier {0}, {1}"
//  *Cause: Discovery Server discovery method is not configured.
// *Action: This operation is applicable only for Discovery Server discovery method.
/
1019, GET_MBRS_FAILED, "Failed to retrieve member list for tier {0}, {1}"
//  *Cause: Failed to current retrieve member list for the tier.
// *Action: Retry after resolving cause stated in message
/
1020, SET_MBRS_FAILED, "Dummy message line"
//  *Cause: 
// *Action: 
/
1021, GET_TIER_NAME_FAILED, "Failed to retrieve name of tier {0}"
//  *Cause: Failed to retrieve name of the tier.
// *Action: Retry after resolving cause stated in message.
/
1022, SET_TIER_NAME_FAILED, "Failed to update name of the tier {0}, {1}"
//  *Cause: Failed to update name of the tier.
// *Action: Retry after resolving cause stated in message.
/
1025, GET_SCREP_COUNT_FAILED, "Failed to retrieve count of representatives for tier {0}"
//  *Cause: Failed to retrieve number of representatives configured for the given tier.
// *Action: Retry after resolving cause stated in message.
/
1026, SET_SCREP_COUNT_FAILED, "Failed to update count of representatives for tier {0}, {1}"
//  *Cause: Failed to update number of representatives for the given tier.
// *Action: Retry after resolving cause stated in message.
/
1027, SERVER_START_FAILED, "Failed to start {0}, {1}"
//  *Cause: Failed to start given server.
// *Action: Retry after resolving cause stated in message.
/
1028, SERVER_STOP_FAILED, "Failed to stop {0}, {1}"
//  *Cause: Failed to stop given server.
// *Action: Retry after resolving cause stated in message.
/
1029, SERVER_STAT_FAILED, "Failed to check status of {0}, {1}"
//  *Cause: Failed to check status of given server.
// *Action: Retry after resolving cause stated in message.
/
1030, SERVER_NOT_RUNNING, "{0} server is not running"
//  *Cause: Server is not running.
// *Action: Retry after starting the server.
/
1031, ILLEGAL_ARG, "Illegal argument : {0}"
//  *Cause: Given argument is illegal.
// *Action: See command usage.
/
1032, SCRIPT_USAGE, "Usage: {0} {1} {2}"
//  *Cause: Prints given action script usage.
// *Action: None
/
1033, SCCL_CREATE_FAILED, "Failed to create super cluster client for tier {0}, {1}"
//  *Cause: Failed to create super cluster client for tier.
// *Action: Retry after resolving cause stated in message.
/
1034, NO_ARGS, "No argument was supplied to {0}"
//  *Cause: The tool was invoked without any arguments, see its usage.
// *Action: Invoke the tool with arguments as documented in its usage.
/
1035, LOGGER_CONFIG_FAILED, "Failed to configure logger for {0}"
//  *Cause: An error was encountered while configuring logger for given program. The message is followed by an exception message that contains more information. Most likely source of error is lack of privileges to create/update files in <crs_home>/log/<hostname>/srvm directory.
// *Action: Fix the error reported in the exception message by granting privileges to the current user to create/update files in <crs_home>/log/<hostname>/srvm directory.
/
1036, STATUS_LISTENER_FAILED, "Failed to start the status listener for the EONS server {0}, {1}"
// *Cause: The specified EONS server failed to either obtain an available port or create the status listener thread.
// *Action: Check if there are available ports on this system.
/
1037, PORT_FILE_FAILED, "Failed to create the port file for the EONS server {0}, {1}"
// *Cause: An error occured while creating a file in the <crs_home>/eons/init directory.
// *Action: Ensure that filesystem permissions are correct and that disk space is available.
/
