/////////////////////////////////////////////////////////////////////////////
//  48000 - 52999 Reserved for Diagnosability error messages
/////////////////////////////////////////////////////////////////////////////
/
/ Copyright (c) Oracle Corporation 2006, 2006.  All Rights Reserved.
/
/ NAME
/   diaus.msg     
/ DESCRIPTION
/   Error messages for Diagnosability workBench Generic.
/
/ NOTES 
/   In the RDBMS these errors are part of the ORA facility. Outside of
/   the RDBMS these errors are part of the DIA facility.   
/
/ MODIFIED
/   mjstewar   09/11/08 - DRA: new import messages
/   bkuchibh   12/08/08 - fix bug 6632278: NLS support for check names, descriptions
/   husun      09/05/08 - add dataguard repair messages
/   mjstewar   09/12/08 - File/TS Offline: New DRA messages
/   husun      09/02/08 - Add datafile is offline failure message
/   husun      06/20/08 - add blocksize / disk sector incompatible failure
/   jklein     09/25/08 - legal names for views
/   amysoren   08/12/08 - add runtime defined product type related errors
/   gngai      07/14/08 - added view error
/   gmengel    07/11/08 - Add messages 51407, 51408
/   husun      06/17/08 - Add FSFO message
/   husun      06/17/08 - 51248 remove 'switchover' from message
/   mdilman    05/27/08 - add 51334
/   avaliani   05/15/08 - bug 5880710: conditional snapshot errors
/   gngai      05/22/08 - added view msg
/   gmengel    04/25/08 - Add messages 51405, 51406
/   jklein     04/10/08 - 
/   mdilman    04/01/08 - bug-6934846: change 51248
/   bkuchibh   03/27/08 - asm check integration
/   gngai      03/18/08 - 
/   husun      03/14/08 - bug-6893690 - add repair message for open resetlogs
/   jklein     01/31/08 - 
/   siyarlag   12/24/07 - Add messages 51403, 51404
/   gmengel    12/05/07 - Add messages for ASM Health Monitor
/   mfallen    01/03/08 - add ips message
/   husun      10/02/07 - add backup control file to trace message
/   husun      09/19/07 - add controlfile block failure message
/   mjstewar   10/30/07 - Add DRA timeout msg
/   ilistvin   10/16/07 - add argument to msg 49160
/   ilistvin   10/02/07 - reserve error range for Events++ parser errors
/   ysarig     09/10/07 - Add 48763 error message
/   husun      08/16/07 - bug-4454144 change 51273 message 
/   mfallen    07/24/07 - add ips date handling message
/   mlfeng     06/26/07 - add error message for invalid file name
/   mlfeng     06/13/07 - error for fsync
/   mlfeng     06/04/07 - error for not being able to read block file
/   mfallen    06/08/07 - add unpack warnings message
/   mlfeng     05/11/07 - more detailed error
/   mlfeng     05/09/07 - error messages
/   gngai      05/08/07 - added 48324
/   bdagevil   05/16/07 - change %u into %s
/   mlfeng     04/27/07 - error for wrong directory
/   jklein     05/06/07 - backup
/   hayu       04/26/07 - add new message for viewer
/   mlfeng     04/02/07 - get current working directory
/   mlfeng     04/05/07 - error messages for validating paths and files
/   hayu       03/21/07 - add viewer message
/   mlfeng     03/20/07 - OS command to copy a file
/   hayu       02/11/07 - add messages for adrci report
/   gngai      03/02/07 - added 48321
/   jklein     02/20/07 - added 48255
/   mlfeng     03/05/07 - update errors
/   bdagevil   02/20/07 - add error for ADR switch home
/   mlfeng     02/13/07 - errors for path and file conversion
/   mfallen    03/02/07 - add incident type message
/   mdilman    02/12/07 - add 51326, 51327
/   mjstewar   02/01/07 - Add new DRA messages
/   mdilman    12/28/06 - add 51317-25; change format of DRA messages
/   husun      12/27/06 - add Datafile Unknown (51312) and Repair (51317)
/   mfallen    02/15/07 - add flood-control message
/   dsampath   01/25/07 - add 49160
/   mlfeng     02/06/07 - error for not being to find valid adr base
/   hayu       01/22/07 - add viewer messages
/   gngai      02/12/07 - added show incident error
/   dsampath   12/06/06 - add DBGD_POSTFILTER
/   mlfeng     01/04/07 - clean up error reporting
/   mlfeng     10/12/06 - deferred initialization for ADR
/   mfallen    01/03/07 - add ips messages
/   amysoren   12/19/06 - add 49206
/   hayu       11/21/06 - add view interrupt error code
/   mlfeng     12/05/06 - more information when list dir fails
/   mlfeng     11/28/06 - where argument to get lock
/   hayu       11/22/06 - add error for lrm fail
/   mdilman    11/27/06 - add file number parameter to datafile failures
/   mfallen    11/27/06 - add ips messages
/   mlfeng     11/16/06 - move file system error
/   gngai      11/21/06 - added ami version errors
/   mlfeng     11/21/06 - permission error for block file
/   mlfeng     10/31/06 - check for file permissions
/   jklein     10/31/06 - new error for unlink directory
/   husun      11/07/06 - changed Control File is older then datafiles to add
/                         log files also (mesg 51100)
/   husun      11/03/06 - add DRA Check Error 51106
/   mfallen    10/24/06 - move adrci help topics to dbgvcis.c
/   hayu       10/26/06 - add help message
/   hayu       09/21/06 - add message for trace merging
/   mjstewar   10/05/06 - Changes to DRA messages
/   mlfeng     10/18/06 - clean up messages
/   mlfeng     09/26/06 - directory does not exist
/   mlfeng     10/03/06 - error message sync with code
/   mlfeng     10/10/06 - file length errors
/   jklein     10/12/06 - 48223 update
/   dsampath   09/21/06 - add errors to events++, for scope
/   dsampath   08/09/06 - Events++ cleanup
/   mjstewar   09/27/06 - New fails/repairs for DRA
/   husun      09/27/06 - add asm failure message
/   bkuchibh   09/28/06 - add new messages for amh layer 
/   mdilman    09/19/06 - change 51263, remove duplicated 51257
/   mdilman    09/17/06 - review comments for DRA messages
/   mdilman    08/28/06 - "multiple" -> "one or more" in DRA failures
/   mjstewar   08/24/06 - New DRA messages
/   gngai      09/12/06 - added create relation error
/   mlfeng     09/18/06 - error messages for parameters
/   mfallen    09/07/06 - add ips message
/   mlfeng     09/07/06 - add error for null input
/   mlfeng     09/12/06 - extra args to file lock
/   hayu       08/27/06 - add more adrci error
/   husun      07/26/06 - changed 51206 message 
/   husun      07/25/06 - Add Comment for Recover Until Cancel 
/   hayu       08/19/06 - add some uts errors
/   bkuchibh   08/17/06 - 
/   amysoren   08/14/06 - DDE async action generic error
/   gngai      08/13/06 - added adr not enabled error
/   hayu       08/12/06 - error for missing base path
/   ysarig     07/31/06 - Updating DDE errors
/   jklein     07/19/06 - partitioning of alert log 
/   hayu       07/25/06 - add more help message
/   mfallen    07/12/06 - add archiving/unarchiving error messages for ips 
/   balajkri   07/11/06   - txn diag integration with HM 
/   husun      07/07/06   - Changed Log Group Missing to Log Group Unavailable 
/   husun      06/30/06   - add 51303-6
/   bkuchibh   06/27/06   - add 51035 
/   mdilman    06/22/06   - change 51241
/   mdilman    06/20/06   - change 51273
/   bkuchibh   06/19/06   - add psedo ctx message 
/   bdagevil   06/11/06   - error for parsing UTS Trace event 
/   bkuchibh   06/28/06 - add incident meter messages 
/   mlfeng     07/11/06 - refresh to 060710 
/   bdagevil   06/11/06 - error for parsing UTS Trace event 
/   mfallen    06/28/06 - add ads file time error message 
/   bkuchibh   06/10/06 - add hm layer messages 
/   balajkri   05/25/06 - add transaction layer messages 
/   mjstewar   05/25/06 - IR Integration
/   avaliani   06/20/06 - add callbacks for adr disable 
/   mfallen    06/18/06 - add messages for dde user actions 
/   mfallen    06/21/06 - add more messages for ips
/   mfallen    05/17/06 - add messages for ips 
/   hayu       07/09/06 - add function error
/   bdagevil   06/24/06 - add some UTS error messages 
/   bdagevil   06/18/06 - add more UTS errors 
/   gngai      07/06/06 - added ami error
/   mlfeng     06/28/06 - add alert log errors
/   gngai      06/26/06 - added Sweep error
/   hayu       06/20/06 - add message for program setting
/   gngai      06/18/06 - added AMI messages
/   mfallen    05/15/06 - add messages for dde user actions 
/   bkuchibh   05/06/06 - add amh layer errors
/   shwang     05/05/06 - error messages for data layer diagnostic failures
/   bdagevil   06/05/06 - add errors to parse component targets 
/   dsampath   05/19/06 - events++ errors 
/   dsampath   05/11/06 - error codes for DDE
/   mramache   04/12/06 - add initialization failure messages 
/   bkuchibh   04/17/06 - reserving 51000-51999 for HM,IR, component checks
/   hayu       05/12/06 - Add UTS error 
/   gngai      05/24/06 - added ami errors
/   hayu       05/15/06 - addd adrci errors
/   mramache   04/12/06 - add initialization failure messages 
/   mlfeng     05/02/06 - changes based on errors_us comments 
/   jklein     05/02/06 - review comments 
/   mlfeng     04/24/06 - error codes for initialization 
/   mlfeng     04/18/06 - add cause and action for the errors
/   hayu       04/16/06 - add more viewer errors
/   hayu       04/14/06 - add more viewer errors
/   mlfeng     04/13/06 - add ads errors 
/   hayu       04/13/06 - added ADR viewer errors
/   gngai      04/13/06 - added AMI errors
/   jklein     04/13/06 - reserve ranges for each adr layer
/   avaliani   03/06/06 - Creation
/
/ 
/ E R R O R S 
/
/////////////////////////////////////////////////////////////////////////////
/ 48000 - 48099 are reserved for diagnosability framework errors
/////////////////////////////////////////////////////////////////////////////
/
48001, 00000, "internal error code, arguments: [%s], [%s], [%s], [%s], [%s], [%s], [%s], [%s]"
// *Document: YES
// *Cause:  This is the generic internal error number for program
//	    exceptions.	This indicated that a process encountered an
//	    exceptional condition.
// *Action: Report as a bug - the first argument is the internal error number.
// *Comment: The ORA facility mapping for this error is ORA-00600.
/
48002, 00000, "thread terminated by fatal error"
// *Document: YES
// *Cause:  The thread was in an unrecoverable state.
// *Action: Examine the thread trace file for more information.
// *Comment: The ORA facility mapping for this error is ORA-00603.
/
48003, 00000, "out of process memory when trying to allocate %s bytes (%s,%s)"
// *Document: YES
// *Cause:  Operating system process private memory was exhausted.
// *Action: 
// *Comment: The ORA facility mapping for this error is ORA-04030.
/
48004, 00000, "unable to allocate %s bytes of shared memory (\"%s\",\"%s\",\"%s\",\"%s\")"
// *Document: YES
// *Cause:  More shared memory is needed than was allocated in the shared
//          pool.
// *Action: Reduce your use of shared memory or increase the amount of
//          available shared memory.
// *Comment: The ORA facility mapping for this error is ORA-04031.
/
48005, 00000, "illegal argument for function"
// *Document: NO
// *Cause: An illegal argument was passed to dbgc_alloc.
// *Action: Report as a bug.
// *Comment: Ideally we should have signaled an internal error, however
//           the KGE facility is not initialized when dbgc_alloc is called
//           thus we could not raise an error.
/
48006, 00000, "user requested cancel of current operation"
// *Document: YES
// *Cause:
// *Action:
// *Comment: The ORA facility mapping for this error is ORA-01013.
/
48007, 00000, "name is already used by an existing product type"
// *Document: YES
// *Cause: An attempt was made to define a product type with the same name
//         as an already defined product type.
// *Action: Use the already existing product type with the specified name,
//          or use a different name for the product type.
/
48008, 00000, "id is already used by an existing product type"
// *Document: YES
// *Cause: An attempt was made to define a product type with the same id
//         as an already defined product type.
// *Action: Choose a different name for the product type.
/
/////////////////////////////////////////////////////////////////////////////
/ 48100 - 48179 are reserved for ADS portable layer
/////////////////////////////////////////////////////////////////////////////
48100, 00000, "error encountered when attempting to open a file"
// *Cause: There was an error encountered when attempting to open a file
//         with the ADR file interface.
// *Action: Check that the specified directory name, file name, and open
//          options are valid.
/
48101, 00000, "error encountered when attempting to read a file [%s] [%s] [%s]"
// *Cause: There was an error encountered when attempting to read a file
//         with the ADR file interface.
// *Action: Check the specified arguments to the read interface.
/
48102, 00000, "encountered the end-of-file when reading the file"
// *Cause: The ADR file interface encountered the end-of-file when
//         reading the file.
// *Action: Handle the end of file condition.
/
48103, 00000, "error encountered when attempting to write a file [%s] [%s] [%s]"
// *Cause: There was an error encountered when attempting to write a file
//         with the ADR file interface.
// *Action: Check the specified arguments to the write interface.
/
48104, 00000, "read mismatch on blocks requested and returned, [%s], [%s]"
// *Cause: There was a mismatch between the number of blocks requested
//         for reading and the number of blocks actually returned.
// *Action: Check the file to make sure there are no partial blocks.
/
48105, 00000, "write mismatch on blocks requested and returned, [%s], [%s]"
// *Cause: There was a mismatch between the number of blocks requested
//         for writing and the number of blocks actually written.
// *Action: Check that there is enough space left on the device to
//          write the requested number of blocks.
/
48106, 00000, "error initializing the ADR %s object"
// *Cause: There was an error encountered during the initialization of
//         one of the ADR file objects.
// *Action: Check the validity of the specified directory name and 
//          file name.
/
48107, 00000, "invalid Bfile input, [%s]"
// *Cause: An invalid Bfile was passed into the routine to convert the 
//         bfile into a file handle.
// *Action: Verify the contents of the specified Bfile.
/
48108, 00000, "invalid value given for the diagnostic_dest init.ora parameter"
// *Cause:  The value given for the diagnostic_dest directory is not a 
//          valid directory.  Either the directory does not exist or 
//          the process does not have read/write privileges on the directory.
// *Action: Use a value for diagnostic_dest that is a valid directory 
//          with the proper read and write privileges.
/
48109, 00000, "invalid lock mode for file descriptor, [%s]"
// *Cause: The lock mode associated with the file descriptor was invalid
//         in the context of the routine.
// *Action: Verify that a file is not trying to obtain multiple locks and
//          that the file is holding a lock when attempting to release 
//          the lock.
/
48110, 00000, "error encountered while attempting to get a file lock [%s] [%s]"
// *Cause: There was an error encountered while trying to get 
//         a file lock.
// *Action: Check the state of the file and operating system.
/
48111, 00000, "error encountered while attempting to release a file lock [%s]"
// *Cause: There was an error encountered while trying to release 
//         a file lock.
// *Action: Check the state of the file and operating system.
/
48112, 00000, "invalid flags for open file, %s"
// *Cause: Invalid flags were passed in to the open file routine.
// *Action: Check to see if the flags are a valid combination.
/
48113, 00000, "unable to write to stream file because of out of space condition"
// *Cause: The system is unable to write the requested number of bytes
//         to a stream file.  This is due to an out of space condition.  
//         The additional information shows how many bytes were not written.
// *Action: Check that there is enough space left on the device to
//          write the requested number of bytes.
/
48114, 00000, "error encountered when attempting to close a file"
// *Document: YES
// *Cause: There was an error encountered when attempting to close
//         a file with the ADR file interface.
// *Action: Check the validity of the file descriptor.
/
48115, 00000, "error encountered while seeking a file position"
// *Cause: There was an error encountered while seeking a position
//         in a file.
// *Action: Check that the requested file position falls within the
//          file boundaries.
/
48116, 00000, "error enountered when attempting to create a directory [%s]"
// *Cause: There was an error encountered when attempting to
//         create a directory.
// *Action: Check the directory name.
/
48117, 00000, "error encountered when attempting to remove a directory [%s]"
// *Cause: There was an error encountered when attempting to
//         remove a directory.
// *Action: Check the directory name.
/
48118, 00000, "error encountered with list directory [%s]"
// *Cause: There was an error with listing the elements of a directory.
// *Action: Check the state of the operating system.
/
48119, 00000, "error encountered when attempting to remove a file [%s] [%s]"
// *Cause: There was an error encountered when attempting to remove
//         a file with the ADR file interface.
// *Action: Check the directory name and file name.
/
48120, 00000, "error encountered when attempting to retrieve the file size [%s] [%s]"
// *Cause: There was an error encountered when attempting to retrieve
//         the file size with the ADR file interface.
// *Action: Check the directory name and file name.
/
48121, 00000, "error with opening the ADR stream file [%s] [%s]"
// *Cause: An error was encountered when attempting to open an 
//         ADR stream file.
// *Action: Check the rest of the error stack for details of the 
//          actual error that was encountered.
/
48122, 00000, "error with opening the ADR block file [%s] [%s]"
// *Cause: An error was encountered when attempting to open an 
//         ADR block file.
// *Action: Check the rest of the error stack for details of the 
//          actual error that was encountered.
/
48123, 00000, "error encountered when attempting to flush a file"
// *Cause: There was an error encountered when attempting to flush
//         a file with the ADR file interface.
// *Action: Check the state of the file.
/
48124, 00000, "device full encountered during write to a file"
// *Cause: The device full error was encountered during the write to a file.
// *Action: Check the amount of free space on the device.
/
48125, 00000, "illegal identifier length, argn:%s, len:%s, lim:%s"
// *Cause: An input identifier was passed in that has a length that is
//         greater than the max length.
// *Action: Make sure the input indentifier has a length that is less
//          than the max length.
/
48126, 00000, "attempting to create a file that already exists"
// *Cause: The client attempted to create a file that already exists.
// *Action: Either remove the file or check if it is okay if the file
//          already exists.
/
48127, 00000, "attempting to open a file that does not exist"
// *Cause: An attempt was made to open a file that does not exist.
// *Action: Either create the file or check why the file does not exist.
/
48128, 00000, "opening of a symbolic link is disallowed"
// *Cause: An error was encountered when attempting to open a file that is 
//         a symbolic link.  Users are not allowed to open symbolic links.
// *Action: Check the specified file name.
/
48129, 00000, "invalid input for the full path specification"
// *Cause: Input was incorrectly specified for the full path specification,
//         or the default extension may have been incorrectly specified.
//         Or an empty string was passed in for the full path.
// *Action: Check that the full path string is non-NULL.
//          If you want to specify a relative path from ADR Home for the 
//          full path specification, then use '<ADR_HOME>' instead of the
//          actual path to ADR Home. For ADR Base, use '<ADR_BASE>'.
/
48130, 00000, "invalid lock parameters for get file lock [%s]"
// *Cause: Invalid lock parameters passed in for the get file lock routine.
//         The user must pass in file as the lock type. Or, there is a lock
//         mode mismatch.  Exclusive locks are not allowed in read-only mode, 
//         and shared locks are not allowed in write-only mode.
// *Action: Check that correct lock type is specified and that the correct 
//          lock mode is requested for the file given its open flags.
/
48131, 00000, "error encountered when attempting to tell the file position"
// *Cause: An error was encountered when attempting to tell the file
//         position using the ADR file interface.
// *Action: Check the directory and file name of the file along with the
//          open state.
/
48132, 00000, "requested file lock is busy, [%s] [%s]"
// *Cause: The requested file lock is busy because another process is 
//         holding the file lock.
// *Action: Try to get the file lock again at a later time.
/
48133, 00000, "file descriptor has already been opened [%s] [%s]"
// *Cause: The specified file descriptor has already been opened.
// *Action: Do not open a file that has previously been opened, or check
//          your code to make sure you are cleaning up a file descriptor
//          that is being reused correctly.
/
48134, 00000, "invalid file descriptor state for operation, %s, %s, %s"
// *Cause: The state of the file descriptor was invalid for the requested
//         operation.  An example is that a file was opened for read,
//         but a write operation to the file was requested.
// *Action: Check the state of the file descriptor and make sure it 
//          matches the operation.
/
48135, 00000, "uninitialized file descriptor"
// *Cause: The specified file descriptor is uninitialized.
// *Action: Make sure the file descriptor is initialized before passing
//          it into the routine.
/
48136, 00000, "directory already exists [%s]"
// *Cause: Operation failed because the specified directory already exists.
// *Action: Remove the directory or ignore this error.
/
48137, 00000, "uninitialized file handle"
// *Cause: The specified file handle is uninitialized.
// *Action: Make sure the file handle is initialized before passing
//          it into the routine.
/
48138, 00000, "invalid directory name input for client address"
// *Cause: An invalid directory name was specified as part of the 
//         address path specification.
// *Action: Check that the directory name is non-NULL and that the 
//          directory name length does not exceed the maximum length.
/
48139, 00000, "invalid input to ADR initialization routine"
// *Cause: There was an invalid input to the ADR initialization routine.
// *Action: Check the length of the ADR base, product ID, and instance 
//          ID input arguments.
/
48140, 00000, "the specified ADR Base directory does not exist [%s]"
// *Cause: The specified ADR Base Directory does not exist.
// *Action: Check that the specified ADR Base Directory is a valid path
//          name and that the directory exists.
/
48141, 00000, "error creating directory during ADR initialization [%s]"
// *Cause: Error encountered when creating a directory during the 
//         initialization of the ADR subsystem.
// *Action: Check the input arguments to the ADR initialization routine
//          and the state of the operating system.
/
48142, 00000, "invalid permissions input for change permissions"
// *Cause: Invalid permissions passed into change permissions routine.
// *Action: Check the value of the permissions input.
/
48143, 00000, "error changing permissions for a file"
// *Cause: Error encountered while changing the permissions for a file
// *Action: Check the specified directory and file and the state of 
//          the operating system.
/
48144, 00000, "error encounted while performing standard file I/O"
// *Cause: Error encountered while performing standard file I/O
// *Action: Check the validity of standard in, out, and error.
/
48145, 00000, "invalid seek location, [%s], [%s]"
// *Cause: Invalid seek location specified for routine.
// *Action: Check the validity of specified seek location.
/
48146, 00000, "missing read, write, or exec permission on directory during ADR initialization [%s] [%s]"
// *Cause: Error encountered when checking if the process has read, write,
//         and exec privileges on directories needed by the ADR subsystem.
//         This error occurs during the initialization of the ADR subsystem.
// *Action: Check the input arguments to the ADR initialization routine
//          and the state of the operating system.  Ensure that the user
//          has the proper permissions on the ADR directories.
/
48147, 00000, "invalid home location specification for ADR, [%s], [%s], [%s]"
// *Cause: Invalid read or write home location specification for ADR. 
// *Action: An invalid home was specified for the ADR Read or Write 
//          Home location.
/
48148, 00000, "error encountered when attempting to move a file"
// *Cause: There was an error encountered when attempting to move
//         a file with the ADR file interface.
// *Action: Check the directory name and file name.
/
48149, 00000, "error encountered when attempting to copy a file"
// *Cause: There was an error encountered when attempting to copy
//         a file with the ADR file interface.
// *Action: Check the directory name and file name.
/
48150, 00000, "error encountered with set current working directory"
// *Cause: There was an error with setting the current working directory.
// *Action: Check the path used, or the state of the operating system.
/
48151, 00000, "error getting operating system time for a file"
// *Cause: Error encountered while getting the operating system time for a 
//         file.
// *Action: Check the specified directory and file and the state of 
//          the operating system.
48152, 00000, "lock table is full"
// *Cause: Lock table is full - too many locks granted
// *Action: Try again later
/
48153, 00000, "error encountered when getting ADR base directory default"
// *Cause: There was an error encountered when attempting to get
//         the ADR base directory default value.
// *Action: Check your environment to see if the $ORACLE_BASE and 
//          $ORACLE_HOME environment variables are set.
/
48154, 00000, "reached end of file for alert log"
// *Cause: The end of file was reached for reading the Alert Log.  There
//         are no more messages to read in the Alert Log.
// *Action: Do not read from the Alert Log
/
48155, 00000, "error encountered when read alert log [%s]"
// *Cause: There was an error encountered when attempting to read
//         a message from the Alert Log.
// *Action: Check the error message and the contents of the alert message.
/
48156, 00000, "Alert log purge has occurred - retry operation"
// *Cause: The purge of the alert log has occurred.
// *Action: Retry the operation.
/
48157, 00000, "null input to ADR initialization"
// *Cause: There was an null input to the ADR initialization routine.
// *Action: Check the ADR base, product ID, and instance ID input arguments.
/
48158, 00000, "invalid input for ADR base directory"
// *Cause: An invalid input was passed in for the ADR base directory name.
//         The ADR base directory name is either NULL or too long of a string.
// *Action: Check the ADR base directory input argument.
/
48159, 00000, "invalid input for ADR product type"
// *Cause: An invalid input was passed in for the ADR product type.
//         The ADR product type is out of bounds.
// *Action: Check the ADR product type input argument.
/
48160, 00000, "invalid input for ADR product id"
// *Cause: An invalid input was passed in for the ADR product id.
//         The ADR product id is either NULL or too long of a string.
// *Action: Check the ADR product id input argument.
/
48161, 00000, "invalid input for ADR instance id"
// *Cause: An invalid input was passed in for the ADR instance id.
//         The ADR instance id is either NULL or too long of a string.
// *Action: Check the ADR instance id input argument.
/
48162, 00000, "string buffer too small to hold input, [%s], [%s], [%s]"
// *Cause: The string buffer is too small to copy an input string
//         into.
// *Action: Check the size of the string buffer and the input string.
//          Look in the argument for the location in the code where the
//          error occurs.
/
48163, 00000, "error concatenating directory onto path, [%s], [%s], [%s]"
// *Cause: Error encountered while concatenating a directory onto 
//         a path name.
// *Action: Check the error returned by the OS and the size of the input
//          and output buffers.
/
48164, 00000, "error concatenating file onto path, [%s], [%s], [%s]"
// *Cause: Error encountered while concatenating a directory onto 
//         a path name.
// *Action: Check the error returned by the OS and the size of the input
//          and output buffers.
/
48165, 00000, "user missing read, write, or exec permission on specified ADR Base directory [%s]"
// *Cause: The specified ADR Base Directory does not have the correct
//         permissions.
// *Action: Check the read, write, and exec permissions on the specified 
//          ADR Base Directory
/
48166, 00000, "error with opening ADR block file because file does not exist [%s] [%s]"
// *Cause: An error was encountered with opening an ADR block file 
//         because the file does not exist.
// *Action: Check the existence of the ADR Block File.
/
48167, 00000, "invalid argument for checking ADR initialization"
// *Cause: Invalid arguments were specified for the routine to check
//         ADR initialization.
// *Action: Check the inputs to the ADR initialization routine.
/
48168, 00000, "the ADR sub-system is not initialized"
// *Cause: The ADR subsystem has not been initialized.  The requested
//         operation cannot be performed.
// *Action: Check the usage of the call to the ADR services.  The ADR
//          sub-system must be initialized for the call to work.
/
48169, 00000, "incorrect arguments to ADR deferred initialization"
// *Cause: There are incorrect arguments to the ADR deferred initialization.
// *Action: Check the input arguments.  It could be possible that
//          the product is not set up for deferred initialization.
/
48170, 00000, "unable to lock file - already in use"
// *Cause:  the file is locked by another process, indicating that it is
//          currently in use by another process
// *Action: determine which process legitimately owns this file.
/
48171, 00000, "unable to get share lock - file not readable"
// *Cause:  share lock request was made on a file not open for read access.
// *Action: file must be open read-only or read-write to get a share lock.
/
48172, 00000, "unable to find a valid ADR base"
// *Cause:  Unable to find a valid ADR base.  We tried the ORACLE_BASE, 
//          ORACLE_HOME, home, and tmp directories, but none of the 
//          directories exist for read/write access.
// *Action: Check the validity of the ORACLE_BASE, ORACLE_HOME, home,
//          and tmp directories.
/
48173, 00000, "error checking directory existence during ADR initialization [%s]"
// *Cause: Error encountered when checking directory existence during the 
//         initialization of the ADR subsystem.  Either the diag or product
//         type directory does not exist underneath the ADR base.
// *Action: The directory in the error message must exist in order for
//          ADR initialization to succeed.  Make sure the directories exist.
/
48174, 00000, "error encountered with get current working directory"
// *Cause: There was an error with getting the current working directory.
// *Action: Check the state of the operating system or the size of the
//          path buffer.
/
48175, 00000, "the path name must not contain the string '..'."
// *Cause:  The specified path name contains '..'.
// *Action: Correct the path name and retry the operation.
/
48176, 00000, "error translating a path name into its full path name"
// *Cause:  An error was encountered when translating a path name into
//          its full path name.  
// *Action: Check the inputted path name to make sure it is a valid
//          relative path.
/
48177, 00000, "file name with full path information [%s] not allowed" 
// *Cause: Input was incorrectly specified for the file name.
//         The inputted file name is greater than the maximum length, or 
//         the file name has path information. In this case, the file name
//         should not have any path information. The path information should
//         be specified in a separate argument.
// *Action: Check that the string for the file name is not too long 
//          and does not have path information.
/
48178, 00000, "error encountered while reading an ADR block file during ADR initialization [%s]" 
// *Cause: An error was encountered while reading an ADR block file during
//         the initialization of the ADR subsystem.
// *Action: Check the state of the file system.
/
48179, 00000, "OS file synchronization failure"
// *Cause: OS command to synchronize the changes to a file with the operating
//         system failed.
// *Action: Check the state of the file system and the amount of free space
//          left on your device.
/
/////////////////////////////////////////////////////////////////////////////
/ 48180 - 48199 are reserved for ADS OSD layer
/////////////////////////////////////////////////////////////////////////////
48180, 00000, "OS open system call failure"
// *Cause:  OS open system call failed. The system failed to open or create
//          a file in the requested mode.
// *Action: Check the OS error code
/
48181, 00000, "OS write system call failure"
// *Cause:  OS write system call failed. The system failed to write to
//          a file.
// *Action: Check the OS error code
/
48182, 00000, "OS read system call failure"
// *Cause:  OS read system call failed. The system failed to read to
//          a file.
// *Action: Check the OS error code
/
48183, 00000, "OS close system call failure"
// *Cause:  OS close system call failed. The system failed to close
//          a file.
// *Action: Check the OS error code
/
48184, 00000, "OS seek system call failure"
// *Cause:  OS seek system call failed. The system failed to seek to
//          a position in a file.
// *Action: Check the OS error code
/
48185, 00000, "OS file size system call failure"
// *Cause:  OS file size call failed. The system failed to retrieve
//          the file size for a file.
// *Action: Check the OS error code
/
48186, 00000, "OS check file exists system call failure"
// *Cause:  OS check file exists system call failed. The system failed to 
//          perform the check file exists command for a file.
// *Action: Check the OS error code
/
48187, 00000, "specified directory does not exist"
// *Cause:  The specified directory does not exist.
// *Action: Check the directory name.
/
48188, 00000, "user missing read, write, or exec permission on specified directory"
// *Cause:  The user does not have valid permissions on the specified 
//          directory.  The user is missing either the read, write, or
//          execute permission.
// *Action: Check the permissions of the specified directory.
/
48189, 00000, "OS command to create directory failed"
// *Cause:  The OS command to create a directory failed.
// *Action: Check the error number associated with the create directory
//          failure.
/
48190, 00000, "OS unlink system call failure"
// *Cause: OS unlink system call failed. The system failed to perform
//         unlink on the specified file.
// *Action: Check the OS error code
/
48191, 00000, "user missing read or write permission on specified file"
// *Cause:  The user does not have valid permissions on the specified 
//          file.  The user is missing either the read or write permission.
// *Action: Check the permissions of the specified file.
/
48192, 00000, "OS command to move a file failed"
// *Cause:  The OS command to move a file failed.
// *Action: Check the error number associated with the move file.
/
48193, 00000, "OS command to open a directory failed"
// *Cause: The OS command to open a directory failed.
// *Action: Check the OS error associated with the open directory failure.
/
48194, 00000, "OS command to close a directory failed"
// *Cause: The OS command to close a directory failed.
// *Action: Check the OS error associated with the close directory failure.
/
48195, 00000, "OS command to remove a directory failed"
// *Cause: The OS command to remove a directory failed.
// *Action: Check the OS error associated with the remove directory failure.
/
48196, 00000, "OS command to release advisory lock failed"
// *Cause:  The OS command to release the advisory lock failed
// *Action: Check the OS error associated with the release advisory lock
//          failure.
/
48197, 00000, "OS command to get the file status failed"
// *Cause:  The OS command to get the file status failed.  This could be
//          because the file is not open or file descriptor is invalid.
// *Action: Check the OS error associated with the get file status failure.
/
48198, 00000, "OS command to change the file permissions failed"
// *Cause:  The OS command to change the file permissions failed.
// *Action: Check the OS error associated with the failure.
/
48199, 00000, "OS command to copy a file failed"
// *Cause:  The OS command to copy a file failed.
// *Action: Check the error number associated with the copy file.
/
/////////////////////////////////////////////////////////////////////////////
/ 48200 - 48299 are reserved for AMS layer
/////////////////////////////////////////////////////////////////////////////
48200, 00000, "Illegal Input Argument [%s]"
// *Document: YES
// *Cause:  An illegal argument was passed in.
// *Action: Fix the call.
48201, 00000, "Field Length Exceeds Maximum [%s] [%s] [%s]"
// *Document: YES
// *Cause:  An illegal field length was used.
// *Action: Fix the call.
48202, 00000, "Illegal Identifier [%s] [%s]"
// *Document: YES
// *Cause: Illegal identifier specified.
// *Action: Use a valid identifier.
48203, 00000, "Illegal Data Type [%s]"
// *Document: YES
// *Cause: Illegal data type specified.
// *Action: Use a valid data type.
48204, 00000, "Illegal Identifier Length [%s] [%s] [%s]"
// *Document: YES
// *Cause: The input identifier is too long.
// *Action: Specify a shorter identifier.
48205, 00000, "Record Length too Big [%s] [%s] [%s]"
// *Document: YES
// *Cause: The sum of the maximum lengths of all fields exceeds the maximum
//         record length that is supported.
// *Action: Remove or shorten some of the fields.
48206, 00000, "Ilegal Number of Fields [%s] [%s] [%s]"
// *Document: YES
// *Cause: The number of fields specified exceeds the supported maximum.
// *Action: Remove some of the fields in the relation.
48207, 00000, "Illegal Field Name [%s]"
// *Document: YES
// *Cause: The field name is invalid.
// *Action: Specify a valid field name.
48208, 00000, "Duplicate Field Names [%s]"
// *Document: YES
// *Cause: The list of fields specified contains a duplicate field.
// *Action: Remove the duplicate field.
48209, 00000, "Relation Already Exists"
// *Document: YES
// *Cause: The relation already exists.
// *Action: Remove the relation.
48210, 00000, "Relation Not Found"
// *Document: YES
// *Cause: The relation was not found.
// *Action: Either specify a valid relation name or create one with that name.
48211, 00000, "Illegal Access Mode [%s] [%s]"
// *Document: YES
// *Cause: The supplied access mode is not recognized.
// *Action: Supply a valid mode.
48212, 00000, "Open Record Access Not Done"
// *Document: YES
// *Cause: The open record access call was not performed.
// *Action: The open record access call is required before attempting this
//          call.
48213, 00000, "Incorrect Access Mode for Operation [%s] [%s]"
// *Document: YES
// *Cause: The relation was opened in a mode not compatibile with the
//         attempted operation being done.
// *Action: Reopen the relation in the correct mode.
48214, 00000, "Sequence Overflow [%s] [%s] [%s]"
// *Document: YES
// *Cause: The sequence number will exceed the system maximum.
// *Action: Reset the sequence number.
48215, 00000, "Sequence Invalid Operation [%s] [%s]"
// *Document: YES
// *Cause: The specified sequence operation is not valid.
// *Action: Specify a valid operation.
48216, 00000, "Field Len Exceeds Max Field Length [%s] [%s] [%s] [%s]"
// *Document: YES
// *Cause: The field length specified exceeds the defined maximum for the
//         field.
// *Action: Supply a smaller field length.
48217, 00000, "Out of Space on Device"
// *Document: YES
// *Cause: The storage subsystem is out of space.
// *Action: Add more space to the storage subsystem.
48218, 00000, "Duplicate Key Name [%s] [%s]"
// *Document: YES
// *Cause: The key name already exists.
// *Action: Specify a different key name.
48219, 00000, "Key Name Doesn't Match Any Existing Key"
// *Document: YES
// *Cause: The key name provided doesn't match an existing key.
// *Action: Specify a key name that exists.
48220, 00000, "Too Many Keys Defined [%s] [%s]"
// *Document: YES
// *Cause: A key is trying to be created that exceeds the maximum number
//         of keys supported.
// *Action: Drop another key.
48221, 00000, "Key Exceeds Maximum Allowed Length [%s] [%s] [%s]"
// *Document: YES
// *Cause: The sum of the lengths of the fields in the key exceeds the
//         maximum length supported.
// *Action: Remove one or more fields from the key.
48222, 00000, "Predicates/Order By Not Allowed"
// *Document: YES
// *Cause: A predicate or order by can not be added after fetch has started.
// *Action: Put the predicate or order by call before the first fetch.
48223, 00000, "Interrupt Requested - Fetch Aborted - Return Code [%s] [%s]"
// *Document: Yes
// *Cause: User interrupt has occurred.
// *Action: None
48224, 00000, "DDL has occurred since parse - reparse [%s] [%s] [%s]"
// *Document: YES
// *Cause: Another session has performed a DDL (i.e. add field, create key,
//         drop key) that prevents this session from being to continue.
// *Action: Call open record access again.
48225, 00000, "No More Space in Order By Buffer"
// *Document: YES
// *Cause: The order by buffer size is not sufficient for the number of rows.
// *Action: Increase the order by buffer size specified.
48226, 00000, "No Fetch in Progress"
// *Document: YES
// *Cause: An attempt to perform update or delete has occurred without a fetch.
// *Action: You must first perform a fetch.
48227, 00000, "Invalid Relation File - [%s] [%s] [%s] [%s]"
// *Document: YES
// *Cause: The AMS file is invalid or corrupt.
// *Action: Do a repair relation
48228, 00000, "Missing Define Call [%s]"
// *Document: YES
// *Cause: A call to define was not performed before doing a fetch.
// *Action: Call the define service before fetch.
48229, 00000, "Invalid Relation Handle Provided [%s] [%s]"
// *Document: YES
// *Cause: An invalid or corrupt relation handle was used.
// *Action: Possible memory corruption.
48230, 00000, "Expression arguments must match types"
// *Document: YES
// *Cause: Incorrect type semantics for fields in the predicate.
// *Action: Correct the predicate.
48231, 00000, "Predicate syntax error"
// *Document: YES
// *Cause: A syntax error exists in the predicate string.
// *Action: Correct the predicate.
48232, 00000, "Debug command syntax error [%s]"
// *Document: YES
// *Cause: An invalid debug command has been specified.
// *Action: Correct the debug command.
48233, 00000, "Invalid Field Handle [%s] [%s] [%s]"
// *Document: Yes
// *Cause: The field handle is invalid.
// *Action: Possible memory corruption.
48234, 00000, "Create Field of Field Name [%s] Failed"
// *Document: No
// *Cause: 
// *Action:
48235, 00000, "Operation [%s] on Relation [%s] Failed"
// *Document: No
// *Cause:
// *Action:
48236, 00000, "Operation [%s] on Relation [%s] Field [%s] Failed"
// *Document: No
// *Cause:
// *Action:
48237, 00000, "Operation [%s] on Relation [%s] Key [%s] Failed"
// *Document: No
// *Cause:
// *Action:
48238, 00000, "Invalid Surrogate Length Specified [%s] [%s]"
// *Document: Yes
// *Cause: An invalid length during create field was specified
// *Action: Specify a correct length
48239, 00000, "Invalid Predicate Handle Provided [%s] [%s]"
// *Document: YES
// *Cause: An invalid or corrupt relation handle was used.
// *Action: Possible memory corruption.
48240, 00000, "Field is NOT NULL but NULL value supplied"
// *Document: YES
// *Cause: A field [%s] declared to not allow nulls contains a null value.
// *Action: Specify a correct value
48241, 00000, "File is at wrong version [file = %s] [current = %s]"
// *Document: NO
// *Cause: The file version doesn't match the current version.
// *Action: Drop and recreate the relation
48242, 00000, "Fields that are NOT NULL can not use surrogates"
// *Document: YES
// *Cause: NOT NULL fields can not have surrogates specified.
// *Action: Either remove the constraint or the surrogate.
48243, 00000, "Additional Fields must be declared nulls allowed"
// *Document: YES
// *Cause: A field can not be added to a relation that is defined NOT NULL
// *Action: Do not specify NOT NULL
48244, 00000, "Purge for Retention can't be called while in an Query"
// *Document: YES
// *Cause: A query is already running - purge for retention can't be invoked
// *Action: Fix call sequence
48245, 00000, "Attempt to Update/Delete when at EOF"
// *Document: Yes
// *Cause: The fetch operation is positioned at EOF - can not update/delete
// *Action: Do not call update/delete after fetch has returned EOF
48246, 00000, "Illegal Operation on External Relation"
// *Document: Yes
// *Cause: An illegal call was made using an external relation
// *Action: Do not perform the API Call
48247, 00000, "Predicate Conversion Error %s"
// *Document: YES
// *Cause: A time conversion failed
// *Action: Fix the input
48248, 00000, "Function %s type check error; ityp = %s typ = %s arg = %s"
// *Document: YES
// *Cause: Invalid inputs to the specified function
// *Action: Change the inputs
48249, 00000, "Type mismatch - lhs = %s, rhs = %s, result = %s, op = %s"
// *Document: NO
// *Cause: More documentation on type mismatch
// *Action: Adjust predicate inputs
48250, 00000, "Details: %s"
// *Document: NO
// *Cause: Syntax error
// *Action: Fix the syntax error
48251, 00000, "Failed to open relation due to following error"
// *Document: YES
// *Cause: See error below in the error stack
// *Action: See error below in the error stack
48252, 00000, "Relation does not require migration"
// *Document: YES
// *Cause: Relation on disk is compatible with the current code
// *Action: Don't run the migration services
48253, 00000, "Relation Being Migrated - Can't be opened"
// *Document: NO
// *Cause: Migration in progress
// *Action: Wait till migration finishes
48254, 00000, "Migration Error [%s] [%s] [%s] [%s] [%s] [%s]"
// *Document: NO
// *Cause: Migration Failure - Internal error
// *Action: Migration Failure - Internal error
48255, 00000, "Changes not supported on relations opened read-only"
// *Document: NO
// *Cause: Relation was opened as a not-on-disk relation
// *Action: Can't make changes to this relation
48256, 00000, "Having by not allowed"
// *Document: NO
// *Cause: No group by specified
// *Action: Add a group by clause before adding a having by
48257, 00000, "Grouping function (%s) used - but no group by specified"
// *Document: NO
// *Cause: Group functions require group by clause
// *Action: Add a group by clause
48258, 00000, "AMS Corrupt Page Found - Rebuild Relation"
// *Document: YES
// *Cause: A corrupted page has been found.
// *Action: Do a rebuild of the relation
48259, 00000, "AMS Relation not Created Correctly"
// *Document: YES
// *Cause: Create relation failed
// *Action: Recreate the relation
48260, 00000, "Function %s not found"
// *Document: YES
// *Cause: A reference to a function that is not valid was found
// *Action: Fix the function name
48261, 00000, "Grouping Function %s not allowed in a having clause"
// *Document: NO
// *Cause: A grouping function was used in a having clause incorrectly
// *Action: Fix the having clause
48262, 00000, "Sequence references not allowed in predicates"
// *Document: YES
// *Cause: References to currval or nextval not allowed
// *Action: Remove these references
48263, 00000, "Currval not set yet - use nextval"
// *Document: YES
// *Cause: References to currval can't occur until a nextval is done
// *Action: Remove the reference
48264, 00000, "Internal Application Function Failure"
// *Document: NO
// *Cause:
// *Action:
48265, 00000, "Incorrect number of arguments (%s) provided - expected (%s)"
// *Document: YES
// *Cause: Number of arguments to function is incorrect
// *Action: Specify the correct number of arguments
48290, 00000, "Xaction Control General Fault"
// *Document: NO
// *Cause: See error in the error stack
// *Action:
48291, 00000, "Field name %s can't be unique resolved"
// *Cause: Field name appears in more than one relation
// *Action: Prefix the field name with the relation name

