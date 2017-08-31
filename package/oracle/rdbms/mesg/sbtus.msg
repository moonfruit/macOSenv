/ SBTTEST Error Message File
/
/    MODIFIED (MM/DD/YY)
/    banand    07/25/01 - bug 1870683; add 270 msg
/    banand    01/09/01 - add msgs for dynamic loading of sbt library.
/    swerthei  05/23/00 - sbt v1 support
/    rlu       10/20/98 - sbt 2.0 
/    swerthei  05/01/98 -                                                      
/    swerthei  08/08/97 - fix typo in message 109
/    swerthei  07/31/97 - add 139
/    swerthei  07/28/97 - created
/
/ Usage messages.  Message numbers 1-100 are reserved for usage messages.
/
0001, 1, "Usage: sbttest backup_file_name"
0002, 1, "               <-dbname database_name>"
0003, 1, "               <-trace trace_file_name>"
0004, 1, "               <-remove_before>"
0005, 1, "               <-no_remove_after> "
0006, 1, "               <-read_only>"
0007, 1, "               <-no_regular_backup_restore>"
0008, 1, "               <-no_proxy_backup>"
0009, 1, "               <-no_proxy_restore>"
0010, 1, "               <-file_type n>"
0011, 1, "               <-copy_number n>"
0012, 1, "               <-media_pool n>"
0013, 1, "               <-os_res_size n>"
0014, 1, "               <-pl_res_size n>"
0015, 1, "               <-block_size block_size> "
0016, 1, "               <-block_count block_count>"
0017, 1, "               <-proxy_file os_file_name bk_file_name "
0018, 1, "                           [os_res_size pl_res_size block_size block_count]>"
0019, 1, "               <-libname sbt_library_name>"
0020, 1, "Required parameters:"
0021, 1, "  backup_file_name: The name of the backup file which will be created by "
0022, 1, "                    this program.  If a BFS or Backup Piece already exists "
0023, 1, "                    with this name, then this program will not create a new"
0024, 1, "                    backup file - the existing file will be read in its "
0025, 1, "                    entirety and its contents will not be verified"
0026, 1, ""
0027, 1, "Optional parameters:"
0028, 1, "  -dbname  specifies the database name which will be used by SBT "
0029, 1, "           to identify the backup file. The default is \"sbtdb\""
0030, 1, "  -trace   specifies the name of a file where the Media Management "
0031, 1, "           software will write diagnostic messages."
0032, 1, "  -remove_before   if specified, then the specified backup file will be "
0033, 1, "                   deleted before it is opened.  This option is intended"
0034, 1, "                   for when sbttest has already been run but did not complete"
0035, 1, "                   successfully, leaving behind the backup file it created."
0036, 1, "  -no_remove_after   The default behavior of this program is to delete the"
0037, 1, "                     backup file, if it was created by this program.  If this"
0038, 1, "                     option is specified, then the file will not be"
0039, 1, "                     removed when this program is complete."
0040, 1, "  -read_only   if -read_only is specified, then backup_file_name must already"
0041, 1, "               exist. Its contents will be read. If it is determined that the"
0042, 1, "               file was created by this program, then its contents is validated."
0043, 1, "  -no_regular_backup_restore  skips non-proxy backup and restore."
0044, 1, "  -no_proxy_backup            skips proxy copy backup session."
0045, 1, "  -no_proxy_restore           skips proxy copy restore session."
0046, 1, "  -file_type    specifies file type - 1, 2 or 3."
0047, 1, "  -copy_number  this is the copy_number parameter to sbtpcbackup."
0048, 1, "  -media_pool   this is the media_pool  parameter to sbtpcbackup."
0049, 1, "  -os_res_size  specifies the size in bytes of the os reserved block."
0050, 1, "  -pl_res_size  specifies the size in bytes of the platform reserved block."
0051, 1, "  -block_size   specifies the size in bytes of each block written to the"
0052, 1, "                backup file. The default is 16384. "
0053, 1, "  -block_count  specifies how many blocks will be written to the"
0054, 1, "                backup file. The default is 100."
0055, 1, "  -proxy_file   specifies the os file name, backup file name, os reserved size,"
0056, 1, "                platform reserved size, block size, and block count for each"
0057, 1, "                proxy file.  For each proxy_file, the os_file_name and "
0058, 1, "                bk_file_name parameters are mandatory, the other four "
0059, 1, "                parameters are optional.  If none of the four is specified, "
0060, 1, "                either the default or the value specified with -os_res_size, "
0061, 1, "                pl_res_size, block_size, block_count will be used. It some of "
0062, 1, "                the four are the same as the values set with -os_res_size, "
0063, 1, "                pl_res_size, block_size, and block_count, a letter 'g' or 'G' "
0064, 1, "                can be used."
0065, 1, "                For example,"
0066, 1, "                    stksbt2 -os_res_size 10 -pl_res_size 20 -block_count 30 "
0067, 1, "                            -proxy_file file1.osf file1.bkf g g g 100"
0068, 1, "                then, for file1.osf, the backup file name is file1.bkf, the"
0069, 1, "                os reserved size is 10 bytes, and the platform reserved size "
0070, 1, "                is 20, block size is 16384 byte, and the block count is 100. "
0071, 1, "                But in this case, "
0072, 1, "                    stksbt2 -proxy_file file1.osf file1.bkf g g g 100"
0073, 1, "                            -os_res_size 10 -pl_res_size 20 -block_count 30 "
0074, 1, "                for file1.osf, the os_res_size and pl_res_size will be the "
0075, 1, "                default value, 0 (instead of 10 and 20), and the block_count "
0076, 1, "                will be 100 (instead of 30) and the block_size will also be "
0077, 1, "                the default, 16384."
0078, 1, "  -libname      specifies the SBT library to test. sbttest loads library  "
0079, 1, "                using dlopen() call.  If this option is not used, sbttest "
0080, 1, "                tries to test against libobk.so. Otherwise uses statically "
0081, 1, "                linked library."
0082, 1, "                Specify oracle.disksbt for oracle's disk SBT library."
0083, 1, ""
/
0101, 1, "Return code %d from %s, bsercoer = %d, bsercerrno = %d"
// *Cause: This message is issued when an SBT function returns an unexpected
//         return code.  Another message will be issued with a more detailed
//         explanation of the error.
// *Action: See the explanation associated with the accompanying 7000-series 
//          message, and correct the error if possible.
0102, 1, "%s could not be loaded.  Check that it is installed"
// *Cause: Messages 103-107 are issued when the MMV shared library could
//         not be loaded.
// *Action: Make sure that the LD_LIBRARY_PATH variable is set properly and
//          that the media manager is installed properly.
0103, 1, "properly, and that LD_LIBRARY_PATH environment variable"
0104, 1, "(or its equivalent on your platform) includes the directory"
0105, 1, "where this file can be found.  Here is some additional"
0106, 1, "information on the cause of this error:"
0107, 1, "%s"
0108, 1, "Function %s could not be loaded from the shared"
// *Cause: Messages 108-111 are issued when one of the required SBT functions
//         could not be loaded from the MMV shared library . shared library
//         was found, but an error occurred when trying to load the indicated
//         function.
// *Action: Make sure that the media manager is installed properly,
//          and that the LD_LIBRARY_PATH variable (or its equivalent on your
//          platform) points to the correct shared library.
0109, 1, "library %s."
0110, 1, "Here is additional information regarding this error:"
0111, 1, "%s"
0112, 1, "The sbt function pointers are loaded from %s library."
// *Cause: The shared library (if such is used on this platform) containing
//         the SBT entrypoints has been found and contains all of the
//         required SBT entrypoints.
// *Action: None - this is an informational message.
0113, 1, "Error: backup file name must be specified"
// *Cause: The name of a backup file was not specified.
// *Action: Re-run SBTTEST, specifying a backup file name.
0114, 1, "sbtinit successful"
// *Action: None - this is an informational message.
0115, 1, "Media manager is version %d.%d.%d.%d"
// *Action: None - this is an informational message.
0116, 1, "Media manager supports SBT API version %d.%d"
// *Action: None - this is an informational message.
0118, 1, "File %s does not already exist."
// *Cause: The remove option was specified, but the file does not already
//         exist.  The file will be created.
// *Action: None - this is an informational message.
0119, 1, "sbtremove successful"
// *Action: None - this is an informational message.
0120, 1, "File %s already exists.  sbttest will not create the"
// *Cause: The specified backup file already exists.  This 
// *Action: No action is necessary, but to perform a more complete test of the
//          media manager, specify a backup file that does not
//          already exist.
0121, 1, "file, but will attempt to read its contents without verification."
0122, 1, "sbtopen for output successful"
// *Action: None - this is an informational message.
0123, 1, "attempting to write buffer %d"
// *Cause: This message is issued to show which buffer was being written when
//         an error occurred during sbtwrite.
// *Action: See the explanation associated with the accompanying 7000-series 
//          message, and correct the error if possible.
0124, 1, "sbtwrite successful, wrote %d buffers"
// *Action: None - this is an informational message.
0125, 1, "sbtclose successful after sbtwrite"
// *Action: None - this is an informational message.
0126, 1, "sbtinfo successful"
// *Action: None - this is an informational message.
0127, 1, "file %s is on volume %s"
// *Action: None - this is an informational message.
0128, 1, "sbtopen for input successful"
// *Action: None - this is an informational message.
0129, 1, "attempting to read buffer %d"
// *Cause: This message is issued to show which buffer was being read when
//         an error occurred during sbtread.
// *Action: See the explanation associated with the accompanying 7000-series 
//          message, and correct the error if possible.
0130, 1, "sbtread error: buffer %d does not match what was written"
// *Cause: The data which was read from the backup file does not match the
//         data which was just written.  The message indicates which buffer
//         contained mismatched data.
// *Action: Run the test again with a different piece of media, in case the
//          media is bad.  If the error persists, contact the media manager
//          vendor.
0131, 1, "               the input buffer should contain %d \"%c\"'s"
0132, 1, "sbtread error: some buffers contained invalid data"
// *Cause: The backup file did not contain the
//         same data that was just written to the file.  Message 130/131 is
//         issued for each individual buffer that contained mismatched data.
// *Action: Run the test again with a different piece of media, in case the
//          media is bad.  If the error persists, contact the media manager
//          vendor.
0133, 1, "sbtread error: expected %d buffers, got %d instead"
// *Cause: When reading the backup file, end-of-file was reached before
//         reading the same number of buffers which were just written to the
//         file.
// *Action: Run the test again with a different piece of media, in case the
//          media is bad.  If the error persists, contact the media manager
//          vendor.
0134, 1, "sbtread successful, read %d buffers"
// *Action: None - this is an informational message.
0135, 1, "sbtclose successful after sbtread"
// *Action: None - this is an informational message.
0136, 1, "sbtremove successful"
// *Action: None - this is an informational message.
0138, 1, "*** The SBT API test was successful ***"
// *Action: None - this is an informational message.
0139, 1, "internal error - sbt function array not large enough"
// *Cause: An internal array used to hold the sbt function entrypoints does
//         not have enough entries to hold all of the SBT entrypoints.
// *Action: Contact Oracle.  This is an internal error.
0140, 1, "internal error - unexpected return code from skrsld"
// *Cause: An internal routine issued an unexpected return code.
// *Action: Contact Oracle.  This is an internal error.
0141, 1, "maximum backup file size is %d"
// *Action: None - this is an informational message
0142, 1, "media manager identification: %s"
// *Action: None - this is an informational message
0143, 1, "allocated sbt context area of %d bytes"
// *Action: None - this is an informational message
0144, 1, "proxy copy is supported"
// *Action: None - this is an informational message
0145, 1, "maximum concurrent proxy copy files is %d"
// *Action: None - this is an informational message
0146, 1, "sbt layer supports SBT v2, but did not supply SBT v2 functions"
// *Cause:  The sbt interface supports the v2 protocol, but did not supply
//          the required function pointers.
// *Action: This is an error in the v2 interface library - contact your
//          media management vendor.
/
/ regular backup and restore
/
/ sbterror
0201, 1, "Error: memory allocation (%s) failed"
// *Cause: issued when memory allocation failed.
// *Action: rerun sbttest. 
0202, 1, "MMAPI error from %s: %d, %s"
// *Cause: sbt session failed to finish successful.
// *Action: See the explanation associated with the accompanying 7000-series
//          message and correct the error if possible. 
/
/ sbtinit, sbtinit2
0211, 1, "block_size(%ld)*block_count(%ld) exceeds max file size(%ld) supported by MMAPI"
// *Cause: input block_size and block_count exceeds maximum file size limitation
//         supported by MMAPI.
// *Action: reduce input block_size and/or block_count
0212, 1, "sbtinit: vendor description string=%s"
// *Action: None - this is an informational message
0213, 1, "sbtinit: vendor description string should not be empty"
// *Action: None - this is an informational message
0214, 1, "sbtinit: allocated sbt context area of %d bytes"
// *Action: None - this is an informational message
0215, 1, "sbtinit: proxy copy is supported"
// *Action: None - this is an informational message
0216, 1, "sbtinit: maximum concurrent proxy copy files is %d"
// *Action: None - this is an informational message
0217, 1, "Note: This SBT library does not handle version 2.0 of SBT."
// *Action: None - this is an informational message
0218, 1, "sbtinit: Media manager supports SBT API version %d.%d"
// *Action: None - this is an informational message
0219, 1, "sbtinit: Media manager is version %d.%d.%d.%d"
// *Action: None - this is an informational message. 
/
/ sbtread2
0231, 1, "file was created by this program:"
0232, 1, "     seed=%ld, blk_size=%ld, blk_count=%ld" 
// *Action: None - this is an informational message. 
0233, 1, "Error: sbtread2, file was not created by this program"
// *Cause: the file being read was not created by sbttest, try another file.
// *Action: rerun sbttest with another file which was created by sbttest.
0234, 1, "Error: sbtread2, header data does not match:"
0235, 1, "                 seed=%ld, blk_size=%ld, blk_count=%ld" 
// *Cause: information held in file header does not match what we expect.
// *Action: rerun sbttest with another file which was created by sbttest.
0236, 1, "Error: sbtread2, file created with block size %ld - rerun with that block size" 
// *Cause: block_size specified in the file header is different from that of the input
//         parameters.
// *Action: rerun with the correct block_size parameter.
0237, 1, "Error: sbtread2 block %d does not match what was written" 
0238, 1, "               the input block should contain %d \"%c\"'s" 
// *Cause: contents of this block is different from what sbttest has previously written. 
//         This message indicates which buffer contains mismatched data.
// *Action: rerun the test with a different file.
0239, 1, "Error: sbtread2, some buffers contained invalid data" 
// *Cause: contents of this block is different from what sbttest has previously written. 
// *Action: rerun the test with a different file.
0240, 1, "Error: sbtread2, expected %d blocks , got %d instead"
// *Cause: number of blocks being read is different from what we expect.
// *Action: Check if the block_size, block_count of the file matches those 
//          of input parameters. 
0241, 1, "read %d buffers" 
// *Action: None - this is an informational message. 
/
/ sbtbackup
0251, 1, "File %s already exists.  sbtbackup will not create the file,"
0252, 1, "but will attempt to read its contents without verification."
// *Action: None - this is an informational message. 
/
/ sbtwrite2, sbtremove2
0261, 1, "write %d blocks"
// *Action: None - this is an informational message. 
0262, 1, "file, %s, was removed"
// *Action: None - this is an informational message. 
/
/ sbterror
0270, 1, "sbterror failed for function %s"
// *Cause: sbterror() for MML failed to return error.
// *Action: 
/
/ sbtinfo2
0281, 1, "sbtinfo2: SBTBFINFO_NAME=%s"
// *Action: None - this is an informational message. 
0282, 1, "sbtinfo2: SBTBFINFO_METHOD=stream"
// *Action: None - this is an informational message. 
0283, 1, "sbtinfo2: SBTBFINFO_METHOD=stream"
// *Action: None - this is an informational message. 
0284, 1, "sbtinfo2: SBTBFINFO_CRETIME=%s"
// *Action: None - this is an informational message. 
0285, 1, "sbtinfo2: SBTBFINFO_EXPTIME=%s"
// *Action: None - this is an informational message. 
0286, 1, "sbtinfo2: SBTBFINFO_NOTFOUND, file not found in the MM catalog"
// *Action: None - this is an informational message. 
0287, 1, "sbtinfo2: SBTBFINFO_COMMENT=%s"
// *Action: None - this is an informational message. 
0288, 1, "sbtinfo2: SBTBFINFO_SHARE=single user"
// *Action: None - this is an informational message. 
0289, 1, "sbtinfo2: SBTBFINFO_SHARE=multiple users"
// *Action: None - this is an informational message. 
0290, 1, "sbtinfo2: SBTBFINFO_ORDER=sequential access"
// *Action: None - this is an informational message. 
0291, 1, "sbtinfo2: SBTBFINFO_ORDER=random access"
// *Action: None - this is an informational message. 
0292, 1, "sbtinfo2: SBTBFINFO_LABEL=%s"
// *Action: None - this is an informational message. 
/
/
/ Proxy Copy 
/
0301, 1, "Error: Too many os_files, number of os_files should be less than %d"
// *Cause: number of input proxy copy files exceeds the maximum number of 
//         files this API supports.
// *Action: decrease number of input proxy files and rerun sbttest. 
0302, 1, "Error: create_osf_files failed"
// *Action: None - this is an informational message. 
0303, 1, "create_osf_files: %s succeeded"
// *Action: None - this is an informational message. 
0304, 1, "Error: sbtpcquerybackup: %s cannot be backed up using proxy copy"
// *Cause: This file can not be proxy copied.
// *Action: check the accompaning 7000-series message and coorect the error if 
//          possible. 
0305, 1, "sbtpcbackup:%s already exists"
// *Action: None - this is an informational message. 
0306, 1, "sbtpcbackup:%s (handle=%d) will be backed up to %s"
// *Action: None - this is an informational message. 
0307, 1, "sbtpcstatus:handle=%d READY-END-DONE status sequence imcomplete"
// *Action: None - this is an informational message. 
0308, 1, "sbtpcstatus:handle=%d not found in our context array"
// *Action: None - this is an informational message. 
0309, 1, "Error: sbtpcstatus:handle=%d invalid status -%s"
// *Cause: sbtpcstatus has returned an invalid status
// *Action: check the accompaning 7000-series message and coorect the error if 
//          possible. 
0310, 1, "sbtpcstatus:handle=%d, status=%s"
// *Action: None - this is an informational message. 
0311, 1, "Error: sbtpcstatus: PCSTATUS sequence invalid"
// *Cause: sbtpcstatus has returned an invalid status sequence
// *Action: check the accompaning 7000-series message and coorect the error if 
//          possible. 
0312, 1, "Error: sbtpcqueryrestore: %s cannot be restored to %s using proxy copy"
// *Cause: the file can not be proxy copy restored. 
// *Action: check the accompaning 7000-series message and coorect the error if
//          possible.
0313, 1, "sbtpcrestore: %s (handle=%d) will be restored to %s"
// *Action: None - this is an informational message. 
0314, 1, "sbtremove2: %s was removed successfully"
// *Action: None - this is an informational message. 
0315, 1, "proxy copy is not supported"
// *Action: None - this is an informational message. 
0316, 1, "krs_verify_rtf: %s"
// *Action: None - this is an informational message. 
0317, 1, "krs_verify_rtf: %s verification failed"
// *Action: None - this is an informational message. 
0318, 1, "krs_verify_rtf: %s verification succeeded"
// *Action: None - this is an informational message. 
0319, 1, "krs_verify_rtf: %s was not created by this program"
// *Action: None - this is an informational message. 
0320, 1, "krs_verify_rtf: %s header data not match:"
// *Action: None - this is an informational message. 
0321, 1, "           seed=%d block_size=%d block_count=%d"
// *Action: None - this is an informational message. 
0322, 1, "krs_verify_rtf: file was created with block size (%d)"
// *Action: None - this is an informational message. 
0323, 1, "krs_verify_rtf: block(%d) data doesnot match what was written"
0324, 1, "           should contain %d %s\'s"
// *Action: None - this is an informational message. 
0325, 1, "Error: krs_verify_rtf: some buffers contained invalid data"
// *Action: None - this is an informational message. 
0326, 1, "Error: krs_verify_rtf: expected %d buffers, got %d instead"
// *Action: None - this is an informational message. 
/
/
/ misc
0401, 1, "-- %s succeeded"
// *Action: None - this is an informational message. 
0402, 1, "-- %s failed"
// *Action: None - this is an informational message. 
0403, 1, "-- %s starts ................................"
// *Action: None - this is an informational message. 
0404, 1, "-- %s ends   ................................"
// *Action: None - this is an informational message. 
/
/
/ additional v1 backup/restore messages
1139, 1, "file was created by this program; seed=%s, bufsize=%s, bufcount=%s"
// *Action: None - this is an informational message.
1140, 1, "file was not created by this program"
// *Action: None - this is an informational message.
1141, 1, "header data doesn't match: seed=%s, bufsize=%s, bufcount=%s"
// *Cause: This error indicates that the data which was read from the
//         tape does not match the data which was just written by sbttest.
// *Action: Run the test again with a different piece of media, in case the
//          media is bad.  If the error persists, contact the media manager
//          vendor.
1142, 1, "file was created with buffer size %s - rerun with that buffer size"
// *Cause: This file was created with a different buffer size.
// *Action: Run the test again, specifying the correct buffer size with the
//          -bufsize option.

