# CHARACTER_SET_NAME=American_America.US7ASCII
/ Copyright (c) Oracle Corporation 1999, 2001.  All rights reserved.
/
/ NAME
/   proclus.msg
/ DESCRIPTION
/   Generic error messages for Oracle Local Registry (OLR)
/ NOTES
/   Language      : American
/   Character set : US7ASCII
/   WARNING: A single message in this table should NOT exceed 75 characters
/            If it does the message will be TRUNCATED.
/
/   NOTE TO DEVELOPER:
/            When a message number is added or delete from this file,procus.msg
/            must be modified accordingly if applicable.
/            Please do not fill holes in the message numbers because the
/            unused message numbers might be used by OCR messages in procus.msg
/   NOTE TO TRANSLATOR:
/            These OLR messages should be translated almost identical
/            to the corresponding OCR messages in procus.msg.
/
/ RANGE
/   00001 - 00046 : OLR
/              30 : Unused
/              34 : Unused
/              43 : Unused
/              44 : Unused
/ 
/   00101 - 00109 : OLR Component Errors
/             108 : Unused
/
/   00201 - 00208 : OLR Permission Errors
/ 
/ OWNER
/
/ MODIFIED
/     sbezawad   06/03/09  - Add PROCR_UPGRADING_FORMAT
/     samjo      05/28/09  - Fix Action.
/     samjo      10/28/08  - Add PROCR_CLSCRS_ERROR message
/     sbezawad   12/10/08  - Add PROCR_BATCH_EMPTY
/     sbezawad   12/01/08  - Change 107
/     sbezawad   09/18/08  - Add PROCR_CLSI_ERROR
/     samjo      03/05/08  - Change 201
/     samjo      08/06/07  - Project 18350. Adding ASM error
/     kelee      03/19/07  - Modify for 5-way mirroring
/     samjo      01/16/07  - Add PROCR_INVALID_CONFIG
/     samjo      11/20/06  - Add PROCR_NO_MORE_OPERATIONS
/     spommere   10/30/06  - add PROCR_INVALID_BLOCKNUM, PROCR_INVALID_BLOCKHDR
/     kelee      07/14/06  - Creation
/
/
/ Message headers
/
/////////////////////////////////////////////////////////
/ Error message for olr
/ Range from 1 - 47
/////////////////////////////////////////////////////////
/
0001,0, "Oracle Local Registry cannot be initialized."
// *Cause: An invalid init level was passed to initialize Oracle Local
//         Registry.
// *Action: Initialize Oracle Local Registry with a valid init level.
/
0002,0, "Cannot perform local registry operation at the current init level."
// *Cause: Program tried a local registry operation which is not permitted
//         at the init level.
// *Action: Initialize Oracle Local Registry with an appropriate init level.
/
0003,0, "Cannot perform local registry operation because context is invalid."
// *Cause: The Oracle Local Registry context passed was invalid.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0004,0, "The local registry key to be operated on does not exist."
// *Cause: Program tried a local registry operation on a key which does not
//         exist.
// *Action: Check to see if the key exists and try the operation again.
/
0005,0, "User does not have permission to perform a local registry operation on this key."
// *Cause: Program tried an operation on a local registry key for which it
//         does not have permission.
// *Action: Check to see if program is run as the correct user.
/
0006,0, "User does not have permission to perform a local registry operation on this key."
// *Cause: Program tried a local registry operation on a key for which it
//         does not have permission.
// *Action: Check to see if program is run as the correct user.
/
0007,0, "Cannot perform local registry operation because the key or batch handle is invalid."
// *Cause: The local registry key or batch handle passed was invalid.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0008,0, "Cannot perform local registry operation because one of the parameters is invalid."
// *Cause: Program tried a local registry operation using an invalid
//         parameter.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0009,0, "Cannot perform local registry operation because the buffer passed is too small."
// *Cause: The amount of memory allocated for the buffer was insufficent.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0010,0, "Cannot delete the local registry key as subkeys exist."
// *Cause: The program tried to delete a key for which subkeys exist.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0011,0, "Cannot perform local registry operation because key is NULL."
// *Cause: The local registry key passed was NULL.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0012,0, "Out of heap memory."
// *Cause: The program ran out of heap memory.
// *Action: Contact Oracle Support Services.
/
0013,0, "Cannot perform local registry operation because one of the parameters is NULL."
// *Cause: Program tried a local registry operation using an NULL parameter.
// *Action: This is an internal error. Contact Oracle Support Services.
/
0014,0, "Unknown error occurred"
// *Cause: This is generic internal error for Oracle Local Registry.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00015,0, "Failed to initialize the local registry"
// *Cause: The Oracle Local Registry could not be accessed. The
//         possible causes are:
//         1. The local registry has not been formatted. 
//         2. The local registry file is not accessible.
//         3. The local registry file has incorrect permissions.
//         4. Oracle Clusterware is not running.
// *Action: 
//         1. Run the 'ocrcheck -local' command to confirm that the OLR is
//            formatted and usable.
//         2. Run 'ocrcheck -local -config' command to retrieve the configured
//            file, and verify that the file is accessible and has the 
//            correct permissions via native platform or OS methods
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
//         permitted by the local registry.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00020,0, "ORACLE_HOME environment not set"
// *Cause: ORACLE_HOME environment not set.
// *Action: Make sure that the ORACLE_HOME environment variable has been
//          properly set and exported.
/
00021,0, "Maximum permitted depth of the OLR tree is reached"
// *Cause: An attempt was made to create subkeys under a key which is already 
//         at depth PROCR_MAX_KEY_DEPTH
// *Action: This is an internal error. Contact Oracle Support Services.
/
00022,0, "The OLR backend has an invalid format"
// *Cause: An attempt was made to use OLR before initializing it.
// *Action: Use the root.sh script. The 'ocrconfig -local -upgrade' command
//          will initialize OLR.
/
00023,0, "Error in retrieving hostname"
// *Cause: An error occurred while retrieving hostname.
// *Action: Contact Oracle Support Services.
/
00024,0, "Error in the messaging layer"
// *Cause: An error occurred in the messaging layer while performing a
//         local registry operation.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00025,0, "Error in the NLS services"
// *Cause: An error occurred in the NLS services while performing a
//         local registry operation.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00026,0, "Error while accessing the physical storage"
// *Cause: The Oracle Local Registry could not be accessed.  The
//         possible causes are:
//         1. The local registry has not been formatted. 
//         2. The local registry file is not accessible.
//         3. The local registry file has incorrect permissions.
// *Action: 
//         1. Run the 'ocrcheck -local' command to confirm that the OLR is
//            formatted and usable.
//         2. Run 'ocrcheck -local -config' command to retrieve the configured
//            file, and verify that the file is accessible and has the 
//            correct permissions via native platform or OS methods
/
00027,0, "Error in authentication layer"
// *Cause: An error occurred in the authentication layer while performing a
//         local registry operation.
// *Action: Contact Oracle Support Services.
/
00028,0, "Oracle Local Registry already in current version"
// *Cause: An attempt to upgrade the local registry which has already been
//         upgraded.
// *Action: No action required.
/
00029,0, "Error in logging layer"
// *Cause: An error occurred in the logging layer while performing a
//         local registry operation.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00030,0, "Unused"
// *Document: NO
/
00031,0, "Storage device for the local registry is too small"
// *Cause: The configured storage device for local registry was too small.
// *Action: Refer to the documentation and configure a storage device that
//          is large enough for use by local registry.
/
00032,0, "Oracle High Availability Services on the local node is not running"
// *Cause: Oracle High Availability Services on the local node was not running
// *Action: Run 'crsctl start crs' command to start the Oracle High 
//          Availability Services on the local node.
/
00033,0, "Oracle Local Registry is not configured"
// *Cause: Oracle Local Registry configuration was not present on the node.
// *Action: Install and configure Oracle Clusterware.
/
00034,0, "Unused"
// *Document: NO
/
00035,0, "Cannot perform local registry operation due to invalid version"
// *Cause: The operation cannot be performed for this local active version 
// *Action: Complete the upgrade before retrying the operation 
/
00036,0, "No free space to perform this operation"
// *Cause: There is no free space left to perform the requested operation
// *Action: Free up space and retry the operation  
/
00037,0, "Oracle Local Registry does not support the storage type configured"
// *Cause: The configured storage type for local registry is not supported 
// *Action: Change the configuration of the local registry to a supported
//          storage type. Refer to Oracle documentation for an exhaustive list
//          for each platform. 
/
00038,0, "Requested block number is not allocated from Oracle Local Registry"
// *Cause: The requested block number is not allocated from Oracle Local Registry
// *Action: Retry the operation with another block number
/
00039,0, "Requested block has an invalid header"
// *Cause: The requested block has an invalid header
// *Action: Retry the operation with another block number
/
00040,0, "Cannot add more operations to the batch"
// *Cause: An attempt was made to add an operation to a batch that already has 
//         the maximum allowed operations.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00041,0, "Oracle Local Registry is incorrectly configured"
// *Cause: The local registry is incorrectly configured.
// *Action: Correct the local registry configuration.
/
00042,0, "User cannot access Oracle Local Registry configuration"
// *Cause: Program encountered an error accessing the local registry 
//         configuration.
// *Action: Check to see if program is run as the correct user. Check that the
//          local registry configuration has the correct permissions.
/
00043,0, "Unused"
// *Document: NO
/
00044,0, "Error in network address and interface operations"
// *Cause: An error occurred in the network address and interface operations
//         layer while performing a local registry operation.
// *Action: Contact Oracle Support Services.
/
00045,0, "Unused"
// *Document: NO
/
00046,0, "Cannot perform local registry operation because the batch is empty."
// *Cause: An attempt was made to execute the batch without any operations in it.
// *Action: This is an internal error. Contact Oracle Support Services.
/
00047,0, "Unused"
// *Document: NO
/

