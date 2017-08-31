/ Copyright (c) Oracle Corporation 2001.  All Rights Reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clssus.msg
/ DESCRIPTION
/   Message file for Oracle Cluster Synchronization Services
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   gdyoung     08/12/03  - errors_us review comments 
/   gdyoung     08/07/03  - random fixups 
/   gdyoung     08/06/03  - review comments 
/   gdyoung     08/04/03  - A few additional common configuration errors 
/   gdyoung     06/19/02  - additional initialization errors
/   jleys       12/03/01  - Merged jleys_css_messages
/   jleys       11/29/01  - Created
/
/ Message number ranges:
/   0xxx: Initialization errors
/   1xxx: Vendor        related messages
/   2xxx: Node monitor  related messages
/   3xxx: Group Manager related messages
/
/
/ Messages 0xxx: Initialization errors
/
/ Message sub-ranges: 0xxx
/   00xx: Errors only encountered before logging is active
/   01xx: Common        initialization errors
/   02xx: Node Monitor  initialization errors
/   03xx: Group manager initialization errors
/
0001,  1, "skgxn not active"
// *Cause:  The skgxn service is required, but is not active
// *Action: Verify that the clusterware skgxn is active and restart it if 
//          necessary
0002,  1, "unable to determine local node number. type %s"
// *Cause:  Either the skgxn service is unavailable, or the OCR configuration
//          is incomplete/inaccurate.
// *Action: Verify that the clusterware skgxn is active and restart it if
//          necessary. Additionally validate that the clusterware installation
//          was successful, and that the local node was entered in the node
//          listings.
//
0003,  1, "unable to determine cluster name. type %s"
// *Cause:  Name of the cluster cannot be determined from configuration.
// *Action: Verify that the clusterware installation was successful and
//          that the OCR registry is available.
0004,  1, "unable to allocate memory resources"
// *Cause:  Memory allocation routines failed.
// *Action: Validate that the system has sufficient memory resources to use
//          the product.
0099,  1, "logfile open failed for %s, err %s"
// *Cause:  The log file could not be opened, with error type err
// *Action: Verify that the log directory specified during installation exists
//          and that the ocssd executable has permission to create a file
//          in that directory
0100,  1, "configuration data access failed for key %s"
// *Cause:  Access of the configuration data indicated by key failed with 
//          error code error
// *Action: Verify that the clusterware installation was successful and 
//          that the OCR registry is accessible
0101,  1, "Oracle Cluster Repository mismatch with node %s. (%s != %s)"
// *Cause:  A remote node is accessing a different set of configuration.
//          This situation can be caused by attempting to reinstall while 
//          there are active cluster nodes.
// *Action: Verify that the local and remote nodes are accessing the same
//          Oracle Cluster Repository.
0102,  1, "initialization failure: [%s] [%s] [%s] [%s] [%s] [%s]"
// *Cause:  A general initialization failure occurred.
// *Action: Contact Oracle Customer Service for more information.
0103,  1, "unable to read configuration information for node %s"
// *Cause:  Incomplete configuration information for the specified node
//          was found.
// *Action: Validate the integrity of the Oracle Cluster Repository,
//          restoring it from backup if necessary.
0200,  1, "local node %s not listed in configuration"
// *Cause:  The OCR configuration information does not list this node as a 
//          member of the cluster
// *Action: Verify that the clusterware installation was successful and 
//          that the node has not been added since installation
/
/
/ Messages 1xxx: Vendor related messages
/
/ Message sub-ranges: 1xxx
/   1000-1199: Vendor status
/   1200-1999: Vendor errors
/
1200,  1, "skgxn errror: category %s, operation %s, loc %s"
// *Cause:  The skgxn service encountered an error, the information in the
//          error message is vendor supplied diagnostic information
// *Action: Report this error to the vendor who supplied the skgxn
/
/
/ Messages 2xxx: Node monitor related messages
/
/ Message sub-ranges: 1xxx
/   2000-2199: Node monitor status
/   2200-2999: Node monitor errors
/
2000,  1, "reconfiguration successful, incarnation %s with %s nodes"
// *Cause:  A rconfiguration has completed successfully
// *Action: None
2001,  1, "local node number %s, master node number %s"
// *Cause:  Informational message regarding this incarnation
// *Action: None
2200,  1, "Received node deletion request for active node %s."
// *Cause:  User attempted to delete a node from the configuration
//          before shutting it down.
// *Action: Shut down the specified node and retry the node deletion.
2201,  1, "endpoint already in use: %s"
// *Cause:  The specified endpoint is already in use. Another process is using
//          the endpoint.
// *Action: Shut down the other process, and retry the startup attempt.
2202,  1, "voting device access took an excessive amount of time. (%s sec)"
// *Cause:  A read or write to the voting device took an unacceptable 
//          amount of time.
// *Action: Contact the disk hardware vendor for information on improving
//          the availability of the disk.
2203,  1, "unable to access voting device: %s"
// *Cause:  The CSS daemon received a failure using the voting device.
// *Action: Examine the permissions on the voting device. If this failure 
//          occurred later than boot time, then access to the voting device
//          was lost.
2204,  1, "voting device not configured. [%s] [%s]"
// *Cause:  A voting device was not supplied during configuration.
// *Action: The voting device assists in ensuring data integrity and is
//          required by the CSS daemon. Configure a voting device and
//          restart the cluster.
2205,  1, "remote node %s signaled our eviction via voting device: cause %s"
// *Cause:  A remote node of the cluster evicted the local node due to
//          network failure or due to software failure in the local CSS daemon.
// *Action: Verify the stability of the private network between the local
//          node and the specified remote node.
2206,  1, "local node evicted by vendor node monitor"
// *Cause:  The Operating System vendor's node monitor evicted the local node.
// *Action: Examine the vendor node monitor's logs for relevant information.
2207,  1, "error %s getting status from vendor node monitor"
// *Cause:  The CSS daemon received a failure interacting with the vendor node 
//          monitor. The local node may have been evicted or the vendor node 
//          monitor may have been shut down.
// *Action: Examine the vendor node monitor's logs for relevant information.
/
/
/
/ Messages 2xxx: Group Manager related messages
/
/ Message sub-ranges: 3xxx
/   3000-3199: Node monitor status
/   3200-3999: Node monitor errors
/
3000,  1, "reconfiguration successful, incarnation %s with %s nodes"
// *Cause:  A rconfiguration has completed successfully
// *Action: None
3001,  1, "local node number %s, master node number %s"
// *Cause:  Informational message regarding this incarnation
// *Action: None
3200,  1, "timed out waiting on nested reconfiguration"
// *Cause:  The current reconfiguration hung. A network failure may have \
//          occurred.
// *Action: The local node will terminate itself to cause remote nodes to  
//          enter a nested reconfiguration. This may allow the cluster to  
//          continue operation.
3201,  1, "An attempt to begin a nested reconfiguration failed."
// *Cause:  unable to cancel previous reconfiguration to begin a new one
// *Action: None.
3202,  1, "out of sync with master: [%s] [%s] [%s] [%s]"
// *Cause:  Consistency checks between the local node and the master failed.
// *Action: The local daemon will terminate itself to ensure that the surviving
//          cluster is all properly coordinated.
/
