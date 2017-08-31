// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrChMsg.msg
//
// DESCRIPTION
//    Message file for home implementation
//
// NOTES
//
//     MODIFIED      (MM/DD/YY)
//     yizhang      05/29/09 - fix messages
//     ksviswan     11/12/08 - Added DiskGroup messages
//     rwessman     05/01/08 - Added GNS messages.
//     ksviswan     03/21/08 - Add Cause and Action
//     ksviswan     03/12/08 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, HOME_ORACLE_STOP_FAILED, "Failed to stop resources running from  Oracle home {0}"
//  *Cause: Attempt to stop one or more resources in the specified oracle home failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to stop, check the cause and
action for the individual resource stop failure and perform the steps for each resource that failed to stop.
/
1001, HOME_ORACLE_START_FAILED, "Failed to start resources  in Oracle home {0}"
//  *Cause: Attempt to start one or more resources in the specified oracle home failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to start, check the cause and action for the individual resource start failure and perform the steps for each resource that failed to start.
/
1002, HOME_CRS_STOP_FAILED, "Failed  to stop resources running from  crs home {0}"
//  *Cause: Attempt to stop one or more resources in the specified crs home failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to stop, check the cause and
action for the individual resource stop failure and perform the steps for each resource that failed to stop.
/
1003, HOME_CRS_START_FAILED, "Failed to start resources  in crs home {0}"
//  *Cause: Attempt to start one or more resources in the specified crs home failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to start, check the cause and
action for the individual resource start failure and perform the steps for each resource that failed to start.
/
1004, HOME_SERVICE_STOP_FAILED, "Failed to stop service"
//  *Cause: Attempt to stop a Service resource in the specified oracle home failed.
// *Action: Review the error messages for possible reasons and if needed, use 'srvctl stop service -d <db_name>' to stop the service.
/
1005, HOME_DB_STOP_FAILED, "Failed to stop database"
//  *Cause: Attempt to stop the database resource in the specified oracle home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop database -d <db_unique_name>' to stop the database.
/
1006, HOME_LSNR_STOP_FAILED, "Failed to stop Listener"
//  *Cause: Attempt to stop the Listener resource in the specified oracle home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop listener' to stop the Listener
/
1007, HOME_CLSNR_STOP_FAILED, "Failed to stop Listener"
//  *Cause: Attempt to stop the Listener resource in crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop listener' to stop the Listener
/
1008, HOME_SERVICE_START_FAILED, "Failed to start service"
//  *Cause: Attempt to start a Service resource in the specified oracle home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start service -d <db_name>' to start the service.
/
1009, HOME_DB_START_FAILED, "Failed to start database"
//  *Cause: Attempt to start the database resource in the specified oracle home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start database -d <db_unique_name>' to start the database.
/
1010, HOME_LSNR_START_FAILED, "Failed to start Listener" 
//  *Cause: Attempt to start the Listener resource in the specified oracle home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start listener' to start the Listener
/
1011, HOME_CLSNR_START_FAILED, "Failed to start Listener"
//  *Cause: Attempt to start the Listener resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start listener' to start the Listener
/
1012, HOME_EONS_STOP_FAILED, "Failed to stop eons"
//  *Cause: Attempt to stop the EONS resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop nodeapps' to stop the EONS resource
/
1013, HOME_EONS_START_FAILED, "Failed to start eons" 
//  *Cause: Attempt to start the EONS resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start nodeapps' to start the EONS resource
/
1014, HOME_ONS_STOP_FAILED, "Failed to stop ons"
//  *Cause: Attempt to stop the ONS resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop nodeapps' to stop the ONS resource
/
1015, HOME_ONS_START_FAILED, "Failed to start ons"
//  *Cause: Attempt to start the ONS resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start nodeapps' to start the ONS resource
/
1016, HOME_GSD_STOP_FAILED, "Failed to stop gsd resource"
//  *Cause: Attempt to stop the GSD resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop nodeapps' to stop the GSD resource
/
1017, HOME_GSD_START_FAILED, "Failed to start gsd resource"
//  *Cause: Attempt to start the GSD resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start nodeapps' to start the GSD resource
/
1018, HOME_VIP_STOP_FAILED, "Failed to stop VIP resource"
//  *Cause: Attempt to stop the VIP resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop vip -n <node_name>'to stop the VIP resource
/
1019, HOME_VIP_START_FAILED, "Failed to start VIP resource"
//  *Cause: Attempt to start the VIP resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start vip -n <node_name>' to start the VIP resource
/
1020, HOME_NET_STOP_FAILED, "Failed to stop Network resource"
//  *Cause: Attempt to stop the Network resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop nodeapps' to stop the Network resource
/
1021, HOME_NET_START_FAILED, "Failed to start Network resource"
//  *Cause: Attempt to start the Network resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start nodeapps' to start the Network resource
/
1022, HOME_SCANVIP_STOP_FAILED, "Failed to stop ScanVip resource"
//  *Cause: Attempt to stop the SCANVIP resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop scan' to stop the SCANVIP resource
/
1023, HOME_SCANVIP_START_FAILED, "Failed to start ScanVip resource"
//  *Cause: Attempt to start the SCANVIP resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start scan' to start the SCANVIP resource
/
1024, HOME_SCANLSNR_STOP_FAILED, "Failed to stop ScanLsnr resource"
//  *Cause: Attempt to stop the SCAN Listener resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop scan_listener' to stop the SCAN Listener resource
/
1025, HOME_SCANLSNR_START_FAILED, "Failed to start ScanLsnr"
//  *Cause: Attempt to start the SCANVIP resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start scan_listener' to start the SCAN Listener resource
/
1026, HOME_ASM_STOP_FAILED, "Failed to stop ASM"
//  *Cause: Attempt to stop the ASM resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop asm' to stop the ASM resource
/
1027, HOME_ASM_START_FAILED, "Failed to start ASM"
//  *Cause: Attempt to start the ASM resource in the specified crs home failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use 'srvctl start asm' to start the ASM resource
/
1028, HOME_ORACLE_START_FAIL1, "one or more resource failed to start {0}"
//  *Cause: Attempt to start one or more resources in the specified oracle home failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to start, check the cause and action for the individual resource start failure and perform the steps for each resource that failed to start.
/
1029, HOME_ORACLE_STOP_FAIL1, "one or more resource failed to stop {0}"
//  *Cause: Attempt to stop one or more resources in the specified oracle home failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to stop, check the cause and
action for the individual resource stop failure and perform the steps for each resource that failed to stop.
/
1030, HOME_CRS_STOP_FAIL1, "one or more resources failed to stop {0}"
//  *Cause: An attempt to stop one or more resources in the specified CRS home failed.
// *Action: Review the accompanying resource error messages and their documentation, and correct the problems indicated.
/
1031, HOME_CRS_START_FAIL1, "one or more resource failed to start {0}"
//  *Cause: Attempt to start one or more resources in the specified crs home failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to start, check the cause and
action for the individual resource start failure and perform the steps for each resource that failed to start.
/
1032, HOME_GNS_STOP_FAILED, "Failed to stop gns resource"
//  *Cause: Attempt to stop the GNS resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl stop gns' to stop the GNS resource
/
1033, HOME_GNS_START_FAILED, "Failed to start gns resource"
//  *Cause: Attempt to start the GNS resource in the specified crs home failed.
// *Action: Review the error messages for possible reasons, correct the error and use 'srvctl start gns' to start the GNS resource
/
1034, HOME_DG_STOP_FAILED, "Failed to stop diskgroup resource"
//  *Cause: Attempt to stop the diskgroup resource in the specified home failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use 'srvctl stop diskgroup -g <dg_name>' to stop the diskgroup resource
/
1035, HOME_DG_START_FAILED, "Failed to start diskgroup resource"
//  *Cause: Attempt to start the diskgroup resource in the specified home failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use 'srvctl start diskgroup -g <dg_name>' to start the diskgroup resource
/
1036, HOME_FILE_NOT_FOUND, "The state file \"{0}\" does not exist" 
//  *Cause: The state file required for the current operation was not found.
// *Action: Make sure the named file exists in the file system.
/
1037, HOME_NOT_A_FILE, "The filesystem object \"{0}\" is not a file" 
//  *Cause: The content that was expected to be a file which turned out not to be a file.
// *Action: Retry the 'srvctl stop home' to generate this file. If the problem still exists, contact Oracle Support Services.
/
1038, HOME_CANNOT_READ_FILE, "\"{0}\" is a non-readable file" 
//  *Cause: The user does not have read permissions to open the file.
// *Action: Modify the file permissions so that the file becomes readable or execute the command from an OS userid with the required privileges.
/
