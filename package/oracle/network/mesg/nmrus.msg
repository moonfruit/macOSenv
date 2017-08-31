/ Copyright (c) 1991 by the Oracle Corporation.  All rights reserved.
/
/ $Header: /netrcs/RCS/oracle/network/nm/nmc/RCS/nmrus.msg,v 1.5 1994/02/07 01:41:24 eminer Exp $
/
/ NAME     
/   nmrus.msg
/
/ FUNCTION 
/   ROS US error message file
/
/ NOTES
/
/	ROS should have one of these, but they don't, so we make one up using
/	their error message header file roserr.h.  Note that error codes zero
/	and 1 are switched (ROS has 1 as success, 0 as generic failure) because
/	zero failure codes confuse various parts of nler.  That means that
/	if your code uses this file, you will need to transform the ros op
/	return codes appropriately (you already need to multiply them by -1
/	because they are negative).
/
/       Message text should be limited to a maximum of 76 characters.
/	Messages containing embedded % directives should not overrun
/	the 76 character limit unless they signal unusual errors
/	which do not occur as part of user applications.  For example,
/	startup errors and system-dependent errors can probably get
/	away with longer message text.
/
/ OWNER
/   markl
/
/ MODIFIED
/
/   $Log: nmrus.msg,v $
/    Revision 1.5  1994/02/07  01:41:24  eminer
/    Change all occurences of 'your customer support representative" to
/     "Worldwide Customer Support"
/
/    Revision 1.4  1994/01/18  19:07:43  dstowell
/    make messages translate=no
/
/    Revision 1.3  1993/10/05  18:44:10  markl
/    Update cause and action data
/
/    Revision 1.2  1993/08/20  22:45:56  markl
/    New detailed ROS error message
/
/    Revision 1.1  1993/07/26  20:56:58  markl
/    Initial revision
/
/
/
/						Translate:
/						==========
/ Internal errors 				no
/
/
/
00000, 00000, "normal, successful completion"
00001, 00000, "generic operation failure"
// *Cause: A ROS operation failed.
// *Action: The error generally appears below a more general error which
// will tell you where the problem is occurring.  See the action text for
// that error.
/
00100, 00000, "unexpected end of file"
// *Cause: A ROS file operation detected an end-of-file when it was not 
// expecting one, probably because the file has become corrupted.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00101, 00000, "object not found"
// *Cause: A ROS fetch operation failed to find any objects.
// *Action: The error generally appears below a more general error which
// will tell you where the problem is occurring.  See the action text for
// that error.
/
00102, 00000, "object unexpectedly found"
// *Cause: A ROS operation found an object when it was not expecting to.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00103, 00000, "value too big"
// *Cause: A ROS operation received an incorrect value.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00104, 00000, "invalid value"
// *Cause: A ROS operation received an invalid value.
// expecting one, probably because the file has become corrupted.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00105, 00000, "invalid data store"
// *Cause: A ROS operation detected an invalid data store, probably
// because the data store has become corrupted.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00106, 00000, "invalid object type"
// *Cause: A ROS operation received a value with an invalid type.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00107, 00000, "unexpected NULL value"
// *Cause: A ROS operation received an unexpected empty value.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00108, 00000, "undefined or invalid table name"
// *Cause: A ROS operation was performed on an invalid table.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00109, 00000, "invalid argument"
// *Cause: A ROS operation received an invalid argument.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00200, 00000, "ROS file error"
// *Cause: A ROS file operation detected an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00201, 00000, "unique key violation"
// *Cause: A ROS file operation detected a unique key constraint violation.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00205, 00000, "page split occurred"
// *Cause: A ROS file operation detected a page split.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00207, 00000, "cannot close, commit is pending"
// *Cause: The ROS user attempted to close a data store with a commit pending.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00210, 00000, "error creating file"
// *Cause: The ROS file store create operation failed.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00211, 00000, "file version error"
// *Cause: ROS detected a file store with an incorrect version.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00212, 00000, "file already open read-only"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00213, 00000, "file already open read-write"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00214, 00000, "file write error"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00215, 00000, "file read error"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00216, 00000, "file close error"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00217, 00000, "file write error, disk is full"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00218, 00000, "file unique key violation"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00221, 00000, "file header page size error"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00222, 00000, "file error, commit is pending"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00223, 00000, "file byte order conversion error"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00225, 00000, "file error, translate check byte"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00226, 00000, "file index page is already free"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00230, 00000, "file state is inconsistent"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00240, 00000, "file shadow table overflow"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00300, 00000, "UPI error"
// *Cause: A ROS database operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00301, 00000, "disk space exhausted"
// *Cause: A ROS file operation received an error.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
00401, 00000, "memory allocation failed"
// *Cause: The application has run out of memory.
// *Action: Add more memory or run fewer processes.
/
00402, 00000, "memory reallocation failed"
// *Cause: The application has run out of memory.
// *Action: Add more memory or run fewer processes.
/
00403, 00000, "memory free failed"
// *Cause: The application's memory heap has become corrupted.
// *Action: An internal error not normally visible to the user.  For further
// details, turn on tracing and re-execute the failing operation.  If the 
// error persists, contact Worldwide Customer Support.
/
