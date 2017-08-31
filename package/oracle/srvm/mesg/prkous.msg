// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrkoMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     agridnev    06/04/09 - added some action/cause lines.
//     yizhang     05/26/09 - fix messages
//     yizhang     06/03/09 - Add POLICY_DB_START_INST_BOTH_OPT as a dummy 
//                            to not break lang files compiles
//     agridnev    06/01/09 - fixed bug 8563698
//     yizhang     05/27/09 - fix bug 8509302
//     yizhang     05/08/09 - fix bug 8426888
//     rxkumar     05/06/09 - fix bug8473108
//     yizhang     05/07/09 - fix NET_RES_ENABLED_SUCC and
//                            NET_RES_DISABLED_SUCC
//     agridnev    05/06/09 - fixed for bug 8474459
//     rxkumar     04/29/09 - fix bug8437203
//     sravindh    05/02/09 - Add DB_START_INST_NO_OPT as a dummy to not break
//                            lang files compiles
//     sravindh    04/29/09 - Bug 8448433
//     yizhang     05/01/09 - Add message LISTENER_INVALID_OPTION_COMBINATION
//     rxkumar     04/16/09 - fix bug8417812
//     agridnev    04/28/09 - updated msg 3148 based on Bill's comments
//     rxkumar     04/28/09 - uppercase mgmt policy
//     yizhang     04/23/09 - fix bug 8428271
//     rxkumar     04/16/09 - fix bug8417812
//     agridnev    04/22/09 - fixed bug 8289440
//     yizhang     04/20/09 - fix bug 8325150
//     sowong      04/24/09 - fix bug8324523
//     sowong      04/17/09 - fix bug7697658
//     sowong      04/15/09 - fix bug7190209
//     yizhang     04/14/09 - Fix bug 8305145
//     yizhang     04/07/09 - fix bug 8397864
//     agridnev    04/13/09 - fixed bug-8417254
//     rxkumar     04/08/09 - fix bug8357685
//     rwessman    04/07/09 - Added -f option to USAGE_MODIFY_GNS.
//     agridnev    04/07/09 - fixed bug-8396419
//     agridnev    04/01/09 - fixed bug bug-8338015
//     rwessman    03/13/09 - Added GNS_NAME_RESOLVED to fix bug 8258169.
//     yizhang     03/05/09 - fix bug 8305019
//     agridnev    03/12/09 - added message for bug-8327913 fix
//     rxkumar     03/04/09 - fix bug8234241
//     agridnev    03/03/09 - fixed bug 7685872
//     agridnev    03/02/09 - adde new message to support fix for bug 7654049
//     rwessman    03/03/09 - Added GNS_MODIFY_ONLY_L_ALLOWED
//     rwessman    03/02/09 - Bug 8289899
//     yizhang     02/13/09 - Fix bug 8250080
//     rxkumar     02/24/09 - fix bug8266117
//     agraves     02/20/09 - Cleanup some messages for srvctl usm resources.
//     sowong      02/19/09 - fix bug8241374
//     rwessman    02/16/09 - Added -f option to USAGE_RELOCATE_GNS.
//     agridnev    02/11/09 - fixed bug 7157614
//     rwessman    02/11/09 - Bug 7597238.
//     rwessman    02/11/09 - Deleted GNS_IS_RUNNING. It is no longer used due
//                            to bug 7833540.
//     agridnev    02/18/09 - fixed bug 8252688
//     sowong      02/06/09 - fix INVALID_NODE message
//     rwessman    02/05/09 - Added GNS_MODIFY_REQ_EITHER_OPTION_NOT_SPECIFIED.
//     agridnev    02/05/09 - fixed bug-8210922
//     yizhang     01/21/09 - Add message INVALID_SYNTAX_MISSING_OPTION
//     agraves     01/17/09 - Change ASMFS to ACFS.
//     rxkumar     01/15/09 - add DEFINE_SRVR_NAME_STATE
//     yizhang     01/12/09 - Fix bug 7665426
//     sowong      01/09/09 - fix bug6872172
//     sowong      12/23/08 - fix bug7257323
//     agridnev    12/19/08 - added some missed ending periods
//     agridnev    12/17/08 - added "-f" flag to add/modify pool
//     sowong      12/09/08 - add message for bug7479267
//     sowong      12/05/08 - fix bug7379740
//     yizhang     11/11/08 - Fix bug 7531512
//     yizhang     11/20/08 - Remove OC4J_RUNNING
//     yizhang     11/11/08 - Fix bug 7531512
//     rwessman    11/06/08 - Corrected usage message for "srvctl modify gns".
//     rwessman    11/03/08 - Bug 7498399.
//     sowong      10/30/08 - fix bug7480289
//     yizhang     10/28/08 - Fix bug 7509133
//     rxkumar     10/23/08 - add msg for bug7377939 fix
//     rwessman    10/16/08 - Review comments from rxkumar.
//     rwessman    10/15/08 - Bug 7479534.
//     rwessman    10/14/08 - Bug 7479266.
//     rxkumar     10/06/08 - fix bug5724590
//     ksviswan    09/24/08 - update home cli usage
//     spavan      09/23/08 - fix bug7421260,7421246
//     sowong      09/19/08 - add msgs for bug6874976 & bug6874966
//     spavan      09/16/08 - fix bug6858693
//     yizhang     09/11/08 - Fix numberformatexception bugs
//     yizhang     09/12/08 - Define LSNR_CONFIG_ORACLE_HOME_ON_NODE
//     yizhang     09/10/08 - Fix bug 7360687
//     rwessman    09/08/08 - Improved GNS error messages.
//     sowong      09/02/08 - change usage for add filesystem
//     spavan      08/29/08 - fix bug7113890
//     rwessman    08/26/08 - Incorporated review comments from rxkumar.
//     spavan      08/11/08 - VIP noun cannot act on default network
//     rxkumar     08/07/08 - fix bug7142054
//     rxkumar     07/29/08 - add SRV_PREF_INSTS & SRV_AVAIL_INSTS
//     rsirigan    07/29/08 - remove getenv/setenv usage for scan and scan_listener 
//     rxkumar     07/22/08 - fix bug7142054
//     agridnev    07/21/08 - added message INVALID_VALUE_4_OPTION
//     yizhang     07/21/08 - Define LSNR_CONFIG_NETWORK_AND_OWNER
//     yizhang     07/17/08 - Fix USAGE_MODIFY_LISTENER
//     agridnev    07/07/08 - removed SERV_MUST_BE_OFFLINE
//     yizhang     07/07/08 - Fix INVALID_SETENVSTR
//     sowong      07/01/08 - fix bug6976533
//     rxkumar     07/01/08 - fix bug7193159
//     rsirigan    06/30/08 - fix USAGE_ADD_DB
//     rsirigan    06/17/08 - fix bug7188139 
//     agridnev    06/17/08 - fixed bug 7172071
//     rwessman    06/20/08 - Incorporated review comments from rxkumar.
//     sowong      06/04/08 - add messages for bug6644945
//     rsirigan    06/04/08 - add ONS and eONS to USAGE_SRVCTL_NOUN_SIHA and 
//                            fix USAGE_SI_SETENV_LISTENER, 
//                            fix USAGE_SI_UNSETENV_LISTENER
//     rwessman    05/28/08 - Added more GNS messages.
//     agridnev    06/02/08 - fix for bug 6953664
//     spavan      05/27/08 - fix bug6821677
//     rsirigan    05/26/08 - fix bug7126726 
//     yizhang     05/22/08 - Define ORDINAL_NUMBER_NOT_NUMERIC
//     agridnev    05/21/08 - added new messages for srvctl config service
//     rxkumar     05/20/08 - fix bug7040273
//     rxkumar     05/15/08 - fix bug7029476
//     rsirigan    05/15/08 - fix SERV_RUN message 
//     spavan      05/14/08 - Implement EONS and ONS for SIHA
//     rxkumar     05/07/08 - update -j default
//     spavan      05/12/08 - remove USAGE_SI_CONFIG_DB_ONE
//     spavan      05/09/08 - add cause and action
//     sowong      05/07/08 - modify messages for bug6953297
//     rsirigan    05/06/08 - fix bug 7021977 
//     yizhang     04/23/08 - Fix bug 6981656
//     sowong      04/23/08 - revert DISKGROUPS label for database back to old
//                            label
//     rxkumar     04/22/08 - update ASM CLI
//     rxkumar     04/15/08 - add diskgroup noun
//     sowong      04/11/08 - add messages for siha database
//     yizhang     04/01/08 - Define PORT_NOT_NUMERIC, NETWORK_NOT_NUMBER
//     yizhang     03/26/08 - Fix bug 6845868
//     rxkumar     03/26/08 - add srvpool support
//     sowong      03/26/08 - add database related msgs
//     agridnev    03/24/08 - fixed "add service" usage
//     rwessman    03/18/08 - Added support for GNS.
//     yizhang     03/13/08 - Fix bug 6845868
//     sowong      03/10/08 - add messages for asm filesystem
//     ksviswan    03/03/08 - update usage syntax for HOME cli
//     yizhang     02/29/08 - Fix SIHA listener usage
//     sowong      02/21/08 - add messages for environment variables
//     spavan      02/21/08 - add spavan_nappbugs messages
//     sravindh    02/19/08 - Pull in changes from transaction
//                            yizhang_srvctlsvgp_4
//     agridnev    02/06/08 - fixed bug 6764099
//     spavan      02/04/08 - Add deprecated message for -n remove
//     yizhang     01/30/08 - Update the usage for srvctl add scan
//     agridnev    01/28/08 - removed SRV_CFG_DOMAIN
//     sowong      01/27/08 - add database remove message
//     yizhang     01/08/08 - Update help message for modify scan/scan_listener
//     sowong      01/10/08 - modify DB_CENTRIC and SERVICE_CENTRIC msgs
//     spavan      01/10/08 - fix VIP_EXISTS message
//     agridnev    01/09/08 - promoted DTP to Distributed Transaction Processing
//     agridnev    01/04/08 - config service support
//     agridnev    01/03/08 - changed some flags for services
//     agridnev    01/03/08 - added support for service failover method
//     yizhang     01/03/08 - fix NODEAPPS_STOP_SUCC message
//     spavan      12/24/07 - Add modify nodeapps messages
//     agridnev    12/17/07 - added new msgs for services
//     ksviswan    12/09/07 - Patching CLI support
//     agridnev    12/04/07 - disable service support updated
//     agridnev    11/30/07 - add/modify service support updated
//     agridnev    11/21/07 - new message(s) for service support
//     agridnev    11/20/07 - amended service support
//     yizhang     11/26/07 - Add messages for config srvgrp
//     spavan      11/14/07 - add oc4j to noun
//     spavan      11/13/07 - Add cli's for OC4J
//     yizhang     11/13/07 - Use 11.2 srvctl commands for listener
//     yizhang     10/25/07 - fix CLIs for Scan
//     yizhang     10/19/07 - Add scan vip and scan listener messages
//     yizhang     10/08/07 - Use 11.2 syntax for srvctl <verb> srvgrp
//     yizhang     10/03/07 - Add -y for "srvctl remove vip" usage.
//     yizhang     10/01/07 - Add message PROMPT_REMOVE_VIP,CANNCEL_RM_VIP
//     sowong      09/27/07 - second phase of rac database implementation
//     yizhang     09/27/07 - add SCAN_NAME_CONFLICT_CLUSTER_NODE
//     yizhang     09/10/07 - Add messages for nodeapps 
//     sowong      08/17/07 - add messages for rac database implementation
//     yizhang     08/22/07 - Add error message NET_NUM_INVALID_FOR_VIP
//     yizhang     08/10/07 - Add messages for VIP commands
//     rsirigan    08/02/07 - fix bug6318383 
//     sowong      06/25/07 - add messages for asm implementation
//     rajkris     12/18/06 - Add messages for SCAN commands
//     smurala     09/21/06 - Msg fixes from 11.1 
//     bkannike    04/21/06 - 4666042 fix 
//     rxkumar     04/13/06 - fix bug5163409 
//     bkannike    04/03/06 - Modifying message for srvctl add nodeapps 
//     bkannike    04/10/06 - Fix srvctl config nodeapps usage 
//     rxkumar     01/03/06 - fix bug4623630 
//     rxkumar     08/02/05 - fix bug4531124 
//     rxkumar     05/23/05 - fix bug4379254 
//     bkannike    03/29/05 - Srvctl policy message changes 
//     bkannike    03/24/05 - adding usage messages for policy 
//     bkannike    03/23/05 - Policy Messages added to usage 
//     rxkumar     02/11/05 - fix bug4100762, add listener support 
//     dliu        10/20/04 - change syntax for status serv 
//     dliu        10/07/04 - remove mesg
//     dliu        09/09/04 - add MISMATCH_OUSER 
//     dliu        05/19/04 - 3437262
//     dliu        04/19/04 - 3366156 
//     dliu        03/31/04 - mesg fix 
//     dliu        03/22/04 - add asm 
//     dliu        03/23/04 - fix lsnr not running mesg 
//     dliu        03/09/04 - double quotes around list argument 
//     dliu        08/12/03 - -A mandatory in add nodeapps 
//     dliu        08/19/03 - start/stop service -a 
//     dliu        08/07/03 - mesg for internal service 
//     dliu        07/31/03 - force remove asm
//     dliu        08/05/03 - add ERR_CHK_ENABLE_ASM 
//     dliu        07/30/03 - ASM_DISABLED
//     dliu        07/28/03 - enable/disable asm
//     dliu        07/16/03 - remove nodeapps accepts multiple nodes
//     dliu        07/08/03 - 
//     dliu        06/27/03 - asm syntax help
//     dliu        06/09/03 - asm support
//     dliu        05/13/03 - 
//     dliu        05/13/03 - verb/noun -> command/object
//     dliu        04/22/03 - -f option for stop/relocate/modify service
//     dliu        04/21/03 - 
//     dliu        04/16/03 - add -T to setenv cmds
//     dliu        04/08/03 - db unique name
//     dliu        03/17/03 - add NO_ROOT
//     dliu        03/06/03 - fixing typos
//     dliu        02/18/03 - ONS mesg
//     dliu        02/17/03 - 
//     dliu        02/20/03 - minor changes
//     dliu        01/22/03 - 
//     dliu        01/14/03 - add serv inst
//     dliu        01/21/03 - add -q to start/stop
//     dliu        12/09/02 - add -S to config/status service
//     dliu        12/05/02 - fix typo in nodeapps help text
//     dliu        12/03/02 - use TAF values "NONE/BASIC/PRECONNECT
//     dliu        12/18/02 - help text for modify nodeapps
//     rdasari     10/21/02 - modify add database message
//     dliu        10/16/02 - give detail address string format
//     dliu        10/16/02 - add syntax mesgs for modify service,
//     dliu        08/16/02 - change "OEM Agent" to "EM Agent
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     dliu        07/15/02 - add db: change -s to -p
//     dliu        07/03/02 - add NODEAPPS_REMOVE_FAIL
//     dliu        06/28/02 - add periods to complete sentences
//     rdasari     06/17/02 - add SERV_NOT_EXIST
//     dliu        06/21/02 - remove VRANGE_FREE and VRANGE_ALLOCATED
//     dliu        03/26/02 - mesg for modify service.
//     dliu        03/19/02 - add SERV_AVAIL_LIST_EMPTY.
//     dliu        12/10/01 - change mesg contents for 9.2
//     dliu        11/19/01 - change INST_RUN.
//     dliu        11/14/01 - change usage text
//     dliu        11/01/01 - fix inst stat mesg.
//     dliu        10/30/01 - add existence mesgs.
//     dliu        10/25/01 - add vrange stuff.
//     dliu        10/24/01 - add NO_VRANGE.
//     dliu        09/18/01 - mesgs for new srvctl syntax.
//     dliu        08/15/01 - new messages.
//     dliu        08/07/01 - 902 changes.
//     dliu        02/06/01 - name change.
//     dliu        01/17/01 - modify usage openlines
//     dliu        01/11/01 - add support for pseudo cmds
//     dliu        01/11/01 - remove OPENLINE_REN_OPS
//     dliu        01/11/01 - add version mesg
//     dliu        11/15/00 - add INVALID_DBGLVL
//     dliu        11/08/00 - add -V to config command
//     dliu        10/23/00 - remove ERR_GET_ENV_VAL
//     dliu        10/23/00 - make -o mandatory for add ops
//     dliu        10/05/00 - fix messages
//     dliu        09/06/00 - fix a typo in mesg
//     dliu        08/31/00 - add command get env
//     dliu        08/29/00 - add INVALID_SETENVSTR
//     dliu        08/24/00 - remove OPT_P_MUSTWITH_OPT_N
//     dliu        08/24/00 - add mesg for invalid node
//     dliu        08/07/00 - cleanup code
//     dsaggi      07/11/00 -
//     dsaggi      07/11/00 - Creation
//  */
// 
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/opsctl/resources/PrkoMsg.msg /main/124 2009/06/08 19:10:31 agridnev Exp $
//  *  @author  dsaggi  
//  *  @since   release 8.2.0.0.0
//  */
// PACKAGE=package oracle.ops.opsctl.resources;
// MSGIDTYPE=interface
2000, INVALID_SI_SYNTAX, "Invalid command line syntax for a single instance database"
//  *Cause: user specified invalid command line syntax.
// *Action: Look at the usage provided for this command and specify all mandatory options.
/
2001, INVALID_SYNTAX, "Invalid command line syntax"
//  *Cause: The syntax of the command is incorrect. 
// *Action: Look at the usage provided for this command and use the correct syntax.
/
2002, INVALID_OPTION, "Invalid command line option: "
//  *Cause: Invalid command line option was specified.
// *Action: Check the value printed along with the exception and specify the correct value.
/
2003, INVALID_OPTION_VAL, "Invalid command line option value: "
//  *Cause: Invalid command line option was specified.
// *Action: Check the value printed along with the exception and specify the correct value.
/
2004, REPEATED_OPTION, "Repetition of command line option: "
//  *Cause: The command line option printed along with the exception was repeated. 
// *Action: Delete the repeated command line option and try the command again.
/
2005, NO_CONFIGURATION, "Failure in getting Cluster Database Configuration for: "
//  *Cause: The specified database does not exist.
// *Action: Check the specified database name and try again.
/
2006, INVALID_NODE, "Invalid node name: {0}"
//  *Cause: Unable to get the hostname for the given node/machine name.
// *Action: Check the node name and try again.
/
2007, INVALID_INST_NAME, "Invalid instance name: {0}"
//  *Cause: Unable to obtain the node name on which the instance name specified was running.
// *Action: Check the instance name specified and try again.
/
2008, INVALID_CONNSTR, "Invalid connect string: "
//  *Cause: The connect string specified was not in the format username/password [as {SYSDBA|SYSOPER}]
// *Action: Check the connect string and try again.
/
2009, INVALID_SETENVSTR, "Invalid name/value string: {0}"
//  *Cause: The name value string should be of the form name = value
// *Action: check the input name/value pair and try again.
/
2010, USAGE_VERB_ERROR, "Invalid command specified on command line: {0}"
//  *Cause: The <command> specified on the command line was not recognized.
// *Action: Valid commands are enable|disable|start|stop|relocate|status|add|remove|modify|getenv|setenv|unsetenv|config. Usage of srvctl is printed with this errori. Check the usage and specify a valid command.
/
2011, USAGE_NOUN_ERROR, "Invalid object specified on command line: {0}"
//  *Cause: The <object> specified on the command line was not recognized.
// *Action: Valid objects are database|instance|service|nodeapps|vip|asm|diskgroup|listener|srvpool|scan|scan_listener|oc4j|home|filesystem|gns. Srvctl usage is printed along with this exception. Check the usage printed with this error and use a valid object.
/
2012, UNSUPPORTED_NOUN_SIHA, "{0} object is not supported in Oracle Restart"
//  *Cause: The <object> specified on the command line was not a valid object for the Oracle Restart mode.
// *Action: Valid objects for Oracle Restart mode are 
//          database|service|asm|diskgroup|listener|home|ons|eons. Srvctl 
//          usage is printed along with this exception. Check the usage 
//          printed with this error and use a valid object.
/
2013, UNSUPPORTED_NOUN_CLUSTERWARE, "{0} object is not supported in Oracle Clusterware"
//  *Cause: The <object> specified on the command line was not a valid object for the Oracle Clusterware mode.
// *Action: Valid objects for Oracle Clusterware are
//          database|instance|service|nodeapps|vip|asm|diskgroup|listener|
//          srvpool|scan|scan_listener|oc4j|home|filesystem|gns. Srvctl usage 
//          is printed along with this exception. Check the usage printed with 
//          this error and use a valid object.
/
2014, MISSING_CONFIG_DB_PARAM, "The -a option should be specified with -d <dbunique_name> for 'srvctl config database' command"
//  *Cause: -a option was specified without the required -d option specifying for which database to retrieve configuration.
// *Action: To retrieve the full configuration of the database, specify both -d and -a option with the 'srvctl config database' command.
/
2015, ERR_CHK_COND_INST, "Dummy message. Not used"
// *Document: NO
//  *Cause: 
// *Action: 
/
2017, SERV_NOT_EXIST, "Service {0} does not exist for database {1}."
//  *Cause: The service being updated is not defined for the given database.
// *Action: If the service needs to be added don't use '-u' option in 'srvctl modify service' command. Option '-u' is for updating existing services.
/
2027, SRVPOOL_CONFIG_NOT_EXISTS, "Dummy message. Not used"
// *Document: NO 
//  *Cause: 
// *Action: 
/
2040, SCAN_LSNR_NOT_RUNNING, "SCAN listener {0} is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2046, SCAN_LSNR_RUNNING, "SCAN listener {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2047, SCAN_LSNR_CONFIG, "SCAN Listener {0} exists. Port: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2049, INVALID_NAME_VALUE_STR, "Invalid name-value string: {0}"
//  *Cause: The name=value string specified is not in valid format.
// *Action: The format for the string should be name=value. Check input and correct the error.
/
2050, ERR_CHK_ENABLE_ASM_NODE, "Error in enabling ASM instance on node {0}. {1}"
//  *Cause: ASM could not be enabled.
// *Action: Make sure that the node name is correct and that ASM exists on the specified node and it is not already enabled on the node. The current state of the ASM can be found using 'srvctl status asm' command. To check if ASM is configured or not, use 'srvctl config asm' command.
/
2051, ERR_CHK_CONFIG_ASM, "Dummy message. Not used"
// *Document: NO
//  *Cause: 
// *Action: 
/
2052, ERR_CHK_CONFIG_ASM_NODE, "Dummy message. Not used"
// *Document: NO
//  *Cause: 
// *Action: 
/
2053, ERR_CHK_DISABLE_ASM_NODE, "Error in disabling ASM instance on node {0}. {1}"
//  *Cause: ASM could not be disabled.
// *Action: Make sure that the node name is correct and that ASM exists on the specified node and it is not already disabled on the node. The current state of the ASM can be found using 'srvctl status asm' command. To check if ASM is configured or not, use 'srvctl config asm' command.
/
2054, INVALID_SYNTAX_OR_MAND, "Invalid command line syntax, mandatory options are either {0} or {1}, but not both."
//  *Cause: The command requires exactly one set of mandatory command line options. But either some options in one set were missing or the options from both sets were specified. 
// *Action: Check the command line options entered and make sure that all the mandatory options in one set are specified.
/
2055, NETWORK_EXIST, "Network exists."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2056, NETWORK_REMOVE_EXCEPTION, "Error occured while checking dependent resources on network {0}. Network was not removed."
//  *Cause: An attempt made to check if any resources are dependent on the given network failed.
// *Action: Make sure that the network is up. Make sure that the user has sufficient permission to remove network. If force flag was not specified in the remove command then specify force flag and try the command again.
/
2058, SCAN_NAME_CONFLICT_NODE, "Scan name {0} cannot be the same as a cluster node name: {1}"
//  *Cause: Scan name is same as a cluster node name.
// *Action: Choose a different scan name and issue the command.
/
2059, SCAN_VIP_ENABLED, "SCAN VIP {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2060, SCAN_VIP_DISABLED, "SCAN VIP {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2061, SCAN_VIP_RUNNING, "SCAN VIP {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2062, SCAN_VIP_NOT_RUNNING, "SCAN VIP {0} is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2063, SCAN_LSNR_ENABLED, "SCAN Listener {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2064, SCAN_LSNR_DISABLED, "SCAN Listener {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2065, INVALID_SG_FOR_SI_DB, "Only one server pool should be provided for a single instance database on a cluster"
//  *Cause: An attempt to create a single instance database failed because more than one server pool was specified.
// *Action: Provide only one server pool while creating the single instance database.
/
2066, OC4J_STATUS_DISABLED, "OC4J is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2067, INVALID_SG_SIZE_FOR_SI_DB, "The size of server pool should be one for single instance database"
//  *Cause: An attempt to create a single instance database failed because a server pool with more than one server was specified.
// *Action: Provide a server pool with only one server while creating a single instance database.
/
2068, OC4J_ADDED, "OC4J successfully created"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2069, OC4J_ALREADY_EXISTS, "OC4J could not be created as it already exists"
//  *Cause: A new OC4J instance could not be created, as there is an existing instance of OC4J.
// *Action: Only one instance of OC4J can exists at any given time.
/
2070, OC4J_CREATION_FAILED, "OC4J creation failed"
//  *Cause: A new OC4J instance could not be added because of OC4J exception.
// *Action: Resolve the OC4J exception and then try the OC4J addition again.
/
2071, OC4J_CONFIG_EXISTS, "OC4J is configured to run on port number {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2072, OC4J_CONFIG_NOT_EXISTS, "OC4J is not configured"
//  *Cause: OC4J is not configured on the cluster. 
// *Action: Check the exception printed with this message. If OC4J is not configured then OC4J instance can be created using 'srvctl add oc4j'. If their are other errors shown with this error then check the cause/action messages of underlying exception.
/
2073, OC4J_REMOVE_SUCCESS, "OC4J removed successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2074, OC4J_STILL_RUNNING, "OC4J is still running. It must be stopped before removing."
//  *Cause: 'srvctl remove oc4j' was issued while OC4J instance was running.
// *Action: Stop the oc4j instance using 'srvctl stop oc4j' and then try removing.
/
2075, OC4J_REMOVE_FAILED, "OC4J could not be removed"
//  *Cause: OC4J instance could not be removed because it does not exist.
// *Action: The current OC4J configuration can be checked using 'srvctl config oc4j' command. Make sure that OC4J instance is running on that port. If their are other underlying messages printed then check the cause/action for the underlying errors shown with this.
/
2076, OC4J_MODIFY_PORT_SUCCESS, "OC4J modified to run on port {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2077, OC4J_MODIFY_PORT_FAILED, "OC4J RMI port could not be modified"
//  *Cause: OC4J RMI port could not be modified.
// *Action: Make sure that OC4J instance exists and port is not in use by using the command 'srvctl config oc4j' and try again.
/
2078, OC4J_START_SUCCESS, "OC4J has been started"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2079, OC4J_START_FAILED, "OC4J could not be started"
//  *Cause: The start of OC4J instance failed.
// *Action: Make sure that OC4J instance exists and is not already started. 
/
2080, OC4J_STOP_SUCCESS, "OC4J has been stopped"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2081, OC4J_STOP_FAILED, "OC4J failed to stop"
//  *Cause: The OC4J instance could not be stopped.
// *Action: Make sure that OC4J instance exists and are not already stopped.
/
2082, MISSING_MANDATORY_OPTION, "Missing mandatory option {0}" 
//  *Cause: The specified mandatory command option is missing. 
// *Action: Use srvctl with the -h option to display option details for the command and make sure that all the mandatory options are specified. 
/ 
2083, OC4J_NOT_RUNNING, "OC4J is enabled but is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2084, OC4J_RUNNING_NODE, "OC4J is enabled and running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2085, OC4J_NOT_RUNNING_NODE, "OC4J is not enabled or running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2086, OC4J_ENABLED, "OC4J enabled successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2087, OC4J_NOT_ENABLED, "OC4J could not be enabled"
//  *Cause: OC4J instance could not be enabled.
// *Action: Make sure that node name is correct and that OC4J instance exists and is not already enabled. The current state of the OC4J instance can be found using 'srvctl status oc4j' command. To check if OC4J instance is configured or not use 'srvctl config oc4j' command.
/
2088, OC4J_ENABLED_NODE, "OC4J enabled successfully on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2089, OC4J_DISABLED, "OC4J disabled successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2090, OC4J_NOT_DISABLED, "OC4J could not be disabled"
//  *Cause: OC4J instance could not be disabled.
// *Action: Make sure that Node name is correct and that OC4J instance exists and is not already disabled. The current state of the OC4J instance can be found using the srvtl status oc4j command. To check if OC4J instance is configured or not use 'srvctl config oc4j' command.
/
2091, OC4J_DISABLED_NODE, "OC4J disabled successfully on node {0}"
//  *Document: No
//  *Cause: Status Message
// *Action: Not an error
/
2092, OC4J_RELOCATED, "OC4J relocated successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2093, OC4J_NOT_RELOCATED, "OC4J could not be relocated"
//  *Cause: OC4J instance could not be relocated to given node.
// *Action: If the node name was passed in the command line make sure that the node name is valid. Also make sure that 0C4J instance exists on the cluster and is running. 
/
2094, OC4J_RELOCATED_NODE, "OC4J relocated successfully to node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2095, SRVPOOL_CONFIG_NAME, "Server pool name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2096, SRVPOOL_CONFIG_NUMBERS, "Importance: {0}, Min: {1}, Max: {2}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2097, SRVPOOL_CANDIDATE_SERVERS, "Candidate server names: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2098, SRVPOOL_ACTIVE_SERVERS_COUNT, "Active servers count: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2099, SRVPOOL_ACTIVE_SERVERS, "Active server names: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2100, SERV_U_FAILED_CARD_DB, "Cannot update service {0} because {1} is not is not administrator-managed"
//  *Cause: An attempt to update the service using "-u" option failed because this option can be used with administrator-managed databases only.
// *Action: Make sure that you provide correct options for 'srvctl add service' command.
/
2101, SERV_DBINST_NOT_FOUND, "Failed to find database instances {0}"
//  *Cause: 
// *Action: 
/
2102, SG_FAILED_TO_CREATE, "Failed to create server pool {0}: {1}"
//  *Cause: An attempt to create the specified server pool failed because of the reason provided by the accompanying error.
// *Action: Examine the accompanying error messages for details.
/
2103, SERV_U_FAILED_AR, "The '-a' and '-r' options cannot both be supplied with '-u'"
//  *Cause: Command 'srvctl add service' with  '-u' option failed because both options '-a' and '-r' were provided.
// *Action: Correct options and issue command again.
/
2104, SERV_U_FAILED_NO_AR, "Option '-a' or '-r' should be supplied with '-u"
//  *Cause: Command 'srvctl add service' with  option '-u' failed because both it requires options '-a' or '-r' to be  provided.
// *Action: Correct options and issue command again.
/
2105, SERV_G_FAILED_BAD_OPTION, "Option '-g'  cannot be used with option '-r','-a' or '-P'"
//  *Cause: Incorrect usage of -g option.
// *Action: Correct options and issue command again.
/
2106, SERV_DB_HAS_NO_SG, "There is no server pool associated with database {0}"
//  *Cause: Command 'srvctl add service' failed because the given database doesn't have an associated server pool.
// *Action: Oracle internal error. Contact customer support.
/
2107, SERV_INST_NOT_FOUND, "Failed to find an instance {1} for database {0}"
//  *Cause: 
// *Action: 
/
2108, SERV_EXCL_I_N, "Command line options '-i' and '-n' cannot be used at the same time"
//  *Cause: Incorrect usage of -i and -n options.
// *Action: Correct options and issue command again.
/
2110, SERV_EXCL_C, "Option '-c' cannot be used to create services with admin managed database {0} "
//  *Cause: Incorrect usage of -c option.
// *Action: Remove -c option and issue command again.
/
2111, INVALID_NUMBER_4_OPTION, "Invalid number {0} for command line option {1}"
//  *Cause: Invalid value was specified for the command line option that requires a number in a certain range.
// *Action: Check the value printed and specify a number within the required range.
/
//2112, AVAILABLE_FOR_REUSE
////  *Cause:
//// *Action:
///
2113, SCAN_VIP_CONFIG, "SCAN VIP name: {0}, IP: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2114, SCAN_CONFIG, "SCAN name: {0}, Network: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2115, OC4J_ALREADY_DISABLED, "OC4J is already disabled"
//  *Cause: OC4J instance could not be disabled because it is already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then enable OC4J instance by using the 'srvctl enable oc4j' command.
/
2116, OC4J_ALREADY_ENABLED, "OC4J is already enabled"
//  *Cause: OC4J instance could not be enabled because it is already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then disable OC4J instance by using the 'srvctl disable oc4j' command.
/
2161, INST_DISABLED, "Instance is disabled: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2162, SERV_NOT_ON_INST, "Service {0} is not supported on instance {1}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error: 
/
2163, SERV_AVAIL_LIST_EMPTY, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
2164, ERR_CHK_COND_SERV, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
2165, ERR_CHK_COND_VIP, "VIP does not exist on node(s) : {0}"
//  *Cause: VIP was not configured on the nodes.
// *Action: Add VIP using 'srvctl add nodeapps' or 'srvctl add vip' and try this command again.
/
2166, ERR_CHK_COND_GSD, "GSD does not exist on node(s): {0}"
//  *Cause: GSD was not configured on the nodes
// *Action: Add GSD using 'srvctl add nodeapps' and try this command again.
/
2167, ERR_CHK_COND_VIP_VIPNAME, "VIP {0} does not exist."
//  *Cause: VIP with the specified name was not configured.
// *Action: Add VIP using 'srvctl add nodeapps' or 'srvctl add vip' and try this command again.
/
2168, NODEAPPS_STILL_RUN, "Node applications are still running on node: "
//  *Cause: Node applications are still running on node when a remove was attempted.
// *Action: Stop the node applications before removing them or use force flag when attempting removal.
/
2172, NODEAPPS_REMOVE_FAIL, "Some or all node applications are not removed successfully on node: "
//  *Cause: Not all node applications were removed on the node.
// *Action: Make sure that all resources that depend on node applications are stopped before attempting to remove node applications. Also if force flag was not specified, reissue this command with the force flag specified.
/
2173, INST_ALREADY_PREF, "Instance {0} is already a preferred instance for service {1}."
//  *Cause: Given instance is already a preferred instance for the service.
// *Action: Specify an instance other than the preferred instances of this service.
/
2174, INST_ALREADY_AVAIL, "Instance {0} is already an available instance for service {1}."
//  *Cause: Given instance is already an available instance for the service.
// *Action: Specify an instance other than the available instances of this service.
/
2176, ERR_CHK_COND_ONS, "ONS daemon does not exist on node(s): {0}"
//  *Cause: ONS was not configured on the nodes.
// *Action: Add ONS using 'srvctl add nodeapps' command and try this command again.
/
2182, ERR_CHK_COND_EONS, "eONS daemon does not exist on node(s): {0}"
//  *Cause: eONS was not configured on the nodes.
// *Action: Add eONS using 'srvctl add nodeapps' command and try this command again.
/
2183, NODEAPPS_MODIFY_VIP_NETMASK_NOT_SAME, "Node applications run on default network only. The netmask given {0} doesn't match default networks netmask {1}"
//  *Cause: The netmask given in the modify command doesn't match with default network's netmask.
// *Action: Modify the default network first using 'srvctl modify nodeapps -S <options>' and then try modifying the VIP.
/
2184, NODEAPPS_MODIFY_VIP_INTERFACE_NOT_SAME, "Node applications run on default network only. The interface given {0} doesn't match default networks interface {1}"
//  *Cause: The interface specified in the modify command doesn't match with default network's interface.
// *Action: Modify the default network's interface using 'srvctl modify nodeapps -S <options>' and then try modifying the VIP.
/
2185, NODEAPPS_MODIFY_VIP_NOTHING_TO_MODIFY, "The new VIP address given is same as the current VIP address"
//  *Cause: The VIP address given for modification is same as the current VIP. So there is nothing to modify.
// *Action: Check the VIP address you want to modify and specify the correct value.
/
2186, NODEAPPS_MODIFY_ONS_HOSTPORT_LIST_ERROR, "The command line parameter host port list should be in the form <host>[:<port>][,<host>:[<port>]...]"
//  *Cause: The command line parameter -t <host_port_list> was not in the format <host>[:<port>][,<host>:[<port>]...]  with port being numeric.
// *Action: Check the input and correct any error and try the command again.
/
2187, SUBNET_MODIFY_SUCCESSFUL, "The network resource has been modified successfully. VIP and other resources that depend on it might not start up unless they are modified"
//  *Cause: When underlying network resource has been modified the VIP should be updated to the new network resource. This is not a error and is just a status message.
// *Action: Use 'srvctl modify nodeapps -A <options>' to update the VIP to the new network.
/
2188, ALL_NODEAPPS_ALREADY_EXISTS, "All the node applications already exist. They were not recreated."
//  *Cause: 'srvctl add nodeapps' was attempted when all the node applications already existed.
// *Action: If you want to modify node applications you should use 'srvctl modify nodeapps' command.
/
2189, NODEAPPS_MODIFY_SUCCESS, "The node applications were successfully modified."
//  *Document: No
//  *Cause: Status Message
// *Action: Not an error
/
2190, VIP_ALREADY_EXISTS, "VIP exists for node {0}, VIP name {1}"
//  *Cause: The VIP being added already exists.
// *Action: Check the input and if VIP needs to be modified use 'srvctl modify VIP' command.
/
2199, INVALID_ADDR_STR, "Invalid address string: "
//  *Cause: VIP address being passed on the command line is not a valid address string.
// *Action: Address string should be of the format <name|ip>/<netmask>/[if1[|if2...]]. Check the usage and correct the address format.
/
2200, INVALID_INTERFACE_STR, "Invalid interface specified on command line: {0}"
//  *Cause: VIP address specification '-A <name|ip>/<netmask>[/if1[|if2|...]]' or the network address specification '-S <subnet>/<netmask>[/if1[|if2|...]]'  on the command line contained interfaces names, none of which exist on current node.
// *Action: Check the interfaces listed in the address string and make sure that they are enabled and are up. Use network interface names on the command line if there is more than one interfaces that connect to the same network.
/
2201, VERSION, "srvctl version: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2202, INST_RUN, "Instance {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2204, INST_NOT_RUN, "Instance {0} is not running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2205, LSNR_NOT_RUN, "Listener {0} is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2206, ASM_HOME, "ASM home: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2207, DEPRECATED_OPTION, "-{0} option has been deprecated and will be ignored."
//  *Cause: Deprecated option has been used in the command line. The option will be ignored.
// *Action: Check the documentation for the new syntax of the command.
/
2208, DEPRECATED_COMMAND, "{0} command has been deprecated and will be ignored."
//  *Cause: The command being executed has been deprecated and will not do any action.
// *Action: Check the documentation for the commands supported by srvctl.
/
2209, UNSUPP_SRV_CENTRIC_CMD, "{0} command is not supported for configuration using server pool."
//  *Cause: The given command failed because it isn't applicable to instances of policy managed-databases.
// *Action: Check the documentation on the commands that are applicable to policy-managed databases.
/
2210, ASM_LSNR, "ASM listener: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2211, ASM_LSNR_NOT_FOUND, "ASM listener was not found"
//  *Cause: Check the reported message, ASM listener may not exist.
// *Action: Use \"srvctl modify asm -l <lsnr_name>\" to set the listener that ASM should register with.
/
2301, SERV_RUN, "Service {0} is running on instance(s) {1}"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2302, SERV_NOT_RUN, "Service {0} is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2303, VIP_RUN, "VIP is running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2304, VIP_NOT_RUN, "VIP is not running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2305, GSD_RUN, "GSD is running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2306, GSD_NOT_RUN, "GSD is not running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2309, VIP_EXIST, "VIP exists."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2310, VIP_NOT_EXIST, "VIP does not exist on node {0}."
//  *Cause: VIP was not configured on that node on which modification was attempted. 
// *Action: VIP must be added using 'srvctl add nodeapps' command, before it can be modified.
/
2311, GSD_EXIST, "GSD exists."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2312, GSD_NOT_EXIST, "GSD does not exist."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2313, VIP_VIPNAME_NOT_EXIST, "VIP {0} does not exist."
//  *Cause: An attempt was made to remove a VIP with the specified vipname. No such VIP was configured on the cluster.
// *Action: If this is the expected state then it is not an error. Check the status of VIPs using 'srvctl status vip' command. VIP must be added using 'srvctl add vip' command before it can be removed.
/
2317, INST_RUN_WITH_SERV, "Instance {0} is running on node {1} with online services {2}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2318, TARGET_INST_FOR_SERV, "Target instance {0} already supports service {1}."
//  *Cause: Given database instance already provides the given service. 
// *Action: Specify an instance that is not a preferred or available instance for this service.
/
2320, PROMPT_REMOVE_DB, "Remove the database {0}?"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2323, CANNCEL_RM_DB, "Database removal cancelled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2324, CANNCEL_RM_INST, "Instance removal cancelled."
// *Document: No
//  *Cause: Status Message
// *Action: Not an error
/
2326, SERV_DISABLED, "Service {0} is disabled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2327, PROMPT_REMOVE_NA_CLUSTER, "Please confirm that you intend to remove node-level applications on all nodes of the cluster"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2328, PROMPT_REMOVE_NA, "Please confirm that you intend to remove node-level applications on node {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2329, CANNCEL_RM_NA, "Node-level applications on node {0} are not removed."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2330, ONS_EXIST, "ONS daemon exists. Local port {0}, remote port {1}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2331, ONS_NOT_EXIST, "ONS daemon does not exist."
//  *Cause: ONS daemon was not configured on this cluster.
// *Action: ONS daemon can be configured using the 'srvctl add nodeapps' command.
/
2332, ONS_RUN, "ONS daemon is running on node: "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2333, ONS_NOT_RUN, "ONS daemon is not running on node: "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2334, ASM_RUN, "ASM instance {0} is running on node {1}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2335, ASM_NOT_RUN, "ASM instance {0} is not running on node {1}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2336, ASM_DISABLED_NODE, "ASM is disabled on node {0}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2337, PROMPT_REMOVE_SERV_INST, "Remove service {0} from the instance {1}?"
// *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2338, EONS_EXIST, "eONS daemon exists. Multicast port {0}, multicast IP address {1}, listening port {2}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2339, EONS_NOT_EXIST, "eONS daemon does not exist."
//  *Cause: eONS daemon was not configured on this cluster.
// *Action: eONS daemon can be configured using the 'srvctl add nodeapps' command.
/
2340, EONS_RUN, "eONS daemon is running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2341, EONS_NOT_RUN, "eONS daemon is not running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2342, VIP_ENV_LIST, "VIP environment variables:"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2343, GSD_ENV_LIST, "GSD environment variables:"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2344, ONS_ENV_LIST, "ONS environment variables:"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2345, EONS_ENV_LIST, "eONS environment variables:"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2346, PROMPT_REMOVE_SCAN, "Remove the scan?"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2347, PROMPT_REMOVE_SCAN_LSNR, "Remove scan listener?"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2348, PROMPT_REMOVE_SCAN_NO, " Remove scan cancelled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2349, PROMPT_REMOVE_SCAN_LSNR_NO, "Remove scan listener cancelled"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2351, ASM_ENABLED, "ASM is enabled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2352, ASM_DISABLED, "ASM is disabled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2353, ASM_ENABLED_NODE, "ASM is enabled on node {0}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2355, ASM_RUNNING, "ASM is running."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2356, ASM_NOT_RUNNING, "ASM is not running."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2357, ASM_RUNNING_NODE, "ASM is running on {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2358, ASM_NOT_RUNNING_NODE, "ASM is not running on {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2359, ASM_SPFILE_OR_PARA, "ASM spfile/parameters: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2360, LSNR_ENABLED, "Listener {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2361, LSNR_DISABLED, "Listener {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2362, VIP_RUNNING, "VIP {0} is running on node: {1}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2363, VIP_NOT_RUNNING, "VIP {0} is not running"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2364, NETWORK_RUN, "Network is running on node: "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2365, NETWORK_NOT_RUN, "Network is not running on node: "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2366, GSD_RES_ENABLED_SUCC, "GSD is enabled successfully on node(s): {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2367, GSD_RES_DISABLED_SUCC, "GSD is disabled successfully on node(s): {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2372, NODEAPPS_ADD_SUCC, "Successfully added node applications. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2373, NODEAPPS_REMOVE_SUCC, "Successfully removed node applications. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2374, NODEAPPS_START_SUCC, "Successfully started node applications. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2375, NODEAPPS_STOP_SUCC, "Successfully stopped node applications. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2376, ONLY_VIP_REMOVED_SUCC, "Successfully removed VIP from the node(s). All other node applications will be removed when node applications are removed on last node."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2377, LOCAL_PORT_NOTHING_TO_MODIFY, "eONS already uses {0} as listening port. Nothing to modify."
//  *Cause: The listening port specified in this command is already in use by eONS.
// *Action: Check the input and if the listening port needs to be changed then specify a different port.
/
2378, PROMPT_REMOVE_VIP, "Please confirm that you intend to remove the VIPs {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2379, CANNCEL_RM_VIP, "VIPs {0} are not removed."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2380, VIP_STILL_RUN, "VIP {0} is still running on node: {1}"
//  *Cause: VIP to be removed is still running on a node.
// *Action: Stop the VIP before attempting to remove it or retry the command with force flag.
/
2381, VIP_REMOVE_FAIL, "VIP {0} is not removed successfully:  "
//  *Cause: VIP remove action failed because VIP was running and force flag was not specified  or an exception occurred  during the removal.
// *Action: Make sure that any applications, like for example listener, that depend on VIP are down. Try using -f option to remove the VIP. If you use force option to remove VIP then any application that depends on this VIP will stop working. Look at the help message for the accompanying exception.
/
2382, VIP_REMOVE_SUCC, "Successfully removed VIP {0}. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2383, NETWORK_REMOVE_FAIL, "Network {0} is not removed successfully: "
//  *Cause: Since there were no VIPs hosted on the network an attempt was made to remove the network and network removal failed.
// *Action: Make sure that all other applications that depend on default network are stopped. If force flag was not specified then specify force flag and try the command again. 
/
2384, NETWORK_REMOVE_SUCC, "Successfully removed network {0}. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2385, UNKNOWN_HOST, "The specified hostname or address {0} cannot be resolved."
//  *Cause: An invalid IP address or irresolvable hostname was specified.
// *Action: If IP address is specified then make sure that it is of legal length. If a host name is specified then make sure that the host name resolves to an IP address.
/
2386, NETMASK_MISSING_VIP_ADDR, "Netmask is missing in address string: "
//  *Cause: NETMASK is missing in the VIP address that was passed in the command string.
// *Action: VIP address is of form <ip_or_name>/<netmask>[/<interface1>[|<interface2>...]]. Specify the netmask.
/
2387, NODEAPPS_NODE_NAME_DEPRECATED, "-n <node_name> option has been deprecated."
//  *Cause: -n <node_name> has been deprecated in this release.
// *Action: Try to remove the usage of -n <node_name> in the command.
/
2388, VALUED_OPTION_VALUE_MISSING, "Command line option {0} should be followed by a value."
//  *Cause: The value needs to be specified by the command line option.
// *Action: Look at the usage and of the command and specify an appropriate value.
/
2389, NODEAPPS_INVALID_OPTION_COMBINATION, "Invalid command line options. Neither -A nor -n can be specified with -S."
//  *Cause: Invalid combination of options specified for add/modify node application command. -A is node-specific option and has to be used with -n option. -S option is a global option and it cannot be used with -A or -n option.
// *Action: Issue the command using either -A and -n together or -S without -A or -n.
/
2390, NODEAPPS_NODE_NAME_DEPRECATED_IGNORED, "-n <node_name> option has been deprecated and is ignored."
//  *Cause: -n <node_name> option has been deprecated and is ignored from this release. It has no effect on the command.
// *Action: Remove the usage of -n <node_name> from the command line.
/
2391, NETWORK_NOTHING_TO_MODIFY, "Network resource {0},{1} already exists. Nothing to modify"
//  *Cause: The subnet specified is already the default subnet.
// *Action: Check the input and if the subnet needs to be modified then specify a different subnet.
/
2392, MULTICAST_NOTHING_TO_MODIFY, "eONS already uses {0} as Multicast address. Nothing to modify."
//  *Cause: The Multicast address specified in this command is already in use by eONS. 
// *Action: Check the input and if the Multicast address needs to be changed then specify a different address.
/
2393, MULTICAST_PORT_NOTHING_TO_MODIFY, "eONS already uses {0} as Multicast port. Nothing to modify."
//  *Cause: The Multicast port specified in this command is already in use by eONS.
// *Action: Check the input and if the Multicast port needs to be changed then specify a different port.
/
2394, ONS_LOCAL_PORT_NOTHING_TO_MODIFY, "ONS already uses {0} as port for local connections. Nothing to modify."
//  *Cause: The modify node applications command failed because the ONS port for local connections is already used by ONS for local connections.
// *Action: Check the input and if the port used by ONS for local connections need to be modified specify a different address.
/
2395, ONS_REMOTE_PORT_NOTHING_TO_MODIFY, "ONS already uses {0} as port for remote connections. Nothing to modify."
//  *Cause: The modify node applications command failed because the ONS port for remote connections is already used by ONS for remote connections.
// *Action: Check the input and if the port used by ONS for remote connections need to be modified specify a different address.
/
2396, ONS_REMOTE_HOSTPORT_NOTHING_TO_MODIFY, "The list of remote host/port ONS pairs matches the current list : {0}. Nothing to modify."
//  *Cause: The modify node applications command failed because the remote host/port ONS pairs matches the current list.
// *Action: Check the input and if the remote host/port pairs need to be modified and specify a different host/port list.
/
2397, VIP_RES_ENABLED_SUCC, "VIP is enabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2398, NET_RES_ENABLED_SUCC, "Network is enabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2399, ONS_RES_ENABLED_SUCC, "ONS is enabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2400, EONS_RES_ENABLED_SUCC, "eONS is enabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2401, VIP_RES_DISABLED_SUCC, "VIP is disabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2402, NET_RES_DISABLED_SUCC, "Network is disabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2403, ONS_RES_DISABLED_SUCC, "ONS is disabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2404, EONS_RES_DISABLED_SUCC, "eONS is disabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2405, ERR_CHK_COND_NET, "Network resource does not exist on the cluster nodes."
//  *Cause: Network resource does not exist on the cluster nodes.
// *Action: Node applications can be added by using 'srvctl add nodeapps' command.
/
2406, VIP_START_SUCC, "Successfully started VIP. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2407, VIP_ADD_SUCC, "Successfully added VIP. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2408, VIP_DISABLED_SUCC, "Successfully disabled VIP. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2409, GSD_RES_ALREADY_DISABLED, "GSD is already disabled on node(s): {0}"
//  *Cause: The disable node applications command failed because GSD was already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then GSD can be enabled by 'srvctl enable nodeapps' command.
/
2410, VIP_RES_ALREADY_DISABLED, "VIP is already disabled on node(s): {0}"
//  *Cause: The disable node applications command failed because VIP was already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then VIP can be enabled by 'srvctl enable nodeapps' command.
/
2411, NET_RES_ALREADY_DISABLED, "Network resource is already disabled."
//  *Cause: The disable node applications command failed because Network resource was already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then Network resource can be enabled by 'srvctl enable nodeapps' command.
/
2412, ONS_RES_ALREADY_DISABLED, "ONS is already disabled on node(s): {0}"
//  *Cause: The disable node applications command failed because ONS was already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then ONS can be enabled by 'srvctl enable nodeapps' command.
/
2413, EONS_RES_ALREADY_DISABLED, "eONS is already disabled on node(s): {0}"
//  *Cause: The disable node applications command failed because eONS was already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then eONS can be enabled by 'srvctl enable nodeapps' command.
/
2414, GSD_RES_ALREADY_ENABLED, "GSD is already enabled on node(s): {0}"
//  *Cause: The enable node applications command failed because GSD is already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then GSD can be disabled by 'srvctl disable nodeapps' command.
/
2415, VIP_RES_ALREADY_ENABLED, "VIP is already enabled on node(s): {0}"
//  *Cause: The enable node applications command failed because VIP is already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then VIP can be disabled by 'srvctl disable nodeapps' command.
/
2416, NET_RES_ALREADY_ENABLED, "Network resource is already enabled."
//  *Cause: The enable node applications command failed because Network resource is already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then Network resource can be disabled by 'srvctl disable nodeapps' command.
/
2417, ONS_RES_ALREADY_ENABLED, "ONS is already enabled on node(s): {0}"
//  *Cause: The enable node applications command failed because ONS is already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then ONS can be disabled by 'srvctl disable nodeapps' command.
/
2418, EONS_RES_ALREADY_ENABLED, "eONS is already enabled on node(s): {0}"
//  *Cause: The enable node applications command failed because eONS is already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then eONS can be disabled by 'srvctl disable nodeapps' command.
/
2419, GSD_RES_ALREADY_STARTED, "GSD is already started on node(s): {0}"
//  *Cause: The start node applications command failed because GSD is already started.
// *Action: If this is the expected state then this is not an error. If it is not then GSD can be stopped by 'srvctl stop nodeapps' command.
/
2420, VIP_RES_ALREADY_STARTED, "VIP is already started on node(s): {0}"
//  *Cause: The start node applications command failed because VIP is already started.
// *Action: If this is the expected state then this is not an error. If it is not then VIP can be stopped by 'srvctl stop nodeapps' command.
/
2421, NET_RES_ALREADY_STARTED, "Network resource is already started on node(s): {0}"
//  *Cause: The start node applications command failed because Network resource is already started.
// *Action: If this is the expected state then this is not an error. If it is not then Network resource can be stopped by 'srvctl stop nodeapps' command. Note that once started network resource cannot be stopped.
/
2422, ONS_RES_ALREADY_STARTED, "ONS is already started on node(s): {0}"
//  *Cause: The start node applications command failed because ONS is already started.
// *Action: If this is the expected state then this is not an error. If it is not then ONS can be stopped by 'srvctl stop nodeapps' command.
/
2423, EONS_RES_ALREADY_STARTED, "eONS is already started on node(s): {0}"
//  *Cause: The start node applications command failed because eONS is already started.
// *Action: If this is the expected state then this is not an error. If it is not then eONS can be stopped by 'srvctl stop nodeapps' command.
/
2424, GSD_RES_ALREADY_STOPPED, "GSD is already stopped on node(s): {0}"
//  *Cause: The stop node applications command failed because GSD is already stopped.
// *Action: If this is the expected state then this is not an error. If it is not then GSD can be started by 'srvctl start nodeapps' command.
/
2425, VIP_RES_ALREADY_STOPPED, "VIP is already stopped on node(s): {0}"
//  *Cause: The stop node applications command failed because VIP is already stopped.
// *Action: If this is the expected state then this is not an error. If it is not then VIP can be started by 'srvctl start nodeapps' command.
/
2426, ONS_RES_ALREADY_STOPPED, "ONS is already stopped on node(s): {0}"
//  *Cause: The stop node applications command failed because ONS is already stopped.
// *Action: If this is the expected state then this is not an error. If it is not then ONS can be started by 'srvctl start nodeapps' command.
/
2427, EONS_RES_ALREADY_STOPPED, "eONS is already stopped on node(s): {0}"
//  *Cause: The stop node applications command failed because eONS is already stopped.
// *Action: If this is the expected state then this is not an error. If it is not then eONS can be started by 'srvctl start nodeapps' command.
/
2428, VIP_ALREADY_RUNNING, "VIP is running on the node {0} and cannot be modified."
//  *Cause: Modify nodeapps command failed because VIP being modified is running on a node.
// *Action: Stop the node application by issuing 'srvctl stop nodeapps' and retry the modify again.
/
2429, MISSING_MODIFY_VIP_PARAM, "-n <node_name> should be specified with -A <name|ip>/netmask[/if1[|if2]] for modifying VIP."
//  *Cause: If -n <node_name> option is specified then -A option should also be specified for modifying VIP.
// *Action: If you want to modify the VIP then use specifiy both the -n and -A options. Otherwise remove the -n <node_name> option and try command again.
/
2430, MISSING_NODE_NAME_IN_MODIFY_VIP, "-A <name|ip>/netmask[/if1[|if2] should be specified with -n <node_name> for modifying VIP."
//  *Cause: -A <options> has been specified for the modify nodeapps command without specifying which node VIP needs to be modified.
// *Action: Specify the node whose VIP needs to be modified by using -n option.
/
2431, NODEAPPS_NODE_NAME_LIST_DEPRECATED, "Warning: the -n option is obsolescent; 'srvctl remove vip' is preferred for removing per-node VIP resource"
//  *Cause: A 'srvctl remove nodeapps' command was issued with the -n option specifying one or more nodes. Support for this option will be removed in a future release, at which time you must use the preferred command 'srvctl remove vip -i <vip_list>'.
// *Action: The command is processed normally and attempts to remove VIP resources for the specified node(s). This message is displayed only to alert you to a future change. Use 'srvctl remove nodeapps' to remove all node applications from the last node of the cluster.
/
2432, VIP_ENABLED_SUCC, "VIP was enabled successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2433, NODEAPPS_SETENV_SUCC, "Successfully set environment for node applications."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2434, VIP_SETENV_SUCC, "Successfully set environment for VIP."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2435, VIP_STOP_SUCC, "Successfully stopped VIP. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2436, NODEAPPS_UNSETENV_SUCC, "Successfully unset environment for  node applications."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2437, VIP_UNSETENV_SUCC, "Successfully unset environment for VIP."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2438, NETWORK_NOT_EXIST, "Network resource does not exist."
//  *Cause: Network resource to be started/stopped/modified/enabled/disabled does not exist.
// *Action: Network resource can be created using 'srvctl add nodeapps' command.
/
2439, VIP_RES_NOT_EXIST, "VIP does not exist."
//  *Cause: VIP to be started/stopped/modified/enabled/disabled does not exist.
// *Action: VIP can be created using 'srvctl add nodeapps' command.
/
2440, NETWORK_RES_ALREADY_STOPPED, "Network resource is already stopped."
//  *Cause: The stop node applications command failed because network resource was already stopped.
// *Action: If this is the expected state then this is not an error. If it is not then network resource can be started by 'srvctl start nodeapps' command.
/
2450, SIHA_ONS_CREATION_SUCCESS, "Successfully created ONS. It was disabled after creation. ONS needs to be enabled before it can be started."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2451, SIHA_EONS_CREATION_SUCCESS, "Successfully created eONS. It was disabled after creation. eONS needs to be enabled before it can be started."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2452, SIHA_ONS_ALREADY_EXISTS, "ONS already exists"
//  *Cause: A new instance of ONS daemon could not be created, as there is an existing instance of ONS. 
// *Action: If this is the expected state then it is not an error. Use 'srvctl config ons' command to look at ONS daemon attributes and 'srvctl modify ons' command to modify ONS attributes.
/
2453, SIHA_EONS_ALREADY_EXISTS, "eONS already exists"
//  *Cause: A new instance of eONS daemon could not be created, as there is an existing instance of eONS.
// *Action: If this is the expected state then it is not an error. Use 'srvctl config eons' command to see if eONS daemon is configured. Use 'srvctl modify eons' command to modify eONS attributes.
/
2454, SIHA_ONS_ENABLED, "ONS is enabled"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2455, SIHA_ONS_DISABLED, "ONS is disabled"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2456, SIHA_ONS_RUN, "ONS daemon is running"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2457, SIHA_ONS_NOT_RUN, "ONS daemon is not running"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2458, ERR_CHK_COND_SIHA_ONS, "ONS does not exist"
//  *Cause: ONS daemon was not configured on this instance of Oracle Restart.
// *Action: Add ONS daemon using the 'srvctl add ons' command and try this command again.
/
2459, SIHA_EONS_ENABLED, "eONS is enabled"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2460, SIHA_EONS_DISABLED, "eONS is disabled"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2461, SIHA_EONS_RUN, "eONS daemon is running"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2462, SIHA_EONS_NOT_RUN, "eONS daemon is not running"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2463, ERR_CHK_COND_SIHA_EONS, "eONS does not exist"
//  *Cause: eONS daemon was not configured on this instance of Oracle Restart.
// *Action: Add eONS daemon using the command 'srvctl add eons' command and try this command again.
/
2464, SIHA_ONS_EXIST, "ONS exists. Local port {0}, remote port {1}"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2465, SIHA_ONS_NOT_EXIST, "ONS does not exist."
//  *Cause: ONS daemon was not configured on this instance of Oracle Restart.
// *Action: ONS daemon can be configured using the 'srvctl add ons' command.
/
2566, SIHA_EONS_EXIST, "eONS daemon exists. Multicast port {0}, multicast IP address {1}, listening port {2}"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2567, SIHA_EONS_NOT_EXIST, "eONS daemon does not exist."
//  *Cause: eONS daemon was not configured on this instance of Oracle Restart.
// *Action: eONS daemon can be configured using the 'srvctl add eons' command.
/
2568, SIHA_ONS_STARTED, "Successfully started ONS daemon."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2569, SIHA_ONS_RES_ALREADY_STARTED, "ONS is already started."
//  *Cause: The 'srvctl start ons' command failed because the ONS daemon was already started.
// *Action: If this is the expected state then this is not an error. If it is not then ONS can be stopped by 'srvctl stop ons' command.
/
2570, SIHA_EONS_STARTED, "Successfully started eONS daemon."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2571, SIHA_EONS_RES_ALREADY_STARTED, "eONS is already started."
//  *Cause: The 'srvctl start eons' command failed because the eONS daemon was already started.
// *Action: If this is the expected state then this is not an error. If it is not then eONS can be stopped by 'srvctl stop eons' command.
/
2572, SIHA_ONS_STOPPED, "Successfully stopped ONS daemon."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2573, SIHA_ONS_RES_ALREADY_STOPPED, "ONS daemon is already stopped."
//  *Cause: The 'srvctl stop ons' command failed because the ONS daemon was already stopped.
// *Action: If this is the expected state then this is not an error. If it is not then ONS can be started by 'srvctl start ons' command.
/
2574, SIHA_EONS_STOPPED, "Successfully stopped eONS daemon."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2575, SIHA_EONS_RES_ALREADY_STOPPED, "eONS daemon is already stopped."
//  *Cause: The 'srvctl stop eons' command failed because the eONS daemon was already stopped.
// *Action: If this is the expected state then this is not an error. If it is not then eONS can be started by 'srvctl start eons' command.
/
2576, SIHA_ONS_RES_ALREADY_ENABLED, "ONS is already enabled."
//  *Cause: The 'srvctl enable ons' command failed because the ONS was already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then ONS can be disabled by 'srvctl disable ons' command.
/
2577, SIHA_ONS_RES_ENABLED_SUCC, "Successfully enabled ONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2578, SIHA_EONS_RES_ENABLED_SUCC, "Successfully enabled eONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2579, SIHA_EONS_RES_ALREADY_ENABLED, "eONS is already enabled."
//  *Cause: The 'srvctl enable eons' command failed because the eONS was already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then eONS can be disabled by 'srvctl disable eons' command.
/
2580, SIHA_ONS_RES_DISABLED_SUCC, "Successfully disabled ONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2581, SIHA_ONS_RES_ALREADY_DISABLED, "ONS is already disabled."
//  *Cause: The 'srvctl disable ons' command failed because the ONS was already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then ONS can be enabled by 'srvctl enable ons' command.
/
2582, SIHA_EONS_RES_DISABLED_SUCC, "Successfully disabled eONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2583, SIHA_EONS_RES_ALREADY_DISABLED, "eONS is already disabled."
//  *Cause: The 'srvctl disable eons' command failed because the eONS was already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then eONS can be enabled by 'srvctl enable eons' command.
/
2584, SIHA_ONS_MODIFY_SUCCESS, "Successfully modified ONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2585, SIHA_EONS_MODIFY_SUCCESS, "Successfully modified eONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2586, SIHA_ONS_REMOVED, "Successfully removed ONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2587, SIHA_EONS_REMOVED, "Successfully removed eONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2588, SIHA_ONS_ALREADY_RUNNING, "ONS daemon could not be removed because it is still running."
//  *Cause: 'srvctl remove ons' command failed because ONS daemon was still running.
// *Action: Stop the ons daemon by using 'srvctl stop ons' command and then attempt to remove it. You can also use the force option to remove a running ons daemon.
/
2589, SIHA_EONS_ALREADY_RUNNING, "eONS daemon could not be removed because it is still running."
//  *Cause: 'srvctl remove eons' command failed because eONS daemon was still running.
// *Action: Stop the ons daemon by using 'srvctl stop eons' command and then attempt to remove it. You can also use the force option to remove a running eons daemon.
/
2590, SIHA_ONS_NOTHING_MODIFIED, "None of the ONS daemon parameters were modified."
//  *Cause: The configuration of the ONS daemon has remained the same after the 'srvctl modify ons' command.
// *Action: Make sure that at least one of the optional modification parameters was specified on the command line. The current values of parameters of the ONS daemon can be found by using 'srvctl config ons' command. Specify at least one value different then current value while issuing the 'srvctl modify ons' command.
/
2591, SIHA_EONS_NOTHING_MODIFIED, "None of the eONS daemon parameters were modified."
//  *Cause: The configuration of the eONS daemon has remained the same after the 'srvctl modify eons' command.
// *Action: Make sure that at least one of the optional modification parameters was specified on the command line. The current values of parameters of the eONS daemon can be found by using 'srvctl config eons' command. Specify at least one value different then current value while issuing the 'srvctl modify eons' command.
/ 
2592, GNS_CONFIG_SUCCESS, "GNS was configured successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2593, GNS_ENABLE_FAILED, "enable of GNS failed."
//  *Cause: Enabling the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2594, GNS_MODIFY_SUCCESS, "GNS was modified successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2595, GNS_MODIFY_FAILED, "modify of GNS failed."
//  *Cause: Modification the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2596, GNS_DISABLE_SUCCESS, "GNS disabled successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2597, GNS_DISABLE_FAILED, "disable of GNS failed."
//  *Cause: Disabling the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2598, GNS_RELOCATE_SUCCESS, "GNS was relocated successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2599, GNS_RELOCATE_FAILED, "relocation of GNS failed."
//  *Cause: Relocation of the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2600, GNS_REMOVE_SUCCESS, "GNS was removed successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2601, GNS_REMOVE_FAILED, "removal of GNS failed."
//  *Cause: Removal of the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2602, GNS_ADD_SUCCESS, "GNS was successfully added."
// *Document: NO
//  *Cause:
// *Action:
/
2603, GNS_ADD_FAILED, "addition of GNS failed."
//  *Cause: The addition of the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2604, GNS_ALREADY_EXISTS, "GNS is already running"
//  *Cause: The GNS server is already running.
// *Action: Remove the GNS server first before trying to add it.
/
2605, GNS_DOMAIN_SERVED, "Domain served by GNS: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2606, GNS_BRIDGE_PORT, "GNS is listening for DNS server requests on port {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2607, GNS_STATUS, "GNS status: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2608, GNS_VERSION, "GNS version: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2609, GNS_VIP_NETWORK, "GNS VIP network: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2610, GNS_MULTICAST_PORT, "GNS is using port {0} to connect to mDNS"
// *Document: NO
//  *Cause:
// *Action:
/
2611, GNS_VIP_NOT_EXIST, "GNS VIP does not exist. Specify the {0} option to create one."
// *Cause:  The attempt to add GNS failed because the VIP associated with it does not exist.
// *Action: Create the VIP.
/
2612, ASM_ENABLED_NODES, "ASM is enabled on nodes: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2613, ASM_DISABLED_NODES, "ASM is disabled on nodes: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2614, GNS_NAME_RESOLVED, "The name {0} resolves to the following addresses: {1}"
// *Document: NO
//  *Cause:
// *Action:
/
3001, DB_UNIQUE_NAME, "Database unique name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3002, DB_NAME, "Database name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3003, ORACLE_HOME, "Oracle home: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3004, ORACLE_USER, "Oracle user: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3005, SPFILE, "Spfile: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3006, DOMAIN, "Domain: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3007, DB_ROLE, "Database role: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3008, START_OPTIONS, "Start options: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3009, STOP_OPTIONS, "Stop options: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3010, MGMT_POLICY, "Management policy: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3011, SERVERPOOLS, "Server pools: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3012, DB_INSTANCES, "Database instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3013, DISKGROUPS, "Disk Groups: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3014, SERVICES, "Services: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3015, DB_ENABLED, "Database is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3016, DB_DISABLED, "Database is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3017, DB_RUNNING, "Database is running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3018, DB_NOT_RUNNING, "Database is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3019, DB_RUN_WITH_SERV, "Database {0} is running with online services {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3020, DB_NOT_RUNNING_ON_NODE, "Database {0} is not running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3021, DB_EXISTS, "Database exists."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3023, DB_CENTRIC, "Database is administrator managed"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3024, SERVICE_CENTRIC, "Database is policy managed"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3025, PROMPT_REMOVE_DB_INST, "Remove instance from the database {0}?"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3026, ERR_INST_I_OPTION, "Only one instance can be listed in -i <inst_name_list> when -n option is specified"
//  *Cause: More than one instance was specified for -i option when both -i and -n options were used.
// *Action: Supply one instance name for -i option when using both -i and -n option.
/
3027, DB_INST_DISABLED, "Instance {0} is disabled on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3028, DB_INST_RUN_WITH_SERV, "Database instance {0} is running with online services {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3029, DB_INST_RUNNING, "Database instance {0} is running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3030, DB_INST_NOT_RUNNING, "Database instance {0} is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3031, SRVPOOL_EXISTS, "Server pool {0} already exists"
//  *Cause: Command 'srvctl add serverpool' failed because the given server pool already exists.
// *Action: Make sure that the name of server pool is correct and a server pool with the given name doesn't exist.
/
3032, INVALID_DB_INST_NAMES, "Invalid instance name(s): {0}"
//  *Cause: Some of the supplied instance names do not exist in the database configuration.
// *Action: Please supply valid instance names and retry.
/
3033, VIP_ENABLED, "VIP {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3034, NETWORK_ENABLED, "Network is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3035, ONS_ENABLED, "ONS is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3036, EONS_ENABLED, "eONS is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3037, GSD_ENABLED, "GSD is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3038, VIP_DISABLED, "VIP {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3039, NETWORK_DISABLED, "Network is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3040, ONS_DISABLED, "ONS is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3041, EONS_DISABLED, "eONS is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3042, GSD_DISABLED, "GSD is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3043, LSNR_CONFIG_NAME, "Name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3044, LSNR_CONFIG_NETWORK_AND_OWNER, "Network: {0}, Owner: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3045, LSNR_CONFIG_ORACLE_HOME, "Home: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3046, LSNR_CONFIG_ENDPOINTS, "End points: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3047, LSNR_ENABLED_ON_NODE, "Listener {0} is enabled on node(s): {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3048, LSNR_DISABLED_ON_NODE, "Listener {0} is disabled on node(s): {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3049, LSNR_RUN_ON_NODE, "Listener {0} is running on node(s): {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3050, LSNR_NOT_RUN_ON_NODE, "Listener {0} is not running on node(s): {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3051, SRV_CFG_NAME, "Service name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3052, SRV_CFG_DISABLE, "Service is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3053, SRV_CFG_ENABLE, "Service is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3054, SRV_CFG_SG, "Server pool: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3055, SRV_CFG_CARD, "Cardinality: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3057, SRV_CFG_NETWORK, "Network: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3058, SRV_CFG_DISC_YES, "Disconnect: true"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3059, SRV_CFG_DISC_NO, "Disconnect: false"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3060, SRV_CFG_ROLE, "Service role: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3061, SRV_CFG_M_POLICY, "Management policy: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3062, SRV_CFG_DTP_YES, "DTP transaction: true"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3063, SRV_CFG_DTP_NO, "DTP transaction: false"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3064, SRV_CFG_AQHA_YES, "AQ HA notifications: true"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3065, SRV_CFG_AQHA_NO, "AQ HA notifications: false"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3066, SRV_CFG_FTYPE, "Failover type: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3067, SRV_CFG_FMETHOD, "Failover method: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3068, SRV_CFG_FRETR, "TAF failover retries: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3069, SRV_CFG_FDELAY, "TAF failover delay: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3070, SRV_CFG_CLB_GOAL, "Connection Load Balancing Goal: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3071, SRV_CFG_RLB_GOAL, "Runtime Load Balancing Goal: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3072, SRV_CFG_TAF_POLICY, "TAF policy specification: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3073, SRV_CFG_ENABLED_ON, "Service is enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3074, SRV_CFG_DISABLED_ON, "Service is disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3075, DB_INST_CANNOT_ENABLED, "Dummy message line"
//  *Document: No
//  *Cause: Dummy message line
// *Action: Not an error
/
3076, DB_INST_CANNOT_DISABLED, "Dummy message line"
//  *Document: No
//  *Cause: Dummy message line
// *Action: Not an error
/
3077, DB_REMOVE_FAIL, "Failed to remove database {0}: "
//  *Cause: Failed to remove the database.
// *Action: Examine the accompanying message(s) for details of the error, and respond accordingly.
/
3078, DB_REMOVE_SUCC, "Successfully removed database and its dependent services."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3079, DB_REMOVE_SG_FAIL, "Server pool {0} which is used to manage database {1} is not removed successfully: "
//  *Cause: 
// *Action: 
/
3080, DB_REMOVE_SG_SUCC, "Successfully removed server pool {0} which is used to manage database {1}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3081, ENV_NOT_EXIST, "No such environment variable setting: {0}"
//  *Cause: The environment variable(s) does not exist for the specified resource. 
// *Action: Supply a valid environment variable.
/
3082, DB_IS_RUNNING, "Database {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3083, SERV_IS_RUNNING, "Service {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3084, LSNR_IS_RUNNING, "Listener {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3085, LABEL_VOL_DEVICE, "Volume device: {0}"
//  *Cause: Volume device label
// *Action: None.
/
3086, LABEL_MOUNTPOINT, "Mountpoint path: {0}"
//  *Cause: Mountpoint path label
// *Action: None.
/
3087, LABEL_USER, "User: {0}"
//  *Cause: User label
// *Action: None.
/
3088, ACFS_ENABLED, "ACFS file system is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3089, ACFS_DISABLED, "ACFS file system is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3090, ACFS_RUNNING, "ACFS file system is running on {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3091, ACFS_NOT_RUNNING, "ACFS file system is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3092, DISKGROUP_RUNNING_ON_NODE, "Disk Group {0} is running on {1}"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3093, DISKGROUP_NOT_RUNNING_ON_NODE, "Disk Group {0} is not running on {1}"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3094, DISKGROUP_NOT_RUNNING, "Disk Group {0} is not running"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3095, DISKGROUP_ENABLED, "Disk Group {0} is enabled"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3096, DISKGROUP_ENABLED_ON_NODE, "Disk Group {0} is enabled on {1}"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3097, DISKGROUP_DISABLED, "Disk Group {0} is disabled"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3098, DISKGROUP_DISABLED_ON_NODE, "Disk Group {0} is disabled on {1}"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3099, GNS_ENABLED, "GNS is enabled."
// *Document: NO
//  *Cause: 
// *Action: 
/
3100, GNS_DISABLED, "GNS is disabled."
// *Document: NO
//  *Cause: 
// *Action: 
/
3101, PROMPT_REMOVE_GNS, "Remove GNS?"
// *Document: NO
//  *Cause: 
// *Action: 
/
3102, PROMPT_REMOVE_GNS_NO, " GNS removal canceled."
// *Document: NO
//  *Cause: 
// *Action: 
/
3103, available_for_message, "XXXX"
// *Document: NO
//  *Cause: 
// *Action: 
/
3104, GNS_IS_NOT_RUNNING, "GNS is not running."
// *Document: NO
//  *Cause: 
// *Action: 
/
3105, GNS_ENABLED_ON_NODE, "GNS is enabled on node {0}."
// *Document: NO
//  *Cause: 
// *Action: 
/
3106, GNS_DISABLED_ON_NODE, "GNS is disabled on node {0}."
// *Document: NO
//  *Cause: 
// *Action: 
/
3107, GNS_IS_RUNNING_ON_NODE, "GNS is running on node {0}."
// *Document: NO
//  *Cause: 
// *Action: 
/
3108, GNS_IS_NOT_RUNNING_ON_NODE, "GNS is not running on node {0}."
// *Document: NO
//  *Cause: 
// *Action: 
/
3109, SRV_CFG_ENABLED_ON_INST, "Service is enabled on instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3110, SRV_CFG_DISABLED_ON_INST, "Service is disabled on instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3111, SERV_RUN_NODES, "Service {0} is running on nodes: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3112, SERV_RUN_SIHA, "Service {0} is running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3113, ADMIN_MANAGED_DB_POLICY_MANAGED_SERVICE, "Administrator-managed database {1} can not support policy-managed service {0}."
//  *Cause: The specified database does not support policy-managed services.
// *Action: Provide a database which supports policy-managed services.
/
3114, POLICY_MANAGED_DB_ADMIN_MANAGED_SERVICE, "Policy-managed database {1} can not support administrator-managed service {0}."
//  *Cause: The specified database does not support administrator-managed services.
// *Action: Provide a database which supports administrator-managed services.
/
3115, POLICY_MANAGED_SERVICE_P_OPT, "-P option cannot be used with policy-managed service {0}."
//  *Cause: -P option cannot be used with policy-managed services.
// *Action: Remove -P option from a command line.
/
3116, SERVICE_NO_R_G, "'-g' or '-r' option should be provided"
//   *Cause: one of specified options should be provided.
//   *Action: make sure that one of specified options is incuded into the command line.
/
3117, SERVICE_EXISTS, "Service {0} already exists in database {1}"
//   *Cause: The service being added already exists.
//   *Action: If the service needs to be modified use 'srvctl modify service' command.
/
3118, SERVICE_CHECK_FAILED, "Failed to check if service {0} exists: {1}"
//   *Cause: Failed to get the servcie data.
//   *Action: Make sure that Oracle Clusterware is active.
/
3119, DB_START_NO_CONFIG_INST, "Database {0} cannot be started since it has no configured instances."
//  *Cause: The specified database is an administrator-managed database and it cannot be started because no instances were configured.
// *Action: Use srvctl add instance command to configure the instance and then retry.
/
3120, DB_STOP_NO_CONFIG_INST, "Database {0} cannot be stopped since it has no configured instances."
//  *Cause: The specified database is an administrator-managed database and it could not be stopped because no instances were configured.
// *Action: Use srvctl add instance command to configure the instance and then retry.
/
3121, ADMIN_DB_START_INST_NO_OPT, "-i option or -n option is required for starting an instance on the administrator-managed database {0}."
//  *Cause: The specified database is an administrator-managed database and the srvctl start instance command requires the instance name or nodename to be specified.
// *Action: Use srvctl start instance command with either the -i or -n option to start the instance.
/
3122, DB_STOP_INST_NO_OPT, "-i option or -n option is required for stopping an instance of database {0}"
//  *Cause: Neither the instance name nor the nodename was provided during 'srvctl stop instance' command invocation.
// *Action: Use 'srvctl stop instance' command with either the -i or -n option to specify which instance to stop.
/
3123, SRV_CFG_PREF_INSTS, "Preferred instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3124, SRV_CFG_AVAIL_INSTS, "Available instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3125, INVALID_VALUE_4_OPTION, "Invalid value {0} for command line option {1}"
//  *Cause: Invalid value was specified for the command line option.
// *Action: Check the value printed and specify the correct value.
/
3126, GNS_INVALID_LOG_LEVEL, "Invalid GNS logging level: \"{0}\""
//  *Cause: The level of logging specified was not a positive integer.
// *Action: Specify a positive integer.
/
3127, LSNR_CONFIG_ORACLE_HOME_ON_NODE, "  {0} on node(s) {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3128, ADD_DB_DG_NOT_EXIST, "Unable to add database because the resource for diskgroup {0} could not be found. {1}"
//  *Cause: The resource for the specified disk group could not be found. Either the diskgroup name was misspelled or the diskgroup has not been mounted.
// *Action: Correct the diskgroup spelling or use sqlplus to create the diskgroup.
/
3129, MODIFY_DB_DG_NOT_EXIST, "Unable to modify database because the resource for diskgroup {0} could not be found. {1}"
//  *Cause: The resource for the specified disk group could not be found. Either the diskgroup name was misspelled or the diskgroup has not been mounted.
// *Action: Correct the diskgroup spelling or use sqlplus to create the diskgroup.
/
3130, CANNOT_MODIFY_ADMIN_MNGD_SP, "Server pool {0} is internally managed as part of administrator-managed database configuration and therefore cannot be modified directly via srvpool object." 
//  *Cause: An attempt was made to alter configuration of an internally managed server pool that is hosting an administrator-managed configuration. 
// *Action: Do not modify this server pool via srvpool object directly. Instead use srvctl add/remove instance or srvctl modify database/service to alter this server pool's configuration.
/
3131, ASM_DISKSTRING, "ASM diskgroup discovery string: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3132, DB_STATUS_INST_NO_OPT, "-i option or -n option is required for checking the status of an instance of database {0}"
//  *Cause: Neither the instance name nor the nodename was provided during 'srvctl status instance' command invocation.
// *Action: Use 'srvctl status instance' command with either the -i or -n option to check the status of the instance.
/
3133, INVALID_NODE_FOR_DB_INST, "Database {0} has no instance on node {1}"
//  *Cause: Instance was not configured on the specified node.
// *Action: Both 'srvctl add instance' or 'srvctl modify instance' command can also be used to change inst-node mapping in administrator-managed db's. For policy-managed database, use either 'srvctl start instance' command with -n option to start the instance on the specified node or use 'srvctl modify instance' command to configure an instance for that node.
/
3134, DB_MODIFY_INST_NO_OPT, "-n option cannot be specified in conjunction with -z option"
//  *Cause: -n and -z options were both provided during 'srvctl modify instance' command invocation.
// *Action: Use 'srvctl modify instance' command with either the -n or -z option to modify the node instance mapping of the database instance.
/
3135, DB_MOD_INST_Z_OPT, "-z option cannot be used with admin managed database {0}"
//  *Cause: -z option cannot be used to remove node instance mapping of admin managed database.
// *Action: Use 'srvctl remove instance' command to remove node instance mapping of admin managed database.
/
3136, DB_MOD_SERV_C_OPT, "Option '-c' cannot be used with admin managed service {0}"
//  *Cause: -c option cannot be used with admin managed services.
// *Action: Reissue the command without the -c option.
/
3137, POLICY_MANAGED_SERVICE_PRE_OPT, "'-P PRECONNECT' option cannot be used with policy-managed service {0}."
//  *Cause: '-P PRECONNECT' option cannot be used with policy-managed services.
// *Action: Remove -P option from a command line.
3138, SERV_NODE_NOT_IN_POOL, "Node {0} does not belong to server pool {1} which defines nodes for service {2}"
//  *Cause: Node doesn't belong to the server pool which defines nodes which can be used to run the specified service.
// *Action: Supply a node  which belongs to specified server pool.
/
3139, SERV_RELOC_OPT_IT, "Options '-i' and '-t' cannot be used with policy-managed service {0}"
//  *Cause: -i and -t options cannot be used to relocate a policy-managed service.
// *Action: Use options -c and -n to relocate a service.
/
3140, SERV_RELOC_OPT_CN, "Options '-c' and '-n' cannot be used with admin managed service {0}"
//  *Cause: -c and -n options cannot be used to relocate a admin managed service.
// *Action: Use options -i and -t to relocate a service.
/
3141, DB_REMOVE_RUNNING_DB, "Database {0} could not be removed because it was running"
//  *Cause: A 'srvctl remove database' command failed because the database was running.
// *Action: Stop the database by using 'srvctl stop database' command and then attempt to remove it. You can also use the force option to remove the running database.
/
3142, SERV_EN_DIS_OPT_I, "Option '-i' cannot be used to enable/disable services for policy-managed database {0}"
//  *Cause: Policy-managed database services can only be enabled or disabled by node, not by instance.
// *Action: Use option -n <node> to specify nodes on which to enable or disable services for this policy-managed database.
/
3143, SERV_MOD_ITRNA_OPTIONS, "Options '-i', '-t', '-r', '-n' and '-a' cannot be used to modify policy-managed service {0}"
//  *Cause: Options -i, -t, -r, -n and -a can be used to modify administrator-managed service only.
// *Action: Make sure that the service you are going to modify is an administrator-managed service.
/
3144, SERV_MOD_A_OPT, "Option '-a' requires options '-n' and '-i' to be provided"
//  *Cause: Option -a can not be used without options -n and -i.
//  *Action: Make sure that options -n, -i and -a are provided according to 'srvctl modify service' syntax.
/
3145, SERV_MOD_I_OPT, "Option '-i' requires one of the options '-t', '-r' or '-n' to be set"
//  *Cause: Option -i can not be used without additional options.
// *Action: Make sure that required option is provided according to 'srvctl modify service' syntax.
/
3146, SERV_MOD_I_OPT_MISSED, "Option '-i' is not provided"
//  *Cause: Options -t,-r, and -n requires option -i to be set.
// *Action: Make sure that required option is provided according to 'srvctl modify service' syntax.
/
3147, REMOVE_PREF_INSTANCE, "Instance {0} cannot be removed because it is the only preferred instance for service(s) {1} for database {2}"
//   *Cause: An attempt was made to remove the instance which is the only preferred instance for specified services.
//  *Action: Make sure that specified services have more than one preferred instance or modify services to not have the instance as a preferred instance.
/
3148, TARGET_INST_FOR_SERV_AR, "Instance {0} does not support service {1}."
//  *Cause: The given database instance is not defined as a preferred or available instance for the given service.
// *Action: Specify an instance that is defined as preferred or available instance for the given service.
/
3149, ADD_SIDB_SERVER_MISMATCH, "The candidate server {0} of server pool {1} is different from the server {2} specified with the '-x' option"
//   *Cause: Specified server must be the candidate server of the specified server pool.
//  *Action: Make sure that the server specified with '-x' option is the same as the candidate server of the given server pool.
/
3150, DB_ADD_SG_OPT, "The server pool(s) {0} specified with the '-g' cannot be used to add an administrator-managed database"
//  *Cause: A request to add an administrator-managed database specified the -g option.
// *Action: Use 'srvctl add database' without the '-g' option to add an administrator-managed database.
/
3151, DB_CONVERT_SG_OPT, "Option '-g' cannot have more than one specified server pool when converting an administrator-managed database to a policy-managed database"
//  *Cause: An attempt was made to convert an administrator-managed database to a policy-managed database by specifying more than one server pool.
// *Action: Make sure to specify only one server pool with the '-g' option when converting an administrator-managed database to a policy-managed database.
/
3152, DB_MODIFY_SG_OPT, "The server pool(s) {0} specified with the '-g' option are subpools of Generic and therefore cannot be used to modify the server pool value of a policy-managed database"
//  *Cause: The supplied server pools are meant for managing administrator-managed databases because they are subpools of Generic.
// *Action: Make sure that none of the supplied server pools are meant for managing administrator-managed database. Only supply server pools meant for managing policy-managed databases to the -g option of 'srvctl modify database' command. Use 'srvctl config srvpool' command to list the qualified server pools meant for managing policy managed databases. 
/
3153, POLICY_DB_START_INST_NO_OPT, "-i option and/or -n option is required for starting an instance on the policy-managed database {0}."
//  *Cause: The specified database is a policy-managed database and the 'srvctl start instance' command requires the instance name and/or nodename to be specified.
// *Action: Use 'srvctl start instance' command with either the -i or -n option or both -i and -n options to start the instance.
/
3154, ADMIN_DB_START_INST_BOTH_OPT, "Both -i and -n options are specified for starting an instance on the administrator-managed database {0}."
//  *Cause: The specified database is an administrator-managed database and the 'srvctl start instance' command requires either the instance name or nodename to be specified but not both.
// *Action: Use 'srvctl start instance' command with either the -i or -n option to start the instance.
/
3155, POLICY_DB_FAILED_START_INST_ON_NODE, "Can not start the instance {0} on the specified node {1} because the node is assigned to another user configured instance {2}"
//  *Cause: The database specified on 'srvctl start instance' is policy managed and has another instance already configured on the nodename specified with the -n option.
// *Action: Either reformulate the 'srvctl start instance' command so that there is no conflict with configured instances' nodes, or use 'srvctl modify instance' to change configured instances' nodes.
/
3156, DEFINE_SERVER_NAME, "Server name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3157, DEFINE_SERVER_STATE, "Server state: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3158, DEFINE_SERVER_ACTIVE_IN_POOLS, "Server active pools: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3159, DEFINE_SERVER_STATE_DETAILS, "Server state details: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3160, CANNOT_STAT_ADMIN_MNGD_SP, "Server pool {0} is internally managed as part of administrator-managed database configuration and therefore cannot be queried directly via srvpool object." 
//  *Cause: An attempt was made to query configuration of an internally managed server pool that is hosting an administrator-managed configuration. 
// *Action: Do not query this server pool via srvpool object directly. Instead use srvctl config/status database/service command to query servers that are part of this pool's configuration.
/
3161, CANNOT_REMOVE_ADMIN_MNGD_SP, "Server pool {0} is internally managed as part of administrator-managed database configuration and therefore cannot be removed directly via srvpool object." 
//  *Cause: An attempt was made to remove configuration of an internally managed server pool that is hosting an administrator-managed configuration. 
// *Action: Do not remove this server pool via srvpool object directly. Instead use srvctl remove service/database command to remove this server pool and any service/database hosted by the server pool.
/
3162, UNSUPPORTED_ACTION_FOR_SCANLSNR, "The actions setenv, getenv, and unsetenv are not suppported for Single Client Access Name listener {0}"
//  *Cause: Failed to use srvctl setenv, getenv, and unsetenv listener command for specified Single Client Access Name Listener. The environment variables for Single Client Access Name Listener cannot be changed.
// *Action: Do not set, get, and unset environment variables for Single Client Access Name Listener.
/
9004, EMPTY_STAGE_LIST, "Dummy message. Not used"
//  *Document: No
//  *Cause:
// *Action:
/
9013, SUCC_ADD_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9015, SUCC_REMOVE_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action:   
/
9016, ERR_RENAME_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9017, SUCC_RENAME_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9019, SUCC_MOVE_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9021, SUCC_SET_ENV, "Env successfully set: "
//  *Cause: 
// *Action: 
/
9023, SUCC_UNSET_ENV, "Env successfully unset: "
//  *Cause: 
// *Action: 
/
9025, INVALID_STAGENAME, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9026, DUPLICATE_STAGENAME, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9029, INST_ALREADY_RUN, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9031, INST_SHTDWN_FAIL, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9033, INST_SHTDWN_SUCC, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9035, INST_ALREADY_STOP, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9037, INST_START_FAIL, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9039, INST_START_SUCC, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9040, LSNR_START_SUCC, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9052, NULL_VAL_OPTION, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9053, GET_LOCAL_ENV, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9054, ERR_CREATE_OPS, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9055, ERR_DELETE_OPS, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9056, SUCC_ADD_OPS, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9057, SUCC_DEL_OPS, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9058, INVALID_DBGLVL, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9059, LISTENER_INVALID_OPTION_COMBINATION, "Invalid command line options for listener. '-a' can not be specified with '-l'."
//  *Cause: Invalid combination of options specified for listener command. 
// *Action: Issue the command using either '-l <listener_name>' or '-a'.
/
9060, POLICY_DB_START_INST_BOTH_OPT, "Dummy message line"
//  *Document: No
//  *Cause: Dummy message line
// *Action: Not an error
/
_053, DEFINE_VERSION, "    -V                       Show version"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_054, DEFINE_HELP, "    -h                       Print usage"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_055, DEFINE_DB, "    -d <db_unique_name>      Unique name for the database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_056, DEFINE_INST, "    -i \"<inst,...>\"          Comma separated instance names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_057, DEFINE_INST_SINGLE, "    -i <inst>                Instance name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_058, DEFINE_INST_OLD, "    -i <old_inst>            Old instance name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_059, DEFINE_INST_NEW, "    -t <new_inst>            New instance name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_060, DEFINE_SERV, "    -s \"<serv,...>\"        Comma separated service names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_061, DEFINE_SERV_SINGLE, "    -s <service>             Service name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_062, DEFINE_NODE, "    -n <node_name>           Node name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_063, DEFINE_START_OPTIONS, "    -o <start_options>       Options to startup command (e.g. open, mount, or nomount)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_064, DEFINE_STOP_OPTIONS, "    -o <stop_options>        Options to shutdown command (e.g. normal, transactional, immediate, or abort)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_065, DEFINE_EONS_LOCAL_PORT, "    -e <eons-listen-port>     Local listen port for eONS daemon (Default port number is 2016)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_066, DEFINE_FORCE_STAT, "    -f                       Include disabled applications"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_067, DEFINE_FORCE_REMOVE, "    -f                       Force remove"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_068, DEFINE_VERBOSE, "    -v                       Verbose output"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_069, DEFINE_ORACLE_HOME, "    -o <oracle_home>         ORACLE_HOME path"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_070, DEFINE_DOMAIN, "    -m <domain>              Domain for database. Must be set if database has DB_DOMAIN set."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_071, DEFINE_SPFILE, "    -p <spfile>              Server parameter file path"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_073, DEFINE_ADDR_NODE, "    -A <addr_str>            Node level Virtual IP address"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_075, DEFINE_PREF_LIST, "    -r \"<preferred_list>\"    Comma separated list of preferred instances"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_076, DEFINE_AVAIL_LIST, "    -a \"<available_list>\"    Comma separated list of available instances"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_078, DEFINE_ENV_NAMEVAL, "    -t \"<name>=<val>,..\"   Names and values of environment variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_079, DEFINE_ENV_NAMES, "    -t \"<name_list>\"       Names of environment variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_081, DEFINE_VIP, "    -a                       Display VIP configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_082, DEFINE_GSD, "    -g                       Display GSD configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_083, DEFINE_AGENT, "    -o                       Display EM agent configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_086, DEFINE_DBNAME, "    -n <db_name>        Database name (DB_NAME), if different from the unique name given by the -d option"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_087, DEFINE_DBROLE, "    -r <role>                Role of the database (primary, physical_standby, logical_standby, snapshot_standby)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_088, DEFINE_STARTOPTIONS, "    -s <start_options>       Startup options for the database. Examples of startup options are open, mount, or nomount."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_090, DEFINE_SERV_MEMBER_UPGRADE, "    -r                       Upgrade instance to preferred"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_091, DEFINE_SERV_U, "    -u                       Add a new instance to service configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_092, DEFINE_PREF_SINGLE, "    -r <new_pref_inst>       Name of new preferred instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_093, DEFINE_AVAIL_SINGLE, "    -a <new_avail_inst>      Name of new available instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_095, DEFINE_ONS, "    -s                       Display ONS daemon configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_096, DEFINE_ENV_NAMEVAL_S, "    -T \"<name>=<val>\"      Name and value of a single environment variable"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_097, DEFINE_STOP_SERV_DISC, "    -f                       Disconnect all sessions during stop or relocate service operations"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_098, DEFINE_INST_ASM, "    -i <asm_inst_name>       ASM instance name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_099, DEFINE_MOD_ASM_ADD, "    -s <asm_inst_name>       Create dependency on ASM instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_100, DEFINE_MOD_ASM_RM, "    -r                       Remove dependency on ASM instances"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_101, DEFINE_NODES, "    -n \"<node_list>\"         Comma separated node names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_102, DEFINE_GEN_MOD_SERV, "    -n                       Modify service configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_103, DEFINE_LSNR, "    -l \"<lsnr_list>\"            Comma separated listener names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_104, DEFINE_DBPOLICY, "    -y <dbpolicy>            Management policy for the database (AUTOMATIC or MANUAL)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_105, DEFINE_VIP_RELOCATE, "    -r                       Relocate VIP"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_106, DEFINE_PREF_INST_LIST, "    -i \"<preferred_list>\"    Comma separated list of preferred instances"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_107, DEFINE_SCAN_NAME, "    -n <scan_name>           Domain name qualified SCAN name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_114, DEFINE_SCAN_NODE_NAME, "    -n <node_name>           SCAN VIP node name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_115, DEFINE_SCAN_PORT, "    -p [TCP:]<port>[/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>] [/SDP:<port>]           SCAN Listener endpoints"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_116, DEFINE_SCAN_LSNR_NAME_PREFIX, "    -l <lsnr_prefix>         SCAN listener name prefix"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_121, DEFINE_SERV_CARDNL, "    -c {UNIFORM | SINGLETON} Service runs on every active server in the server pool hosting this service (UNIFORM) or just one server (SINGLETON)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_122, DEFINE_SERV_POLICY, "    -P {NONE | BASIC | PRECONNECT}        TAF policy specification"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_128, DEFINE_SRVR_NAME_STATE, "NAME={0} STATE={1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_129, DEFINE_SRVPOOL_GROUP_NAME, "    -g <pool_name>           Server pool name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_130, DEFINE_SRVPOOL_IMPORTANCE, "    -i <importance>          Importance of the server pool"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_131, DEFINE_SRVPOOL_MIN_CRDNL, "    -l <min>                 Minimum size of the server pool"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_132, DEFINE_SRVPOOL_MAX_CRDNL, "    -u <max>                 Maximum size of the server pool, -1 for unlimited maximum size"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_133, DEFINE_SRVPOOL_SRV_LIST, "    -n \"<server_list>\"       Comma separated list of candidate server names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_134, DEFINE_DETAIL_STATUS_INFO, "    -a                       Print detailed status information"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_136, DEFINE_SCAN_LSNR_NAME, "    -l <SCAN lsnr_name>      SCAN listener name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_138, DEFINE_FORCE_STOP, "    -f                       Force stop"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_139, DEFINE_LSNR_NAME, "    -l <lsnr_name>           Listener name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_140, DEFINE_FORCE_RELOCATE, "    -f                       Force relocation"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_141, DEFINE_LSNR_PORT_LIST, "    -p \"[TCP:]<port>[, ...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>] [/SDP:<port>]\"       Comma separated tcp ports or listener endpoints"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_143, DEFINE_DETAIL_INFO, "    -a                       Print detailed configuration information"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_145, DEFINE_VIP_NET_NUM, "    -k <net_num>             VIP network number (default number is 1)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_146, DEFINE_EONS, "    -e                       Display eONS daemon configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_147, DEFINE_VIP_ENV, "    -a                       Display VIP env variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_148, DEFINE_GSD_ENV, "    -g                       Display GSD env variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_149, DEFINE_ONS_ENV, "    -s                       Display ONS env variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_150, DEFINE_EONS_ENV, "    -e                       Display eONS env variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_151, DEFINE_SCAN_ORD_NUMBER, "    -i <scan_ordinal_number> Ordinal number of IP address"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_152, DEFINE_VIP_ADDRESS_SPEC, "    -A <vip_name|ip>/<netmask>/[if1[|if2...]]  VIP address spec for node applications"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_153, DEFINE_INITPARAM_NAMEVAL, "    -m \"<name>=<val>,..\"     Names and values of initialization parameters"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_154, DEFINE_MOD_ASM_INST_RM, "    -r                       Remove ASM instance names and use default instance names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_155, DEFINE_ORACLE_USER, "    -u <oracle_user>         Oracle user"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_156, DEFINE_VIP_NAME, "    -i <vip_name>            VIP name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_157, DEFINE_VIP_NAMES, "    -i \"<vip_name_list>\"       VIP name list"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_158, DEFINE_DB_NODENAME, "    -x <node_name>           Node name. -x option is specified for single-instance databases"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_159, DEFINE_STOPOPTIONS, "    -t <stop_options>        Stop options for the database. Examples of shutdown options are normal, transactional, immediate, or abort."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_160, DEFINE_DB_DISKGP_LIST, "    -a \"<diskgroup_list>\"      Comma separated list of disk groups"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_161, DEFINE_DB_REM_DISKGP, "    -z                       To remove database's dependency upon disk groups"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_162, DEFINE_SUPPRESS_PROMPT, "    -y                       To suppress prompt"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_163, DEFINE_AVAIL_INST, "    -i <avail_inst_name>     Name of available instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_164, DEFINE_SERV_POOL, "    -g <pool_name>          Server pool name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_165, DEFINE_DB_SERV_GPLIST, "    -g \"<serverpool_list>\"    Comma separated list of database server pool names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_167, DEFINE_NET_ADDRESS_SPEC, "    -S <subnet>/<netmask>/[if1[|if2...]]  NET address spec for network"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_168, DEFINE_SERVICE_ROLE, "    -l <role>                Role of the service (primary, physical_standby, logical_standby, snapshot_standby)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_169, DEFINE_SERVICE_POLICY, "    -y <policy>              Management policy for the service (AUTOMATIC or MANUAL)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_170, DEFINE_AQHA_NOTIF, "    -q <AQ HA notifications> AQ HA notifications (TRUE or FALSE)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_171, DIFINE_CLB_GOAL, "    -j <clb_goal>  Connection Load Balancing Goal (SHORT or LONG). Default is LONG."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_172, DEFINE_RLB_GOAL, "    -B <Runtime Load Balancing Goal>     Runtime Load Balancing Goal (SERVICE_TIME, THROUGHPUT, or NONE)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_173, DEFINE_DTP_FLAG, "    -x <Distributed Transaction Processing>  Distributed Transaction Processing (TRUE or FALSE)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_174, DEFINE_FAILOVER_TYPE, "    -e <Failover type>       Failover type (NONE, SESSION, or SELECT)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_175, DEFINE_FAILOVER_RETR, "    -z <integer>             Failover retries"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_176, DEFINE_FAILOVER_DELAY, "    -w <integer>             Failover delay"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_177, DEFINE_OC4J_PORT, "    -p <oc4j_rmi_port>       OC4J rmi port number"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_178, DEFINE_FAILOVER_METHOD, "    -m <Failover method>     Failover method (NONE or BASIC)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_179, DEFINE_ONS_LOCAL_PORT, "    -l <ons-local-port>      ONS listening port for local client connections"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_180, DEFINE_ONS_REMOTE_PORT, "    -r <ons-remote-port>     ONS listening port for connections from remote hosts"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_181, DEFINE_ONS_REMOTE_HOST_PORTLIST, "    -t <host>[:<port>][,<host>[:<port>]...]  List of remote host/port pairs for ONS daemons outside this cluster"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_182, DEFINE_MULTICAST_IP_ADDRESS, "    -m <multicast-ip-address>   The multicast IP address for eONS"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_183, DEFINE_MULTICAST_PORTNUM, "    -p <multicast-portnum>    The port number for eONS"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_184, DEFINE_SCAN_LSNR_UPDATE, "    -u                       Update SCAN listeners to match the number of SCAN VIPs"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_185, DEFINE_USER, "    -u <user>                User authorized to mount and unmount filesystem (defaults to invoking user)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_186, DEFINE_VOLUME_DEVICE, "    -d <volume_device>       Volume device path"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_187, DEFINE_MTPOINT_PATH, "    -m <mountpoint_path>     Mountpoint path"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_188, DEFINE_DISKGROUP_NAME, "    -g <dg_name>             Disk Group name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_189, DEFINE_GNS_IP_ADDRESS, "    -i <ip_address>          VIP address on which GNS is to listen"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_190, DEFINE_GNS_DOMAIN, "    -d <domain>              Subdomain which GNS is to service"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_191, DEFINE_GNS_ADVERTISE, "    -N <name> -A <address> Advertise a name through GNS using the given address."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_192, DEFINE_GNS_CREATE_ALIAS, "    -c <name> -a <alias>      Create an alias. The alias is specified through the -a option."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_193, DEFINE_GNS_UNALIAS, "    -u <alias>               Delete an alias."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_194, DEFINE_GNS_RESOLVE_ADDRESS, "    -r <address>             Resolve an address through GNS."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_195, DEFINE_GNS_VALIDATE, "    -V <name>                Check to see if the specified name is advertised through GNS."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_196, DEFINE_GNS_FORWARDED_DOMAINS, "    -F <domain>[,<domain> ..]    Specify the list of domains that GNS will forward."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_197, DEFINE_GNS_REFUSED_DOMAINS, "    -R <domain>[,<domain> ...]   Specify the list of domains that GNS will not forward."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_198, DEFINE_GNS_EXCLUDED_INTERFACES, "    -X <interface>[,<interface>] Specify the interfaces that GNS will not listen on."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_199, DEFINE_GNS_LOG_LEVEL, "    -l <log_level>           Specify the level of logging that GNS should run with."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_200, DEFINE_VOLUME_NAME, "    -v <volume_name>         Volume name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_201, DEFINE_SKIP_PORTS_CHECK, "    -s                       Skip the checking of ports"
 //  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_202, DEFINE_STATE_FILE_STOP, "    -s <state_file>   Specify a file path for the 'srvctl stop home' command to store the state of the resources"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_203, DEFINE_STATE_FILE_START, "    -s <state_file>   Specify the file path of the state_file created by the previous 'srvctl stop home' command"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_204, DEFINE_ASM_DISKSTRING, "    -d <asm_diskstring>      ASM diskgroup discovery string"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_205, DEFINE_SRVPOOL_FORCE_FLAG, "    -f                       Force the operation even though some resource(s) will be stopped"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_206, DEFINE_MODINST_REM_SVC_INST, "    -z                       To remove existing node instance mapping for policy-managed database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_207, DEFINE_SERV_SRCN, "    -c <current_node>        Node name to relocate service from"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_208, DEFINE_SERV_TRGN, "    -n <target_node>         Node name to relocate service to"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_209, DEFINE_FORCE_ADD, "    -f                       Force the add operation even though some resource(s) will be stopped"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_210, DEFINE_SRC_SERVER_LIST, "    -n \"<server_list>\"       Comma separated list of server names to relocate"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_211, DEFINE_TGT_SRVPOOL_NAME, "    -g <pool_name>           Target server pool name into which to relocate servers"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_212, DEFINE_LSNR_ORACLE_HOME, "    -o <oracle_home>         ORACLE_HOME path (default value is CRS_HOME)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_213, DEFINE_LSNR_NAME_IN_ADD, "    -l <lsnr_name>           Listener name (default name is LISTENER)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_214, DEFINE_SRVPOOL_IMPORTANCE_IN_ADD, "    -i <importance>          Importance of the server pool (Default value is 0)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_215, DEFINE_SRVPOOL_MIN_CRDNL_IN_ADD, "    -l <min>                 Minimum size of the server pool (Default value is 0)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_216, DEFINE_SRVPOOL_MAX_CRDNL_IN_ADD, "    -u <max>                 Maximum size of the server pool, -1 for unlimited maximum size (Default value is 0)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_217, DEFINE_SERVER_LIST, "    -n \"<server_list>\"       Comma separated list of server names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_218, DEFINE_ALL_LSNRS, "    -a                       All listeners"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_219, DEFINE_SIDB_NODENAME_IN_SP, "    -x <node_name>           Node name in specified server pool on which to run single-instance database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__000, USAGE_SRVCTL, "Usage: srvctl <command> <object> [<options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__001, USAGE_SRVCTL_VERB_CLUSTER, "    commands: enable|disable|start|stop|relocate|status|add|remove|modify|getenv|setenv|unsetenv|config"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__002, USAGE_SRVCTL_NOUN_CLUSTER, "    objects: database|instance|service|nodeapps|vip|asm|diskgroup|listener|srvpool|server|scan|scan_listener|oc4j|home|filesystem|gns"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__003, USAGE_SRVCTL_DETAIL, "For detailed help on each command and object and its options use:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__004, USAGE_SRVCTL_HELPER, "  srvctl <command> <object> -h"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__005, USAGE_SIMPLE, "Usage: srvctl [-V]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__006, USAGE_ENABLE_DB, "Usage: srvctl enable database -d <db_unique_name> [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__007, USAGE_ENABLE_INST, "Usage: srvctl enable instance -d <db_unique_name> -i \"<inst_name_list>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__008, USAGE_ENABLE_SERV, "Usage: srvctl enable service -d <db_unique_name> -s \"<service_name_list>\" [-i <inst_name> | -n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__009, USAGE_DISABLE_DB, "Usage: srvctl disable database -d <db_unique_name> [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__010, USAGE_DISABLE_INST, "Usage: srvctl disable instance -d <db_unique_name> -i \"<inst_name_list>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__011, USAGE_DISABLE_SERV, "Usage: srvctl disable service -d <db_unique_name> -s \"<service_name_list>\" [-i <inst_name> | -n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__012, USAGE_START_DB, "Usage: srvctl start database -d <db_unique_name> [-o <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__013, USAGE_START_INST, "Usage: srvctl start instance -d <db_unique_name> {-n <node_name> [-i <inst_name>] | -i <inst_name_list>} [-o <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__014, USAGE_START_SERV, "Usage: srvctl start service -d <db_unique_name> [-s \"<service_name_list>\" [-n <node_name> | -i <inst_name>] ] [-o <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__015, USAGE_START_NODEAPPS, "Usage: srvctl start nodeapps [-n <node_name>] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__016, USAGE_STOP_DB, "Usage: srvctl stop database -d <db_unique_name> [-o <stop_options>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__017, USAGE_STOP_INST, "Usage: srvctl stop instance -d <db_unique_name> {-n <node_name> | -i <inst_name_list>}  [-o <stop_options>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__018, USAGE_STOP_SERV, "Usage: srvctl stop service -d <db_unique_name> [-s \"<service_name_list>\" [-n <node_name> | -i <inst_name>] ] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__019, USAGE_STOP_NODEAPPS, "Usage: srvctl stop nodeapps [-n <node_name>] [-f] [-r] [-v]"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
__020, USAGE_RELOCATE_SERV, "Usage: srvctl relocate service -d <db_unique_name> -s <service_name> {-i <old_inst_name> -t <new_inst_name> | -c <current_node> -n <target_node>} [-f]\n       Specify instances for an administrator-managed database, or nodes for a policy managed database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__021, USAGE_STAT_DB, "Usage: srvctl status database -d <db_unique_name> [-f] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__022, USAGE_STAT_INST, "Usage: srvctl status instance -d <db_unique_name> {-n <node_name> | -i <inst_name_list>} [-f] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__023, USAGE_STAT_SERV, "Usage: srvctl status service -d <db_unique_name> [-s \"<service_name_list>\"] [-f] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__024, USAGE_STAT_NODEAPPS, "Usage: srvctl status nodeapps"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__025, USAGE_ADD_DB, "Usage: srvctl add database -d <db_unique_name> -o <oracle_home> [-m <domain_name>] [-p <spfile>] [-r {PRIMARY | PHYSICAL_STANDBY | LOGICAL_STANDBY | SNAPSHOT_STANDBY}] [-s <start_options>] [-t <stop_options>] [-n <db_name>] [-y {AUTOMATIC | MANUAL}] [-g \"<serverpool_list>\"] [-x <node_name>] [-a \"<diskgroup_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__026, USAGE_ADD_INST, "Usage: srvctl add instance -d <db_unique_name> -i <inst_name> -n <node_name> [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__027, USAGE_ADD_SERV, "Usage: srvctl add service -d <db_unique_name> -s <service_name> {-r \"<preferred_list>\" [-a \"<available_list>\"] [-P {BASIC | NONE | PRECONNECT}] | -g <server_pool> [-c {UNIFORM | SINGLETON}] } [-k   <net_num>] [-l [PRIMARY][,PHYSICAL_STANDBY][,LOGICAL_STANDBY][,SNAPSHOT_STANDBY]] [-y {AUTOMATIC | MANUAL}] [-q {TRUE|FALSE}] [-x {TRUE|FALSE}] [-j {SHORT|LONG}] [-B {NONE|SERVICE_TIME|THROUGHPUT}] [-e {NONE|SESSION|SELECT}] [-m {NONE|BASIC}] [-z <failover_retries>] [-w <failover_delay>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__028, USAGE_ADD_NODEAPPS, "Usage: srvctl add nodeapps { { -n <node_name> -A <name|ip>/<netmask>/[if1[|if2...]] } | { -S <subnet>/<netmask>/[if1[|if2...]] } } [-p <portnum>] [-m <multicast-ip-address>] [-e <eons-listen-port>] [-l <ons-local-port>]  [-r <ons-remote-port>] [-t <host>[:<port>][,<host>[:<port>]...]] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__029,USAGE_SRVCTL_HELPER1, "  srvctl <command> -h or"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
 
__030, USAGE_REMOVE_DB, "Usage: srvctl remove database -d <db_unique_name> [-f] [-y]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__031, USAGE_REMOVE_INST, "Usage: srvctl remove instance -d <db_unique_name> [-i <inst_name>] [-f] [-y]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__032, USAGE_REMOVE_SERV, "Usage: srvctl remove service -d <db_unique_name> -s <service_name> [-i <inst_name>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__033, USAGE_REMOVE_NODEAPPS, "Usage: srvctl remove nodeapps [-f] [-y] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__035, USAGE_MODIFY_INST, "Usage: srvctl modify instance -d <db_unique_name> -i <inst_name> { -n <node_name> | -z }"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__036, USAGE_SETENV_DB, "Usage: srvctl setenv database -d <db_unique_name> {-t <name>=<val>[,<name>=<val>,...] | -T <name>=<val>}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__037, SRVCTL_PURPOSE_STR, "\nServer Control Utility (SRVCTL) is used to configure and administer clusterwide and node level  resources managed by Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__038, SRVCTL_SIPURPOSE_STR, "\nServer Control Utility (SRVCTL) is used to configure and administer Oracle Restart resources.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__039, USAGE_SETENV_NODEAPPS, "Usage: srvctl setenv nodeapps {-t \"<name>=<val>[,<name>=<val>,...]\" | -T \"<name>=<val>\"}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__040, USAGE_UNSETENV_DB, "Usage: srvctl unsetenv database -d <db_unique_name> -t \"<name_list>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__041, USAGE_SRVCTL_VERB_SIHA, "    commands: enable|disable|start|stop|status|add|remove|modify|getenv|setenv|unsetenv|config"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__042, USAGE_SRVCTL_NOUN_SIHA, "    objects: database|service|asm|diskgroup|listener|home|ons|eons"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__043, USAGE_UNSETENV_NODEAPPS, "Usage: srvctl unsetenv nodeapps -t \"<name_list>\" [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__044, USAGE_GETENV_DB, "Usage: srvctl getenv database -d <db_unique_name> [-t \"<name_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__047, USAGE_GETENV_NODEAPPS, "Usage: srvctl getenv nodeapps [-a] [-g] [-s] [-e] [-t \"<name_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__048, USAGE_CONFIG_DB, "Usage: srvctl config database [-d <db_unique_name> [-a] ]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__049, USAGE_CONFIG_DB_ONE, "Usage: srvctl config database -d <db_unique_name> [-a] [-t]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__050, USAGE_CONFIG_SERV, "Usage: srvctl config service -d <db_unique_name> [-s <service_name>] [-a]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__051, USAGE_CONFIG_NODEAPPS, "Usage: srvctl config nodeapps [-a] [-g] [-s] [-e]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__053, USAGE_MODIFY_DB, "Usage: srvctl modify database -d <db_unique_name> [-n <db_name>] [-o <oracle_home>] [-u <oracle_user>] [-m <domain>] [-p <spfile>] [-r {PRIMARY | PHYSICAL_STANDBY | LOGICAL_STANDBY | SNAPSHOT_STANDBY}] [-s <start_options>] [-t <stop_options>] [-y {AUTOMATIC | MANUAL}] [-g \"<serverpool_list>\" [-x <node_name>]] [-a \"<diskgroup_list>\"|-z]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__054, USAGE_MODIFY_SERVICE_1, "Usage: srvctl modify service -d <db_unique_name> -s <service_name> -i <old_inst_name> -t <new_inst_name> [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__055, USAGE_MODIFY_SERVICE_2, "Usage: srvctl modify service -d <db_unique_name> -s <service_name> -i <avail_inst_name> -r [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__056, USAGE_MODIFY_NODEAPPS, "Usage: srvctl modify nodeapps {[-n <node_name> -A <new_vip_address>/<netmask>[/if1[|if2|...]]] | [-S <subnet>/<netmask>[/if1[|if2|...]]]} [-m <multicast-ip-address>] [-p <multicast-portnum>] [-e <eons-listen-port>] [ -l <ons-local-port> ] [-r <ons-remote-port> ] [-t <host>[:<port>][,<host>[:<port>]...]] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__057, USAGE_ADD_SERV_U, "Usage: srvctl add service -d <db_unique_name> -s <service_name> -u {-r \"<new_pref_inst>\" | -a \"<new_avail_inst>\"}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__058, USAGE_ADD_ASM, "Usage: srvctl add asm [-l <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__059, USAGE_REMOVE_ASM, "Usage: srvctl remove asm [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__060, USAGE_CONFIG_ASM, "Usage: srvctl config asm [-a]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__061, USAGE_MODIFY_INST_ASM, "Usage: srvctl modify asm [ -n <node_name> {-i <asm_inst_name> | -z } ] [-o <oracle_home>] [ { -p <spfile> | -m \"<name>=<value> [, ...]\" } ]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__062, USAGE_START_ASM, "Usage: srvctl start asm [-n <node_name>] [-o <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__063, USAGE_STOP_ASM, "Usage: srvctl stop asm [-n <node_name>] [-o <stop_options>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__064, USAGE_STAT_ASM, "Usage: srvctl status asm [-n <node_name>] [-a]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__065, USAGE_ENABLE_ASM, "Usage: srvctl enable asm [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__066, USAGE_DISABLE_ASM, "Usage: srvctl disable asm [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__067, USAGE_MODIFY_ASM, "Usage: srvctl modify asm [-l <lsnr_name>] "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__068, USAGE_MODIFY_SERVICE_3, "Usage: srvctl modify service -d <db_unique_name> -s <service_name> -n -i \"<preferred_list>\" [-a \"<available_list>\"] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__069, USAGE_MODIFY_SERVICE_4, "Usage: srvctl modify service -d <db_unique_name> -s <service_name> [-c {UNIFORM | SINGLETON}] [-P {BASIC|PRECONNECT|NONE}] [-l [PRIMARY][,PHYSICAL_STANDBY][,LOGICAL_STANDBY][,SNAPSHOT_STANDBY]] [-y {AUTOMATIC | MANUAL}][-q {true|false}] [-x {true|false}] [-j {SHORT|LONG}] [-B {NONE|SERVICE_TIME|THROUGHPUT}] [-e {NONE|SESSION|SELECT}] [-m {NONE|BASIC}] [-z <integer>] [-w <integer>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__070, USAGE_CONFIG_LISTENER, "Usage: srvctl config listener [-l <lsnr_name>] [-a]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__071, USAGE_START_LISTENER, "Usage: srvctl start listener [-l <lsnr_name>] [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__072, USAGE_STOP_LISTENER, "Usage: srvctl stop listener [-l <lsnr_name>] [-n <node_name>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__073, USAGE_MODIFY_LISTENER, "Usage: srvctl modify listener [-l <lsnr_name>] [-o <oracle_home>] [-p \"[TCP:]<port>[, ...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>] [/SDP:<port>]\"] [-u <oracle_user>] [-k <net_num>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__074, USAGE_ADD_LISTENER, "Usage: srvctl add listener [-l <lsnr_name>] [-s] [-p \"[TCP:]<port>[, ...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>] [/SDP:<port>]\"] [-o <oracle_home>] [-k <net_num>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__075, USAGE_REMOVE_LISTENER, "Usage: srvctl remove listener [-l <lsnr_name> | -a] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__076, USAGE_ADD_SCAN, "Usage: srvctl add scan -n <scan_name> [-k <network_number> [-S <subnet>/<netmask>[/if1[|if2|...]]]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__077, USAGE_CONFIG_SCAN, "Usage: srvctl config scan [-i <ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__078, USAGE_START_SCAN, "Usage: srvctl start scan [-i <ordinal_number>] [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__079, USAGE_STOP_SCAN, "Usage: srvctl stop scan [-i <ordinal_number>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__080, USAGE_RELOCATE_SCAN, "Usage: srvctl relocate scan -i <ordinal_number> [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__081, USAGE_STATUS_SCAN, "Usage: srvctl status scan [-i <ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__082, USAGE_ENABLE_SCAN, "Usage: srvctl enable scan [-i <ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__083, USAGE_DISABLE_SCAN, "Usage: srvctl disable scan [-i <ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__084, USAGE_MODIFY_SCAN, "Usage: srvctl modify scan -n <scan_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__085, USAGE_REMOVE_SCAN, "Usage: srvctl remove scan [-f] [-y]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__086, USAGE_ADD_SCAN_LISTENER, "Usage: srvctl add scan_listener [-l <lsnr_name_prefix>] [-s] [-p [TCP:]<port>[/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>] [/SDP:<port>]] "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__087, USAGE_CONFIG_SCAN_LISTENER, "Usage: srvctl config scan_listener [-i <ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__088, USAGE_START_SCAN_LISTENER, "Usage: srvctl start scan_listener [-n <node_name>] [-i <ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__089, USAGE_STOP_SCAN_LISTENER, "Usage: srvctl stop scan_listener [-i <ordinal_number>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__090, USAGE_RELOCATE_SCAN_LISTENER, "Usage: srvctl relocate scan_listener -i <ordinal_number> [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__091, USAGE_STATUS_SCAN_LISTENER, "Usage: srvctl status scan_listener [-i <ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__092, USAGE_ENABLE_SCAN_LISTENER, "Usage: srvctl enable scan_listener [-i <ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__093, USAGE_DISABLE_SCAN_LISTENER, "Usage: srvctl disable scan_listener [-i <ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__094, USAGE_MODIFY_SCAN_LISTENER, "Usage: srvctl modify scan_listener {-u|-p [TCP:]<port>[/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>] [/SDP:<port>]} "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__095, USAGE_REMOVE_SCAN_LISTENER, "Usage: srvctl remove scan_listener [-f] [-y]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__099, USAGE_ADD_SRVPOOL, "Usage: srvctl add srvpool -g <pool_name> [-l <min>] [-u <max>] [-i <importance>] [-n \"<server_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__100, USAGE_CONFIG_SRVPOOL, "Usage: srvctl config srvpool [-g <pool_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__101, USAGE_STATUS_SRVPOOL, "Usage: srvctl status srvpool [-g <pool_name>] [-a]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__102, USAGE_RELOCATE_SERVER, "Usage: srvctl relocate server -n \"<server_list>\" -g <pool_name> [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__103, USAGE_STATUS_SERVER, "Usage: srvctl status server -n \"<server_list>\" [-a]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__104, USAGE_MODIFY_SRVPOOL, "Usage: srvctl modify srvpool -g <pool_name> [-l <min>] [-u <max>] [-i <importance>] [-n \"<server_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__105, USAGE_REMOVE_SRVPOOL, "Usage: srvctl remove srvpool -g <pool_name>"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
__106, USAGE_ENABLE_LISTENER, "Usage: srvctl enable listener [-l <lsnr_name>] [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__107, USAGE_DISABLE_LISTENER, "Usage: srvctl disable listener [-l <lsnr_name>] [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__108, USAGE_STAT_LISTENER, "Usage: srvctl status listener [-l <lsnr_name>] [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__109, USAGE_GETENV_LISTENER, "Usage: srvctl getenv listener [-l <lsnr_name>] [-t <name>[, ...]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__110, USAGE_SETENV_LISTENER, "Usage: srvctl setenv listener [-l <lsnr_name>] -t \"<name>=<val> [,...]\" | -T \"<name>=<value>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__111, USAGE_UNSETENV_LISTENER, "Usage: srvctl unsetenv listener [-l <lsnr_name>] -t \"<name>[, ...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__112, USAGE_SI_ADD_LISTENER, "Usage: srvctl add listener [-l <lsnr_name>] [-s] [-p \"[TCP:]<port>[, ...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>] [/SDP:<port>]\"] [-o <oracle_home>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__113, USAGE_SI_CONFIG_LISTENER, "Usage: srvctl config listener [-l <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__114, USAGE_SI_START_LISTENER, "Usage: srvctl start listener [-l <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__115, USAGE_SI_STOP_LISTENER, "Usage: srvctl stop listener [-l <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__116, USAGE_SI_MODIFY_LISTENER, "Usage: srvctl modify listener [-l <lsnr_name>] [-o <oracle_home>] [-p \"[TCP:]<port>[, ...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>] [/SDP:<port>]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__117, USAGE_SI_GETENV_LISTENER, "Usage: srvctl getenv listener [-l <lsnr_name>] [-t <name>[, ...]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__118, USAGE_SI_SETENV_LISTENER, "Usage: srvctl setenv listener [-l <lsnr_name>] -t \"<name>=<val> [,...]\" | -T \"<name>=<value>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__119, USAGE_SI_UNSETENV_LISTENER, "Usage: srvctl unsetenv listener [-l <lsnr_name>] -t \"<name>[, ...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__120, USAGE_SI_ENABLE_LISTENER, "Usage: srvctl enable listener [-l <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__121, USAGE_SI_DISABLE_LISTENER, "Usage: srvctl disable listener [-l <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__122, USAGE_SI_REMOVE_LISTENER, "Usage: srvctl remove listener [-l <lsnr_name> | -a] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__128, USAGE_SI_STAT_LISTENER, "Usage: srvctl status listener [-l <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__129, USAGE_SI_ENABLE_DB, "Usage: srvctl enable database -d <db_unique_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__130, USAGE_SI_DISABLE_DB, "Usage: srvctl disable database -d <db_unique_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__131, USAGE_SI_START_DB, "Usage: srvctl start database -d <db_unique_name> [-o <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__132, USAGE_SI_STOP_DB, "Usage: srvctl stop database -d <db_unique_name> [-o <stop_options>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__133, USAGE_SI_STAT_DB, "Usage: srvctl status database -d <db_unique_name> [-f] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__134, USAGE_SI_REMOVE_DB, "Usage: srvctl remove database -d <db_unique_name> [-f] [-y] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__135, USAGE_SI_SETENV_DB, "Usage: srvctl setenv database -d <db_unique_name> {-t <name>=<val>[,<name>=<val>,...] | -T <name>=<val>}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__136, USAGE_SI_UNSETENV_DB, "Usage: srvctl unsetenv database -d <db_unique_name> -t \"<name_list>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__137, USAGE_SI_GETENV_DB, "Usage: srvctl getenv database -d <db_unique_name> [-t \"<name_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__138, USAGE_SI_CONFIG_DB, "Usage: srvctl config database [-d <db_unique_name> [-a]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__139, USAGE_SI_MODIFY_DB, "Usage: srvctl modify database -d <db_unique_name> [-n <db_name>] [-o <oracle_home>] [-u <oracle_user>] [-m <domain>] [-p <spfile>]  [-r {PRIMARY | PHYSICAL_STANDBY | LOGICAL_STANDBY | SNAPSHOT_STANDBY}] [-s <start_options>] [-t <stop_options>] [-y {AUTOMATIC | MANUAL}] [-a \"<diskgroup_list>\"|-z]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__140, USAGE_SI_ADD_DB, "Usage: srvctl add database -d <db_unique_name> -o <oracle_home> [-m <domain_name>] [-p <spfile>] [-r {PRIMARY | PHYSICAL_STANDBY | LOGICAL_STANDBY | SNAPSHOT_STANDBY}] [-s <start_options>] [-t <stop_options>] [-n <db_name>] [-y {AUTOMATIC | MANUAL}] [-a \"<diskgroup_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__141, USAGE_SI_CONFIG_DB_ONE, "Usage: srvctl config database -d <db_unique_name> [-a] [-t]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__148, USAGE_ENABLE_NODEAPPS, "Usage: srvctl enable nodeapps [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__149, USAGE_DISABLE_NODEAPPS, "Usage: srvctl disable nodeapps [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__150, USAGE_SI_ADD_ASM, "Usage: srvctl add asm [-l <lsnr_name>] [-p <spfile>] [-d <asm_diskstring>]" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__151, USAGE_SI_ENABLE_ASM, "Usage: srvctl enable asm"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__152, USAGE_SI_DISABLE_ASM, "Usage: srvctl disable asm"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__153, USAGE_SI_START_ASM, "Usage: srvctl start asm [-o <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__154, USAGE_SI_STOP_ASM, "Usage: srvctl stop asm [-o <stop_options>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__155, USAGE_SI_STAT_ASM, "Usage: srvctl status asm [-a]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__156, USAGE_SI_REMOVE_ASM, "Usage: srvctl remove asm [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__157, USAGE_SI_MODIFY_ASM, "Usage: srvctl modify asm [-l <lsnr_name>] [-p <spfile>] [-d <asm_diskstring>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__158, USAGE_SI_CONFIG_ASM, "Usage: srvctl config asm [-a]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__159, USAGE_GETENV_ASM, "Usage: srvctl getenv asm [-t <name>[, ...]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__160, USAGE_SETENV_ASM, "Usage: srvctl setenv asm -t \"<name>=<val> [,...]\" | -T \"<name>=<value>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__161, USAGE_UNSETENV_ASM, "Usage: srvctl unsetenv asm -t \"<name>[, ...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__162, USAGE_ADD_VIP, "Usage: srvctl add vip -n <node_name> -k <network_number> -A <name|ip>/<netmask>/[if1[|if2...]] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__163, USAGE_CONFIG_VIP, "Usage: srvctl config vip { -n <node_name> | -i <vip_name> }"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__164, USAGE_REMOVE_VIP, "Usage: srvctl remove vip -i \"<vip_name_list>\" [-f] [-y] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__165, USAGE_START_VIP, "Usage: srvctl start vip { -n <node_name> | -i <vip_name> } [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__166, USAGE_STOP_VIP, "Usage: srvctl stop vip { -n <node_name>  | -i <vip_name> } [-f] [-r] [-v]"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
__167, USAGE_STAT_VIP, "Usage: srvctl status vip { -n <node_name> | -i <vip_name> }"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__168, USAGE_ENABLE_VIP, "Usage: srvctl enable vip -i <vip_name> [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__169, USAGE_DISABLE_VIP, "Usage: srvctl disable vip -i <vip_name> [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__170, USAGE_GETENV_VIP, "Usage: srvctl getenv vip -i <vip_name> [-t \"<name_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__171, USAGE_SETENV_VIP, "Usage: srvctl setenv vip -i <vip_name> {-t \"<name>=<val>[,<name>=<val>,...]\" | -T \"<name>=<val>\"}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__172, USAGE_UNSETENV_VIP, "Usage: srvctl unsetenv vip -i <vip_name> -t \"<name_list>\" [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__173, USAGE_CONFIG_OC4J, "Usage: srvctl config oc4j"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__174, USAGE_START_OC4J, "Usage: srvctl start oc4j [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__175, USAGE_STOP_OC4J, "Usage: srvctl stop oc4j [-f] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__176, USAGE_STAT_OC4J, "Usage: srvctl status oc4j [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__177, USAGE_ADD_OC4J, "Usage: srvctl add oc4j [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__178, USAGE_REMOVE_OC4J, "Usage: srvctl remove oc4j [-f] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__179, USAGE_ENABLE_OC4J, "Usage: srvctl enable oc4j [-n <node_name>] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__180, USAGE_DISABLE_OC4J, "Usage: srvctl disable oc4j [-n <node_name>] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__181, USAGE_MODIFY_OC4J, "Usage: srvctl modify oc4j -p <oc4j_rmi_port> [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__182, USAGE_RELOCATE_OC4J, "Usage: srvctl relocate oc4j [-n <node_name>] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__183, USAGE_START_HOME, "Usage: srvctl start home -o <oracle_home> -s <state_file> -n <node_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__184, USAGE_STOP_HOME, "Usage: srvctl stop home -o <oracle_home> -s <state_file> -n <node_name> [-t <stop_options>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__185, USAGE_STAT_HOME, "Usage: srvctl status home -o <oracle_home> -s <state_file> -n <node_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__186, USAGE_SI_ADD_SERV, "Usage: srvctl add service -d <db_unique_name> -s <service_name> [-l [PRIMARY][,PHYSICAL_STANDBY][,LOGICAL_STANDBY][,SNAPSHOT_STANDBY]] [-y {AUTOMATIC | MANUAL}][-q {true|false}] [-j {SHORT|LONG}] [-B {NONE|SERVICE_TIME|THROUGHPUT}][-e {NONE|SESSION|SELECT}] [-m {NONE|BASIC}][-z <failover_retries>] [-w <failover_delay>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__187, USAGE_SI_MODIFY_SERVICE, "Usage: srvctl modify service -d <db_unique_name> -s <service_name> [-P {BASIC|PRECONNECT|NONE}] [-l [PRIMARY][,PHYSICAL_STANDBY][,LOGICAL_STANDBY][,SNAPSHOT_STANDBY]] [-y {AUTOMATIC | MANUAL}][-q {true|false}] [-j {SHORT|LONG}] [-B {NONE|SERVICE_TIME|THROUGHPUT}] [-e {NONE|SESSION|SELECT}] [-m {NONE|BASIC}] [-z <integer>] [-w <integer>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__188, USAGE_SI_START_SERV, "Usage: srvctl start service -d <db_unique_name> [-s \"<service_name_list>\" [-o <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__189, USAGE_SI_STOP_SERV, "Usage: srvctl stop service -d <db_unique_name> [-s \"<service_name_list>\" [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__190, USAGE_SI_DISABLE_SERV, "Usage: srvctl disable service -d <db_unique_name> -s \"<service_name_list>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__191, USAGE_SI_ENABLE_SERV, "Usage: srvctl enable service -d <db_unique_name> -s \"<service_name_list>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__192, USAGE_SI_REMOVE_SERV, "Usage: srvctl remove service -d <db_unique_name> -s <service_name> [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__193, USAGE_ADD_FS, "Usage: srvctl add filesystem -d <volume_device> -v <volume_name> -g <dg_name> [-m <mountpoint_path>] [-u <user>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__194, USAGE_CONFIG_FS, "Usage: srvctl config filesystem -d <volume_device>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__195, USAGE_START_FS, "Usage: srvctl start filesystem -d <volume_device> [-n <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__196, USAGE_STAT_FS, "Usage: srvctl status filesystem -d <volume_device>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__197, USAGE_STOP_FS, "Usage: srvctl stop filesystem -d <volume_device> [-n <node_name>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__198, USAGE_MODIFY_FS, "Usage: srvctl modify filesystem -d <volume_device> -u <user>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__199, USAGE_REMOVE_FS, "Usage: srvctl remove filesystem -d <volume_device> [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__200, USAGE_ENABLE_FS, "Usage: srvctl enable filesystem -d <volume_device>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__201, USAGE_DISABLE_FS, "Usage: srvctl disable filesystem -d <volume_device>"
//  *Document: No
//  *Cause: 
// *Action: 
/
__210, USAGE_START_DISKGROUP, "Usage: srvctl start diskgroup -g <dg_name> [-n \"<node_list>\"]"
//  *Cause: 
// *Action: 
/
__211, USAGE_SI_START_DISKGROUP, "Usage: srvctl start diskgroup -g <dg_name>"
//  *Cause: 
// *Action: 
/
__212, USAGE_STAT_DISKGROUP, "Usage: srvctl status diskgroup -g <dg_name> [-n \"<node_list>\"] [-a]"
//  *Cause: 
// *Action: 
/
__213, USAGE_SI_STAT_DISKGROUP, "Usage: srvctl status diskgroup -g <dg_name> [-a]"
//  *Cause: 
// *Action: 
/
__214, USAGE_STOP_DISKGROUP, "Usage: srvctl stop diskgroup -g <dg_name> [-n \"<node_list>\"] [-f]"
//  *Cause: 
// *Action: 
/
__215, USAGE_SI_STOP_DISKGROUP, "Usage: srvctl stop diskgroup -g <dg_name> [-f]"
//  *Cause: 
// *Action: 
/
__216, USAGE_ENABLE_DISKGROUP, "Usage: srvctl enable diskgroup -g <dg_name> [-n \"<node_list>\"]"
//  *Cause: 
// *Action: 
/
__217, USAGE_SI_ENABLE_DISKGROUP, "Usage: srvctl enable diskgroup -g <dg_name>"
//  *Cause: 
// *Action: 
/
__218, USAGE_DISABLE_DISKGROUP, "Usage: srvctl disable diskgroup -g <dg_name> [-n \"<node_list>\"]"
//  *Cause: 
// *Action: 
/
__219, USAGE_SI_DISABLE_DISKGROUP, "Usage: srvctl disable diskgroup -g <dg_name>"
//  *Cause: 
// *Action: 
/
__220, USAGE_REMOVE_DISKGROUP, "Usage: srvctl remove diskgroup -g <dg_name> [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__232, VERB_ENABLE_DESCRIPTION, "\nThe SRVCTL enable command enables the named object so that it can run under {0} for automatic startup, failover, or restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__233, VERB_DISABLE_DESCRIPTION, "\nThe SRVCTL disable command disables the named object so that it is unavailable to run under {0} for automatic startup, failover, or restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__234, VERB_START_DESCRIPTION, "\nThe SRVCTL start command starts, {0} enabled, non-running objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__235, VERB_STOP_DESCRIPTION, "\nThe SRVCTL stop command stops, {0} enabled, starting or running objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__236, VERB_RELOCATE_DESCRIPTION, "\nThe SRVCTL relocate command temporarily relocates Oracle Clusterware enabled object to another node or instance.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__237, VERB_STATUS_DESCRIPTION, "\nThe SRVCTL status command displays the current state of the object.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__238, VERB_ADD_DESCRIPTION, "\nThe SRVCTL add command adds the configuration and the {0} application to the OCR for the cluster database, named instances, named services, or for the named nodes.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__239, VERB_REMOVE_DESCRIPTION, "\nThe SRVCTL remove command removes the configuration, for the object from the {0}. Environment settings for the object are also removed.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__240, VERB_MODIFY_DESCRIPTION, "\nThe SRVCTL modify command enables user to modify configuration of the object without removing and adding {0} resources. The changes takes effect when the application is restarted.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__241, VERB_SETENV_DESCRIPTION, "\nThe SRVCTL setenv command sets values for the environment in the configuration file. It allows users to administer environment configuration for the objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__242, VERB_UNSETENV_DESCRIPTION, "\nThe SRVCTL unsetenv command unsets values for the environment in the configuration file. It allows users to administer environment configuration for the objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__243, VERB_GETENV_DESCRIPTION, "\nThe SRVCTL getenv command Gets and displays values for the environment from the configuration file. It allows users to administer environment configuration for the objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__244, VERB_CONFIG_DESCRIPTION, "\nThe SRVCTL config command displays the configuration for the object stored in the OCR.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__245, ENABLE_NODEAPPS_PURPOSE, "\nEnable node applications for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__246, ENABLE_VIP_PURPOSE, "\nEnable VIPs for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__247, ENABLE_SCAN_PURPOSE, "\nEnable SCAN VIP for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__248, ENABLE_SCAN_LISTENER_PURPOSE, "\nEnable the SCAN listener for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__249, ENABLE_OC4J_PURPOSE, "\nEnable OC4J instance for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__250, DISABLE_NODEAPPS_PURPOSE, "\nDisable node applications from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__251, DISABLE_VIP_PURPOSE, "\nDisable the VIPs from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__252, DISABLE_SCAN_PURPOSE, "\nDisable the SCAN VIP from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__253, DISABLE_SCAN_LISTENER_PURPOSE, "\nDisable the SCAN listener from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__254, DISABLE_OC4J_PURPOSE, "\nDisable the OC4J instance from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__255, START_NODEAPPS_PURPOSE, "\nStart the node applications on the cluster or the specified node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__256, START_VIP_PURPOSE, "\nStarts the specified VIP or the VIPs on a node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__257, START_LSNR_PURPOSE, "\nStarts the specified listener or listeners.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__258, START_SCAN_PURPOSE, "\nStarts the specified scan VIP.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__259, START_SCAN_LSNR_PURPOSE, "\nStarts the specified SCAN listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__260, START_OC4J_PURPOSE, "\nStarts the OC4J Instance on one of the nodes of the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__261, STOP_NODEAPPS_PURPOSE, "\nStop the node applications running on a node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__262, STOP_VIP_PURPOSE, "\nStop the specified VIP or VIPs on a node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__263, STOP_LSNR_PURPOSE, "\nStop the specified listener or all listeners running on a node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__264, STOP_SCAN_PURPOSE, "\nStop the SCAN VIP running or in starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__265, STOP_SCAN_LSNR_PURPOSE, "\nStop the SCAN listener running or in starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__266, STOP_OC4J_PURPOSE, "\nStop the OC4J instance in running or starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__267, RELOCATE_SCAN_PURPOSE, "\nTemporarily relocate SCAN VIP from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__268, RELOCATE_SCAN_LSNR_PURPOSE, "\nTemporarily relocate SCAN listener from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__269, RELOCATE_OC4J_PURPOSE, "\nTemporarily relocate the oc4j instance from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__270, STATUS_NODEAPPS_PURPOSE, "\nDisplays the current state of the node applications.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__271, STATUS_VIP_PURPOSE, "\nDisplays the current state of the VIP.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__272, STATUS_LSNR_PURPOSE, "\nDisplays the current state of the Listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__273, STATUS_SCAN_PURPOSE, "\nDisplays the current state of the SCAN VIP.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__274, STATUS_SCAN_LSNR_PURPOSE, "\nDisplays the current state of the SCAN listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__275, STATUS_OC4J_PURPOSE, "\nDisplays the current state of the OC4J instance.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__276, ADD_NODEAPPS_PURPOSE, "\nAdds node application configuration to the specified node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__277, ADD_VIP_PURPOSE, "\nAdds a VIP to the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__278, ADD_LSNR_PURPOSE, "\nAdd a listener to be managed by Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__279, ADD_SCAN_PURPOSE, "\nAdds a SCAN VIP to the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__280, ADD_SCAN_LSNR_PURPOSE, "\nAdds a SCAN listener listening on the given endpoints.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__281, ADD_OC4J_PURPOSE, "\nAdds an OC4J instance to the Oracle Clusterware configuration.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__282, REMOVE_NODEAPPS_PURPOSE, "\nRemoves the node applications configured on the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__283, REMOVE_VIP_PURPOSE, "\nRemoves the specified VIP configuration.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__284, REMOVE_LSNR_PURPOSE, "\nRemoves the listener specified or all the listeners from Oracle clusterware managment.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__285, REMOVE_SCAN_PURPOSE, "\nRemoves the SCAN VIP for the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__286, REMOVE_SCAN_LSNR_PURPOSE, "\nRemoves the SCAN listener for the cluster.\n "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__287, REMOVE_OC4J_PURPOSE, "\nRemoves the OC4J instance configured for the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__288, MODIFY_NODEAPPS_PURPOSE, "\nModifies the configuration for a node application.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__289, MODIFY_LSNR_PURPOSE, "\nModifies the ORACLE_HOME path, Oracle user name, or the listener endpoints.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__290, MODIFY_SCAN_PURPOSE, "\nModifies the SCAN name.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__291, MODIFY_SCAN_LSNR_PURPOSE, "\nModifies the SCAN listeners so that the number of SCAN listeners is the same as the number of SCAN VIPs or modifies the SCAN listener endpoints.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__292, MODIFY_OC4J_PURPOSE, "\nModifies the configuration of RMI port for OC4J instance.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__293, SETENV_NODEAPPS_PURPOSE, "\nAdministers node application environment configurations.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__294, SETENV_VIP_PURPOSE, "\nAdministers VIP's environment configurations.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__295, SETENV_LSNR_PURPOSE, "\nAdministers listeners environment configurations.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__296, UNSETENV_NODEAPPS_PURPOSE, "\nUnsets node application environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__297, UNSETENV_VIP_PURPOSE, "\nUnsets the VIP's environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__298, UNSETENV_LSNR_PURPOSE, "\nUnsets the listener environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__299, GETENV_NODEAPPS_PURPOSE, "\nGets the node application environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__300, GETENV_VIP_PURPOSE, "\nGets the node VIP's environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__301, GETENV_LSNR_PURPOSE, "\nGets the listener environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__302, CONFIG_NODEAPPS_PURPOSE, "\nDisplays the configuration information for the node applications.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__303, CONFIG_VIP_PURPOSE, "\nDisplays the configuration information for a VIP or VIP's configured on a node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__304, CONFIG_LSNR_PURPOSE, "\nDisplays a list of configured listeners that are registered with Oracle Clusterware on a given node. Displays detailed configuration information on a listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__305, CONFIG_SCAN_PURPOSE, "\nDisplays the configuration for the SCAN VIP.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__306, CONFIG_OC4J_PURPOSE, "\nDisplays configuration information for the OC4J instance.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__307, CONFIG_SCAN_LSNR_PURPOSE, "\nDisplays configuration information for the SCAN listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__308, INSTALL_TYPE_CLUSTERWARE, "Oracle Clusterware"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__309, INSTALL_TYPE_SIHA, "Oracle Restart"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__325, USAGE_ENABLE_ONS, "Usage: srvctl enable ons [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__326, USAGE_ENABLE_EONS, "Usage: srvctl enable eons [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__327, USAGE_DISABLE_ONS, "Usage: srvctl disable ons [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__328, USAGE_DISABLE_EONS, "Usage: srvctl disable eons [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__329, USAGE_START_ONS, "Usage: srvctl start ons [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__330, USAGE_START_EONS, "Usage: srvctl start eons [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__331, USAGE_STOP_ONS, "Usage: srvctl stop ons [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__332, USAGE_STOP_EONS, "Usage: srvctl stop eons [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__333, USAGE_STATUS_ONS, "Usage: srvctl status ons"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__334, USAGE_STATUS_EONS, "Usage: srvctl status eons"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__335, USAGE_ADD_ONS, "Usage: srvctl add ons [-l <ons-local-port>]  [-r <ons-remote-port>] [-t <host>[:<port>][,<host>[:<port>]...]] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__336, USAGE_ADD_EONS, "Usage: srvctl add eons [-p <portnum>] [-m <multicast-ip-address>] [-e <eons-listen-port>] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__337, USAGE_REMOVE_ONS, "Usage: srvctl remove ons [-f] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__338, USAGE_REMOVE_EONS, "Usage: srvctl remove eons [-f] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__339, USAGE_MODIFY_ONS, "Usage: srvctl modify ons [-l <ons-local-port>]  [-r <ons-remote-port>] [-t <host>[:<port>][,<host>[:<port>]...]] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__340, USAGE_MODIFY_EONS, "Usage: srvctl modify eons [-p <portnum>] [-m <multicast-ip-address>] [-e <eons-listen-port>] [-v]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__341, USAGE_CONFIG_ONS, "Usage: srvctl config ons"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__342, USAGE_CONFIG_EONS, "Usage: srvctl config eons"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__343, ENABLE_SIHA_ONS_PURPOSE, "\nEnable the ONS for management by Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__344, ENABLE_SIHA_EONS_PURPOSE, "\nEnable the eONS for management by Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__345, DISABLE_SIHA_ONS_PURPOSE, "\nDisable the ONS from Oracle Restart management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__346, DISABLE_SIHA_EONS_PURPOSE, "\nDisable the eONS from Oracle Restart management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__347, START_SIHA_ONS_PURPOSE, "\nStarts the ONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__348, START_SIHA_EONS_PURPOSE, "\nStarts the eONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__349, STOP_SIHA_ONS_PURPOSE, "\nStop the ONS daemon running or in starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__350, STOP_SIHA_EONS_PURPOSE, "\nStop the eONS daemon running or in starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__351, STATUS_ONS_PURPOSE, "\nDisplay the current state of the ONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__352, STATUS_EONS_PURPOSE, "\nDisplay the current state of the eONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__353, ADD_ONS_PURPOSE, "\nAdds an ONS to be managed by Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__354, ADD_EONS_PURPOSE, "\nAdds an eONS to be managed by Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__355, REMOVE_ONS_PURPOSE, "\nRemoves the ONS daemon configured from Oracle Restart.\n"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
__356, REMOVE_EONS_PURPOSE, "\nRemoves the eONS daemon configured from Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__357, MODIFY_ONS_PURPOSE, "\nModifies the local, remote or the host:port list of the ONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__358, MODIFY_EONS_PURPOSE, "\nModifies the multicast IP address or port of the eONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__359, CONFIG_ONS_PURPOSE, "\nDisplays the current configuration information for ONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__360, CONFIG_EONS_PURPOSE, "\nDisplays the current configuration information for eONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__361, USAGE_ENABLE_GNS, "Usage: srvctl enable gns [-v] [-n <node_name>]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__362, USAGE_DISABLE_GNS, "Usage: srvctl disable gns [-v] [-n <node_name>]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__363, USAGE_START_GNS, "Usage: srvctl start gns [-v] [-l <log_level>] [-n <node_name>]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__364, USAGE_STOP_GNS, "Usage: srvctl stop gns [-v] [-n <node_name>] [-f]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__365, USAGE_RELOCATE_GNS, "Usage: srvctl relocate gns [-v] [-n <node_name>] [-f]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__366, USAGE_STATUS_GNS, "Usage: srvctl status gns -n <node_name>"
// *Document: NO
//  *Cause: 
// *Action: 
/
__367, USAGE_REMOVE_GNS, "Usage: srvctl remove gns [-f] [-d <domain_name>]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__368, USAGE_MODIFY_GNS, "srvctl modify gns [-v] [-f] [-l <log_level>] [-d <domain>] [-i <ip_address>] [-N <name> -A <address>] [-D <name> -A <address>] [-c <name> -a <alias>] [-u <alias>] [-r <address>] [-V <name>] [-F <forwarded_domains>] [-R <refused_domains>] [-X <excluded_interfaces>]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__369, USAGE_CONFIG_GNS, "Usage: srvctl config gns [-v] [-a] [-d] [-k] [-m] [-n <node_name>] [-p] [-s] [-V]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__370, USAGE_ADD_GNS, "Usage: srvctl add gns [-v] -d <domain> -i <vip_name|ip> [-k <network_number> [-S <subnet>/<netmask>[/<interface>]]]"
// *Document: NO
//  *Cause:
// *Action:
/
__371, GNS_NO_MODIFY_OPTION, "No option specified for \"modify gns\""
//  *Cause: No option was specified for the \"modify gns\" command.
// *Action: Specify at least one option.
/
__372, GNS_MODIFY_REQ_OPTION_NOT_SPECIFIED, "The \"-{0}\" option requires the specification of the \"-{1}\" option."
//  *Cause: An option was specified which requires that another option to be
//          specified at the same time.
// *Action: Specify the required option.
/
__373, GNS_INVALID_ADDRESS, "Invalid host name or address: \"{0}\"."
//  *Cause: The host name or address specified for the address on which GNS is
//          to listen was not valid.
// *Action: Specify a valid host name or IP address. If an IP address is used,
//          it must be one of the following:
//          1. A valid IPv4 address (N.N.N.N);
//          2. A valid IPv6 address (N[:N]*).
/
__374, GNS_INCOMPATIBLE_OPTIONS, "The \"-{0}\" option may not be used with the \"-{1}\" option."
//  *Cause: The two options may not be used together.
// *Action: Run srvctl with each option specified separately.
/
__375, GNS_MODIFY_NO_OPTION_SPECIFIED, "No option was specified for the GNS \"modify\" command."
//  *Cause: An option was not specified for the modify command.
// *Action: Specify an option.
/
__376, CONFIG_GNS_PURPOSE, "\nDisplays the configuration information for the GNS daemon.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__377, GNS_MODIFY_EITHER_OPTION_NOT_SPECIFIED, "The \"-{0}\" option requires the specification of either the \"-{1}\" or the \"-{2}\" option."
//  *Cause: An option was specified which requires that one of the other
//          possible options to be specified at the same time.
// *Action: Specify the one of the other options.
/
__378, GNS_MODIFY_BOTH_OPTIONS_NOT_ALLOWED, "Both \"-{0}\" and \"-{1}\" options may not be specified with the \"-{2}\" option."
//  *Cause: An invalid combination of options was specified.
// *Action: Specify only one of the other possible options.
/
__379, GNS_MODIFY_NO_OPTION_BESIDES_D, "Another option must be specified for the GNS \"modify\" command in addition to \"-d\"."
// *Cause: One other option must be specified for the modify command other
//  than -d.
// *Action: Specify another option besides "-d".
/
__380, GNS_MODIFY_ONLY_L_ALLOWED, "No other option is allowed when the \"-l\" option is specified."
// *Cause:  If the "-l" option is specified, no other option may be given.
// *Action: Only specify the "-l" option.
/
__381, SIDB_MODIFY_REQ_G_X, "Both \"-g\" and \"-x\" options are required to set server pool {0} for single instance database {1} on the cluster."
// *Cause:  Option "-x" is not specified in 'srvctl modify database' command for a single instance database on the cluster. 
// *Action: Specify both -g and -x options in 'srvctl modify database' and retry.
/
__382, INVALID_SG_CS_FOR_SI_DB, "The number of candidate servers {0} in server pool {1} should be one for single instance database {2}"
// *Cause:  The server pool specified in 'srvctl modify database' command for a single instance database contains more than 1 candidate servers. 
// *Action: Either modify the given server pool via 'srvctl modify srvpool' command to have only one candidate server specified via -x argument or specify another server pool that contains only one candidate server specified via -x argument.
/
__390, DEFINE_GNS_CONFIG_SUBDOMAIN, "    -d                       Display subdomain served by GNS"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__391, DEFINE_GNS_CONFIG_NETWORK, "    -k                       Display network on which GNS is listening"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__392, DEFINE_GNS_CONFIG_MULTICAST_PORT, "    -m                       Display the port on which the GNS daemon is listening for multicast requests"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__393, DEFINE_GNS_CONFIG_NODE_NAME, "    -n <node_name>           Display the configuration information for GNS on the specified node."
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__394, DEFINE_GNS_CONFIG_BRIDGE_PORT, "    -p                       Display the port which the GNS daemon uses to communicate with the DNS server."
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__395, DEFINE_GNS_CONFIG_STATUS, "    -s                       Display the status of GNS"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__396, DEFINE_GNS_CONFIG_VERSION, "    -V                       Display the version of GNS"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__397, DEFINE_GNS_REMOVE_ADVERTISEMENT, "    -D <name> -A <address> Remove the advertisement of a name and its address from GNS."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
__420, USAGE_START_SIHOME, "Usage: srvctl start home -o <oracle_home> -s <state_file>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__421, USAGE_STOP_SIHOME, "Usage: srvctl stop home -o <oracle_home> -s <state_file> [-t <stop_options>] [-f]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__422, USAGE_STAT_SIHOME, "Usage: srvctl status home -o <oracle_home> -s <state_file>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__423, ADD_SRVPOOL_PURPOSE, "\nAdds a server pool to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__424, CONFIG_SRVPOOL_PURPOSE, "\nDisplays the configuration for the server pool.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__425, MODIFY_SRVPOOL_PURPOSE, "\nModifies the configuration for the server pool.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__426, RELOCATE_SERVER_PURPOSE, "\nRelocates the servers to a server pool in the cluster.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__427, REMOVE_SRVPOOL_PURPOSE, "\nRemoves the server pool for the cluster.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__428, STATUS_SRVPOOL_PURPOSE, "\nDisplays the current state of the server pool.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__429, ADD_GNS_PURPOSE, "\nAdds GNS configuration to the specified domain.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
//__430, CONFIG_GNS_PURPOSE, Already defined in message __376
////  *Document: No
////  *Cause: Status message
//// *Action: Not an error
///
__431, DISABLE_GNS_PURPOSE, "\nDisables GNS from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__432, ENABLE_GNS_PURPOSE, "\nEnables GNS for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__433, MODIFY_GNS_PURPOSE, "\nModifies the configuration for GNS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__434, RELOCATE_GNS_PURPOSE, "\nTemporarily relocates GNS from one node of the cluster to another.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__435, REMOVE_GNS_PURPOSE, "\nRemoves GNS for the cluster.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__436, START_GNS_PURPOSE, "\nStarts GNS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__437, STATUS_GNS_PURPOSE, "\nDisplays the current state of GNS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__438, STOP_GNS_PURPOSE, "\nStops GNS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__439, ADD_FS_PURPOSE, "\nAdds the file system configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__440, CONFIG_FS_PURPOSE, "\nDisplays the configuration for the file system.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__441, DISABLE_FS_PURPOSE, "\nDisables the file system from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__442, ENABLE_FS_PURPOSE, "\nEnables the file system for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__443, MODIFY_FS_PURPOSE, "\nModifies the configuration for the file system.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__444, REMOVE_FS_PURPOSE, "\nRemoves the file system from the cluster.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__445, START_FS_PURPOSE, "\nStarts (mounts) the file system.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__446, STATUS_FS_PURPOSE, "\nDisplays the current state of the file system.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__447, STOP_FS_PURPOSE, "\nStops (unmounts) the file system.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__448, ADD_DB_PURPOSE, "\nAdds a database configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__449, CONFIG_DB_PURPOSE, "\nDisplays the configuration for the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__450, START_DB_PURPOSE, "\nStarts the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__451, STOP_DB_PURPOSE, "\nStops the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__452, STAT_DB_PURPOSE, "\nDisplays the current state of the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__453, ENABLE_DB_PURPOSE, "\nEnables the database for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__454, DISABLE_DB_PURPOSE, "\nDisables the database from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__455, MODIFY_DB_PURPOSE, "\nModifies the configuration for the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__456, REMOVE_DB_PURPOSE, "\nRemoves the database from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__457, GETENV_DB_PURPOSE, "\nGets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__458, SETENV_DB_PURPOSE, "\nSets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__459, UNSETENV_DB_PURPOSE, "\nUnsets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__460, ADD_SI_DB_PURPOSE, "\nAdds a database configuration to be managed by Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__461, CONFIG_SI_DB_PURPOSE, "\nDisplays the configuration for the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__462, START_SI_DB_PURPOSE, "\nStarts the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__463, STOP_SI_DB_PURPOSE, "\nStops the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__464, STAT_SI_DB_PURPOSE, "\nDisplays the current state of the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__465, ENABLE_SI_DB_PURPOSE, "\nEnables the database for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__466, DISABLE_SI_DB_PURPOSE, "\nDisables the database from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__467, MODIFY_SI_DB_PURPOSE, "\nModifies the configuration for the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__468, REMOVE_SI_DB_PURPOSE, "\nRemoves the database from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__469, GETENV_SI_DB_PURPOSE, "\nGets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__470, SETENV_SI_DB_PURPOSE, "\nSets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__471, UNSETENV_SI_DB_PURPOSE, "\nUnsets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__472, ADD_INST_PURPOSE, "\nAdds a database instance configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__473, START_INST_PURPOSE, "\nStarts the database instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__474, STOP_INST_PURPOSE, "\nStops the database instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__475,STAT_INST_PURPOSE, "\nDisplays the current state of the database instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__476, ENABLE_INST_PURPOSE, "\nEnables the database instance for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__477, DISABLE_INST_PURPOSE, "\nDisable the database instance from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__478, MODIFY_INST_PURPOSE, "\nFor administrator-managed databases, changes the node on which an instance runs.\nFor policy-managed databases, specifies an instance name to use when the database runs on the given node.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__479, REMOVE_INST_PURPOSE, "\nRemoves the database instance from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__480, ADD_SERV_PURPOSE, "\nAdds a service configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__481, CONFIG_SERV_PURPOSE, "\nDisplays the configuration for the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__482, ENABLE_SERV_PURPOSE, "\nEnables the database for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__483, DISABLE_SERV_PURPOSE, "\nDisables the service from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__484, MODIFY_SERV_PURPOSE, "\nModifies the configuration for the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__485, RELOCATE_SERV_PURPOSE, "\nTemporarily relocates service from one node of the cluster to another.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__486, REMOVE_SERV_PURPOSE, "\nRemoves the service from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__487, START_SERV_PURPOSE, "\nStarts the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__488, STOP_SERV_PURPOSE, "\nStops the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__489, STAT_SERV_PURPOSE, "\nDisplays the current state of the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__490, ADD_SI_SERV_PURPOSE, "\nAdds a service configuration to be managed by Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__491, CONFIG_SI_SERV_PURPOSE, "\nDisplays the configuration for the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__492, ENABLE_SI_SERV_PURPOSE, "\nEnables the database for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__493, DISABLE_SI_SERV_PURPOSE, "\nDisables the service from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__494, MODIFY_SI_SERV_PURPOSE, "\nModifies the configuration for the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__495, REMOVE_SI_SERV_PURPOSE, "\nRemoves the service from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__496, START_SI_SERV_PURPOSE, "\nStarts the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__497, STOP_SI_SERV_PURPOSE, "\nStops the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__521, ADD_ASM_PURPOSE, "\nAdds an ASM configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__522, CONFIG_ASM_PURPOSE, "\nDisplays the configuration for ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__523, STAT_ASM_PURPOSE, "\nDisplays the current state of ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__524, ENABLE_ASM_PURPOSE, "\nEnables ASM for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__525, DISABLE_ASM_PURPOSE, "\nDisables ASM for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__526, MODIFY_ASM_PURPOSE, "\nModifies the configuration for ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__527, REMOVE_ASM_PURPOSE, "\nRemoves ASM from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__528, GETENV_ASM_PURPOSE, "\nGets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__529, SETENV_ASM_PURPOSE, "\nSets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__530, UNSETENV_ASM_PURPOSE, "\nUnsets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__531, START_ASM_PURPOSE, "\nStarts ASM instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__532, STOP_ASM_PURPOSE, "\nStops ASM instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__533, ADD_SI_ASM_PURPOSE, "\nAdds an ASM configuration to be managed by Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__534, CONFIG_SI_ASM_PURPOSE, "\nDisplays the configuration for ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__535, STAT_SI_ASM_PURPOSE, "\nDisplays the current state of ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__536, ENABLE_SI_ASM_PURPOSE, "\nEnables ASM for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__537, DISABLE_SI_ASM_PURPOSE, "\nDisables ASM for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__538, MODIFY_SI_ASM_PURPOSE, "\nModifies the configuration for ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__539, REMOVE_SI_ASM_PURPOSE, "\nRemoves ASM from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__540, GETENV_SI_ASM_PURPOSE, "\nGets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__541, SETENV_SI_ASM_PURPOSE, "\nSets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__542, UNSETENV_SI_ASM_PURPOSE, "\nUnsets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__543, START_SI_ASM_PURPOSE, "\nStarts ASM instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__544, STOP_SI_ASM_PURPOSE, "\nStops ASM instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__561, START_DISKGROUP_PURPOSE, "\nStarts the diskgroup, causing ASM to mount it.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__562, STOP_DISKGROUP_PURPOSE, "\nStops the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__563, STAT_DISKGROUP_PURPOSE, "\nDisplays the current state of the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__564, ENABLE_DISKGROUP_PURPOSE, "\nEnables the diskgroup for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__565, DISABLE_DISKGROUP_PURPOSE, "\nDisables the diskgroup from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__566, REMOVE_DISKGROUP_PURPOSE, "\nRemoves the diskgroup from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__567, START_SI_DISKGROUP_PURPOSE, "\nStarts the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__568, STOP_SI_DISKGROUP_PURPOSE, "\nStops the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__569, STAT_SI_DISKGROUP_PURPOSE, "\nDisplays the current state of the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__570, ENABLE_SI_DISKGROUP_PURPOSE, "\nEnables the diskgroup for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__571, DISABLE_SI_DISKGROUP_PURPOSE, "\nDisables the diskgroup from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__572, REMOVE_SI_DISKGROUP_PURPOSE, "\nRemoves the diskgroup from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__591, START_HOME_PURPOSE, "\nStarts all Oracle clusterware resources that run from the Oracle home.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__592, STOP_HOME_PURPOSE, "\nStops all Oracle clusterware resources that run from the Oracle home.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__593, STAT_HOME_PURPOSE, "\nDisplays the current state of of all resources for the Oracle home.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__594, START_SI_HOME_PURPOSE, "\nStarts all resources that run from the Oracle Home for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__595, STOP_SI_HOME_PURPOSE, "\nStops all resources that run from the Oracle home for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__596, STAT_SI_HOME_PURPOSE, "\nDisplays the current state of all resources for the Oracle home.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__611, ADD_LISTENER_PURPOSE, "\nAdds a listener configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__612, CONFIG_LISTENER_PURPOSE, "\nDisplays the configuration for the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__613, START_LISTENER_PURPOSE, "\nStarts the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__614, STOP_LISTENER_PURPOSE, "\nStops the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__615, ENABLE_LISTENER_PURPOSE, "\nEnables the listener for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__616, DISABLE_LISTENER_PURPOSE, "\nDisables the listener from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__617, MODIFY_LISTENER_PURPOSE, "\nModifies the configuration for the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__618, REMOVE_LISTENER_PURPOSE, "\nRemoves the listener from Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__619, GETENV_LISTENER_PURPOSE, "\nGets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__620, SETENV_LISTENER_PURPOSE, "\nSets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__621, UNSETENV_LISTENER_PURPOSE, "\nUnsets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__622, STAT_LISTENER_PURPOSE, "\nDisplays the current state of the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__641, ADD_SI_LISTENER_PURPOSE, "\nAdds a listener configuration to be managed by Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__642, CONFIG_SI_LISTENER_PURPOSE, "\nDisplays the configuration for the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__643, START_SI_LISTENER_PURPOSE, "\nStarts the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__644, STOP_SI_LISTENER_PURPOSE, "\nStops the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__645, ENABLE_SI_LISTENER_PURPOSE, "\nEnables the listener for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__646, DISABLE_SI_LISTENER_PURPOSE, "\nDisables the listener from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__647, MODIFY_SI_LISTENER_PURPOSE, "\nModifies the configuration for the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__648, REMOVE_SI_LISTENER_PURPOSE, "\nRemoves the listener from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__649, GETENV_SI_LISTENER_PURPOSE, "\nGets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__650, SETENV_SI_LISTENER_PURPOSE, "\nSets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__651, UNSETENV_SI_LISTENER_PURPOSE, "\nUnsets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__652, STAT_SI_LISTENER_PURPOSE, "\nDisplays the current state of the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__653, STATUS_SERVER_PURPOSE, "\nDisplays the current state of the given server(s).\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__654, DB_START_INST_NO_OPT, "Dummy message line"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/

