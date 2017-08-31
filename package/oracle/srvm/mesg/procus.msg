# CHARACTER_SET_NAME=American_America.US7ASCII
/ Copyright (c) Oracle Corporation 1999, 2001.  All rights reserved.
/
/ NAME
/   procus.msg
/ DESCRIPTION
/   Generic error messages for Oracle Cluster Registry (OCR)
/ NOTES
/   Language      : American
/   Character set : US7ASCII
/   WARNING: A single message in this table should NOT exceed 75 characters
/            If it does the message will be TRUNCATED.
/
/            If a message number is added or delete from this file, proclus.msg
/            must be modified accordingly.
/            Please do not fill holes in the message numbers because the
/            unused message numbers might be used by OLR messages in proclus.msg
/   NOTE TO TRANSLATOR:
/            These OCR messages should be translated almost identical
/            to the corresponding OLR messages in proclus.msg.
/
/ RANGE
/   00001 - 00046 : OCR
/
/   00101 - 00109 : OCR Component Errors
/
/   00201 - 00208 : OCR Permission Errors
/ 
/ OWNER
/
/ MODIFIED
/     sbezawad   06/02/09 - Add PROCR_UPGRADING_FORMAT
/     samjo      05/28/09 - Fix Action.
/     samjo      10/28/08 - Add PROCR_CLSCRS_ERROR message
/     sbezawad   12/10/08 - Add PROCR_BATCH_EMPTY
/     sbezawad   12/01/08 - Change 107
/     sbezawad   09/18/08 - Add PROCR_CLSI_ERROR
/     samjo      03/05/08 - Change 201
/     kelee      03/21/07 - Modify for 5-way mirroring
/     samjo      01/16/07 - Add PROCR_INVALID_CONFIG
/     samjo      11/20/06 - Add PROCR_NO_MORE_OPERATIONS
/     spommere   10/30/06 - add PROCR_INVALID_BLOCKNUM, PROCR_INVALID_BLOCKHDR
/     kelee      07/24/06 - Add warning 
/     samjo      04/27/05  - 
/     samjo      04/22/05  - Add PROCR_INVALID_STORAGE_TYPE 
/     kelee      01/10/05  - Adding message for no free space
/     samjo      10/14/04  - Adding message for invalid version 
/     samjo      06/28/04  - Adding suthentication messages 
/     surchatt   05/17/04  - adding new message for OCR error code 
/     samjo      05/12/04  - Add more info to component msgs 
/     surchatt   02/10/04  - adding a message which could not be added before 
/                            because message files were locked 
/     surchatt   07/21/03  - adding new message for error code
/     samjo      04/14/03  - Changing from repository to registry
/     samjo      02/12/03  - Adding component format strings
/     samjo      09/18/02  - Mesg files reviewed by doc
/     surchatt   08/28/02  - adding new message
/     samjo      08/15/02  - Fix msg
/     mhbauer    08/13/02  - edit messages
/     jtellez    08/12/02  - Message Improvements
/     surchatt   07/29/02  - adding new error message
/     samjo      07/23/02  - Adding new error messages.
/     samjo      06/11/02  - Adding message for PROCR_CURRENT_VERSION.
/     samjo      05/03/02  - Adding PROCR_SCLS_ERROR.
/     surchatt   03/23/02  - surchatt_ocr_message
/     samjo      03/21/02  - Creation
/
/
/ Message headers
/
/////////////////////////////////////////////////////////
/ Error message for ocr
/ Range from 1 - 47
/////////////////////////////////////////////////////////
/
0001,0, "Oracle Cluster Registry cannot be initialized."
// *Cause: An invalid init level was passed to initialize Oracle Cluster 
//         Registry.
// *Action: Initialize Oracle Cluster Registry with a valid init level.
/
0002,0, "Cannot perform cluster registry operation at the current init level."
// *Cause: Program tried a cluster registry operation which is not permitted 
//         at the init level.
// *Action: Initialize Oracle Cluster Registry with an appropriate init level.
/
0003,0, "Cannot perform cluster registry operation because context is invalid."
// *Cause: The Oracle Cluster Registry context passed was invalid.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0004,0, "The cluster registry key to be operated on does not exist."
// *Cause: Program tried a cluster registry operation on a key which does not
//         exist.
// *Action: Check to see if the key exists and try the operation again.
/
0005,0, "User does not have permission to perform a cluster registry operation on this key."
// *Cause: Program tried an operation on a cluster registry key for which it
//         does not have permission.
// *Action: Check to see if program is run as the correct user.
/
0006,0, "User does not have permission to perform a cluster registry operation on this key."
// *Cause: Program tried a cluster registry operation on a key for which it
//         does not have permission.
// *Action: Check to see if program is run as the correct user.
/
0007,0, "Cannot perform cluster registry operation because key or batch handle is invalid."
// *Cause: The cluster registry key or batch handle passed was invalid.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0008,0, "Cannot perform cluster registry operation because one of the parameters is invalid."
// *Cause: Program tried a cluster registry operation using an invalid
//         parameter.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0009,0, "Cannot perform cluster registry operation because the buffer passed is too small."
// *Cause: The amount of memory allocated for the buffer was insufficient.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0010,0, "Cannot delete the cluster registry key as subkeys exist."
// *Cause: The program tried to delete a key for which subkeys exist.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0011,0, "Cannot perform cluster registry operation because key is NULL."
// *Cause: The cluster registry key passed was NULL.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0012,0, "Out of heap memory."
// *Cause: The program ran out of heap memory.
// *Action: Contact Oracle Support Services.
/
0013,0, "Cannot perform cluster registry operation because one of the parameters is NULL."
// *Cause: Program tried a cluster registry operation using an NULL parameter.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0014,0, "Unknown error occurred"
// *Cause: This is generic internal error for Oracle Cluster Registry.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00015,0, "Failed to initialize the cluster registry"
// *Cause: The Oracle Cluster Registry could not be accessed. The
//         possible causes are:
//         1. The cluster registry has not been formatted. 
//         2. The cluster registry location is not accessible.
//         3. The cluster registry location has incorrect permissions.
//         4. Oracle Clusterware is not running.
// *Action: 
//         1. Run the 'ocrcheck' command to confirm that the OCR is
//            formatted and usable.
//         2. Run 'ocrcheck -config' command to retrieve the configured
//            locations, and verify that each location is accessible and
//            has the correct permissions via native platform or OS methods.
//            If a location is an ASM disk group, verify that the disk group
//            exists and is mounted.
//         3. Run 'crsctl check crs' command to verify that Oracle Clusterware
//            is running.
/
00016,0, "Cannot retrieve any more subkeys for the given keyhandle"
// *Cause: The key has no more subkeys to enumerate.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00017,0, "Unimplemented feature"
// *Cause: Requested feature has not been implemented in the current release.
// *Action: Try the feature again in the upcoming Oracle release.
/
00018,0, "The value size passed is too large"
// *Cause: Cannot set a value of the given size.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00019,0, "Cannot create more subkeys for the key"
// *Cause: An attempt was made to create more subkeys under a key that is not
//         permitted by the cluster registry.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00020,0, "ORACLE_HOME environment not set"
// *Cause: ORACLE_HOME environment not set.
// *Action: Make sure that the ORACLE_HOME environment variable has been
//          properly set and exported.
/
00021,0, "Maximum permitted depth of the OCR tree is reached"
// *Cause: An attempt was made to create subkeys under a key which is already 
//         at depth PROCR_MAX_KEY_DEPTH
// *Action: This is an internal error. Contact Oracle Support Services.
/
00022,0, "The OCR backend has an invalid format"
// *Cause: An attempt was made to use OCR before initializing it.
// *Action: Use the root.sh script. The 'ocrconfig -upgrade' command will 
//          initialize OCR.
/
00023,0, "Error in cluster services layer"
// *Cause: An error occurred in the cluster services layer while performing a 
//         cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00024,0, "Error in the messaging layer"
// *Cause: An error occurred in the messaging layer while performing a
//         cluster registry operation.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00025,0, "Error in the NLS services"
// *Cause: An error occurred in the NLS services while performing a
//         cluster registry operation.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00026,0, "Error while accessing the physical storage"
// *Cause: The Oracle Cluster Registry could not be accessed. The
//         possible causes are:
//         1. The cluster registry has not been formatted. 
//         2. The cluster registry location is not accessible.
//         3. The cluster registry location has incorrect permissions.
//         4. Oracle Clusterware is not running.
// *Action: 
//         1. Run the 'ocrcheck' command to confirm that the OCR is
//            formatted and usable.
//         2. Run 'ocrcheck -config' command to retrieve the configured
//            locations, and verify that each location is accessible and
//            has the correct permissions via native platform or OS methods.
//            If a location is an ASM disk group, verify that the disk group
//            exists and is mounted.
//         3. Run 'crsctl check crs' command to verify that Oracle Clusterware
//            is running.
/
00027,0, "Error in authentication layer"
// *Cause: An error occurred in the authentication layer while performing a
//         cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00028,0, "Oracle Cluster Registry already in current version"
// *Cause: An attempt to upgrade the cluster registry which has already been
//         upgraded.
// *Action: No action required.
/
00029,0, "Error in logging layer"
// *Cause: An error occurred in the logging layer while performing a
//         cluster registry operation.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00030,0, "Oracle Cluster Registry IDs do not match"
// *Cause: The cluster registry storage seen by the client was not the same as
//         the one seen by the server. This may be caused by a misconfiguration.
// *Action: Contact Oracle Support Services.
/
00031,0, "Storage device for the cluster registry is too small"
// *Cause: The configured storage device or the storage device to be newly 
//         added to the cluster registry was too small. 
// *Action: Refer to the documentation and configure a storage device that
//          is large enough for use by cluster registry. In case the cluster
//          registry is already configured, execute the 'ocrcheck' command to 
//          retrieve the total size, and ensure that the size of the device 
//          to be added is large enough for use by cluster registry.
/
00032,0, "Cluster Ready Services on the local node is not running"
// *Cause: The Cluster Ready Services on the local node was not running.
// *Action: Use the 'crsctl start crs' command to start the Cluster Ready 
//          Services on the local node.
/
00033,0, "Oracle Cluster Registry is not configured"
// *Cause: Oracle Cluster Registry configuration was not present on the node.
// *Action: Install and configure Oracle Clusterware.
/
00034,0, "Oracle Cluster Registry configurations are not compatible"
// *Cause: Cluster registry configuration on this node did not match with 
//         another node in the cluster.
// *Action: Retrieve the cluster registry configuration using 
//          'ocrcheck -config' command on all nodes in the cluster. Fix the 
//          configuration on this node and make it consistent using 
//          'ocrconfig -repair' command.
/
00035,0, "Cannot perform cluster registry operation due to invalid version"
// *Cause: The operation cannot be performed for this cluster active version 
// *Action: Complete the upgrade before retrying the operation 
/
00036,0, "No free space to perform this operation"
// *Cause: There is no free space left to perform the requested operation.
// *Action: Free up space and retry the operation.
/
00037,0, "Oracle Cluster Registry does not support the storage type configured"
// *Cause: The configured storage type for cluster registry is not supported 
// *Action: Change the configuration of the cluster registry to a supported 
//          storage type. Refer to Oracle documentation for an exhaustive list 
//          for each platform. 
/
00038,0, "Requested block number is not allocated from Oracle Cluster Registry"
// *Cause: The requested block number is not allocated from Oracle Cluster 
//         Registry.
// *Action: Retry the operation with another block number.
/
00039,0, "Requested block has an invalid header"
// *Cause: The requested block has an invalid header.
// *Action: Retry the operation with another block number.
/
00040,0, "Cannot add more operations to the batch"
// *Cause: An attempt was made to add an operation to a batch that already has 
//         the maximum allowed operations.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00041,0, "Oracle Cluster Registry is incorrectly configured"
// *Cause: The cluster registry is incorrectly configured.
// *Action: Correct the cluster registry configuration.
/
00042,0, "User cannot access Oracle Cluster Registry configuration"
// *Cause: Program encountered an error accessing the cluster registry 
//         configuration.
// *Action: Check to see if program is run as the correct user. Check that the 
//          cluster registry configuration has the correct permissions.
/
00043,0, "Error in the ASM access layer"
// *Cause: An error occurred in the layer used to access OCR when configured 
//         on ASM managed storage.
// *Action: Contact Oracle Support Services.
/
00044,0, "Error in network address and interface operations"
// *Cause: An error occurred in the network address and interface operations
//         layer while performing a cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00045,0, "Error in the Oracle Clusterware API layer"
// *Cause: An error occurred in the Oracle Clusterware API layer.
// *Action: Contact Oracle Support Services.
/
00046,0, "Cannot perform cluster registry operation because the batch is empty."
// *Cause: An attempt was made to execute the batch without any operations in
//         it.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00047,0, "Cannot proceed while the Oracle Cluster Registry format upgrade is in progress."
// *Cause: An Oracle Cluster Registry operation was requested, but found that 
//         an Oracle Cluster Registry format upgrade was in progress.
// *Action: Retry the operation after the format upgrade completes.
/