//
7000, 1, "sbtopen: Backup file not found"
// *Cause: The specified backup file does not exist.
// *Action: If this error results from an EBU or RMAN command, it means that
//          the EBU/RMAN catalog has gotten out of sync with the media
//          manager catalog - i.e. EBU/RMAN thinks the file exists but
//          it does not exist in the media manager catalog.
7001, 1, "sbtopen: Backup file exists"
// *Cause: The backup file which EBU or RMAN tried to create already exists.
// *Action: Contact Oracle - EBU and RMAN attempt to ensure that backup file
//          names are unique.
7002, 1, "sbtopen: Bad mode specified"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7003, 1, "sbtopen: Bad tpblksiz, should be multiple of 512"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7004, 1, "sbtopen: No device found"
// *Cause: The media manager could not find any backup device
//         attached to this system.
// *Action: Make sure that the media manager is installed and
//          configured properly, that this system has a backup device, and
//          that the media manager knows about that device.
7005, 1, "sbtopen: Device found but busy, try again later"
// *Cause: The backup device(s) attached to this system is in use.
// *Action: Run this backup or restore again later when the current job is
//          complete.
7006, 1, "sbtopen: volume not found"
// *Cause: The media manager could not find the volume containing
//         the desired backup file.
// *Action: Contact the media manager vendor - this error should not
//          occur during normal operation.
7007, 1, "sbtopen: volume is in use"
// *Cause: The volume containing the desired backup file is currently in use
//         by another backup or restore job.
// *Action: Run this backup or restore again later when the other job that is
//          using this volume is complete.
7008, 1, "sbtopen: I/O Error"
// *Cause: An I/O error happened while opening a backup file.  The
//         backup media or backup device could be faulty.  This could also be
//         caused by an I/O error encountered by the media manager when
//         accessing its catalog.
// *Action: Try the job with a different piece of media.  If the error
//          persists, then it is likely that the backup device is faulty.
7009, 1, "sbtopen: Can't connect with Media Manager"
// *Cause: The component of the media manager which is linked with
//         the EBU or Oracle executable could not connect to the component
//         which is responsible for reading and writing backup tapes.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine why the media manager connection failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7010, 1, "sbtopen: Permission denied"
// *Cause: The media manager did not allow this backup file to be opened.
// *Action: Make sure that the user performing the backup or restore is
//          authorized by the media manager to access this backup file(s).
7011, 1, "sbtopen: System error - eg. malloc, fork errors"
// *Cause: The media manager encountered an error in a system call.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine which system call failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7012, 1, "sbtopen: Invalid argument(s)"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7020, 1, "sbtclose: Bad th - this file has not been sbtopened"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7021, 1, "sbtclose: Invalid flags"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7022, 1, "sbtclose: I/O ERROR"
// *Cause: An I/O error happened while closing a backup file.  The
//         backup media or backup device could be faulty.  This could also
//         be caused by an I/O error encountered by the media manager when
//         accessing its catalog.
// *Action: Try the job with a different piece of media.  If the error
//          persists, then it is likely that the backup device is faulty.
7023, 1, "sbtclose: System Error - eg. malloc, fork errors"
// *Cause: The media manager encountered an error in a system call.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine which system call failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7024, 1, "sbtclose: Invalid Argument"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7025, 1, "sbtclose: Can't connect with Media Manager"
// *Cause: The component of the media manager which is linked with
//         the EBU or Oracle executable could not connect to the component
//         which is responsible for reading and writing backup tapes.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine why the media manager connection failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7040, 1, "sbtwrite: bad th - this file has not been sbtopened"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
/
/ *** 7041 is an obsolete 1.0 error ***
/
7041, 1, "sbtwrite: End of Volume reached"
// *Cause: End-of-volume was reached while writing a backup file.
// *Action: This error should not occur during normal operation, because the
//          media manager should transparantly switch volumes when the backup
//          volume is full.
7042, 1, "sbtwrite: I/O error"
// *Cause: An I/O error happened while writing a backup file.  Either the
//         backup media or backup device could be faulty.
// *Action: Try the job with a different piece of media.  If the error
//          persists, then it is likely that the backup device is faulty.
7043, 1, "sbtwrite: System error - eg. malloc, fork errors"
// *Cause: The media manager encountered an error in a system call.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine which system call failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7044, 1, "sbtwrite: Invalid argument(s)"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7060, 1, "sbtread: Bad th - this file has not been sbtopened"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7061, 1, "sbtread: EOF reached"
// *Cause: End-of-file was reached while reading a backup file.
// *Action: Contact Oracle.  This message should never be seen during normal
//          EBU or RMAN operation - it should be captured and handled without
//          user intervention.
/
/ *** 7062 is an obsolete 1.0 error ***
/
7062, 1, "sbtread: End of Volume reached"
// *Cause: End-of-volume was reached while reading a backup file.
// *Action: This error should not occur during normal operation, because the
//          media manager should transparantly switch volumes when the backup
//          file occupies more than one volume.
7063, 1, "sbtread: I/O error"
// *Cause: An I/O error happened while reading a backup file.  Either the
//         backup media or backup device could be faulty.
// *Action: Try the job with a different piece of media.  If the error
//          persists, then it is likely that the backup device is faulty.
7064, 1, "sbtread: System error - eg. malloc, fork errors"
// *Cause: The media manager encountered an error in a system call.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine which system call failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7065, 1, "sbtread: Invalid argument(s)"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7080, 1, "sbtremove: Backup file not found"
// *Cause: The backup file being removed could not be found.
// *Action: This probably means that the EBU/RMAN catalog has gotten out of
//          sync with the media manager catalog.  Ensure that the backup file
//          being deleted was created with the same instance of the media
//          manager catalog that is being used to delete it.
7081, 1, "sbtremove: Backup file being used"
// *Cause: An attempt was made to delete a backup file while the file
//         is in use.
// *Action: Wait until the file is no longer in use and try deleting the
//          backup file again.
7082, 1, "sbtremove: I/O Error"
// *Cause: An I/O error happened while deleting a backup file.  The
//         backup media or backup device could be faulty.  Most likely,
//         however, this is caused by an I/O error encountered by the media
//         manager when accessing its catalog.
// *Action: Try the job with a different piece of media.  If the error
//          persists, then it is likely that the backup device is faulty.
7083, 1, "sbtremove: Can't connect with Media Manager"
// *Cause: The component of the media manager which is linked with
//         the EBU or Oracle executable could not connect to the component
//         which is responsible for accessing the media manager's catalog.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine why the media manager connection failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7084, 1, "sbtremove: Permission denied"
// *Cause: The media manager did not allow this backup file to be removed.
// *Action: Make sure that the user removing the file is
//          authorized by the media manager to access this backup file(s).
7085, 1, "sbtremove: System error - eg. malloc, fork errors"
// *Cause: The media manager encountered an error in a system call.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine which system call failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7086, 1, "sbtremove: Invalid argument(s)"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7090, 1, "sbtinfo: Backup file not found"
// *Cause: The backup file for which volume information was requested could
//         not be found.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7091, 1, "sbtinfo: I/O Error"
// *Cause: An I/O error happened while deleting a backup file.  The
//         backup media or backup device could be faulty.  Most likely,
//         however, this is caused by an I/O error encountered by the media
//         manager when accessing its catalog.
// *Action: Try the job with a different piece of media.  If the error
//          persists, then it is likely that the backup device is faulty.
7092, 1, "sbtinfo: Can't connect with Media Manager"
// *Cause: The component of the media manager which is linked with
//         the EBU or Oracle executable could not connect to the component
//         which is responsible for accessing the media manager's catalog.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine why the media manager connection failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7093, 1, "sbtinfo: Permission denied"
// *Cause: The media manager did not allow any information about this backup
//         file to be returned.
// *Action: Make sure that the user requesting information about this file is
//          authorized by the media manager to access this backup file(s).
7094, 1, "sbtinfo: System error - eg. malloc, fork errors"
// *Cause: The media manager encountered an error in a system call.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine which system call failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
7095, 1, "sbtinfo: Invalid argument(s)"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7110, 1, "sbtinit: Invalid argument(s)"
// *Cause: An SBT function received an invalid parameter.
// *Action: Contact Oracle - this error should never be seen during normal
//          EBU or RMAN operation.
7111, 1, "sbtinit: System error - eg. malloc, fork errors"
// *Cause: The media manager encountered an error in a system call.
// *Action: For EBU, use the TRACE option to specify a trace file where
//          the media manager will write diagnostic messages, then examine that
//          file to determine which system call failed.  For
//          RMAN, examine the 'sbtio.log' file in the USER_DUMP_DEST directory
//          (whose default is $ORACLE_HOME/lib).  If the problem cannot be
//          determined and corrected after examining the trace log, contact
//          the media manager vendor.
