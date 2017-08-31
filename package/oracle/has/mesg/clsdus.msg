/ Copyright (c) Oracle Corporation 2001.  All Rights Reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clsdus.msg
/ DESCRIPTION
/   Message file for CLSD global alert
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ IMP: THIS FILE IS NOW OBSOLETE. PLEASE DO NOT ADD/MODIFY ANYTHING IN THIS 
/ FILE. THE MESSAGES IN THIS FILE HAVE BEEN MOVED TO crsus.msg. 
/ PLEASE MAKE ANY NEEDED CHANGES IN THAT FILE.
/
/ MODIFIED
/    sukumar    08/20/08 - 
/    jleys      06/24/08 - Remove diff lines
/    jleys      06/17/08 - Fix merge diffs
/   jleys       04/20/08  - Add alert log msgs for CSS failures in clscfg
/   gdbhat      06/23/08  - Mark file as obsolete
/   samjo       05/29/08  - Print version string in 1005
/   gdbhat      05/19/08  - OBSOLETION OF clsdus.msg
/   ysharoni    05/01/08  - Add mDNS messages
/   sukumar     04/23/08  - Add CLSD internal message for failing IO.
/   samjo       03/26/08  - Fix CTSS alerts
/   vrai        12/16/07  - Cluster Time Synchronization service alerts
/   jgrout      12/03/07  - Correct format in msgs 2005, 2006
/   jleys       08/24/07  - Correct msg 1606
/   samjo       07/09/07  - Add Cluster Time Synchronization service alerts
/   rwessman    05/17/07  - Added RD and GNS pass-through messages.
/   mkallana    03/13/07  - XbranchMerge mkallana_alertlog_dec04 from
/                           st_has_11.1
/   ysharoni    12/15/06  - addition of gpnp messages.
/   mkallana    12/19/06  - add alert messages for css
/   minzhu      08/28/06  - better wording for split-brain case
/   minzhu      08/10/06  - add new alert msg for split-brain case 
/   kelee       07/24/06  - Fix OLR message 
/   ilam        03/24/05  - Fix CRS alert for 10gR2 
/   samjo       03/17/05  - Update clscfg alerts 
/   rajayar     02/16/05  - caues and action for CRS and EVM 
/   samjo       02/04/05  - Adding cause and action for OCR alerts 
/   kelee       12/22/04  - change OCR alert 
/   ilam        11/08/04  - Update with more 10gR2 CRS messages
/   ilam        09/24/04  - Add msg for CLSDM 
/   ilam        06/23/04  - Add alert messages for CRS stacks
/   ilam        05/14/04  - ilam_clsd_10gr2_logging_change
/   ilam        05/08/04  - Created
/
/ Dated: 19-May-2008
/ ------------------
/ Messages from clsdus.msg will be moved to crsus.msg. The new range, once 
/ the move is done will be as follows:
/   0000-0100: CLSD specific internal messages (From clsdus.msg)
/   0101-1000: CRS specific messages (From crsus.msg)
/   1001-1200: OCR specific messages (From clsdus.msg)
/   1201-1400: CRSD specific messages (From clsdus.msg)
/   1401-1600: EVMD specific messages (From clsdus.msg)
/   1601-1800: CSSD specific messages (From clsdus.msg)
/   1801-1900: CLSCFG specific messages (From clsdus.msg)
/   1901-2000: CRSCTL specific messages (From clsdus.msg)
/   2001-2050: CLSDM specific messages (From clsdus.msg)
/   2101-2300: OLR specific messages (From clsdus.msg)
/   2301-2400: GPNP specific messages (From clsdus.msg)
/   2401-2499: Cluster Time Synchronization service specific messages
/   2500-2800: CRS Policy Engine error messages
/   4000-4999: CRSCTL specific messages
/   5000-5500: HAA specific messages
/   5501-5600: Reporter specific messages
/   5601-5700: MDNS specific messages
/   5701-5800: Placement Policy specific messages
/   5801-5999: AGFW specific messages
/   6001-6999: CRSD specific messages
/   10000-10001: Other component specific messages
/
/ Please add messages based on the above range, and check with crsus.msg to see
/ that there are no overlapping numbers. Talk to Gajanan Bhat before making any
/ changes.
/////////////////////////////////////////////////////////////////////////
/
/ CLSD specified messages
/
0000, 0, "Testing message for CLSD regression %s"
// *Cause:  None
// *Action: None
0001, 0, "Error flushing trace data for component %s"
// *Cause:  One of the lower layers have failed to write the data out.
// *Action: None
0002, 0, "Internal corruption detected, details at %s in %s"
// *Cause:  Internal error.
// *Action: Contact Oracle Customer Support.
/
0600, 0, "[%s] Error [%s]. Details in %s."
// *Cause: None
// *Action: None
/
/   1001-1200: OCR specified messages
/    NOTE TO DEVELOPER:
/              When an OCR message is added or deleted, a corresponding
/              OLR message must be added or deleted if applicable.
/              Please do not fill holes in the message numbers because
/              the unused message numbers might be used by OLR messages.
/    NOTE TO TRANSLATOR:
/              These OCR messages should be translated almost identical
/              to the corresponding OLR messages (2101 - 2300).
/
1001, 0, "The OCR was formatted using version %d."
// *Cause: Successfully formatted the OCR location(s). 
// *Action: None
1002, 0, "The OCR was restored from %s."
// *Cause: The OCR was successfully restored from a backup file as requested
//         by the user.
// *Action: None
1003, 0, "The OCR format was downgraded to version %d."
// *Cause: The OCR was successfully downgraded to an earlier block format
//         as requested by the user.
// *Action: None
1004, 0, "The OCR was imported from %s."
// *Cause: Successfully imported the OCR contents from a file as requested
//         by the user.
// *Action: None
1005, 0, "The OCR upgrade was completed. Version has changed from [%d, %s] to [%d, %s]. Details in %s."
// *Cause: The OCR was successfully upgraded to a newer block format.
// *Action: None
1006, 0, "The OCR location %s is inaccessible. Details in %s."
// *Cause: An error occurred while accessing the OCR.
// *Action: Use the ocrcheck command to validate the accessibility of the
//          device and its block integrity. Check that the OCR location in
//          question has the correct permissions. Determine whether this
//          behavior is limited to one node or whether it occurs across all of
//          the nodes in the cluster.
//          Use the ocrconfig command with the -replace option to replace
//          the OCR location.
1007, 0, "The OCR/OCR mirror location was replaced by %s."
// *Cause: The OCR location was successfully replaced as requested by the user.
// *Action: None
1008, 0, "Node %s is not responding to OCR requests. Details in %s."
// *Cause: Error in communicating to the OCR server on a peer node. This OCR
//         did not receive a notification regarding its peer's death within
//         the specified time.
// *Action: Contact Oracle Customer Support.
1009, 0, "The OCR configuration is invalid. Details in %s."
// *Cause: The OCR configuration on this node does not match the OCR 
//         configuration on the other nodes in the cluster.
// *Action: Determine the OCR configuration on the other nodes in the cluster 
//          on which Oracle Clusterware is running by using the ocrcheck
//          command. Run the ocrconfig command with the -repair option to
//          correct the OCR configuration on this node.
1010, 0, "The OCR mirror location %s was removed."
// *Cause: The OCR location was successfully removed as requested by the user.
// *Action: None
1011, 0, "OCR cannot determine that the OCR content contains the latest updates. Details in %s."
// *Cause: The OCR could not be started. The OCR location configured on this
//         node does not have the necessary votes and might not have the
//         latest updates. 
// *Action: Ensure that the other nodes in the cluster have the same OCR
//          location configured. If the configuration on the other nodes in
//          the cluster does not match, then run the ocrconfig command with
//          the -repair option to correct the configuration on this node.
//          If the configurations on all of the nodes match, use the ocrdump
//          command to ensure that the existing OCR location has the latest
//          updates. Run the ocrconfig command with the -overwrite option to
//          correct the problem. If the se procedures do not correct the
//          problem, then contact Oracle Customer Support.
1012, 0, "The OCR service started on node %s."
// *Cause: The OCR was successfully started.
// *Action: None
/
/   1201-1400: CRSD specified messages
/
1201, 0, "CRSD started on node %s."
// *Cause: CRSD has started, possibly due to a CRS start, or a node reboot or
//         a CRSD restart.    
// *Action: None Required. You can run the command 'crsctl check crsd' to
//          validate the health of the CRSD
1202, 0, "CRSD aborted on node %s. Error [%s]. Details in %s."
// *Cause: Fatal Internal Error. Check the CRSD log file to determine the cause.
// *Action: Determine whether the CRSD gets auto-started.
1203, 0, "Failover failed for the CRS resource %s. Details in %s."
// *Cause:  Failover failed due to an internal error. Examine the contents of
//           the CRSD log file to determine the cause.
// *Action: None
1204, 0, "Recovering CRS resources for node %s."
// *Cause: CRS resources are being recovered, possibly because the cluster
//         node is starting up online. 
// *Action: Check the status of the resources using the crs_stat command.
1205, 0, "Auto-start failed for the CRS resource %s. Details in %s."
// *Cause: This message comes up when the auto-start for the resource has
//         failed during a reboot of the cluster node. 
// *Action: Start the resources using the crs_start command.
1206, 0, "Resource %s went into an UNKNOWN state. Force stop the resource using the crs_stop -f command and restart %s."
// *Cause:  Resource went into an UNKNOWN state because the check or the stop
//          action on the resource failed.
// *Action: Force stop the resource using the crs_stop -f command and
//          restart the resource
1207, 0, "There are no more restart attempts left for resource %s. Restart the resource manually using the crs_start command."
// *Cause: The Oracle Clusterware is no longer attempting to restart the
//         resource because the resource has failed and the Oracle Clusterware
//         has exhausted the maximum number of restart attempts.
// *Action: Use the crs_start command to restart the resouce manually.
/
/   1401-1600: EVMD specified messages
/
1401, 0, "EVMD started on node %s."
// *Cause: EVMD has started either because of a CRS start, a node reboot,
//         or an EVMD restart. 
// *Action: None required. You can run the 'crsctl check evmd' command to validate the health of EVMD.
1402, 0, "EVMD aborted on node %s. Error [%s]. Details in %s."
// *Cause:  EVMD has aborted due to an internal error. Check the EVMD log file
//          to determine the cause.
// *Action: Determine whether the EVMD is auto-started
/
/   1601-1800: CSSD specified messages
/
1601, 0, "CSSD Reconfiguration complete. Active nodes are %s."
// *Cause:  A node joined or left the cluster
// *Action: None
1602, 0, "CSSD aborted on node %s. Error [%s]. Details in %s."
// *Cause:  The CSS daemon aborted on the listed node with the listed return
//          code
// *Action: Collect the CSS daemon logs from all nodes and any CSS daemon core
//          files and contact Oracle Support
1603, 0, "CSSD on node %s shutdown by user."
// *Cause:  The CSS daemon on the listed node was terminated by a user
// *Action: None
1604, 0, "CSSD voting file is offline: %s. Details in %s."
// *Cause:  The listed voting file became unusable on the local node
// *Action: Verify that the filesystem containing the listed voting file is
//          available on the local node
1605, 0, "CSSD voting file is online: %s. Details in %s."
// *Cause:  The CSS daemon has detected a valid configured voting file
// *Action: None
1606, 0, "CSSD Insufficient voting files available [%d of %d]. Details in %s."
// *Cause:  The number of voting files has decreased to a number of files
//          that is insufficient.
// *Action: Locate previous 1604 messages and take action as indicated for
//          message 1604
1607, 0, "CSSD evicting node %s. Details in %s."
// *Cause:  The local node is evicting the indicated node
// *Action: Collect the CSS daemon logs from all nodes and any CSS daemon core
//          files and contact Oracle Support
1608, 0, "CSSD Evicted by node %s. Details in %s."
// *Cause:  The local node was evicted by the indicated node
// *Action: Collect the CSS daemon logs from all nodes and any CSS daemon core
//          files and contact Oracle Support
1609, 0, "CSSD detected a network split. Details in %s."
// *Cause:  Heartbeat messages between one or more nodes were not received
//          and one or more nodes were evicted from the cluster to
//          preserve data integrity. 
// *Action: Verify all network connections between cluster nodes and
//          repair any problematic connections. If there do not appear
//          to be any network problems, 
//          1. collect the CSS daemon logs, system messages and 
//             any CSS daemon core files from allnodes and 
//          2. contact Oracle Support.
/
1610,0,"node %s (%d) at 90%% heartbeat fatal, eviction in %d.%03d seconds"
// *Cause:  Did not receive heartbeat messages from the node. This could be due 
//          network problems or failure of listed node.
// *Action: Check if the private interconnect network used by cluster is functioning
//          properly, including all the cables, network cards, switches/routers etc..
//          between this node and listed node. Correct any problems discovered.

