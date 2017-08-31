// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrkuMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY) 
//     ksviswan    05/29/09 - add more SIHA messages
//     ksviswan    03/02/09 - modify SILENT_MODE message
//     ksviswan    11/19/08 - add SIHA DECONFIG messages
//     khsingh     08/04/08 - add message ENTER_IP
//     khsingh     02/04/07 - add message for DC.
//     khsingh     06/13/06 - add PRESS_ENTER_CMD 
//     khsingh     04/20/06 - add NODE_NOT_ACTIVE 
//     khsingh     03/15/06 - add messages 
//     khsingh     03/02/06 - corrected messages 
//     khsingh     02/08/06 - add RUN_CRS_DECONFIG_SILENT 
//     khsingh     01/31/06 - add NODE_VIP_DETAILS 
//     khsingh     01/18/06 - add COPY_FILE_CMD 
//     khsingh     12/22/05 - 
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     jtellez     07/24/02 - add CmdLineParser messages
//     jtellez     07/19/02 - jtellez_notcluster_exception
//     jtellez     07/17/02 - Creation
//  */
// 
// PACKAGE=package oracle.ops.util.resource;
// IMPORT=import java.util.ListResourceBundle;
// MSGIDTYPE=interface
1000, EXCEPTION_CAUSED_BY, "Exception Caused by: "
// *Document: no
// *Cause:
// *Action:
/
1001, INVALID_ARGUMENT, "Unexpected argument {0}."
//  *Cause: The command line argument reported in above error message is not expected the by tool
// *Action: Refer to the tool's inline help display or to the product documentation of the command line tool for valid options and arguments, and then rerun the tool.
/
1002, MISSING_ARGUMENT, "The option {0} is required."
// *Cause: The command line option reported by the above error message is a mandatory option required by the tool
// *Action: Review the tool's inline help display or to the product documentation of the command line tool for type of value required for this option. And then rerun the command specifying the above option in command line options.
/
1003, PARAM_MISSING_ARGUMENT, "The parameter {0} requires an argument."
// *Cause: The command line parameter reported in error message needs a value.
// *Action: Review the tool's inline help display or to the product documentation of the command line tool for type of value required for this option. And then rerun the command specifying the above option in command line options. 
/
1010, ENTER_IP_ADDR_USED, "Enter an address or the name of the virtual IP used on node \"{0}\""
// *Document: no
// *Cause:
// *Action:
/
1011, ENTER_NETMASK_OF_IP, "Enter the IP netmask of Virtual IP \"{0}\" on node \"{1}\""
// *Document: no
// *Cause:
// *Action: 
/
1012, ENTER_NET_IF_IP_ACTIVE_ON, "Enter the network interface name on which the virtual IP address \"{0}\" is active"
// *Document: no
// *Cause: 
// *Action: 
/
1013, IP_ADDR_INACTIVE_MESG, "IP Address \"{0}\" is not active. The Virtual IP address may be unreachable. Enter the IP address only if it is active and if you need to stop it. Otherwise press 'Enter'"
// *Document: no
// *Cause: 
// *Action:
/
1014, RUN_SCRIPT_ON_NODE, "Run the following command as the root user or the administrator on node \"{0}\"."
// *Document: no
// *Cause: 
// *Action: 
/
1015, SCRIPT_NOT_RUN, "Oracle Clusterware is not properly stopped and de-configured on node \"{0}\". The files \"{1}\" exist as configured."
// *Cause: The files init.ohasd, or ocr.loc and/or directory scls_scr still exists on this node which makes the tool believe that the clusterware stack is not shutdown properly
// *Action: Run the Oracle clusterware deconfiguration utility to completely cleanup the configuration. The Clusterware deconfiguration tool is available in Oracle clusterware home and also on Oracle OTN (Technology Network) page.
/
1016, FAILED_TO_STOP_CRS_STACK, "Failed to stop Oracle Clusterware on nodes \"{0}\". Run the command \"{1}\" after fixing the problem."
// *Cause: The clusterware deconfiguration tool has failed to stop Oracle clusterware stack. The reason for failure can be found browsing through clusterware alert logs found in log/<hostname>/alert<hostname>.log directory under Oracle clusterware.
// *Action: You should browse through deamon logs in log/<hostname> under Oracle clustereware home and manually correct the problem to stop clusterware stack. And then rerun the command specified in above error message.
/
1017, CRS_DECONFIG_SUCC, "Oracle Clusterware is stopped and de-configured successfully."
// *Document: no
// *Cause:
// *Action:
/
1018, RUN_ON_NODE_AS_ROOT, "Run the following command as the root user on node \"{0}\"."
// *Cause: The clusterware deconfiguration that is run as non-root user cannot automatically run the command specified in above message.
// *Action: You should login to another session as a privileged user and run the command specified in above message
/
1019, RUN_AS_ADMINISTRATOR, "Run the following command as administrator."
//  *Cause: The clusterware deconfiguration which is run as non-root user cannot automatically run the command specified in above message.
// *Action: You should login to another session as a privileged user and run the command specified in above message
/
1020, NODE_VIP_DETAILS, "VIP configuration on {0}: IP address=\"{1}\" Interface=\"{2}\", Netmask=\"{3}\""
// *Document: no
// *Cause: 
// *Action:
/
1021, RUN_CRS_DECONFIG_SILENT, "As the root user, Execute  \"{0}\" on every node in this cluster except for this node, and then execute \"{1}\" on this node to remove the configuration of the Oracle Clusterware and to completely remove the Oracle software"
// *Cause: This is the message reported by Oracle clusterware deconfiguration tool when it is run in non-interactive (or silent) mode.
// *Action: Execute the identified scripts as described.  Deconfiguring Oracle Clusterware in silent mode requires one set of operations on all nodes but the last followed by a special set of operations on the last node.
/
1022, CRS_NODE_DECONFIG_SUCC, "Oracle Clusterware is stopped and successfully de-configured on node \"{0}\""
// *Document: no
// *Cause:
// *Action:
/
1023, CRS_NODE_DECONFIG_FAIL, "Oracle Clusterware is not stopped and de-configured on node \"{0}\" due to error \"{1}\""
//  *Cause: The tool failed to deconfigure Oracle clusterware stack on the node because of errors reported in the above message
// *Action: You should review the error messages reported in above message to perform corrective actions and then rerun the tool
/
1024, CRS_DECONFIG_FAIL, "The stopping and de-configuring of Oracle Clusterware failed on some nodes. Fix the problem and rerun this tool to completely remove the Oracle Clusterware configuration and the software"
// *Cause: This is a message reported by the tool to inform you that the Oracle clusterware deconfiguration did not happen on some of the nodes in the cluster.
// *Action: You should review the error messages reported by the tool for failing to deconfigure clusterware stack on each node, perform corrective actions after reviewing the error messages, and rerun the tool to completely deconfigure Oracle clusterware stack
/
1025, RAC_DBS_EXISTS, "You must delete or downgrade the Oracle RAC databases and de-install the Oracle RAC homes before attempting to remove the Oracle Clusterware homes."
// *Cause: This is a message reported by the Oracle clusterware deconfiguration tool to inform you that you must delete or downgrade your Oracle databases to Oracle 9i before you attempt deconfigure Oracle clusterware stack
// *Action: Run the Oracle clusterware deconfiguration tool from Oracle RAC homes to delete, deconfigure or downgrade Oracle database and then run the same tool from Oracle clusterware home to deconfigure clusterware stack.
/
1026, OCR_CLEANUP_SUCC, "The removal of the Oracle Cluster Registry (OCR) contents is successful."
// *Document: no
// *Cause:
// *Action:
/
1027, CRS_NODE_DECONFIGURED, "Oracle Clusterware was already stopped and de-configured on node \"{0}\""
// *Document: no
// *Cause:
// *Action:
/
1028, PRESS_ENTER, "Press Enter after you finish running the above commands"
// *Document: no
// *Cause: 
// *Action:
/
1029, NODE_NOT_ACTIVE, "The node \"{0}\" is currently not responding."
// *Cause: The host reported in the above message may have rebooted or hung
// *Action: Login to the host if possible and review system logs, correct the problem
/
1030, PRESS_ENTER_CMD, "Press Enter after you finish running the above command"
// *Document: no
// *Cause:
// *Action:
/
1031, CMD_TO_RUN_FOR_IP, "The following information can be collected by running 'ifconfig -a' on node \"{0}\""
// *Document: no
// *Cause: 
// *Action: 
/
1032, ENTER_IP, "Enter an address or the name of the virtual IP"
// *Document: no
// *Cause: 
// *Action:
/
1033, ENTER_NETMASK, "Enter the IP netmask of the virtual IP \"{0}\""
// *Document: no
// *Cause:
// *Action:
/
1034, HA_DECONFIGURED, "Oracle Restart was already stopped and de-configured on node \"{0}\""
// *Document: no
// *Cause:
// *Action:
/
1035, HA_DECONFIG_FAIL, "The stopping and de-configuring of Oracle Restart failed. Fix the problem and rerun this tool to completely remove the Oracle Restart configuration and the software"
// *Cause: The Oracle Restart stack couldn't be  stopped cleanly before de-configuring.
// *Action: Review the error messages reported by the tool for failing to deconfigure Oracle Restart stack, perform corrective actions after reviewing the error messages, and rerun the tool to completely deconfigure Oracle Restart stack.
/
1036, SILENT_FILE_CREATE_FAIL, "The deinstall tool failed to create the script file \"{0}\" that needs to be run in silent mode due to error \"{1}\""
//  *Cause: The tool failed to create silent mode script file because of errors reported in the above message.
// *Action: You should review the error messages reported in above message to perform corrective actions and then rerun the tool.
/
1037, RUN_SIHA_DECONFIG_SILENT, "As the root user, execute  \"{0}\" and then execute \"{1}\" on this node to remove the configuration of the Oracle Restart and to completely remove the Oracle software"
// *Cause: This is the message reported by Oracle Restart deconfiguration tool when it is run in non-interactive (or silent) mode.
// *Action: Execute the identified scripts as described.
/
1038, HA_DECONFIG_SUCC, "Oracle Restart is stopped and de-configured successfully."
// *Document: no
// *Cause:
// *Action:
/
1039, HA_DBS_EXISTS, "Can't deconfigure Oracle Restart before removing or downgrading managed Oracle databases."
// *Cause: A request to deconfigure Oracle Restart found one or more managed Oracle database homes, so the request was rejected.
// *Action: Run the Oracle deconfiguration tool from Oracle database homes to delete, deconfigure or downgrade Oracle database and then run the same tool from Oracle Restart home to deconfigure the Oracle Restart stack.
/
Prku, NLS_FACILITY, "Dummy message line"
// *Document: no
// *Cause:
// *Action:
/