00101,0, "Operating System error [%s]"
// *Cause: An error occurred in the operating system layer while performing a cluster registry operation
// *Action: Contact Oracle Support Services.
/
00102,0, "Cluster services error [%s]"
// *Cause: An error occurred in the cluster services layer while performing a cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00103,0, "Messaging error"
// *Cause: An error occurred in the messaging layer while performing a cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00104,0, "Authentication error [%s]"
// *Cause: An error occurred in the authentication layer while performing a cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00105,0, "Logging error"
// *Cause: An error occurred in the logging layer while while performing a cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00106,0, "Unidentified component error"
// *Cause: An error occurred in an unidentified layer while performing a cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00107,0, "Storage layer error [%s]"
// *Cause: An error occurred in the storage layer while performing a cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00108,0, "ASM error [%s]"
// *Cause: An error occurred in the asm layer while performing a cluster registry operation.
// *Action: Contact Oracle Support Services.
/
00109,0, "Network address and interface operations error"
// *Cause: An error occurred in the network address and interface operations 
//         layer while performing a cluster registry operation.
// *Action: Contact Oracle Support Services.
/

00201,0, "[%s]"
00202,0, "User [%s] does not match with initialized user"
00203,0, "Group permission set has to be PROCR_NONE if no group is passed"
00204,0, "Group [%s] is not the primary group for the user"
00205,0, "User [%s] is not a member of group [%s]"
00206,0, "User [%s] does not have permission to perform this operation"
00207,0, "Group [%s] does not have permission to perform this operation"
00208,0, "User does not have permission to perform this operation"