1611,0,"node %s (%d) at 75%% heartbeat fatal, eviction in %d.%03d seconds"
// *Cause:  Did not receive heartbeat messages from the node. This could be due 
//          to network problems or failure of the listed node.
// *Action: Check if the private interconnect network used by cluster is functioning
//          properly, including all the cables, network cards, switches/routers etc..
//          between this node and listed node. Correct any problems discovered.

1612,0,"node %s (%d) at 50%% heartbeat fatal, eviction in %d.%03d seconds"
// *Cause:  Did not receive heartbeat messages from the node. This could be due to
//          to network problems or failure of listed node.
// *Action: Check if the private interconnect network used by cluster is functioning
//          properly, including all the cables, network cards, switches/routers etc..
//          between this node and listed node. Correct any problems discovered.

1613,0,"voting device hang at 90%% fatal, termination in %u ms, disk (%d/%s)"
// *Cause: Voting device I/O has not completed for a long time. This could be due  
//         some error with the device voting file is on or in some element in the
//         path of the I/O to the device.
// *Action:Verify if the device is working properly including all the I/O paths.
//         Voting file listed will be considered inactive in the number of secs
//         specified. Failure of a majority of devices would result in node reboot.

1614,0,"voting device hang at 75%% fatal, termination in %u ms, disk (%d/%s)"
// *Cause:Voting device I/O has not completed for a long time. This could be due  
//        some error with the device voting file is on or in some element in the
//        path of the I/O to the device.
// *Action:Verify if the device is working properly including all the I/O paths.
//        Voting file listed will be considered inactive in the number of secs
//        specified. Failure of a majority of devices would result in node reboot.

