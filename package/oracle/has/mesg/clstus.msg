/ Copyright (c) Oracle Corporation 2001.  All Rights Reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clstus.msg
/ DESCRIPTION
/   Message file for modules common to Cluster Ready Services
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   gdyoung     08/22/03  - gdyoung_3081231 
/   gdyoung     08/21/03  - renaming from CLS to CLST
/   gdyoung     08/12/03  - gdyoung_messages 
/   gdyoung     08/12/03  - errors_us review comments 
/   gdyoung     08/06/03  - crsuser messages 
/   gdyoung     08/06/03  - review comments 
/   gdyoung     08/01/03  - Created
/
/ Message number ranges:
/   1xxx: clscfg informational messages
/   2xxx: clscfg error messages
/
/ Messages 1xxx: clscfg informational messages
/
/ Message sub-ranges: 1xxx
/   11xx: initial install messages (cluster and non-cluster install)
/   12xx: node addition messages
/   13xx: node deletion messages
/   14xx: Cluster Synchronization Service messages
/   15xx: Oracle Cluster Repository messages
/   16xx: Oracle Event Monitor messages
/   17xx: Cluster Ready Services Daemon messages
/   19xx: general services messages
/
/ Messages 2xxx: clscfg error messages
/
/ Message sub-ranges: 2xxx
/   21xx: initial install messages (cluster and non-cluster install)
/   22xx: node addition messages
/   23xx: node deletion messages
/   24xx: Cluster Synchronization Service messages
/   25xx: Oracle Cluster Repository messages
/   26xx: Oracle Event Monitor messages
/   27xx: Cluster Ready Services Daemon messages
/   29xx: general services messages
/
/ Messages 31xx: crsuser informational messages
/
/ Messages 32xx: crsuser error messages
/
1101, 0, "assigning default private interconnect name %s for node %s"
// *Cause:  A private interconnect name was not specified. The node name
//          was used as a default instead.
// *Action: Verify that the node name refers to IP addresses on the
//          private interconnect. Using a non-private network can cause
//          performance and stability issues.
1102, 0, "assigning default host name %s for node %s"
// *Cause:  A host name for the node was not specified. The node name was
//          used as a default instead.
// *Action: If the node name is not equal to the host name, the host
//          name must be supplied to clscfg. Failure to do so will cause
//          the Cluster Ready Services daemons not to function.
1103, 0, "existing configuration version (%s) detected"
// *Cause:  An existing configuration was detected. 
// *Action: Informational message only. No action is required. 
//          clscfg will not modify the existing configuration
//          unless explicitly requested with the -force flag.
1104, 0, "successfully determined required configuration for all components"
// *Cause:  clscfg was able to determine the proper configuration requirements.
// *Action: Informational message only. No action is required. 
//          clscfg will attempt to write the configuration next.
1105, 0, "An existing configuration was detected. It was not overwritten."
// *Cause:  An existing configuration was detected, and clscfg chose not to 
//          overwrite it. 
// *Action: This message may be ignored if it is seen as part of starting
//          any node other than the first one. The -force option can be
//          used to override this decision, but if it is used when there are
//          active cluster members, failure CLSS-0101 and data integrity
//          issues are likely.
/
1301, 0, "successfully deleted %s of %s configuration values"
// *Cause:  clscfg completed a portion of the delete operation.
// *Action: Informational message only. No action is required. 
//          If some of the values were not deleted, another
//          error message should be visible with more information.
1302, 0, "successfully deleted %s of %s configuration keys"
// *Cause:  clscfg completed a portion of the delete operation.
// *Action: Informational message only. No action is required. 
//          If some of the keys were not deleted, another
//          error message should be visible with more information.
1303, 0, "successfully rolled back delete operation"
// *Cause:  The delete node operation failed, but the configuration was
//          properly restored to its original state.
// *Action: Informational message only. No action is required.
1304, 0, "node deletion successful"
// *Cause:  The delete node operation succeeded.
// *Action: Informational message only. No action is required.
/
1401, 0, "formatting voting device: %s"
// *Cause:  clscfg started formatting the voting device.
// *Action: Informational message only. No action is required.
/
1501, 0, "tried to delete key %s but it was not there"
// *Cause:  clscfg attempted to delete a key as part of a delete operation,
//          but it had already been deleted.
// *Action: Informational message only. No action is required. 
//          This might be an indication of corrupted configuration, 
//          or a previous delete operation that did not complete.
/
1901, 0, "configuring TCP ports %s, %s, %s, and %s"
// *Cause:  The specified ports were configured for use with the Cluster
//          Ready Services Daemons.
// *Action: Informational message only. No action is required. 
//          To change the ports used, specify 4 alternate 
//          ports with "-t". Example: -t 1001,1002,1003,1004
1902, 0, "configuring node: node number %s, node name %s"
// *Cause:  This node configuration was requested.
// *Action: Informational message only. No action is required. To alter 
//          the list of nodes re-run the install and specify a different 
//          set of nodes, or make use of the add and delete node install 
//          options after the current install is complete.
1903, 0, "configuring node: host name %s, private interconnect name %s"
// *Cause:  This node configuration was requested.
// *Action: Informational message only. No action is required. To alter 
//          the list of nodes re-run the install and specify a different 
//          set of nodes, or make use of the add and delete node install 
//          options after the current install is complete.
1904, 0, "creating configuration with user (%s) and group (%s)"
// *Cause:  The configuration was set up with the specified user and group.
// *Action: Informational message only. No action is required. Some 
//          configuration information will only be accessible to members 
//          of the specified group.
//          Note: On Windows platforms the group may be blank.
1999, 0, "Warning: -force specified. Overwriting existing configuration."
// *Cause:  The -force parameter was supplied.
// *Action: The -force parameter will cause clscfg to overwrite the existing
//          configuration. If used while a Cluster Ready Services cluster
//          is actively running, this can cause instability and data
//          integrity exposures.
/
/ Messages 2xxx: clscfg error messages
/
/ Message sub-ranges: 2xxx
/   21xx: initial install messages (cluster and non-cluster install)
/   22xx: node addition messages
/   23xx: node deletion messages
/   24xx: Cluster Synchronization Service messages
/   25xx: Oracle Cluster Repository messages
/   26xx: Oracle Event Monitor messages
/   27xx: Cluster Ready Services Daemon messages
/   29xx: general services messages
/
2101, 1, "Too many nodes were specified. limit is %s"
// *Cause:  Too many nodes were specified on command line.
// *Action: Retry the operation with a smaller number of simultaneous
//          changes.
2102, 1, "Node %s specified is out of range. Maximum node number is %s."
// *Cause:  A node was specified with node number out of range.
// *Action: Retry the operation with a smaller node number.
2103, 1, "Unable to parse TCP port options specified."
// *Cause:  Arguments to the -t flag were not valid port numbers, or
//          some number other than 4 ports were supplied.
// *Action: Correct the arguments to the -t flag and rerun the operation.
2104, 1, "TCP port %s is out of bounds."
// *Cause:  The TCP port specified was not a valid port number.
// *Action: Specify an another port. Usually TCP ports need to be between
//          1001 and 65,535.
2105, 1, "missing required parameter -l with language ID information"
// *Cause:  The -l parameter was required for the requested operation.
// *Action: Supply the -l parameter with the proper language ID.
2106, 1, "missing required parameter -o with path to ORA_CRS_HOME"
// *Cause:  The -o parameter was required for the requested operation.
// *Action: Supply the -o parameter with the proper path.
2107, 1, "failure configuring component %s"
// *Cause:  The Oracle Cluster Repository configuration for the specified
//          component was unsuccessful.
// *Action: Look for other error information and contact Oracle support.
2108, 1, "missing required parameter -q with path to the voting device"
// *Cause:  The -q parameter was required for the requested operation.
// *Action: Supply the -q parameter with a valid path for the voting
//          device. 
2109, 1, "missing required parameter -c with a cluster name"
// *Cause:  The -c parameter was required for the requested operation.
// *Action: Supply the -c parameter with a name for the cluster.
2110, 1, "missing required parameter -nn with the list of nodenames"
// *Cause:  The -nn parameter was required for the requested operation.
// *Action: Supply a list of node names with the format:
//          nodenameA,nodenumA,nodenameB,nodenumB,...
/
2201, 1, "node %s already exists in the configuration with node number %s"
// *Cause:  A node name specified for the add node operation conflicted with
//          the existing configuration.
// *Action: Choose an alternate node to add to the cluster, or give the
//          new node a unique name, or delete the previous node, then retry.
2202, 1, "private interconnect name %s is already assigned to node number %s"
// *Cause:  The private interconnect name specified for the add node operation
//          conflicted with the existing configuration.
// *Action: Choose an alternate node to add to the cluster, or give the
//          new node a unique name, or delete the previous node, then retry.
2203, 1, "Host name %s is already assigned to node number %s."
// *Cause:  The host name specified for the add node operation conflicted
//          with the existing configuration.
// *Action: Choose an alternate node to add to the cluster, or give the
//          new node a unique name, or delete the previous node, then retry.
2204, 1, "Node number %s is already assigned to node %s."
// *Cause:  The node number specified for the add node operation conflicted
//          with the existing configuration.
// *Action: Chose an alternate node to add to the cluster, or give the
//          new node a unique node number, or delete the previous node,
//          then retry.
/
2301, 1, "failure %s validating configuration of node %s"
// *Cause:  clscfg was unable to validate existing configuration of the 
//          specified node. 
// *Action: Validate the integrity of the Cluster Ready Services install
//          on the local node, or choose another node to delete.
2302, 1, "failure %s validating configuration of private interconnect name %s"
// *Cause:  clscfg was unable to validate existing configuration of the 
//          specified node. 
// *Action: Validate the integrity of the Cluster Ready Services install
//          on the local node, or choose another node to delete.
2303, 1, "failure %s validating configuration of node with host name %s"
// *Cause:  clscfg was unable to validate existing configuration of the 
//          specified node. 
// *Action: Validate the integrity of the Cluster Ready Services install
//          on the local node, or choose another node to delete.
2304, 1, "node name %s for node %s does not match existing node name %s"
// *Cause:  The node name specified in a delete operation did not match
//          the existing configuration.
// *Action: Specify the correct information describing the node you intend
//          to delete, then retry.
2305, 1, "node number %s for node %s does not match existing node number %s"
// *Cause:  The node number specified in a delete operation did not match
//          the existing configuration.
// *Action: Specify the correct information describing the node you intend
//          to delete, then retry.
2306, 1, "private interconnect name %s for node %s does not match %s"
// *Cause:  The private interconnect name specified in a delete operation did 
//          not match the existing configuration.
// *Action: Specify the correct information describing the node you intend
//          to delete, then retry.
2307, 1, "host name %s for node %s does not match existing host name %s"
// *Cause:  The host name specified in a delete operation did not match 
//          the existing configuration.
// *Action: Specify the correct information describing the node you intend
//          to delete, then retry.
2308, 1, "concurrent node deletion suspected when deleting key %s"
// *Cause:  A key being deleted by the current operation was deleted by
//          another process during the small amount of time between opening
//          it for deletion and actually deleting it. An attempt to execute
//          multiple separate delete operations may have occurred, and may 
//          have corrupted the configuration.
// *Action: Verify the integrity of the Oracle Cluster Repository, and
//          restore from backup if necessary. If only one clscfg process
//          was active on the cluster this may be ignored.
2309, 1, "failure updating the configuration in node deletion"
// *Cause:  clscfg was unable to modify the existing configuration for node
//          deletion. The existing configuration was probably not harmed.
// *Action: Verify the integrity of the Cluster Ready Services install
//          on the local node, and retry.
2310, 1, "CSS daemon refused node deletion, status %s. attempting rollback"
// *Cause:  Cluster Synchronization Services daemon refused the node deletion.
// *Action: One or more of the designated nodes may still be active. clscfg
//          will now attempt to roll back the deletion process. The Cluster
//          Ready Services daemons must be shut down on a node before any
//          attempt to remove them from the configuration. More information
//          on why the attempt was refused may be available in the Cluster
//          Synchronization Service logfile.
2311, 1, "failure rolling back node deletion. configuration irrecoverable"
// *Cause:  clscfg attempted to roll back the deletion process after a
//          failure and was unable to do so. Configuration was partially
//          deleted and left in an inconsistent state.
// *Action: Shut down the cluster and restore the Oracle Cluster Repository 
//          from backup.
2312, 1, "failed to completely delete node configuration"
// *Cause:  The node deletion was mostly successful, and should be functional
//          in this state. Some portions of the configuration were not
//          successfully deleted.
// *Action: This can be ignored. The safer choice is to restore the Oracle
//          Cluster Repository from backup, and attempt the delete again.
//          Adding any of the deleted nodes back to the configuration in the
//          future may fail if this is ignored.
/
2401, 1, "failure %s querying maximum configurable node number"
// *Cause:  clscfg was unable to determine the legitimate range of node 
//          numbers.
// *Action: Verify the integrity of the Cluster Ready Services install
//          on the local node.
2402, 1, "failure %s querying existing configured node list"
// *Cause:  clscfg was unable to retrieve the list of currently configured
//          nodes.
// *Action: Verify the integrity of the Cluster Ready Services install
//          on the local node.
2403, 1, "failure %s querying the maximum node name size"
// *Cause:  clscfg was unable to determine the size of the largest node name.
// *Action: Verify the integrity of the Cluster Ready Services install
//          on the local node.
2404, 1, "failure %s querying the cluster name"
// *Cause:  clscfg was unable to determine the existing cluster name.
// *Action: Verify the integrity of the Cluster Ready Services install
//          on the local node.
2405, 1, "failure formatting voting device (%s) at [%s] [%s] [%s]"
// *Cause:  clscfg failed to format the voting device.
// *Action: Verify the path and permissions set on the voting device.
/
2501, 1, "failure %s opening configuration for write operation"
// *Cause:  clscfg was attempting to open the current configuration
//          for write access.
// *Action: Verify the integrity of the Oracle Cluster Repository.
//          Shut down the cluster and restore OCR from backup if necessary.
2502, 1, "failure %s writing new configuration"
// *Cause:  clscfg was attempting to write new configuration data.
// *Action: Verify the integrity of the Oracle Cluster Repository.
//          Shut down the cluster and restore OCR from backup if necessary.
2503, 1, "failure %s opening configuration for delete operation"
// *Cause:  clscfg received an error while attempting to delete
//          part of the existing configuration.
// *Action: Verify the integrity of the Oracle Cluster Repository.
//          Shut down the cluster and restore OCR from backup if necessary.
2504, 1, "failure %s writing configuration to disk"
// *Cause:  clscfg received a failure writing information to the Oracle
//          Cluster Repository.
// *Action: Verify the settings for the Oracle Cluster Repository and retry.
/
2901, 1, "The number of Oracle Cluster Repository keys exceeds limit of %s."
// *Cause:  clscfg ran out of internal space for keys during install.
// *Action: Re-run the install and specify a smaller list of nodes.
//          When that completes, use the add node option to add the
//          remaining nodes.
2902, 1, "The number of Oracle Cluster Repository keys exceeds limit of %s."
// *Cause:  clscfg ran out of internal space for keys during delete node.
// *Action: Re-run the delete node operation and delete fewer nodes at once.
2903, 1, "unable to allocate %s bytes of memory at location: %s"
// *Cause:  clscfg was unable to allocate enough memory to service the
//          request.
// *Action: Ensure that the specified amount of memory will be available
//          and retry the operation.
2904, 1, "failure %s in SCLS API at %s"
// *Cause:  clscfg was unable to query for information about the system
//          setup.
// *Action: Contact Oracle support with the additional information
//          printed just after this message.
2905, 1, "add, install, delete, concepts, and local are mutually exclusive"
// *Cause:  clscfg was run with two different mode flags. All mode flags are
//          mutually exclusive.
// *Action: Correct the command line and try again.
2906, 1, "Clustername should be between 1 and %s letters."
// *Cause:  cluster name supplied with -c argument was the wrong size.
// *Action: Supply an alternate cluster name of an appropriate length.
2907, 1, "unknown parameter %s supplied"
// *Cause:  An unknown parameter was passed to clscfg.
// *Action: Use "clscfg -help" or "clscfg -concepts" for more information.
2908, 1, "unable to determine local hostname"
// *Cause:  clscfg was unable to determine the local hostname.
// *Action: Verify the operating system host name configuration.
2909, 1, "The requested operation requires High Availability privileges."
// *Cause:  The current user did not have High Availability privileges.
// *Action: Log in as a different user and retry the operation.
2910, 1, "Failure %s contacting the CRS daemon."
// *Cause:  clscfg was unable to communicate with the CRS daemon.
// *Action: The requested operation must be performed from an active cluster
//          node. Validate the pre-existing installation on the local
//          machine, or perform the operation from another node.
2911, 1, "failure %s contacting the CSS daemon"
// *Cause:  clscfg was unable to communicate with the CSS daemon.
// *Action: The requested operation must be performed from an active cluster
//          node. Validate the pre-existing installation on the local
//          machine, or perform the operation from another node.
2999, 1, "Untranslated failure: [%s] [%s] [%s] [%s] [%s] [%s]"
// *Cause:  A failure with no translation occurred.
// *Action: Contact Oracle Customer Support for more information.
/
/ Messages 31xx: crsuser informational messages
/
/ Message sub-ranges: 31xx
/   31xx: crsuser informational messages
/
3100, 0, "See the documentation for usage information."
// *Cause:  Incorrect or insufficient arguments were passed to crsuser.
// *Action: Read documentation for instructions on how to use this tool.
3101, 0, "Enter the password for user %s."
// *Cause:  crsuser requires the password to register the user.
// *Action: Enter the requested password.
3102, 0, "Operation successful."
// *Cause:  The operation succeeded.
// *Action: None
/
/ Messages 32xx: crsuser error messages
/
/ Message sub-ranges: 32xx
/   32xx: crsuser error messages
/
3200, 1, "internal error: [%s] [%s] [%s] [%s] [%s]"
// *Cause:  A failure with no translation occurred.
// *Action: Contact Oracle Customer support for more information.
3201, 1, "unexpected argument: %s"
// *Cause:  crsuser failed to parse the arguments, or an unknown argument
//          was passed.
// *Action: Supply the correct arguments and try again.
3202, 1, "Memory allocation failure for %s bytes."
// *Cause:  crsuser was unable to allocate memory.
// *Action: Free up some system memory and try again.
3203, 1, "insufficient privileges for action: %s"
// *Cause:  The current user did not have sufficient privileges.
// *Action: Log in as another user and try again.
/
