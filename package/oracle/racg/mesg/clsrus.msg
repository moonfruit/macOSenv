/ Copyright (c) Oracle Corporation 2001.  All Rights Reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clsrus.msg
/ DESCRIPTION
/   Message file for Oracle Real Application Clusters HA (RACHA), Release 9.0.1.0.0 Production
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   csimmons    01/28/04 - Add parameters to error message 6502 
/   gchen       02/12/03 - Add error message for ocr ops
/   gchen       01/23/03 - Add Error for prsr_fetch_db_config
/   sltam       08/14/02 - Better message for 00004
/   sltam       08/05/02 - Add read/write file error message
/   sltam       06/21/02 - 
/   sltam       06/13/02  - 
/   sltam       11/02/01  - Add message 6507
/   sltam       10/25/01  - Modified message after review
/   ilam        10/17/01  - Update with more error msg
/   dsemler     08/06/01  - Created from avus.msg
/
/ Message number ranges:
/   0xxx: Generic
/   05xx: Common Library
/   1xxx: Database management module
/   2xxx: 
/   3xxx: 
/   4xxx: 
/   5xxx: 
/   6xxx: Instance Monitor
/   65xx: Service Name module
/   7xxx: 
/   8xxx: 
/   9xxx: 
/  10xxx: 
/
/
/ Generic: 0xxx
/
00001, 00000, "Oracle error %d encountered"
// *Cause:   Oracle-related error is encountered.
// *Action:  Check alert log and trace file for more detail.
00002, 00000, "Oracle error encountered while executing %s"
// *Cause:   Oracle-related error is encountered while executing a request.
// *Action:  Check alert log for more detail.
00003, 00000, "ORACLE_HOME environment variable not set"
// *Cause: ORACLE_HOME environment variable is not set.
// *Action:  Make sure that the ORACLE_HOME environment variable has been
//           properly set and exported.
00004, 00000, "Error encountered at %s, category=%d, operation=%s, OS error=%d" 
// *Cause:   Operating system error occurred.
// *Action:  Check for the error message for more detail.
00005, 00000, "Error encountered during memory allocation"
// *Cause:   System memory is insufficient.
// *Action:  Check the availability of memory in the system before retrying.
00006, 00000, "Error encountered when writing file %s"
// *Cause:   Error when writing file.
// *Action:  Check the permission of the file and the existence of its path.
00007, 00000, "Error encountered when reading file %s"
// *Cause:   Error when reading file.
// *Action:  Check the permission and existence of the file.
/
/ Common Library: 05xx
/
00501, 00000, "Error %d encountered when connecting to EVM daemon"
// *Cause:   Error encountered when connecting to EVM daemon.
// *Action:  Check status of EVM daemon and log file for detail.
00502, 00000, "Error %d encountered when subscribing an EVM event"
// *Cause:   Error encountered when subscribing an EVM event.
// *Action:  Contact customer support.
00503, 00000, "Error %d encountered when creating an EVM event"
// *Cause:   Error encountered when creating an EVM event.
// *Action:  Contact customer support.
00504, 00000, "Error %d encountered when posting an EVM event"
// *Cause:   Error encountered when posting an EVM event.
// *Action:  Contact customer support.
00505, 00000, "Empty event type is specified"
// *Cause:  Empty event type is specified.
// *Action: Try again with a valid event type.
00506, 00000, "Unmatched resource name prefix %s is specified"
// *Cause:   Specified resource name prefix does not match as required.
// *Action:  Try again with a valid resource name prefix.
00507, 00000, "The length of the facility name %s exceeds the limit (%d)"
// *Cause:   The given facility name is too long.
// *Action:  Try again with a short facility name.
00508, 00000, "Invalid message number %d"
// *Cause:   An incorrect message number is specified.
// *Action:  Try again with a correct message number.
00509, 00000, "Unable to initialize NLS"
// *Cause:   Failed to initialize callback structure for NLS.
// *Action:  Contact customer support.
00510, 00000, "Unable to load NLS data"
// *Cause:   Failed to initialize NLS data loading.
// *Action:  Not action required as default data loading will be used.
00511, 00000, "Error %d encountered when handling incoming EVM message"
// *Cause:   Error encountered when handling incoming EVM message.
// *Action:  Check log file for detail.
00512, 00000, "Invalid CAA trigger event type [%s]"
// *Cause:   Invalid CAA trigger event type is specified.
// *Action:  Try again with a valid type.
00513, 00000, "Message file is not found"
// *Cause:   The requested OCI message file is not found.
// *Action:  Check if the message file is properly installed.
00514, 00000, "Unable to locate PMON [pid=%s]"
// *Cause:   Cannot find PMON with this pid.
// *Action:  Check the existence of PMON.
00515, 00000, "A service member is already running on this node"
// *Cause:   There is a service member of the same service running on this node.
// *Action:  No action required as the service member will try to start 
//           on another node.
00516, 00000, "No service provider found at this node"
// *Cause:   No suitable service provider is found on this node.
// *Action:  No action required as the service member will try to start on another node.
00517, 00000, "Failed to register a service name"
// *Cause:   The requested service name cannot be registered. 
// *Action:  Check log file for detail.
00518, 00000, "Failed to register a preconnect service name"
// *Cause:   The requested preconnect service name cannot be registered.
// *Action:  Check log file for detail.
00519, 00000, "No instance found"
// *Cause:    No instance is found running for the database resource.
// *Action:   No action required as the database resource will fail itself.
00520, 00000, "No service member found"
// *Cause:    No service member is found running for the composite service resource.
// *Action:   No action required as the composite service resource will fail itself.
00521, 00000, "Event %s is rejected by EVM daemon"
// *Cause:   No template has been registered for the event or 
//           caller is not authorized to post the event.
// *Action:  Check if there is a template registered for this event and
//           the authority of posting this event.
00522, 00000, "Resource %s is not registered"
// *Cause:   CRS resource is not registered.
// *Action:  Register the CRS resource.
00523, 00000, "Resource %s is not enabled"
// *Cause:   CRS resource is not enabled.
// *Action:  Enable the CRS resource.
00524, 00000, "Resource %s is stopping, resource %s cannot start"
// *Cause:   Resource cannot start because its composite resource is stopping.
// *Action:  Retry to start the resource when its composite resource is not stopping.
00525, 00000, "prsr initialization failed"
// *Cause:   See the related error message.
// *Action:  Run crs_stat to make sure CSS and OCR working properly.
00526, 00000, "Failed to retrieve database configuration in OCR"
// *Cause:   See the related error message.
// *Action:  Run crs_stat to make sure CSS and OCR working properly and database configuration in ocr is initialized. 
00527, 00000, "OCR operation failed"
// *Cause:   See related error messages about the OCR operation.
// *Action:  Fix the related error. Then try again.
00528, 00000, "RACGONS: host and port number already configured in OCR"
// *Cause:   host and port number already configured in OCR.
// *Action:  None.
00529, 00000, "RACGONS: host and port number to be removed does not exist"
// *Cause:   host and port number to be removed is not configured in OCR.
// *Action:  None.
00530, 00000, "Can not get user name"
// *Cause:   Error caused by OSD layer.
// *Action:  Contact Oracle support.
00531, 00000, "Can not get primary group name"
// *Cause:   There is no primary group for this OS.
// *Action:  Not faital. None.
/
/ Database management module : 1xxx
/
01001, 00000, "Unsupported open mode %d is specified"
// *Cause:   Unsupported open mode is specified for mounting database.
// *Action:  Retry again with a valid open mode.
01002, 00000, "Unable to process instance startup"
// *Cause:   ORACLE_HOME environment variable not set.
// *Action:  Make sure that the ORACLE_HOME environment variable has been
//           properly set and exported.
01003, 00000, "Error %d encountered during mounting database"
// *Cause:   Unexpected error occurs when mounting database.
// *Action:  Check current status of database before retrying.
01004, 00000, "Failed to mount database"
// *Cause:   Database cannot be mounted by an instance.
// *Action:  Check alert log for error detail.
01005, 00000, "Error %d encountered during altering database open mode"
// *Cause:   Unexpected error occurs when altering database open mode.
// *Action:  Check current database status.
01006, 00000, "Unable to process instance shutdown"
// *Cause:   ORACLE_HOME environment variable not set.
// *Action:  Make sure that the ORACLE_HOME environment variable has been
//           properly set and exported.
01007, 00000, "Connection to database was not established"
// *Cause:   Connection to database is failed to establish.
// *Action:  Make sure connection and environment are properly set up.
01008, 00000, "Error %d encountered during querying for PMON status"
// *Cause:   Unexpected error encountered when querying v$process for PMON.
// *Action:  Check alert log and connection to database.
01009, 00000, "database management module failed to start"
// *Cause:   Error encountered during initializing database management module.
// *Action:  Check previous error message for detail.
01010, 00000, "Unable to record PMON pid to %s"
// *Cause:   Failed to write os pid for PMON to file.
// *Action:  Check file system for disk space and access privilege.
01011, 00000, "Invalid instance startup mode [%s] is specified"
// *Cause:   Invalid startup mode is specified.
// *Action:  Retry again with a valid startup mode.
01012, 00000, "Invalid instance stop mode [%s] is specified"
// *Cause:   Invalid stop mode is specified.
// *Action:  Retry again with a vaild stop mode.