48292, 00000, "Can't use outer join syntax mixed with inner join syntax"
// *Cause: The join condition was specified using both inner and outer join elements"
// *Action: Specify the join condition correctly
48293, 00000, "Outer join syntax not allowed without a join"
// *Cause: Using outer join syntax in the predicate without doing a join
// *Action: Fix the predicate

/////////////////////////////////////////////////////////////////////////////
/ 48300 - 48389 are reserved for AMI layer
/////////////////////////////////////////////////////////////////////////////
48300, 00000, "Incident Record Already Exists"
// *Document: YES
// *Cause: trying to create an incident that already exists
// *Action: retry operation with new incident ID

48301, 00000, "An Invalid Incident ID was specified"
// *Document: YES
// *Cause: the specified incident ID was invalid
// *Action: retry operation with correct incident ID

48302, 00000, "Incident Directory does not exist"
// *Document: YES
// *Cause: the incident directory was not found
// *Action: retry operation with a different incident ID

48303, 00000, "Exceeded max Incident Sequence Value"
// *Document: YES
// *Cause: the maximum supported incident sequence value was exceeded
// *Action: reset incident sequence and retry operation

48304, 00000, "incident staging file not found"
// *Document: YES
// *Cause: the incident staging file is missing
// *Action: retry with a different incident ID

