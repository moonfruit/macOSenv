// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrvfMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     kfgriffi    06/18/09 - Remove extra ocr string
//     nvira       06/10/09 - add message for ASM device check
//     nvira       06/08/09 - add messages to check olr and ocr integrity
//     yizhang     05/28/09 - fix messages
//     spavan      05/22/09 - inform about CTSS options in NTP messages
//     spavan      05/14/09 - fix bug7171352 - add messages for GPNP checks
//     spavan      05/11/09 - fix bug7171352 - Add GNS related Messages
//     kfgriffi    05/11/09 - Add SCAN name service messages.
//     shmubeen    05/10/09 - add messages for consistency check core file name
//                            pattern
//     spavan      05/06/09 - added message when fixup cannot be generated for group/user fixups
//     kfgriffi    05/05/09 - Add pinned/notpinned messages
//     nvira       05/03/09 - add message for architecture assert
//     shmubeen    04/29/09 - changing task's description - bug# 8418926
//     sravindh    05/02/09 - Add TASK_CTSS_NTP_ONLY_START as dummy to prevent
//                            break of lang compiles
//     kfgriffi    04/30/09 - Add hosts file check messages
//     shmubeen    04/29/09 - changing task's description - bug# 8418926
//     sravindh    04/26/09 - Put back recently removed messages to not break
//                            lang compiles
//     nvira       04/26/09 - add message for multiple package
//     narbalas    04/22/09 - Added messages for umask check
//     nvira       04/22/09 - add messages for ocr on asm
//     kfgriffi    04/13/09 - Add Found/Expected strings
//     kfgriffi    04/08/09 - Add NodeAdd checkSetup failure message.
//     shmubeen    04/03/09 - adding messages for time zone uniformity check
//     spavan      04/01/09 - fix bug8220859 - Remove refnode txt
//     nvira       03/26/09 - add message for ocr olr integrity
//     kfgriffi    03/25/09 - Add access permissions messages
//     spavan      03/21/09 - bug7717034 - USM need not be lightweight
//     nvira       03/16/09 - add message for run level assert
//     shmubeen    03/09/09 - bug# 8309339 - change USM to ACFS (ASM Cluster
//                            File System)
//     kfgriffi    03/03/09 - Add node add/del parameter error msg
//     nvira       02/25/09 - add message for element display name
//     spavan      02/24/09 - fix bug7288162 - Check if user is not part of
//                            root user group
//     kfgriffi    02/18/09 - Add shared/identical path message
//     kfgriffi    02/14/09 - Update cause/action usage
//     kfgriffi    02/11/09 - Update HA messages
//     shmubeen    01/27/09 - add cause and action for 7700
//     nvira       01/27/09 - add message for no shared storage discovery
//     shmubeen    01/13/09 - Add messages for kernel version inconsistency.
//     kfgriffi    01/13/09 - Add rest of cause/action messages.
//     spavan      01/13/09 - fix bug7704131 update message
//     spavan      01/12/09 - fix bug7583878 - add cause/action for USM checks
//     nvira       01/09/09 - add message cause and action
//     dsaggi      01/08/09 - add message for invalid variable setting
//     dsaggi      01/06/09 - add messages for ocr and voting sharedness checks
//     dsaggi      12/31/08 - add messages for current group checks
//     spavan      12/18/08 - fix bug7649004 - add message
//     dsaggi      12/17/08 - add message for HA not found configured.
//     nvira       12/03/08 - add message for mount option mismatch
//     nvira       11/10/08 - add messages for binary matching
//     sravindh    11/17/08 - Add messages for udev
//     nvira       11/21/08 - add messages for comp health
//     kfgriffi    11/18/08 - Add NOT to voting disk warning message
//     kfgriffi    11/12/08 - Rename TASK_VOTEDISK_CRS_VER to TASK_CRS_VER
//     kfgriffi    11/06/08 - Update MTU messages
//     spavan      10/23/08 - fix bug7497300
//     nvira       10/14/08 - add message for kernel param step check
//     nvira       10/10/08 - add message for the generic pre req file not set
//     sravindh    10/02/08 - Add msg for GenericUtil
//     kfgriffi    10/02/08 - Update TaskNodeAdd messages.
//     sravindh    10/01/08 - Fix syntax
//     shmubeen    09/25/08 - Bug 5095460, add msg for multiple uid check
//     kfgriffi    09/25/08 - Add Vote Disk CRS version error
//     sravindh    09/22/08 - Fix typos
//     sravindh    09/19/08 - Bug 7143459
//     kfgriffi    09/08/08 - Add OCR device warnings
//     sravindh    07/30/08 - Review comments
//     sravindh    07/29/08 - Bug 7291839
//     nvira       07/22/08 - add constants for Service Pack & Patch
//     sravindh    07/21/08 - Review comments
//     sravindh    07/18/08 - Bug 5727652
//     kfgriffi    07/14/08 - Add Voting Disk messages
//     sravindh    07/08/08 - Add messags for SpaceConstraint
//     sravindh    07/25/08 - Task Udev messages
//     nvira       04/25/08 - add message for TaskSoftware
//     sravindh    05/08/08 - Add message for -noctss
//     kfgriffi    05/08/08 - Fix message ID for CRS_SOFTWARE_VERSION_CHECK
//     kfgriffi    05/07/08 - Add Trace file warning message
//     sravindh    04/30/08 - Fix bug 6157099
//     dsaggi      04/16/08 - add inventory file pointer message
//     kfgriffi    04/16/08 - Fix bug 6912906
//     kfgriffi    04/11/08 - Update TASK_SCAN_WARN message
//     sravindh    04/02/08 - CTSS component
//     dsaggi      03/20/08 - add -fixup option
//     kfgriffi    03/20/08 - Add CRS software version message
//     sravindh    03/17/08 - Review comments
//     sravindh    03/14/08 - Modify MTU fail message
//     kfgriffi    03/10/08 - Add cause/action messages for Node
//                            reach/connectivity
//     sravindh    03/06/08 - Fix NTP message
//     sravindh    02/29/08 - Messages for NTP check
//     dsaggi      02/28/08 - add ohasd check
//     sravindh    02/22/08 - Correct typos
//     sravindh    02/22/08 - Messages for ASM component
//     sravindh    02/11/08 - Add Invalid platform message
//     kfgriffi    01/29/08 - Add node delete nodeapp message
//     kfgriffi    01/18/08 - Fix Spelling error
//     dsaggi      01/11/08 - fix 6367272 - verify consistency of user id
//     sravindh    12/17/07 - Add messages for USM dev permissions check
//     kfgriffi    12/14/07 - Add SCAN messages
//     sravindh    12/11/07 - Add messages for USM post-checks
//     dsaggi      12/05/07 - add messages for gpnp and gns components
//     sravindh    12/03/07 - Review comments
//     sravindh    12/01/07 - Add USM component
//     sravindh    11/12/07 - Additions for ASM checks
//     nvira       11/01/07 - update cli messages
//     sravindh    10/18/07 - Add entries for USM checks
//     nvira       10/22/07 - add messages for stage cutover
//     kfgriffi    10/12/07 - Add TCP communication messages
//     nvira       10/08/07 - review comments
//     dsaggi      09/28/07 - add messages for DB config checks
//     nvira       09/25/07 - add messages for software verification
//     kfgriffi    08/15/07 - Add gateway warning message
//     nvira       08/15/07 - update size related messages
//     nvira       07/30/07 - review comments
//     nvira       07/17/07 - add message TASK_CFS_LNX_CONF_NOT_ON_NODE
//     kfgriffi    06/29/07 - Add Node add/del stage messages
//     dsaggi      07/19/07 - add fixup messages
//     dsaggi      05/25/07 - add operating system and reference data related
//                            messages
//     kfgriffi    09/12/06 - Add network interface info
//     nvira       04/17/07 - review comments
//     nvira       04/13/07 - add message for shell limit task
//     nvira       04/10/07 - add message for shell limit task
//     kfgriffi    04/04/07 - Add ContainerFreeSpace
//     nvira       04/12/07 - change message for CDM_INVLD_RANGE_EQ_USAGE
//     dsaggi      03/29/07 - add messages for swap size verification
//     dsaggi      04/08/07 - messages for OCR,CRS APIs
//     nvira       04/05/07 - range of value messages
//     nvira       04/02/07 - range of value messages
//     nvira       03/13/07 - Add new message for file desc & max process.
//                            Parameterize existing message to display values
//     kfgriffi    03/19/07 - Add process alive
//     dsaggi      03/22/07 - add messages for group membership check
//     kfgriffi    03/02/07 - Add Available memory message
//     kfgriffi    03/08/07 - Add Runlevel message
//     kfgriffi    03/02/07 - Add Available memory message
//     dsaggi      03/08/07 - XbranchMerge dsaggi_add-ocfs2-support from
//                            st_has_11.1
//     dsaggi      02/16/07 - add messages for command execution API
//     dsaggi      02/11/07 - XbranchMerge dsaggi_add-messages from st_has_11.1
//     dsaggi      01/31/07 - Add messages for new tasks
//     kfgriffi    01/11/07 - Add SIHA messages/ID's
//     dsaggi      01/10/07 - add messages for shared storage check APIs
//     kfgriffi    11/27/06 - Add Node Connectivity API work.
//     dsaggi      11/13/06 - Add messages for new prereq tasks
//     rajkris     10/27/06 - Bug fix 5600831
//     rajkris     10/27/06 -
//     kfgriffi    11/01/06 - Add NodeReachability API msg's
//     dsaggi      09/18/06 - support for framework's API mode
//     rajkris     08/18/06 - NFS enhancements for bug 5084541
//     kfgriffi    08/04/06 - Add resource name error messages
//     dsaggi      05/31/06 - fix bug-5229890: Correct the message for
//                            TASK_OCR_EXPECTED_OCR_VERSION
//     mnijasur    02/17/06 - fix 4358826 - fix typo
//     dsaggi      05/13/05 - add versioning
//     smishra     04/21/05 - added generic,CRS and RSH/RCP
//     bhamadan    04/07/05 - bug-4280050
//     smishra     03/31/05 - Copyright msg added
//     dsaggi      03/31/05 - add ERROR_CHECK_ORACLE_HOME_EXIST
//     dsaggi      03/22/05 - add messages for task summaries
//     smishra     03/02/05 - generic failure msg changed
//     smishra     03/10/05 - File not found msg added
//     jywang      03/07/05 - bhamadan using june's txn
//     bhamadan    02/22/05 - changing StorageType Message
//     bhamadan    02/22/05 - adding SUMMARY_TASK_SSA
//     bhamadan    02/08/05 - adding NO_PUBLIC_SUBNET,NO_PRIVATE_SUBNET
//     bhamadan    02/08/05 - changing NO_NETWORK_INTERFACE_INFO
//     smishra     12/27/04 - nodeapp desc modified to add nodelist
//     bhamadan    12/22/04 - adding args to OCFS_NEEDS_UPGRADE,DISK_EXE_REQUIRED
//     smishra     12/17/04 - clumgr msg modified
//     bhamadan    12/14/04 - adding EXE_NOT_FOUND_MSG
//     bhamadan    12/03/04 - adding DISK_EXE_REQUIRED
//     smishra     11/18/04 - Error text modified
//     smishra     11/10/04 - OCR msg modified
//     dsaggi      11/09/04 - add ocr integrity related messages
//     smishra     11/09/04 - Refnode vs refnode msg added
//     bhamadan    11/08/04 - adding NonSharedFileSystem error
//     bhamadan    11/08/04 - adding STORAGE_TYPE_NOT_SUPPORTED
//     bhamadan    11/08/04 - adding FAILED_NODE_REACH_ALL
//     smishra     11/02/04 - peer msg added
//     dsaggi      11/01/04 - Fix bug#3984293
//     smishra     10/31/04 - kernel version msg added
//     bhamadan    10/28/04 - bug-3973596
//     bhamadan    11/01/04 - adding OCFS_NEEDS_UPGRADE
//     dsaggi      10/13/04 - Add NodeApp related messages
//     smishra     10/06/04 - reg key related msg added
//     smishra     10/01/04 - local node not found msg added
//     smishra     09/29/04 - Linux CFS msg added
//     bhamadan    09/27/04 - adding FAIL_NETWORK_OPERATION
//     smishra     09/23/04 - removed unused msgs
//     smishra     09/22/04 - CFSDrive related msg modified
//     dsaggi      08/09/04 -
//     smishra     08/09/04 - Modified partially suc msgs
//     dsaggi      08/06/04 - modify task related messages
//     smishra     07/29/04 - header & footer messages added
//     smishra     08/04/04 - node app messages added
//     smishra     07/23/04 - header 'applied' added
//     smishra     07/13/04 - constants added
//     smishra     07/02/04 - cfs msg added
//     dsaggi      06/20/04 - more reachability messages
//     dsaggi      06/04/04 - dsaggi_fix_nls
//     smishra     06/03/04 - More review comments
//     dsaggi      06/03/04 - modify based on review comments
//     dsaggi      06/01/04 - Add more messages for report & tasks
//     smishra     06/01/04 - util,config messges added
//     smishra     05/28/04 - task related text added
//     dsaggi      05/26/04 - add stage & task messages
//     dsaggi      05/25/04 - Add messages
//     dsaggi      05/25/04 - Creation
//  */
//
// PACKAGE=package oracle.ops.verification.resources;
// MSGIDTYPE=interface
0001, ERROR_NODELIST_NOT_FOUND, "Could not retrieve static nodelist. Verification cannot proceed"
//  *Cause: Error running lsnodes/olsnodes.
// *Action: Ensure that the executable exists and that it is executable by your OS userid.
/
0002, ERROR_LOCAL_NODENAME_NOT_FOUND, "Could not retrieve local nodename"
//  *Cause: Unable to determine local host name using Java network functions.
// *Action: Ensure hostname is defined correctly using the 'hostname' command.
/
0004, TEXT_COPYRIGHT, "Oracle Cluster Verification Utility"
// *Document: NO
//  *Cause:
// *Action:
/
0006, ERROR_CHECK_ORACLE_HOME_EXIST, "Unable to check the existence of Oracle Home \"{0}\""
//  *Cause: Could not verify the existence of the Oracle Home specified.
// *Action: Ensure the Oracle Home location exists and is writeable by your user ID.
/
0007, STOP_VERIFICATION, "Verification cannot proceed"
// *Document: NO
//  *Cause:
// *Action:
/
0008, LIMITED_VERIFICATION, "Verification will proceed with nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
0009, LIMITED_VERIFICATION_ON_LOCAL, "Verification will proceed on the local node"
// *Document: NO
//  *Cause:
// *Action:
/
0010, OUIINV_CRS_ALREADY_INSTALLED, "CRS is already installed on nodes:"
//  *Cause:
// *Action:
/
0011, OUIINV_CRS_ALREADY_INST_LOCAL, "CRS is already installed on the local node"
//  *Cause:
// *Action:
/
0012, OUIINV_MISMATCH_NODES, "Oracle inventory on the local node did not match with the inventory on these nodes:"
//  *Cause:
// *Action:
/
0013, OUIINV_MISMATCH_OH_NODES, "Oracle inventory for \"{0}\" on the local node did not match with the inventory on these nodes:"
//  *Cause:
// *Action:
/
0014, OUIINV_CRSHOME_MISSING, "CRS home is missing from the inventory on these nodes:"
//  *Cause:
// *Action:
/
0015, OUIINV_THIS_CRSHOME_MISSING, "CRS home \"{0}\" is missing from the inventory on these nodes:"
//  *Cause:
// *Action:
/
0016, OUIINV_ORAHOME_MISSING_NODES, "Oracle home \"{0}\" is missing from the inventory on these nodes:"
//  *Cause:
// *Action:
/
0017, OUIINV_LOCATION_MISMATCH, "Oracle inventory location on the local node did not match with the inventory location on these nodes:"
//  *Cause:
// *Action:
/
0020, NOT_WRITABLE, "\"{0}\" is not writeable"
//  *Cause: The path specified is not writeable.
// *Action: Ensure write access to the path specified.
/
0021, OUIINV_NODELIST_IN_OH_MATCHED, "Oracle inventory node list for \"{0}\" matched"
//  *Cause:
// *Action:
/
0022, OUIINV_NODELIST_IN_OH_MISMATCHED, "Oracle inventory node list for \"{0}\" did not match"
//  *Cause:
// *Action:
/
0023, OUIINV_INVENTORY_LOC, "Checking Oracle inventory location..."
//  *Cause:
// *Action:
/
0024, OUIINV_INVENTORY_LOC_MATCHED, "Oracle inventory location matched"
//  *Cause:
// *Action:
/
0025, OUIINV_INVENTORY_LOC_MISMATCHED, "Oracle inventory location did not match"
//  *Cause:
// *Action:
/
0026, OUIINV_ORAINV_GROUP, "Checking Oracle inventory group..."
//  *Cause:
// *Action:
/
0027, OUIINV_ORAINV_MATCHED, "Oracle inventory group matched"
//  *Cause:
// *Action:
/
0028, OUIINV_ORAINV_MISMATCHED, "Oracle inventory group did not match"
//  *Cause:
// *Action:
/
0029, NOT_EXIST, "\"{0}\" does not exist"
//  *Cause:
// *Action:
/
0030, NOT_EXIST_LOCAL_NOHDR_E, "\"{0}\" does not exist on the local node"
//  *Cause:
// *Action:
/
0031, NOT_EXIST_ALL_NODES, "\"{0}\" does not exist on all the nodes"
//  *Cause:
// *Action:
/
0032, NOT_EXIST_ON_NODES, "\"{0}\" does not exist on nodes:"
//  *Cause:
// *Action:
/
0034, NOT_WRITABLE_LOCAL_NODE, "\"{0}\" is not writeable on the local node"
//  *Cause:
// *Action:
/
0035, NOT_WRITABLE_ALL_NODES, "\"{0}\" is not writeable on all the nodes"
//  *Cause:
// *Action:
/
0036, NOT_WRITABLE_ON_NODES, "\"{0}\" is not writeable on nodes:"
//  *Cause:
// *Action:
/
0037, NOT_EXECUTABLE, "Unable to execute \"{0}\""
//  *Cause:
// *Action:
/
0038, NOT_EXECUTABLE_LOCAL_NODE, "Unable to execute \"{0}\" on the local node"
//  *Cause:
// *Action:
/
0039, NOT_EXECUTABLE_ALL_NODES, "Unable to execute \"{0}\" on all the nodes"
//  *Cause:
// *Action:
/
0040, NOT_EXIST_REMOTE_SHELL, "The Remote Shell \"{0}\" requested by the client does not exist"
//  *Cause: Could not locate remote shell requested by the user.
// *Action: Ensure that the remote shell exists on all the nodes participating in the operation.
/
0041, NOT_FILE_REMOTE_SHELL, "The Remote shell \"{0}\" requested by the client is not an executable file"
//  *Cause: The remote shell requested by the user is not a file.
// *Action: Ensure that the remote shell exists on all the nodes participating in the operation and that it is a file with execute permissions.
/
0042, NOT_EXIST_REMOTE_COPY, "The Remote Copy command \"{0}\" requested by the client does not exist"
//  *Cause: Cannot locate remote copy command requested by the user.
// *Action: Ensure that the remote copy command exists on all the nodes participating in the operation.
/
0043, NON_EXECUTABLE_REMOTE_SHELL, "Unable to execute the Remote Shell \"{0}\" requested by the client"
//  *Cause:
// *Action:
/
0044, NON_EXECUTABLE_REMOTE_COPY, "Unable to execute the Remote Copy command \"{0}\" requested by the client"
//  *Cause:
// *Action:
/
0045, NOT_EXIST_SECURE_SHELL, "The Secure Shell \"{0}\" requested by the client does not exist"
//  *Cause: Could not locate the secure shell executable specified.
// *Action: Ensure that the executable file specified exists.
/
0046, NOT_EXIST_SECURE_COPY, "The Secure Copy command \"{0}\" requested by the client does not exist"
//  *Cause: Could not locate the secure copy executable specified.
// *Action: Ensure that the executable file specified exists.
/
0047, NON_EXECUTABLE_SECURE_SHELL, "Unable to execute the Secure Shell \"{0}\" requested by the client"
//  *Cause: Could not execute the secure shell specified.
// *Action: Ensure that the secure shell specified allows execute access for the current user ID.
/
0048, NON_EXECUTABLE_SECURE_COPY, "Unable to execute the Secure Copy command \"{0}\" requested by the client"
//  *Cause: Could not execute the secure copy specified.
// *Action: Ensure that the secure copy specified allows execute access for the current user ID.
/
0049, OUIINV_ORAINV_GROUP_NOTFOUND, "Oracle inventory group could not be determined"
// *Document: NO
//  *Cause:
// *Action:
/
0050, COMMAND_EXECUTED_AND_OUTPUT, "The command executed was \"{0}\". The output from the command was \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
0051, NOT_FILE_REMOTE_COPY, "The Remote Copy command \"{0}\" requested by the client is not an executable file"
//  *Cause: The remote copy command requested by the user was not an executable file.
// *Action: Ensure that the remote copy command exists on all the nodes participating in the operation and that it is a file with execute permissions.
/
0052, FOUND_EQUAL, "Found="
// *Document: NO
//  *Cause:
// *Action:
/
0053, EXPECTED_EQUAL, "Expected="
// *Document: NO
//  *Cause:
// *Action:
/
1000, CONFIG_CHECK_TEMPLATE, "Check: {0} "
// *Document: NO
//  *Cause:
// *Action:
/
1001, CONFIG_PASSED_TEMPLATE, "{0} check passed"
// *Document: NO
//  *Cause:
// *Action:
/
1002, CONFIG_PASSED_FOR_TEMPLATE, "{0} check passed for \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
1003, CONFIG_FAILED_TEMPLATE, "{0} check failed"
// *Document: NO
//  *Cause:
// *Action:
/
1004, CONFIG_FAILED_FOR_TEMPLATE, "{0} check failed for \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
1005, CONFIG_PEER_CHECK_TEMPLATE, "Peer comparison: {0} "
// *Document: NO
//  *Cause:
// *Action:
/
1006, CONFIG_PEER_CHECK_FOR_TEMPLATE, "Peer comparison: {0} for \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
1007, CONFIG_PEER_COMPLETED_TEMPLATE, "COMMENT: {0} comparison completed"
// *Document: NO
//  *Cause:
// *Action:
/
1008, CONFIG_PEER_COMPLETED_FOR_TEMPLATE, "COMMENT: {0} comparison completed for \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
1009, CONFIG_PEER_REFNODE_CHECK_TEMPLATE, "Compatibility check: {0} [reference node: {1}]"
// *Document: NO
//  *Cause:
// *Action:
/
1010, CONFIG_PEER_REFNODE_CHECK_FOR_TEMPLATE, "Compatibility check: {0} for \"{1}\" [reference node: {2}]"
// *Document: NO
//  *Cause:
// *Action:
/
1011, CONFIG_CHECK_IN_TEMPLATE, "Check: {0} in \"{1}\" dir"
// *Document: NO
//  *Cause:
// *Action:
/
1012, CONFIG_CHECK_FOR_TEMPLATE, "Check: {0} for \"{1}\" "
// *Document: NO
//  *Cause:
// *Action:
/
1013, CONFIG_PEER_PASSED_TEMPLATE, "COMMENT: {0} comparison passed"
// *Document: NO
//  *Cause:
// *Action:
/
1014, CONFIG_PEER_FAILED_TEMPLATE, "COMMENT: {0} comparison failed"
// *Document: NO
//  *Cause:
// *Action:
/
1015, CONFIG_PEER_PASSED_FOR_TEMPLATE, "COMMENT: {0} comparison passed for \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
1016, CONFIG_PEER_FAILED_FOR_TEMPLATE, "COMMENT: {0} comparison failed for \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
1050, CONFIG_SYSARCH_TXT, "System architecture"
// *Document: NO
//  *Cause:
// *Action:
/
1051, CONFIG_DAEMON_ALIVENESS_TXT, "Daemon status"
// *Document: NO
//  *Cause:
// *Action:
/
1052, CONFIG_GROUP_TXT, "Group existence"
// *Document: NO
//  *Cause:
// *Action:
/
1053, CONFIG_OSPATCH_TXT, "Operating system patch"
// *Document: NO
//  *Cause:
// *Action:
/
1054, CONFIG_OSVER_TXT, "Operating system version"
// *Document: NO
//  *Cause:
// *Action:
/
1055, CONFIG_PACKAGE_TXT, "Package existence"
// *Document: NO
//  *Cause:
// *Action:
/
1056, CONFIG_SPACE_TXT, "Free disk space"
// *Document: NO
//  *Cause:
// *Action:
/
1057, CONFIG_SWAP_TXT, "Swap space"
// *Document: NO
//  *Cause:
// *Action:
/
1058, CONFIG_TOTALMEM_TXT, "Total memory"
// *Document: NO
//  *Cause:
// *Action:
/
1059, CONFIG_USER_TXT, "User existence"
// *Document: NO
//  *Cause:
// *Action:
/
1060, CONFIG_KERPARAM_TXT, "Kernel parameter"
// *Document: NO
//  *Cause:
// *Action:
/
1061, CONFIG_REGKEY_TXT, "Registry key"
// *Document: NO
//  *Cause:
// *Action:
/
1062, CONFIG_KRNVER_TXT, "Kernel version"
// *Document: NO
//  *Cause:
// *Action:
/
1063, CONFIG_AVAILMEM_TXT, "Available memory"
// *Document: NO
//  *Cause:
// *Action:
/
1064, CONFIG_RUNLEVEL_TXT, "Run level"
// *Document: NO
//  *Cause:
// *Action:
/
1065, CONFIG_GROUP_MEMBERSHIP_TXT, "Group membership"
// *Document: NO
//  *Cause:
// *Action:
/
1066, CONFIG_PROCALIVE_TXT, "Process alive"
// *Document: NO
//  *Cause:
// *Action:
/
1067, CONFIG_HARD_LIMITS_TXT, "Hard limits"
// *Document: NO
//  *Cause:
// *Action:
/
1068, CONFIG_SOFT_LIMITS_TXT, "Soft limits"
// *Document: NO
//  *Cause:
// *Action:
/
1069, CONFIG_HOSTS_FILE, "hosts file"
// *Document: NO
//  *Cause:
// *Action:
/
1070, CONFIG_DNSNIS, "DNS/NIS name lookup"
// *Document: NO
//  *Cause:
// *Action:
/
1071, CONFIG_DEF_UMASK, "Check default user file creation mask"
// *Document: NO
//  *Cause:
// *Action:
/
1072, UMASK_PASS_MSG, "Default user file creation mask check passed"
// *Document: NO
//  *Cause:
// *Action:
/
1073, UMASK_FAIL_MSG, "Default user file creation mask check failed"
// *Document: NO
//  *Cause:
// *Action:
/
1081, CDM_INVALID_TYPE, "Invalid type specified for constraint \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1082, CDM_INVALID_VALUE, "Invalid value specified for xml tag \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1083, CDM_INVALID_EXCL_VALUE, "Invalid exclude value specified in xml: \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1084, CDM_INVALID_MIN_VALUE, "Invalid minimum value specified in xml:  \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1085, CDM_INVALID_MAX_VALUE, "Invalid maximum value specified in xml:  \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1086, CDM_INVALID_UNITS, "Invalid units specified for XML tag \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1087, CDM_INVALID_MULTIPLE, "Invalid multiple value specified for XML tag \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1088, CDM_INVALID_VAR_STRING, "Invalid variable string specified in XML file"
// *Document: NO
//  *Cause:
// *Action:
/
1089, CDM_INVALID_SIZE, "Invalid size specificaion for XML tag \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1090, CDM_INVALID_GT_VALUE, "Invalid greater-than value speficed in XML: \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1091, CDM_INVALID_XML_SYNTAX, "Invalid XML syntax"
// *Document: NO
//  *Cause:
// *Action:
/
1092, CDM_INVALID_XML_ATTRIBUTE, "Invalid XML attribute specified for tag \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1093, CDM_INVALID_BOOL_VALUE, "Invalid Boolean value specified for tag \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1094, CDM_INVALID_STRING_VALUE, "Invalid String value specified for tag \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1095, CDM_INVALID_LONG_VALUE, "Invalid Long value \"{0}\" specified for attribute \"{1}\" in tag \"{2}\""
// *Document: NO
//  *Cause:
// *Action:
/
1096, CDM_INVALID_INT_VALUE, "Invalid integer value \"{0}\" specified for attribute \"{1}\" in tag \"{2}\""
// *Document: NO
//  *Cause:
// *Action:
/
1097, CDM_INVALID_FLOAT_VALUE, "Invalid float value \"{0}\" specified for attribute \"{1}\" in tag \"{2}\""
// *Document: NO
//  *Cause:
// *Action:
/
1098, CDM_INVALID_VERSION_STRING, "Invalid version string specified for tag \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1099, CDM_INVALID_DEF_MULTIPLE_CS_SYSTEMS, "Multiple(\"{0}\") certified system elements specified in XML file"
// *Document: NO
//  *Cause:
// *Action:
/
1100, CDM_INVALID_DEF_MULTIPLE_SYSTEMS, "Multiple(\"{0}\") system elements specified in XML file"
// *Document: NO
//  *Cause:
// *Action:
/
1101, CDM_INVALID_DEF_MULTIPLE_MCS, "Multiple(\"{0}\") memory constraint elements specified in XML file"
// *Document: NO
//  *Cause:
// *Action:
/
1102, CDM_MULTIPLE_ELEMENTS, "Multiple elements specified for xml tag (\"{0}\")"
// *Document: NO
//  *Cause:
// *Action:
/
1103, CDM_NULL_VALUE, "Value is not specified for: xml tag (\"{0}\"), attribute: (\"{1}\")"
// *Document: NO
//  *Cause:
// *Action:
/
1104, CDM_OS_NOT_FOUND, "Operating system element not found"
// *Document: NO
//  *Cause:
// *Action:
/
1105, CDM_INVALID_STORAGE_UNITS, "Invalid specification for storage units: (\"{0}\")"
// *Document: NO
//  *Cause:
// *Action:
/
1106, CDM_INVALID_SHELL_SEL, "Invalid specification for shell sel: (\"{0}\")"
// *Document: NO
//  *Cause:
// *Action:
/
1107, CDM_INVALID_RANGE_OP, "Invalid specification for range op: (\"{0}\")"
// *Document: NO
//  *Cause:
// *Action:
/
1108, CDM_INVALID_ROOT_ELEMENT, "Invalid or missing root element in the xml file"
// *Document: NO
//  *Cause:
// *Action:
/
1109, CDM_INVALID_XML_ATTR_COMB, "Invalid attribute combination specified for tag \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1110, CDM_INVALID_ELEMENT_DEF, "Invalid elment definition for element \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1111, CDM_INVALID_LT_VALUE, "Invalid less-than value speficed in XML: \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1112, CDM_NO_RANGE_OPERATPR, "No range operator specified"
// *Document: NO
//  *Cause:
// *Action:
/
1113, CDM_INVLD_RANGE_EQ_USAGE, "Invalid range specification: VALUE attribute cannot be combined with other range operators"
// *Document: NO
//  *Cause:
// *Action:
/
1114, CDM_INVLD_RANGE_ATTR_COMB, "Range attributes \"{0}\" and \"{1}\" cannot be specified at the same time"
// *Document: NO
//  *Cause:
// *Action:
/
4000, TASK_SPACE_START, "Checking space availability..."
// *Document: NO
//  *Cause:
// *Action:
/
4001, TASK_SPACE_CHECK_SPACE_AVAIL, "Check: Space available on \"{0}\""
//  *Cause: Could not determine mount point for location specified.
// *Action: Ensure location specified is available.
/
4002, TASK_SPACE_PASS_SPACE_AVAIL, "Space availability check passed for \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4003, TASK_SPACE_FAIL_SPACE_AVAIL, "Space availability check failed for \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
4004, TASK_ADMIN_USEREQUIV_START, "Checking user equivalence..."
// *Document: NO
//  *Cause:
// *Action:
/
4005, TASK_ADMIN_CHECK_USER_EQUIV, "Check: User equivalence for user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4006, TASK_ADMIN_PASS_USER_EQUIV, "User equivalence check passed for user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4007, TASK_ADMIN_FAIL_USER_EQUIV, "User equivalence check failed for user \"{0}\""
//  *Cause: User equivalence for the specified user did not exist amoung all the nodes participating in the operation.
// *Action: Verify user equivalence on all the nodes participating in the operation, see "Enabling SSH User Equivalency on Cluster Member Nodes" documentation.
/
4008, NO_USER_EQUIV_ANY_NODE, "User equivalence unavailable on all the specified nodes"
//  *Cause: User equivalence doesn't exist between the local node and the remote node(s).
// *Action: Ensure user equivalence exists on all the nodes specified.
/
4009, NO_USER_EQUIV_SOME_NODES, "User equivalence is not set for nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4012, TASK_ADMIN_ADMPRIV_START, "Checking administrative privileges..."
// *Document: NO
//  *Cause:
// *Action:
/
4013, TASK_ADMIN_ERR_OSDBA_FROM_OHOME, "Unable to determine OSDBA group from Oracle Home \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4014, TASK_ADMIN_CHECK_USER_EXISTS, "Check: Existence of user \"{0}\""
//  *Cause:
// *Action:
/
4015, TASK_ADMIN_PASS_USER_EXISTS, "User existence check passed for \"{0}\""
//  *Cause:
// *Action:
/
4016, TASK_ADMIN_FAIL_USER_EXISTS, "User existence check failed for \"{0}\""
//  *Cause:
// *Action:
/
4017, TASK_ADMIN_CHECK_GROUP_EXISTS, "Check: Existence of group \"{0}\""
//  *Cause:
// *Action:
/
4018, TASK_ADMIN_PASS_GROUP_EXISTS, "Group existence check passed for \"{0}\""
//  *Cause:
// *Action:
/
4019, TASK_ADMIN_FAIL_GROUP_EXISTS, "Group existence check failed for \"{0}\""
//  *Cause:
// *Action:
/
4020, TASK_ADMIN_INCONSISTENT_GROUP_ID, "Inconsistent group IDs found for group \"{0}\""
//  *Cause: The group ID for the specified group is not the same across all the nodes.
// *Action: Make sure that the group has the same group ID across all the nodes.
/
4021, TASK_ADMIN_GROUP_ID_ON_NODES, "		Group ID is \"{0}\" on nodes:{1}"
// *Document: NO
//  *Cause:
// *Action:
/
4022, TASK_ADMIN_CHECK_USER_IN_GROUP, "Check: Membership of user \"{0}\" in group \"{1}\" [as {2}]"
// *Document: NO
//  *Cause:
// *Action:
/
4023, TASK_ADMIN_PASS_USER_IN_GROUP, "Membership check for user \"{0}\" in group \"{1}\" [as {2}] passed"
// *Document: NO
//  *Cause:
// *Action:
/
4024, TASK_ADMIN_FAIL_USER_IN_GROUP, "Membership check for user \"{0}\" in group \"{1}\" [as {2}] failed"
// *Document: NO
//  *Cause:
// *Action:
/
4025, TASK_ADMIN_NO_INV_CONFIG_FILE, "Inventory configuration file \"{0}\" does not exist"
//  *Cause: Cannot locate the inventory configuration file specified.
// *Action: Ensure that the correct inventory location was supplied and that the inventory file is there.
/
4026, TASK_ADMIN_ERR_READ_INV_CONFIG_FILE, "Unable to read inventory configuration file \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4027, TASK_ADMIN_NO_PROPERTY_IN_INV_CONFIG_FILE, "Property \"{0}\" was not found in inventory configuration file \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
4028, TASK_DAEMON_START, "Checking daemon liveness..."
// *Document: NO
//  *Cause:
// *Action:
/
4029, TASK_DAEMON_CHECK_ALIVE, "Check: Liveness for \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4030, TASK_DAEMON_PASS_ALIVE, "Liveness check passed for \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4031, TASK_DAEMON_FAIL_ALIVE, "Liveness check failed for \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4032, TASK_CRS_START, "Checking CRS integrity..."
// *Document: NO
//  *Cause:
// *Action:
/
4033, TASK_CRS_LIVELINESS_ALL_DAEMONS, "Liveness of all the daemons"
// *Document: NO
//  *Cause:
// *Action:
/
4034, TASK_CRS_CHECK_CRS_HEALTH, "Check: Health of CRS"
// *Document: NO
//  *Cause:
// *Action:
/
4035, TASK_CRS_PASS_CRS_HEALTH, "CRS health check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4036, TASK_CRS_FAIL_CRS_HEALTH, "CRS health check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4037, NO_CRS_INSTALL_ANY_NODE, "CRS is not installed on any of the nodes"
//  *Cause: Could not identify a CRS installation on any node.
// *Action: Ensure that CRS is installed on all the nodes participating in the operation.
/
4038, NO_CRS_INSTALL_SOME_NODES, "CRS is not installed on nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4039, TASK_OCR_START, "Checking OCR integrity..."
// *Document: NO
//  *Cause:
// *Action:
/
4040, TASK_OCR_CHECK_CSS_NOT_SINGLE_INSTANCE, "Checking the absence of a non-clustered configuration..."
// *Document: NO
//  *Cause:
// *Action:
/
4041, TASK_OCR_CSS_SINGLE_INSTANCE_ALL_NODES, "CSS is probably working with a non-clustered, local-only configuration on all the nodes"
//  *Cause: Oracle CSS was found to be configured to run in a local-only (non-clustered) environment on all the nodes.
// *Action: Ensure cluster setup is correct and reconfigure Cluster Synchronization Services (CSS) as necessary on the nodes that are supposed to be executing in a clustered environment. See Oracle Cluster Synchronization Services documentation for further information.
/
4042, TASK_OCR_CSS_SINGLE_INSTANCE_SOME_NODES, "CSS is probably working with a non-clustered, local-only configuration on nodes:"
//  *Cause: Oracle CSS was found to be configured to run in a local-only (non-clustered) environment on the nodes specified.
// *Action: Ensure cluster setup is correct and reconfigure CSS as necessary on the nodes that are supposed to be executing in a clustered environment, see documentation regarding usage of the 'localconfig' script.
/
4043, TASK_OCR_NO_OCR_INTEG_DETAILS_ALL, "Unable to obtain OCR integrity details from any of the nodes"
//  *Cause: OCR was not found to be in a healthy state on any of the nodes.
// *Action: Verify the state of OCR on each of the nodes using 'ocrcheck'.
/
4044, TASK_OCR_NO_OCR_INTEG_DETAILS_SOME_NODES, "Unable to obtain OCR integrity details from nodes:"
//  *Cause: OCR was not found to be in a healthy state on some of the nodes.
// *Action: Verify the state of OCR on each of the nodes identified using 'ocrcheck'.
/
4045, TASK_OCR_REPORT_OCR_CHECK, "Result of OCR integrity check for nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4046, TASK_OCR_INCONSISTENT_OCR_ID, "OCR ID is inconsistent among the nodes"
//  *Cause: Multiple OCR ID's found across the cluster nodes specified.
// *Action: Verify Oracle Clusterware configuration and setup with 'ocrcheck' on each node specified. See 'ocrcheck' documentation for further information.
/
4047, TASK_OCR_ID_FOR_NODES, "	OCR ID = \"{0}\" found for nodes: {1}"
// *Document: NO
//  *Cause:
// *Action:
/
4048, TASK_OCR_INCORRECT_OCR_VERSION, "Version of OCR found \"{0}\", expected version of OCR for this release is \"{1}\""
//  *Cause: An incorrect version of OCR was found running on all the nodes.
// *Action: Verify version of OCR running on all the nodes using 'ocrcheck'.
/
4049, TASK_OCR_INCONSISTENT_OCR_VERSION, "OCR version is inconsistent amongst the nodes"
//  *Cause: Found different version of OCR running on the cluster nodes.
// *Action: Ensure that the correct version of OCR is running on all the nodes using 'ocrcheck'.
/
4050, TASK_OCR_CORRECT_OCR_VERSION_FOR_NODES, "	Correct OCR Version \"{0}\" found for nodes: {1}"
// *Document: NO
//  *Cause:
// *Action:
/
4051, TASK_OCR_INCORRECT_OCR_VERSION_FOR_NODES, "	Incorrect OCR Version \"{0}\" found for nodes: {1}"
// *Document: NO
//  *Cause:
// *Action:
/
4052, TASK_OCR_INCONSISTENT_TOTAL_SPACE, "Total space in OCR device is inconsistent amongst the nodes"
//  *Cause: Found possible different devices in use across the nodes.
// *Action: Verify that the same OCR devices are used across the cluster nodes using 'ocrcheck'.
/
4053, TASK_OCR_TOTAL_SPACE_FOR_NODES, "	Total space = \"{0}\" found for nodes: {1}"
// *Document: NO
//  *Cause:
// *Action:
/
4055, TASK_OCR_INVALID_OCR_INTEG, "OCR integrity is invalid"
//  *Cause: Cluster registry integrity check failed.
// *Action: Verify state of cluster registry using ocrcheck on the nodes participating in the verification operation.
/
4056, TASK_OCR_INCONSISTENT_OCR_INTEG, "OCR integrity results are inconsistent amongst the nodes"
//  *Cause: Cluster registry integrity check failed on some of the nodes.
// *Action: Verify state of cluster registry using ocrcheck on the nodes participating in the verification operation.
/
4057, TASK_OCR_VALID_OCR_INTEG_FOR_NODES, "	OCR integrity found valid for nodes: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
4058, TASK_OCR_INVALID_OCR_INTEG_FOR_NODES, "	OCR integrity found invalid for nodes: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
4059, TASK_START_SHARED_STORAGE, "Checking shared storage accessibility..."
// *Document: NO
//  *Cause:
// *Action:
/
4060, ERR_STORAGE_INFO_RETRIEVAL, "Unable to retrieve storage information"
//  *Cause: Internal error encountered while trying to retrieve storage information.
// *Action: If problem persists report issue to Oracle support and provide trace files generated when the cluvfy command is executed. Trace files should be located under <CRSHOME>/cv/log.
/
4061, SHARED_STORAGE_ID, "\"{0}\" is shared"
// *Document: NO
//  *Cause:
// *Action:
/
4062, NOT_SHARED_STORAGE_ID, "\"{0}\" is not shared"
// *Document: NO
//  *Cause:
// *Action:
/
4063, TASK_START_NODE_CONNECT, "Checking node connectivity..."
// *Document: NO
//  *Cause:
// *Action:
/
4078, TASK_START_NODE_REACH, "Checking node reachability..."
// *Document: NO
//  *Cause:
// *Action:
/
4079, ADDRESS_NODE_MISMATCH, "The number of addresses does not match the number of node"
//  *Cause: Cannot determine IP address for every node.
// *Action: Verify each node in the cluster has a valid IP address.
/
4080, NO_NETWORK_INTERFACE_INFO_ALL, "Network interface information cannot be obtained from any of the node"
//  *Cause: Could not find any network interface on any node in the cluster.
// *Action: Verify network interface(s) operational status on the cluster nodes.
/
4081, CHECK_NODE_REACH, "Check: Node reachability from node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4082, SUMMARY_PASS_NODE_REACH, "Node reachability check passed from node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4083, SUMMARY_FAIL_NODE_REACH, "Node reachability check failed from node \"{0}\""
//  *Cause: Network link to target node could not be verified using PING.
// *Action: Verify network link to target node using the PING utility.
/
4084, IP_UP_AND_VALID, "Make sure IP address \"{0}\" is up and is a valid IP address on node \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
4085, CHECK_NODE_CON, "Check: Node connectivity"
// *Document: NO
//  *Cause:
// *Action:
/
4086, SUMMARY_PASS_NODE_CON, "Node connectivity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4087, SUMMARY_FAIL_NODE_CON, "Node connectivity check failed"
//  *Cause: Encountered errors during verification of Node Connectivity.
// *Action: Review errors reported and correct problems.
/
4088, CHECK_NODE_CON_INTERFACE, "Check: Node connectivity for interface \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4089, SUMMARY_PASS_NODE_CON_INTERFACE, "Node connectivity passed for interface \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4090, SUMMARY_FAIL_NODE_CON_INTERFACE, "Node connectivity failed for interface \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4091, CHECK_NODE_CON_SUBNET, "Check: Node connectivity of subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4092, SUMMARY_PASS_NODE_CON_SUBNET, "Node connectivity passed for subnet \"{0}\" with node(s) {1}"
// *Document: NO
//  *Cause:
// *Action:
/
4093, SUMMARY_FAIL_NODE_CON_SUBNET, "Node connectivity failed for subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4094, INTERFACE_INFO_FOR_NODE, "Interface information for node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4095, NOT_REACHABLE_ANY_NODE, "Unable to reach any of the nodes"
//  *Cause: Unable to reach any of the nodes using the ping command.
// *Action: Ensure the nodes specified are accessible.
/
4096, NOT_REACHABLE_SOME_NODES, "These nodes cannot be reached:"
// *Document: NO
//  *Cause:
// *Action:
/
4097, NODE_NOT_REACHABLE, "Node \"{0}\" is not reachable"
//  *Cause: Unable to reach the node specified using the ping command.
// *Action: Ensure the node specified is accessible.
/
4098, NO_USER_EQUIV_ON_NODE, "User equivalence not found for node \"{0}\""
//  *Cause: Cannot access node specified using user equivalence.
// *Action: Ensure user equivalence is setup between the local node and the node specified.
/
4099, SUMMARY_TASK_SSA_SUCC, "Shared storage check was successful on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4100, SUMMARY_TASK_SSA_FAIL, "Shared storage check failed on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4101, NO_VIPOK_INTERFACES, "Could not find a suitable set of interfaces for VIPs"
//  *Cause: Could not find a set of network interface adapters suitable for Virtual IP communication in the cluster .
// *Action: Ensure that the network interface adapters are installed and configured correctly on each node in the cluster and that each interface can communicate with a network gateway.
/
4102, NO_PRIVATEOK_INTERFACES, "Could not find a suitable set of interfaces for the private interconnect"
//  *Cause: Could not find a set of network interface adapters suitable for Private communication in the cluster.
// *Action: Ensure that the network interface adapters are installed and configured correctly on each node in the cluster according to RFC 1918, or that the interfaces are not accessible from the public network.
/
4103, NO_PRIVATEOK_SAMENAME_INTERFACES, "Could not find a suitable set of interfaces with the same name for the private interconnect"
// *Document: NO
//  *Cause:
// *Action:
/
4104, INTERFACES_GOOD_FOR_VIP, "Interfaces found on subnet \"{0}\" that are likely candidates for VIP are:"
// *Document: NO
//  *Cause:
// *Action:
/
4105, INTERFACES_GOOD_FOR_PRIVATE, "Interfaces found on subnet \"{0}\" that are likely candidates for a private interconnect are:"
// *Document: NO
//  *Cause:
// *Action:
/
4106, MORE_THAN_ONE_SUBNET_FOR_INTERFACE, "More than one subnet found for interface \"{0}\""
//  *Cause:
// *Action:
/
4107, SRCNODE_NOT_REACHABLE, "Source node \"{0}\" is not reachable from local node"
//  *Cause: Unable to reach the source node specified using the ping command.
// *Action: Ensure the source node specified is accessible.
/
4108, NO_USER_EQUIV_ON_SRCNODE, "User equivalence not found for source node \"{0}\""
//  *Cause: Cannot access source node specified using user equivalence.
// *Action: Ensure user equivalence is setup between the local node and the source node specified.
/
4109, TASK_OLR_START, "Checking OLR integrity..."
// *Document: NO
//  *Cause:
// *Action:
/
4110, TASK_OLR_INTEGRITY_PASSED, "OLR integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4111, TASK_OLR_INTEGRITY_FAILED, "OLR integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4112, TASK_NO_HA_INSTALL, "Cannot identify Oracle Restart installation"
//  *Cause: Cannot determine location of Oracle Restart installation.
// *Action: Insure that the Oracle Restart environment is setup correctly.
/
4113, TASK_OLR_NO_OLR_INTEG_DETAILS, "Unable to obtain OLR integrity details from the local node"
//  *Cause: Could not verify the state of OLR on the local node.
// *Action: Check the status of OLR on the local node using the command 'ocrcheck -local'.
/
4114, TASK_OLR_CHECK_OLR_SETUP, "Check OLR setup and OLR install details"
// *Document: NO
//  *Cause:
// *Action:
/
4115, TASK_HA_START, "Checking Oracle Restart integrity..."
// *Document: NO
//  *Cause:
// *Action:
/
4116, TASK_HA_INTEGRITY_PASSED, "Oracle Restart integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4117, TASK_HA_INTEGRITY_FAILED, "Oracle Restart integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4118, TASK_HA_NO_HA_INTEG_DETAILS, "Unable to obtain Oracle Restart integrity details from the local node"
//  *Cause: Encountered an error when trying to run 'crsctl check has', or OHASD was found to be offline.
// *Action: Check the status of Oracle Restart using the 'crsctl check has' command on the local node.
/
4119, TASK_HA_CHECK_HA_SETUP, "Check Oracle Restart setup and install details"
// *Document: NO
//  *Cause:
// *Action:
/
4120, CHECK_TCP_CON_SUBNET, "Check: TCP connectivity of subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4121, SUMMARY_PASS_TCP_CON_SUBNET, "TCP connectivity check passed for subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4122, SUMMARY_FAIL_TCP_CON_SUBNET, "TCP connectivity check failed for subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4123, TASK_ADMIN_INCONSISTENT_USER_ID, "Inconsistent user IDs found for user \"{0}\""
//  *Cause: The user ID for the specified user is not the same across all the nodes.
// *Action: Make sure that the user has the same user ID across all the nodes.
/
4124, TASK_ADMIN_USER_ID_ON_NODES, "		User ID is \"{0}\" on nodes:{1}"
// *Document: NO
//  *Cause:
// *Action:
/
4125, TASK_SPACE_FAIL_STORAGE_TYPE, "Failed to retrieve storage type for \"{0}\""
//  *Cause: The storage location specified may be non-existent or invalid or the user running the check may not have permissions to access the specified storage.
// *Action: Specify a valid existing location, and ensure that the user running the check has valid read permissions to this location.
/
4126, TASK_SPACE_FAIL_GLOBAL_SUBMIT, "Global failure for all nodes during execution of space check command"
// *Cause: CVU's attempt to execute the space check command on all nodes had a total failure.
// *Action: Make sure that the location specified is a valid location and available on all nodes.
/
4127, TASK_OLR_NO_OLR_LOCATION, "Unable to obtain OLR location"
//  *Cause: Could not verify the state of OLR.
// *Action: Check the status of OLR using the command 'ocrcheck -config -local'.
/
4131, TASK_USERS_SAME_UID_START, "Checking for multiple users with UID value {0}"
// *Document: NO
//  *Cause: 
// *Action: 
/
4132, MULTIPLE_USERS_SAME_UID, "Multiple users \"{0}\" with UID \"{1}\" exist on \"{2}\". "
//  *Cause: More than one user is found to have the same user ID as specified in the message. 
// *Action: Ensure that no two users share the same UID. 
/
4133, TASK_USERS_SAME_UID_PASSED, "Check for multiple users with UID value {0} passed "
// *Document: NO
//  *Cause: 
// *Action: 
/
4134, TASK_USERS_SAME_UID_FAILED, "Check for multiple users with UID value {0} failed " 
// *Document: NO
//  *Cause: 
// *Action: 
/
4137, TASK_ELEMENT_USERS_SAME_UID, "Users With Same UID"
// *Document: NO
//  *Cause:  
// *Action: 
/
4138, TASK_DESC_USERS_SAME_UID, "This test checks that multiple users do not exist with user id as \"{0}\"."
// *Document: NO
//  *Cause:  
// *Action: 
/
4150, TASK_SSA_NO_SHARED_STORAGE, "No shared storage found"
// *Document: NO
//  *Cause:  
// *Action: 
/
4151, TASK_SHARED_STORAGE_DIFF_PERM, "Found different access permissions for the above storage location across the nodes specified"
//  *Cause: The access permissions for the path specified (i.e. read, write, execute) are different, or could not be determined, across the nodes specified.
// *Action: Ensure that the access permissions allow access for the Oracle user on all the nodes specified.
/
4152, TASK_SHARED_STORAGE_PERM_ERR, "The access permissions for the above storage location do not allow the user access across the nodes specified"
//  *Cause: The access permissions for the path specified (i.e. read, write, execute) do not allow the user access.
// *Action: Ensure that the access permissions allow access for the Oracle user on all the nodes specified.
4160, GET_FILE_INFO_FAILED, "GetFileInfo command failed."
// *Document: NO
//  *Cause:
// *Action:
/
4161, OCR_SIZE_CHECK_SUCCESSFUL, "Size check for OCR location \"{0}\" successful..."
// *Document: NO
//  *Cause:
// *Action:
/
4162, OCR_SIZE_COULD_NOT_BE_DETERMINED, "Size of the OCR location \"{0}\" could not be determined..."
// *Document: NO
//  *Cause:
// *Action:
/
4163, OCR_SIZE_CHECK_START, "Checking size of the OCR location \"{0}\" ..."
// *Document: NO
//  *Cause:
// *Action:
/
4164, OCR_SIZE_NOT_SUFFICIENT, "Size of the OCR location \"{0}\" does not meet the requirement. [Expected=\"{1}\" ; Found=\"{2}\"]"
//  *Cause: Size of the ocr device does not meet the requirement
// *Action: Increase the size of the ocr device
/
4165, OCR_SIZE_CHECK_FAILED, "Size check for OCR location \"{0}\" failed."
// *Document: NO
//  *Cause:
// *Action:
/
4166, OCR_SHAREDNESS_CHECK_START, "Checking OCR device \"{0}\" for sharedness..."
// *Document: NO
//  *Cause:
// *Action:
/
4167, OCR_SHAREDNESS_CHECK_SUCCESSFUL, "OCR device \"{0}\" is shared..."
// *Document: NO
//  *Cause:
// *Action:
/
4168, OCR_NOT_SHARED, "OCR is not shared..."
// *Document: NO
//  *Cause:
// *Action:
/
4169, OCR_MIRROR_SHAREDNESS_CHECK_START, "Checking OCR mirror sharedness..."
// *Document: NO
//  *Cause:
// *Action:
/
4170, OCR_MIRROR_SHAREDNESS_CHECK_SUCCESSFUL, "OCR mirror device is shared..."
// *Document: NO
//  *Cause:
// *Action:
/
4171, OCR_MIRROR_NOT_SHARED, "OCR mirror is not shared..."
// *Document: NO
//  *Cause:
// *Action:
/
4172, OCR_SHAREDNESS_CHECK_FAILED, "Check of OCR device \"{0}\" for sharedness failed"
// *Document: NO
//  *Cause:
// *Action:
/
4173, OCR_CONFIG_CHECK_START, "Checking OCR config file \"{0}\"..."
// *Document: NO
//  *Cause:
// *Action:
/
4174, OCR_CONFIG_CHECK_SUCCESSFUL, "OCR config file \"{0}\" check successful"
// *Document: NO
//  *Cause:
// *Action:
/
4175, OCR_CONFIG_CHECK_FAILED, "OCR config file \"{0}\" check failed on the following nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4176, OCR_FILE_CHECK_START, "Checking OCR location \"{0}\"..."
// *Document: NO
//  *Cause:
// *Action:
/
4177, OCR_FILE_CHECK_SUCCESSFUL, "Check for OCR location \"{0}\" successful"
// *Document: NO
//  *Cause:
// *Action:
/
4178, OCR_FILE_CHECK_FAILED, "Check for OCR location \"{0}\" failed on the following nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4179, OCR_MIRROR_FILE_CHECK_START, "Checking OCR mirror file attributes..."
// *Document: NO
//  *Cause:
// *Action:
/
4180, OCR_MIRROR_FILE_CHECK_SUCCESSFUL, "OCR mirror file check successful"
// *Document: NO
//  *Cause:
// *Action:
/
4181, OCR_MIRROR_FILE_CHECK_FAILED, "OCR mirror file check failed on the following nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4182, OLR_CONFIG_CHECK_START, "Checking OLR config file..."
// *Document: NO
//  *Cause:
// *Action:
/
4183, OLR_CONFIG_CHECK_SUCCESSFUL, "OLR config file check successful"
// *Document: NO
//  *Cause:
// *Action:
/
4184, OLR_CONFIG_CHECK_FAILED, "OLR config file check failed on the following nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4185, OLR_FILE_CHECK_START, "Checking OLR file attributes..."
// *Document: NO
//  *Cause:
// *Action:
/
4186, OLR_FILE_CHECK_SUCCESSFUL, "OLR file check successful"
// *Document: NO
//  *Cause:
// *Action:
/
4187, OLR_FILE_CHECK_FAILED, "OLR file check failed on the following nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4188, HOSTS_FILE_CHECK_START, "Checking hosts config file..."
// *Document: NO
//  *Cause:
// *Action:
/
4189, HOSTS_FILE_CHECK_SUCCESSFUL, "Verification of the hosts config file successful"
// *Document: NO
//  *Cause:
// *Action:
/
4190, HOSTS_FILE_CHECK_FAILED, "Verification of the hosts config file failed"
//  *Cause: The '/etc/hosts' file(s) contain incorrect, or incomplete, network host information. 
// *Action: Review the contents of the node's '/etc/hosts' file and ensure that each entry contains a valid IP address and a canonical host name for the specified IP address.
/
4191, HOSTS_FILE_INV_ENTRIES, "Invalid Entry"
// *Document: NO
//  *Cause:
// *Action:
/
4192, HOSTS_FILE_CHECK_ERR, "Encountered error while trying to check hosts file"
//  *Cause: Could not verify the contents of the '/etc/hosts' file.
// *Action: Review the node's 'hosts' file and insure that it exists, has necessary permissions and each entry contains at least an IP address and a host name for the IP address specified.
/
4193, ASM_NOT_RUNNING_ON_NODES, "Asm is not running on the following nodes. Proceeding with the remaining nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4194, ASM_NOT_RUNNING_ON_ANY_NODE, "Asm is not running on any of the nodes. Verification cannot proceed."
// *Document: NO
//  *Cause:
// *Action:
/
4195, OCR_LOCATION_DG_NOT_AVAILABLE, "Disk group for ocr location \"{0}\" not available on the following nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4196, OCR_LOCATION_DG_AVAILABLE, "Disk group for ocr location \"{0}\" available on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4197, OCR_LOGICAL_INTEGRITY_NOT_VERIFIED_WARNING, "This check does not verify the integrity of the OCR contents. Execute 'ocrcheck' as a privileged user to verify the contents of OCR."
// *Document: NO
//  *Cause:
// *Action:
/
4198, OLR_LOGICAL_INTEGRITY_NOT_VERIFIED_WARNING, "This check does not verify the integrity of the OLR contents. Execute 'ocrcheck -local' as a privileged user to verify the contents of OLR."
// *Document: NO
//  *Cause:
// *Action:
/
4200, TASK_OCR_CSS_NO_SINGLE_INSTANCE, "All nodes free of non-clustered, local-only configurations"
// *Document: NO
//  *Cause:
// *Action:
/
4201, TASK_OCR_CHECK_OCR_VERSION, "Checking the version of OCR..."
// *Document: NO
//  *Cause:
// *Action:
/
4202, TASK_OCR_CORRECT_OCR_VERSION, "OCR of correct Version \"{0}\" exists"
// *Document: NO
//  *Cause:
// *Action:
/
4203, TASK_OCR_CHECK_SAME_DEVICE, "Checking the uniqueness of OCR device across the nodes..."
// *Document: NO
//  *Cause:
// *Action:
/
4204, TASK_OCR_SAME_DEVICE, "Uniqueness check for OCR device passed"
// *Document: NO
//  *Cause:
// *Action:
/
4205, TASK_OCR_CHECK_DATA_INTEGRITY, "Checking data integrity of OCR..."
// *Document: NO
//  *Cause:
// *Action:
/
4206, TASK_OCR_CORRECT_DATA_INTEGRITY, "Data integrity check for OCR passed"
// *Document: NO
//  *Cause:
// *Action:
/
4207, TASK_OCR_INTEGRITY_PASSED, "OCR integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4208, TASK_OCR_INTEGRITY_FAILED, "OCR integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4209, TASK_OCR_DIFFERENT_DEVICES, "Possibly different devices are in use across the nodes"
//  *Cause:
// *Action:
/
4210, TASK_OCR_EXPECTED_OCR_VERSION, "Correct version of OCR for this release is \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4211, TASK_SSA_OCR_NOT_PARTITION, "The specified OCR location \"{0}\" is not a partition"
// *Cause: The location specified should be a disk partition rather than the disk itself.
// *Action: Specify a disk partition as the OCR storage.
/
4212, TASK_SSA_VDISK_NOT_PARTITION, "The specified Voting Disk location \"{0}\" is not  a partition"
// *Cause: The location specified should be a disk partition rather than the disk itself.
// *Action: Specify a disk partition as the Voting Disk storage.
/
4213, TASK_OCR_DEV_FILE_WARNING, "Encountered issues with the following OCR Device/Files"
//  *Cause: 'ocrcheck' returned failure, or warning, messages with the Device(s)/File(s) listed.
// *Action: Run 'ocrcheck' and resolve issues reported.
/
4250, TASK_CRS_INTEGRITY_PASSED, "CRS integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4251, TASK_CRS_INTEGRITY_FAILED, "CRS integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4252, TASK_CRS_CHECKING_CRS_HEALTH, "Checking CRS health..."
// *Document: NO
//  *Cause:
// *Action:
/
4253, TASK_CRS_INTEGRITY_WARNINGS, "CRS integrity check passed, but encountered some warnings"
//  *Cause: Some warnings were encountered while verifying CRS integrity.
// *Action: Review warnings and make modifications as necessary.
/
4300, TASK_ADMIN_PASSED, "Administrative privileges check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4301, TASK_ADMIN_FAILED, "Administrative privileges check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4302, TASK_ADMIN_CHECK_USER_IN_GROUP_ANYTYPE, "Check: Membership of user \"{0}\" in group \"{1}\" "
// *Document: NO
//  *Cause:
// *Action:
/
4303, TASK_ADMIN_PASS_USER_IN_GROUP_ANYTYPE, "Membership check for user \"{0}\" in group \"{1}\" passed"
// *Document: NO
//  *Cause:
// *Action:
/
4304, TASK_ADMIN_FAIL_USER_IN_GROUP_ANYTYPE, "Membership check for user \"{0}\" in group \"{1}\" failed"
// *Document: NO
//  *Cause:
// *Action:
/
4305, TASK_ADMIN_PASSED_FOR_OPERATION, "Administrative privileges check passed for {0}"
// *Document: NO
//  *Cause:
// *Action:
/
4306, TASK_ADMIN_FAILED_FOR_OPERATION, "Administrative privileges check failed for {0}"
//  *Cause:
// *Action:
/
4307, TASK_ADMIN_EFFECTIVE_GID, "The effective group id is \"{0}\""
//  *Cause:
// *Action:
/
4308, TASK_ADMIN_DIF_FROM_PRIMARY_GID, "This differs from the primary group id \"{0}\" of user \"{1}\""
//  *Cause:
// *Action:
/
4309, TASK_ADMIN_EGID_DIF_FROM_RGID, "The effective group id \"{0}\" differs from the primary group id \"{1}\" of user \"{2}\""
//  *Cause: The user is currently logged into a group that is not user's primary group.
// *Action: Invoke the application after logging in to the primary group (using command 'newgrp <primary group>').
/
4310, TASK_ADMIN_USER_NOT_IN_GROUP, "User \"{0}\" is not a member of the group \"{1}\""
//  *Cause:
// *Action:
/
4311, TASK_ADMIN_USER_GROUP_MEMBERSHIP_CHK_FAILED, "Group membership check of user \"{0}\" in group \"{1}\" failed. "
//  *Cause:
// *Action:
/
4312, TASK_ADMIN_USER_GROUP_NOT_PRIMARY, "Group \"{1}\" is not the primary group of the user \"{0}\". "
//  *Cause:
// *Action:
/
4313, TASK_ADMIN_USER_GROUP_NOT_SECONDARY, "Group \"{1}\" is not a secondary group of the user \"{0}\". "
//  *Cause:
// *Action:
/
4314, PRIMARY_NOT_VALID_ON_NT, "There is no primary group on this Operating System"
//  *Cause: An attempt was made to check users primary group on an Operating System where there are no primary groups. 
// *Action: This is an internal error; contact Oracle Support.
/
4315, TASK_ROOT_GROUP_USER_CHECK, "Checking to make sure user \"{0}\" is not in \"{1}\" group"
// *Document: NO
//  *Cause:
// *Action:
/
4316, TASK_PASS_ROOT_GROUP_CHECK, "User \"{0}\" is not part of \"{1}\" group. Check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4317, TASK_FAIL_ROOT_GROUP_CHECK, "User \"{0}\" is part of group \"{1}\". Check failed"
//  *Cause: The user who was executing this check was found to be part of root group.
// *Action: Use the 'id' command to check if the user is part of root group. Remove the user from root group using the 'usermod' command and try again.
/
4318, TASK_ERR_ROOT_GROUP_CHECK, "Checking that user \"{0}\" is not part of \"{1}\" group could not be performed on node \"{2}\""
//  *Cause: A node specific error occured while checking if user is not part of root group.
// *Action: Check that the node is accessible and user equivalance exists between the node on which command was executed and the node on which the check failed.
/
4350, TASK_HARD_LIMIT_START, "Checking hard limits for \"{0}\"..."
// *Document: NO
//  *Cause:
// *Action:
/
4351, TASK_HARD_LIMIT_PASSED, "Hard limit check for \"{0}\" passed"
// *Document: NO
//  *Cause:
// *Action:
/
4352, TASK_HARD_LIMIT_FAILED, "Hard limit check for \"{0}\" failed"
// *Document: NO
//  *Cause:
// *Action:
/
4353, TASK_SOFT_RESOURCE_LIMIT_IMPROPER, "Proper soft limit for resource \"{0}\" not found on node \"{1}\" [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: Soft limit for the resource does not meet the requirement on the specified node.
// *Action: Modify the resource limits to meet the requirement.
/
4354, TASK_HARD_RESOURCE_LIMIT_IMPROPER, "Proper hard limit for resource \"{0}\" not found on node \"{1}\" [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: Hard limit for the resource does not meet the requirement on the specified node.
// *Action: Modify the resource limits to meet the requirement.
/
4355, TASK_SOFT_RESOURCE_LIM_CHK_FAILED_ON_NODE, "Resource soft limit check for \"{0}\" failed on node \"{1}\""
//  *Cause: Soft limit of the resource could not be determined.
// *Action: Ensure that the resource limit configuration is accessible.
/
4356, TASK_HARD_RESOURCE_LIM_CHK_FAILED_ON_NODE, "Resource hard limit check for \"{0}\" failed on node \"{1}\""
//  *Cause: Hard limit of the resource could not be determined.
// *Action: Ensure that the resource limit configuration is accessible.
/
4357, TASK_LIMIT_MAX_FILE_DESC, "maximum open file descriptors"
// *Document: NO
//  *Cause:
// *Action:
/
4358, TASK_LIMIT_MAX_USER_PROC, "maximum user processes"
// *Document: NO
//  *Cause:
// *Action:
/
4359, TASK_SOFT_LIMIT_START, "Checking soft limits for \"{0}\"..."
// *Document: NO
//  *Cause:
// *Action:
/
4360, TASK_SOFT_LIMIT_PASSED, "Soft limit check for \"{0}\" passed"
// *Document: NO
//  *Cause:
// *Action:
/
4361, TASK_SOFT_LIMIT_FAILED, "Soft limit check for \"{0}\" failed"
// *Document: NO
//  *Cause:
// *Action:
/
4362, TASK_PIN_NODE_PASSED, "Persistent configuration check for cluster nodes passed"
// *Document: NO
//  *Cause:
// *Action:
/
4363, TASK_PIN_NODE_FAILED, "Persistent configuration check for cluster nodes failed"
//  *Cause: The nodes IP address configuration was not found to be persistent.
// *Action: Make the nodes IP address configuration persistent using the 'crsctl pin css' command, see Oracle documentation 'Pinning Cluster Nodes for Oracle Database Release' for further information."
/
4364, TASK_START_PIN_NODE_CHECK, "Checking persistent IP configuration for cluster nodes..."
// *Document: NO
//  *Cause:
// *Action:
/
/
4375, TASK_SOFTWARE_START, "Check: Software"
// *Document: NO
//  *Cause:
// *Action:
/
4376, TASK_SOFTWARE_PASSED, "Software check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4377, TASK_SOFTWARE_FAILED, "Software check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4380, TASK_OSVERCOMPAT_STARTED, "Check Operating System version Compatibility for ACFS ..."
// *Document: NO
//  *Cause:
// *Action:
/
4381, TASK_OSVERCOMPAT_PASSED, "OS Operating System version Compatibility check for ACFS passed"
// *Document: NO
//  *Cause:
// *Action:
/
4382, TASK_OSVERCOMPAT_FAILED, "Operating System Version Compatibility check for ACFS failed"
// *Document: NO
//  *Cause:
// *Action:
/
4385, TASK_ASMDEVCHK_STARTED, "Checking Devices for ASM..."
// *Document: NO
//  *Cause:
// *Action:
/
4386, TASK_ASMDEVCHK_PASSED, "Devices check for ASM passed"
// *Document: NO
//  *Cause:
// *Action:
/
4387, TASK_ASMDEVCHK_FAILED, "Devices check for ASM failed"
// *Document: NO
//  *Cause:
// *Action:
/
4388, TASK_USM_INTEGRITY_STARTED, "Task ACFS Integrity check started..."
// *Document: NO
//  *Cause:
// *Action:
/
4389, TASK_USM_INTEGRITY_PASSED, "Task ACFS Integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4390, TASK_USM_INTEGRITY_FAILED, "Task ACFS Integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4391, TASK_ASM_INTEGRITY_STARTED, "Task ASM Integrity check started..."
// *Document: NO
//  *Cause:
// *Action:
/
4392, TASK_ASM_INTEGRITY_PASSED, "Task ASM Integrity check passed..."
// *Document: NO
//  *Cause:
// *Action:
/
4393, TASK_ASM_INTEGRITY_FAILED, "Task ASM Integrity check failed..."
// *Document: NO
//  *Cause:
// *Action:
/
4400, TASK_ELEMENT_SPACE_AVAIL, "Available File System Space"
// *Document: NO
//  *Cause:
// *Action:
/
4401, TASK_ELEMENT_NODE_REACHABILITY, "Node Reachability"
// *Document: NO
//  *Cause:
// *Action:
/
4402, TASK_ELEMENT_NODE_CONNECTIVITY, "Node Connectivity"
// *Document: NO
//  *Cause:
// *Action:
/
4403, TASK_ELEMENT_ARCHITECTURE, "Architecture"
// *Document: NO
//  *Cause:
// *Action:
/
4404, TASK_ELEMENT_AVAIL_MEMORY, "Available Physical Memory"
// *Document: NO
//  *Cause:
// *Action:
/
4405, TASK_ELEMENT_CONTAINER_KERNEL_PARAMS, "OS Kernel Parameters"
// *Document: NO
//  *Cause:
// *Action:
/
4406, TASK_ELEMENT_CONTAINER_OS_PATCHES, "OS Patches"
// *Document: NO
//  *Cause:
// *Action:
/
4407, TASK_ELEMENT_CONTAINER_PACKAGES, "Packages"
// *Document: NO
//  *Cause:
// *Action:
/
4408, TASK_ELEMENT_FREE_SPACE, "Free Space"
// *Document: NO
//  *Cause:
// *Action:
/
4409, TASK_ELEMENT_GROUP_EXISTENCE, "Group Existence"
// *Document: NO
//  *Cause:
// *Action:
/
4410, TASK_ELEMENT_GROUP_MEMBERSHIP, "Group Membership"
// *Document: NO
//  *Cause:
// *Action:
/
4411, TASK_ELEMENT_KERNEL_PARAM, "OS Kernel Parameter"
// *Document: NO
//  *Cause:
// *Action:
/
4412, TASK_ELEMENT_KERNEL_VER, "OS Kernel Version"
// *Document: NO
//  *Cause:
// *Action:
/
4413, TASK_ELEMENT_OS_PATCH, "OS Patch"
// *Document: NO
//  *Cause:
// *Action:
/
4414, TASK_ELEMENT_OS_VERSION, "OS Version"
// *Document: NO
//  *Cause:
// *Action:
/
4415, TASK_ELEMENT_PACKAGE, "Package"
// *Document: NO
//  *Cause:
// *Action:
/
4416, TASK_ELEMENT_PHYSICAL_MEMORY, "Physical Memory"
// *Document: NO
//  *Cause:
// *Action:
/
4417, TASK_ELEMENT_PROCESS_ALIVE, "Process Liveness"
// *Document: NO
//  *Cause:
// *Action:
/
4418, TASK_ELEMENT_RUN_LEVEL, "Run Level"
// *Document: NO
//  *Cause:
// *Action:
/
4419, TASK_ELEMENT_HARD_LIMITS, "Hard Limit"
// *Document: NO
//  *Cause:
// *Action:
/
4420, TASK_ELEMENT_SWAP_SIZE, "Swap Size"
// *Document: NO
//  *Cause:
// *Action:
/
4421, TASK_ELEMENT_USER_EXISTENCE, "User Existence"
// *Document: NO
//  *Cause:
// *Action:
/
4422, TASK_ELEMENT_CFS_INTEGRITY, "OCFS Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4423, TASK_ELEMENT_CRS_INTEGRITY, "CRS Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4424, TASK_ELEMENT_OCR_INTEGRITY, "OCR Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4425, TASK_ELEMENT_NODEAPP, "Node Application Existence"
// *Document: NO
//  *Cause:
// *Action:
/
4426, TASK_ELEMENT_SHARED_STORAGE_ACCESS, "Shared Storage Accessibility"
// *Document: NO
//  *Cause:
// *Action:
/
4427, TASK_ELEMENT_SHARED_STORAGE_DISCOVERY, "Shared Storage Discovery"
// *Document: NO
//  *Cause:
// *Action:
/
4428, TASK_ELEMENT_ADMIN_PRIV, "Administrative Privileges"
// *Document: NO
//  *Cause:
// *Action:
/
4429, TASK_ELEMENT_USER_EQUIV, "User Equivalence"
// *Document: NO
//  *Cause:
// *Action:
/
4430, TASK_ELEMENT_CLUSTER_INTEGRITY, "Cluster Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4431, TASK_ELEMENT_CLUSTER_MGR_INTEGRITY, "Cluster Manager Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4432, TASK_ELEMENT_DAEMON_LIVELINESS, "Daemon Liveness"
// *Document: NO
//  *Cause:
// *Action:
/
4433, TASK_ELEMENT_PEER_COMPATBILITY, "Peer Compatibility"
// *Document: NO
//  *Cause:
// *Action:
/
4434, TASK_ELEMENT_PORT_AVAILABILITY, "Port Availability"
// *Document: NO
//  *Cause:
// *Action:
/
4435, TASK_ELEMENT_SYSTEM_REQUIREMENTS, "System Requirements"
// *Document: NO
//  *Cause:
// *Action:
/
4436, TASK_ELEMENT_OLR_INTEGRITY, "OLR Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4437, TASK_ELEMENT_HA_INTEGRITY, "Oracle Restart Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4438, TASK_ELEMENT_CONTAINER_FREE_SPACE, "Free Space"
// *Document: NO
//  *Cause:
// *Action:
/
4439, TASK_ELEMENT_NODEADD, "Node Addition"
// *Document: NO
//  *Cause:
// *Action:
/
4440, TASK_ELEMENT_NODEDEL, "Node Removal"
// *Document: NO
//  *Cause:
// *Action:
/
4441, TASK_ELEMENT_SOFTWARE, "Software"
// *Document: NO
//  *Cause:
// *Action:
/
4442, TASK_ELEMENT_OSVERCOMPAT, "OS Version Compatibility for ACFS"
// *Document: NO
//  *Cause:
// *Action:
/
4443, TASK_ELEMENT_SOFT_LIMITS, "Soft Limit"
// *Document: NO
//  *Cause:
// *Action:
/
4444, TASK_ELEMENT_ASM_DEVICE_CHECKS, "Device Checks for ASM"
// *Document: NO
//  *Cause:
// *Action:
/
4445, TASK_ELEMENT_GNS_INTEGRITY, "GNS Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4446, TASK_ELEMENT_GPNP_INTEGRITY, "GPNP Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4447, TASK_ELEMENT_USM_INTEGRITY, "ACFS Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
4448, TASK_ELEMENT_USMDRIVERCHECCK, "ACFS Driver Checks"
// *Document: NO
//  *Cause:
// *Action:
/
4449, TASK_ELEMENT_USM_UDEV_CHECKS, "UDev attribtes check"
// *Document: NO
//  *Cause:
// *Action:
/
4450, TASK_DESC_SPACE_AVAIL, "This is a prerequisite condition to test whether the file system has sufficient free space."
// *Document: NO
//  *Cause:
// *Action:
/
4451, TASK_DESC_NODE_REACHABILITY, "This is a prerequisite condition to test whether all the target nodes are reachable."
// *Document: NO
//  *Cause:
// *Action:
/
4452, TASK_DESC_NODE_CONNECTIVITY, "This is a prerequisite condition to test whether connectivity exists amongst all the nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4453, TASK_DESC_ARCHITECTURE, "This is a prerequisite condition to test whether the system has a certified architecture."
// *Document: NO
//  *Cause:
// *Action:
/
4454, TASK_DESC_AVAIL_MEMORY, "This is a prerequisite condition to test whether the system has at least {0} of available physical memory."
// *Document: NO
//  *Cause:
// *Action:
/
4455, TASK_DESC_CONTAINER_KERNEL_PARAMS, "This is a prerequisite condition to test whether the minimum required OS kernel parameters are configured on the system."
// *Document: NO
//  *Cause:
// *Action:
/
4456, TASK_DESC_CONTAINER_OS_PATCHES, "This is a prerequisite condition to test whether the minimum required OS patches are available on the system."
// *Document: NO
//  *Cause:
// *Action:
/
4457, TASK_DESC_CONTAINER_PACKAGES, "This is a prerequisite condition to test whether the required packages are available on the system."
// *Document: NO
//  *Cause:
// *Action:
/
4458, TASK_DESC_FREE_SPACE, "This is a prerequisite condition to test whether sufficient free space is available in the file system."
// *Document: NO
//  *Cause:
// *Action:
/
4459, TASK_DESC_GROUP_EXISTENCE, "This is a prerequisite condition to test whether group \"{0}\" exists on the system."
// *Document: NO
//  *Cause:
// *Action:
/
4460, TASK_DESC_GROUP_MEMBERSHIP, "This is a prerequisite condition to test whether user \"{0}\" is a member of the group \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
4461, TASK_DESC_GROUP_MEMBERSHIP_PRIMARY, "This is a prerequisite condition to test whether user \"{0}\" has group \"{1}\" as its primary group."
// *Document: NO
//  *Cause:
// *Action:
/
4462, TASK_DESC_KERNEL_PARAM, "This is a prerequisite condition to test whether the OS kernel parameter \"{0}\" is properly set."
// *Document: NO
//  *Cause:
// *Action:
/
4463, TASK_DESC_KERNEL_VER, "This is a prerequisite condition to test whether the system kernel version is at least \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
4464, TASK_DESC_OS_PATCH, "This is a prerequisite condition to test whether the patch \"{0}\" is available on the system."
// *Document: NO
//  *Cause:
// *Action:
/
4465, TASK_DESC_OS_VERSION, "This is a prerequisite condition to test whether the system has the required operating system version."
// *Document: NO
//  *Cause:
// *Action:
/
4466, TASK_DESC_PACKAGE, "This is a prerequisite condition to test whether the package \"{0}\" is available on the system."
// *Document: NO
//  *Cause:
// *Action:
/
4467, TASK_DESC_PHYSICAL_MEMORY, "This is a prerequisite condition to test whether the system has at least {0} of total physical memory."
// *Document: NO
//  *Cause:
// *Action:
/
4468, TASK_DESC_PROCESS_ALIVE, "This is a prerequisite condition to test whether a process is running."
// *Document: NO
//  *Cause:
// *Action:
/
4469, TASK_DESC_RUN_LEVEL, "This is a prerequisite condition to test whether the system is running with proper run level."
// *Document: NO
//  *Cause:
// *Action:
/
4470, TASK_DESC_SHELL_LIMITS, "This test checks that the recommended values are set for resource limits."
// *Document: NO
//  *Cause:
// *Action:
/
4471, TASK_DESC_SWAP_SIZE, "This is a prerequisite condition to test whether sufficient total swap space is available on the system."
// *Document: NO
//  *Cause:
// *Action:
/
4472, TASK_DESC_USER_EXISTENCE, "This is a prerequisite condition to test whether user \"{0}\" exists on the system."
// *Document: NO
//  *Cause:
// *Action:
/
4473, TASK_DESC_CFS_INTEGRITY, "This test checks the integrity of OCFS file system across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4474, TASK_DESC_CRS_INTEGRITY, "This test checks the integrity of Oracle Clusterware stack across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4475, TASK_DESC_OCR_INTEGRITY, "This test checks the integrity of OCR across the cluster nodes."
//  *Cause:
// *Document: NO
// *Action:
/
4476, TASK_DESC_NODEAPP, "This test checks the existence of Node Applications on the system."
// *Document: NO
//  *Cause:
// *Action:
/
4477, TASK_DESC_SHARED_STORAGE_ACCESS, "This test checks the shared access of storage across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4478, TASK_DESC_SHARED_STORAGE_DISCOVERY, "This check discovers the shared storage available across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4479, TASK_DESC_ADMIN_PRIV, "This test checks that the required administrative privileges are available for performing a specific operation."
// *Document: NO
//  *Cause:
// *Action:
/
4480, TASK_DESC_USER_EQUIV, "This test checks that user equivalence exists for the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4481, TASK_DESC_CLUSTER_INTEGRITY, "This test checks the integrity of the cluster."
// *Document: NO
//  *Cause:
// *Action:
/
4482, TASK_DESC_CLUSTER_MGR_INTEGRITY, "This test checks the integrity of cluster manager across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4483, TASK_DESC_DAEMON_LIVELINESS, "This test checks the liveness of specific daemon(s) or service(s) on the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4484, TASK_DESC_PEER_COMPATBILITY, "This test checks the compatibility of cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4485, TASK_DESC_PORT_AVAILABILITY, "This test checks the availability of ports across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4486, TASK_DESC_SYSTEM_REQUIREMENTS, "This test checks the minimum system requirements for the Oracle product."
// *Document: NO
//  *Cause:
// *Action:
/
4487, TASK_DESC_OLR_INTEGRITY, "This test checks the integrity of OLR on the local node."
// *Document: NO
//  *Cause:
// *Action:
/
4488, TASK_DESC_HA_INTEGRITY, "This test checks the integrity of Oracle Restart on the local node"
// *Document: NO
//  *Cause:
// *Action:
/
4489, TASK_DESC_HARD_LIMITS, "This is a prerequisite condition to test whether the hard limit for \"{0}\" is set to at least {1}."
// *Document: NO
//  *Cause:
// *Action:
/
4490, TASK_DESC_SOFT_LIMITS, "This is a prerequisite condition to test whether the soft limit for \"{0}\" is set to at least {1}."
// *Document: NO
//  *Cause:
// *Action:
/
4491, TASK_DESC_CONTAINER_FREE_SPACE, "This is a prerequisite condition to test whether the minimum required free space is available on the file system."
// *Document: NO
//  *Cause:
// *Action:
/
4492, TASK_DESC_NODEADD, "This test verifies whether the given node(s) can be added to the existing clusterware configuration."
// *Document: NO
//  *Cause:
// *Action:
/
4493, TASK_DESC_NODEDEL, "This test verifies whether the given node(s) can be removed from the existing clusterware configuration."
// *Document: NO
//  *Cause:
// *Action:
/
4494, TASK_DESC_SOFTWARE, "This test verifies the software on the specified node."
// *Document: NO
//  *Cause:
// *Action:
/
4495, TASK_DESC_OSVERCOMPAT, "This is a pre-check to verify if the Operating System version on the cluster nodes are compatible for installing ACFS in release \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
4496, TASK_DESC_ASM_DEVICE_CHECKS, "This is a pre-check to verify if the specified devices meet the requirements for configuration through the Oracle Universal Storage Manager Configuration Assistant."
// *Document: NO
//  *Cause:
// *Action:
/
4497, TASK_DESC_USM_INTEGRITY, "This test checks the integrity of Oracle ASM Cluster File System across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4498, TASK_DESC_USMDRIVERCHECCK, "This is a pre-check to ACFS Configuration Assistant to check that the ACFS drivers are installed and loaded, and their version is compatible with the Operating System version in release \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
4499, TASK_DESC_USM_UDEV_CHECKS, "This is a pre-check condition to check if the devices entries in the Udev permissions file have been set up correctly."
// *Document: NO
//  *Cause:
// *Action:
/
4500, TASK_START_CFS, "Checking CFS integrity..."
// *Document: NO
//  *Cause:
// *Action:
/
4501, TASK_CFS_CHECKING_CLUNAME, "Checking OCFS cluster name..."
// *Document: NO
//  *Cause:
// *Action:
/
4502, TASK_CFS_CLUNAME_MATCHED, "OCFS cluster name \"{0}\" matched on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4503, TASK_CFS_CLUNAME_FAILED, "OCFS cluster name check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4504, TASK_CFS_CHECKING_SERVICE, "Checking service \"{0}\" status..."
// *Document: NO
//  *Cause:
// *Action:
/
4505, TASK_CFS_CHECKING_SERVICE_PASSED, "Service \"{0}\" is running on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4506, TASK_CFS_CHECKING_SERVICE_FAILED, "Service \"{0}\" is not running on the following nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4507, TASK_CFS_CLUNAME_SET_TO, "Cluster name set to \"{0}\" for the following node(s):"
// *Document: NO
//  *Cause:
// *Action:
/
4508, TASK_CFS_CLUNAME_ALL_FAIL, "Cluster name check did not run on any of the nodes"
//  *Cause:
// *Action:
/
4509, TASK_CFS_CHECKING_AVAILABLE_DRIVES, "Listing available OCFS drives..."
// *Document: NO
//  *Cause:
// *Action:
/
4510, TASK_CFS_DRIVER_EXIST_ON_ALL_NODES, "Driver \"{0}\" exists in the system path on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4511, TASK_CFS_DRIVER_NOT_ON_ALL_NODES, "Driver \"{0}\" does not exist in the system path for the following nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
4512, TASK_CFS_CHECKING_DRIVER_VERSION, "Checking version of \"{0}\" driver..."
// *Document: NO
//  *Cause:
// *Action:
/
4513, TASK_CFS_DRIVER_VERSION_MATCHED, "\"{0}\" driver version \"{1}\" matched on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4514, TASK_CFS_DRIVER_VERSION_MISMATCHED, "\"{0}\" driver version did not match on all the nodes"
//  *Cause:
// *Action:
/
4515, TASK_CFS_CHECKING_DRIVER_EXISTS, "Checking existence of \"{0}\" driver..."
// *Document: NO
//  *Cause:
// *Action:
/
4516, TASK_CFS_LNX_CHK_CONF_EXISTS, "Checking existence of \"{0}\" file..."
// *Document: NO
//  *Cause:
// *Action:
/
4517, TASK_CFS_LNX_CONF_EXIST_ON_ALL_NODES, "File \"{0}\" exists on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4518, TASK_CFS_LNX_CONF_NOT_ON_ALL_NODES, "File \"{0}\" does not exist on the following nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
4519, TASK_CFS_LNX_CHK_CONF_FAILED, "Existence check failed for file \"{0}\". "
// *Document: NO
//  *Cause:
// *Action:
/
4520, TASK_CFS_LNX_CHK_UNQ_GUIDS, "Checking host-guid uniqueness..."
// *Document: NO
//  *Cause:
// *Action:
/
4521, TASK_CFS_LNX_UNQ_GUIDS, "Uniqueness check for host-guid passed on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4522, TASK_CFS_LNX_NODES_WITH_SAME_GUID, "Host-guid is not unique for these nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
4523, TASK_CFS_LNX_GUID_FAILED, "Uniqueness check for host-guid failed"
// *Document: NO
//  *Cause:
// *Action:
/
4524, TASK_CFS_LNX_CHK_RLVL, "Checking required run level configuration for ocfs..."
// *Document: NO
//  *Cause:
// *Action:
/
4525, TASK_CFS_LNX_RLVL_PASSED, "OCFS is configured with proper run level on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4526, TASK_CFS_LNX_RLVL_FAILED, "OCFS is not configured in runlevel 3,4 or 5 on all the nodes"
// *Document: NO
//  *Cause: 
// *Action:
/
4527, TASK_CFS_LNX_CONF_NOT_ON_NODE, "File \"{0}\" does not exist on node \"{1}\" "
// *Document: NO
//  *Cause:
// *Action:
/
4528, TASK_CFS_LNX_CHK_CONF_FAILED_NODE, "Check for existence of config file \"{0}\" could not be performed on node \"{1}\". "
//  *Cause: Could not verify existence of configuration file specified.
// *Action: Verify access to node indicated and that the config file exists.
/
4529, TASK_CFS_LNX_NODE_WITH_DUP_GUID, "Host-guid of node \"{0}\" is not unique"
//  *Cause: The system guid value is not unique across all the cluster nodes.
// *Action: Ensure that the guid value is unique across all cluster nodes using 'ocrcheck'.
/
4530, TASK_CFS_LNX_RLVL_INCORRECT_NODE, "OCFS is not configured in runlevel 3,4 and 5 on the node"
//  *Cause: Runlevel was not configured with levels 3,4 and 5 all being on.
// *Action: Check OCFS configuration and ensure the run levels indicated are on.
/
4531, TASK_CFS_LNX_CNFG_CHECK_FAILED_NODE, "OCFS configuration check failed on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4532, TASK_CFS_LNX_CHK_UNQ_GUIDS_NODE_FAILED, "Uniqueness of host-guid for node \"{0}\" could not be verified"
// *Document: NO
//  *Cause:
// *Action:
/
4533, TASK_CFS_DRIVER_NOT_ON_NODE, "Driver \"{0}\" does not exist in the system path on the node. "
// *Document: NO
//  *Cause:
// *Action:
/
4550, TASK_START_NODEAPP, "Checking node application existence..."
// *Document: NO
//  *Cause:
// *Action:
/
4551, TASK_NODEAPP_CHECKING_APP_TEMPLATE, "Checking existence of {0} node application "
// *Document: NO
//  *Cause:
// *Action:
/
4552, TASK_NODEAPP_NO_RESOURCE_ALL_NODES, "Unable to retrieve {0} resource name from any node "
// *Document: NO
//  *Cause:
// *Action:
/
4553, TASK_NODEAPP_NO_RESOURCE, "Unable to retrieve {0} resource name from the following node(s) "
//  *Cause:
// *Action:
/
4554, TASK_NODEAPP_NO_RESOURCE_NODE, "Unable to retrieve {0} resource name from node {1}. "
//  *Cause: Could not identify node application resource name specified on the node specified.
// *Action: Ensure that the node application resource name specified is available for the node specified.
/
4555, TASK_NODEAPP_RESOURCE_NOTEXIST_NODE, "Node application \"{0}\" does not exist on node \"{1}\""
//  *Cause: Could not identify resource specified on the node specified.
// *Action: Ensure that the resource specified is available for the node specified.
/
4556, TASK_NODEAPP_RESOURCE_CHECK_NODE_FAILED, "Failed to check existence of node application \"{0}\" on node \"{1}\""
//  *Cause: Could not verify existence of the nodeapp identified on the node specified .
// *Action: Ensure that the resource specified is available on the node specified, see 'srvctl add nodeapps' for further information.
/
4557, TASK_NODEAPP_RESOURCE_OFFLINE_NODE, "Node application \"{0}\" is offline on node \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
4558, TASK_ELEMENT_ROOT_GROUP, "User Not In Group"
// *Document: NO
//  *Cause:
// *Action:
/
4559, TASK_DESC_ROOT_GROUP, "This is a prerequisite condition to make sure user \"{0}\" is not part of \"{1}\" group."
// *Document: NO
//  *Cause:
// *Action:
/
4560, TASK_ELEMENT_HOSTS_FILE, "Hosts File"
// *Document: NO
//  *Cause:
// *Action:
/
4561, TASK_DESC_HOSTS_FILE, "This test checks the integrity of the hosts file across the cluster nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4562, TASK_ELEMENT_PIN_NODE, "Persistent IP Configuration"
// *Document: NO
//  *Cause:
// *Action:
/
4563, TASK_DESC_PIN_NODE, "This test checks the IP configuration to ensure it is persistent"
// *Document: NO
//  *Cause:
// *Action:
/
4564, TASK_DESC_UMASK, "This is a prerequisite condition to make sure the user file creation mask (umask) is \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
4565, TASK_ELEMENT_UMASK, "User Mask"
// *Document: NO
//  *Cause:
// *Action:
/
4600, TASK_START_PEER, "Checking peer compatibility..."
// *Document: NO
//  *Cause:
// *Action:
/
4601, TASK_PEER_NO_CHECKS, "No checks registered for peer comparision"
// *Document: NO
//  *Cause:
// *Action:
/
4602, TASK_PEER_REFNODE_VS_REFNODE, "Reference node cannot be compared against itself"
// *Document: NO
//  *Cause:
// *Action:
/
4603, TASK_PEER_PASSED, "Peer compatibility check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4604, TASK_PEER_FAILED, "Peer compatibility check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4605, REFNODE_NOT_REACHABLE, "Reference node \"{0}\" is not reachable from local node"
// *Document: NO
//  *Cause:
// *Action:
/
4606, NO_USER_EQUIV_ON_REFNODE, "User equivalence not found for reference node \"{0}\""
//  *Cause: Cannot access reference node using user equivalence.
// *Action: Ensure user equivalence is configured between the local node and the node specified. See Enabling SSH User Equivalency on Cluster Member Nodes documentation for further information.
/
4607, TASK_PEER_NO_REF_DATA, "Reference data is not available for checking peer compatbility for {0} release on {1}"
//  *Cause:
// *Action:
/
4608, TASK_PEER_STOPPED, "Peer compatibility checks cannot proceed"
// *Document: NO
//  *Cause:
// *Action:
/
4650, TASK_START_PORT, "Checking port availability..."
// *Document: NO
//  *Cause:
// *Action:
/
4653, TASK_PORT_PASSED, "Port availability check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4654, TASK_PORT_FAILED, "Port availability check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4655, TASK_NAME_SERVICE_CHECK_START, "Checking name resolution setup for \"{0}\"..."
// *Document: NO
//  *Cause:
// *Action:
/
4656, TASK_NAME_SERVICE_CHECK_PASSED, "Name resolution setup check for \"{0}\" passed"
// *Document: NO
//  *Cause:
// *Action:
/
4657, TASK_NAME_SERVICE_CHECK_FAILED, "Name resolution setup check for \"{0}\" (IP address: {1}) failed"
//  *Cause: Inconsistent IP address definitions found for the SCAN name identified using DNS and configured name resolution mechanism(s).
// *Action: Look up the SCAN name with nslookup, and make sure the returned IP addresses are consistent with those defined in NIS and /etc/hosts as configured in /etc/nsswitch.conf by reconfiguring the latter. Check the Name Service Cache Daemon (/usr/sbin/nscd) by clearing its cache and restarting it.
/
4658, HDR_SCAN_NAME, "SCAN Name"
// *Document: NO
//  *Cause:
// *Action:
/
4659, TASK_NAME_SERVICE_DNS_ENTRY, "DNS Entry"
// *Document: NO
//  *Cause:
// *Action:
/
4660, TASK_NAME_SERVICE_NIS_ENTRY, "NIS Entry"
// *Document: NO
//  *Cause:
// *Action:
/
4661, TASK_NAME_SERVICE_NSSWITCH_ERR, "Found inconsistent 'hosts' entry in /etc/nsswitch.conf on node {0}"
//  *Cause: The 'hosts' specifications in the /etc/nsswitch.conf file is different the node specified.
// *Action: Ensure the 'hosts' entries define the same lookup order in the /etc/nsswitch.conf file across all cluster nodes.
/
4663, TASK_NAME_SERVICE_NSSWITCH_CONFIG, "Found configuration issue with the 'hosts' entry in the /etc/nsswitch.conf file"
//  *Cause: The 'hosts' specifications in the /etc/nsswitch.conf file should specify 'dns' before 'nis' to ensure proper IP address to name mapping.
// *Action: Ensure the 'hosts' entries across the cluster nodes define 'dns' lookup before 'nis' lookup.
/
4664, TASK_NAME_SERVICE_CLUSTER_CONFIG, "Found inconsistent name resolution entries for SCAN name \"{0}\""
//  *Cause: The nslookup utility and the configured name resolution mechanism(s), as defined in /etc/nsswitch.conf, returned inconsistent IP address information for the SCAN name identified.
// *Action: Check the Name Service Cache Daemon (/usr/sbin/nscd), the Domain Name Server (nslookup) and the /etc/hosts file to make sure the IP address for the SCAN names are registered correctly. 
/
4700, TASK_START_SYS, "Checking system requirements for"
// *Document: NO
//  *Cause:
// *Action:
/
4701, TASK_SYS_NO_PRODUCT, "No product has been specified. System requirement checks cannot proceed"
// *Document: NO
//  *Cause:
// *Action:
/
4702, TASK_SYS_NO_CHECKS, "No checks registered for this product"
// *Document: NO
//  *Cause:
// *Action:
/
4703, TASK_SYS_NO_CONFIGDATA, "Unable to find configuration data. System requirement checks cannot proceed"
// *Document: NO
//  *Cause:
// *Action:
/
4704, TASK_SYS_PASSED, "System requirement passed for"
// *Document: NO
//  *Cause:
// *Action:
/
4705, TASK_SYS_FAILED, "System requirement failed for"
// *Document: NO
//  *Cause:
// *Action:
/
4706, TASK_SYS_NO_REF_DATA, "Reference data is not available for verifying prerequisites for installing {0} for {1} release on {2}"
// *Document: NO
//  *Cause:
// *Action:
/
4707, TASK_SYS_STOPPED, "System requirement checks cannot proceed"
// *Document: NO
//  *Cause:
// *Action:
/
4750, TASK_START_CLU, "Checking cluster integrity..."
// *Document: NO
//  *Cause:
// *Action:
/
4751, TASK_CLU_PASSED, "Cluster integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4752, TASK_CLU_FAILED, "Cluster integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4753, TASK_CLU_FAILED_DETAIL, "Cluster integrity check failed. Cluster is divided into {0,number,integer} partition(s). "
// *Document: NO
//  *Cause:
// *Action:
/
4754, TASK_CLU_NORMAL_1_PART, "Cluster is not divided"
// *Document: NO
//  *Cause:
// *Action:
/
4755, TASK_CLU_1_PART, "Cluster is not divided"
// *Document: NO
//  *Cause:
// *Action:
/
4756, TASK_CLU_N_PART, "Cluster is divided into {0,number,integer} partitions"
// *Document: NO
//  *Cause:
// *Action:
/
4757, TASK_CLU_PARTITION_X, "Partition {0,number,integer} consists of the following members:"
// *Document: NO
//  *Cause:
// *Action:
/
4758, TASK_CLU_LSNODES_NOT_RUN_NODE, "'lsnodes' could not be executed on the node"
//  *Cause: Error running 'lsnodes'.
// *Action: Ensure that the executable exists and that it is executable by your OS userid.
/
4759, TASK_CLU_LSNODES_FAILED_NODE, "'lsnodes' execution failed on the node"
//  *Cause: Error running 'lsnodes'.
// *Action: Ensure that the executable <CRSHOME>/bin/lsnodes exists and that it is executable by your OS userid.
/
4760, TASK_CLU_NO_PARTITION_FOUND, "No partition found"
// *Document: NO
//  *Cause:
// *Action:
/
4761, TASK_CLU_FRAGMENTED, "Multiple partitions found. Cluster is fragmented"
// *Document: NO
//  *Cause:
// *Action:
/
4800, TASK_START_CLUMGR, "Checking Cluster manager integrity... "
// *Document: NO
//  *Cause:
// *Action:
/
4801, TASK_CLUMGR_CHECKING_CSS, "Checking CSS daemon..."
// *Document: NO
//  *Cause:
// *Action:
/
4802, TASK_CLUMGR_PASSED, "Cluster manager integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4803, TASK_CLUMGR_FAILED, "Cluster manager integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4804, TASK_CLUMGR_CSSD_DOWN_NODE, "Cluster Synchronization Service daemon \"{0}\" is not running on the node"
// *Document: NO
//  *Cause:
// *Action:
/
4805, TASK_CLUMGR_INVALID_DATA, "An error encountered in the data specified to the Task"
//  *Cause:
// *Action:
/
4806, TASK_CLUMGR_CHECKING_OHASD, "Checking Oracle High Availability Service daemon..."
//  *Document: NO
//  *Cause:
// *Action:
/
4807, TASK_CLUMGR_OHASD_DOWN_NODE, "Oracle High Availablity Service daemon \"{0}\" is not running on the node"
//  *Document : NO
//  *Cause:
// *Action:
/
4850, TASK_START_NODEADD, "Checking shared resource for node add... "
// *Document: NO
//  *Cause:
// *Action:
/
4851, TASK_START_NODEDEL, "Checking ability to remove node... "
// *Document: NO
//  *Cause:
// *Action:
/
4852, TASK_NODEADD_PASSED, "Shared resources check for node addition passed"
// *Document: NO
//  *Cause:
// *Action:
/
4853, TASK_NODEADD_FAILED, "Shared resources check for node addition failed"
// *Document: NO
//  *Cause:
// *Action:
/
4854, TASK_NODEADD_WARN, "Node addition not possible from local node"
// *Document: NO
//  *Cause:
// *Action:
/
4855, TASK_NODEDEL_PASSED, "Node removal check passed"
// *Document: NO
//  *Cause:
// *Action:
/
4856, TASK_NODEDEL_FAILED, "Node removal check failed"
// *Document: NO
//  *Cause:
// *Action:
/
4857, TASK_NODEDEL_WARN, "Node removal not possible from local node"
// *Document: NO
//  *Cause:
// *Action:
/
4858, TASK_NODEADD_VIP_WARN, "Unable to obtain VIP information from node \"{0}\". "
// *Document: NO
//  *Cause:
// *Action:
/
4859, TASK_NODEADD_LOC_NOT_SHARED, "Location \"{0}\" not shared on node(s) to be added. "
// *Document: NO
//  *Cause:
// *Action:
/
4860, TASK_NODEADD_INSURE_LOC_SHARED, "Insure location \"{0}\" is shared on node(s) to be added"
// *Document: NO
//  *Cause:
// *Action:
/
4861, TASK_NODEADD_SHARE_START, "Checking shared resources..."
// *Document: NO
//  *Cause:
// *Action:
/
4862, TASK_NODEADD_CHECK_LOC, "Checking location: \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4863, TASK_NODEADD_PASS_LOC, "Shared location check passed for: \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4864, TASK_NODEADD_FAIL_PATHLOC, "Shared path location check failed for: \"{0}\""
//  *Cause: Cannot write to path location specified.
// *Action: Verify access to path specified.
/
4865, TASK_NODEADD_ALREADY_ADD, "Node \"{0}\" already appears to be part of cluster"
// *Document: NO
//  *Cause:
// *Action:
/
4866, TASK_NODEADD_FAIL_DEVLOC, "Shared device location check failed for: \"{0}\""
//  *Cause: Cannot verify sharedness of location specified.
// *Action: Verify location specified is shared across cluster.
/
4867, TASK_NODEDEL_ALREADY_REMOVED, "Node \"{0}\" already removed from cluster"
// *Document: NO
//  *Cause:
// *Action:
/
4868, TASK_NODEDEL_VIP_FOUND, "Virtual IP (VIP) \"{0}\" found for node \"{1}\""
//  *Cause: The VIP node application identified was found on the node specified.
// *Action: Removed the specified VIP node application from the node specified.
/
4869, TASK_NODEADD_FAIL_OCRLOC, "Shared OCR location check failed"
//  *Cause: Problem reading inventory file for CRS home location.
// *Action: Verify inventory file integrity.
/
4870, TASK_NODEADD_NO_PEER, "Unable to run Peer Compatibility from local node"
// *Document: NO
//  *Cause:
// *Action:
/
4870, TASK_NODEADD_PASS_PATH, "The location \"{0}\" is not shared but is present/creatable on all nodes"
// *Document: NO
//  *Cause: 
// *Action: 
/
4871, TASK_NODEADD_CHECK_CRSHOME, "Checking CRS home location..."
// *Document: NO
//  *Cause: 
// *Action: 
/
4872, TASK_NODEADD_CHECK_OCRLOC, "Checking OCR location..."
// *Document: NO
//  *Cause: 
// *Action: 
/
4872, TASK_NODEADD_CHECK_SHARED_STORAGE, "Checking shared storage locations..."
// *Document: NO
//  *Cause: 
// *Action: 
/
4900, NO_ORCL_HOME, "Oracle home \"{0}\" does not exist"
// *Document: NO
//  *Cause:
// *Action:
/
4901, NO_ORCL_HOME_ON_NODES, "Oracle home \"{0}\" does not exist on nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4902, NO_CRS_HOME, "CRS home \"{0}\" does not exist"
// *Document: NO
//  *Cause:
// *Action:
/
4903, NO_CRS_HOME_ON_NODES, "CRS home \"{0}\" does not exist on nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
4904, OPERATION_TIMEOUT, "Verification operation timed out"
//  *Cause:
// *Action:
/
4905, OPERATION_TIMEOUT_ON_NODES, "Verification operation timed out on nodes:"
//  *Cause:
// *Action:
/
4906, OPERATION_TIMEOUT_WITH_LIMIT, "Verification operation timed out after {0} sec"
//  *Cause:
// *Action:
/
4907, OPERATION_TIMEOUT_WITH_LIMIT_ON_NODES, "Verification operation timed out after {0} sec on nodes:"
//  *Cause:
// *Action:
/
4908, NODE_IN_CLUSTER, "The following node is in cluster: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
4909, NO_CLUSTER_NODES, "Cannot identify existing nodes in cluster"
// *Document: NO
//  *Cause:
// *Action:
/
4950, TASK_ERR_CHECK_OS_VERSION_COMPAT, "Error checking Operating System Version compatibility for Universal Storage Manager on node \"{0}\" "
//  *Cause:  A remote operation to check Operating System version on the remote node failed.
// *Action: See the action for the additional error message displayed.
/
4954, TASK_OSVERCOMPAT_UNSUPPORTED_OS_VERSION, "Version \"{0}\" is NOT supported for installing ACFS on node \"{1}\""
//  *Cause: The version of operating system on the node is not compatible for installing ACFS.
// *Action: Check documentation for compatible version and install compatible version.
/
4956, TASK_OSVERCOMPAT_XMLPROC_ERR, "Error processing XML document \"{0}\" for ACFS Compatibility. \n"
// *Document: NO
//  *Cause: This is an internal error.
// *Action: Please contact Oracle Support.
/
4957, TASK_OSVERCOMPAT_NO_MATCH_RELEASE, "No matching CRS release entry found for release \"{0}\" in \"{1}\""
//  *Cause:
// *Action:
/
4958, TASK_OSVERCOMPAT_NO_RELEASES_FOUND, "The version compatibility document at \"{0}\" has no entries for any releases"
// *Document: NO
//  *Cause:
// *Action:
/
4959, TASK_OSVERCOMPAT_XML_NOT_WELL_FORMED, "The document \"{0}\" is not well formed.\n"
// *Document: NO
//  *Cause: This is an internal error.
// *Action: Please contact Oracle Support.
/
4960, TASK_OSVERCOMPAT_ERR_XML_FILE_PATH, "Error in the xml file path specified : \"{0}\""
// *Document: NO
//  *Cause: This is an internal error.
// *Action: Please contact Oracle Support.
/
5000, TASK_SOFT_CONF_ERR, "Error occured while creating file list to be queried"
// *Document: NO
//  *Cause:
// *Action:
/
5001, TASK_SOFT_CONF_COPY_ERR, "Error occured while copying file list to be queried to the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
5002, TASK_SOFT_EXECTASK_GET_FILE_INFO_NODE_ERR, "Failed to retrieve distribution software files information on node \"{0}\""
//  *Cause:
// *Action:
/
5003, TASK_SOFT_FILE_ERR_NODE, "File \"{0}\" could not be verified on node \"{1}\". OS error: \"{2}\""
//  *Cause:
// *Action:
/
5004, TASK_SOFT_FL_OWNR_INCNSSTNT_ACCRSS_NODES, "Owner of file \"{0}\" inconsistent across nodes. [Found = \"{1}\"]"
//  *Cause:
// *Action:
/
5005, TASK_SOFT_FL_OWNR_INCONSSTNT_W_CNFG_NODE, "Owner of file \"{0}\" did not match the expected value. [Expected = \"{1}\" ; Found = \"{2}\"]"
//  *Cause:
// *Action:
/
5006, TASK_SOFT_FL_GRP_INCNSSTNT_ACCRSS_NODES, "Group of file \"{0}\" incosistent across nodes. [Found = \"{1}\"]"
//  *Cause:
// *Action:
/
5007, TASK_SOFT_FL_GRP_INCONSSTNT_W_CNFG_NODE, "Group of file \"{0}\" did not match the expected value. [Expected = \"{1}\" ; Found = \"{2}\"]"
//  *Cause:
// *Action:
/
5008, TASK_SOFT_FL_PERM_INCNSSTNT_ACCRSS_NODES, "Permissions of file \"{0}\" inconsistent across nodes. [Found = \"{1}\"]"
//  *Cause:
// *Action:
/
5009, TASK_SOFT_FL_PERM_INCONSSTNT_W_CNFG_NODE, "Permissions of file \"{0}\" did not match the expected value. [Expected = \"{1}\" ; Found = \"{2}\"]"
//  *Cause:
// *Action:
/
5010, TASK_SOFT_EXECTASK_GETFILEINFO_ERR_ON_SOME_NODES, "Failed to retrieve distribution software files information from the following nodes: "
//  *Cause:
// *Action:
/
5011, TASK_SOFT_ATTRIBUTES_MISMATCHED_ACRSS_NODES, "\"{0}\" did not match across nodes"
//  *Cause:
// *Action:
/
5012, TASK_SOFT_ATTRIBUTES_MISMATCHED_REFERENCE, "\"{0}\" did not match reference"
//  *Cause:
// *Action:
/
5013, TASK_SOFT_MORE_FAILED_FILES, "...{0} more errors"
// *Document: NO
//  *Cause:
// *Action:
/
5050, TASK_SCAN_START, "Checking Single Client Access Name (SCAN)..."
// *Document: NO
//  *Cause:
// *Action: Starting SCAN verification.
/
5052, TASK_SCAN_CHECK_SETUP, "Verify SCAN and Scan Listener setup using srvctl"
// *Document: NO
//  *Cause:
// *Action: Verify SCAN configuration using 'srvctl config scan'.
/
5053, TASK_SCAN_NO_VIPS, "No SCAN VIP found"
// *Document: NO
//  *Cause: Could not identify any SCAN VIP resources on the cluster.
// *Action: Verify SCAN configuration using 'srvctl'.
/
5054, TASK_SCAN_FAILED, "Verification of SCAN VIP and Listener setup failed"
//  *Cause: Could not identify any SCAN, or Scan Listener, resources on the cluster.
// *Action: Verify SCAN configuration using 'srvctl config scan'.
/
5056, TASK_SCAN_LSNR_NOTRUN, "Scan Listener \"{0}\" not running"
//  *Cause: The identified Listener was not in the running state.
// *Action: Start the identified Listener using 'srvctl start listener'.
/
5057, TASK_SCAN_LSNR_PORT, "Scan Listener port for listener \"{0}\" do not match other ports"
//  *Cause: The port numbers used for the listener identifed do not match in all instances of the Listener started.
// *Action: Insure that all the port numbers for the identifed Listener match. See the commands 'srvctl config scan' and 'srvctl modify scan' for details on how to inspect and modify scan resource port numbers.
/
5058, TASK_SCAN_PASSED, "Verification of SCAN VIP and Listener setup passed"
// *Document: NO
//  *Cause:
// *Action: SCAN Verification status message.
/
5059, TASK_SCAN_ERROR, "An error was encountered while verifying the SCAN configuration"
//  *Cause: An error was encountered while obtaining SCAN information.
// *Action: Review additional messages displayed for details of the error that was encountered.
/
5060, TASK_SCAN_LSNR_ERROR, "SCAN Listener processing error"
//  *Cause: An error was encountered while obtaining SCAN Listener information.
// *Action: Review additional messages displayed for details of the error that was encountered.
/
5061, TASK_SCAN_VIP_NOTRUN, "SCAN VIP '\"{0}\"' not running"
//  *Cause: The SCAN VIP resources is not in the 'running' state.
// *Action: Start the SCAN VIP resource using using 'srvctl start scan -i <num>'.
/
5062, TASK_SCAN_BOTH_NOTRUN, "SCAN VIP \"{0}\" and Scan Listener \"{1}\" not running"
//  *Cause: The SCAN VIP and SCAN Listener resources are not in the 'running' state.
// *Action: Start the SCAN VIP and SCAN Listener resources using 'srvctl'.
/
5064, TASK_SCAN_WARN, "SCAN and Scan Listener may not function correctly"
//  *Cause: The SCAN VIP and/or SCAN Listener are not in the 'Running' state, or the port numbers used for the Listeners do not match across the nodes.
// *Action: Start the SCAN VIP and/or SCAN Listener, or insure that the port numbers used for the SCAN Listeners match across the nodes in the cluster.
/
5100, TASK_ASMDEVCHK_EMPTY, "ASM Devices check returned an empty list for ASM"
// *Document: NO
//  *Cause:
// *Action:
/
5101, TASK_ASMDEVCHK_SHAREDNESS, "Checking for shared devices..."
// *Document: NO
//  *Cause:
// *Action:
/
5102, TASK_ASMDEVCHK_SIZES, "Checking for device sizes..."
// *Document: NO
//  *Cause:
// *Action:
/
5103, TASK_ASMDEVCHK_PERMISSIONS, "Checking for device permissions..."
// *Document: NO
//  *Cause:
// *Action:
/
5107, TASK_ASM_START_RUNCHECK, "Starting check to see if ASM is running on all cluster nodes..."
// *Document: NO
//  *Cause:
// *Action:
/
5108, TASK_ASM_ALL_RUNNING, "ASM Running check passed. ASM is running on all cluster nodes"
// *Document: NO
//  *Cause:
// *Action:
/
5109, TASK_ASM_ALL_NOT_RUNNING, "ASM Running check failed. ASM is not running on all cluster nodes"
//  *Cause: ASM was not running on all the cluster nodes.
// *Action: Ensure ASM is running on all the cluster nodes, see 'srvctl start asm' for further information.
/
5110, TASK_ASM_NOT_RUNNING_NODES, "ASM is not running on nodes: \"{0}\" "
//  *Cause: ASM was not running on the cluster nodes specified.
// *Action: Ensure ASM is running on all the cluster nodes.
/
5111, TASK_ASMDG_START_DGCHECK, "Starting Disk Groups check to see if at least one Disk Group configured..."
//  *Cause:
// *Action:
/
5112, TASK_ASMDG_ERROR_DISKGROUPS, "An Exception occurred while checking for Disk Groups"
// *Document: NO
//  *Cause:
// *Action:
/
5113, TASK_ASMDG_DGFOUND, "Disk Group Check passed. At least one Disk Group configured"
// *Document: NO
//  *Cause:
// *Action:
/
5114, TASK_ASMDG_NODGFOUND, "Disk Group check failed. No Disk Groups configured"
//  *Cause: No ASM disk groups were found configured on the ASM instance.
// *Action: Ensure the necessary disk groups are configured in ASM.
/
5115, TASK_ASMDEVCHK_OWNER, "Checking consistency of device owner across all nodes..."
// *Document: NO
//  *Cause:
// *Action:
/
5116, TASK_ASMDEVCHK_OWNER_PASSED, "Consistency check of device owner for \"{0}\" PASSED"
// *Document: NO
//  *Cause:
// *Action:
/
5117, TASK_ASMDEVCHK_OWNER_INCONSISTENT, "Owner of device \"{0}\" is different across cluster nodes. [Found = \"{1}\"]"
// *Document: NO
//  *Cause:
// *Action:
/
5118, TASK_ASMDEVCHK_OWNER_FAILED, "Consistency check of device owner FAILED for at least one device"
// *Document: NO
//  *Cause:
// *Action:
/
5119, TASK_ASMDEVCHK_GROUP, "Checking consistency of device group across all nodes..."
// *Document: NO
//  *Cause:
// *Action:
/
5120, TASK_ASMDEVCHK_GROUP_PASSED, "Consistency check of device group for \"{0}\" PASSED"
// *Document: NO
//  *Cause:
// *Action:
/
5121, TASK_ASMDEVCHK_GROUP_INCONSISTENT, "Group of device \"{0}\" is different across cluster nodes. [Found = \"{1}\"]"
// *Document: NO
//  *Cause:
// *Action:
/
5122, TASK_ASMDEVCHK_GROUP_FAILED, "Consistency check of device group FAILED for at least one device"
// *Document: NO
//  *Cause:
// *Action:
/
5123, TASK_ASMDEVCHK_PERMS, "Checking consistency of device permissions across all nodes..."
// *Document: NO
//  *Cause:
// *Action:
/
5124, TASK_ASMDEVCHK_PERMS_PASSED, "Consistency check of device permissions for \"{0}\" PASSED"
//  *Cause:
// *Action:
/
5125, TASK_ASMDEVCHK_PERMS_INCONSISTENT, "Permissions of device \"{0}\" is different across cluster nodes. [Found = \"{1}\"]"
// *Document: NO
//  *Cause:
// *Action:
/
5126, TASK_ASMDEVCHK_PERMS_FAILED, "Consistency check of device permissions FAILED for at least one device"
// *Document: NO
//  *Cause:
// *Action:
/
5127, TASK_ASMDEVCHK_SIZE, "Checking consistency of device size across all nodes..."
// *Document: NO
//  *Cause:
// *Action:
/
5128, TASK_ASMDEVCHK_SIZE_PASSED, "Consistency check of device size for \"{0}\" PASSED"
// *Document: NO
//  *Cause:
// *Action:
/
5129, TASK_ASMDEVCHK_SIZE_INCONSISTENT, "Size of device \"{0}\" is different across cluster nodes. [Found = \"{1}\"]"
// *Document: NO
//  *Cause:
// *Action:
/
5130, TASK_ASMDEVCHK_SIZE_FAILED, "Consistency check of device size FAILED for at least one device"
// *Document: NO
//  *Cause:
// *Action:
/
5131, ASM_DISKGROUP_RETRIEVAL_FAILURE, "Failure to retrieve ASM Disk Groups information from all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
5132, ASM_DISKGROUP_EMPTY_FOUND_LIST, "List of ASM Disk Groups found is empty"
// *Document: NO
//  *Cause:
// *Action:
/
5133, ASM_DISKGROUP_HDR_NAME, "NAME"
// *Document: NO
//  *Cause:
// *Action:
/
5134, ASM_DISKGROUP_HDR_SIZE, "Total Blocks(Mb)"
// *Document: NO
//  *Cause:
// *Action:
/
5135, ASM_DISKGROUP_HDR_FREE, "Free Blocks(Mb)"
// *Document: NO
//  *Cause:
// *Action:
/
5136, ASM_DISKGROUP_SIZE_SMALL, "WARNING: Diskgroup \"{0}\" requires a minimum free space of \"{1}\" Mb"
// *Document: NO
//  *Cause:
// *Action:
/
5137, TASK_ASM_RUNCHECK_ERROR_NODE, "Failure while checking ASM status on node \"{0}\" "
//  *Cause: Could not verify ASM running on node specified.
// *Action: Ensure ASM is running on the node specified.
/
5138, ASM_DISKGROUP_NODISKGROUP_INPUT, "No list of diskgroups specified, therfore no ASM diskgroups check will be performed"
//  *Cause:
// *Action:
/
5139, ASM_DISKGROUP_CHECK_STARTED, "ASM Disk group check for database started..."
// *Document: NO
//  *Cause:
// *Action:
/
5140, ASM_DISKGROUP_CHECK_COMPLETED, "ASM Disk group check for database completed"
// *Document: NO
//  *Cause:
// *Action:
/
5141, ASM_DISKGROUP_CHECK_PASSED, "ASM Disk group check for database PASSED"
// *Document: NO
//  *Cause:
// *Action:
/
5142, ASM_DISKGROUP_CHECK_FAILED, "ASM Disk group check for database FAILED"
// *Document: NO
//  *Cause:
// *Action:
/
5143, ASM_DISKGROUP_NODES_AVAIL_START, "Checking availability of disk groups on all nodes..."
// *Document: NO
//  *Cause:
// *Action:
/
5144, ASM_DISKGROUP_UNAVAIL_NODES, "ASM Disk group \"{0}\" is unavailable on nodes \"{1}\""
//  *Cause: Could not verify existence of ASM disk group specified on the nodes indicated.
// *Action: Verify existence of ASM group identified on the specified nodes, see 'asmcmd' for further information.
/
5145, ASM_DISKGROUP_UNAVAIL_ALL_NODES, "ASM Disk group \"{0}\" is unavailable on all nodes"
//  *Cause: Could not verify existence of ASM disk group specified on all the nodes.
// *Action: Verify existence of ASM group identified on the cluster nodes.
/
5146, ASM_DISKGROUP_AVAIL_ALL_NODES, "ASM Disk group \"{0}\" is available on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
5147, ASM_DISKGROUP_NODES_AVAIL_COMPLETE, "Check of disk group availability on all nodes completed"
// *Document: NO
//  *Cause:
// *Action:
/
5148, ASM_DISKGROUP_SIZE_CHECK_START, "Checking size of disk groups..."
// *Document: NO
//  *Cause:
// *Action:
/
5149, TASK_ASMDEVCHK_NOTSHARED, "WARNING: Storage \"{0}\" is not shared on all nodes"
//  *Cause:
// *Action:
/
5150, TASK_ASMDEVCHK_NONODES, "Path {0} is not a valid path on all nodes"
//  *Cause:
// *Action:
/
5151, TASK_ADMIN_ERR_ASMADMINGROUP_FROM_CRSHOME, "Error attempting to obtain ASMADMIN group from CRS home \"{0}\" "
//  *Cause:
// *Action:
/
5152, TASK_ADMIN_ERR_ASMADMINSAME_FROM_CRSHOME, "The ASM Admin group cannot be the same is the current group"
//  *Cause:
// *Action:
/
5153, TASK_ADMIN_ASMADMIN_PASSED, "ASM Admin group exclusiveness check passed"
// *Document: NO
//  *Cause:
// *Action:
/
5154, TASK_USM_OCR_ON_ASM, "OCR detected on ASM. Running ACFS Integrity checks..."
// *Document: NO
//  *Cause:
// *Action:
/
5155, ASM_DISKGROUP_RETRIEVAL_FAILURE_NODE, "Failure to retrieve ASM Disk Groups on node \"{0}\""
//  *Cause: Could not verify existence of ASM disk groups on the node specified.
// *Action: Verify existence of ASM disk groups on the node specified.
//  *Cause:
// *Action:
/
5156, TASK_USMDRIVER_NOTINSTALLED_ALL_NODES, "ACFS Drivers not installed on all of the nodes"
//  *Cause:
// *Action:
/
5160, TASK_USMDRIVER_START, "Task ACFS Drivers check started..."
// *Document: NO
//  *Cause:
// *Action:
/
5161, TASK_USMDRIVER_PASSED, "Task ACFS Drivers check passed"
// *Document: NO
//  *Cause:
// *Action:
/
5162, TASK_USMDRIVER_FAILED, "Task ACFS Drivers check failed"
// *Document: NO
//  *Cause:
// *Action:
/
5163, TASK_USMDRIVER_INSTALLED, "ACFS Drivers installed on the following nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
5165, TASK_USMDRIVER_NOTINSTALLED_FAIL_NODES, "ACFS Drivers not installed on the following nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
5166, TASK_USMDRIVER_NOTINSTALLED_UNKNOWN_NODES, "Installed status of ACFS drivers is unknown on the following nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
5167, TASK_USMDRIVER_LOADED, "ACFS Drivers loaded on the following nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
5168, TASK_USMDRIVER_NOTLOADED_ALL_NODES, "ACFS Drivers not loaded on all of the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
5169, TASK_USMDRIVER_NOTLOADED_FAIL_NODES, "ACFS Drivers not loaded on the following nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
5170, TASK_USMDRIVER_NOTLOADED_UNKNOWN_NODES, "Loaded status of ACFS drivers is unknown on the following nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
5173, TASK_USMDRIVER_VERSION_MATCH_NODE, "ACFS Driver version is compatible with Operating System version on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
5174, TASK_USMDRIVER_VERSION_NO_MATCH_NODE, "ACFS Driver version is not compatible with Operating System version on node \"{0}\""
//  *Cause: The version of ACFS driver is not compatible with the Operating system version on the node.
// *Action: Check documentation for compatible version and install compatible version.
/
5175, TASK_USMDRIVER_VERSION_MATCH_FAIL_NODE, "Failed to retrieve ACFS driver version on node \"{0}\". Driver version compatibility check cannot be performed"
//  *Cause: The version of the ACFS driver could not be retrieved from specified nodes.
// *Action: Make sure that ACFS driver is installed on these nodes.
/
5176, TASK_USMDRIVER_VERSION_FAIL_LOCAL, "Failed to retrieve Operating System version on the local node. ACFS driver version compatibility check will not be performed"
//  *Cause: Operating system version on local node could not be determined.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
5177, TASK_USMDRIVER_GLOBALFAILURE, "Global failure when attempting to query ACFS driver state option \"{0}\" on all nodes"
//  *Cause: ACFS driver state could not be obtained on all the nodes.
// *Action: Make sure that user executing this check has execute permissions on the usm_driver_state command.
/
5178, TASK_USMUDEVCHECK_PASSED, "UDev attributes check passed for {0} "
// *Document: NO
//  *Cause:
// *Action:
/
5179, TASK_USMUDEVCHECK_FAILED, "UDev attributes check failed for {0} "
// *Document: NO
//  *Cause:
// *Action:
/
5180, TASK_USMDEV_HDR_NAME, "Device"
// *Document: NO
//  *Cause:
// *Action:
/
5181, TASK_USMDEV_HDR_OWNER, "Owner"
// *Document: NO
//  *Cause:
// *Action:
/
5182, TASK_USMDEV_HDR_GROUP, "Group"
// *Document: NO
//  *Cause:
// *Action:
/
5183, TASK_USMDEV_HDR_PERMS, "Permissions"
// *Document: NO
//  *Cause:
// *Action:
/
5184, TASK_USM_DEVICE_ATTRIB_NOK, "Check of following Udev attributes of \"{0}\" failed: \"{1}\" "
//  *Cause: Found incorrect attributes for the specified device.
// *Action: Ensure that the device attributes are set correctly. See Configurable Dynamic Device Naming documentation (udev) for further information.
/
5185, TASK_USM_DEVICE_NONE_NODE, "No Udev entries found on node \"{0}\" "
// *Document: NO
//  *Cause: 
// *Action:
/
5186, TASK_USM_DEVICE_FAIL_NODE, "Check for Udev permissions failed on node \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
5187, TASK_USMDEVICE_GLOBALFAILURE, "Retreival of Udev information failed on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
5190, TASK_USM_DEVICE_FAIL_PARSE_NODE, "An error was encountered when parsing the output of Udev permissions on node \"{0}\". The output is : \"{1}\" "
// *Document: NO
//  *Cause:
// *Action:
/
5191, TASK_USMDEVCHECK_STARTED, "UDev attributes check for {0} started..."
// *Document: NO
//  *Cause:
// *Action:
/
5192, TASK_USMDEV_HDR_RESULT, "Result"
// *Document: NO
//  *Cause:
// *Action:
/
5193, TASK_ASMDEVCHK_EXPAND_FAILED, "No devices found matching discovery string \"{0}\" "
//  *Cause: The specified device may not exist on the node being tested.
// *Action: Specify a correct discovery string that matches to existing devices on the node being tested.
/
5194, TASK_ASMDEVCHK_DEFAULT_DISCOVER, "Discovery string not specified in input, using default ASM discovery string \"{0}\" "
// *Document: NO
// *Cause: None
// *Action: None
/
5195, TASK_ASMDEVCHK_NO_SHARED, "No shared devices found"
//  *Cause: No shared storage was found based on the discovery string used in the verification.
//  *Action: A message should have been displayed for each shared storage check failure. For each such message, perform the suggested action for that message.
/
5196, TASK_UDEV_OCR_LOCS_FAILED, "Failed to retrieve OCR locations"
// *Cause: An atttempt to retrieve the OCR locations failed, possibly due to incorrect or incomplete Clusterware install, or due to incorrect configuration of the OCR, or due to invalid or incorrect OCR location file ocr.loc.
// *Action: Make sure that the Clusterware installation and Clusterware configuration has been correctly completed, and the ocr.loc file is present and accessible.
/
5197, TASK_UDEV_VDISK_LOCS_FAILED, "Failed to retrieve voting disk locations"
// *Cause: An atttempt to retrieve the voting disk locations failed, possibly due to incorrect or incomplete Clusterware install, or due to incorrect configuration of the Clusterware.
// *Action: Make sure that the Clusterware installation and Clusterware configuration has been correctly completed.
/
5198, TASK_USM_TESTING_DEVICE, "Checking udev settings for device \"{0}\" "
// *Document: NO
//  *Cause: None
// *Action: None
/
5200, TASK_DESC_GNS_INTEGRITY, "This test checks the integrity of GNS across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
5201, TASK_DESC_GPNP_INTEGRITY, "This test checks the integrity of GPNP across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
5202, TASK_GNS_START, "Checking GNS integrity..."
// *Document: NO
//  *Cause:
// *Action:
/
5203, TASK_GNS_INTEGRITY_PASSED, "GNS integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
5204, TASK_GNS_INTEGRITY_FAILED, "GNS integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
5205, GNSVIP_CHECK_CONFIG_FAILED, "GNS VIP resource configuration check failed."
//  *Cause: An error occurred while trying to obtain GNS VIP resource configuration information.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
5206, GNS_STATUS_CHECK_START, "Checking status of GNS resource..."
// *Document: NO
//  *Cause:
// *Action:
/
5207, HDR_ENABLED, "Enabled?"
// *Document: NO
//  *Cause:
// *Action:
/
5208, GNSVIP_STATUS_CHECK_START, "Checking status of GNS VIP resource..."
// *Document: NO
//  *Cause:
// *Action:
/
5209, TASK_GNSVIP_CONFIG_CHECK_PASSED, "GNS VIP resource configuration check passed."
// *Document: NO
//  *Cause:
// *Action:
/
5210, GNS_RUNNING_MULTIPLE_NODES, "GNS resource is running on multiple nodes \"{0}\""
//  *Cause: GNS resource should be running on only one node in the cluster at any given time. It was found to be running on multiple nodes at the same time.
// *Action: Stop the GNS resources running on various nodes using 'srvctl stop gns' command and leave it running on just one node of the cluster.
/
5211, GNS_NOT_RUNNING, "GNS resource is not running on any node of the cluster"
//  *Cause: GNS resource should be running on one node of the cluster. GNS resource wasn't running on any node. 
// *Action: GNS can be configured using 'srvctl add gns' command. Use 'srvctl start gns' command to start GNS.
/
5212, TASK_GNS_CONFIG_CHECK_PASSED, "GNS resource configuration check passed."
// *Document: NO
//  *Cause:
// *Action:
/
5213, GNS_CHECK_CONFIG_FAILED, "GNS resource configuration check failed."
//  *Cause: An error occurred while trying to obtain GNS resource configuration information.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
5214, GNS_NAME_RESOLUTION_CHECK, "Checking if GNS resolved IP addresses for \"{0}\" are reachable"
// *Document: NO
//  *Cause:
// *Action:
/
5215, TASK_GNS_REACH_CHECK_PASSED, "GNS resolved IP addresses are reachable"
// *Document: NO
//  *Cause:
// *Action:
/
5216, TASK_GNS_REACH_CHECK_FAILED, "The following GNS resolved IP addresses for \"{0}\" are not reachable: \"{1}\""
//  *Cause: The listed IP addresses for the fully domain qualified name (FDQN) listed in the message and resolved by GNS were not reachable. 
// *Action: Make sure that the configuration of GNS resource is proper using 'srvctl config gns' command. If GNS is configured correctly make sure that the network administrator has provided a set of IP addresses for the subdomain of the cluster and Domain Name Server (DNS) is forwarding requests for these to the GNS.
/
5217, TASK_GNS_FDQN_UNKNOWN, "An error occurred while trying to look up IP address for \"{0}\""
//  *Cause: An error occurred while trying to translate the fully domain qualified name (FDQN), listed in the message, to IP addresses.  
// *Action: These IP address requests should have been forwarded to GNS by the Domain Name Server (DNS). Check the configuration of GNS resource using 'srvctl config gns' command. If GNS is configured correctly make sure that the network administrator has provided a set of IP addresses for the subdomain of the cluster and DNS is forwarding requests for these to the GNS.
5218, TASK_GNS_FDQN_NO_IPS, "\"{0}\" did not resolve into any IP address"
//  *Cause: The fully domain qualified name (FDQN) listed in the message did not resolve into any IP address.
// *Action: Make sure that the configuration of GNS resource is proper using 'srvctl config gns' command. If GNS is configured correctly make sure that the network administrator has provided a set of IP addresses for the subdomain of the cluster and Domain Name Server (DNS) is forwarding requests for these to the GNS.
/
5219, GNSVIP_GNS_NOT_ON_SAME_NODE, "GNS and GNS VIP resources are running on different nodes. GNS is running on nodes \"{1}\" while GNS VIP is running on \"{0}\"."
//  *Cause: The GNS and GNS VIP resources were running on different nodes.
// *Action: If GNS should be running on one node of the cluster at any given point of time. Make sure that GNS is not running on multiple nodes of the cluster using 'srvctl config gns' command. If GNS is running on multiple nodes then shut down all but one using 'srvctl stop gns' command.
5220, GNSVIP_NOT_RUNNING, "GNS VIP resource was not running on any node of the cluster"
//  *Cause: The GNS VIP resource was not running on any nodes of the cluster.
// *Action: Make sure that the VIP name specified in 'srvctl add gns' command is an unused address belonging to one of the public networks of the cluster nodes.
5250, TASK_GPNP_START, "Checking GPNP integrity..."
// *Document: NO
//  *Cause:
// *Action:
/
5251, TASK_GPNP_INTEGRITY_PASSED, "GPNP integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
5252, TASK_GPNP_INTEGRITY_FAILED, "GPNP integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
5253, TASK_GPNP_RESCMD_GLOBALFAILURE, "Command \"{0}\" executed to retrieve GPNP resource status failed on all of the nodes"
//  *Cause: An attempt to execute the displayed command failed on all of the nodes.
// *Action: Make sure that the nodes of the cluster are accessible from the current node. Make sure that the user executing the check has permission to execute commands on nodes using 'ssh'.
/
5254, TASK_GPNP_NO_OUTPUT, "Command \"{0}\" executed on node \"{1}\" produced no output"
//  *Cause: An attempt to run the command listed on the node listed produced no output.
// *Action: This is an internal error. Contact Oracle support services.
/
5255, TASK_GPNP_RES_DOWN_NODE, "The GPNP resource is not in ONLINE status on the following node(s): {0}"
//  *Cause: The GPNP resource was found to be in OFFLINE or UNKNOWN state on the nodes listed.
// *Action: This is not an error if the GPNP resource was shutdown. If it is not the expected state then use the command 'crsctl start res ora.gpnpd -init' to start the GPNP resource.
/
5256, TASK_GPNP_RES_ERR_NODE, "Command \"{0}\" executed to retrieve the GPNP resource status failed on node(s): {1}"
//  *Cause: An attempt to run the command listed failed on the node listed. 
// *Action: Make sure that the nodes listed are accessible from the current node. Make sure that the user executing the check has permission to executed commands on the node(s) listed using 'ssh'.
/
5280, TASK_ELEMENT_OHASD_INTEGRITY, "OHASD Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
5281, TASK_DESC_OHASD_INTEGRITY, "This test checks the integrity of OHASD across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
5282, TASK_OHASD_START, "Checking OHASD integrity..."
// *Document: NO
//  *Cause:
// *Action:
/
5283, TASK_OHASD_INTEGRITY_PASSED, "OHASD integrity check passed"
// *Document: NO
//  *Cause:
// *Action:
/
5284, TASK_OHASD_INTEGRITY_FAILED, "OHASD integrity check failed"
// *Document: NO
//  *Cause:
// *Action:
/
5300, FAIL_GET_CRS_ACTIVE_VERSION, "Failed to retrieve active version for CRS on this node"
//  *Cause: Could not identify location of CRS home.
// *Action: Ensure correct installation of CRS.
/
5301, FAIL_GET_CRS_HOME, "Failed to locate CRS home"
//  *Cause: Could not locate the CRS home.
// *Action: Ensure the install of CRS has completed successfully and the CRS home is setup correctly.
/
5302, FAIL_EXECTASK_CMD, "Failed to execute the exectask command on node \"{0}\" "
//  *Cause: Could not execute command specified on node listed.
// *Action: Verify command specified can be exectued on node listed.
/
5303, FAIL_CRSCTL_CMD, "Failed to execute the crsctl command \"{0}\" on node \"{1}\" "
// *Document: NO
//  *Cause:
// *Action:
/
5304, COMMAND_OUTPUT, "The command output is: \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
5305, CLUSTERWARE_NOT_HEALTHY, "The Oracle clusterware is not healthy on node \"{0}\""
//  *Cause: An error was found with the Oracle Clusterware on the node specified.
// *Action: Review the error reported and resolve the issue specified.
/
5306, CLUSTERWARE_IS_HEALTHY, "The Oracle clusterware is healthy on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
5307, FAIL_GET_HA_HOME, "Failed to retrieve Oracle Restart home"
//  *Cause: Could not identify location of Oracle Restart home.
// *Action: Ensure that Oracle Local Repository (OLR) was created correctly. See Oracle Local Repository documentation for further information.
/
5308, OHASD_NOT_RUNNING_OR_CONTACTED, "ohasd is either not running or could not be contacted on node \"{0}\" "
//  *Cause: CRSCTL did not report that OHAS was online.
// *Action: Review the error information displayed and verify the state of OHAS on the node identified.
/
5309, OHASD_IS_RUNNING, "ohasd is running on node \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
5310, FAIL_CHK_FILE_EXIST, "Check for existence of file \"{0}\" could not be performed on node \"{1}\". "
// *Document: NO
//  *Cause:
// *Action:
/
5311, FILE_NOT_EXIST_OR_ACCESS, "File \"{0}\" either does not exist or is not accessible on node \"{1}\". "
//  *Cause: Cannot access the file specified.
// *Action: Verify that the specified file exists and can be access on the node identified.
/
5312, NO_OHASD_IN_INITTAB, "No ohasd entry was found in /etc/inittab file"
//  *Cause: Did not find 'respawn:/etc/init.d/init.ohasd' line in '/etc/inittab' file.
// *Action: Insure that the OHASD environment has been setup correctly.
/
5313, FAIL_OHASD_IN_INITTAB, "Failed to search for ohasd entry in /etc/inittab file on node \"{0}\" "
//  *Cause: An error was encountered trying to search for OHASD information in /etc/inittab.
// *Action: Insure that the OHASD environment has been setup correctly and that /etc/inittab is accessible on the specified node.
/
5314, NO_CRS_HA_INSTALL_LOCAL, "Could not find CRS, or Oracle Restart, installed on the local node"
//  *Cause: Could not locate the CRS, or Oracle Restart, installation from the local node.
// *Action: Ensure the install of CRS, or Oracle Restart, has completed successfully and the CRS, or Oracle Restart, home is setup correctly.
/
5315, FAIL_GET_CRS_HA_INSTALL, "Failed to determine the existence of CRS or Oracle Restart install"
// *Document: NO
//  *Cause:
// *Action:
/
5316, FAIL_GET_CRS_SOFTWARE_VERSION, "Failed to retrieve version of CRS installed on node \"{0}\""
//  *Cause: Could not identify location of CRS home.
// *Action: Verify installation of CRS on the identified node.
/
5317, CRS_SOFTWARE_VERSION_CHECK, "The Clusterware is currently being upgraded to version: \"{0}\".\n The following nodes have not been upgraded and are\n running Clusterware version: \"{1}\".\n    \"{2}\""
//  *Cause: The CRS integrity may have discovered that your Oracle clusterware stack is partially upgraded.
// *Action: Review warnings and make modifications as necessary. If the warning is due to partial upgrade of Oracle clusterware stack then continue with upgrade and finish it.
/
5318, NO_HA_CONFIG_LOCAL, "No Oracle Restart is found configured on the local node"
// *Document: NO
//  *Cause:
// *Action:
/
5319, CSS_NOT_HEALTHY, "Oracle Cluster Synchronization Services do not appear to be online."
//  *Cause: An error was encountered when trying to verify the status of Oracle Cluster Synchronization Services.
// *Action: Verify the state of the Oracle Cluster Synchronization Services using 'crsctl check cluster'. 
/
5320, CSS_IS_HEALTHY, "Oracle Cluster Synchronization Services appear to be online."
// *Document: NO
//  *Cause:
// *Action:
/
5321, FAIL_GET_CRS_OR_HA_HOME, "Failed to get the CRS or Oracle Restart home"
//  *Cause: Could not locate the CRS, or Oracle Restart, home.
// *Action: Ensure the install of CRS, or Oracle Restart, has completed successfully and the CRS, or Oracle Restart, home is setup correctly.
/
5400, TASK_NTPCHECK_PASSED, "Clock synchronization check using Network Time Protocol(NTP) passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5401, TASK_NTPCHECK_FAILED, "Clock synchronization check using Network Time Protocol(NTP) failed"
//  *Cause: One or more of the Clock Synchronization checks failed.
// *Action: Correlate with the other failure messages displayed and fix those failures.
/
5402, TASK_NTP_CONF_NOT_ON_NODE, "Warning: Could not find NTP configuration file \"{0}\" on node \"{1}\""
//  *Cause: NTP might not have been configured on the node, or NTP might have been configured with a configuration file different from the one indicated.
// *Action: Configure NTP on the node if not done so yet. Refer to your NTP vendor documentation for details.
/
5403, TASK_NTP_CONF_FAILED_NODE, "Operation to check presence of NTP configuration file \"{0}\" failed on node \"{1}\" "
//  *Cause: The operation to check NTP configuration file failed on node indicated. The failure is due to a reason like incorrect permissions on the configuration file, communications error with the node, missing or inaccessible remote execution binary on the node, etc.
// *Action: Review the error messages that follow this message and fix the problem(s) indicated.
/
5404, TASK_NTP_CONF_EXIST_ON_ALL_NODES, "The NTP configuration file \"{0}\" is available on all nodes"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5405, TASK_NTP_CONF_NOT_ON_ALL_NODES, "The NTP configuration file \"{0}\" does not exist on all nodes"
//  *Cause: The configuration file specified was not available or was inaccessible on the given nodes.
// *Action: If you want to use NTP for time synchronization, create this file and setup its configuration as described in your vendor's NTP document. If you plan to use CTSS for time synchronization then NTP configuration should be uninstalled on all nodes of the cluster. Refer to "Preparing Your Cluster" of "Oracle Database 2 Day + Real Application Clusters Guide".
/
5406, TASK_NTP_CONF_FAILED, "NTP Configuration file Check failed"
//  *Cause: Attempt to check presence of configuration file failed on one or more nodes.
// *Action: Look at the related error messages and fix them.
/
5407, TASK_NTP_TIME_SERVER_COMMON, "NTP Time Server \"{0}\" is common to all nodes on which the NTP daemon is running"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5408, TASK_NTP_TIME_SERVER_ONLY_ON_NODES, "NTP Time Server \"{0}\" is common only to the following nodes \"{1}\" "
//  *Cause: One or more nodes in the cluster do not synchronize with the NTP Time Server indicated.
// *Action: At least one common NTP Time Server is required for a successful Clock Synchronization check. If there are none, reconfigure all of the nodes in the cluster to synchronize with at least one common NTP Time Server.
/
5409, TASK_NTP_TIME_SERVER_COMMON_PASSED, "Check of common NTP Time Server passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5410, TASK_NTP_TIME_SERVER_COMMON_FAILED, "Check of common NTP Time Server failed"
//  *Cause: The NTP query command showed there is no common time server among all of the nodes in the cluster.
// *Action: At least one common NTP Time Server is required for a successful Clock Synchronization check. Reconfigure all of the nodes in the cluster to synchronize with at least one common NTP Time Server. If you plan to use CTSS for time synchronization then NTP configuration should be uninstalled on all nodes of the cluster. Refer to "Preparing Your Cluster" of "Oracle Database 2 Day+ Real Application Clusters Guide".
/
5411, TASK_NTPQUERY_GLOBALFAILURE, "Query of NTP daemon failed on all nodes on which NTP daemon is running"
//  *Cause: Attempt to query the NTP daemon failed on all of the nodes of the cluster because the 'ntpq' command could not be found.
// *Action: Make sure that the NTP query command 'ntpq' is available on all nodes and the user running the CVU check has execute privilage for it.
/
5412, TASK_NTP_OFFSET_WITHIN_LIMITS_NODE, "Node \"{0}\" has a time offset of {1} that is within permissible limits of {2} from NTP Time Server \"{3}\" "
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5413, TASK_NTP_OFFSET_NOT_WITHIN_LIMITS_NODE, "Node \"{0}\" has a time offset of {1} that is beyond permissible limit of {2} from NTP Time Server \"{3}\" "
//  *Cause: The time offset for the given node clock with the specified NTP Time Server is beyond permissible limits, possibly due to a clock drift, or due to an incorrectly functioning time server.
// *Action: Make sure that the Time Server is functioning properly, and if yes, adjust the system clock so that the offset is within limits.
/
5414, TASK_NTP_TOTAL_CONIG_CHECK_FAIL, "Check of NTP Config file failed on all nodes. Cannot proceed further for the NTP tests"
//  *Cause: Attempt to check existence of config file failed on all nodes.
// *Action: Look at the individual error messages displayed for the respective nodes and the overall result message and take appropriate action.
/
5415, TASK_NTP_TOTAL_DAEMON_CHECK_FAIL, "Check to see if NTP daemon is running failed"
//  *Cause:  Attempt to check if the NTP daemon was running failed on nodes of the cluster.
// *Action: Look at the accompanying error messages for the nodes on which the check failed and fix the problem. If you plan to use CTSS for time synchronization then NTP configuration should be uninstalled on all nodes of the cluster. Refer to "Preparing Your Cluster" of "Oracle Database 2 Day+ Real Application Clusters Guide".
/
5416, TASK_NTP_TOTAL_QUERY_FAIL, "Query of NTP daemon failed on all nodes"
//  *Cause: An attempt to query the NTP daemon using the 'ntpq' command failed on all nodes.
// *Action: Make sure that the NTP query command 'ntpq' is available on all nodes and make sure that user running the CVU check has permissions to execute it.
/
5417, TASK_NTP_START_TIMESERVER_CHECK, "NTP common Time Server Check started..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5418, TASK_NTP_OFFSET_CHECK_START, "Clock time offset check from NTP Time Server started..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5419, TASK_NTP_CONF_FILE_CHECK_PASS, "NTP Configuration file check passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5420, TASK_NTP_CONFIG_FILE_CHECK_START, "NTP Configuration file check started..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5421, TASK_NTP_CONF_FAIL_ON_NODES, "NTP configuration file check failed on the following nodes:"
//  *Cause: Check of existence of NTP configuration file failed on nodes listed because NTP was not configured on those nodes.
// *Action: If you plan to use NTP for time synchronization across nodes of the cluster then configure NTP on all of the nodes. If you plan to use CTSS for time synchronization then NTP configuration should be uninstalled on all nodes of the cluster. Refer to "Preparing Your Cluster" of "Oracle Database 2 Day+ Real Application Clusters Guide".
/
5422, TASK_NTP_BEGIN_TASK, "Starting Clock synchronization checks using Network Time Protocol(NTP)..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5423, TASK_NTP_OFFSET_CHECK_PASSED, "Clock time offset check passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5424, TASK_NTP_OFFSET_CHECK_FAILED, "Clock time offset check failed"
//  *Cause: Offsets on all of the nodes in the cluster were not within limits for any Time Server.
// *Action: Look at the individual messages displayed and fix the problems indicated.
/
5425, TASK_NTP_OFFSET_WITHIN_LIMITS, "Time Server \"{0}\" has time offsets that are within permissible limits for nodes \"{1}\". "
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5426, TASK_NTP_OFFSET_CHECK_START_NODES, "Checking on nodes \"{0}\"... "
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5427, TASK_NTP_TIMESERV_OFFSET_DISPLAY, "Time Server: {0} \nTime Offset Limit: {1} msecs"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5428, TASK_NTP_TOTAL_CONIG_CHECK_OKAY, "Network Time Protocol(NTP) configuration file not found on any of the nodes. Oracle Cluster Time Synchronization Service(CTSS) can be used instead of NTP for time synchronization on the cluster nodes"
//  *Cause: NTP is not configured on the cluster nodes.
// *Action: This is not an error if the system administrator intended to use Oracle Cluster Time Synchronization Service (CTSS) for clock synchronization on the cluster. If not then install NTP on all nodes of the cluster according to your NTP vendor documentation.
/
5429, TASK_VOTEDSK_START, "Checking Oracle Cluster Voting Disk configuration..."
// *Document: NO
//  *Cause: Inidicate start of Voting disk configuration check. 
// *Action: 
/
5430, TASK_VOTEDSK_WARNING, "Voting disk configuration does not meet Oracle's recommendation of three voting disk locations"
//  *Cause: For high availability, Oracle recommends that you have a minimum of three voting disk locations.
// *Action: Add additional voting disk locations to meet the Oracle recommended amount of three voting disks.
/
5431, TASK_VOTEDSK_FAILED, "Oracle Cluster Voting Disk configuration check failed"
//  *Cause: Unabled to obtain Voting Disk configuration.
// *Action: Review Clusterware and Voting Disk configuration.
/
5432, TASK_VOTEDSK_PASSED, "Oracle Cluster Voting Disk configuration check passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5433, TASK_VOTEDSK_STATUS, "The current voting disk state is at high risk"
//  *Cause: The current state of the voting disk locations is susceptible to the loss of one voting disk location resulting in failure of the cluster.
// *Action: Add additional voting disk locations, or bring existing locations online, to reduce the risk of losing one voting disk location.
/
5434, TASK_CRS_VER, "Cannot identify the current CRS software version"
//  *Cause: Unable to obtain CRS version from CRSCTL.
// *Action: Insure that CRSCTL is accessible on the nodes being verified.
/
5435, TASK_VOTEDSK_WARNING_PRE112, "Voting disk configuration does meet Oracle's recommendation"
//  *Cause: For high availability, Oracle recommends that you have more than two voting disk locations.
// *Action: Add additional voting disk locations.
/
5436, TASK_NTP_TOTAL_SLEWING_FAIL, "The NTP daemon running on one or more nodes lacks the slewing option \"{0}\""
//  *Cause: NTP daemon on one or more nodes lacked slewing option. 
// *Action: For more information on slewing option refer to NTP daemon's man pages. Make sure that the NTP daemon is running on all nodes. Make sure that slewing option is specified in the command line of NTP daemon. For a list of nodes on which this check failed look at the accompanying error messages.
/
5437, TASK_NTP_SLEWING_CHECK, "Check: NTP daemon command line"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5438, SLEWING_SET, "Slewing Option Set?"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5439, NTPD_NOT_SLEWED, "NTP daemon does not have slewing option \"{0}\" set on node \"{1}\""
//  *Cause: NTP daemon on the specified node does not have the slewing option set.
// *Action: Shutdown and restart the NTP daemon with the slewing option set. For more information on NTP daemon slewing option refer to NTP daemon's man pages.
/
5440, ERR_CHECK_NTPD_SLEWED_STATUS, "NTP daemon slewing option \"{0}\" check could not be performed on node \"{1}\""
//  *Cause: An attempt to obtain the command line options for NTP daemon failed.
// *Action: Make sure that the NTP daemon is running on the node. Also look at other messages accompanying this message.
/
5441, TASK_NTPD_ALL_SLEWED, "NTP daemon slewing option check passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5442, TASK_NTPD_SLEWING_GLOBALFAIL, "Could not obtain NTP daemon's command line on any node"
//  *Cause: An attempt to obtain the command line options for the NTP daemon's failed on all nodes.
// *Action: Make sure that the NTP daemon is running on all the nodes. Make sure that slewing option is set on all the nodes of the cluster.
/
5443, TASK_NTPD_SOME_NOT_SLEWED, "NTP daemon slewing option check failed on some nodes"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5444, TASK_NTP_SLEWING_CHECK_START, "Checking NTP daemon command line for slewing option \"{0}\""
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5445, TASK_NTP_BOOT_SLEWING_CHECK_START, "Checking NTP daemon''s boot time configuration, in file \"{0}\", for slewing option \"{1}\""
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5446, TASK_NTP_OFFSET_CHECK, "Check: Clock time offset from NTP Time Server"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5450, SPACE_CONSTRAINT_NO_MATCH, "Constraint type does not match"
// *Cause: The specified constraint does not relate to space checks.
// *Action: Make sure that the space constraint data is well formed and consistent in the constratint xml.
/
5451, SPACE_CONSTRAINT_MISSING_KEYDATA, "Missing key data \"{0}\" "
// *Cause: The data required for constraint check is missing.
// *Action: Verify that the space constraint data is correctly specified in the constraint xml.
/
5452, SPACE_CONSTRAINT_MISSING_REFKEYDATA, "Missing key reference data \"{0}\""
// *Cause: The reference data required for constraint check is missing.
// *Action: For a greater than/equal comparison, reference data is required.Verify that the space constraint check reference data is correctly specified in the constraint xml.
/
5453, SPACE_CONSTRAINT_INVALID_DATA, "Invalid data set for \"{0}\", EXPECTED:\"{1}\", FOUND: \"{2}\" "
// *Cause: The specified data is invalid for the space constraint check being performed.
// *Action: Make sure that correct data is specified, using the values indicated in the message.
/
5454, SPACE_CONSTRAINT_INVALID_QUAL, "Qualifier \"{0}\" is not supported for \"{1}\" "
// *Cause: The indicated qualifier is not supported for the class indicated in the message.
// *Action: Make sure that the correct qualifier is specified.
/
5455, SPACE_CONSTRAINT_INVALID_CONSTR, "Cannot apply invalid constraint"
// *Cause: The specified constraint is invalid.
// *Action: Specify the correct constraint.
/
5456, SPACE_CONSTRAINT_INVALID_COMPAT, "Invalid constraint. Compatibility check cannot proceed"
// *Cause: The specified constraint is invalid.
// *Action: Specify the correct constraint for the compatibility check.
/
5457, OCR_LOCATIONS, "OCR"
// *Document: NO
// *Cause: 
// *Action: 
/
5458, VOTING_LOCATIONS, "VotingDisk"
// *Document: NO
// *Cause: 
// *Action: 
/
5459, TASK_DESC_SHARED_STORAGE_ACCESS_OCR, "This test checks the shared access of OCR locations across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
5460, TASK_DESC_SHARED_STORAGE_ACCESS_VOTING, "This test checks the shared access of voting disk locations across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
5461, INVALID_VARIABLE_SETTING, "Encountered an invalid setting for internal variable \"{0}\""
//  *Cause: This is an internal error. 
// *Action: Please contact Oracle Support.
/

5470, TASK_NTP_BOOT_TOTAL_SLEWING_FAIL, "The NTP daemon''s boot time configuration, in file \"{0}\", on one or more nodes lacks the slewing option \"{1}\""
//  *Cause: NTP daemon boot time configuration on one or more nodes lacked slewing option.
// *Action: Make sure that the slewing option is specified in the file listed. For a list of nodes on which this check failed look at the  accomoanying error messages.
/
5471, TASK_NTP_BOOT_SLEWING_CHECK, "Check: NTP daemon's boot time configuration"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5472, NTPD_BOOT_NOT_SLEWED, "NTP daemon''s boot time configuration does not have slewing option \"{0}\" set on node \"{1}\""
//  *Cause: NTP daemon boot time configuration on the specified node does not have the slewing option set.
// *Action: The NTP daemon's boot time configuration file is listed with the messages accompanying this message. Make sure that slewing option is set in configuration file. For more information on NTP daemon slewing option refer to NTP daemon's man pages.
/
5473, ERR_CHECK_NTPD_BOOT_SLEWED_STATUS, "NTP daemon''s boot time configuration check could not be performed on node \"{0}\""
//  *Cause: An attempt to obtain the NTP daemon's boot time configuration file failed on the node specified.
// *Action: Make sure that the NTP daemon is configured on the node and will be started when the node boots up. Make sure that the user running this check has access to the configuration file specified. Also look at other messages accompanying this message.
/
5474, TASK_NTPD_BOOT_ALL_SLEWED, "NTP daemon's boot time configuration check for slewing option passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5475, TASK_NTPD_BOOT_SLEWING_GLOBALFAIL, "Could not obtain NTP daemon's boot time configuration on any node"
//  *Cause: An attempt to obtain the command line options for the NTP daemon's failed on all nodes.
// *Action: Make sure that the NTP daemon is running on all the nodes. Make sure that slewing option is set on all the nodes of the cluster.
/
5476, TASK_NTPD_BOOT_SOME_NOT_SLEWED, "NTP daemon's boot time configuration check for slewing option failed on some nodes"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
5477, TASK_SAME_TIMEZONE_START, "Checking time zone consistency..."
// *Document: NO
//  *Cause:
// *Action:
/
5478, NO_TZ_IN_CFG_FILE, "TZ value missing in configuration file \"{0}\" on node \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
5479, NO_SAME_TIMEZONE, "Time zone is not the same on all cluster nodes."
//  *Cause: Nodes have different time zone settings.
// *Action: Ensure that time zone is same on all nodes.
/
5480, TIMEZONE_ON_NODES, "Found time zone \"{0}\" on node(s) \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
5481, TASK_SAME_TIMEZONE_PASSED, "Time zone consistency check passed."
// *Document: NO
//  *Cause:
// *Action:
/
5482, TASK_SAME_TIMEZONE_FAILED, "Time zone consistency check failed."
// *Document: NO
//  *Cause:
// *Action:
/
5483, TASK_DESC_SAME_TIMEZONE, "This task checks for the consistency of time zones across systems."
// *Document: NO
//  *Cause:
// *Action:
/
5484, TASK_ELEMENT_SAME_TIMEZONE, "Same Time Zones."
// *Document: NO
//  *Cause:
// *Action:
/
5485, NO_CFG_FILE, "CRS configuration file \"{0}\" missing on node \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
5500, CONFIG_CURGRPID_TXT, "Current group ID"
// *Document: NO
//  *Cause:
// *Action:
/
5501, CURGRPID_NOT_PRIMARY, "The user \"{0}\"  is currently logged in to the group \"{1}\" which is not the primary group for the user"
//  *Cause: The user is currently logged into a group that is not user's primary group.
// *Action: Invoke the application after logging in to the primary group (using command newgrp <primary group>).
/
5502, ERR_CHECK_CURGRPID, "Current group ID check cannot be performed"
//  *Cause:  Attempt to check if the current group ID matches with primary group ID failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
5503, TASK_ELEMENT_CURGRPID, "Current Group ID"
// *Document: NO
//  *Cause:
// *Action:
/
5504, TASK_DESC_CURGRPID, "This test verifies that the user is currently logged in to the user's primary group."
// *Document: NO
//  *Cause:
// *Action:
/
6000, MULTIPLE_INTERFACE_NAMES, "On subnet \"{0}\" interfaces have more than one name"
//  *Cause:
// *Action:
/
6001, NO_NETWORK_INTERFACE_INFO, "Could not get required information about the interface \"{0}\""
//  *Cause: Could not get interface information for the interface specified.
// *Action: Insure that the interface is installed and online on the nodes in the cluster.
/
6002, NO_NETWORK_INTERFACE_INFO_ON_NODES, "Unable to get information about interface \"{0}\" on the following nodes:"
//  *Cause: Could not get interface information for the interface specified on the nodes listed.
// *Action: Insure that the interface is installed and online on the nodes specified.
/
6003, ERR_NTWRK_INFO_FROM_NODE, "Unable to get network information from node: {0}"
//  *Cause: Could not obtain any network interface information from the node specified.
// *Action: Verify state of network interface adapters on the specified node.
/
6004, FAIL_NETWORK_OPERATION, "Network operation failed"
// *Document: NO
//  *Cause:
// *Action:
/
6005, NETWORK_ERR_NO_FULL_SUBNET, "Could not find a fully connected subnet that covers all the nodes"
//  *Cause: Could not find a network interface adapter that exists in the same subnet on every node in the cluster .
// *Action: Ensure that the network interface adapters are installed and configured correctly on each node in the cluster.
/
6006, FAILED_NODE_REACH_ALL, "Unable to reach any of the nodes"
//  *Cause: Unable to reach any of the nodes using the ping command.
// *Action: Ensure the nodes specified are accessible with the ping utility.
/
6007, USE_ONE_INTERFACE_NAME, "Use one name for all interfaces in an interconnect"
// *Document: NO
//  *Cause:
// *Action:
/
6008, NODE_REACH_LINK_UNAVAILABLE, "Network link from node \"{0}\" unavailable"
// *Document: NO
//  *Cause:
// *Action:
/
6009, NODE_REACH_NETWORK_LINK, "Verify network link from node \"{0}\" to node \"{1}\""
//  *Cause:
// *Document: NO
// *Action:
/
6010, NODE_CON_INTERFACE_NULL, "Network interface is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
6011, NODE_CON_INTERFACE_UNAVAILABLE, "Network interface unavailable on node \"{0}\""
//  *Cause: Could not find any network interface on the node.
// *Action: Verify network interface(s) operational status on the node identified.
/
6012, NODE_CON_VERIFY_INTERFACE, "Verify network interface(s) on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
6013, NODE_CON_SUBNET_ERROR, "Subnet processing error"
// *Document: NO
//  *Cause:
// *Action:
/
6014, NODE_CON_SUBNET_ADDR_ERROR, "Cannot interpret subnet address \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
6015, NODE_CON_SUBNET_MASK_ERROR, "Cannot interpret subnet mask \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
6016, NODE_CON_VERIFY_SUBNET, "Verify network subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
6017, NODE_CON_INTERFACE_IP_ERR, "Network interface IP address error"
// *Document: NO
//  *Cause:
// *Action:
/
6018, ERR_GET_CLUSTER_VIP_INFO, "Unable to get cluster VIP information"
// *Document: NO
//  *Cause:
// *Action:
/
6019, NODE_CON_INTERFACE_NO_GATEWAY, "Interface subnet \"{0}\" does not have a gateway defined"
//  *Cause: Could not identify the gateway for the subnet identified.
// *Action: Define a gateway for the specified subnet.
/
6020, NODE_CON_MTU_DIFF, "Different MTU values used across network interfaces in subnet \"{0}\""
//  *Cause: Different MTU values found for the network adapter used between cluster nodes across the specified subnet.
// *Action: Set the MTU value for that network adapter/subnet to be the same on each node in the cluster.
/
6400, TASK_SAME_CORE_FILENAME_PATTERN_START, "Checking Core file name pattern consistency..."
// *Document: NO
//  *Cause:
// *Action:
/
6401, CORE_FILENAME_PATTERN_ON_NODES, "Found core filename pattern \"{0}\" on nodes \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
6402, NO_SAME_CORE_FILENAME_PATTERN, "Core file name pattern is not same on all the nodes."
//  *Cause: The core file name pattern is not same on all the nodes.
// *Action: Ensure that the mechanism for core file naming works consistently on all the nodes. Typically for Linux, the elements to look into are the contents of two files  /proc/sys/kernel/core_pattern or /proc/sys/kernel/core_uses_pid. Refer OS vendor documentation for platforms AIX, HP-UX, and Solaris.  
/
6403, TASK_SAME_CORE_FILENAME_PATTERN_PASSED, "Core file name pattern consistency check passed."
// *Document: NO
//  *Cause:
// *Action:
/
6404, TASK_SAME_CORE_FILENAME_PATTERN_FAILED, "Core file name pattern consistency check failed."
// *Document: NO
//  *Cause:
// *Action:
/
6405, TASK_DESC_SAME_CORE_FILENAME_PATTERN, "This task checks the consistency of core file name pattern across systems."
// *Document: NO
//  *Cause:
// *Action:
/
6406, TASK_ELEMENT_SAME_CORE_FILENAME_PATTERN, "Same core file name pattern"
// *Document: NO
//  *Cause:
// *Action:
/
6407, ERR_CORE_FILENAME_PATTERN, "Core file name pattern can not be obtained from nodes \"{0}\"."
//  *Cause: Unable to execute commands on the nodes specified.
//  *Action: Ensure ability to communicate with, and execute commands on, nodes specified .
/
6500, TASK_ELEMENT_ASM_INTEGRITY, "ASM Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
6501, TASK_ELEMENT_BINARY_MATCH, "Binary Matching"
// *Document: NO
//  *Cause:
// *Action:
/
#
# Task description 6700-6899 (continued from 4499 above)
#
6700, TASK_DESC_ASM_INTEGRITY, "This test checks the integrity of Oracle Automatic Storage Management across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
6701, TASK_DESC_BINARY_MATCH, "This test checks the integrity of Oracle executables across the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
#
# The following messages 7000-7099 are StorageException message that 
# are part of a thrown exception.
#
7000, FAIL_STORAGE_OPERATION, "Storage operation failed"
// *Document: NO
//  *Cause:
// *Action:
/
7001, ERR_GET_VOLUME_INFO, "Unable to get volume information"
// *Document: NO
//  *Cause:
// *Action:
/
7002, ERR_GET_DISK_INFO, "Unable to get disk information"
// *Document: NO
//  *Cause:
// *Action:
/
7003, MUST_RUN_ON_CLUSTER, "This operation must run on a cluster node"
// *Document: NO
//  *Cause:
// *Action:
/
7004, COULD_NOT_FIND, "Could not find "
// *Document: NO
//  *Cause:
// *Action:
/
7005, NOT_UNIQUE_NAME, "Name is not unique:"
// *Document: NO
//  *Cause:
// *Action:
/
7006, NODE_NOT_IN_CLUSTER, "The following node is not in cluster: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
7007, LOCAL_NODE_NOT_FOUND, "Could not get local node name"
// *Document: NO
//  *Cause:
// *Action:
/
7008, STORAGE_NOT_FOUND, "Could not find the storage"
// *Document: NO
//  *Cause:
// *Action:
/
7009, STORAGE_TYPE_NOT_FOUND, "Could not get the type of storage"
// *Document: NO
//  *Cause:
// *Action:
/
7010, PROBLEM_STORAGE_TYPE, "Problem with storage type "
// *Document: NO
//  *Cause:
// *Action:
/
7011, ERR_VENDOR_NODELIST, "Unable to get nodeList"
// *Document: NO
//  *Cause:
// *Action:
/
7012, UNEXPECTED_FORMAT, "Format not expected"
// *Document: NO
//  *Cause:
// *Action:
/
7013, TRY_DIFF_PATH_LIKE, "Try a different path. Example: "
// *Document: NO
//  *Cause:
// *Action:
/
7014, STORAGE_TYPE_NOT_SUPPORTED, "The following storage type is not supported:\n \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
7015, NOT_SHARED_FS, "The path is not on a shared filesystem"
// *Document: NO
//  *Cause:
// *Action:
/
7016, OCFS_NEEDS_UPGRADE, "OCFS shared storage discovery skipped because OCFS version 1.0.14 or later is required"
// *Document: NO
//  *Cause:
// *Action:
/
7017, DISK_EXE_REQUIRED, "Package cvuqdisk not installed"
// *Document: NO
//  *Cause:
// *Action:
/
7018, OCFS_EXIST_ON_LOCATION, "OCFS file system exists on \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
7019, OCFS_NOT_EXIST_ON_LOCATION, "OCFS file system does not exist on \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
7020, SHAREDNESS_UNDETERMINED_ON_NODES, "Unable to determine the sharedness of {0} on nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
7021, DISK_EXE_ACCESS_DENIED, "Unable to execute cvuqdisk. Please check the permissions"
// *Document: NO
//  *Cause:
// *Action:
/
7022, STORAGE_NFS_OPTION_CHECK_PATH, "     Invalid NFS mount options for \"{0}\":\"{1}\" mounted on: \"{2}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7023, STORAGE_NFS_OPTION, "             option \"{0}\"  "
// *Document: NO
//  *Cause:
// *Action:
/
7024, STORAGE_NFS_OPTION_GROUP_AND, " and"
// *Document: NO
//  *Cause:
// *Action:
/
7025, STORAGE_NFS_OPTION_GROUP_OR, " or"
// *Document: NO
//  *Cause:
// *Action:
/
7026, STORAGE_NFS_OPTION_IS_SET, "is set"
// *Document: NO
//  *Cause:
// *Action:
/
7027, STORAGE_NFS_OPTION_IS_NOT_SET, "is not set"
// *Document: NO
//  *Cause:
// *Action:
/
7028, STORAGE_NFS_OPTION_IS_EQUAL_TO, "is equal to \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7029, STORAGE_NFS_OPTION_IS_NOT_EQUAL_TO, "is not equal to \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7030, STORAGE_NFS_OPTION_IS_GREATER_THAN, "is greater than \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7031, STORAGE_NFS_OPTION_IS_GREATER_THAN_OR_EQUAL_TO, "is greater than or equal to \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7032, STORAGE_NFS_OPTION_IS_LESS_THAN, "is less than \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7033, STORAGE_NFS_OPTION_IS_LESS_THAN_OR_EQUAL_TO, "is less than or equal to \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7034, STORAGE_FOUND_INVALID_NFS_OPTIONS, "Invalid NFS mount options are found for mount point \"{0}\" on node \"{1}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7035, STORAGE_VALID_NFS_OPTIONS, "Valid NFS mount options are: \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7036, NFS_MNT_OPTS_NOT_AS_EXPECTED, "Mount options did not meet the requirements [Expected = \"{0}\" ; Found = \"{1}\"]"
// *Document: NO
//  *Cause:
// *Action:
/
7500, SUBTASKS_NOT_COMPLETE, "All the subtasks related to the task have not been performed yet"
// *Document: NO
//  *Cause:
// *Action:
/
7501, INSUFFICIENT_SPACE, "Sufficient space is not available at location \"{0}\" on node \"{1}\" [Required space = {2}]"
//  *Cause: Not enough free space at location specified.
// *Action: Free up additional space or select another location.
/
7502, RESULT_VALUES_UNAVAILABLE, "Result values are not available for this verification task"
// *Document: NO
//  *Cause:
// *Action:
/
7503, NODE_RESULTS_UNAVAILABLE, "Node-specific results are not available for this verification"
// *Document: NO
//  *Cause:
// *Action:
/
7504, SUBTASKS_UNAVAILABLE, "Subtasks are not available for this verification task"
// *Document: NO
//  *Cause:
// *Action:
/
7505, ERROR_MESSAGE_UNAVAILABLE, "Error Message Not Available"
// *Document: NO
//  *Cause:
// *Action:
/
7506, CAUSE_DESCRIPTION_UNAVAILABLE, "Cause Of Problem Not Available"
// *Document: NO
//  *Cause:
// *Action:
/
7507, USER_ACTION_UNAVAILABLE, "User Action Not Available"
// *Document: NO
//  *Cause:
// *Action:
/
7508, INTERNAL_FRAMEWORK_ERROR, "An internal error occurred within cluster verification framework"
// *Document: NO
//  *Cause:
// *Action:
/
7509, PATH_INVALID_DIR, "The path \"{0}\" is not a valid directory"
// *Document: NO
//  *Cause:
// *Action:
/
7510, INTERNAL_TASKFACTORY_ERROR, "An error occurred in creating a TaskFactory object or in generating a task list"
// *Document: NO
//  *Cause:
// *Action:
/
7511, INVALID_PARAM_FOR_CRSINST, "Encountered illegal parameter for Clusterware Install prerequisites"
// *Document: NO
//  *Cause:
// *Action:
/
7512, INVALID_PARAM_FOR_DBINST, "Encountered illegal parameter for Database Install prerequisites"
// *Document: NO
//  *Cause:
// *Action:
/
7513, NODES_WITH_FAILURE, "The problem occurred on nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
7514, NULL_NODE, "Node is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7515, NULL_NODELIST, "Nodelist is either null or is an empty array"
// *Document: NO
//  *Cause:
// *Action:
/
7516, NULL_PARAMPREREQ, "ParamPreReq is null"
// *Document: NO
//  *Cause:
// *Action:
/
7517, NULL_PATH, "Path is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7518, NOT_AN_ABSOLUTE_PATH, "Path \"{0}\" is invalid. It must be specified as an absolute pathname"
// *Document: NO
//  *Cause:
// *Action:
/
7519, WORKDIR_NULL_PATH, "Path for work directory is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7520, WORKDIR_NOT_AN_ABSOLUTE_PATH, "Path \"{0}\" for work directory is invalid. It must be specified as an absolute pathname"
// *Document: NO
//  *Cause:
// *Action:
/
7521, FRMWRK_HOME_NULL_PATH, "Path for framework home is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7522, FRMWRK_HOME_NOT_AN_ABSOLUTE_PATH, "Path \"{0}\" for framework home is invalid. It must be specified as an absolute pathname"
// *Document: NO
//  *Cause:
// *Action:
/
7523, FRMWRK_HOME_DEFAULT_NOT_AVAILABLE, "The default location for framework home is not available. It must be specified"
// *Document: NO
//  *Cause:
// *Action:
/
7524, NO_SAME_KERNEL_VERSION, "Kernel version is not consistent across all the nodes. "
//  *Cause: The operating system kernel versions do not match across cluster nodes.
// *Action: Update the kernel version where necessary to have all cluster nodes running the same kernel version.
/
7525, KERNEL_VERSION_ON_NODES, "Kernel version = \"{0}\" found on nodes: {1}."
// *Document: NO
//  *Cause:
// *Action:
/
7530, INSUFFICIENT_PHYSICAL_MEMORY, "Sufficient physical memory is not available on node \"{0}\" [Required physical memory = {1}]"
//  *Cause: Amount of physical memory (RAM) found does not meet minimum memory requirements.
// *Action: Add physical memory (RAM) to the node specified.
/
7531, ERR_CHECK_PHYSICAL_MEMORY, "Physical memory check cannot be performed on node \"{0}\""
//  *Cause: Could not perform check of physical memory on the node indicated.
// *Action: Ensure ability to access the node specified and view memory information.
/
7532, MISSING_PACKAGE, "Package \"{0}\" is missing on node \"{1}\""
//  *Cause: A required package is either not installed or, if the package is a kernel module, is not loaded on the specified node.
// *Action: Ensure that the required package is installed and available.
/
7533, IMPROPER_PACKAGE_VERSION, "Proper version of package \"{0}\" is not found on node \"{1}\" [Required = \"{2}\" ; Found = \"{3}\"]."
//  *Cause: Package does not meet the requirement.
// *Action: Upgrade the package to meet the requirement.
/
7534, ERR_CHECK_PACKAGE, "Package check cannot be performed on node \"{0}\""
//  *Cause: Package configuration could not be determined.
// *Action: Ensure that the package configuration is accessible.
/
7535, IMPROPER_ARCHITECTURE, "Proper architecture is not found on node \"{0}\" [Expected = \"{1}\" ; Found = \"{2}\"]"
//  *Cause: System architecture does not meet the requirement.
// *Action: Ensure that the correct software bundle is being used.
/
7536, ERR_CHECK_ARCHITECTURE, "Architecture check cannot be performed on node \"{0}\""
//  *Cause: System architecture could not be determined.
// *Action: Ensure that the correct software bundle is being used.
/
7537, USER_NO_EXISTENCE, "User \"{0}\" does not exist on node \"{1}\" "
//  *Cause: The specified user does not exist on the specified node.
// *Action: Create the user on the specified node.
/
7538, ERR_CHECK_USER_EXISTENCE, "User existence check cannot be performed on node \"{0}\""
//  *Cause:  Attempt to check the existence of user on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7539, GROUP_NO_EXISTENCE, "Group \"{0}\" does not exist on node \"{1}\" "
//  *Cause: The specified group does not exist on the specified node.
// *Action: Create the group on the specified node.
/
7540, ERR_CHECK_GROUP_EXISTENCE, "Group existence check cannot be performed on node \"{0}\""
//  *Cause:  Attempt to check the existence of group on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7541, IMPROPER_KERNEL_VERSION, "Kernel of proper version is not found on node \"{0}\" [Expected = \"{1}\" ; Found = \"{2}\"]"
// *Document: NO
//  *Cause:
// *Action:
/
7542, ERR_CHECK_KERNEL_VERSION, "Kernel version check cannot be performed on node \"{0}\""
//  *Cause: Unable to execute commands on node specified.
// *Action: Ensure ability to communicate with, and execute commands on, node specified .
/
7543, IMPROPER_KERNEL_PARAM, "OS Kernel parameter \"{0}\" does not have proper value on node \"{1}\" [Expected = \"{2}\" ; Found = \"{3}\"]."
//  *Cause: Kernel parameter value does not meet the requirement.
// *Action: Modify the kernel parameter value to meet the requirement.
/
7544, ERR_CHECK_KERNEL_PARAM, "Check cannot be performed for kernel parameter \"{0}\" on node \"{1}\""
//  *Cause: Kernel parameter value could not be determined.
// *Action: Ensure that the correct software bundle is being used.
/
7545, KERNEL_PARAM_NOT_CONFIGURED, "Kernel parameter \"{0}\" is not configured on node \"{1}\" [Expected = \"{2}\"]"
// *Document: NO
//  *Cause:
// *Action:
/
7546, WORKDIR_NOT_USABLE_ON_NODE, "The work directory \"{0}\" cannot be used on node \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
7547, ACCESS_PRIVILEGES_SUBDIR, "Access denied for subdirectory \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7548, USE_DIFFERENT_WORK_AREA, "Please select a different work area for the framework"
// *Document: NO
//  *Cause:
// *Action:
/
7549, PATH_NO_WRITE_PERMISSION, "The caller does not have write permission for path \"{0}\" "
// *Document: NO
//  *Cause:
// *Action:
/
7550, PATH_MISSING_CAN_NOT_CREATE_ON_NODE, "Path \"{0}\" does not exist and cannot be created on node \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
7551, WORKDIR_NOT_USABLE_ALL_NODES, "The work directory \"{0}\" cannot be used on any of the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
7552, WORKDIR_NOT_USABLE, "The work directory \"{0}\" cannot be used"
// *Document: NO
//  *Cause:
// *Action:
/
7553, CAUSE_AVAILABLE_AT_NODE_LEVEL, "Get the cause for each node"
// *Document: NO
//  *Cause:
// *Action:
/
7554, ACTION_AVAILABLE_AT_NODE_LEVEL, "Get the action for each node"
// *Document: NO
//  *Cause:
// *Action:
/
7555, FAIL_DELETE_DIR_CONTENTS, "Failed in deleting the contents of directory \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
7556, NULL_ORACLEHOME, "Oracle Home is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7557, ORACLEHOME_NOT_AN_ABSOLUTE_PATH, "Path \"{0}\" for oracle home is invalid. It must be specified as an absolute pathname"
// *Document: NO
//  *Cause:
// *Action:
/
7558, ERR_EXECUTE_COMMAND, "The command could not be executed successfully on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
7559, ERR_EXECTASK_VERSION_FETCH, "Version of exectask could not be retrieved from node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
7560, FRAMEWORK_SETUP_BAD_ALL_NODES, "Framework setup check failed on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
7561, NO_COMMAND_EXECUTION_RESULT, "Command execution result is not available for node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
7562, INSUFFICIENT_AVAILABLE_MEMORY, "Sufficient available memory is not available on node \"{0}\" [Required available memory = {1}]"
//  *Cause: Amount of available memory (RAM) does not meet minimum memory requirements.
// *Action: Add physical memory (RAM) to the node specified, or free memory being used.
/
7563, ERR_CHECK_AVAILABLE_MEMORY, "Available memory check cannot be performed on node \"{0}\""
//  *Cause: Could not perform check of available memory on the node indicated.
// *Action: Ensure ability to access the node specified and view memory information.
/
7564, INCORRECT_RUNLEVEL, "Incorrect run level set on node \"{0}\" [Required run level = {1}]"
//  *Cause: Found incorrect runlevel on the node specified.
// *Action: Reboot the specified node with the correct runlevel.
/
7565, ERR_CHECK_RUNLEVEL, "Run level check cannot be performed on node \"{0}\""
//  *Cause: Encountered error when trying to determine runlevel.
// *Action: Ensure runlevel value can be obtained on the specified node.
/
7566, NOT_A_MEMBER_OF_GROUP, "User \"{0}\" does not belong to group \"{1}\" on node \"{2}\" "
//  *Cause: The specified user is not a member of the specified group on the specified node.
// *Action: Make the user a member of the group on the specified node.
/
7567, NOT_A_PRIMARY_GROUP, "Group \"{0}\" is not the primary group for user \"{1}\" on node \"{2}\" "
//  *Cause: The specified group is not the primary group for the specified user. 
// *Action: Make the specified group as the primary group for the user.
/
7568, ERR_CHECK_USR_GRP_MEMBRSHIP, "Check cannot be performed for membership of user \"{0}\" with group \"{1}\" on node \"{2}\""
//  *Cause:  Attempt to check the group membership of the user on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7569, NULL_USER, "User is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7570, NULL_GROUP, "Group is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7571, ERR_PROC_NOT_RUNNING, "Process \"{0}\" not running on node \"{1}\""
//  *Cause: Required process not running on the specified node.
// *Action: Ensure that the identified process can be started on the node .
/
7572, ERR_CHECK_PROC_RUNNING, "Process running check cannot be performed on node \"{0}\""
//  *Cause: Could not collect process information from the specified node.
// *Action: Ensure access to node specified and ability to view process information.
/
7573, INSUFFICIENT_SWAP_SIZE, "Sufficient swap size is not available on node \"{0}\" [Required = {1} ; Found = {2}]"
//  *Cause: The swap size found does not meet the minimum requirement.
// *Action: Increase swap size to at least meet the minimum swap space requirement.
/
7574, ERR_CHECK_SWAP_SIZE, "Swap size check cannot be performed on node \"{0}\""
//  *Cause: Could not perform check of swap space on the node indicated.
// *Action: Ensure ability to access the node specified and view swap space information.
/
7575, INTERNAL_ERROR_SWAP_STEPS, "Encountered an internal error. The range of reference data for verifying swap size has not been correctly defined"
//  *Cause: Swap size could not be determined based on the physical memory available.
// *Action: This is an internal error that should be reported to Oracle.
/
7576, NEGATIVE_SIZE, "Negative value has been specified for size"
// *Document: NO
//  *Cause:
// *Action:
/
7577, NEGATIVE_RUNLEVEL, "Negative value has been specified for runlevel"
// *Document: NO
//  *Cause:
// *Action:
/
7578, NULL_PROC, "Procedure name is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7579, NULL_NAME, "Name is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7580, NULL_VAL, "Value is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7581, NULL_ARCH, "Architecture is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7582, NULL_VERSION, "Version is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
7583, NULL_RUNLEVEL_LIST, "Run level list is either null or empty"
// *Document: NO
//  *Cause:
// *Action:
/
7584, MULTIPLE_PACKAGE_VERSION, "Multiple versions of package \"{0}\" found on node {1}: {2}"
//  *Cause: Multiple versions of the package were found when only one version was expected.
// *Action: Ensure that the specified package is installed correctly.
/
7585, NULL_ARCHITECTURE_LIST, "Architecture list is either null or empty"
// *Document: NO
//  *Cause:
// *Action:
/
7586, NULL_STORAGE_UNIT, "Unit specified is null"
// *Document: NO
//  *Cause:
// *Action:
/
7590, DAEMON_NOT_RUNNING, "\"{0}\" is not running on node \"{1}\""
//  *Cause: The process identified is not running on the specified node.
// *Action: Ensure that the identified process is started and running on the specified node. If it is one of the clusterware daemons then you can use 'crsctl check' command to check status.
/
7591, ERR_CHECK_DAEMON_STATUS, "Check cannot be performed for status of \"{0}\" on node \"{1}\""
//  *Cause: An error was encountered trying to determine if the identified process was running on the specified node.
// *Action: Ensure ability to communicate with the specified node. The status of clusterware daemons can be checked on this node using the 'crsctl check' command.
/
7592, ERR_CHECK_SPACE_AVAILABILITY, "Space availability check for location \"{0}\" cannot be performed on node \"{1}\""
//  *Cause: Unable to determine amount of free space available for the specified location on the node identified.
// *Action: Ensure ability to communicate with the specified node and the ability to access the location identified.
/
7593, NO_CRS_INSTALL_ON_NODE, "CRS is not found to be installed on node \"{0}\""
//  *Cause: Could not identify CRS installation on the local node.
// *Action: Ensure that CRS is installed on the local node.
/
7594, CRS_DAEMON_BAD_STATUS_ON_NODE, "{0} is running but is not working effectively on node \"{1}\""
//  *Cause: Could not communicate with the process specified on the node indicated.
// *Action: Verify state of CRS on the node indicated using the 'crsctl check' command.
/
7595, ERR_CHECK_CRS_DAEMON_STATUS, "CRS status check cannot be performed on node \"{0}\""
//  *Cause: Could not verify the status of CRS on the node indicated using 'crsctl check'.
// *Action: Ensure ability to communicate with the specified node. Make sure that clusterware daemons are running using 'ps' command. Make sure that the clusterware stack is up.
/
7596, CSS_SINGLE_INSTANCE_ON_NODE, "CSS is probably working with a non-clustered, local-only configuration on node \"{0}\""
//  *Cause: Oracle CSS was found to be configured to run in a local-only (non-clustered) environment on the specified node.
// *Action: Ensure cluster setup is correct and reconfigure Cluster Synchronization Services (CSS) as necessary on the nodes that are supposed to be executing in a clustered environment. See Oracle Cluster Synchronization Services documentation for further information.
/
7597, NO_OCR_INTEG_DETAILS_ON_NODE, "Unable to obtain OCR integrity details from node \"{0}\""
//  *Cause: OCR was not found to be in a healthy state on the node specified.
// *Action: Verify the state of OCR on the node specified using 'ocrcheck'.
/
7598, INCORRECT_OCR_VERSION, "Incorrect OCR Version was found [Expected = \"{0}\" ; Found = \"{1}\"]"
//  *Cause:
// *Action:
/
7599, ERR_CHECK_NODE_DEL, "Check to confirm node \"{0}\" was removed"
// *Document: NO
//  *Cause:
// *Action:
/
7600, ERR_CHECK_CLUSTER_CONFIG, "Check cluster configuration"
// *Document: NO
//  *Cause:
// *Action:
/
7601, NULL_CHECK_TYPE, "Check type enum set is either null or empty"
// *Document: NO
//  *Cause:
// *Action:
/
7602, OPERATION_SUPPORTED_ONLY_ON_UNIX, "This operation is supported only on Unix/Linux system"
// *Document: NO
//  *Cause:
// *Action:
/
7603, INVALID_PARAM_FOR_DBCONFIG, "ParamPreReq is not an instance of ParamPreReqDBConfig"
// *Document: NO
//  *Cause:
// *Action:
/
7604, INVALID_PARAM_FOR_HACONFIG, "ParamPreReq is not an instance of ParamPreReqHAConfig"
// *Document: NO
//  *Cause:
// *Action:
/
7605, INVALID_PARAM_FOR_CFSSETUP, "ParamPreReq is not an instance of ParamPreReqCFSSetup"
// *Document: NO
//  *Cause:
// *Action:
/
7606, INVALID_PARAM_FOR_HWOSSETUP, "ParamPreReq is not an instance of ParamPreReqHWOSSetup"
// *Document: NO
//  *Cause:
// *Action:
/
7607, INVALID_PARAM_FOR_USMCONFIG, "ParamPreReq is not an instance of ParamPreReqUSMConfig"
// *Document: NO
//  *Cause:
// *Action:
/
7608, NONDEFAULT_INV_PTR_CRS_SIHA, "Incorrect setting of system property \"{0}\". For Oracle Clusterware or SI-HA installation inventory file location pointer property should be set to the default location. [Expected = \"{1}\" ; Found = \"{2}\"]"
// *Document: NO
//  *Cause: Internal error.
// *Action: Contact Oracle support.
/
7609, INVALID_PARAM_FOR_NODEADDDEL, "ParamPreReq is not an instance of ParamPreReqNodeAddDel"
// *Document: NO
//  *Cause:
// *Action:
/
7610, TASK_NODEADDDEL_CLUSTER_SETUP, "Cannot verify user equivalence/reachability on existing cluster nodes"
//  *Cause: Attempts to verify user equivalence, or node reachability, failed for all the existing cluster nodes.
// *Action: Verify that all the cluster nodes have user equivalence and are reachable.
/
7611, IMPROPER_UMASK, "Proper user file creation  mask (umask) for user \"{0}\" is not found on node \"{1}\" [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: The user's OS file creation mask (umask) was not the required setting.
// *Action: Set appropriate user file creation mask. Modify the users .profile or .cshrc or .bashrc to include the required umask.
/
7612, ERR_CHECK_UMASK, "User file creation mask check cannot be performed for user \"{0}\" on node \"{1}\""
//  *Cause:  Attempt to check the file creation mask of user on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7700, FIXUPROOTDIR_NULL_PATH, "Path for fixup root directory is either null or is an empty string"
//  *Cause: Provided fixup root directory path is either null or an empty string.
// *Action: Provide appropriate and absolute path for fixup root directory.
/
7701, FIXUPROOTDIR_NOT_AN_ABSOLUTE_PATH, "Path \"{0}\" for fixup root directory is invalid. It must be specified as an absolute pathname"
//  *Cause: Fixup root directory was not specified as an absolute pathname.
// *Action: Respecify fixup root directory as an absolute pathname.
/
7702, FIXUPROOTDIR_NOT_A_DIR, "The path \"{0}\" for fixup root directory is not a valid directory"
//  *Cause: Fixup root directory path was not a valid directory.
// *Action: Respecify fixup root path as a valid directory where files can be created and executed from.
/
7703, FIXUPROOTDIR_NOT_WRITABLE, "The fixup root directory \"{0}\" is not writeable"
//  *Cause: Directory identified is not writeable.
// *Action: Verify write access to directory specified.
/
7704, FIXUPROOTDIR_FAIL_CREATION, "The fixup root directory \"{0}\" cannot be created"
//  *Cause: Could not create fixup root directory specified.
// *Action: Ensure write access along the path for the directory specified.
/
7705, DIR_CREATION_FAILED, "Directory \"{0}\" cannot be created"
//  *Cause: Could not create directory specified.
// *Action: Ensure write access along the path for the directory specified.
/
7706, FILE_CREATION_FAILED, "File \"{0}\" cannot be created"
//  *Cause: Could not create file specified.
// *Action: Ensure write access to file location.
/
7707, FIXUPROOTDIR_NOT_EXIST, "The fixup root directory \"{0}\" does not exist"
// *Document: NO
//  *Cause:
// *Action:
/
7708, FIXUPS_NOT_GENERATED, "No fixups are generated in fixup root directory \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
7709, FAIL_COPY_FILE_TO_NODE, "File \"{0}\" cannot be copied to file  \"{1}\" on node \"{2}\""
//  *Cause: Could not copy the source file specified to the target file specified on the identified node.
// *Action: Ensure access to the node identified and the target location for the file specified.
/
7710, INVALID_FIXUP_ROOT_DIR, "Invalid path has been specified for fixup root directory"
//  *Cause: The path specified for the fixup root directory is not correct.
// *Action: Specify an absolute path for a directory that exists and is writeable by the user performing the verification.
/
7711, FIXUP_GENERATED, "Fixup information has been generated for following node(s):"
// *Document: NO
//  *Cause:
// *Action:
/
7712, FIXUP_EXEC_SCRIPT, "Please run the following script on each node as \"root\" user to execute the fixups:"
//  *Cause:
// *Action:
/
7720, FIXUP_ERR_GROUP_CREATION, "Fixup cannot be generated for creating group \"{0}\" on node \"{1}\""
//  *Cause:  Attempt to generate fixup for group creation on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7721, FIXUP_ERR_USER_CREATION, "Fixup cannot be generated for creating user \"{0}\" on node \"{1}\""
//  *Cause:  Attempt to generate fixup for user creation on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7722, FIXUP_ERR_KERNEL_PARAM, "Fixup cannot be generated for setting kernel param \"{0}\" on node \"{1}\""
//  *Cause:  Attempt to generate fixup for kernel param on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7723, FIXUP_ERR_SHELL_LIM_SOFT, "Fixup cannot be generated for setting soft limit for resource \"{0}\" on node \"{1}\""
//  *Cause:  Attempt to generate fixup for resource soft limit on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7724, FIXUP_ERR_SHELL_LIM_HARD, "Fixup cannot be generated for setting hard limit for resource \"{0}\" on node \"{1}\""
//  *Cause:  Attempt to generate fixup for resource hard limit on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7725, FIXUP_ERR_RUNLEVEL, "Fixup cannot be generated for setting runlevel \"{0}\" on node \"{1}\""
//  *Cause:  Attempt to generate fixup for run level on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7726, FIXUP_ERR_GROUP_MEMBERSHIP, "Fixup cannot be generated for setting membership of user \"{0}\" with group \"{1}\" on node \"{2}\""
//  *Cause:  Attempt to generate fixup for group membership on the specified node failed.
// *Action: Look at the accompanying error messages displayed and fix the problems indicated.
/
7727, FIXUP_ERR_PACKAGE_INSTALL, "Fixup cannot be generated for installing package \"{0}\" on node \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
7728, TRACE_FILE_ACCESS, "Could not access or create trace file path \"{0}\". Trace information could not be collected"
//  *Cause: Trace file location could not be created, or is not writeable.
// *Action: Make sure user has write access to location specified, or specify a different location using the environmental variable CV_TRACELOC.
/
7729, FIXUP_NIS_USER, "Fixup cannot be generated for user \"{0}\", group {1}, on node \"{2}\" because the user is not defined locally on the node"
//  *Cause: Fixup for group membership could not be generated because user was not found to be locally defined on the specified node.
// *Action: The fixup will have to be done manually. The user could be a Network Information Service (NIS) or Lightweight Directory Access Protocol (LDAP) user. Based on where the user is defined use appropriate tools to modify the user account.
/
7730, FIXUP_NIS_GROUP, "Fixup cannot be generated for user \"{0}\", group \"{1}\", on node \"{2}\" because the group is not defined locally on the node"
//  *Cause: Fixup for group membership could not be generated because the group was not found to be locally defined on the specified node.
// *Action: The fixup will have to be done manually. The group could be a Network Information Service (NIS) or Lightweight Directory Access Protocol (LDAP) user. Based on where the group is defined use appropriate tools to modify the user account.
/
8000, HDR_NODENAME, "Node Name"
// *Document: NO
//  *Cause:
// *Action:
/
8001, HDR_COMMENT, "Comment"
// *Document: NO
//  *Cause:
// *Action:
/
8002, HDR_CRS_OK, "CRS OK?"
// *Document: NO
//  *Cause:
// *Action:
/
8003, HDR_RUNNING, "Running?"
// *Document: NO
//  *Cause:
// *Action:
/
8004, HDR_DESTINATION_NODE, "Destination Node"
// *Document: NO
//  *Cause:
// *Action:
/
8005, HDR_REACHABLE, "Reachable?"
// *Document: NO
//  *Cause:
// *Action:
/
8006, HDR_SOURCE, "Source"
// *Document: NO
//  *Cause:
// *Action:
/
8007, HDR_DESTINATION, "Destination"
// *Document: NO
//  *Cause:
// *Action:
/
8008, HDR_CONNECTED, "Connected?"
// *Document: NO
//  *Cause:
// *Action:
/
8009, HDR_INTERFACE_NAME, "Name"
// *Document: NO
//  *Cause:
// *Action:
/
8010, HDR_IPADDR, "IP Address"
// *Document: NO
//  *Cause:
// *Action:
/
8011, HDR_SUBNET, "Subnet"
// *Document: NO
//  *Cause:
// *Action:
/
8012, HDR_AVAILABLE, "Available"
// *Document: NO
//  *Cause:
// *Action:
/
8013, HDR_USER_EXISTS, "User Exists"
// *Document: NO
//  *Cause:
// *Action:
/
8014, HDR_GROUP_EXISTS, "Group Exists"
// *Document: NO
//  *Cause:
// *Action:
/
8015, HDR_USER_IN_GROUP, "User in Group"
// *Document: NO
//  *Cause:
// *Action:
/
8016, HDR_PRIMARY, "Primary"
// *Document: NO
//  *Cause:
// *Action:
/
8017, HDR_GROUP_ID, "Group ID"
// *Document: NO
//  *Cause:
// *Action:
/
8018, HDR_STATUS, "Status"
// *Document: NO
//  *Cause:
// *Action:
/
8019, HDR_REQUIRED, "Required"
// *Document: NO
//  *Cause:
// *Action:
/
8020, HDR_DAEMON, "Daemon name"
// *Document: NO
//  *Cause:
// *Action:
/
8021, HDR_REF_STATUS, "Ref. node status"
// *Document: NO
//  *Cause:
// *Action:
/
8022, HDR_GROUP_AND_GID, "Group(gid)"
// *Document: NO
//  *Cause:
// *Action:
/
8023, HDR_CONFIGURED, "Configured"
// *Document: NO
//  *Cause:
// *Action:
/
8024, HDR_OS_PATCH, "OS Patch"
// *Document: NO
//  *Cause:
// *Action:
/
8025, HDR_PACKAGE, "Package"
// *Document: NO
//  *Cause:
// *Action:
/
8026, HDR_OCFS_CLUNAME, "OCFS Cluster Name"
// *Document: NO
//  *Cause:
// *Action:
/
8027, HDR_OSVER, "OS version"
// *Document: NO
//  *Cause:
// *Action:
/
8028, HDR_APPLIED, "Applied"
// *Document: NO
//  *Cause:
// *Action:
/
8029, HDR_VERSION, "version"
// *Document: NO
//  *Cause:
// *Action:
/
8030, HDR_FILESIZE, "size(in byte)"
// *Document: NO
//  *Cause:
// *Action:
/
8031, HDR_RUNLEVEL, "run level"
// *Document: NO
//  *Cause:
// *Action:
/
8032, HDR_KRNVER, "Kernel version"
// *Document: NO
//  *Cause:
// *Action:
/
8033, HDR_PROCESS, "Process"
// *Document: NO
//  *Cause:
// *Action:
/
8034, HDR_MNTPNT, "Mount point"
// *Document: NO
//  *Cause:
// *Action:
/
8036, HDR_USER_ID, "User ID"
// *Document: NO
//  *Cause:
// *Action:
/
8040, HDR_PATH, "Path"
// *Document: NO
//  *Cause:
// *Action:
/
8041, HDR_FILE, "File"
// *Document: NO
//  *Cause:
// *Action:
/
8042, HDR_DIRECTORY, "Directory"
// *Document: NO
//  *Cause:
// *Action:
/
8043, HDR_LOCATION, "Location"
// *Document: NO
//  *Cause:
// *Action:
/
8044, HDR_INV_NODELIST, "Inventory node list"
// *Document: NO
//  *Cause:
// *Action:
/
8045, HDR_INV_LOCATION, "Inventory location"
// *Document: NO
//  *Cause:
// *Action:
/
8046, HDR_INV_GROUP, "Inventory group"
// *Document: NO
//  *Cause:
// *Action:
/
8047, HDR_OCFS2_CLUNAME, "OCFS2 Cluster Name"
// *Document: NO
//  *Cause:
// *Action:
/
8048, HDR_SHELL_LIMIT_TYPE, "Type"
// *Document: NO
//  *Cause:
// *Action:
/
8049, HDR_HWADDR, "HW Address"
// *Document: NO
//  *Cause:
// *Action:
/
8050, HDR_GATEWAY, "Gateway"
// *Document: NO
//  *Cause:
// *Action:
/
8051, HDR_DEF_GATEWAY, "Def. Gateway"
// *Document: NO
//  *Cause:
// *Action:
/
8052, HDR_MTU, "MTU"
// *Document: NO
//  *Cause:
// *Action:
/
8053, HDR_COMPONENT, "Component"
// *Document: NO
//  *Cause:
// *Action:
/
8054, HDR_OSVERSION, "OS Version"
// *Document: NO
//  *Cause:
// *Action:
/
8055, HDR_DEVICE, "Device"
// *Document: NO
//  *Cause:
// *Action:
/
8056, HDR_DEVICE_TYPE, "Device Type"
// *Document: NO
//  *Cause:
// *Action:
/
8057, HDR_SCANVIP, "SCAN VIP name"
// *Document: NO
//  *Cause:
// *Action:
/
8058, HDR_NODE, "Node"
// *Document: NO
//  *Cause:
// *Action:
/
8059, HDR_SCANLSNR, "ListenerName"
// *Document: NO
//  *Cause:
// *Action:
/
8060, HDR_PORT, "Port"
// *Document: NO
//  *Cause:
// *Action:
/
8100, REPORT_DID_NOT_RUN_ON_ALL, "This check did not run on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
8101, REPORT_DID_NOT_RUN_ON_NODES, "This check did not run on the following node(s): "
// *Document: NO
//  *Cause:
// *Action:
/
8102, REPORT_VRF_FAILED_ON_NODES, "Checks did not pass for the following node(s):"
// *Document: NO
//  *Cause:
// *Action:
/
8110, REPORT_VRF_HEADER, "Verifying {0} "
// *Document: NO
//  *Cause:
// *Action:
/
8111, REPORT_PRE_VRF_HEADER, "Performing pre-checks for {0} "
// *Document: NO
//  *Cause:
// *Action:
/
8112, REPORT_POST_VRF_HEADER, "Performing post-checks for {0} "
// *Document: NO
//  *Cause:
// *Action:
/
8121, REPORT_VRF_SUCCESSFUL, "Verification of {0} was successful. "
// *Document: NO
//  *Cause:
// *Action:
/
8122, REPORT_VRF_PART_SUCCESSFUL, "Verification of {0} was unsuccessful. "
// *Document: NO
//  *Cause:
// *Action:
/
8123, REPORT_VRF_FAILURE, "Verification of {0} was unsuccessful on all the specified nodes. "
// *Document: NO
//  *Cause:
// *Action:
/
8124, REPORT_PRE_VRF_SUCCESSFUL, "Pre-check for {0} was successful. "
// *Document: NO
//  *Cause:
// *Action:
/
8125, REPORT_PRE_VRF_PART_SUCCESSFUL, "Pre-check for {0} was unsuccessful. "
// *Document: NO
//  *Cause:
// *Action:
/
8126, REPORT_PRE_VRF_FAILURE, "Pre-check for {0} was unsuccessful on all the nodes. "
// *Document: NO
//  *Cause:
// *Action:
/
8127, REPORT_POST_VRF_SUCCESSFUL, "Post-check for {0} was successful. "
// *Document: NO
//  *Cause:
// *Action:
/
8128, REPORT_POST_VRF_PART_SUCCESSFUL, "Post-check for {0} was unsuccessful. "
// *Document: NO
//  *Cause:
// *Action:
/
8129, REPORT_POST_VRF_FAILURE, "Post-check for {0} was unsuccessful on all the nodes. "
// *Document: NO
//  *Cause:
// *Action:
/
8130, REPORT_VRF_LOCAL_FAILURE, "Verification of {0} was unsuccessful. "
// *Document: NO
//  *Cause:
// *Action:
/
8131, REPORT_POST_VRF_LOCAL_FAILURE, "Post-check for {0} was unsuccessful. "
// *Document: NO
//  *Cause:
// *Action:
/
8132, REPORT_PRE_VRF_LOCAL_FAILURE, "Pre-check for {0} was unsuccessful. "
// *Document: NO
//  *Cause:
// *Action:
/
8200, REPORT_TXT_UNKNOWN, "unknown"
// *Document: NO
//  *Cause:
// *Action:
/
8201, REPORT_TXT_PASSED, "passed"
// *Document: NO
//  *Cause:
// *Action:
/
8202, REPORT_TXT_FAILED, "failed"
// *Document: NO
//  *Cause:
// *Action:
/
8203, REPORT_TXT_SUCCESSFUL, "successful"
// *Document: NO
//  *Cause:
// *Action:
/
8204, REPORT_TXT_PARTIALLY_SUCCESSFUL, "partially successful"
// *Document: NO
//  *Cause:
// *Action:
/
8205, REPORT_TXT_INSTALLED, "installed"
// *Document: NO
//  *Cause:
// *Action:
/
8206, REPORT_TXT_MISSING, "missing"
// *Document: NO
//  *Cause:
// *Action:
/
8207, REPORT_TXT_ALIVE, "running"
// *Document: NO
//  *Cause:
// *Action:
/
8208, REPORT_TXT_NOTALIVE, "not running"
// *Document: NO
//  *Cause:
// *Action:
/
8209, REPORT_TXT_EXIST, "exists"
// *Document: NO
//  *Cause:
// *Action:
/
8210, REPORT_TXT_NOTEXIST, "does not exist"
// *Document: NO
//  *Cause:
// *Action:
/
8211, REPORT_TXT_NOT_APPLICABLE, "N/A"
// *Document: NO
//  *Cause:
// *Action:
/
8212, REPORT_TXT_YES, "yes"
// *Document: NO
//  *Cause:
// *Action:
/
8213, REPORT_TXT_NO, "no"
// *Document: NO
//  *Cause:
// *Action:
/
8214, REPORT_TXT_ON, "on"
// *Document: NO
//  *Cause:
// *Action:
/
8215, REPORT_TXT_OFF, "off"
// *Document: NO
//  *Cause:
// *Action:
/
8216, REPORT_TXT_IGNORED, "ignored"
// *Document: NO
//  *Cause:
// *Action:
/
8217, REPORT_TXT_MATCH, "matched"
// *Document: NO
//  *Cause:
// *Action:
/
8218, REPORT_TXT_MISMATCH, "mismatched"
// *Document: NO
//  *Cause:
// *Action:
/
8219, REPORT_TXT_SOFT, "soft"
// *Document: NO
//  *Cause:
// *Action:
/
8220, REPORT_TXT_HARD, "hard"
// *Document: NO
//  *Cause:
// *Action:
/
8221, REPORT_TXT_ONLINE, "online"
// *Document: NO
//  *Cause:
// *Action:
/
8222, REPORT_TXT_FAILED_IGNORABLE, "failed (ignorable)"
// *Document: NO
//  *Cause:
// *Action:
/
8300, REPORT_TXT_STAGE_HWOS, "hardware and operating system setup"
// *Document: NO
//  *Cause:
// *Action:
/
8301, REPORT_TXT_STAGE_CFS, "cluster file system"
// *Document: NO
//  *Cause:
// *Action:
/
8302, REPORT_TXT_STAGE_CLUSVC, "cluster services setup"
// *Document: NO
//  *Cause:
// *Action:
/
8303, REPORT_TXT_STAGE_DBINST, "database installation"
// *Document: NO
//  *Cause:
// *Action:
/
8304, REPORT_TXT_STAGE_NODEAPP, "node application creation"
// *Document: NO
//  *Cause:
// *Action:
/
8305, REPORT_TXT_STAGE_DBCFG, "database configuration"
// *Document: NO
//  *Cause:
// *Action:
/
8306, REPORT_TXT_STAGE_NODEADD, "node addition"
// *Document: NO
//  *Cause:
// *Action:
/
8307, REPORT_TXT_STAGE_STORADD, "storage addition"
// *Document: NO
//  *Cause:
// *Action:
/
8308, REPORT_TXT_STAGE_NETMOD, "network modification"
// *Document: NO
//  *Cause:
// *Action:
/
8309, REPORT_TXT_COMP_NODEREACH, "node reachability"
// *Document: NO
//  *Cause:
// *Action:
/
8311, REPORT_TXT_COMP_NODECON, "node connectivity"
// *Document: NO
//  *Cause:
// *Action:
/
8312, REPORT_TXT_COMP_CFS, "CFS integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8313, REPORT_TXT_COMP_SSA, "shared storage accessibility"
// *Document: NO
//  *Cause:
// *Action:
/
8314, REPORT_TXT_COMP_SPACE, "space availability"
// *Document: NO
//  *Cause:
// *Action:
/
8315, REPORT_TXT_COMP_SYS, "system requirement"
// *Document: NO
//  *Cause:
// *Action:
/
8316, REPORT_TXT_COMP_CLU, "cluster integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8317, REPORT_TXT_COMP_CLUMGR, "cluster manager integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8318, REPORT_TXT_COMP_OCR, "OCR integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8319, REPORT_TXT_COMP_CRS, "CRS integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8320, REPORT_TXT_COMP_ADMPRV, "administrative privileges"
// *Document: NO
//  *Cause:
// *Action:
/
8321, REPORT_TXT_COMP_PEER, "peer compatibility"
// *Document: NO
//  *Cause:
// *Action:
/
8322, REPORT_TXT_COMP_NODEAPP, "node application existence"
// *Document: NO
//  *Cause:
// *Action:
/
8323, REPORT_TXT_COMP_OLR, "OLR integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8324, REPORT_TXT_COMP_HA, "Oracle Restart integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8325, REPORT_TXT_STAGE_HACONFIG, "Oracle Restart configuration"
// *Document: NO
//  *Cause:
// *Action:
/
8327, REPORT_TXT_STAGE_NODEDEL, "node removal"
// *Document: NO
//  *Cause:
// *Action:
/
8328, REPORT_TXT_COMP_SOFTWARE, "software"
// *Document: NO
//  *Cause:
// *Action:
/
8329, REPORT_TXT_STAGE_USMCONFIG, "ACFS Configuration"
// *Document: NO
//  *Cause:
// *Action:
/
8330, REPORT_TXT_COMP_USM, "ACFS Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8331, USM_TXT_EXP, "ASM Cluster File System"
// *Document: NO
//  *Cause:
// *Action:
/
8332, ASM_TXT_EXP, "Automatic Storage Manager"
// *Document: NO
//  *Cause:
// *Action:
/
8333, REPORT_TXT_COMP_GNS, "GNS integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8334, REPORT_TXT_COMP_GPNP, "GPNP integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8335, REPORT_TXT_COMP_SCAN, "scan"
// *Document: NO
//  *Cause:
// *Action:
/
8336, REPORT_TXT_COMP_ASM, "ASM Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8337, REPORT_TXT_COMP_OHASD, "OHASD integrity"
// *Document: NO
//  *Cause:
// *Action:
/
8338, REPORT_TXT_COMP_CTSS, "Clock Synchronization across the cluster nodes"
// *Document: NO
//  *Cause:
// *Action:
/
8339, REPORT_TXT_COMP_VDISK, "Voting Disk"
// *Document: NO
//  *Cause:
// *Action:
/
8340, REPORT_TXT_COMP_HEALTH, "Health Check"
// *Document: NO
//  *Cause:
// *Action:
/
8500, PRIMARY, "Primary"
// *Document: NO
//  *Cause:
// *Action:
/
8501, SECONDARY, "Secondary"
// *Document: NO
//  *Cause:
// *Action:
/
8502, SHARING_NODES, "Sharing Nodes ({0} in count)"
// *Document: NO
//  *Cause:
// *Action:
/
8503, REPORT_TXT_WARNING, "WARNING: "
// *Document: NO
//  *Cause:
// *Action:
/
8504, REPORT_TXT_ERROR, "ERROR: "
// *Document: NO
//  *Cause:
// *Action:
/
8505, REPORT_TXT_FAILURE_NODES, "Check failed on nodes: "
// *Document: NO
//  *Cause:
// *Action:
/
8506, REPORT_TXT_RESULT, "Result: "
// *Document: NO
//  *Cause:
// *Action:
/
8507, REPORT_TXT_CRS, "Oracle Clusterware"
// *Document: NO
//  *Cause:
// *Action:
/
8508, REPORT_TXT_DATABASE, "Database"
// *Document: NO
//  *Cause:
// *Action:
/
8509, REPORT_TXT_PINNED, "Pinned"
// *Document: NO
//  *Cause:
// *Action:
/
8510, REPORT_TXT_NOT_PINNED, "Not Pinned"
// *Document: NO
//  *Cause:
// *Action:
/
9000, UTIL_INVALID_CVHOME, "CV_HOME \"{0}\" is not a valid directory"
// *Document: NO
//  *Cause:
// *Action:
/
9001, UTIL_INVALID_CRSHOME, "CRS home \"{0}\" is not a valid directory"
// *Document: NO
//  *Cause:
// *Action:
/
9002, UTIL_MISSING_LSNODES, "The required component \"lsnodes\" is missing"
// *Document: NO
//  *Cause:
// *Action:
/
9003, UTIL_MISSING_OLSNODES, "The required component \"olsnodes\" is missing"
// *Document: NO
//  *Cause:
// *Action:
/
9004, UTIL_NODELIST_RETRIVAL_FAILED, "Unable to retrieve nodelist from Oracle clusterware"
// *Document: NO
//  *Cause:
// *Action:
/
9005, UTIL_MISSING_CVNODELIST, "The system property {0} has not been set to the static nodelist"
// *Document: NO
//  *Cause:
// *Action:
/
9006, UTIL_NO_CRS_DISP_NAME_IN_CDM, "Display name for CRS daemon is not available with configuration data manager"
// *Document: NO
//  *Cause:
// *Action:
/
9007, UTIL_NO_CSS_DISP_NAME_IN_CDM, "Display name for CSS daemon is not available with configuration data manager"
// *Document: NO
//  *Cause:
// *Action:
/
9008, UTIL_NO_EVM_DISP_NAME_IN_CDM, "Display name for EVM daemon is not available with configuration data manager"
// *Document: NO
//  *Cause:
// *Action:
/
9009, UTIL_NO_CRS_INTL_NAME_IN_CDM, "Internal name for CRS daemon is not available with configuration data manager"
// *Document: NO
//  *Cause:
// *Action:
/
9010, UTIL_NO_CSS_INTL_NAME_IN_CDM, "Internal name for CSS daemon is not available with configuration data manager"
// *Document: NO
//  *Cause:
// *Action:
/
9011, UTIL_NO_EVM_INTL_NAME_IN_CDM, "Internal name for EVM daemon is not available with configuration data manager"
// *Document: NO
//  *Cause:
// *Action:
/
9012, UTIL_DEST_NOT_WRITABLE_ON_NODES, "Path \"{0}\" is not a writeable directory on nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
9013, UTIL_DEST_IN_USE_ON_NODES, "The location \"{0}\" is owned by another user on nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
9014, UTIL_DEST_CAN_NOT_CREATE_ON_NODES, "Path \"{0}\" does not exist and cannot be created on nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
9015, UTIL_DEST_BAD_ALL_NODES, "Destination location \"{0}\" cannot be used on any of the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
9016, UTIL_USE_DIFFERENT_WORK_AREA, "Please choose a different work area using CV_DESTLOC"
// *Document: NO
//  *Cause:
// *Action:
/
9018, UTIL_DEST_NOT_ABSOLUTE_PATH, "Work area path \"{0}\" is invalid. It must be specified as an absolute pathname"
// *Document: NO
//  *Cause:
// *Action:
/
9019, UTIL_MISSING_OLSNODES_FROM_CH, "The required component \"olsnodes\" is missing from CRS home \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
9020, UTIL_MISSING_FROM_CH, "The required component \"{0}\" is missing from CRS home \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
9021, UTIL_DBVER_RETRIEVAL_FAILED, "Unable to retrieve database release version"
// *Document: NO
//  *Cause:
// *Action:
/
9035, UTIL_GET_CURRENT_GROUP_FAILED, "Unable to get the current group"
// *Document: NO
//  *Cause:
// *Action:
/
9036, UTIL_INVALID_RANGE_VALUE, "Invalid value \"{0}\" specified. Expected \"{1}\" value"
// *Document: NO
//  *Cause:
// *Action:
/
9037, UTIL_NULL_RANGE_OPERATOR, "Range operator is null"
// *Document: NO
//  *Cause:
// *Action:
/
9038, UTIL_INVALID_RANGE_OPERATOR_COMBO, "Invalid operator combination. \"{0}\" may not be used in combination with \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
9039, UTIL_INVALID_RANGE_BOUNDS, "Invalid range bounds specified. Range lower bound \"{0}\" specified by operator \"{1}\" must be smaller than the upper bound \"{2}\" specfied by \"{3}\""
// *Document: NO
//  *Cause:
// *Action:
/
9040, UTIL_OS_NOT_IDENTIFIED, "Cannot identify the operating system. Ensure that correct software is being executed for this operating system"
// *Document: NO
//  *Cause:
// *Action:
/
9041, GENERICUTIL_BAD_FORMAT, "String has bad format: \"{0}\" "
// *Cause: A parsing exception has occurred, and the string displayed could not parsed.
// *Action: This message should be part of one or more other messages. Please look at those messages and take appropriate action.
/
9300, TASK_OCFS2_CHECKING_CLUNAME, "Checking OCFS2 cluster name..."
// *Document: NO
//  *Cause:
// *Action:
/
9301, TASK_OCFS2_CLUNAME_MATCHED, "OCFS2 cluster name \"{0}\" matched on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
9302, TASK_OCFS2_CLUNAME_FAILED, "OCFS2 cluster name check failed"
// *Document: NO
//  *Cause:
// *Action:
/
9303, TASK_OCFS2_CHECKING_AVAILABLE_DRIVES, "Listing available OCFS2 drives..."
// *Document: NO
//  *Cause:
// *Action:
/
9304, TASK_OCFS2_LNX_CHK_RLVL, "Checking required run level configuration for ocfs2..."
// *Document: NO
//  *Cause:
// *Action:
/
9305, TASK_OCFS2_LNX_RLVL_PASSED, "OCFS2 is configured with proper run level on all the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
9306, TASK_OCFS2_LNX_RLVL_FAILED, "OCFS2 is not configured in runlevel 3,4 and 5 on all the nodes"
//  *Cause: Runlevel was not configured with levels 3,4 and 5 all being on.
// *Action: Check OCFS2 configuration and ensure the run levels indicated are on.
/
9307, OCFS2_NEEDS_UPGRADE, "OCFS2 shared storage discovery skipped because OCFS version 1.0.14 or later is required"
//  *Cause:
// *Action:
/
9308, OCFS2_EXIST_ON_LOCATION, "OCFS2 file system exists on \"{0}\""
//  *Cause:
// *Action:
/
9309, OCFS2_NOT_EXIST_ON_LOCATION, "OCFS2 file system does not exist on \"{0}\""
//  *Cause:
// *Action:
/
9310, TASK_OCFS2_LNX_RLVL_INCORRECT_NODE, "OCFS2 is not configured in runlevel 3,4 and 5 on the node"
// *Document: NO
//  *Cause:
// *Action:
/
9311, TASK_OCFS2_LNX_CNFG_CHECK_FAILED_NODE, "OCFS configuration check failed on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
9400, EXE_NOT_FOUND_EXCEPTION, "\"{0}\" not found on node \"{2}\""
// *Document: NO
//  *Cause:
// *Action:
/
9401, SUMMARY_CHECK_PASSED, "Check passed. "
// *Document: NO
//  *Cause:
// *Action:
/
9402, SUMMARY_CHECK_FAILED, "Check failed. "
// *Document: NO
//  *Cause:
// *Action:
/
9403, SUMMARY_CHECK_IGNORED, "Check ignored. "
// *Document: NO
//  *Cause:
// *Action:
/
9404, TEXT_OPTIONAL, "optional"
// *Document: NO
//  *Cause:
// *Action:
/
9405, TEXT_REQUIRED, "required"
// *Document: NO
//  *Cause:
// *Action:
/
9406, FILE_NOT_FOUND_ERROR, "File \"{0}\" does not exist. "
// *Document: NO
//  *Cause:
// *Action:
/
9407, INVALID_PLATFORM, "Invalid platform. This distribution is supported on Operating System \"{0}\" running on hardware architecture(s) \"{1}\" "
// *Document: NO
//  *Cause:
// *Action:
/
9500, TASK_ELEMENT_SCAN, "Single Client Access Name (SCAN)"
// *Document: NO
//  *Cause:
// *Action:
/
9501, TASK_ELEMENT_NTP, "Network Time Protocol (NTP)"
// *Document: NO
//  *Cause:
// *Action:
/
9502, TASK_ELEMENT_VOTEDSK, "Voting Disk"
// *Document: NO
//  *Cause:
// *Action:
/
9503, TASK_ELEMENT_DNSNIS, "DNS/NIS name service"
// *Document: NO
//  *Cause:
// *Action:
/
9600, TASK_DESC_SCAN, "This test verifies the Single Client Access Name configuration."
// *Document: NO
//  *Cause:
// *Action:
/
9601, TASK_DESC_NTP, "This task verifies cluster time synchronization on clusters that use Network Time Protocol (NTP)."
// *Document: NO
//  *Cause:
// *Action:
/
9602, TASK_SOFT_TOTAL_FILES, "{0} files verified"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9603, TASK_DESC_VOTEDSK, "This test verifies the Oracle Clusterware voting disk configuration which is used to determine which instances are members of a cluster."
// *Document: NO
//  *Cause:
// *Action:
/
9603, TASK_DESC_DNSNIS, "This test verifies that the Name Service lookups for the Distributed Name Server (DNS) and the Network Information Service (NIS) match for the SCAN name entries."
// *Document: NO
//  *Cause:
// *Action:
/
9649, TASK_CTSS_FAIL_GET_CRS_ACTIVE_VERSION, "Failed to retrieve active version for CRS on this node, performing NTP checks"
// *Document: NO
//  *Cause: 
// *Action: 
/
9650, TASK_CTSS_START, "Checking Oracle Cluster Time Synchronization Services(CTSS)..."
// *Document: NO
//  *Cause:
// *Action:
/
9651, TASK_CTSS_INTEGRITY_PASSED, "Oracle Cluster Time Synchronization Services check passed"
// *Document: NO
//  *Cause:
// *Action:
/
9652, TASK_CTSS_INTEGRITY_FAILED, "Cluster Time Synchronization Services check failed"
// *Document: NO
//  *Cause:
// *Action:
/
9653, TASK_CTSSCMD_GLOBALFAILURE, "Command \"{0}\" to check CTSS status failed on all of the nodes"
//  *Cause: CVU attempts to execute the displayed command failed on all of the nodes.
// *Action: Examine the messages displayed for each node and take action as per those messages.
/
9654, TASK_CTSS_OUTPUT_ERR_NODE, "CTSS status check command \"{0}\" executed successfully on node \"{1}\", but there was a failure in retrieving the output of this command"
//  *Cause: Reason for failure to retrieve output could be due to improper execution.
// *Action: Try the command manually on the node to verify proper execution, and fix any issues arising out of this.
/
9655, TASK_CTSS_PARSE_ERR_NODE, "Query of CTSS for time offset and reference produced invalid output on node \"{0}\" \nOutput: \"{1}\" "
//  *Cause: Failure to correctly parse output could be due to improper execution.
// *Action: Try the command manually on the node to verify proper execution, and fix any issues arising out of this.
/
9656, TASK_CTSS_EXEC_ERR_NODE, "The CTSS command to query time offset and reference failed on node \"{0}\" with error message \"{1}\" "
//  *Cause: Reason for failure to retrieve output could have been be due to improper execution.
// *Action: Try the command manually on the node to verify proper execution, and fix any issues arising out of this.
/
9657, TASK_CTSS_EXEC_ERR_ALL, "The CTSS command \"{0}\" failed to execute correctly or failed to produce valid output on all of the nodes"
//  *Cause: Reason for failure could be due to improper execution.
// *Action: Look at the individual messages for each node and take action as per those messages.
/
9658, TASK_CTSS_OFFSET_WITHIN_LIMITS_NODE, "The time offset of \"{1}\" on node \"{0}\" against reference node \"{3}\" is within specified limit of \"{2}\" milliseconds"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9659, TASK_CTSS_OFFSET_NOT_WITHIN_LIMITS_NODE, "The time offset of \"{1}\" on node \"{0}\" against reference node \"{3}\" is NOT within specified limit of \"{2}\" milliseconds"
// *Cause: One of the clocks, either on the current node, or on the reference node has drifted beyond limits.
// *Action: Monitor the offset over a longer duration and verify if the offset reduces over this period and falls within the threshold limits. Oracle Time Synchronization Service does periodic adjustments of the clock to attempt to bring it within threshold limits. If the threshold does not fall within limits over a period of time possibly due to a large deviation or drift, it is recommended that the Oracle processes on this node be shutdown, and the clock be adjusted on the problematic node suitably. It is NOT recommended to set a clock backwards.
/
9660, TASK_CTSS_OFFSET_WITHIN_LIMITS, "Time offset is within the specified limits on the following set of nodes: \n\"{0}\" "
// *Document: NO
// *Cause: N/A
// *Action: N/A
/
9661, TASK_CTSS_OFFSET_NOT_WITHIN_LIMITS, "Time offset is NOT within the specified limits on the following nodes: \n\"{0}\" "
// *Cause: System clock has drifted from the clock on the reference node for the specified set of nodes.
// *Action: Look at the individual messages for each node and take action as per those messages.
/
9662, TASK_ELEMENT_CTSS_INTEGRITY, "Clock Synchronization"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9663, TASK_DESC_CTSS_INTEGRITY, "This test checks the Oracle Cluster Time Synchronization Services across the cluster nodes."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9664, TASK_CTSS_INCNSTNT_STATE_ALL, "CTSS is in an inconsistent state with some nodes in Observer state and some nodes in Active state. All nodes must be either in Observer state or in Active state.\nNodes with CTSS in Active state:\"{0}\"\nNodes with CTSS in Observer state:\n\"{1}\" "
//  *Cause: Some nodes may have NTP configured and some other nodes may not have NTP configured, resulting in an inconsistent state of CTSS.
// *Action: Stop Oracle CTSS service on all nodes and restart. Ensure that NTP is either configured on all nodes or not configured on any node.
/
9665, TASK_CTSS_CRS_SOME_NODES_FAIL, "Check of Clusterware install failed on some nodes. Clock Synchronization check will proceed with remnaining nodes"
//  *Cause: A valid CRSHome was not found on one or more nodes. The messages displayed prior to this message indicate the list of nodes where a valid Clusteerware install was not found.
// *Action: Specify the correct set of nodes that contain a valid Clusterware installation, or complete the Clusterware installation on those node(s) and repeat this CVU verification.
/
9666, TASK_CTSS_OBSERVER_STATE_CHECK_NTP, "CTSS is in Observer state. Switching over to clock synchronization checks using NTP"
//  *Cause: All of the nodes queried for CTSS state indicate they are in Observer state. In the Observer state, CTSS is not performing active clock synchronization adjustments, but letting the underlying NTP handle this action.
// *Action: None. This is a normal state.
/
9667, TASK_CTSS_OBSERVER_STATE, "CTSS is in Observer state. Switching over to Windows-specific time synchronization checks"
//  *Cause: All of the nodes queried for CTSS state indicate they are in Observer state. In the Observer state, CTSS is not performing active clock synchronization adjustments, but letting the underlying Windows time synchronization mechanisms handle this action.
// *Action: Look at the results of the Windows time synchronization checks displayed following this message. If there are any errors reported, perform action suggested for those error messages.
/

9668, TASK_CTSS_RESCMD_GLOBALFAILURE, "Command \"{0}\" executed to retrieve CTSS resource status failed on all of the nodes"
//  *Cause: CVU attempts to execute the displayed command failed on all of the nodes.
// *Action: Examine the messages displayed for each node and take action as per those messages.
/
9669, TASK_CTSS_RES_GLOBALFAILURE, "Failure to query CTSS resource on all nodes in the cluster"
//  *Cause: Attempt to query CTSS resource on all of the nodes in the cluster failed. Possibly because clusterware may not be running on the nodes.
// *Action: Look at the specific error messages reported for each of the nodes and take action as per those messages.
/
9670, TASK_CTSS_RES_ERR_NODE, "Failure checking status of CTSS on node \"{1}\" using command \"{0}\" "
//  *Cause: CTSS may not OFFLINE, or may not be running, or the remote node may not be accessible.
// *Action: Try running in the indicated command directly on the specified node and ensure it is up and running, check that the remote node, and check user equivalence.
/
9671, TASK_CTSS_RES_PARSE_ERR_NODE, "CTSS on node \"{1}\" is not in ONLINE state, when checked with command \"{0}\" "
//  *Cause: The CTSS daemon is not running on the node, it may have died or may have been stopped.
// *Action: Restart the CTSS daemon on the specified node.
/
9672, TASK_CTSS_RES_FAIL_NODES, "All nodes for which CTSS state was checked failed the check: Nodes: \"{0}\" "
//  *Cause: CTSS is not in ONLINE state on any of nodes, possibly due to node accessibility, or being stopped.
// *Action: Look at the indvidual messages displayed for each node and perform the suggested action for those messages.
/
9673, TASK_CTSS_RES_PASS_NODES, "Check of CTSS resource passed on all nodes"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9674, TASK_CTSS_RES_CHECK_PASS, "CTSS resource check passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9675, TASK_CTSS_CRS_NODES_START, "Checking if Clusterware is installed on all nodes..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9676, TASK_CTSS_CRS_NODES_FAIL, "Clusterware is not installed on all nodes checked : \"{0}\" "
//  *Cause: A valid clusterware installation was not found on these nodes.
// *Action: Make sure the correct nodes are being specified in this check, or make sure that clusterware is fully installed on the nodes before running this check for those nodes.
/
9677, TASK_CTSS_RES_CHECK_START, "Checking if CTSS Resource is running on all nodes..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9678, TASK_CTSS_CRS_NODES_PASS, "Check of Clusterware install passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9679, TASK_CTSS_QUERY_START, "Querying CTSS for time offset on all nodes..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9680, TASK_CTSS_QUERY_FAIL, "Query of CTSS for time offset failed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9681, TASK_CTSS_STATE_START, "Check CTSS state started..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9682, TASK_CTSS_ACTIVE_STATE_START, "CTSS is in Active state. Proceeding with check of clock time offsets on all nodes..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9683, TASK_CTSS_ACTIVE_STATE_PASS, "Check of clock time offsets passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9684, TASK_CTSS_QUERY_PASS, "Query of CTSS for time offset passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9685, HDR_TIMEOFFSET, "Time Offset"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9686, HDR_TIMETHRESHOLD, "Offset Limit"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9687, TASK_CTSS_REFNODE_OFFSET_DISPLAY, "Reference Time Offset Limit: {0} msecs"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9688, HDR_STATE, "State"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9689, REPORT_TXT_ACTIVE, "Active"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9690, REPORT_TXT_OBSERVER, "Observer"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9691, TASK_CTSS_NO_NTP_ON_NT, "Clock Synchronization check without Oracle Cluster Time Synchronization Service (CTSS) is not supported on this platform"
//  *Cause: The command line parameter, '-noctss', was specified on the command line which indicates that Clock Synchronization check should be performed without Oracle Cluster Time Synchronization Service (CTSS). This is not supported on this platform.
// *Action: Run the Clock Synchronization check without the '-noctss' flag.
/
9692, TASK_CTSS_NOT_1102, "CRS Active version is less than 11.2, performing NTP checks"
//  *Cause: CTSS is supported only from release 11.2 onwards. Therefore, the clocksync component check can only run NTP checks.
// *Action: None.
/
9693, HDR_SERVICE_PACK, "Service Pack"
// *Document: NO
//  *Cause:
// *Action:
/
9694, HDR_PATCH, "Patch"
// *Document: NO
//  *Cause:
// *Action:
/
9695, OSPATCH_STATUS_FAILED, "Failed to determine operating system patch status on the node \"{0}\""
//  *Cause: Operating system patch status could not be determined.
// *Action: Ensure that the operating system configuration is accessible.
/
9696, TASK_CTSS_START_CHECK, "Check: Oracle Cluster Time Synchronization Services(CTSS)"
// *Document: NO
//  *Cause:
// *Action:
/
9697, TASK_CTSS_RES_CHECK_START_CHECK, "Check: CTSS Resource running on all nodes"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9698, TASK_CTSS_STATE_START_CHECK, "Check: CTSS state"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9699, TASK_CTSS_REFNODE_OFFSET_CHECK, "Check: Reference Time Offset"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
9800, TASK_USM_STORAGE_EXCEPTION, "An exception occurred while attempting to determine storage type for location \"{0}\" "
//  *Cause: The location indicated may not be available on the node, or may have insufficient permissions for access by the user running the CVU check.
// *Action: Make sure that the location is available on the node, and has the right permissions to allow the user running the CVU check to read its attributes.
9801, TASK_USM_STORAGE_NOT_DISK, "The storage location \"{0}\" is not a device, and therefore invalid for running Udev permissions check"
//  *Cause: UDev permissions check are valid only for storage devices, and not valid for any kind of file system.
// *Action: Make sure that a valid storage device location is specified. If the location is derived from an ASM discovery string, make sure that the discovery string specified points to one or more storage devices, and not filesystems.
/
9802, TASK_USMDEVICE_INFO_FAIL_NODE, "Attempt to get udev info from node \"{0}\" failed"
// *Cause: Attempt to read the udev permissions file failed, probably due to missing permissions directory, missing or invalid permissions file, or permissions file not accessible to use account running the check.
// *Action: Make sure that the udev permissions directory is created, the udev permissions file is available, and it has correct read permissions for access by the user running the check.
/
9803, TASK_USMDEVICE_CHECK_USM, "ACFS"
// *Document: NO
//  *Cause:
// *Action:
/
9804, TASK_USMDEVICE_CHECK_OCR, "OCR locations"
// *Document: NO
//  *Cause:
// *Action:
/
9805, TASK_USMDEVICE_CHECK_VDISK, "Voting Disk locations"
// *Document: NO
//  *Cause:
// *Action:
/
9806, TASK_UDEV_GET_ATTR_FAILED, "Failed to get storage attributes to compare udev attributes against, udev attributes check aborted"
//  *Cause: In order to compare Udev attributes for a given storage location, the expected storage attributes are required to compare against. There was a failure to get these attributes, possibly due to invalid on non-existing clusterware installation.
// *Action: Make sure that a valid Clusterware install exists on the node.
/
9807, INTERNAL_ERROR_KERNEL_PARAM_STEPS, "Encountered an internal error. The range of reference data for verification of kernel param \"{0}\" has not been correctly defined for node \"{1}\""
//  *Cause: No reference range defined to be used to calculate expected value.
// *Action: Define a reference range.
/
9808, NULL_OSPATCH, "specified OS patch is either null or is an empty string"
// *Document: NO
//  *Cause:
// *Action:
/
9809, IMPROPER_OSPATCH, "Proper OS Patch is not found on node \"{0}\" [Expected = \"{1}\" ; Found = \"{2}\"]"
//  *Cause: Required OS Patch is not applied.
// *Action: Apply the required OS Patch.
/
9810, NO_GENERIC_PREREQ_FILE_SET, "No prereq file defined"
//  *Cause: Prereq file was not set.
// *Action: Set prereq file.
/
9811, OS_NO_REF_DATA, "Reference data is not available for verifying prerequisites on this operating system distribution"
//  *Cause: No reference data was found for this operating system distribution.
// *Action: Please check the documentation for a list of supported operating system distributions for this product.
/
9900, TASK_BINARY_MATCHING_START, "Checking patch information..."
// *Document: NO
//  *Cause:
// *Action:
/
9901, TASK_BINARY_MATCHING_PASSED, "Oracle patch  check passed"
// *Document: NO
//  *Cause:
// *Action:
/
9902, TASK_BINARY_MATCHING_FAILED, "Oracle patch check failed"
// *Document: NO
//  *Cause:
// *Action:
/
9903, TASK_BM_CRS_SOME_NODES_FAIL, "Check of Clusterware install failed on some nodes. Oracle patch check will proceed with remaining nodes"
//  *Cause: A valid CRS home was not found on one or more nodes. The messages displayed prior to this message indicate the list of nodes where a valid Clusteerware install was not found.
// *Action: Specify the correct set of nodes that contain a valid Clusterware installation, or complete the Clusterware installation on those node(s) and repeat this CVU verification.
/
9904, TASK_BM_CRS_NODES_START, "Checking if Clusterware is installed on all nodes..."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9905, TASK_BM_CRS_NODES_FAIL, "Clusterware is not installed on the following nodes : \"{0}\" "
//  *Cause: A valid Clusterware installation was not found on these nodes.
// *Action: Make sure the correct nodes are being specified, and that the Clusterware is fully installed on the nodes before running this check for those nodes.
/
9906, TASK_BM_CRS_NODES_PASS, "Check of Clusterware install passed"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9907, TASK_BM_LS_INVENTORY_FAILED, "Failed to query patch information from OPatch inventory"
//  *Cause: The execution of opatch lsinventory command failed.
// *Action: Make sure that the install inventory is readable by the user.
/
9908, TASK_BM_NM_ORACLE_BIN_FAILED, "Failed to query patch information from Oracle executable"
//  *Cause: Oracle executable could not be queried for patch information.
// *Action: Make sure that Oracle executable is present and is readable by the user running CVU.
/
9909, TASK_BM_BUGLIST_MATCH_FAILED, "Patch information from OPatch did not match patch information from Oracle executable"
//  *Cause: Bug information from OPatch inventory does not match patch information recorded with Oracle executable.
// *Action: Make sure that all patches are applied correctly, refer to the OPatch user guide for information on patch application. Make sure that Oracle executable is relinked, refer to the Oracle Administrator Guide for information on relinking executables.
/
9910, TASK_BM_BUGLIST_MATCH_ACCROSS_NODES_FAILED, "Patch information is not consistent across nodes"
//  *Cause: Bug information from OPatch do not match between the nodes.
// *Action: Make sure that all patches are applied correctly on all nodes, refer to the OPatch user guide for information on patch application.
/
9911, TASK_BM_LSINV_FAILED_CLI, "Failed to query patching information from OPatch on the following nodes:"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9912, TASK_BM_NM_FAILED_CLI, "Failed to query patching information from the Oracle executable on the following nodes:"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
9913, TASK_BM_BUGLIST_MATCH_FAILED_CLI, "Patch information from OPatch did not match patch information from Oracle executable on the following nodes:"
//  *Cause: Bug information from OPatch inventory does not match patch information recorded with Oracle executable.
// *Action: Make sure that all patches are applied correctly, refer to the OPatch user guide for information on patch application. Make sure that Oracle executable is relinked, refer to the Oracle Administrator Guide for information on relinking executables.
/
9914, TASK_BM_BUGLIST_MATCH_ACCROSS_NODES_FAILED_CLI, "bug list did not match across nodes for the following nodes"
//  *Cause: Bug information from OPatch do not match between the nodes.
// *Action: Make sure that all patches are applied correctly on all nodes, refer to the OPatch user guide for information on patch application.
/
9950, COMP_ASM_DISP_NAME, "Automatic Storage Management"
// *Document: NO
//  *Cause:
// *Action:
/
9951, COMP_CFS_DISP_NAME, "Cluster File System"
// *Document: NO
//  *Cause:
// *Action:
/
9952, COMP_CLUSTER_DISP_NAME, "Cluster"
// *Document: NO
//  *Cause:
// *Action:
/
9953, COMP_CLUSTER_MGR_DISP_NAME, "Cluster Manager"
// *Document: NO
//  *Cause:
// *Action:
/
9954, COMP_CRS_DISP_NAME, "Oracle Clusterware"
// *Document: NO
//  *Cause:
// *Action:
/
9955, COMP_CTSS_DISP_NAME, "Oracle Cluster Time Synch Service"
// *Document: NO
//  *Cause:
// *Action:
/
9956, COMP_GNS_DISP_NAME, "GNS"
// *Document: NO
//  *Cause:
// *Action:
/
9957, COMP_GPNP_DISP_NAME, "Grid Plug-n-Play"
// *Document: NO
//  *Cause:
// *Action:
/
9958, COMP_HA_DISP_NAME, "Oracle Restart"
// *Document: NO
//  *Cause:
// *Action:
/
9959, COMP_HEALTH_DISP_NAME, "Health"
// *Document: NO
//  *Cause:
// *Action:
/
9960, COMP_NODEAPP_DISP_NAME, "Node Apps"
// *Document: NO
//  *Cause:
// *Action:
/
9961, COMP_NODE_REACH_DISP_NAME, "Node Reachability"
// *Document: NO
//  *Cause:
// *Action:
/
9962, COMP_OCR_DISP_NAME, "Oracle Cluster Repository"
// *Document: NO
//  *Cause:
// *Action:
/
9963, COMP_OHASD_DISP_NAME, "Oracle High Availability Daemon"
// *Document: NO
//  *Cause:
// *Action:
/
9964, COMP_OLR_DISP_NAME, "Oracle Local Repository"
// *Document: NO
//  *Cause:
// *Action:
/
9965, COMP_SCAN_DISP_NAME, "Scan"
// *Document: NO
//  *Cause:
// *Action:
/
9966, COMP_SOFTWARE_DISP_NAME, "Software"
// *Document: NO
//  *Cause:
// *Action:
/
9967, COMP_STORAGE_DISP_NAME, "Storage"
// *Document: NO
//  *Cause:
// *Action:
/
9968, COMP_SYS_DISP_NAME, "System"
// *Document: NO
//  *Cause:
// *Action:
/
9969, COMP_USM_DISP_NAME, "ACFS"
// *Document: NO
//  *Cause:
// *Action:
/
9970, COMP_VDISK_DISP_NAME, "Voting Disk"
// *Document: NO
//  *Cause:
// *Action:
/
9971, TASK_DISPLAY_NAME_AVAIL_MEMORY, "Available memory"
// *Document: NO
//  *Cause:
// *Action:
/
9972, TASK_DISPLAY_NAME_GROUP_EXISTENCE, "Group existence for \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
9973, TASK_DISPLAY_NAME_GROUP_MEMBERSHIP, "Group membership for \"{0}\" in \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
9974, TASK_DISPLAY_NAME_KERNEL_PARAM, "Kernel param \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
9975, TASK_DISPLAY_NAME_PACKAGE, "Package existence for \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
9976, TASK_DISPLAY_NAME_PHYSICAL_MEMORY, "Physical memory"
// *Document: NO
//  *Cause:
// *Action:
/
9977, TASK_DISPLAY_NAME_USER_EXISTENCE, "User existence for \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
9978, TASK_UDEV_CRSUSER_RETRIEVE_FAIL, "Dummy message to satisfy language resource files compile"
// *Document: NO
//  *Cause:
// *Action:
/
9979, TASK_UDEV_CRSUSER_PARSING_FAIL, "Dummy message to satisfy language resource files compile"
// *Document: NO
//  *Cause:
// *Action:
/
9980, TASK_UDEV_CRSUSER_RETRIEVE_NO_OUTPUT, "Dummy message to satisfy language resource files compile"
// *Document: NO
//  *Cause:
// *Action:
/
9981, TASK_UDEV_CRSUSER_RESULT_STATUS_FAIL, "Dummy message to satisfy language resource files compile"
// *Document: NO
//  *Cause:
// *Action:
/
9982, TASK_UDEV_CRSUSER_CLUSTER_EXCEPTION, "Dummy message to satisfy language resource files compile"
// *Document: NO
//  *Cause:
// *Action:
/
9983, TASK_CTSS_NTP_ONLY_START, "Dummy message to satisfy language resource files compile"
// *Document: NO
//  *Cause:
// *Action:
/
9990, ANTIVIRUS_RUNNING, "Antivirus software is running"
//  *Cause: Antivirus software was detected to be running. 
// *Action: Oracle recommends that the Antivirus software be disabled. Antivirus may introduce delays in processing that interfere with time-sensitive cluster operations.
/
9991, TASK_ASMDEVCHK_OWNER_INCONSISTENT_REF, "Owner of device \"{0}\" did not match the expected owner. [Expected = \"{1}\"; Found = \"{2}\"]"
//  *Cause: Owner of the device listed was different than required owner.
// *Action: Change the owner of the device listed or specify a different device.
/
9992, TASK_ASMDEVCHK_GROUP_INCONSISTENT_REF, "Group of device \"{0}\" did not match the expected group. [Expected = \"{1}\"; Found = \"{2}\"]"
//  *Cause: Group of the device listed was different than required group.
// *Action: Change the group of the device listed or specify a different device.
/
9993, TASK_ASMDEVCHK_PERMS_INCONSISTENT_REF, "Permissions of device \"{0}\" did not match the expected permissions. [Expected = \"{1}\"; Found = \"{2}\"]"
//  *Cause: Permissions of the device listed was different than the required permissions.
// *Action: Change the permissions on the device listed or specify a different device.
/
9994, TASK_ASMDEVCHK_DEVICE_CHK_ERROR, "Owner, group, permission information could not be obtained for device(s) \"{0}\" on node \"{1}\""
//  *Cause: Owner, group and permission information could not be obtained for devices listed on the nodes listed.
// *Action: "Ensure that the correct devices were specified and that they are created on the indicated node. Make sure that the path exists and is accessible by the user.
/
9995, TASK_ASMDEVCHK_DEVICE_CHK_ERROR_NODE, "Owner, group, permission information could not be obtained for all devices on node \"{1}\""
//  *Cause: Owner, group and permission information could not be obtained for all devices on the node listed.
// *Action: Make sure that the node is up. Make sure that user equivalence exists on the node listed.
/