00101,0, "Operating System error [%s]"
// *Cause: An error occurred in the operating system layer while performing a local registry operation
// *Action: Contact Oracle Support Services.
/
00102,0, "Cluster services error [%s]"
// *Cause: An error occurred in the cluster services layer while performing a local registry operation.
// *Action: Contact Oracle Support Services.
/
00103,0, "Messaging error"
// *Cause: An error occurred in the messaging layer while performing a local registry operation.
// *Action: Contact Oracle Support Services.
/
00104,0, "Authentication error [%s]"
// *Cause: An error occurred in the authentication layer while performing a local registry operation.
// *Action: Contact Oracle Support Services.
/
00105,0, "Logging error"
// *Cause: An error occurred in the logging layer while while performing a local registry operation.
// *Action: Contact Oracle Support Services.
/
00106,0, "Unidentified component error"
// *Cause: An error occurred in an unidentified layer while performing a local registry operation.
// *Action: Contact Oracle Support Services.
/
00107,0, "Storage layer error [%s]"
// *Cause: An error occurred in the storage layer while performing a local registry operation.
// *Action: Contact Oracle Support Services.
/
00108,0, "Unused"
// *Document: NO
/
00109,0, "Network address and interface operations error"
// *Cause: An error occurred in the network address and interface operations 
//         layer while performing a local registry operation.
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