48305, 00000, "incident ID range is too large"
// *Document: YES
// *Cause: the maximum incident sequence value was exceeded
// *Action: retry operation with a smaller range

48308, 00000, "Illegal input parameter: [prm = %s] [pos = %s]"
// *Document:  NO
// *Cause: the input parameter is wrong
// *Action: retry operation with correct parameter

48309, 00000, "illegal incident state transition, [%s] to [%s]"
// *Document: YES
// *Cause: the incident cannot be moved to the new state
// *Action: retry operation with a valid incident status

48310, 00000, "Incident %s staging file not found"
// *Document: YES
// *Cause: the incident staging file does not exist
// *Action: retry operation with a valid incident ID

48311, 00000, "Invalid field name [%s]"
// *Document: YES
// *Cause: the specified field name is invalid
// *Action: retry operation with a valid field name

48312, 00000, "Sweep incident %s staging file failed"
// *Document: YES
// *Cause: the sweep action of incident staging file failed
// *Action: check the incident ID and retry

48313, 00000, "Updates not allowed on ADR relation [%s] of Version=%s"
// *Document: YES
// *Cause: Update operations not supportd on this version of ADR relation
// *Action: check ADR version and retry
48314, 00000, "Invalid ADR Control parameter [%s]"
// *Document: YES
// *Cause: the specified control parameter is invalid
// *Action: check parameter and reissue command

48315, 00000, "ADR unavailable"
// *Document: YES
// *Cause: the ADR directory is not available
// *Action: enable ADR and retry operation

48316, 00000, "relation [%s] unavailable or cannot be created"
// *Document: YES
// *Cause: the ADR relation is not available
// *Action: check ADR directory and retry operation

48317, 00000, "ADR Relation [%s] of version=%s is obsolete"
// *Document: YES
// *Cause: the version of ADR relation is too old and not supported
// *Action: check the ADR version and retry

48318, 00000, "ADR Relation [%s] of version=%s cannot be supported"
// *Document: YES
// *Cause: the version of ADR relation is too new and cannot be supported
// *Action: need to use a newer release to access the ADR

48319, 00000, "Update operation on ADR relation [%s] not allowed"
// *Document: YES
// *Cause: updates to foreign ADR relation cannot be supported
// *Action: verify ADR location and reissue command

48320, 00000, "Too many incidents to report"
// *Document: YES
// *Cause: the result set of incidents is too large to handle
// *Action: use a predicate to reduce the number of incidents and retry

48321, 00000, "ADR Relation [%s] not found"
// *Document: YES
// *Cause: the required ADR relation is missing, ADR may be corrupted
// *Action: check ADR directory and retry

48322, 00000, "Relation [%s] of ADR V[%s] incompatible with V[%s] tool"
// *Document: YES
// *Cause: the tool version is incompatible with the ADR version
// *Action: use another version of tool and retry

48323, 00000, "Specified pathname [%s] must be inside current ADR home"
// *Document: YES
// *Cause: file outside of ADR home not allowed as incident file
// *Action: check the file name and retry

48324, 00000, "Incompatible staging file encountered"
// *Document: YES
// *Cause: sweep incident failed because staging file is incompatible
// *Action: check the incident ID and version of ADR and retry

