// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCcMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     06/04/09 - Add cause and action for messages
//     yizhang     05/29/09 - fix messages
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     lmortime    03/25/09 - Adding GET_PRIVATE_NODE_ADDRESS_FAIL
//     rxkumar     04/17/08 - add start/stop/enable/disable msgs
//     rxkumar     03/25/08 - rm INVALID_SG_MAX_VALUE
//     yizhang     03/03/08 - Fix message INVALID_SG_MAX_VALUE
//     sravindh    02/19/08 - Add message INVALID_SG_MAX_VALUE(transaction
//                            yizhang_srvctlsvgp_4)
//     agridnev    11/15/07 - added PARAM_CANNOT_BE_NULL
//     sowong      03/16/07 - add new messages
//     agridnev    03/21/07 - added message for enum error
//     sowong      01/22/07 - add PATH_IS_NOT_ABSOLUTE
//     rxkumar     12/18/06 - add NO_SUCH_IDENTIFIER
//     rxkumar     12/08/06 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
1000, INVALID_PARAM_VALUE, "Parameter {0} value is not valid"
//  *Cause: This is an internal error. The value for the specified parameter is null or empty string.
// *Action: Contact Oracle Support Services.
/
1001, GET_INSTALL_GROUP_FAILED, "Failed to retrieve install group: {0}"
//  *Cause: An attempt to retrieve the install group failed.
// *Action: Examine the accompanying error messages for details.
/
1002, SET_INSTALL_GROUP_FAILED, "Failed to update install group: {0}"
//  *Cause: An attempt to set the install group failed.
// *Action: Examine the accompanying error messages for details.
/
1003, VERSION_NOT_AVAILABLE, "Version for module {0} is not available"
//  *Cause: An attempt to retrieve the version information for specified module failed.
// *Action: Examine the accompanying error messages for details.
/
1004, NO_SUCH_IDENTIFIER, "Unknown identifier {0} specified for checking result of operation"
//  *Cause: Failed to retrieve the result from the exception data using the specified identifier because the exception did not have the specified identifier.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1005, PATH_IS_NOT_ABSOLUTE, "Parameter {0} is not an absolute path"
//  *Cause: The specified parameter is not an absolute directory path.
// *Action: Provide an absolute directory path.
/
1006, PATH_IS_NOT_DIR, "Path {0} is not a directory"
//  *Cause: The specified path is not a directory.
// *Action: Provide a directory path.
/
1007, PATH_NOT_EXISTS, "Path {0} does not exist"
//  *Cause: The specified path did not exist.
// *Action: Provide an existing directory path.
/
1008, ENUM_NO_MEMBER_FOUND, "Enumerated type {0} does not have a member with corresponding value of {1}"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1009, PARAM_CANNOT_BE_NULL, "Parameter {0} cannot have null as a value"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1010, ALREADY_ENABLED, "{0} was already enabled"
//  *Cause: Given entity was already enabled.
// *Action: No action needed. To re-enable the entity, first disable it and then retry.
/
1011, ALREADY_ENABLED_PERX, "{0} was already enabled on {1}"
//  *Cause: Given entity was already enabled on given nodes.
// *Action: No action needed. To re-enable the entity on given nodes, first disable it on these nodes and then retry.
/
1012, ALREADY_DISABLED, "{0} was already disabled"
//  *Cause: Given entity was already disabled.
// *Action: No action needed. To re-disable the entity, first enable it and then retry.
/
1013, ALREADY_DISABLED_PERX, "{0} was already disabled on {1}"
//  *Cause: Given entity was already disabled on given nodes.
// *Action: No action needed. 
/
1014, ALREADY_RUNNING, "{0} was already running"
//  *Cause: Given entity is already running.
// *Action: No action needed. To re-start the entity, first stop it and then retry.
/
1015, ALREADY_RUNNING_PERX, "{0} was already running on {1}"
//  *Cause: Given entity was already running on given nodes.
// *Action: No action needed. To re-start the entity on given nodes, first stop it on these nodes and then retry.
/
1016, ALREADY_STOPPED, "{0} was already stopped"
//  *Cause: Given entity was already stopped.
// *Action: No action needed. To re-stop the entity, first start it and then retry.
/
1017, ALREADY_STOPPED_PERX, "{0} was already stopped on {1}"
//  *Cause: Given entity was already stopped on given nodes.
// *Action: No action needed. To re-stop the entity on given nodes, first start it on these nodes and then retry.
/
1018, GET_PRIVATE_NODE_ADDRESS_FAIL, "A request to retrieve private network addresses for node {0} found no addresses"
//  *Cause: A request to retrieve private network addresses by executing 'olsnodes -p' returned no private IP addresses.
// *Action: Check 'oifcfg getif' for cluster_interconnect networks and ensure this node has an IP address on the cluster_interconnect networks.
/
1019, INVALID_NULL_PARAM, "Parameter \"{0}\" value is not valid"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/

