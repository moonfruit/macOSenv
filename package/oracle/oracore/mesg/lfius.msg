/ 
/ $Header: lfius.msg 11-jan-2008.03:14:17 madhanap Exp $ 
/ 
/ Copyright (c) 1993, 2003, Oracle.  All rights reserved.
/   NAME
/     lfius.msg - LFI US language error message file
/   DESCRIPTION
/     Error message file for LFI package
/   RETURNS
/
/   NOTES
/     <other useful comments, qualifications, etc.>
/
/ LFI Error Messages
/
/
// 00000, 00000, "Normal, successful completion."
// *Cause:  	Normal exit
//
// *Action: 	None
//
// 00001, 00000, "File IO Internal Error #%ld"
// *Cause:  	An internal error occurred. 
//
// *Action: 	Contact the development organization.
//
/
/
/ Generic errors 
/
/
00002, 00000, "Out of memory. %s"
// *Cause:  	The File IO package failed in trying to dynamically allocate 
//		memory. function name  is used for additional comments to 
//              indicate where, when and why the error occured.
//
// *Action: 	Perform whatever actions necessary to make more memory available
//		to the executing program.
//
00003, 00000, "Internal exception code. icode = [%s], [%s]."
// *Cause:  	Unknown - indicated by parameters. The first '%s' gives
//	    	the internal exception code; the second is for any other
//	    	additional comments. 
//
// *Action: 	Report to the appropriate development group
//
00004, 00000, "Call to %s failed."
// *Cause:  	A function call has failed.  This error is a generic
//		message to show that the exception has occurred in a
//		particular function function name.  This allows the client to 
//		know the trace runtime calling sequence by examining the
//		exception stack. 
//
// *Action: 	See the accompanying error messages for more information.
//
00005, 00000, "Free some memory failed in %s."
// *Cause:	A call to free some memory in function function name has failed.
//
// *Action: 	See the accompanying error messages for more information and
//		contact Oracle Worldwide Support immediately.
//
00006, 00000, "Invalid parameter to function %s."
// *Cause:	The function was called with an invalid parameter.
//
// *Action: 	Check the function call to make sure that the correct 
//		parameters are being passed.
//
00007, 00000, "NLSRTL's call failed. %s."
// *Cause:	LX calls return failure
//
// *Action: 	Check if our parameters are correct.  Contact the
//              appropriate group immediately if we parameters are valid.
//
00008, 00000, "SLTS's initializing/terminating mutex failed for %s."
// *Cause:	SLTS's call return failure in function '%s'.
//
// *Action: 	Contact the appropriate development group.
//
//
/
/ 100-999 Reserved for LFI Public interface errors
/
/
00100, 00000, "Unable to perform operation, file not opened in %s."
// *Cause:  	The file has not been successfully opened at the time the 
//	    	operation is attempted.
//          
// *Action: 	Check to make sure that the file exists (for read) or that 
//	    	the program has access to the write a file (for write).
//	    	It is also possible that the file was just never opened
//          
00101, 00000, "Write failed, file cannot be written to."
// *Cause:  	The buffer write operation failed.  Possibly due to incorrect
//	    	parameters being passed in.
//          
// *Action: Check the underlying error for more information.
//          
00102, 00000, "Unable to seek in sequentially accessed file."
// *Cause:  	The file was opened with the flag LFILFA_SEQ for sequential
//	    	file operations.  Use seek only on files that are
//		opened with the LFILFA_RANDOM flag for random access.
//          
// *Action: 	Check to see how the file is being opened and accessed and
//		make the two operations consistent (that is, make them both
//              operations either sequential or random).
//          
00103, 00000, "Seek operation failed."
// *Cause:  	The buffer seek operation failed.  Probably due to incorrect
//		parameters or flags.
//          
// *Action: 	Check syntax of the seek command and retry the operation.
//          
00104, 00000, "Read operation failed."
// *Cause:  	The buffer read operation failed.  Probably due to incorrect
//		parameters or flags.
//          
// *Action: 	Check syntax of the read command and retry the operation.
//          
00105, 00000, "Unable to add path."
// *Cause:  	One of the following might have caused the error:
//                 the current path might not be in the proper format
//                 the directory might not be in the proper format
//                 the name object might not have been initialized properly
//          
// *Action: 	Check the format of the current path and the new directory;
//		check that the name object was initialized properly.
//          
00106, 00000, "Path object holds more than one path."
// *Cause:  	The path object passed to lfippth() holds more than
//		one path.
//          
// *Action: 	Make sure that the path object used in lfippth() holds
//		only one path.
//          
00107, 00000, "Open does not expect the file [%s][%s] to exist."
// *Cause:  	The flags specified for the open indicate that the file does
//		not exist. However, the file does exist.
//          
// *Action: 	Check to make sure that the options that were specified for 
//		the file are correct and that you do not expect that the file
//		should exist.  If so then find out why the file does exist.
//          
00108, 00000, "Open expect the file [%s][%s] to exist."
// *Cause:  	The flags specified for the open indicate that the file
//		the file to exist and it does not.
//          
// *Action: 	Check to make sure that the options that were specified for 
//		the file are correct and that you expect that the file
//		should exist.  If so then find out why the file doesn't.
//
00109, 00000, "Unable to open file [%s][%s].  %s."
// *Cause:  	Either:
//		  the process does not have the proper access rights to open 
//                  the file
//                the file is already open
//          
// *Action: 	Check to make sure the proper access permissions are assigned.
//              If they are and the file still cannot be opened, then
//		contact Oracle Worldwide Support.
//          
00110, 00000, "Unable to initialize the Buffer Manager."
// *Cause:  	The Buffer Manager initialization routine failed; probably 
//              because memory was exhausted.
//          
// *Action: 	See the accompanying error messages for more information.
//          
00111, 00000, "No other flags allowed in fixed length format."
// *Cause:  	Other options are specified with the fixed length format.
//          
// *Action: 	Clear other options from flag.
//
//          
// 00112, 00000, "Invalid Standard File ID Descriptor."
// *Cause:  	The function lfigfo() was called with an invalid File ID
//		Descriptor.  The valid File ID Descriptors are LFISTDIN,
//		LFISTDOUT, and LFISTDERR.
//          
// *Action: 	Check the call to lfigfo() to make sure it is correct.
//          
00113, 00000, "Unable to initialize the Standard File object %s."
// *Cause:  	The call to open the standard file object failed.  
//          
// *Action: 	Check the underlying errors for more information.
//          
00114, 00000, "Append is not allowed with %s."
// *Cause:  	Attempting to append using certain options.
//          
// *Action:  	Check the flag options to verify its usage.
//
//          
00115, 00000, "Buffer free failed."
// *Cause:  	Probably do to the buffer flush failing.
//          
// *Action: 	See the accompanying error messages for more information.
//          
00116, 00000, "Unable to close file in operation %s."
// *Cause:  	The file close operation failed.
//          
// *Action: 	See the accompanying error messages for more information.
//          
00117, 00000, "Unable to rename file."
// *Cause:  	The rename operation failed.  Rename is called when we are
//		protecting a file by operating on a temp file.
//          
// *Action: 	Check to make sure that the process has the correct 
//		access rights to perform a rename.
//          
00118, 00000, "Unable to change type to Unknown."
// *Cause:  	The function lfichty() was called to change the file 
//		extension to LFIEXUNK (Unknown).  This is not a valid
//		operation.
//          
// *Action: 	Check why you are doing this.  If the extension is already
//		unknown then you do not need to do this.  If you just want
//		no extension then use the extension type LFIEXNONE.
//          
00119, 00000, "Unable to Abort an Unprotected file."
// *Cause:  	The Abort function lfiabt() was called on a file that 
//		was not opened as a protected file.  As such the abort
//		operation is not valid.
//          
// *Action: 	Check to see if you intended to open the file as a protected
//		file.
//          
00120, 00000, "Unable to parse root filename %s."
// *Cause:  	The root filename that was given to lfimknam() is not in a 
//		format that this platform understands.
//          
// *Action: 	Check the format of the filename and retry the operation.
//          
00121, 00000, "Only one of REPLACE, or PROT allowed for opty."
// *Cause:  	Two or more of the following open type options were 
//		specified for the lfilini() function: LFILOPTY_REPLACE,
//		or LFILOPTY_PROT.
//          
// *Action: 	Remove one or more the of options such that you are only 
//		passing in one of the three.
//          
00122, 00000, "Can only delete a file if we create it."
// *Cause:  	The delete file flag was specified for a file that was not
//		created by this file operation.  The ability to delete a 
//		file is not portable.  As such the only deletion that 
//		is allowed by this package is if we know we want to delete 
//		the file when we create it.
//          
// *Action: 	You can only delete a file that you create.  If you need
//		to delete a file that you do not create then you will have
//		to find another means of doing so.
//          
00123, 00000, "Cannot access file Sequentially and Randomly."
// *Cause:  	Both the LFILFA_SEQ (sequential) and LFILFA_RANDOM (random) 
//              flags were specified during the file object creation.  This 
//              is not allowed.  Only one of the two may be specified.
//          
// *Action: 	Choose how you wish to access the file.  If you choose 
//		random you can still access sequentially by just not using
//		the repositioning functions.
//          
00124, 00000, "No access mode was specified, default is sequential."
// *Cause:  	Neither LFILFA_SEQ (sequential) or LFILFA_RANDOM (random) were 
//              specified during file object creation. 
//          
// *Action: 	The default is sequential but this should be explicitly set.
//          
00125, 00000, "Random access only allowed on fixed length record files."
// *Cause:  	The LFILFA_RANDOM flag was specified on a file that was
//		not organized into fixed-length records.  Random access
//		is only allowed on fixed-length record files.
//          
// *Action: 	Determine if the organization of your data needs to be in
//		variable-length records and if you need to have random 
//		access to the file.  If both conditions are true then
//		you might need to buffer the entire file or enough of it
//		to remove your need for random access.  Another option is
//		to close and rescan the file although this is not the
//              optimal solution.
//          
00126, 00000, "Record format can only be one of Fixed or Variable."
// *Cause:  	Both LFILRF_FIXED (fixed) and LFILRF_VAR (variable) were 
//              specified during file object creation. Only one of the two is 
//		allowed for a given file.
//          
// *Action: 	Determine how the file is organized and choose the option
//		that matches.
//          
00127, 00000, "No Record Format was specified, default is variable."
// *Cause:  	Neither LFILRF_FIXED (fixed) or LFILRF_VAR (variable) were 
//              specified for record format.  One of the two must be specified 
//		for each file.
//          
// *Action: 	The default is LFILRF_VAR, but this should be explicitly set
//		during file object creation.
//          
00128, 00000, "Carriage Control is only valid for Standard file objects."
// *Cause:  	The Carriage Control option is only valid for the 
//		standard file objects (LFISTDIN, LFISTDOUT, LFISTDERR).
//		You may not specify this option for any other type of file.
//          
// *Action: 	Choose between LFILRF_FIXED and LFILRF_VAR for the record
//		format.
//          
00129, 00000, "Invalid option %s were specified on an input only file."
// *Cause:  	The file was opened as input only but the output mode 
//		option LFILRF_WR_ASIS or delete option LFLOPTY_DELETE
//		was specified.  
//          
// *Action: 	Check to see how you intend to open this file and make the
//		necessary changes.
//          
00130, 00000, "Input option specified on output only file."
// *Cause:  	The file was opened as output only but one of the input
//		mode options (LFILRF_READ_NL or LFILRF_FORCE_NL) or was
//		specified.
//          
// *Action: 	Check to see how you intend to open this file and make the
//		necessary changes.
//          
00131, 00000, "No open type specified."
// *Cause:  	The file object was created without an open type (that is, 
//		LFILOPTY_INPUT, LFILOPTY_OUTPUT, etc.).
//          
// *Action: 	Decide how the file should be accessed and specify one of
//		the open types.
//          
00132, 00000, "Record length %s is greater than max length of %s."
// *Cause:  	The record length specified for the file is greater than
//		the max supported by this platform.
//          
// *Action: 	Decrease the record length.
//          
00133, 00000, "Trying to create file %s that already exists."
// *Cause:  	The file object was initialized with LFILOPTY_OUTPUT and
//		without LFILOPTY_REPLACE and yet a file by this name already
//		exists.
//          
// *Action: 	Check to make sure that you are creating the right file.  If
//		you intend to overwrite the file if it exists that specify the
//		replace option LFILOPTY_REPLACE when initializing the file 
//		object.
//          
00134, 00000, "Unable to protect a file for an append operation."
// *Cause:  	The LFILOPTY_APPEND and LFILOPTY_PROT options were both
//		specified for the file.  This is currently not allowed because
//		it would require copying the entire file at open time.
//          
// *Action: 	Decide if you really need to protect the file for append.  If
//		so then think about making a copy of it before appending.
//          
00135, 00000, "Unable to remove temporary file."
// *Cause:  	A temporary file was created to protect a file and when the
//          	the tempfile was nolonger needed it  LFI attempted to remove 
//		it and was unable to do so.
//
// *Action: 	Check the permissions and where the temp files are being 
//		created.
//          
00136, 00000, "Unable to change type of open file."
// *Cause:  	The function lfichty() was called on an opened file.
//
// *Action: 	This is a bug in the client code.  lfichty() cannot be
//		used in this case.
//          
00137, 00000, "Unable to perform %s on a file object that is %s."
// *Cause:  	Unable to perform an LFI operation on a file object for
//		the given reason.
//          
// *Action: 	Take the appropriate corrective measure.  For example
//		if a file is supposed to be opened before the
//		operation can be performed, client code will need to
//		open the file first.
//          
00138, 00000, "Unable to perform %s on a name object that is %s."
// *Cause:  	Unable to perform an LFI operation on a name object for
//		the given reason.
//          
// *Action: 	Take the appropriate corrective measure.
//
00139, 00000, "Option %s cannot be used with option %s in calling %s."
// *Cause:  	First option cannot be used with second option in such
//		a function call.
//          
// *Action: 	Re-examine code to determine which option is needed.
//          
00140, 00000, "Invalid option %s were specified on input-output file."
// *Cause:  	The file was opened as input-output and one of the 
//		mode options (LFIOPTY_DELETE or non-LFIOPTY_RANDOM)
//		was specified.
//          
// *Action: 	Check to see how you intend to open this file and make the
//		necessary changes.
//
00141, 00000, "Unable to abort file in operation %s."
//
// *Cause:  	The abort operation failed.
//          
// *Action: 	Check the underlying errors for more information.
//
00142, 00000, "Unable to delete an existing file [%s][%s] not owned by Oracle."
//
// *Cause:      The file was not created by Oracle.
//
// *Action:     Change owner of file to Oracle or give Oracle access
//              privileges to delete it.
//
00143, 0000, "Unable to delete non-existent file %s."
//
// *Cause:      The file to be deleted does not exist.
//
// *Action:     Check the underlying errors for more information.
//
00144, 00000, "File [%s][%s] does not exist"
// *Cause:      The file does not exist.
//
// *Action:     Check to make sure the file exists and retry the operation.
//
00145, 00000, "User buffer too short."
//
// *Cause:      The buffer that was passed is not large enough.
//
// *Action:     Allocate a larger buffer and retry the operation.
//
00146, 00000, "copy does not expect the file %s.%s to exist"
// *Cause:  	We are expecting the destination file not to exist and it does.
//          
// *Action: 	Find out why the file does exist.
//
00147, 00000, "File %s.%s does not exist"
// *Cause:  	The file does not exist.
//          
// *Action: 	Check to make sure the file exists and retry the operation.
//
00148, 00000, "%s can be called only on files opened in byte mode"
// *Cause:      A routine that should be used only for files in byte 
//              mode was called for a file that was opened in record 
//              mode
//
// *Action:     In order to use this function, the file should be opened in
//              byte mode.
//
00149, 00000, "Error on destroying hash table in function %s"
// *Cause:      We were expecting the cache path object and it does not.
//
// *Action:     In order to use this function, the path object should be 
//              cache path object.
//
00150, 00000, "Error on creating hash table in function %s"
// *Cause:      routine failed to create path object hash table
//
// *Action:     make sure that startsize <= LHTQMAXSLOTS
//
00151, 00000, "Error on inserting into hash table in function %s"
// *Cause:      routine failed to insert into hash table
//
// *Action:     make sure there is enough memory for allocation and
//              that the hash table exists.
//
00152, 00000, "Read operation (byte mode) failed."
// *Cause:  	Byte mode read operation failed.  Probably due to incorrect
//		parameters or flags, or trying to read beyond end of file.
//          
// *Action: 	Check syntax of the read command and size of file.
//          
/
/
/ 1000-1499 Reserved for LFI Buffer Manager errors
/
/
01000, 00000, "Unable to write line to file."
// *Cause:  	The file being written to may no longer be open or we may have 
//	    	reached the end of the file.
//          
// *Action: 	Examine underlying errors for more information.
//          
01001, 00000, "Unable to write %s bytes to file."
// *Cause:  	The file being written to may no longer be open or we may have 
//	    	reached the end of the file.
//          
// *Action: 	Examine underlying errors for more information.
//          
01002, 00000, "Unable to read line from file."
// *Cause:  	The file being read from may no longer be open.
//          
// *Action: 	Examine underlying errors for more information.
//          
01003, 00000, "Unable to read %s bytes from file."
// *Cause:  	The file being read from may no longer be open.
//
// *Action: 	See the accompanying error messages for more information.
//          
01004, 00000, "Unable to empty buffer."
// *Cause:  	The buffer manager is probably unable to write to the 
//	    	underlying file.
//
// *Action: 	Examine underlying errors for more information.
//          
01005, 00000, "Unable to fill buffer."
// *Cause:  	The buffer manager is probably unable to read from the 
//	    	underlying file.
//
// *Action: 	See the accompanying error messages for more information.
//
01006, 00000, "File ends in partial character in %s."
// *Cause:  	A line ends in a partial character.
//
// *Action: 	Examine underlying errors for more information.
//
01007, 00000, "Line is too long; encountered in function %s."
// *Cause:  	The length of the line exceeds the maximum length.
//
// *Action: 	Examine underlying errors for more information.
//
/
/ 1500-1599 Reserved for LFI OSD errors
/
/
01500, 00000, "Error condition on call to OSD function %s."
// *Cause:  	An error condition arises in calling an OSD function.
//		This message occurs if calls to malloc or free
//		functions failed.
//
// *Action: 	Contact Oracle Worldwide Support.
//          
01501, 00000, "tmpnam() fails to generate temporary file name."
// *Cause:  	Operating system was unable to create temporary file name.
//
// *Action: 	Contact the development organization.
//          
01502, 00000, "Base filename does not exist."
// *Cause:  	The filename that was parsed had no base file.  It was either
//	    	all path or extension.
//
// *Action: 	Check the filename being passed in to make sure it is correct.
//          
01503, 00000, "Max filename size exceeded generating filename."
// *Cause:  	While building a filename we exceeded the buffer allocated 
//	    	to hold the new filename.
//
// *Action: 	Contact the development organization.
//          
01504, 00000, "fseek() failed(OSD return value = %s) in %s."
// *Cause:  	The function fseek() returned an error condition.
//
// *Action: 	Contact Oracle Worldwide Support.
//          
01505, 00000, "fclose() failed(OSD return value = %s) in %s."
// *Cause:  	The function fclose() returned an error condition.
//
// *Action: 	Contact Oracle Worldwide Support.
//
01506, 00000, "fflush() failed(OSD return value = %s)."
// *Cause:  	The function fflush() returned an error condition.
//
// *Action: 	Contact the development organization.
//          
01507, 00000, "fwrite() failed(OSD return value = %s) in %s."
// *Cause:  	File pointer may be null or may not be opened for write.
//
// *Action: 	Contact the development organization.
//
01508, 00000, "access() failed."
// *Cause:  	Call to access() failed.
//
// *Action: 	Contact the development organization.
//
01509, 00000, "fopen() failed(OSD return value = %s)."
// *Cause:  	Call to fopen() failed.
//
// *Action: 	Contact Oracle Worldwide Support.
//
01510, 00000, "fread() failed(OSD return value = %s) in %s."
// *Cause:  	Call to fread() failed.
//
// *Action: 	Contact Oracle Worldwide Support.
//
01511, 00000, "unlink() failed(OSD errno = %s) in %s."
// *Cause:  	Call to unlink() failed.
//
// *Action: 	Contact the development organization.
//
01512, 00000, "stat() failed"
// *Cause:  	Call to stat() failed.
//
// *Action: 	Contact Oracle Worldwide Support.
//
01514, 00000, "ftell() failed in %s"
// *Cause:      The ftell() function returned an error.
//
// *Action:     Contact Oracle Worldwide Support.
//
01515, 00000, "truncate() failed."
// *Cause:      The function truncate() returned an error condition.
//
// *Action:     Contact the development organization.
//
01516, 00000, "read() failed (OSD return value = %s) in %s."
// *Cause:  	Call to read() failed.
//
// *Action: 	Contact the development organization.
//
01517, 00000, "open() failed(OSD return value = %s)."
// *Cause:  	Call to open() failed.
//
// *Action: 	Contact the development organization.
//
01518, 00000, "write() failed(OSD return value = %s) in %s."
// *Cause:  	Call to write() failed.
//
// *Action: 	Contact the development organization.
//
01519, 00000, "llseek() failed(OSD return value = %s) in %s."
// *Cause:  	The  llseek() function returned an error.
//
// *Action: 	Contact Oracle Worldwide Support.
//          
01520, 00000, "close() failed(OSD return value = %s) in %s."
// *Cause:      The function close() returned an error condition.
//
// *Action:     Contact the development organization.
//
01521, 00000, "fsync() failed(OSD return value = %s) in %s."
// *Cause:      The function fsync() returned an error condition.
//
// *Action:     Contact the development organization.
//
01522, 00000, "opendir() failed."
// *Cause:      The function opendir() returned an error condition.
//
// *Action:     Contact the development organization.
//
01523, 00000, "rename() failed."
// *Cause:      The function rename() returned an error condition.
//
// *Action:     Contact the development organization.
//
01524, 00000, "fdopen() failed(OSD return value = %s)."
// *Cause:      Call to fdopen() failed.
//
// *Action:     Contact the development organization.
//
01525, 00000, "setvbuf() failed."
// *Cause:      The function setvbuf() returned an error condition.
//
// *Action:     Contact the development organization.
//
/
/
/ LFI Internal errors
/
/
// 000001,	"Extension not in list"
// *Cause:  	When calling lfiext, an extension is not found in list
//
// *Action: 	Contact the development organization.
//          
// 000002,	"lfipmkp's pop's tail is NULL"
// *Cause:  	An internal error has occurred that cause pop's tail
//		to be NULL.
//
// *Action: 	Contact the development organization.
//          
// 000003,	"Unexpected switch case in %s"
// *Cause:  	An unexpected switch to default has occurred.
//
// *Action: 	Contact the development organization.
//
// 000004,	"sltbev() call failed"
// *Cause:  	A call to sltbev() had failed.
//
// *Action: 	Contact the development organization.
//
// 000005,	"Invalid parameter in internal function %s"
// *Cause:  	Invalid parameter has been passed into an internal
//		function. 
//
// *Action: 	Contact the development organization.
// 00006,	"Invalid Standard File ID Descriptor"
// *Cause:  	The function lfiostd() was called with an invalid File ID
//		Descriptor.  The valid File ID Descriptors are LFISTDIN_INDEX,
//		LFISTDOUT_INDEX, and LFISTDERR_INDEX.
//          
// *Action: 	Check the call to lfiostd() to make sure it is
//		correct.
//
//
// 00007,	"List element not found"
// *Cause:  	A call to lfillmem() had failed.
//          
// *Action: 	Contact development service
//
// 00008,	"lficstd failed when calling lfibfr()"
// *Cause:  	A call to lficstd() had failed.
//          
// *Action: 	Contact development service
//