48325, 00000, "Staging File Validation Error [%s] line [%s]"
// *Document: NO
// *Cause: staging file is not compliant to the xsd
// *Action: none
48326, 00000, "Illegal Staging File Type %s"
// *Document: NO
// *Cause: staging file type is invalid
// *Action: none
48327, 00000, "Illegal Staging Status Type %s"
// *Document: NO
// *Cause: staging status type is invalid
// *Action: none
48328, 00000, "View already exists - use replace option"
// *Document: NO
// *Cause: View already exists
// *Action: Use Create or Replace
48329, 00000, "Create View Fails with the following errors"
// *Document: NO
// *Cause: See errors below
// *Action: See errors below
48330, 00000, "Expected Clause (%s) not found"
// *Document: NO
// *Cause: Expected syntax element not found
// *Action: Adjust statement
48331, 00000, "Views only allowed %s relations to be specified"
// *Document: NO
// *Cause: Too many relations specified
// *Action: Specify fewer relations
48332, 00000, "invalid relation-field name [%s] in select list"
// *Document: NO
// *Cause: the length of the field name is too long
// *Action: verify field name and reissue command
48333, 00000, "select field name [%s] not found"
// *Document: NO
// *Cause: the name specified in the select list does not exist
// *Action: verify field name and reissue command
48334, 00000, "ambiguous select field name [%s] found"
// *Document: NO
// *Cause: more than one possible target field found for select list
// *Action: verify field name and reissue command
48335, 00000, "illegal function reference to more than one field [%s], relation [%s]"
// *Document: NO
// *Cause: references to more than one row source and field detected
// *Action: verify field name for function and reissue command
48336, 00000, "missing Alias name for function column [%s]"
// *Document: NO
// *Cause: function column must be accompanied by an alias name
// *Action: verify field name and reissue command
48338, 00000, "Invalid function argument"
// *Document: NO
// *Cause: an invalid argument was specified for a function
// *Action: Fix the input arguments
48339, 00000, "view [%s] does not exist"
// *Document: YES
// *Cause: view has not been created
// *Action: verify view name and reissue command
48340, 00000, "operation not supported on view [%s]"
// *Document: YES
// *Cause: unsupported (dml) operation on views
// *Action: verify relation name and reissue command
48341, 00000, "Field [%s] not a grouping field"
// *Document: YES
// *Cause: the field name specified is not a grouping field
// *Action: verify field names and groupby clause and reissue command
48342, 00000, "Field [%s] cannot be mixed with %s fields"
// *Document: YES
// *Cause: the specified field is incompatible with other grouping fields
// *A8ction: verify this and other field names and reissue command
48343, 00000, "invalid field [%s] reference in %s clause"
// *Document: YES
// *Cause: the specified field in the specified clause is invalid
// *Action: verify this field name and reissue command
48344, 00000, "Invalid Name [%s] specified"
// *Document: YES
// *Cause: Either the name refers to an existing object or violates the
//         reserved namespace rules.
// *Action: Pick another name
/////////////////////////////////////////////////////////////////////////////
/ 48390 - 48389 are reserved for ADM layer
/////////////////////////////////////////////////////////////////////////////
48390, 00000, "Too many fields"
// *Document: NO
// *Cause: Too many fields being added
// *Action: Use less fields
48391, 00000, "Field %s not found in object"
// *Document: NO
// *Cause: Field is not part of the relation
// *Action: Use the proper field name
48392, 00000, "Field (%s) conversion error - type %s value %s"
// *Document: NO
// *Cause: Invalid input for the type of field
// *Action: Fix the inputted value
48393, 00000, "Field (%s) exceeds maximum length of %s"
// *Document: NO
// *Cause: Invalid input for the type of field
// *Action: Fix the inputted value
48394, 00000, "Field (%s) is declared as NOT NULL"
// *Document: NO
// *Cause: Field contains a null value
// *Action: Fix the inputted value
48395, 00000, "Incident Range Function Only Available on Dual"
// *Document: NO
// *Cause: Must use dual with this function
// *Action: Use dual
48396, 00000, "Invalid range supplied - valid range is [%s.%s]"
// *Document: NO
// *Cause: Invalid range
// *Action: Fix input
48397, 00000, "Range must be a numeric constant"
// *Document: NO
// *Cause: Invalid range - must be a literal, not a field reference
// *Action: Use a literal

/////////////////////////////////////////////////////////////////////////////
/ 48400 - 48499 are reserved for ADV layer
/////////////////////////////////////////////////////////////////////////////
48400, 00000, "ADRCI initialization failed"
// *Document: YES
// *Cause:  The ADR Base directory does not exist
// *Action: Either create an ADR Base directory or point to an existing one
// *Comment:

48401, 00000, "SET command requires arguments"
// *Document: YES
// *Cause: No arguments are input for the SET command
// *Action: Input the arguments

48402, 00000, "Variable is not defined"
// *Document: YES
// *Cause: No substitution value is input. 
// *Action: Input the substitution value following after the variable name.

48403, 00000, "DEFINE or UNDEFINE command has no arguments"
// *Document: YES
// *Cause:DEFINE and UNDEFINE command need users to input the substitution
//        variable name.
// *Action: Input the vairable name follow after the DEFINE or UNDEFINE

48404, 00000, "RUN or @ command has no arguments"
// *Document: YES
// *Cause: RUN and @ commands need users to input script filename
// *Action: Input script filename after RUN and @ commands

48405, 00000, "The option in the command is invalid"
// *Document: YES
// *Cause: The option is not allowed in the command
// *Action: Check the command syntax

48406, 00000, "ECHO or TERMOUT status must be set to ON or OFF"
// *Document: YES
// *Cause: the status of ECHO ann TERMOUT commands must be ON or OFF
// *Action: input ON or OFF

48407, 00000, "DESCRIBE and QUERY commands need at least relation name argument"
// *Document: YES
// *Cause: This is no relation name is input as argument
// *Action: Need users to input at least the relation name

48408, 00000, "The incident number exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The input incident number exceeds the maximum number
// *Action: Input less incidents

48409, 00000, "The ADR homes exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The input ADR homes number exceeds the maximum number
// *Action: Input less ADR home string

48410, 00000, "The trace path exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The input trace path exceeds the maximum number
// *Action: Input less trace path

48411, 00000, "The trace files exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The input trace file path number exceeds the maximum number
// *Action: Input less trace file path

48412, 00000, "The parameters exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The input paramter number exceeds the maximum number
// *Action: Input less parameter number or increase the upper bound

48413, 00000, "The number of orderby fields exceeds maximum number [%s]"
// *Document: YES
// *Cause: The orderby field number exceeds the maximum number
// *Action: Input less fields

48414, 00000, "The string in the execution option exceeds maximum length [%s]"
// *Document: YES
// *Cause: The string length is too long
// *Action: Divid the commands into two sets or use adrci scripts.

48415, 00000, "Syntax error found in string [%s] at column [%s]"
// *Document: YES
// *Cause: Parsing error found in the user input string
// *Action: Validate the input string

48416, 00000, "Variable value [%s] must be single or doulbe quoted"
// *Document: NO
// *Cause:The variable value must be single or double quoted
// *Action:Check the variable name and single or double quoted the value

48417, 00000, "SHOW command needs arguments"
// *Document: NO
// *Cause: No arguments are input for SHOW command
// *Action: Input show command arguments

48418, 00000, "The variable [%s] is not defined"
// *Document: NO
// *Cause: The substitution vairable is not defined
// *Action: Define the variable before use it

48419, 00000, "Illegal arguments"
// *Document: YES
// *Cause: The input argument is illegal
// *Action: Check the input arguments and make sure it is not null

48420, 00000, "EXPORT command must have a relation name"
// *Document: NO
// *Cause: The relation name is not input as an arguments
// *Action: Input the relation name

48421, 00000, "Predicate string in the command must be single or double quoted"
// *Document: YES
// *Cause:The predicate string is not single or double quoted
// *Action:Put single or double quotes around the predicate string

48422, 00000, "Invalid relation field type [%s]"
// *Document: YES
// *Cause:
// *Action:

48423, 00000, "IMPORT command must have a filename"
// *Document: YES
// *Cause: File name is missing from the command
// *Action: Input the import file name after the IMPORT keyword

48424, 00000, "SHOW TRACE command needs argument"
// *Document: YES
// *Cause:SHOW TRACE command needs arguments
// *Action:Input arguments

48425, 00000, "ADRCI environment is not initialized"
// *Document: NO
// *Cause:
// *Action:

48426, 00000, "The initialization filename is too long"
// *Document: YES
// *Cause:The initialization filename length exceeds the maximum length
// *Action:This is really an internal setting parameter of the ADRCI, report
//         it as a bug. Alternatively move the initialization file to the
//         current working directory

48427, 00000, "Unknown command"
// *Document: YES
// *Cause:
// *Action:

48428, 00000, "Input command string exceeds max length [%s]"
// *Document: YES
// *Cause: The current command string is too long and exceeds the limit
// *Action: Input less characters

48429, 00000, "Variable name [%s] is an invalid identifier"
// *Document: YES
// *Cause: The substitution variable name is not a valid identifier
// *Action: Input the valid identifier defined by ADRCI

48430, 00000, "Cannot read the parameter"
// *Document: YES
// *Cause:
// *Action:

48431, 00000, "Must specify at least one ADR home path"
// *Document: YES
// *Cause: The command syntax requires at least one ADR home path to be input
// *Action: Check the command syntax and input the home path

48432, 00000, "The ADR home path [%s] is not valid"
// *Document: YES
// *Cause: The adr home user inputs is not valid, which may due to the path
//         does not exist.
// *Action: Check if the input home path exists

48433, 00000, "Unknown help topic"
// *Document: YES
// *Cause: The input topic is unknown
// *Action: Check if the topic is vaild

48434, 00000, "No DDE commands are input"
// *Document: YES
// *Cause: No DDE commands are input
// *Action: Input a DDE command

48435, 00000, "Input a trace file"
// *Document: YES
// *Cause: Show trace expects a trace file
// *Action: Input a trace file

48436, 00000, "File [%s] does not exist"
// *Document: YES
// *Cause: the file does not exist
// *Action: Validate the trace file name

48437, 00000, "No IPS commands are input"
// *Document: YES
// *Cause: No IPS commands are input
// *Action: Input a IPS command

48438, 00000, "[%s] is not a valid number"
// *Document: YES
// *Cause: The input number is not valid
// *Action: Check the input number

48439, 00000, "The input path name exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The input path name is too long
// *Action: Report as a bug to change the limit

48440, 00000, "Variable [%s] is already defined"
// *Document: YES
// *Cause: The variable name is defined previously
// *Action: Use another variable name

48441, 00000, "The function parameter number exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The function parameter number exceeds the maximum number
// *Action: Report it as bug to change the maximum number

48442, 00000, "The control parameter number exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The control parameter number exceeds the maximum number
// *Action: Report it as bug to change the maximum number

48443, 00000, "Trace Record type appears in the middle of the path"
// *Document: YES
// *Cause: The trace record cannot be in the middle of the path
// *Action: Validate the input

48444, 00000, "The single \".\" and \"*\" cannot appear in the middle of the path"
// *Document: YES
// *Cause: The single "." and "*" appears in the middle of the path
// *Action: Validate the input

48445, 00000, "Path expression only supports one bucket dump type"
// *Document: YES
// *Cause: The path expression only supports one bucket dump"
// *Action: Change the path expresison syntax

48446, 00000, "The command needs path input"
// *Document: YES
// *Cause: No path is input as a parameter
// *Action: Input the path

48447, 00000, "The input path [%s] does not contain any ADR homes"
// *Document: YES
// *Cause: The input path does not contain ADR homes
// *Action: Validate the path

48448, 00000, "This command does not support multiple ADR homes"
// *Document: YES
// *Cause: There are multiple homes in the current adr setting.
// *Action: Use command SET HOMEPATH to set a single home

48449, 00000, "Tail alert can only apply to single ADR home"
// *Document: YES
// *Cause: There are multiple homes in the current setting
// *Action: Use command SET HOMEPATH to set a single home

/
/ Help messages
/
48450, 1, "Syntax:\n"
48451, 2, "   adrci [-help] [-script script_filename]\n\n"
48452, 1, "Options      Description                     (Default)\n"
48453, 1, "-----------------------------------------------------------------\n"
48454, 1, "script       script file name                (None)           \n"
48455, 1, "help         help on the command options     (None)           \n"
48456, 1, "-----------------------------------------------------------------\n"

48457, 00000, "ADRCI core dumped"
// *Document: YES
// *Cause: It is adrci internal error. 
// *Action: Report to Oracle

48458, 00000, "\"show incident\" failed due to the following errors"
// *Document: YES
// *Cause: There could be a bug or users do not have the access permission 
// *Action: Report to Oracle if the errors are not due to ADR permission settings

48459, 00000, "\"describe\" command only supports one ADR home path"
// *Document: YES
// *Cause: Multiple ADR home paths in the command
// *Action: put one ADR home path

48460, 00000, "The home path [%s] is not valid"
// *Document: YES
// *Cause: The input home path is not valid home path 
// *Action: Verify the homepath

48461, 00000, "\"describe\" failed due to the following errors"
// *Document: YES
// *Cause: Underlying code failed 
// *Action: If it is not due to permission issue, report to Oracle

48462, 00000, "Fatal error encountered in [%s]"
// *Document: YES
// *Cause: Fatal error encountered
// *Action: Report to Oracle

48463, 00000, "The value buffer reached the maximum length [%s]"
// *Document: YES
// *Cause: The value buffer is full
// *Action: Report to Oracle

48464, 00000, "The predicate buffer reached the maximum length [%s]"
// *Document: YES
// *Cause: The predicate buffer is too small
// *Action: Report to Oracle

48465, 00000, "The specified type [%s] is undefined"
// *Document: YES
// *Cause: The purge type specified is undefined
// *Action: Check the type name

48466, 00000, "Internal failure, the report context is not initialized"
// *Document: YES
// *Cause: Internal problem failure.
// *Action: Report to Oracle

48467, 00000, "\"%s\" for the keyword \"%s\" is not a valid number"
// *Document: YES
// *Cause: The keyword value is not a valid number
// *Action: Check the value

48468, 00000, "\"%s\" is not a valid keyword"
// *Document: YES
// *Cause: The keyword is not defined for the command
// *Action: Check the available keywords

48469, 00000, "Keyword \"%s\" cannot be duplicated"
// *Document: YES
// *Cause: The command can only allow one key with the name
// *Action: Remove one keyword name from the command

48470, 00000, "Unknown \"%s\" command"
// *Document: YES
// *Cause: The command is not valild
// *Action: Use help manual to check the command syntax

48471, 00000, "\"%s\" is not a valid shell command"
// *Document: NO
// *Cause: The shell command is not valid
// *Action: Check the command

48472, 00000, "Invalid product name"
// *Document: YES
// *Cause: The product name provided does not exist
// *Action: Specify a product name, see HELP SHOW BASE

48473, 00000, "Internal failure, unknown return code [%s]"
// *Document: YES
// *Cause: Internal program failure
// *Action: Report to Oracle

48474, 00000, "Syntax error specifying product, must not be NULL"
// *Document: YES
// *Cause: The product clause is being used, but no product name is provided
// *Action: Supply the product name

48475, 00000, "[%s] is not a valid timestamp"
// *Document: YES
// *Cause: The input timstamp string is not in valid format
// *Action: None

48476, 00000, "Cannot write the results out to a file, please check if \nthe environment variable TMPDIR is set or the current directory is \nnot writable"
// *Document: YES
// *Cause: The current path may not be writable
// *Action: If the current path is writable, report to Oracle

48477, 00000, "The input path does not contain any valid ADR homes"
// *Document: YES
// *Cause: The input path does not contain any valid ADR homes
// *Action: Check the path if it is valid

48478, 00000, "No alert messages are created"
// *Document: YES
// *Cause: No alert messages are created
// *Action: No action

48479, 00000, "No HM runs are created"
// *Document: YES
// *Cause: There is no hm runs
// *Action: No action

48480, 00000, "No incidents are created"
// *Document: YES
// *Cause: There is no incident
// *Action: No action

48481, 00000, "Report is not available"
// *Document: YES
// *Cause: The requested report does not exist"
// *Action: Check the report ID

48482, 00000, "Report is not generated"
// *Document: YES
// *Cause: The requested report is not ready to be generated
// *Action: Check the report ID

48483, 00000, "Spooling failed, it may be because the spool file cannot be created due to a permission issue"
// *Document: YES
// *Cause: The spooling filename may not be valid or the file cannot be created
// *Action: Check the permissions of the target directory and verify the filename

48484, 00000, "Run script failed, it may be because the script file does not exist"
// *Document: YES
// *Cause: The script file may not exist
// *Action: Check if the script file exist

48485, 00000, "The file exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The filename is too long
// *Action: Report to Oracle

48486, 00000, "The file [%s] exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The filename is too long
// *Action: Report to Oracle

48487, 00000, "The internal predicate string exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The predicate string exceeds the maximum length
// *Action: Report to Oracle

48488, 00000, "The predicate string exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The input predicate string exceeds the maximum length
// *Action: Report to Oracle

48489, 00000, "The input exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The input exceeds the maximum length
// *Action: Report to Oracle

48490, 00000, "The field number exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The input field number exceeds the maximum number
// *Action: Input less field names

48491, 00000, "The program name is too long, exceeds the maximum length [%s]"
// *Document: YES
// *Cause: the program name length exceeds the maximum length setting
// *Action: Report to Oracle

48492, 00000, "The report component name is not defined"
// *Document: YES
// *Cause: the report component name does not exist
// *Action: Check the component name to ensure it is registered

48493, 00000, "Sweep command needs parameters"
// *Document: YES
// *Cause: sweep command needs parameter
// *Action: Check the syntax of the command
/
48494, 00000, "ADR home is not set, the corresponding operation cannot be done"
// *Document: YES
// *Cause: The adr home is not set in the current adrci session
// *Action: Set the adr home using the adrci command "set base" and "set homepath"

48495, 00000, "Interrupt requested"
// *Document: YES
// *Cause: User requested to interrupt the current action
// *Action: No action is needed

48496, 00000, "\"%s\" is a mandatory keyword for the command"
// *Document: YES
// *Cause: The keyword is not specified for the command
// *Action: Input the keyword

48497, 00000, "\"%s\" is an invalid product type"
// *Document: YES
// *Cause: The product type is not registered
// *Action: Check the product type

