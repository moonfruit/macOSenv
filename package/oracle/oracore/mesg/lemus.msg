/ 
/ $Header: lemus.msg 19-jun-2003.17:48:06 Exp $ 
/ 
/ Copyright (c) 1991, 2003, Oracle.  All rights reserved.
/   NAME
/     lemus.msg - LEM US language error message file
/   DESCRIPTION
/     Error message file for LEM package
/   RETURNS
/
/   NOTES
/     <other useful comments, qualifications, etc.>
/
00000, 00000, "normal, successful completion"
// *Cause:  Normal exit
// *Action: None
00001, 00000, "out of memory"
// *Cause:  The exception manager failed in trying to dynamically allocate 
//          memory.
// *Action: Perform whatever actions you wish to make more memory available
//          to the running program.
00002, 00000, "no exception frame to pop to"
// *Cause:  Corrupted exception frame stack
// *Action: None
00003, 00000, "exception stack full, couldn't record exceptions %d and %d"
// *Cause:  Too many exceptions in stack
// *Action: Remove some exceptions from the stack
00004, 00000, "unable to find LMS file for product %s and facility %s"
// *Cause:  LMS error
// *Action: Generic error messages will be reported
00005, 00000, "unable to find message for error %s"
// *Cause:  No message for current exception number
// *Action: Generic error message will be reported
00006, 00000, "missing facility or product name"
00023, 00000, "could not open log file"
// *Cause:  File I/O failed
// *Action: None
00030, 00000, "Invalid argument %s passed to %s."
// *Cause:  Unknown -- likely to be client error.
// *Action: Examine arguments being passed to this program.
//
00031, 00000, "Error encountered in %s after calling %s."
// *Cause:  Unknown -- some errors encountered in the function called.
// *Action: Investigate the error returned from the function called.
//
00032, 00000, "Null %s in function %s."
// *Cause:  A null pointer to a variable is found.
// *Action: Examine this null pointer to see if it's valid.
//
00033, 00000, "Error in %s:  %s"
// *Cause:  Unknown - could be caused by a number of things (calls to other 
//          functions, accessing invalid pointers, etc)        
// *Action: Investigate the error specified in the message.
//
00900, 00000, "internal exception code, arguments: [%s], [%s], [%s], [%s], [%s], [%s]"
// *Cause:  An internal error occurred. 
// *Action: Contact the development organization.
00901, 00000, "fatal exception occurred: unwise to proceed"
// *Cause:  Unknown
// *Action: Contact the appropriate development group immediately