1615,0,"voting device hang at 50%% fatal, termination in %u ms, disk (%d/%s)"
// *Cause:Voting device I/O has not completed for a long time. This could be due  
//        some error with the device voting file is on or in some element in the
//        path of the I/O to the device.
// *Action:Verify if the device is working properly including all the I/O paths.
//        Voting file listed will be considered inactive in the number of secs
//        specified. Failure of a majority of devices would result in node reboot.

/   1801-1900: CLSCFG specified messages
/
1801, 0, "Cluster %s configured with nodes %s."
// *Cause:  None
// *Action: None
1802, 0, "Node %s added to cluster."
// *Cause:  None
// *Action: None
1803, 0, "Node %s deleted from cluster."
// *Cause:  None
// *Action: None
1804, 0, "Node %s upgraded to version %s."
// *Cause:  None
// *Action: None
1805, 0, "Unable to connect to the CSS daemon, return code %d"
// *Cause: Could not initialize the CSS connection
// *Action: Verify that the CSS daemon is running and restart it if it
//          is not up.  Retry the operation
1806, 0, "An error occurred when obtaining the node number of this host, return code %d"
// *Cause: The request for node number of this node failed.
// *Action: Verify that the CSS daemon is running and restart it if not
//          Retry the operation that failed after restart.
//          Look for error messages from the CSS daemon in the alert log
//          indicating any problems.