48499, 00000, "The value of the keyword \"%s\" exceeds the maximum length %s"
// *Document: YES
// *Cause: The keyword value is too long
// *Action: Check the limit and input again

/////////////////////////////////////////////////////////////////////////////
/ 48500- 48599 are reserved for AME layer
/////////////////////////////////////////////////////////////////////////////
48500, 00000, "File Write Error [%s] [%s]"
// *Document: YES
// *Cause: Number of bytes written differs from number requested. Possibly
//         due to out of disk space.
// *Action: Ensure sufficient disk space.
48501, 00000, "File Read Error [%s] [%s]"
// *Document: YES
// *Cause: Number of bytes read differs from number requested. Possibly due
//         due to corrupted file.
// *Action: Recreate the file.
48502, 00000, "Invalid Command Line - Missing Required Elements"
// *Document: YES
// *Cause: Missing required command line arguments.
// *Action: Review the help message and supply the required arguments.
48503, 00000, "Invalid Parameter Specified"
// *Document: YES
// *Cause: Invalid input parameter supplied.
// *Action: Review the help message and correct the invalid input parameter.
48504, 00000, "Relation Parameter Must be Specified"
// *Document: YES
// *Cause: Relation parameter must be specified during adrexp.
// *Action: Supply the relation parameter.
48505, 00000, "File Parameter Must be Specified"
// *Document: YES
// *Cause: File parameter must be specified during adrimp.
// *Action: Supply the file parameter.
48506, 00000, "Existing Relation at different version than export [%s] [%s]"
// *Document: YES
// *Cause: Attempting to import into an existing relation and the schema
//         version of that relation differs from the schema of the relation
//         that was exported.
// *Action: Drop the existing relation if you still wish to import the
//          relation.
48507, 00000, "Predicate Not Allowed during Import"
// *Document: YES
// *Cause: The predicate option is not allowed during adrimp.
// *Action: Remove the predicate arguement.
48508, 00000, "Export File Version [%s] Can Not be Used by Import [%s]"
// *Document: YES
// *Cause: The version of the export file is not able to be read by this
//         version of adrimp.
// *Action: Rerun the export using the current version of adrexp.
48509, 00000, "Error occurred during operation. See the following errors"
// *Document: YES
// *Cause: An underlying error has occurred.
// *Action: Review and correct the underlying error.
48510, 00000, "Can not export an in memory relation"
// *Document: YES
// *Cause: In memory relations can not be exported.
// *Action: Pick a different relation.
48511, 00000, "Repair Schema currently not implemented"
// *Document: NO
// *Cause: Feature currently not implemented
// *Action: Use repair relation instead
/////////////////////////////////////////////////////////////////////////////
/ 48600 - 48699 for AMH layer 
/////////////////////////////////////////////////////////////////////////////
48600, 00000, "HM run with name [%s] already exists"
// *Document: YES
// *Cause: The specified run name already existed.
// *Action: Specify different run name and re-run the check
48601, 00000, "HM run id[%s] not found"
// *Document: NO
// *Cause:  
// *Action:
48602, 00000, "HM finding id [%s] not found"
// *Document: NO
// *Cause:  
// *Action:
48603, 00000, "HM recommendation id [%s] not found"
// *Document: NO
// *Cause:  
// *Action:
48604, 00000, "Alloc Function Pointer should not be NULL  "
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48605, 00000, "Argument [%s] value should not be NULL"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48606, 00000, "Argument [%s] value should not be ZERO"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48607, 00000, "Not valid(supported) parameter type"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48608, 00000, "Info list object doesn't have space"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48609, 00000, "Param [%s] was not found in the infolist object"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48610, 00000, "Format of info list text is not correct"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48611, 00000, "Message object doesn't have space for new message"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48612, 00000, "Info list object doesn't have space for new params"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48613, 00000, "Finding set object doesn't have space for new finding"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48614, 00000, "HM run with name [%s] not found"
// *Document: NO
// *Cause:  
// *Action:
48615, 00000, "Parameter [%s] value not specified"
// *Document: YES 
// *Cause: Run was invoked without specifying the parameter and its value  
// *Action: Specify the needed parameter and its value
48616, 00000, "Parameter [%s] is NULL"
// *Document: NO
// *Cause:  
// *Action:
48617, 00000, "Parameter [%s] value [%s] length exceeds the maximum limit [%s]"
// *Document: YES 
// *Cause:  
// *Action:
/
///////////////////////////////////////////////////////////////////////////
// Errors 48700 - 48749 reserved for DWF initialization Usage Errors 
///////////////////////////////////////////////////////////////////////////
/
48700, 00000, "DBG initialization out of sequence"
// *Document: No
// *Cause:  The diagctx was not in a valid state for this operation.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//            facility at the time it is encountered.
/
48701, 00000, "DBG initialization : bad Library Group ID"
// *Document: No
// *Cause:  A bad Library Group Id was passed to a DBG initialization interface.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//            facility at the time it is encountered.
/
48702, 00000, "DBG initialization : no callbacks specified to disable ADR"
// *Document: No
// *Cause:  The ADR disable option was spcified but no output redirection
//          callbacks were provided.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//            facility at the time it is encountered.
/
///////////////////////////////////////////////////////////////////////////
// Errors 48750 - 48799 reserved for DWF initialization Internal Errors 
///////////////////////////////////////////////////////////////////////////
/
48750, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48751, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48752, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48753, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48754, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48755, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48756, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48757, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48758, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48759, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48760, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48761, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48762, 00000, "DBG context notification service internal failure"
// *Document: No
// *Cause:  Assertion failure in initialization notification service
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48763, 00000, "DBG memory corruption for thread local root"
// *Document: No
// *Cause:  DBG thread local root is corrupted
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/

/////////////////////////////////////////////////////////////////////////////
/ 48800 - 48899 are reserved for ADV layer
/////////////////////////////////////////////////////////////////////////////
48800, 00000, "\"%s\" for the keyword \"%s\" is not in the right format of timestamp"
// *Document: YES
// *Cause: The value format is not right
// *Action: Check the format ADRCI supports

48801, 00000, "The option \"%s\" is duplicated"
// *Document: YES
// *Cause: The option has been specified more than once
// *Action: Check the input

48802, 00000, "The options \"%s\" and \"%s\" are mutual exclusive"
// *Document: YES
// *Cause: These two options cannot be specified together
// *Action: Only specify one of them

48803, 00000, "The keyword \"%s\" is not defined for this command"
// *Document: YES
// *Cause: The keyword is invalid
// *Action: Check the valid keywords for the command

48804, 00000, "The command needs at least one file input"
// *Document: YES
// *Cause: No files are specified to view
// *Action: Input the files
48805, 00000, "BEGIN BACKUP issued already - must do an END BACKUP first"
// *Document: YES
// *Cause: A begin backup was already issued.
// *Action: Issue END BACKUP
48806, 00000, "Unknown Function Reference (%s)"
// *Document: YES
// *Cause: The function reference is not a valid function
// *Action: Change the reference
/////////////////////////////////////////////////////////////////////////////
/ 48900- 4899 are reserved for UTS layer
/////////////////////////////////////////////////////////////////////////////
48900, 00000, "Illegal Input Argument [%s]"
// *Document: YES
// *Cause: The input argument is invalid
// *Action: Check the input parameter
48902, 0000, "Empty component specification"
// *Document: YES
// *Cause: 
// *Action:
48903, 0000, "String [%s] is not a valid library name"
// *Document: YES
// *Cause: 
// *Action:
48904, 0000, "String [%s] is not a valid component name"
// *Document: YES
// *Cause:
// *Action:
48905, 0000, "String [%s] is not a valid operation name"
// *Document: YES
// *Cause:
// *Action:

48906, 00000, "Parser context is not valid"
// *Document: YES
// *Cause: The parser context is not initlialized
// *Action: Call the initialization routine first before using the context

48907, 00000, "The end of file is reached"
// *Document: YES
// *Cause: The end of file is raeched
// *Action: Handle the end of file

48908, 00000, "No trace files are found"
// *Document: YES
// *Cause: This is no file in the navigator context, either it is done with
//         parsing, or no file is pushed
// *Action: Check if the file is added to the context

48909, 00000, "Scan context is not initialized"
// *Document: YES
// *Cause: The scan context is not initialized
// *Action: call the initliazation routine of the scan context

48910, 00000, "Fetch already started"
// *Document: NO
// *Cause: Cannot add files if the fetch is already started
// *Action: Add the file before fetching

48911, 00000, "The parent node does not exist"
// *Document: NO
// *Cause: The current node does not have parent node
// *Action: Check the input node to see if it has parent

48912, 00000, "The specified trace filename is too long"
// *Document: YES
// *Cause:The resulting trace filename length exceeds the maximum length
// *Action:Use a smaller trace filename suffix or move ADR higher in the 
//         directory  hierarchy

48913, 00000, "Writing into trace file failed, file size limit [%s] reached"
// *Cause:An attempt was made to write into a trace file that exceeds 
//        the trace's file size limit
// *Action:increase the trace's file size limit.

48914, 00000, "File position is not in right format"
// *Document: YES
// *Cause: The file positon format is not right
// *Action: Check if the file format string is the right one

48915, 00000, "The output format is not supported"
// *Document: NO
// *Cause: The requested trace output format is not supported 
// *Action: Check the valid output format

48916, 00000, "Cannot open the output file with path [%s] and filename [%s]"
// *Document: NO
// *Cause: The file path may not exist, or the filename may not valid
// *Action: Check the filepath and filename

48917, 00000, "Fail to seek to the requested file position"
// *Document: NO
// *Cause: The file name may not exist
// *Action: Verify the filename

48918, 00000, "Interruption is caught"
// *Document: NO
// *Cause: The CTRL C is typed by users
// *Action: No action is needed

48919, 00000, "End of Fetch is reached in the trace navigator"
// *Document: NO
// *Cause: The file has reached the end
// *Action: No action is neede

48920, 00000, "The merge context is not initialized"
// *Document: NO
// *Cause: The merge context is not initialized
// *Action: initialize the merge context before other operations

48921, 00000, "The begin timestamp cannot be larger than the end timestamp"
// *Document: NO
// *Cause: The begin timestamp is larger than the end timestamp
// *Action: verify the begin and end timestamp

48922, 00000, "The input homepath is not a valid ADR home"
// *Document: NO
// *Cause: The homepath is not a valid ADR home
// *Action: Verify the homepath 

48923, 00000, "There is no file to be merged"
// *Document: NO
// *Cause: There is no file to be merged
// *Action: Verify if the filenames are correct

48924, 00000, "The merge is done"
// *Document: NO
// *Cause: The merge is done
// *Action: Terminate the merge context

48925, 00000, "The incident does not exist"
// *Document: NO
// *Cause: The incident does not exist
// *Action: Check if the incident ID exists

48926, 00000, "The offset is not valid"
// *Document: NO
// *Cause: The requested offset is not valid
// *Action: Varify the position flag is specified

48927, 00000, "The requested line number does not exist"
// *Document: NO
// *Cause: The file does not have the requested line number
// *Action: Check the file and the line number

48928, 00000, "The predicate exceeds the max limit %s"
// *Document: YES
// *Cause: The predicate is too long, exceeds the  max limit
// *Action: Use a shorter predicate

48929, 00000, "The trace record size exceeded the max size that can be read [%s]"
// *Document: YES
// *Cause: A trace record is too large to be read by the ADR viewer
// *Action: Report to Oracle

48930, 00000, "Cannot allocate memory for processing traces"
// *Document: YES
// *Cause: A memory allocation request failed
// *Action: Report to Oracle

48931, 00000, "The metadata header of file [%s] is not valid"
// *Document: NO
// *Cause: The metadata is not written correctly
// *Action: 

48932, 00000, "The data offset is not in non-decreasing order at byte [%s]" 
// *Document: NO
// *Cause:
// *Action: 

48933, 00000, "Fail to switch to ADR default home" 
// *Document: NO
// *Cause: We are unable to switch to the ADR default home due to an error
//         with the internal ADR state.
// *Action: Report to Oracle

48934, 00000, "invalid input for the file name identifier"
// *Cause: An invalid input was given for the file name indentifier.  The 
//         file name is not allowed to have slashes ('\', '/') and is not
//         allowed to refer to the parent directory using the '..' characters.
// *Action: Check the file name and provide a valid input.

48935, 00000, "bucket snapshotting error: [%s], [%s], [%s], [%s], [%s], [%s], [%s], [%s]"
// *Document: NO
// *Cause: The UTS bucket snapshot was not consistent.
// *Action:

48936, 00000, "The number of relations exceeds maximum number [%s]"
// *Cause: Too many relations listed
// *Action: Reduce the number
48937, 00000, "Feature (%s) currently not allowed for SELECT"
// *Cause: Feature is not allowed
// *Action: Remove feature
48938, 00000, "View select column count differs from select alias list"
// *Cause: The view alias list has a different number of fields than the select list"
// *Action: Change the alias list or view select statement
48939, 00000, "Select * not allowed in a CREATE VIEW"
// *Cause: * is currently not allowed for a create view select list
// *Action: List the fields explicitly

///////////////////////////////////////////////////////////////////////////
// Errors 49100 - 49199 reserved for Events++ errors 
///////////////////////////////////////////////////////////////////////////
49100, 00000, "Failed to process event statement [%s] "
// *Document: NO
// *Cause:
// *Action:
49101, 00000, "Failed to parse action [%s]"
// *Document: NO
// *Cause:
// *Action:
49102, 00000, "Action definition for [%s] not found"
// *Document: NO
// *Cause:
// *Action:
49103, 00000, "Missing Mandatory argument [%s] for %s [%s]"
// *Document: NO
// *Cause: 
// *Action:
49104, 00000, "[%s] is not a valid argument for %s [%s]"
// *Document: NO
// *Cause:
// *Action:
49105, 00000, "Too many arguments specified for %s [%s]"
// *Document: NO
// *Cause:
// *Action:
49106, 00000, "Parameter value [%s] is invalid"
// *Document: NO
// *Cause:
// *Action:
49107, 00000, "Passed end of string while parsing"
// *Document: NO
// *Cause:
// *Action:
49108, 00000, "Event Name [%s] not found"
// *Document: NO
// *Cause:
// *Action:
49109, 00000, "Library Name [%s] not found"
// *Document: NO
// *Cause:
// *Action:
49110, 00000, "Parameter value [%s] length is longer than maximum allowed"
// *Document: NO
// *Cause:
// *Action:
49111, 00000, "Parsing failed because memory allocation failed"
// *Document: NO
// *Cause:
// *Action:
49112, 00000, "Parameter value [%s] is not one of allowed values"
// *Document: NO
// *Cause:
// *Action:
49113, 00000, "Scope event limit exceeded, scoped events may work incorrrectly"
// *Document: NO
// *Cause:
// *Action:
49114, 00000, "Target not specified for scope [%s]"
// *Document: NO
// *Cause:
// *Action:
49115, 00000, "Target not specified for event [%s]"
// *Document: NO
// *Cause:
// *Action:
49116, 00000, "SQL ID string [%s] is invalid"
// *Document: NO
// *Cause:
// *Action:
49150, 0000, "Parameter NULL for this call [%s]"
// *Document: NO
// *Cause:
// *Action:
49151, 0000, "Event group not initialised"
// *Document: NO
// *Cause:
// *Action:
49152, 0000, "Event parse context not initialized"
// *Document: NO
// *Cause:
// *Action:
49153, 0000, "Event group sync failed, parent[%s] is not parent of child[%s]"
// *Document: NO
// *Cause:
// *Action:
49154, 0000, "Failed to initialize parse context in [%s]"
// *Document: NO
// *Cause:
// *Action:
49155, 0000, "Failed to initialize event group in [%s]"
// *Document: NO
// *Cause:
// *Action:
49156, 0000, "Failed to destroy parse context in [%s]"
// *Document: NO
// *Cause:
// *Action:
49157, 0000, "Syncing failed, parent and child are same group"
// *Document: NO
// *Cause:
// *Action:
49158, 0000, "Empty Filter Specification"
// *Document: NO
// *Cause:
// *Action:
49159, 0000, "Too many filters specified"
// *Document: NO
// *Cause:
// *Action:
49160, 0000, "Scope or Filter cannot be specified for mapped event, use [%s]"
// *Document: NO
// *Cause:
// *Action:
49161, 0000, "Usage for event %s : %s"
// *Document: NO
// *Cause:
// *Action:
49162, 0000, "[%s] is not a valid scope"
// *Document: NO
// *Cause:
// *Action:
49163, 0000, "Event string must begin with a valid event name/number"
// *Document: NO
// *Cause:
// *Action:
49164, 0000, "Event number is invalid"
// *Document: NO
// *Cause:
// *Action:
49165, 0000, "Too many arguments for event %s"
// *Document: NO
// *Cause:
// *Action:
49166, 0000, "Keyword IMMEDIATE must be at the beginning of event string"
// *Document: NO
// *Cause:
// *Action:
49167, 00000, "Invalid value of parameter [%s] for %s [%s]"
// *Document: NO
// *Cause:
// *Action:
49168, 00000, "Missing value for name-value pair"
// *Document: NO
// *Cause:
// *Action:
//
49169, 00000, "Event [%s] is not a valid filter"
// *Document: NO
// *Cause:
// *Action:
///////////////////////////////////////////////////////////////////////////
// Errors 49200 - 49299 reserved for DDE errors 
///////////////////////////////////////////////////////////////////////////
49200, 00000, "DDE Internal Error"
// *Document: NO
// *Cause:
// *Action:
49201, 00000, "Arguments not valid for DDE invocation"
// *Document: NO
// *Cause:
// *Action:
49202, 00000, "DDE global context not initialized for DDE invocation"
// *Document: NO
// *Cause:
// *Action:
49203, 00000, "Too many recursive DDE invocations"
// *Document: NO
// *Cause:
// *Action:
49204, 00000, "Recursive DDE invocation at Phase I"
// *Document: NO
// *Cause:
// *Action:
49205, 00000, "DDE async action error [%s] [%s] [%s] [%s] [%s] [%s] [%s] [%s]"
// *Document: NO
// *Cause:
// *Action: None
49206, 00000, "No DDE async actions in queue"
// *Document: NO
// *Cause: An attempt was made to dequeue from an empty queue.
// *Action: None
///////////////////////////////////////////////////////////////////////////
// Errors 49300 - 49399 reserved for DDE User Actions errors 
///////////////////////////////////////////////////////////////////////////
49300, 00000, "DDE User Actions Internal Error"
// *Document: NO
// *Cause:
// *Action:
49301, 00000, "Illegal input argument [%s]"
// *Document: NO
// *Cause: An illegal argument was passed in.
// *Action: Fix the calling function.

