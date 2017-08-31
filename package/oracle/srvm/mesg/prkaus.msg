// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrkaMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     05/26/09 - Add action and cause from old msg file
//     rxkumar     05/16/06 - add msgs for bug5006414 
//     rxkumar     08/15/05 - fix bug4500688 
//     khsingh     05/30/03 - fix 2908263
//     dliu        03/24/03 - add NO_ROOT
//     jtellez     08/15/02 - cathy edits
//     jtellez     08/05/02 - add noip in range
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     dliu        06/28/02 - add EMPTY_VRANGE
//     dliu        06/20/02 - new mesgs for VIPRange
//     dliu        06/26/02 - mesgs for Listener
//     myechuri    09/28/01 - add remote_command_fail.
//     rdasari     09/18/01 - Merged rdasari_huron_framework_changes
//     dliu        09/14/01 - fix syntax.
//     myechuri    09/12/01 - mesgs for VIPRange.
//     dliu        09/10/01 - Creation
//  */
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/mgmt/resources/PrkaMsg.msg /main/2 2009/06/07 21:18:00 yizhang Exp $
//  *  @author  dliu    
//  *  @since   release specific (what release of product did this appear in)
//  */
// 
// PACKAGE=package oracle.ops.mgmt.resources;
// MSGIDTYPE=interface
2001, GSD_ALREADY_EXISTS, "GSD already exists"
//  *Cause: An attempt was made to create the Global Services Daemon (GSD) application while there was a running GSD application.
// *Action: Stop and remove the GSD and create the GSD application again using 'srvctl add nodeapps'.
/
2002, LISTENER_ALREADY_EXISTS, "Listener already exists"
//  *Cause: An attempt was made to create a Listener application while there was a running Listener application.
// *Action: Stop and remove the running Listener and create the Listener application again using 'srvctl add nodeapps'.
/
2003, AGENT_ALREADY_EXISTS, "EM Agent already exists"
//  *Cause: An attempt was made to create an Agent application while there was a running Agent application.
// *Action: Stop the running Agent and create the Agent application again using 'srvctl add nodeapps'.
/
2004, NO_DATABASE_FOUND, "No database found for the cluster"
//  *Cause: 
// *Action: 
/
2005, NETMASKS_DIFFER, "Netmasks are different for starting and ending IP addresses"
//  *Cause: An invalid range of VIP addresses was specified for the cluster
// *Action: Check if the starting and ending addresses in the VIP range belong to the same netmask.
/
2006, INVALID_VRANGE, "Invalid VIP address range"
//  *Cause: 
// *Action: 
/
2007, EMPTY_VRANGE, "Empty VIP address range"
//  *Cause: 
// *Action: 
/
2008, NO_FREE_VIP, "No VIP address is available in the VIP pool"
//  *Cause: 
// *Action: 
/
2009, VIP_NOT_FOUND, "VIP address is not found"
//  *Cause: 
// *Action: 
/
2010, VIP_ALREADY_EXISTS, "VIP address already exists"
//  *Cause: 
// *Action: 
/
2011, REMOTE_COMMAND_FAIL, "Remote command failed"
//  *Cause: 
// *Action: 
/
2012, GET_VIP_RANGE_CONFIG_FAIL, "Failed to get the VIP address range configuration from the OCR"
//  *Cause: 
// *Action: 
/
2013, ADD_VIP_RANGE_CONFIG_FAIL, "Failed to add the VIP address range configuration to the OCR"
//  *Cause: 
// *Action: 
/
2014, REMOVE_VIP_RANGE_CONFIG_FAIL, "Failed to remove the VIP address range configuration from the OCR"
//  *Cause: 
// *Action: 
/
2015, LSNR_INVALID_NODE, "Invalid node name"
//  *Cause: 
// *Action: 
/
2016, LSNR_INVALID_LSNR, "Invalid listener name"
//  *Cause: 
// *Action: 
/
2017, NOIP_IN_RANGE, "There are no IP addresses in the specified range. Make sure to specify the correct range for the IP addresses."
//  *Cause: 
// *Action: 
/
2018, NO_ROOT, "Virtual IP can only be created or removed by the system privilege user."
//  *Cause: 
// *Action: 
/
2019, COMMAND_DOES_NOT_EXIST, "Error executing command \"{0}\". File is missing."
//  *Cause: 
// *Action: 
/
2020, INVALID_VIP_ADDR, "VIP address is invalid, \"{0}\". "
//  *Cause: 
// *Action: 
/
2021, INVALID_INTERFACES, "Dummy message line"
//  *Cause: 
// *Action: 
/
2022, GET_RES_USERNAME_FAIL, "Failed to get owner user name of resource \"{0}\", internal error"
//  *Cause: 
// *Action: 
/
2023, GET_RES_GROUPNAME_FAIL, "Failed to get owner group name of resource \"{0}\", internal error"
//  *Cause: 
// *Action: 
/