/
/ Main Layer - Internal Library: 2xxx
/
/
/ OSD Layer - Cluster Library: 3xxx
/
/
/ Pack Layer - Run/halt Methods: 4xxx
/
/
/ PFSCTL Command Line: 5xxx
/
/
/ Instance Monitor: 6xxx
/
/
/ Service name module: 65xx
/
06500, 00000, "Invalid input arguments"
// *Cause:   Invalid input arguments are specified.
// *Action:  Retry again with a valid argument.
06501, 00000, "Exceeds maximum number of arguments"
// *Cause:   Too many input arguments are specified.
// *Action:  Retry again with correct number of arguments.
06502, 00000, "Failed to connect to database '%s' as user '%s'"
// *Cause:   Failed to connect to database.
// *Action:  Check database and log file for details.
06503, 00000, "Service name already registered"
// *Cause:  Requested service name has been registered by another service.
// *Action: Choose another service name and retry registration again.
06504, 00000, "Service name not in SERVICE_NAMES"
// *Cause:  Requested service name is not registered.
// *Action: Make sure the correct service name is specified in the request.
06505, 00000, "SERVICE_NAMES found null and fixed"
// *Cause:  SERVICE_NAMES parameter becomes null after the delete operation.
// *Action: Not action required as SERVICE_NAMES is set to default value.
06506, 00000, "Error %d encountered when executing %s"
// *Cause:   Error occurred when executing the SQL statement.
// *Action:  Check alert log for more detail.
06507, 00000, "Cannot add to SERVICE_NAMES, SERVICE_NAMES will be too long"
// *Cause:   Adding the service name will exceed the limit of SERVICE_NAMES.
// *Action:  Change the configuration to avoid SERVICE_NAMES becomes too long.
/
/ Listener Monitor: 7xxx
/
/
/ Heartbeat Monitor: 8xxx
/
/
/ Internal Real Application Clusters Guard process and role change 
/ notification: 9xxx
/
/
/ PFSSETUP: 10xxx
/