49302, 00000, "Invalid action/invocation specified [%s] [%s] [%s]"
// *Document: NO
// *Cause: The specified combination of incident, action name and invocation
//         doesn't exist.
// *Action: Specify an existing combination of incident, action and invocation.

49303, 00000, "Invalid action specified (action not defined) [%s]"
// *Document: NO
// *Cause: The specified action is not defined in this ADR.
// *Action: Specify an action based on an available action definition.

49304, 00000, "Invalid action/invocation/parameter specified [%s] [%s] [%s] [%s]"
// *Document: NO
// *Cause: The specified combination of incident, action name, invocation and
//         parameter (position) doesn't exist.
// *Action: Specify an existing combination. Check the number of parameters.

49305, 00000, "Invalid parameter specified (action parameter not defined) [%s] [%s]"
// *Document: NO
// *Cause: The specified action parameter is not defined in this ADR.
// *Action: Specify an action parameter based on an available parameter
//          definition.

49306, 00000, "Invalid parameter length specified, argn:%s, len:%s, lim:%s"
// *Document: NO
// *Cause: A specified parameter value was too long.
// *Action: Input a parameter value of valid length.

49307, 00000, "Invalid length in user credentials, argn:%s, len:%s, lim:%s"
// *Document: NO
// *Cause: A specified username or password was too long.
// *Action: Input a username or password of valid length.

49308, 00000, "Unable to read ADR record [%s]"
// *Document: NO
// *Cause: There was an error reading records from ADR.
// *Action: Check underlying errors on the error stack.

49309, 00000, "Action failed [%s] [%s] [%s]"
// *Document: NO
// *Cause: An action invoked through OCI failed.
// *Action: Verify that the called PL/SQL function exists, and that the
//          logged-in user has execute privileges on the function.

49310, 00000, "Invalid command string length [%s] [%s] [%s] [%s]"
// *Document: NO
// *Cause: A too long OS command string was constructed.
// *Action: 

49311, 00000, "Command processor not found (system call returned null value) [%s] [%s]"
// *Document: NO
// *Cause: The system call could not execute, because there is no command
//         processor.
// *Action: Check the operating system.

49312, 00000, "No incident provided and no default incident set"
// *Document: NO
// *Cause: A command-line command did not specify an incident,
//         and no incident had been set using the SET INCIDENT command.
// *Action: Specify an incident id, or use SET INCIDENT to set an incident.

49313, 00000, "Specified parameter cannot be modified [%s] [%s]"
// *Document: NO
// *Cause: A command tried to modify the value of a parameter that has the
//         "unmodifiable" flag.
// *Action: Modify the value of another parameter.

49314, 00000, "Specified action is in status INCOMPLETE and cannot be executed"
// *Document: NO
// *Cause: Attempt to execute an action in status INCOMPLETE.
// *Action: Provide all parameters in order to change the action status.

49315, 00000, "Invalid incident type specified [%s]"
// *Document: YES
// *Cause: The specified incident type is not defined in this ADR.
// *Action: Specify an available incident type.

///////////////////////////////////////////////////////////////////////////
// Errors 49400 - 49499 reserved for IPS errors 
///////////////////////////////////////////////////////////////////////////

49400, 00000, "IPS Internal Error"
// *Document: NO
// *Cause: An internal error was encountered.
// *Action: Report to Oracle as a bug.
// *Comment: This is a bug.

49401, 00000, "Illegal input argument [%s]"
// *Document: NO
// *Cause: A programming error caused invalid arguments to be passed.
// *Action: Report to Oracle.
// *Comment: This is a bug.

49402, 00000, "Invalid length specified [%s] [%s] [%s]"
// *Document: NO
// *Cause: A programming error caused an invalid length to be specified.
// *Action: Report to Oracle.
// *Comment: This is a bug.

49404, 00000, "No such package [%s]"
// *Document: YES
// *Cause: The specified package does not exist.
// *Action: Specify an existing package.

49405, 00000, "Cannot change package name [%s] [%s]"
// *Document: YES
// *Cause: Attempted to change package name after package generation.
// *Action: Use current name, or create a new package with the desired name.
// *Comment: It's not possible to change the package name after the first
//           physical package has been generated.

49406, 00000, "Undefined configuration parameter specified [%s]"
// *Document: YES
// *Cause: The specified configuration parameter was not found in ADR.
// *Action: Specify an existing parameter. Re-populate parameters if necessary.

49407, 00000, "No unpacking history in this home"
// *Document: YES
// *Cause: No packages were unpacked into this home.
// *Action: Verify the current home. Unpack a package if necessary.

49408, 00000, "Invalid home specified [%s]"
// *Document: YES
// *Cause: An invalid ADR_HOME was specified.
// *Action: Verify that the directory exists, and has the correct structure.

49409, 00000, "Incremental package provided when complete expected"
// *Document: YES
// *Cause: No packages were unpacked into this home.
// *Action: Provide a complete package, or use FORCE option.

49410, 00000, "Not an IPS package"
// *Document: YES
// *Cause: The specified file was not an IPS package.
// *Action: Verify that the file is a valid zip file with expected contents.

49411, 00000, "Incompatible package version [%s] [%s]"
// *Document: NO
// *Cause: The package file is from an incompatible version.
// *Action: Regenerate the package with a compatible version, or try unpacking
//          with a compatible version. Alternatively, unpack manually,
//          or use the FORCE flag (not recommended).

49412, 00000, "Package ID does not match existing ID [%s] [%s]"
// *Document: YES
// *Cause: The package ID in package file did not match previously unpacked
//         packages.
// *Action: Use the correct location for unpacking the package.

49413, 00000, "Package name does not match existing name [%s] [%s]"
// *Document: YES
// *Cause: The package name in package file did not match previously unpacked
//         packages.
// *Action: Use the correct location for unpacking the package.

49414, 00000, "Package sequence later than expected [%s] [%s]"
// *Document: YES
// *Cause: The package sequence in package file was later than expected.
// *Action: Apply packages in correct order, or use FORCE option.

49415, 00000, "Package sequence earlier than expected [%s] [%s]"
// *Document: YES
// *Cause: The package sequence in package file was earlier than expected.
// *Action: Apply packages in correct order, or use FORCE option.

49416, 00000, "Earlier package sequence applied with FORCE option [%s] [%s]"
// *Document: YES
// *Cause: An earlier package sequence was applied using the FORCE option.
// *Action: Apply a complete sequence which is later than any already applied,
//          or use FORCE option to apply an incremental package.

49417, 00000, "Cannot modify already generated package"
// *Document: YES
// *Cause: Attempted to change package attributes after package generation.
// *Action: Create a new package with the desired name.
// *Comment: Certain package attributes, such as correlation level, cannot be
//           changed after the first physical package has been generated.

49420, 00000, "Package too large [%s] [%s]"
// *Document: YES
// *Cause: The package is too large.
// *Action: Remove some files or incidents from the package, or try using
//          incremental mode.

49421, 00000, "Maximum number of package files generated [%s]"
// *Document: YES
// *Cause: The command generated the maximum number of package files.
// *Action: Remove some files or incidents from the package, or use
//          incremental mode to generate additional files.

49423, 00000, "File outside ADR not allowed"
// *Cause: The specified file is not within the ADR directory structure.
// *Action: Specify a file inside ADR.

49424, 00000, "Directory outside ADR not allowed"
// *Cause: The specified directory is not within the ADR directory structure.
// *Action: Specify a directory inside ADR.

49425, 00000, "File inside ADR not allowed"
// *Cause: The specified file is within the ADR directory structure.
// *Action: Specify a file outside ADR.

49426, 00000, "Directory inside ADR not allowed"
// *Cause: The specified directory is within the ADR directory structure.
// *Action: Specify a directory outside ADR.

49427, 00000, "No such file or file not accessible [%s]"
// *Cause: The specified file does not exist or cannot be accessed.
// *Action: Create the file or verify file permissions.

49428, 00000, "No such directory or directory not accessible  [%s]"
// *Cause: The specified directory does not exist or cannot be accessed.
// *Action: Create the directory or verify directory permissions.

49429, 00000, "File already exists and OVERWRITE option not specified [%s]"
// *Cause: The client attempted to create a file that already exists.
// *Action: Either remove the file or use the OVERWRITE option.

49430, 00000, "No such problem [%s]"
// *Document: YES
// *Cause: The specified problem does not exist.
// *Action: Specify a problem that exists in this repository.

49431, 00000, "No such incident [%s]"
// *Document: YES
// *Cause: The specified incident does not exist.
// *Action: Specify an incident that exists in this repository.

49432, 00000, "Problem not part of package [%s]"
// *Document: YES
// *Cause: The specified problem is not included in the package.
// *Action: Specify a problem that is included in the package.

49433, 00000, "Incident not part of package [%s]"
// *Document: YES
// *Cause: The specified incident is not included in the package.
// *Action: Specify an incident that is included in the package.

49434, 00000, "Invalid date format"
// *Document: YES
// *Cause: An invalid format was used to specify a date
// *Action: Specify the date in a supported format.

49435, 00000, "Flood-controlled incident not allowed here [%s]"
// *Document: YES
// *Cause: A flood-controlled incident cannot be included in a package
// *Action: Specify an incident that is not flood-controlled

49436, 00000, "Date conversion error [%s]"
// *Document: YES
// *Cause: An invalid format was used to specify a date
// *Action: Specify the date in a supported format.

49440, 00000, "Warnings while unpacking package, details in file %s"
// *Document: YES
// *Cause: There were some non-fatal errors when unpacking a package
// *Action: Review the specified unpacking log file

49441, 00000, "Warnings while finalizing package, details in file %s"
// *Document: YES
// *Cause: There were some non-fatal errors when finalizing a package
// *Action: Review the specified finalize log file

49450, 00000, "Non-zero return code from archiving utility [%s] [%s]"
// *Document: YES
// *Cause: The archiving utility (zip/unzip) returned a warning or error.
// *Action: Verify that the file and directory exist and are readable,
//          and that the file is a valid zip file.

49451, 00000, "Archive file structure error [%s] [%s]"
// *Document: YES
// *Cause: The archiving utility (zip/unzip) returned an error indicating
//         that the archive file structure is incorrect.
// *Action: Verify that the file was transferred correctly and that the
//          file is a valid zip file.

49452, 00000, "Archiving utility out of memory [%s] [%s]"
// *Document: YES
// *Cause: The archiving utility (zip/unzip) returned an error indicating
//         that it was unable to allocate enough memory.
// *Action: Check for operating system limitations on process memory usage.

49453, 00000, "Invalid command invoking archiving utility [%s] [%s]"
// *Document: YES
// *Cause: The archiving utility (zip/unzip) was invoked with an invalid
//         command line, or with invalid options.
// *Action: Verify that there are no operating system settings affecting
//          the behavior of the archiving utility..

49454, 00000, "Archive is missing or empty [%s] [%s]"
// *Document: YES
// *Cause: The specified archive does not exist, or is empty.
// *Action: Check if the specified archive exists.

49455, 00000, "Archive I/O failed [%s] [%s]"
// *Document: YES
// *Cause: An attempt to create, write to or read from an archive failed.
// *Action: Verify that operating system I/O operations are working correctly.

49456, 00000, "Operation failed due to insufficient disk space [%s] [%s]"
// *Document: YES
// *Cause: An operation on an archive failed due to insufficient disk space.
// *Action: Verify that there is sufficient disk space. Check for operating
//          system quotas or other restrictions.
///////////////////////////////////////////////////////////////////////////
// Errors 49500 - 49599 reserved for Incident Meter Errors 
///////////////////////////////////////////////////////////////////////////
49500, 00000, "Invalid Transient LifeTime[%s]"
// *Document: NO
// *Cause:
// *Action:
49501, 00000, "Invalid Critical Factor[%s]"
// *Document: NO
// *Cause:
// *Action:
49502, 00000, "Invalid Warning Factor[%s]"
// *Document: NO
// *Cause:
// *Action:
49503, 00000, "Invalid Weight Factor[%s]"
// *Document: NO
// *Cause:
// *Action:
49504, 00000, "Incident meter configuration record not found "
// *Document: NO
// *Cause:
// *Action:
49505, 00000, "Problem record not found"
// *Document: NO
// *Cause:
// *Action:
49506, 00000, "Incident record not found"
// *Document: NO
// *Cause:
// *Action:
///////////////////////////////////////////////////////////////////////////
// Errors 49600 - 49699 reserved for Events++ Parser errors
///////////////////////////////////////////////////////////////////////////
49600,0,      ","
// *Document: NO
// *Cause:
// *Action:
49601,2,      "syntax error: found \"%s\": expecting one of: \"%s\" etc.."
// *Document: YES
// *Cause: Syntax error discovered when processing event speciifcation
// *Action: Enter correct event specification
49602,0,      "attempt recovery: symbol \"%s\" inserted before \"%s\"."
// *Document: NO
// *Cause:
// *Action:
49603,0,      "attempt recovery: symbol \"%s\" ignored."
// *Document: NO
// *Cause:
// *Action:
49604,0,      "attempt recovery: symbol \"%s\" substituted for \"%s\"."
// *Document: NO
// *Cause:
// *Action:
49605,4,      "error: got NULL for lexer callback."
// *Document: NO
// *Cause:
// *Action:
49606,0,      "file \"%s\", line \"%s\"."
// *Document: NO
// *Cause:
// *Action:
49607,1,      "error: got NULL for debug callback when debug flag is set."
// *Document: NO
// *Cause:
// *Action:
49608,4,      "fatal: internal error"
// *Document: NO
// *Cause:
// *Action:
49609,4,      "error: too many errors at token %s. cannot recover.. bye!"
// *Document: NO
// *Cause:
// *Action:
49610,4,      "error: got NULL for one of memory callbacks and not others"
// *Document: NO
// *Cause:
// *Action:
49611,4,      "error: lexer callback doesn't handle PZLEXERRGET."
// *Document: NO
// *Cause:
// *Action:
49612,1,      "warning: no 'error' token lookahead for any state on parse stack."
// *Document: NO
// *Cause:
// *Action:

/ Messages 49613 -> 49699 are in diaevtus.msg
/

