// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrvpMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     nvira       06/08/09 - add message for comp software
//     nvira       06/08/09 - add message for comp software description
//     shmubeen    03/09/09 - bug# 8309339 , rename USM to ACFS(ASM Cluster
//                            File System).
//     nvira       12/03/08 - add description for oracle file type CLI flag
//     shmubeen    11/18/08 - bug 4467063 - change messages for
//                            DSC_VOTINGDISK,DSC_OCRLOCATION
//     sravindh    07/31/08 - Add vdisk component text
//     sravindh    05/08/08 - Review comments
//     kfgriffi    05/01/08 - Add DSC_STAGE_POST_NODEDEL
//     dsaggi      03/20/08 - add -fixup option
//     sravindh    04/02/08 - CTSS component
//     dsaggi      02/28/08 - add ohasd check
//     sravindh    02/22/08 - Fix dummy message lines
//     kfgriffi    12/16/07 - Add SCAN component
//     dsaggi      12/05/07 - add messages for gpnp and gns components
//     sravindh    12/06/07 - Fix ASM diskgroup message
//     sravindh    11/12/07 - Addituions for ASM checks
//     sravindh    10/19/07 - Additions for USM checks
//     nvira       10/08/07 - review comments
//     nvira       09/28/07 - add messages for software distribution comp
//     kfgriffi    07/27/07 - Add node add/delete messages
//     kfgriffi    01/16/07 - Add SIHA descriptions
//     mnijasur    02/17/06 - fix 4358826 - change error message
//     smishra     04/21/05 - message modified(testing->verification)
//     smishra     04/15/05 - multi product error added 
//     smishra     03/02/05 - admprv msg changed 
//     smishra     12/27/04 - nodeapp desc modified to add nodelist 
//     smishra     12/17/04 - default messages added 
//     smishra     11/18/04 - stage usage text modified 
//     smishra     09/28/04 - nodeapp msg added 
//     dsaggi      06/04/04 - dsaggi_fix_nls
//     dsaggi      06/03/04 - modify based on review comments 
//     smishra     05/26/04 - Initial messages added
//     dsaggi      05/25/04 - Creation
//  */
// 
// PACKAGE=package oracle.ops.verification.resources;
// MSGIDTYPE=interface
1000, ERROR_UNINITIALIZED_PM, "Parameter manager has not been initialized"
//  *Cause: 
// *Action: 
/
1001, ERROR_INVALID_SYNTAX, "Invalid command line syntax."
//  *Cause: 
// *Action: 
/
1002, ERROR_NO_NODELIST, "A nodelist must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1003, ERROR_NO_STORAGEIDLIST, "A storage ID list must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1004, ERROR_NO_FILESYSTEM, "A filesystem must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1005, ERROR_NO_CRSHOME, "CRS Home must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1006, ERROR_NO_ORAHOME, "Oracle Home must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1007, ERROR_NO_PRODUCT, "A product must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1008, ERROR_IF_OR_IP, "Either an interface list or an IP address list must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1009, ERROR_NUM_IP_MISMATCH, "The number of nodes provided does not match the number of IP addresses provided. Please provide matching number of IP-addresses."
//  *Cause: 
// *Action: 
/
1010, ERROR_NO_STORAGELOC, "A storage location must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1011, ERROR_NO_DISKSPACE, "Disk space must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1012, ERROR_NO_OPERATION, "An operation must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1013, ERROR_MULTI_REFNODE, "Reference node cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1014, ERROR_MULTI_STORAGELOC, "Storage location cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1015, ERROR_MULTI_OSDBAGRP, "Osdba must be a single group name. See usage for detail."
//  *Cause: 
// *Action: 
/
1016, ERROR_MULTI_ORAINVGRP, "Oracle inventory group must be a single group name. See usage for detail."
//  *Cause: 
// *Action: 
/
1017, ERROR_MULTI_SRCNODE, "Source node cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1018, ERROR_MULTI_OPERATION, "Operation cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1019, ERROR_INVALID_OPERATION, "Invalid operation. Please provide a valid operation. See usage for detail."
//  *Cause: 
// *Action: 
/
1020, ERROR_MULTI_FILESYSTEM, "Filesystem cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
// *Note:  MESSAGE# 1021 IS UNUSED IN 11.2 . IT HAS BEEN  USED FOR 11.1 AND EARLIER RELEASES. 
1021, ERROR_MULTI_OCRLOC, "OCR location cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
// *Note:  MESSAGE# 1022 IS UNUSED IN 11.2 . IT HAS BEEN  USED FOR 11.1 AND EARLIER RELEASES.
1022, ERROR_MULTI_VOTINGDISK, "Voting disk must be a single location. See usage for detail."
//  *Cause: 
// *Action: 
/
1023, ERROR_MULTI_CRSHOME, "A single CRS home must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1024, ERROR_INVALID_PORTNUM, "Invalid port numbers were specified; provide valid port numbers. See usage for detail."
//  *Cause: 
// *Action: 
/
1025, ERROR_MULTI_ORAHOME, "Oracle Home cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1026, ERROR_INVALID_DISKSPACE, "Invalid disk space specification syntax. See usage for detail."
//  *Cause: 
// *Action: 
/
1027, ERROR_INVALID_PRODUCT, "Invalid product. Please provide a valid product name. See usage for detail."
//  *Cause: 
// *Action: 
/
1028, ERROR_IP_AND_ALL, "IP address list can not be specified with 'all' option for the nodelist. See usage for detail."
//  *Cause: 
// *Action: 
/
1029, ERROR_DISKSPACE_MAXLIMIT, "Can not handle given disk space size."
//  *Cause: 
// *Action: 
/
1030, ERROR_NUMERIC_NODELIST, "An IP address can not be used as the nodename. See usage for detail."
//  *Cause: 
// *Action: 
/
1031, ERROR_MULTI_PRODUCT, "Product cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1033, ERROR_NO_ASMFLAG, "The \"-asm\" flag is required with the \"-asmgrp\" or \"-asmdev\" options."
//  *Cause: 
// *Action: 
/
1034, ERROR_SERVICE_OR_PROFILE, "Either -service or -profile option should be specified."
//  *Cause: 
// *Action: 
/
1035, ERROR_MULTI_FIXUPDIR, "Fixup directory cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1036, ERROR_NO_FIXUPFLAG, "\"-fixupdir\" option must follow a  \"-fixup\" flag."
//  *Cause: 
// *Action: 
/
1037, ERROR_MISSING_OPTION_VAL, "The value of \"{0}\" option is missing."
//  *Cause: 
// *Action: 
/
1038, ERROR_MULTI_ASMGRP, "asmgrp must be a single group name. See usage for detail."
//  *Cause: 
// *Action: 
1039, ERROR_STORAGE_FILE_TYPE, "Invalid storage file type specified. See usage for detail."
//  *Cause: 
// *Action: 
/
2000, DSC_NODELIST, "is the comma separated list of non-domain qualified nodenames, on which the test should be conducted."
//  *Cause: 
// *Action: 
/
2001, DSC_NODELIST_ALL, "If \"all\" is specified, then all the nodes in the cluster will be used for verification."
//  *Cause: 
// *Action: 
/
2002, DSC_REFNODE, "is the node which will be used as reference."
//  *Cause: 
// *Action: 
/
2003, DSC_SRCNODE, "is the node from which the reachability test will be performed."
//  *Cause: 
// *Action: 
/
2004, DSC_CFS_OH, "indicates oracle home is on a shared filesystem."
//  *Cause: 
// *Action: 
/
2005, DSC_STORAGELIST, "is the comma separated list of storage IDs."
//  *Cause: 
// *Action: 
/
2006, DSC_STORAGELOCATION, "is the storage path."
//  *Cause: 
// *Action: 
/
2007, DSC_DISKSPACE, "is the required disk space, in units of bytes(B),kilobytes(K),megabytes(M) or gigabytes(G)."
//  *Cause: 
// *Action: 
/
2008, DSC_VOTINGDISK, "is the list of comma separated paths for voting disks."
//  *Cause: 
// *Action: 
/
2009, DSC_OCRLOCATION, "is the list of comma separated paths for OCR locations or files."
//  *Cause: 
// *Action: 
/
2010, DSC_CRSHOME, "is the location of CRS home."
//  *Cause: 
// *Action: 
/
2011, DSC_PROD_CRS, "for Oracle Clusterware product"
//  *Cause: 
// *Action: 
/
2012, DSC_PROD_DATABASE, "for Oracle Real Application Cluster product"
//  *Cause: 
// *Action: 
/
2013, DSC_RELEASE, "is the release number of the product."
//  *Cause: 
// *Action: 
/
2014, DSC_ORAHOME, "is the location of the oracle home."
//  *Cause: 
// *Action: 
/
2015, DSC_OSDBAGRP, "is the name of the OSDBA group. The default is \"dba\"."
//  *Cause: 
// *Action: 
/
2016, DSC_ORAINVGRP, "is the name of the Oracle inventory group. The default is \"oinstall\"."
//  *Cause: 
// *Action: 
/
2017, DSC_INTERFACELIST, "is the comma separated list of interface names."
//  *Cause: 
// *Action: 
/
2018, DSC_IPADDRESSLIST, "is the comma separated list of IP addresses. The option 'all' for nodelist can not be specified with IP address list option."
//  *Cause: 
// *Action: 
/
2019, DSC_FILESYSTEM, "is the name of the file system."
//  *Cause: 
// *Action: 
/
2020, DSC_OPERATION_UE, "checks user equivalence between the nodes."
//  *Cause: 
// *Action: 
/
2021, DSC_OPERATION_CI, "checks administrative privileges for installing CRS."
//  *Cause: 
// *Action: 
/
2022, DSC_OPERATION_DI, "checks administrative privileges for installing RAC database."
//  *Cause: 
// *Action: 
/
2023, DSC_OPERATION_DC, "checks administrative privileges for configuring database."
//  *Cause: 
// *Action: 
/
2024, DSC_STAGE_POST_HWOS, "post-check for hardware and operating system"
//  *Cause: 
// *Action: 
/
2025, DSC_STAGE_PRE_CFS, "pre-check for CFS setup"
//  *Cause: 
// *Action: 
/
2026, DSC_STAGE_POST_CFS, "post-check for CFS setup"
//  *Cause: 
// *Action: 
/
2027, DSC_STAGE_PRE_CLUSVC, "pre-check for CRS installation"
//  *Cause: 
// *Action: 
/
2028, DSC_STAGE_POST_CLUSVC, "post-check for CRS installation"
//  *Cause: 
// *Action: 
/
2029, DSC_STAGE_PRE_DBINST, "pre-check for database installation"
//  *Cause: 
// *Action: 
/
2030, DSC_STAGE_PRE_NODEAPP, "pre-check for node application creation"
//  *Cause: 
// *Action: 
/
2031, DSC_STAGE_PRE_DBCFG, "pre-check for database configuration"
//  *Cause: 
// *Action: 
/
2032, DSC_STAGE_PRE_NODEADD, "pre-check for node addition."
//  *Cause: 
// *Action: 
/
2033, DSC_STAGE_POST_NODEADD, "post-check for node addition."
//  *Cause: 
// *Action: 
/
2034, DSC_STAGE_POST_STORADD, "post-check for storage addition."
//  *Cause: 
// *Action: 
/
2035, DSC_STAGE_POST_NETMOD, "post-check for network modification."
//  *Cause: 
// *Action: 
/
2036, TXT_VALID_STAGES, "Valid stage options and stage names are:"
//  *Cause: 
// *Action: 
/
2037, TXT_VALID_COMPS, "Valid components are:"
//  *Cause: 
// *Action: 
/
2038, DSC_COMP_NODEREACH, "checks reachability between nodes"
//  *Cause: 
// *Action: 
/
2039, DSC_COMP_NODECON, "checks node connectivity "
//  *Cause: 
// *Action: 
/
2040, DSC_COMP_CFS, "checks CFS integrity"
//  *Cause: 
// *Action: 
/
2041, DSC_COMP_SSA, "checks shared storage accessibility"
//  *Cause: 
// *Action: 
/
2042, DSC_COMP_SPACE, "checks space availability"
//  *Cause: 
// *Action: 
/
2043, DSC_COMP_SYS, "checks minimum system requirements"
//  *Cause: 
// *Action: 
/
2044, DSC_COMP_CLU, "checks cluster integrity"
//  *Cause: 
// *Action: 
/
2045, DSC_COMP_CLUMGR, "checks cluster manager integrity"
//  *Cause: 
// *Action: 
/
2046, DSC_COMP_OCR, "checks OCR integrity"
//  *Cause: 
// *Action: 
/
2047, DSC_COMP_CRS, "checks CRS integrity"
//  *Cause: 
// *Action: 
/
2048, DSC_COMP_ADMPRV, "checks administrative privileges"
//  *Cause: 
// *Action: 
/
2049, DSC_COMP_PEER, "compares properties with peers"
//  *Cause: 
// *Action: 
/
2050, DSC_COMP_NODEAPP, "checks node applications existence"
//  *Cause: 
// *Action: 
/
2051, ERROR_REFNODE_VS_REFNODE, "Reference node cannot be compared against itself. Provide a nodelist excluding the reference node."
//  *Cause: 
// *Action: 
/
2052, DSC_COMP_OLR, "checks OLR integrity"
//  *Cause: 
// *Action: 
/
2053, DSC_COMP_HA, "checks HA integrity"
//  *Cause: 
// *Action: 
/
2054, DSC_STAGE_PRE_HACONFIG, "pre-check for HA configuration"
//  *Cause: 
// *Action: 
/
2055, DSC_STAGE_POST_HACONFIG, "post-check for HA configuration"
//  *Cause: 
// *Action: 
/
2056, DSC_PROD_HA, "for Oracle High Availability product"
//  *Cause: 
// *Action: 
/
2057, DSC_COMP_SOFT, "checks software distribution"
//  *Cause: 
// *Action: 
/
2058, DSC_COMP_USM, "checks ACFS integrity"
//  *Cause: 
// *Action: 
/
2059, DSC_ASMADMGRP, "is the name of the ASM group. The default is \"dba\"."
//  *Cause: 
// *Action: 
/
2060, DSC_ASMDEVLIST, "is the list of devices planned to be used by ASM."
//  *Cause: 
// *Action: 
/
2061, DSC_ASMDISKGRP, "is a comma separated list of ASM diskgroup(s) to be verified."
//  *Cause: 
// *Action: 
/
2067, DSC_STAGE_PRE_USMCFG, "pre-check for ACFS Configuration."
//  *Cause: 
// *Action: 
/
2068, DSC_STAGE_POST_USMCFG, "post-check for ACFS Configuration."
//  *Cause: 
// *Action: 
/
2069, DSC_COMP_ASM, "checks ASM integrity"
//  *Cause: 
// *Action: 
/
2070, DSC_GPNP_SRV, "checks whether GPnP Service is up and running."
//  *Cause: 
// *Action: 
/
2071, DSC_GPNP_PRF, "checks the validity of GPnP profile."
//  *Cause: 
// *Action: 
/
2072, DSC_COMP_GPNP, "checks GPnP integrity"
//  *Cause: 
// *Action: 
/
2073, DSC_GNS_SRV, "checks whether all GNS responders are healthy."
//  *Cause: 
// *Action: 
/
2074, DSC_GNS_PRF, "checks the validity of GNS profile."
//  *Cause: 
// *Action: 
/
2075, DSC_COMP_GNS, "checks GNS integrity"
//  *Cause: 
// *Action: 
/
2076, DSC_COMP_SCAN, "checks SCAN configuration"
//  *Cause: 
// *Action: 
/
2077, DSC_COMP_OHASD,   "checks OHASD integrity"
//  *Cause: 
// *Action: 
/
2078, DSC_COMP_CTSS,   "checks Clock Synchronization"
//  *Cause:
// *Action:
/
2079, DSC_FIXUPDIR,   "is the directory where fixup instructions will be generated. The default is CVU's work directory."
//  *Cause: 
// *Action: 
/
2080, DSC_STAGE_POST_NODEDEL, "post-check for node deletion."
// *Document: NO
//  *Cause: 
// *Action: 
/
2081, DSC_NOCTSS, "does not check Oracle Cluster Synch service, but checks only the platforms native clock synch service(such as NTP)"
// *Document: NO
//  *Cause:
// *Action:
/
2082, DSC_COMP_VDISK, "check Voting Disk Udev settings"
// *Document: NO
//  *Cause:
// *Action:
/
2083, DSC_ORACLE_FILE_TYPE, "is the type of oracle files that will be stored on the storage device."
//  *Cause: 
// *Action: 
/
2100, DESC_COMP_NODEREACH, "Checks the reachability from the source node to the nodes specified in the nodelist. Source node is specified through the '-srcnode' option. If no source node is given, the local node is used as the source node."
//  *Cause: 
// *Action: 
/
2101, DESC_COMP_NODECON, "Checks the connectivity amongst the nodes specified in the nodelist. If an interface list is provided, the connectivity is be checked using the given interfaces. If no interface list is provided, then available interfaces are discovered and connectivity is checked using each of them."
//  *Cause: 
// *Action: 
/
2102, DESC_COMP_CFS, "Checks the integrity of OCFS file system provided by the '-f' option. The sharing of the file system is checked from the nodes in the nodelist. If no '-n' option is given, sharing is checked from the local node."
//  *Cause: 
// *Action: 
/
2103, DESC_COMP_SSA, "Checks the sharing of the locations specied in the '-s' option. If no '-s' option is given, supported storage types are discovered and sharing for each of them is checked. Sharing is checked from the nodes in the nodelist. If no '-t' option is given, the discovery or check is performed for 'datafile' type. If no '-n' option is given, sharing is checked from the local node. "
//  *Cause: 
// *Action: 
/
2104, DESC_COMP_SPACE, "Checks for free disk space at the location provided by '-l' option on all the nodes in the nodelist. If no '-n' option is given, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2105, DESC_COMP_SYS, "Checks the minimum system requirement for the product given by the '-p' option on all the nodes in the nodelist. If no '-n' option is given, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2106, DESC_COMP_CLU, "Checks the integrity of the cluster on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check."
//  *Cause: 
// *Action: 
/
2107, DESC_COMP_CLUMGR, "Checks the integrity of the Oracle Cluster Synchronization Services(CSS) on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check."
//  *Cause: 
// *Action: 
/
2108, DESC_COMP_NODEAPP, "Checks the existence of the node applications on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2109, DESC_COMP_OCR, "Checks the integrity of Oracle Cluster Registry(OCR) on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2110, DESC_COMP_CRS, "Checks the integrity of Oracle Cluster Ready Services(CRS) on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check."
//  *Cause: 
// *Action: 
/
2111, DESC_COMP_ADMPRV, "Checks the required administrative privileges for the operation specified by '-o' option on all the nodes specified in the nodelist. The operations are mutually exclusive and only one operation can be specified at a time. If no '-n' option is provided, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2112, DESC_COMP_PEER, "Checks the compatibility of the nodes in the nodelist against the reference node specified by '-refnode' option. If no '-refnode' is given, values for all the nodes in the nodelist are reported. "
//  *Cause: 
// *Action: 
/
2113, DESC_COMP_OLR, "Checks the integrity of Local Oracle Cluster Registry(OLR) on the local node. "
//  *Cause: 
// *Action: 
/
2114, DESC_COMP_HA, "Checks the integrity of High Availability on the local node. "
//  *Cause: 
// *Action: 
/
2115, DESC_COMP_SOFT, "Checks the attributes of the files installed during the installation of Oracle Software. If no '-n' option is provided, the check is performed on the local node. By default files under Clusterware home are verified, if oracle home is specified by the option -d, files for the database home are verified instead."
//  *Cause: 
// *Action: 
/
2116, DESC_COMP_USM, "Checks the integrity of Oracle ASM Cluster File System(ACFS) on all nodes in the nodelist. If no '-n' is specified, local node is used for this check."
//  *Cause: 
// *Action: 
/
2117, DESC_COMP_ASM, "Checks the integrity of Automatic Storage Manager(ASM) on all nodes in the nodelist. If no '-n' is specified, local node is used for this check."
//  *Cause: 
// *Action: 
/
2118, DESC_COMP_GPNP, "Checks the integrity of GPnP on all the nodes in the nodelist. If no '-n' option is provided, the check is performed on the local node."
//  *Cause: 
// *Action: 
/
2119, DESC_COMP_GNS, "Checks the integrity of GNS on all the nodes in the nodelist. If no '-n' option is provided, the check is performed on the local node."
//  *Cause: 
// *Action: 
/
2120, DESC_COMP_SCAN, "Checks the Single Client Access Name configuration. "
//  *Cause: 
// *Action: 
/
2121, DESC_COMP_OHASD,        "Checks the integrity of OHASD on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2123, DESC_COMP_CTSS, "Checks Oracle Cluster Time Synchronization Service(CTSS) on all nodes in the nodelist. If the \"-noctss\" option is specified, then Oracle CTSS check is not performed, instead the platforms native Time Synchronization is checked. If no '-n' option is provided, local node is used for this check. "
//  *Cause:
// *Action:
/
2124, DESC_COMP_VDISK, "Checks Udev settings for Oracle Clusterware Voting Disks on all nodes in the nodelist. If no '-n' option is provided, local node is used for this check. "
//  *Cause:
// *Action:
/
2200, DESC_STAGE_POST_HWOS, "Performs the appropriate network and storage checks on all the nodes in the nodelist. If '-s' option is given, then the sharing of the given storage locations are checked for supported storage types. If no '-s' option is provided, supported storage types are discovered and sharing for each of them is checked."
//  *Cause: 
// *Action: 
/
2201, DESC_STAGE_PRE_CFS, "Performs the appropriate checks on all the nodes in the nodelist before setting up Oracle Cluster File System(OCFS). "
//  *Cause: 
// *Action: 
/
2202, DESC_STAGE_POST_CFS, "Performs the appropriate checks after setting up Oracle Cluster File System(OCFS). This check is done on all the nodes in the nodelist for the file system given by the '-f' option. "
//  *Cause: 
// *Action: 
/
2203, DESC_STAGE_PRE_CRSINST, "Performs the appropriate checks on all the nodes in the nodelist before setting up Cluster Ready Services(CRS). Performs additional checks if the optional '-c' and '-q' options are specified.  If a value for '-asmgrp' is not specified, then the same group as the oracle inventory group is used. If a value for '-asmdev' is not specified, then an internal operating system dependent value is used."
//  *Cause: 
// *Action: 
/
2204, DESC_STAGE_POST_CRSINST, "performs the appropriate checks on all the nodes in the nodelist after setting up Cluster Ready Services(CRS)."
//  *Cause: 
// *Action: 
/
2205, DESC_STAGE_PRE_DBINST, "Performs the appropriate checks on all the nodes in the nodelist before setting up a RAC database. "
//  *Cause: 
// *Action: 
/
2206, DESC_STAGE_PRE_DBCFG, "Performs the appropriate checks on all the nodes in the nodelist before configuring a RAC database. "
//  *Cause: 
// *Action: 
/
2207, DESC_STAGE_PRE_HACONFIG, "Performs the appropriate checks on the local node before setting up a High Availability(HA) installation. "
//  *Cause: 
// *Action: 
/
2208, DESC_STAGE_POST_HACONFIG, "performs the appropriate checks on the local node after setting up a High Availability(HA) installation. "
//  *Cause: 
// *Action: 
/
2209, DESC_STAGE_PRE_NODEADD, "performs the appropriate checks on the node(s) to be added to the existing cluster, and verifies the integrity of the cluster before the node(s) can be added. "
//  *Cause: 
// *Action: 
/
2210, DESC_STAGE_PRE_NODEDEL, "performs the appropriate checks on the node(s) to be removed from the existing cluster, and verifies the integrity of the cluster before the node(s) can be removed. "
//  *Cause: 
// *Action: 
/
2211, DESC_STAGE_POST_NODEADD, "performs the appropriate checks on the existing cluster to verify the integrity of the cluster after the node(s) have been added. "
//  *Cause: 
// *Action: 
/
2212, DESC_STAGE_POST_NODEDEL, "performs the appropriate checks on the existing cluster to verify the integrity of the cluster after the node(s) have been removed. "
//  *Cause: 
// *Action: 
/
2213, DESC_STAGE_PRE_USMCFG, "performs the appropriate checks on the existing cluster before proceeding with ASM Cluster File System configuration."
//  *Cause: 
// *Action: 
/
2214, DESC_STAGE_POST_USMCFG, "performs the appropriate checks on the existing cluster following completion of ASM Cluster File System configuration."
//  *Cause: 
// *Action: 
/
3000, USAGE_TEXT, "USAGE:"
//  *Cause: 
// *Action: 
/
3001, DESCRIPTION_TEXT, "DESCRIPTION:"
//  *Cause: 
// *Action: 
/
3100, DESC_COMMON_ORAINV, "If 'Oracle Inventory' group is not specified, 'oinstall' is used as the inventory group. "
//  *Cause: 
// *Action: 
/
3101, DESC_COMMON_OSDBA, "If OSDBA group is not specified, 'dba' is used as the OSDBA group. "
//  *Cause: 
// *Action: 
/
3102, DESC_FIXUP_GEN, "If '-fixup' option is specified, on verification failure, fixup instructions are generated, if feasible. The '-fixupdir' option can be used to specify a specific directory in which the fixup instructions should be generated. "
//  *Cause: 
// *Action: 
/