/
/   1901-2000: CRSCTL specified messages
/
1901, 0, "CRS service setting (%s) is changed from [%s] to [%s]."
// *Cause:  None
// *Action: None
/
/   2001-2050: CLSDM specified messages
/
2001, 0, "memory allocation error when initiating the connection"
// *Cause: failed to allocate memory for the connection with the target process 
// *Action: None.
2002, 0, "connection by user %s to %s refused"
// *Cause: User command cannot connect to the target process.
// *Action: The user may not have sufficient privilege to connect.
2003, 0, "error %d encountered when connecting to %s"
// *Cause: Connection to the target process failed.
// *Action: Examine whether the connection is made properly.
//          Retry again at a later time if necessary.
2004, 0, "error %d encountered when sending messages to %s"
// *Cause: User command cannot communicate with the target process properly.
// *Action: Retry again at a later time.
2005, 0, "timed out when waiting for response from %s"
// *Cause: the target process does not return acknowledgement in time.
// *Action: Retry again at a later time.
2006, 0, "error %d encountered when receiving messages from %s"
// *Cause: no meta or response message was received from the target process
// *Action: Retry again at a later time.
2007, 0, "invalid component key name <%s> used"
// *Cause: the given component key name could not be recognized.
// *Action: re-run the command with a valid component key name.
2008, 0, "invalid message type <%d> used"
// *Cause: an unrecognized message type was sent.
// *Action: Retry with a valid command again.
2009, 0, "unable to get authentication for user %s"
// *Cause: current user was not authenticated for connection.
// *Action: Log in as another user and try again.
2010, 0, "invalid response message from %s"
// *Cause: Response message has incorrect format.
// *Action: Retry again at a later time
2011, 0, "no response at index %d in response message from %s"
// *Cause: Response message did not contain a response at the specified index
// *Action: If this is an unexpected result, retry again at a later time
/
/   2101-2300: OLR specified messages
/    NOTE TO DEVELOPER:
/              OLR message number = OCR message number + 1100
/              When an OLR message is added or deleted, a corresponding
/              OCR message must be added or deleted if applicable.
/              Please do not fill holes in the message numbers because
/              the unused message numbers might be used by OCR messages.
/    NOTE TO TRANSLATOR:
/              These OLR messages should be translated almost identical
/              to the corresponding OCR messages (1001 - 1200).
/
/
2101, 0, "The OLR was formatted using version %d."
// *Cause: Successfully formatted the OLR location(s). 
// *Action: None
/
/2102 is not applicable to OLR
/
2103, 0, "The OLR format was downgraded to version %d."
// *Cause: The OLR was successfully downgraded to an earlier block format
//         as requested by the user.
// *Action: None
2104, 0, "The OLR was imported from %s."
// *Cause: Successfully imported the OLR contents from a file as requested
//         by the user.
// *Action: None
2105, 0, "The OLR upgrade was completed. Version has changed from %d to %d. Details in %s."
// *Cause: The OLR was successfully upgraded to a newer block format.
// *Action: None
2106, 0, "The OLR location %s is inaccessible. Details in %s."
// *Cause: An error occurred while accessing the OLR.
// *Action: Use the "ocrcheck -local" command to validate the accessibility of
//          the device and its block integrity. Check that the OLR location in
//          question has the correct permissions.
/
/2107 is not applicable to OLR
/
/
/2108 is not applicable to OLR
/
/
/2108 is not applicable to OLR
/
/
/2110 is not applicable to OLR
/
/
/2111 is not applicable to OLR
/
2112, 0, "The OLR service started on node %s."
// *Cause: The OLR was successfully started.
// *Action: None
/
/
/   2301-2400: GPNP specified messages
/
2301, 0, "GPnP: %s"
// *Cause:  None, generic bypass gpnp message
// *Action: None
/
/   2401-2500: Cluster Time Synchronization service specific messages
/
2401, 0, "The Cluster Time Synchronization service started on host %s."
// *Cause: The Cluster Time Synchronization service successfully started on the listed node.
// *Action: None.
/
2402, 0, "The Cluster Time Synchronization service aborted on host %s. Details at %s in %s."
// *Cause:  The Cluster Time Synchronization service aborted due to an internal error. Check the Cluster Time Synchronization service log file to determine the cause.
// *Action: Determine whether the Cluster Time Synchronization service has auto-started
/
2403, 0, "The Cluster Time Synchronization service started on host %s in passive mode."
// *Cause: The Cluster Time Synchronization service detected an existing Network Time Protocol (NTP) service on the listed node.
// *Action: None.
/
2404, 0, "The Cluster Time Synchronization service terminated as local time is significantly different from mean cluster time."
// *Cause: The difference between the local time and mean cluster time is too much to be corrected.
// *Action: Reset clock and reconnect.
/
2405, 0, "The Cluster Time Synchronization service on host %s is shutdown by user"
// *Cause: The Cluster Time Synchronization service on listed node was terminated by a user.
// *Action: None.
/
2406, 0, "The Cluster Time Synchronization service timed out on host %s. Details in %s."
// *Cause:  A Cluster Time Synchronization service action failed. The information from the master was discarded.
// *Action: Verify all network connections between cluster nodes and repair any problematic connections. If no network problems are found,
// 1. run diagCollection.pl
// 2. contact Oracle support.
/
2407, 0, "The new Cluster Time Synchronization service master is on host %s."
// *Cause:  A new Cluster Time Synchronization service master has been elected.
// *Action: None.
/
2408, 0, "The clock on host %s has been updated to be synchronous with the mean cluster time."
// *Cause:  The clock is updated to be in sync with the mean cluster time.
// *Action: None.
/
2409, 0, "The clock on host %s is not synchronous with the mean cluster time. Details in %s"
// *Cause: The clock is not in sync with the mean cluster time. No action has been taken as Cluster Time Synchronization service is running in passive mode
// *Action: Verify correct operation of the Network Time Protocol (NTP) service on the node.
/
/
/   2501-2600: MDNS specified messages
/
2501, 0, "MDNS: %s"
// *Cause:  None, generic bypass mdns message
// *Action: None
/
2502, 0, "mDNS service stopping by request."
// *Cause:  mdnsd stopping by ohasd request.
// *Action: None
/
/
/
// Messages used as "pass-through" for various components.
// Resource Discovery
10000, 0, "%s"
// *Documented: NO
// *Cause:
// *Action:

// Grid Naming Service
10001, 0, "%s"
// *Documented: NO
// *Cause:
// *Action:
/