/////////////////////////////////////////////////////////////////////////////
/ 51000 - 51999 are reserved for HM, IR diagnosability framework errors
/ 51000 - 51099 for HM infrastructure related
/ 51100 - 51189 for IR infrastructure related
/ 51190 - 51199 for DBMS_IR package errors
/ 51200 - 51399 for DATA corruption checks (physical, logical)
/ 51400 - 51499 for ASM checks
/ 51500 - 51699 for Check Name, Descrptions and Parameter Descriptions  
/////////////////////////////////////////////////////////////////////////////
51000, 00000, "HM framework error: [%s] [%s]"
// *Document: NO 
// *Cause: possible bug in HM/ADR infrastructure or its checkers 
// *Action: report to oracle support 
// *Comment: 
/
51001, 00000, "check [%s] not found in HM catalog"
// *Document: YES 
// *Cause: checker name might have been misspelled 
// *Action: retry running check with proper checker name 
// *Comment: 
/
51002, 00000, "Too many parameters"
// *Document: NO 
// *Cause: Internal corruption in HM catalog 
// *Action: Report as a bug 
// *Comment: 
/
51003, 00000, "run parameters not formatted correctly"
// *Document: YES 
// *Cause: Run parameters were given in a wrong format 
// *Action: Correct the run params text and try again 
// *Comment: 
/
51004, 00000, "Check doesn't take any input params"
// *Document: YES 
// *Cause: run params were passed to the check, which doesn't take any inputs 
// *Action: don't pass any run params and try again 
// *Comment: 
/
51005, 00000, "run params missing the parameter name"
// *Document: NO 
// *Cause: run params  should contain name=value pairs, but name is missing  
// *Action: correct the run params format and try again 
// *Comment: 
/
51006, 00000, "unexpected delimter ';' in the run params text"
// *Document: YES 
// *Cause:  run params were not properly formatted.  
// *Action: correct the run params format and try again 
// *Comment: 
/
51007, 00000, "parameter [%s] not registered with this check "
// *Document: YES 
// *Cause:  Wrong inputs were given to this check.  
// *Action: correct the run params and try the check again 
// *Comment: 
/
51008, 00000, "parameter [%s] value is not a proper number"
// *Document: YES 
// *Cause:  the given parameter value is a not a proper number  
// *Action: correct the run params and try again 
// *Comment: 
/
51009, 00000, "parameter [%s] value type not supported yet"
// *Document: NO 
// *Cause:  run params were not properly formatted.  
// *Action: correct the run params format and try again 
// *Comment: 
/
51010, 00000, " NULL context passed "
// *Document: NO 
// *Cause:  checkers passed NULL value to HM    
// *Action:  usage issue for checks, internal report to oracle 
// *Comment: 
/
51011, 00000, " NULL Info passed "
// *Document: NO 
// *Cause:  checkers passed NULL info to HM    
// *Action:  usage issue for checks, internal report to oracle 
// *Comment: 
/
51012, 00000, " Param not found "
// *Document: NO 
// *Cause:  internal issue     
// *Action:  usage issue for checks, internal report to oracle 
// *Comment: 
/
51013, 00000, " default message not found"
// *Document: NO 
// *Cause:  internal issue    
// *Action:  usage issue for checks, internal report to oracle 
// *Comment: 
/
51014, 00000, " Checker Run got Timed Out "
// *Document: NO 
// *Cause:  checker run got timedout    
// *Action:  increase the timeout for the run and try again. 
// *Comment: 
/
51015, 00000, "dummy HM failure with [%s] as arguments"
// *Document: NO 
// *Cause:  DUMMY HM FAILURE  
// *Action:  
// *Comment: 
/
51016, 00000, "dummy HM recommendation with [%s] as arguments"
// *Document: NO 
// *Cause:  DUMMY HM RECO  
// *Action:  
// *Comment: 
/
51017, 00000, "dummy HM damage description with [%s] as argument"
// *Document: NO 
// *Cause:  DUMMY HM RECO  
// *Action:  
// *Comment: 
/
51018, 00000, "list parameter values are of wrong type"
// *Document: NO 
// *Cause:  List parameter values are of wrong type  
// *Action: Correct the run_params and retry the check again 
// *Comment: 
/
51019, 00000, "unsupported list parameter type"
// *Document: NO 
// *Cause:    
// *Action: Correct the run_params and retry the check again 
// *Comment: 
/
51020, 00000, "parameter [%s] not found in info"
// *Document: NO 
// *Cause:    
// *Action:  
// *Comment: 
/
51021, 00000, "Element list full"
// *Document: NO 
// *Cause:  Possible misusage of dbkh_elemlist APIs. 
// *Action: report to oracle 
// *Comment: 
/
51022, 00000, "Invalid element position"
// *Document: NO 
// *Cause:   Possible misusage of dbkh_elemlist APIs. 
// *Action:  report to oracle 
// *Comment: 
/
51023, 00000, "Param type mismtach"
// *Document: NO 
// *Cause:   Possible misusage of dbkh internal APIs 
// *Action:  report to oracle 
// *Comment: 
/
51024, 00000, "unsupported info type"
// *Document: NO 
// *Cause:   possible corruption with dbkh_info datastructure  
// *Action:  report to oracle 
// *Comment: 
/
51025, 00000, "check name should be non NULL value"
// *Document: YES 
// *Cause:   NULL value was passed for check name  
// *Action:  give a proper check name and retry again 
// *Comment: 
/
51026, 00000, "Diag ADR not enabled, can't run check"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51027, 00000, "Run name should be non NULL value"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51028, 00000, "Report type should be non NULL value"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51029, 00000, "Report type should be non NULL value"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51030, 00000, "Unsupported report type"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51031, 00000, "Unsupported report level"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51032, 00000, "check name too long"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51033, 00000, "run name too long"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51034, 00000, "pseudo context not allowed"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51035, 00000, "invalid timeout value"
// *Document: YES 
// *Cause:    User specified an invalid timeout value    
// *Action:   
// *Comment: 
/
51036, 00000, "check [%s] can only be executed in database instance"
// *Document: YES 
// *Cause:    An attempt was made to run database-specific check 
//            in ASM environment   
// *Action:   Don't run the check in ASM environment 
// *Comment: 
/
51037, 00000, "check [%s] can only be executed in ASM instance"
// *Document: YES 
// *Cause:    An attempt was made to run ASM-specific check 
//            in a database environment   
// *Action:   Don't run the check in database environment 
// *Comment: 
/
51100, 00000, "Control file is older than datafiles and/or log files"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_CURR_CF_OLD failure
/
51101, 00000, "NOARCHIVELOG mode restore datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_REST_NO_REDO
/ 
51102, 00000, "cannot change priority of a critical failure %s"
// *Document: YES
// *Cause:    An attempt was made to change priority of a failure with CRITICAL priority.
// *Action:   No action is required.
/
51103, 00000, "cannot change priority of a closed failure %s"
// *Document: YES
// *Cause:    An attempt was made to change priority of a closed failure.
// *Action:   No action is required.
/
51104, 00000, "NOARCHIVELOG mode restore datafiles %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_MULT_REST_NO_REDO
/
51105, 00000, "cannot change priority of a failure to CRITICAL"
// *Document: YES
// *Cause:    An attempt was made to change priority of a failure to CRITICAL.
// *Action:   No action is required.
/
51106, 00000, "check failed to complete due to an error.  See error below"
// *Document: YES
// *Cause:    While executing the check, an unexpected error occured.
// *Action:   Check the errors below and try rerunning the check.
/
51107, 00000, "failures are changing too rapidly - retry command"
// *Document: YES
// *Cause:    Failures were added or closed during a Data Recovery Advisor 
//            command.
// *Action:   Retry the command.
/
51108, 00000, "unable to access diagnostic repository - retry command"
// *Document: YES
// *Cause:    A lock or timeout error occurred when trying to read failure or 
//            repair data from the Automatic Diagnostic Repository. 
// *Action:   Retry the command.
/
51109, 00000, "repair script file is too large"
// *Document: YES
// *Cause:    Data Recovery Advisor generated a repair script file
//            that was too large.
// *Action:   Retry the command with fewer failures selected.
/
51110, 00000, "buffer size [%s] is too small - [%s] is needed"
// *Document: YES
// *Cause:    An internal buffer was too small.
// *Action:   This is an internal error.  Contact Oracle Support Services.
/
51111, 00000, "failure revalidation timed out"
// *Document: YES
// *Cause:    Data Recovery Manager was unable to revalidate all failures
//            before timing out.
// *Action:   Increase timeout and retry the command.
/
51190, 00000, "Internal error [%s], [%s] from DBMS_IR"
// *Document: YES
// *Cause:  An unexpected error occurred while executing a routine in the
//          DBMS_IR package.
// *Action: This is an internal error.  Contact Oracle Support Services.
/
51191, 00000, "Too many files opened"
// *Document: YES
// *Cause:  Data Recovery Advisor attempted to open too many files using the 
//          DBMS_IR package.
// *Action: This is an internal error.  Contact Oracle Support Services.
/
51192, 00000, "File not open"
// *Document: YES
// *Cause:  Data Recovery Advisor attempted to read or write from a 
//          file that was not open.
// *Action: This is an internal error.  Contact Oracle Support Services.
/
51193, 00000, "invalid parameter value"
// *Document: YES
// *Cause:  An invalid parameter value was supplied in a call to the
//          DBMS_IR package.
// *Action: Fix the parameter value and retry the call.
/
51200, 00000, "%s %s has invalid size"
// *Document: NO 
// *Cause:  
// *Action: 
// *Comment: Description for DBKH_F_ID_IO_INV_SIZE
/
51201, 00000, "Database cannot be mounted"
// *Document: NO
// *Cause:                      
// *Action: 
// *Comment: Failure impact description 
/
51202, 00000, "Control file %s is missing"
// *Document: NO
// *Cause:                      
// *Action: 
// *Comment: Description for DBKH_F_ID_CF_MISSING failure
/
51203, 00000, "Control file %s is corrupt"
// *Document: NO
// *Cause:                      
// *Action: 
// *Comment: Description for DBKH_F_ID_CF_CORRUPT failure
/
51204, 00000, "Control file needs media recovery"
// *Document: NO
// *Cause:
// *Action: 
// *Comment: Description for DBKH_F_ID_CF_NEEDS_MR failure
/
51205, 00000, "Control file %s does not belong to the database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_CF_FOREIGN failure
/
51206, 00000, "Control files are mutually inconsistent"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_CF_INCONS failure
/
51207, 00000, "Insufficient kernel memory to access %s %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for failure DBKH_F_ID_IO_NO_MEM
/
51208, 00000, "Database might be unrecoverable or become unrecoverable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51209, 00000, "Redo log file %s is missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_LM_MISSING failure
/
51210, 00000, "Redo log file %s is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_LM_CORRUPT failure
/
51211, 00000, "%s %s cannot be opened because of limit on number of open files per process"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_SOF_LIMIT
/
51212, 00000, "Redo log group %s is unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_LG_UNAVAIL failure
/
51213, 00000, "%s %s cannot be accessed because of an ASM Failure"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_ASM_INSTANCE
/
51214, 00000, "%s %s cannot be opened because of system limit on number of open files"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_SOF_LIMIT failure
/
51215, 00000, "Archived redo log file %s is missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_AL_MISSING failure
/
51216, 00000, "Archived redo log file %s is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_AL_CORRUPT failure
/
51217, 00000, "Database cannot be opened"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51218, 00000, "%s %s cannot be accessed because of NFS mount error"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_MOUNT_ERR failure
/
51219, 00000, "System datafile %s: '%s' is missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_SF_MISSING failure
/
51220, 00000, "System datafile %s: '%s' is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_SF_CORRUPT failure
/
51221, 00000, "System datafile %s: '%s' needs media recovery"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_SF_NEEDS_MR failure
/
51222, 00000, "See impact for individual child failures"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51223, 00000, "%s %s cannot be accessed because of invalid partitioning of raw volume"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_INV_PART failure
/
51224, 00000, "One or more non-system datafiles are missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MDF_MISSING failure
/
51225, 00000, "One or more non-system datafiles are corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MDF_CORRUPT failure
/
51226, 00000, "One or more non-system datafiles need media recovery"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MDF_NEED_MR failure
/
51227, 00000, "%s %s does not have correct access permissions"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_ION_PERM failure
/
51228, 00000, "Datafile %s: '%s' is missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_MISSING failure
/
51229, 00000, "Datafile %s: '%s' is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_CORRUPT failure
/
51230, 00000, "Datafile %s: '%s' needs media recovery"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_NEEDS_MR failure
/
51231, 00000, "Some objects in tablespace %s might be unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51232, 00000, "Datafile %s: '%s' contains one or more corrupt blocks"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MBL_CORRUPT failure
/
51233, 00000, "Block %s in datafile %s: '%s' is media corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_BL_CORRUPT failure
/
51234, 00000, "Object %s owned by %s might be unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51235, 00000, "Redo log group %s is corrupt near change %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_O_REDO_CORRUPT failure
/
51236, 00000, "Archived redo log file %s is corrupt near change %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_A_REDO_CORRUPT failure
/
51237, 00000, "Recovery cannot be completed"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51238, 00000, "Perform block media recovery of block %s in file %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_BL_BMR
/
51239, 00000, "Use a multiplexed copy to restore control file %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_COPY_MEMBER
/
51240, 00000, "Restore a backup control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_REST_REC
/
51241, 00000, "If you have a CREATE CONTROLFILE script, use it to create a new control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_CREATE
/
51242, 00000, "Restore and recover datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_REST_REC 
/
51243, 00000, "Restore and recover datafiles %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_MULT_REST_REC
/
51244, 00000, "Recover datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_RECOVER
/
51245, 00000, "Recover datafiles %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_MULT_REC
/
51246, 00000, "Take datafile %s offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_OFFLINE
/
51247, 00000, "Take datafiles %s offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_RP_ID_OFL_DFNUM_LIST
/
51248, 00000, "If a standby database is available, then perform a Data Guard failover initiated from the standby"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_STANDBY_FO
/
51249, 00000, "Recover multiple corrupt blocks in datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_MULT_BMR
/
51250, 00000, "Table object %s has corrupted data"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_TABLE
/
51251, 00000, "Table %s.%s may not be accessible"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Damage description for DBHK_F_ID_TABLE
/
51252, 00000, "Row %s of table object %s has corrupted data"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_TABROW
/
51253, 00000, "Table %s.%s may not be accessible"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Damage description for DBKH_F_ID_TABROW
/
51254, 00000, "Table object %s mismatched with index object %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_TABIDX_MISMATCH
/
51255, 00000, "Table %s.%s is not synchronized with index %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Damage description for DBKH_F_ID_TABIDX_MISMATCH and TABIDX_ROW.
/
51256, 00000, "Table row %s of table object %s mismatched with index object %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_TABIDX_ROW
/
/ 51257 is available to be used
/
51258, 00000, "Restore and recover database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_REST_REC
/
51259, 00000, "Recover database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_RECOVER
/
51260, 00000, "Drop and re-create redo log group member %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LF_DROP 
/
51261, 00000, "Clear redo log group %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CLEAR 
/
51262, 00000, "Clear unarchived redo log group %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CLEAR_UNARC
/
51263, 00000, "Clear unarchived redo log group %s using the UNRECOVERABLE DATAFILE clause in the ALTER DATABASE CLEAR LOGFILE statement"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CLEAR_UNARC_UNREC
/
51264, 00000, "Perform flashback of the database to SCN %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_FLASHBACK
/
51265, 00000, "Perform incomplete database recovery to SCN %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_PITR 
/
51266, 00000, "The repair includes complete media recovery with no data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_NDL_OPT
/
51267, 00000, "The repair includes point-in-time recovery with some data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_PITR_OPT
/
51268, 00000, "The repair makes some data temporarily unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_TUD_OPT
/
51269, 00000, "Ensure that all disks and network connections are functional"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_HW
/
51270, 00000, "If file %s was unintentionally renamed or moved, restore it"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_RESTORE_FILE
/
51271, 00000, "If you have an export of tablespace %s, then drop and re-create the tablespace and import the data."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_IMPORT_DATA
/
51272, 00000, "If you have the correct version of the control file, then replace the old control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_GET_VERS
/
51273, 00000, "If the instance failed when file %s was in online backup mode, then issue ALTER DATABASE END BACKUP.  This option must not be used for a restored backup"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_END_BACKUP
/
51274, 00000, "If you re-created inaccessible files in an alternative location, alter initialization parameters in the parameter file appropriately"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_COPY_CF
/
51275, 00000, "Obtain a copy of redo block from an alternative source (if exists)"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_GET_REDO
/
51276, 00000, "Drop damaged log group member and add new member"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_COPY_LF
/
51277, 00000, "%s %s cannot be accessed because file system does not have correct access permissions"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_FSYS_PERM failure
/
51278, 00000, "%s %s cannot be accessed because it is locked by another process"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_FILE_LOCK failure 
/
51279, 00000, "Block %s of %s %s cannot be accessed because of device IO error"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_DEV_ERR failure
/
51280, 00000, "%s %s is inaccessible"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_INAC_FILE failure
/
51281, 00000, "Force a commit of the corrupted transaction whose id is %s"
// *Document: NO
// *Cause:
// *Action:    
// *Comment: Repair description for DBKH_R_ID_FORCE_COMMIT
/   
51282, 00000, "Transaction %s is corrupted; its undo segment number is %s"
// *Document: NO
// *Cause:
// *Action:    
// *Comment:   
/   
51283, 00000, "Transaction %s is not corrupted"
// *Document: NO
// *Cause:     
// *Action:    
// *Comment:   
/   
51284, 00000, "Undo segment %s is not corrupted"
// *Document: NO
// *Cause:     
// *Action:    
// *Comment:   
/
51285, 00000, "Damage analysis of transaction %s can be found in %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment:
/
51286, 00000, "Transaction %s seems to be corrupted; its undo segment number is %s"
// *Document: NO
// *Cause:
// *Action: 
// *Comment:
/
51287, 00000, "Check corrupt list in V$CORRUPT_XID_LIST for transaction %s. If present, then force commit it. If not, then corruption is likely to happen"
// *Document: NO
// *Cause:
// *Action:
// *Comment:
/
51288, 00000, "If you restored the wrong version of data file %s, then replace it with the correct one"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_GET_VERS
/
51289, 00000, "If you know which copy of the control file is correct, replace other copies with it"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OVWR_CFMEM
/
51290, 00000, "Ensure that file system is mounted properly and OS kernel resources are adequately configured"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_GENERAL_INAC1
/
51291, 00000, "Increase per-process limit on number of open files"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_INCR_PROC
/
51292, 00000, "Increase operating system kernel limit on total number of open files"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_INCR_KERNEL
/
51293, 00000, "Mount NFS with the Oracle-recommended mount options"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for BKH_R_ID_MOUNT_NFS
/
51294, 00000, "Ensure that disk partition provided to Oracle does not start at sector 0"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_PART
/
51295, 00000, "Mount your file system with the required access mode"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MOUNT_PERM
/
51296, 00000, "Change access permissions for file %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHANGE_PERM
/
51297, 00000, "Find process that is holding lock on file %s and resolve lock conflict"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_UNLOCK_FILE
/
51298, 00000, "Ensure that file %s has correct access permissions and is not locked by another process"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_GENERAL_INAC2
/
51299, 00000, "Please contact Oracle Support Services to resolve failure %s: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CALL_SUPPORT
/
51300, 00000, "Configure operating system kernel so that there is enough memory available to open a file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_INCR_MEM
/
51301, 00000, "SQL dictionary health check: %s %s on object %s failed"
// *Document: NO
// *Cause: A health check failed
// *Action: See the failure report
// *Comment: Failure description for DBKH_F_ID_DF
/
51302, 00000, "Damaged rowid is %s - description: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description
/
51303, 00000, "illegal check mask value specified"
// *Document: YES
// *Cause: An illegal check mask value was specified.
// *Action: Specify one of the following legal values: COLUMN_CHECKS, ROW_CHECKS, REFERENTIAL_CHECKS, or ALL.
/
51304, 00000, "Checkpoint database and clear redo log group %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CHKP_CLEAR 
/
51305, 00000, "Checkpoint database and clear unarchived redo log group %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHKP_LG_CLEAR_UNARC
/
51306, 00000, "Checkpoint database and clear unarchived redo log group %s with unrecoverable datafile(s)"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CHKP_CLEAR_UNARC_UNREC
/
51307, 00000, "Undo segment %s is corrupted"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description
/
51308, 00000, "Restore database and recover with UNTIL CANCEL option"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_PITR_CANCEL 
/   
51309, 00000, "If you have the correct version of the control file, then replace %s with it"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_RP_ID_CF_FIND_FILENAME
/   
51310, 00000, "Ensure that ASM instance is up"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_ASM_INSTANCE
/  
51311, 00000, "Ensure that ASM disk group is mounted"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_ASM_MOUNTED
/
51312, 00000, "Name for datafile %s is unknown in the control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_UNKNOWN 
/
51313, 00000, "A repair cannot be performed until the database is restarted.  Please shutdown, restart database in nomount mode, and retry ADVISE command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_RESTART
/
51314, 00000, "If you have the correct version of the control file, then shutdown the database and replace the old control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_GET_VERS2
/  
51315, 00000, "Perform incomplete database recovery"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_PITR_NO_LOG
/
51316, 00000, "No check meta-data found on specified table %s"
// *Document: YES
// *Cause: No check meta-data was found for the object
// *Action: Table may not exist or no checks currently defined for the table
/
51317, 00000, "Rename datafile %s to the name of the real file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_RENAME
/ 
51318, 00000, "The repair includes flashing the database back with some data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_FLSHBK_OPT repair option 
/
51319, 00000, "The repair includes recovery in NOARCHIVELOG mode with some data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for repair option DBKH_R_ID_NOARC_OPT
/
51320, 00000, "No backup of block %s in file %s was found. Drop and re-create the associated object (if possible), or use the DBMS_REPAIR package to repair the block corruption"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MAN_BLK_REP 
/
51321, 00000, "If possible, drop and re-create the object associated with the logically corrupted block %s in file %s. Otherwise, use the DBMS_REPAIR package to repair the block"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MAN_BLK_REP2 
/
51322, 00000, "Contact Oracle Support Services if the preceding recommendations cannot be used, or if they do not fix the failures selected for repair"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LAST_MAND 
/
51323, 00000, "A database state change is required to repair some failures.  An automatic repair might be feasible if you mount the database."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MOUNT_DB
/
51324, 00000, "A database state change is required to repair some failures.  An automatic repair might be feasible if you open the database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_DB
/
51325, 00000, "Block %s in datafile %s: '%s' is logically corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_LBL_CORRUPT failure
/
51326, 00000, "Datafile %s: '%s' was not taken offline cleanly. If you do not want to recover it, then take the file OFFLINE FOR DROP and repeat the ADVISE command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_OFFLINE_DROP repair 
/
51327, 00000, "The repair includes clearing unarchived redo log with some data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Dataloss repair option description for DBKH_R_ID_CLEAR_NOARC_OPT 
/
51328, 00000, "Block %s in control file is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_CFBL_CORRUPT failure
/
51329, 00000, "The control file cannot be repaired while the database is mounted or open.  Please shutdown, restart the database in nomount mode, and retry the ADVISE command.  A backup control file or CREATE CONTROLFILE script will be needed for the repair.  If you do not have a backup control file, a CREATE CONTROLFILE script can be built by using 'alter database backup controlfile to trace'."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_CF_FIX_RESTART repair 
/
51330, 00000, "The control file cannot be repaired while the database is open or mounted.  Please shutdown, restart the database in nomount mode, and retry the ADVISE command.  A CREATE CONTROLFILE script will be needed for the repair because a backup control file could not be found.  If you do not have a script, one can be built by using 'alter database backup controlfile to trace'."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_CF_CREATE_RESTART repair 
/
51331, 00000, "Control file contains one or more corrupt blocks"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MCFBL_CORRUPT failure
/
51332, 00000, "Database or some of its functionality may not be available"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_CFBL_CORRUPT failure
/
51333, 00000, "Open resetlogs"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_RESETLOGS
/
51334, 00000, "Automatic repairs may be available if you shutdown the database and restart it in mount mode"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_RESTART_MOUNT 
/
51335, 00000, "Initiate fast-start failover"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_FSFO
/
51336, 00000, "Redo log %s with block size %s is incompatible with native disk sector size"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure description for DBKH_F_ID_LM_DISK_SECTOR
/
51337, 00000, "Move file %s with block size %s to a disk with a compatible sector size"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DISK_SECTOR_MOVE
/
51338, 00000, "Datafile %s: '%s' is offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_OFFLINE failure
/
51339, 00000, "Online datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_ONLINE
/
51340, 00000, "One or more non-system datafiles are offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MDF_OFFLINE failure
/
51341, 00000, "Tablespace %s: '%s' is offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_TS_OFFLINE failure
/
51342, 00000, "Online tablespace %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_TS_ONLINE
/
51343, 00000, "System datafile %s: '%s' is offline"
// *Document: NO
// *Cause:
// *Action:    
// *Comment: Description for DBKH_F_ID_SF_OFFLINE failure
/   
51344, 00000, "If datafile '%s' is in the current undo tablespace, then bring it online using ALTER DATABASE DATAFILE %s ONLINE command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_ONLINE_UNDO
/
51345, 00000, "A database state change is required to repair some failures.  An automatic repair might be feasible if you shut down the database and reopen it in read/write mode."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_DB_RW
/
51346, 00000, "An automatic repair was generated for some of the failures selected for repair.  More failures might be repaired if you open the database."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_DB_MORE
/
51347, 00000, "An automatic repair was generated for some of the failures selected for repair.  More failures might be repaired if you open the database in read/write mode."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_DB_RW_MORE
/
51348, 00000, "Open the database read/write to validate and get repair advice for failure %s: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_RW_FAIL
/
51349, 00000, "Open the database to validate and get repair advice for failure %s: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_FAIL
/
51350, 00000, "Mount the database to validate and get repair advice for failure %s: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MOUNT_FAIL
/
51351, 00000, "An automatic repair was generated for some of the failures selected for repair.  More failures might be repaired if you mount the database."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MOUNT_DB_MORE
/
51352, 00000, "A database state change is required to repair the following failures."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_STATE_CHANGE
/
51353, 00000, "An automatic repair was generated for some of the failures selected for repair.  A database state change is required to repair the following failures."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_STATE_CHANGE_AUTO
/
51354, 0000, "If you have an export of tablespace %s, open the database read/write, then drop and re-create the tablespace and import the data."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_IMPORT_DATA_2
/
51355, 0000, "If you have an export of tablespace %s, offline its data files, open the database read/write, then drop and re-create the tablespace and import the data."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_IMPORT_DATA_3
/
51356, 00000, "Perform a Data Guard role change (using PL/SQL routine DBMS_DG.INITIATE_FS_FAILOVER)."
// *Document: NO
// *Cause:     
// *Action:    
// *Comment: Repair description for DBKH_R_ID_DG_FSFO_FO
/   
51357, 00000, "Perform a Data Guard role change (using Data Guard broker failover)."
// *Document: NO
// *Cause:     
// *Action:    
// *Comment: Repair description for DBKH_R_ID_DG_BROKER_FO
/   
51358, 00000, "Perform a Data Guard role change (failover)."
// *Document: NO
// *Cause:
// *Action:    
// *Comment: Repair description for DBKH_R_ID_DG_FO
/
51359, 00000, "Shut down, mount the database and try flush redo using ALTER SYSTEM FLUSH REDO TO 'standby name' command.  Then perform a Data Guard role change (using Data Guard broker failover).  Available standbys: %s."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_SHUTDOWN_FLUSH_BROKER_FO
/
51360, 00000, "Try flush redo using ALTER SYSTEM FLUSH REDO TO 'standby name' command.  Then perform a Data Guard role change (using Data Guard broker failover).  Available standbys: %s."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_FLUSH_BROKER_FO
/
51361, 00000, "Shut down, mount the database and try flush redo using ALTER SYSTEM FLUSH REDO TO 'standby name' command.  Then perform a Data Guard role change (failover).  Available standbys: %s."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_SHUTDOWN_FLUSH_FO
/
51362, 00000, "Try flush redo using ALTER SYSTEM FLUSH REDO TO 'standby name' command.  Then perform a Data Guard role change (failover).  Available standbys: %s."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_FLUSH_FO
/
51401, 00000, "ASM disk group mount failure can result in failure mounting Oracle database." 
// *Document: NO
// *Cause: ASM disk group mount failed due to disk(s) missing. 
// *Action: 
// *Comment: Damage Description for mount failure due to missing disks. 
/
51402, 00000, "Disk missing from the disk group. Disk number: %s Name: %s Path: %s. \nSee trace file %s."
// *Document: NO
// *Cause:  The specified disk, which is a necessary part of a disk group, 
//          could not be found on the system.
// *Action: Use operating system commands to restore the unavailable hardware. 
// *Comment: Description for mount failure due to missing disks.
/
51403, 00000, "ASM extent allocation failed. ASM disk group may be in unbalanced state."
// *Document: NO
// *Cause: 
// *Action: 
// *Comment: Damage Description for allocation failure due to disk group space exhausted. 
/
51404, 00000, "Disk group '%s' Imbalance: '%s%'. Partner Imbalance: '%s%'. Size Variance: '%s%'"
// *Document: NO
// *Cause: Either Disk group or Disk partners are in imbalance state.
// *Action: Check ASM views to find the available free space in the disk group.
// *Comment: Description for allocation failure due to space exhausted.
/
51405, 00000, "ASM disk not added to disk group as requested."
// *Document: NO
// *Cause: An attempt to add a disk failed because the disk was not visible cluster-wide. 
// *Action: Check ASM_DISKSTRING initialization parameter on each node to ensure that requested disks can be discovered. 
// *Comment: Damage Description for add disk failure due to missing disks. 
/
51406, 00000, "Requested ASM disk(s) not discovered on all nodes where disk group is mounted.\nSee trace file %s."
// *Document: NO
// *Cause:  The requested disk(s) could not be discovered on all clustered nodes. 
// *Action: See trace file for list of disks that were discovered on each node.  
// *Comment: Description for add disk failure due to disk visibility.
/
51407, 00000, "ASM file %s not dropped as requested."
// *Document: NO
// *Cause: 
// *Action: 
// *Comment: Damage Description for drop file failure. 
/
51408, 00000, "Database %s on host %s currently accessing file."
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description for drop file failure.
/
51500, 00000, "HM Test Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Name for the health monitor module test check 
/
51501, 00000, "Check for health monitor functionality"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of check 
/
51502, 00000, "Number of failures to be raised"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51503, 00000, "Number of recommendations to be raised"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51504, 00000, "Damage description parameter value"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51505, 00000, "Failure description parameter value"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51506, 00000, "Dummy element list"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51507, 00000, "DB Structure Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51508, 00000, "Checks integrity of all database files"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51509, 00000, "CF Block Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51510, 00000, "Checks integrity of a control file block"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51511, 00000, "Control file block number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51512, 00000, "Data Block Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51513, 00000, "Checks integrity of a data file block"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51514, 00000, "File number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51515, 00000, "Block number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51516, 00000, "Redo Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51517, 00000, "Checks integrity of redo log content"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51518, 00000, "SCN of the latest good redo (if known)"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51519, 00000, "Logical Block Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51520, 00000, "Checks logical content of a block"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51521, 00000, "Tablespace number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51522, 00000, "Relative block address"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51523, 00000, "Segment header relative block address"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51524, 00000, "Dictionary object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51525, 00000, "Data object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51526, 00000, "Table Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51527, 00000, "Checks integrity of a table"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51528, 00000, "Table object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51529, 00000, "Table check mode"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51530, 00000, "Table-Index Cross Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51531, 00000, "Checks cross references between a table and one of its indexes"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51532, 00000, "Table object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51533, 00000, "Index object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51534, 00000, "Table Row Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51535, 00000, "Checks integrity of a table row"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51536, 00000, "Table object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51537, 00000, "Table rowid"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51538, 00000, "Table-Index Row Mismatch"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51539, 00000, "Checks the cross references between a table row and an index entry"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51540, 00000, "Table object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51541, 00000, "Index object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51542, 00000, "Table rowid"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51543, 00000, "Index entry key"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51544, 00000, "Transaction Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51545, 00000, "Checks a transaction for corruptions"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51546, 00000, "Transaction ID"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51547, 00000, "Undo Segment Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51548, 00000, "Checks integrity of an undo segment"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51549, 00000, "Undo segment number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51550, 00000, "No Mount CF Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51551, 00000, "Checks control file in NOMOUNT mode"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51552, 00000, "CF Member Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51553, 00000, "Checks a multiplexed copy of the control file"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51554, 00000, "Control file name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51555, 00000, "All Datafiles Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51556, 00000, "Checks all datafiles in the database"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51557, 00000, "Single Datafile Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51558, 00000, "Checks a data file"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51559, 00000, "File number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51560, 00000, "Log Group Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51561, 00000, "Checks all members of a log group"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51562, 00000, "Log group number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51563, 00000, "Log Group Member Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51564, 00000, "Checks a particular member of a log group"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51565, 00000, "Log group number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51566, 00000, "Log file name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51567, 00000, "Archived Log Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51568, 00000, "Checks an archived log"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51569, 00000, "Archived log name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51570, 00000, "Archived log record ID"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51571, 00000, "Redo Revalidation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51572, 00000, "Checks redo log content"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51573, 00000, "SCN of the latest good redo (if known)"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51574, 00000, "IO Revalidation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51575, 00000, "Checks file accessibility"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51576, 00000, "Inaccessible file name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51577, 00000, "Inaccessible file number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51578, 00000, "IO reason"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51579, 00000, "File block size"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51580, 00000, "File block number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51581, 00000, "Block IO Revalidation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51582, 00000, "Checks file accessibility"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51583, 00000, "Inaccessible file name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51584, 00000, "Inaccessible file number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51585, 00000, "File block size"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51586, 00000, "Inaccessible block number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51587, 00000, "Txn Revalidation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51588, 00000, "Revalidate corrupted transaction"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51589, 00000, "Transaction id"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51590, 00000, "Failure Simulation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51591, 00000, "Creates dummy failures"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51592, 00000, "Dummy failure id"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51593, 00000, "Dummy failure parameters"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51594, 00000, "Dictionary Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51595, 00000, "Checks dictionary integrity"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51596, 00000, "Table name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51597, 00000, "Check mask"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51598, 00000, "ASM Mount Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51599, 00000, "Diagnose mount failure"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51600, 00000, "ASM disk number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51601, 00000, "ASM group number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51602, 00000, "ASM Allocation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51603, 00000, "Diagnose allocation failure"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51604, 00000, "ASM group name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51605, 00000, "ASM Disk Visibility Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51606, 00000, "Diagnose add disk failure"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51607, 00000, "ASM File Busy Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51608, 00000, "Diagnose file drop failure"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51609, 00000, "ASM path name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51610, 00000, "Tablespace Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51611, 00000, "Checks a tablespace"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51613, 00000, "Tablespace number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
51614, 00000, "Mount CF Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51615, 00000, "Checks control file in mount mode"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
