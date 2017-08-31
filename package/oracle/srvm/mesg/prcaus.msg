// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCaMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     05/29/09 - fix messages
//     yizhang     05/07/09 - fix bug 8481969
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     rxkumar     05/04/09 - update 1019 message
//     sowong      03/13/09 - fix bug8317368
//     agraves     02/20/09 - Change some messages for USM resources.
//     agraves     01/17/09 - Change ASMFS to ACFS.
//     sowong      01/16/09 - add messages for bug7522237
//     sowong      10/30/08 - add messages for bug7480289
//     sowong      09/17/08 - add message for bug7111226
//     sowong      09/02/08 - add messages for ASM filesystem non-existence
//     rxkumar     08/21/08 - fix bug7309465: add ASM_LSNR_NOT_EXIST
//     rxkumar     06/27/08 - fix cause of GET_DG_FOR_FS_FAILED
//     sowong      06/18/08 - add messages for FS-DG dependencies
//     rxkumar     04/21/08 - add ASM<->Listener association
//     sowong      03/10/08 - add messages for asm filesystem
//     sowong      03/06/08 - add asm instance messages
//     rxkumar     04/12/07 - update DG_RES_NOT_EXISTS msg
//     rxkumar     01/10/07 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
// IMPORT=import oracle.ops.mgmt.nls.MessageKey;
1000, DG_NOT_EXIST, "ASM Disk Group {0} does not exist"
//  *Cause: An attempt failed to retrieve an ASM disk group that was not configured.
// *Action: Create the diskgroup using sqlplus if the specified diskgroup does not exist. Mount the diskgroup in ASM which registers the diskgroup with CRS.
/
1001, DG_RES_NOT_EXIST, "ASM Disk Group resource does not exist"
//  *Cause: There was no disk group resource registered with CRS.
// *Action: Create the diskgroup using sqlplus and mount the diskgroup in ASM which registers the diskgroup with CRS.
/
1002, DG_REMOVE_FAILED, "Failed to remove CRS resource {0} for ASM Disk Group {1}"
//  *Cause: An attempt to remove the CRS resource for the specified ASM Disk Group failed. 
// *Action: Examine the accompanying error messages for details.
/
1003, ASM_CREATE_FAILED, "Failed to create ASM {0} resource {1}"
//  *Cause: An attempt to add the CRS resource for ASM failed. 
// *Action: Ensure that the CRS stack is running, the user running srvctl add asm is also the owner of the CRS home, and examine the accompanying error message for details.
/
1004, SPFILE_NOT_EXISTS, "Dummy message: ASM {0} is not using server parameter file"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1005, GET_SPFILE_FAILED, "Failed to retrieve server parameter file of ASM {0}"
//  *Cause: Cannot retrieve ASM server parameter file.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has read permission on the ASM resource.
/
1006, SET_SPFILE_FAILED, "Failed to update server parameter file {0} of ASM {1}"
//  *Cause: Unable to update the ASM server parameter file.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has update permission on the ASM resource.
/
1007, PARAMS_NOT_USED, "ASM {0} is not using initialization parameters: {1}"
//  *Cause: The specified ASM instance does not use the initialization parameters shown.
// *Action: Examine the accompanying error messages for details.
/
1008, GET_PARAMS_FAILED, "Dummy message: Failed to retrieve initialization parameters of ASM {0}"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1009, SET_PARAMS_FAILED, "Dummy message: Failed to update initialization parameters {0} of ASM {1}"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1010, SPFILE_USED, "Dummy message: ASM {0} is using server parameter file"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1011, PARAMS_USED, "Dummy message: ASM {0} is using initialization parameters"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1012, ASM_START_FAILED, "Dummy message: Failed to start ASM"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1013, ASM_STOP_FAILED, "Dummy message: Failed to stop ASM"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1014, ASM_START_PERX_FAILED, "Dummy message: Failed to start ASM on nodes {0}"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1015, ASM_STOP_PERX_FAILED, "Dummy message: Failed to stop ASM on nodes {0}"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1016, ASM_REMOVE_FAILED, "Failed to remove ASM resource {0} for ASM instance {1}"
//  *Cause: An attempt to remove the specified ASM configuration failed.
// *Action: Examine the accompanying error message for details.
/
1017, ASM_NOT_EXISTS, "ASM {0} does not exist"
//  *Cause: ASM is not configured yet.
// *Action: Configure ASM and then retry.
/
1018, GET_ASMINSTANCE_LIST_FAILED, "Failed to retrieve ASM instance list for ASM {0}"
//  *Cause: Failed to retrieve the list of ASM instances.
// *Action: Make sure that the crs stack is up and the ASM resource has been configured.
/
1019, NO_RUNNING_ASMINSTANCE, "ASM {0} is not running"
//  *Cause: The ASM resource does not have any running instances.
// *Action: Use 'srvctl start asm' command to start the asm resource.
/
1020, ACFS_CREATE_FAILED, "Unable to create ACFS file system resource {0} for the volume device {1}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          could not be created.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Was unable to identify the mount point that the user requested the resource to use.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. (srvctl status asm)
//       3) Verify that the user is running with administrative access.
//       4) Verify that the mount point given to the create resource command exists.
/
1021, GET_ACFS_FAILED, "Unable to retrieve ACFS file system for the volume device {0}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          could not be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Was unable to identify the mount point that the user requested the resource to use.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. (srvctl status asm)
//       3) Verify that the user is running with administrative access.
//       4) Verify that the mount point given to the create resource command exists.
/
1022, ACFS_ALREADY_EXISTS, "ACFS file system resource already exists for disk group {0} and volume {1}"
//  *Cause: The ACFS file system resource had already been created for the specified disk group and volume names.
// *Action: 
//      1) Supply a different volume device path to srvctl add filesystem to create a different ACFS file system resource.
//      -or-
//      2) Delete the previous resource (' srvctl remove filesystem -d <volume device> ') and re-run the command.
/
1023, ACFS_RES_ADD_FAILED, "Unable to add ACFS file system resource {0} for disk group {1} and volume {2}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          could not be added.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Was unable to identify the mount point that the user requested the resource to use.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
//       4) Verify that the mount point given to the create resource command exists.
/
1024, GET_VOLUME_DEVICE_FAILED, "Unable to retrieve the volume for disk group {0} and volume {1}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1025, GET_MOUNTPOINT_FAILED, "Unable to retrieve the mountpoint path for disk group {0} and volume {1}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1026, SET_ACFS_USER_FAILED, "Unable to set the user of the ACFS file system for disk group {0} and volume {1}"
//  *Cause: The user of the ACFS file system resource for the specified disk group and volume was unable to be modified.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1027, ACFS_REMOVE_FAILED, "Failed to remove ACFS file system configuration for disk group {0} and volume {1}"
//  *Cause: Cannot remove the ACFS file system configuration for the specified disk group and volume.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1028, GET_ASM_LSNR_FAILED, "Failed to retrieve listener associated with ASM {0} "
//  *Cause: Failed to retrieve listener associated with ASM.
// *Action: Ensure that user has read permissions on ASM resource and then retry. Also, ensure that listener specified in ASM resource's start dependencies exists.
/
1029, SET_ASM_LSNR_FAILED, "Failed to associate listener {0} with ASM {1}"
//  *Cause: Failed to associate given listener with ASM.
// *Action: Ensure that user has update permissions on ASM resource and then retry.
/
1030, GET_DG_FOR_FS_FAILED, "Failed to retrieve the diskgroup associated with the volume device {0}"
//  *Cause: Unable to retrieve the diskgroup associated with the given volume device using \"asmcmd volinfo -g <volume_name>\" command.
// *Action: Make sure that the asm instance is running; the asmcmd utility exists and the underlying ofs devices are accessible.
/
1031, CHECK_DG_EXIST_FOR_FS_FAILED, "Unable to retrieve the diskgroup {0} associated with the volume device {1}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Disk group is not mounted.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
//       4) Verify that the disk group is mounted.
/
1032, ASM_LSNR_NOT_EXIST, "ASM listener {0} does not exist"
//  *Cause: ASM listener is not registered with Oracle Clusterware.
// *Action: Run 'srvctl add listener -l <lsnr_name>' command with <lsnr_name> as in 
//          above error message, or if there is another listener registered 
//          with Oracle clusterware, then try 'srvctl modify asm -l <lsnr_name>'
/
1033, ACFS_RES_NOT_EXIST, "ACFS file system resource does not exist for volume device {0}"
//  *Cause: The ACFS file system resource with the specified volume device was not registered with the Oracle Clusterware.
// *Action: Use 'srvctl add filesystem' command to create an ACFS file system resource.
/
1034, ACFS_RES_NOT_EXIST_CLUSTER, "ACFS file system resource does not exist in Oracle Clusterware"
//  *Cause: No ACFS file system resource was registered with the Oracle clusterware.
// *Action: Use 'srvctl add filesystem' command to create an ACFS file system resource.
/
1035, GET_DG_DATABASES_FAILED, "Unable to determine the databases that use the disk group {0}"
//  *Cause: Unable to retrieve databases that have dependencies on the disk group.
// *Action: Make sure that the crs stack is up; the user has read permissions on database CRS resources and then retry.
/
1036, API_NOT_SUPPORTED_CLUSTER, "An Oracle Restart environment-specific API was invoked in an Oracle Clusterware environment."
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1037, GET_DISKSTRING_FAILED, "Failed to retrieve the diskgroup discovery string of ASM {0}"
//  *Cause: An attempt to retrieve the diskgroup discovery string for ASM failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has read permission on ASM resource.
/
1038, SET_DISKSTRING_FAILED, "Failed to update the diskgroup discovery string {0} of ASM {1}"
//  *Cause: An attempt to update the diskgroup discovery string for ASM failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has update permission on ASM resource.
/
1039, VOLDEVICE_NOT_EXIST, "Volume device {0} does not exist"
//  *Cause: The supplied volume device does not exist.
// *Action: Use asmca to create the volume device and then run 'srvctl add filesystem' command again.
/
1040, VOLDEVICE_CHECK_FAILED, "Failed to check the existence of volume device {0}"
//  *Cause: Failed to execute acfsutil command to check for the existence of the supplied volume device.
// *Action: Review the underlying error messages that provide the details of why acfsutil execution failed. Resolve the reported problem and retry the command.
/
1041, DG_CHECK_FAILED, "Failed to validate disk group {0} of volume device {1}"
//  *Cause: Failed to execute acfsutil command to validate the disk group of the volume device.
// *Action: Review the underlying error messages that provide the details of why acfsutil execution failed. Resolve the reported problem and retry 'srvctl add filesystem' command.
/
1042, INVALID_DISKGROUP, "Diskgroup {0} is not valid for volume device {1}"
//  *Cause: The supplied diskgroup does not match the underlying diskgroup created for the supplied volume device.
// *Action: Execute 'srvctl add filesystem' command with the correct disk group value.
/
1043, VOLUME_CHECK_FAILED, "Failed to validate volume {0} of volume device {1}"
//  *Cause: Failed to execute acfsutil command to validate the volume of the volume device.
// *Action: Review the underlying error messages that provide the details of why acfsutil execution failed. Resolve the reported problem and retry 'srvctl add filesystem' command.
/
1044, INVALID_VOLUME, "Volume {0} is not valid for volume device {1}"
//  *Cause: The supplied volume does not match the underlying volume created for the supplied volume device.
// *Action: Execute 'srvctl add filesystem' command with the correct volume value.
/
1045, ACFS_NOT_SUPPORTED_MSG, "ACFS is not supported. Details: {0}"
//  *Cause: ACFS is not supported. See the underlying message for further details.
// *Action: Run srvctl filesystem command on a supported platform.
/
