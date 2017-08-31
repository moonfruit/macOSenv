// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrkeMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     05/28/09 - fix messages
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     myechuri    01/02/02 - .
//     myechuri    01/02/02 - .
//     myechuri    01/02/02 - remove ORACLE_HOME from gsdctl_usage msg.
//     myechuri    10/05/01 - Merged myechuri_gsdctl_main
//     myechuri    10/04/01 - remove oracleHome.
//     myechuri    09/19/01 - .
//     myechuri    09/18/01 - Creation
//  */
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/mgmt/resources/PrkeMsg.msg /main/2 2009/06/07 21:18:00 yizhang Exp $
//  *  @author  myechuri
//  *  @since   release specific (what release of product did this appear in)
//  */
// 
// PACKAGE=package oracle.ops.mgmt.resources;
// MSGIDTYPE=interface
1001, GSDCTL_USAGE, "Usage: gsdctl [options] \n \n where options include: 	 start     start the gsd \n	 stop     stop the gsd \n	 stat     query the status of the gsd"
//  *Cause: 
// *Action: 
/
1002, INCORRECT_ARG_NUMBER, "gsdctl needs one argument.\n User provided {0} {1}"
//  *Cause: 
// *Action: 
/
1003, INVALID_OPTION, "gsdctl {0} is not a valid option"
//  *Cause: 
// *Action: 
/
1004, GSD_START_SUCCESS, "Successfully started GSD on local node"
//  *Cause: 
// *Action: 
/
1005, GSD_STOP_SUCCESS, "Successfully stopped GSD on local node"
//  *Cause: 
// *Action: 
/
1006, GSD_RUNNING, "GSD is running on the local node"
//  *Cause: 
// *Action: 
/
1007, GSD_NOT_RUNNING, "GSD is not running on the local node"
//  *Cause: 
// *Action: 
/
1008, GET_ACTIVE_NODES_FAIL, "Failed to get list of active nodes from Clusterware"
//  *Cause: Possible causes:
//         1) Not operating in cluster mode.
//         2) Failed to load SRVM libraries.
//         3) Failed to initialize clusterware context.
// *Action:  Check for the health of clusterware using "lsnodes" utility to get the list of active nodes in the cluster. Also, check for the presence of srvm libraries in the load library path. If these two checks get cleared, please contact Oracle Support Services.
/
1009, GSD_START_FAIL, "Failed to start GSD on local node"
//  *Cause: GSD is already running on the local node, or GSD could not be started because of some other reason.
// *Action: Run "gsdctl stat" to check if a daemon is already running on the local node. If a daemon is not running on local node, please contact Oracle Support Services to check for the other reasons for failure.
/
1010, GSD_STOP_FAIL, "Failed to stop GSD on local node"
//  *Cause: GSD is not running on the local node, or GSD could not shut down gracefully.
// *Action: Run "gsdctl stat" to check if a GSD is running on the local node. If a GSD is running, please contact Oracle Support Services to check for other reasons for failure.
/
1011, GSD_STAT_FAIL, "Failed to get status of GSD on local node"
//  *Cause: Failure to get the list of active nodes from the cluster, or failure to query the list of live daemons from the clusterware.
// *Action: Run "lsnodes" to check the health of the clusterware. If the clusterware is working fine, check for the presence of SRVM libraries in the load library path. If the libraries are present, please contact Oracle Support Services for further assistance.
/
1012, GSDCTL_SUCCESS, "The gsdctl command succeeded on local node"
//  *Cause: 
// *Action: 
/
