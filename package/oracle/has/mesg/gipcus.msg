/ Copyright (c) Oracle 2007.  All Rights Reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   gipcus.msg
/
/ DESCRIPTION
/   Message file for Generic Inter-Process Communication.
/
/ NOTES
/
/ MODIFIED
/    dbrower    05/04/09 - temp add some missing msgs.
/
/
00000, 0, "general success."
// *Cause:  The operation succeeded.
// *Action: No action is required.
/
00001, 0, "general failure."
// *Cause:  A GIPC operation failed.
// *Action: Examine the trace and log files for the specific cause.
/
00002, 0, "GIPC needs to be initialized."
// *Cause:  The application failed to initialize GIPC prior to performing an
//          operation.
// *Action: Initialize GIPC.
/
00003, 0, "object being used fails validation."
// *Cause:  
// *Action: 
/
00004, 0, "unrecognized type specified."
// *Cause:  
// *Action: 
/
00005, 0, "attribute unrecognized for object."
// *Cause:  
// *Action: 
/
00006, 0, "address and endpoint do not match."
// *Cause:  
// *Action: 
/
00007, 0, "types of objects do not match."
// *Cause:  
// *Action: 
/
00008, 0, "assignment of value not allowed."
// *Cause:  
// *Action: 
/
00009, 0, "permissions failure on operation."
// *Cause:  
// *Action: 
/
00010, 0, "request operation has not been implemented."
// *Cause:  
// *Action: 
/
00011, 0, "requested operation not supported on object."
// *Cause:  
// *Action: 
/
00012, 0, "connected endpoint lost connection."
// *Cause:  
// *Action: 
/
00013, 0, "endpoint not properly connected."
// *Cause:  
// *Action: 
/
00014, 0, "buffer not large enough to hold data."
// *Cause:  The buffer provided by the application was not big enough to hold
//          the data received.
// *Action: Use a larger buffer.
/
00015, 0, "asynchronous request is still not done."
// *Cause:  
// *Action: 
/
00016, 0, "timeout waiting on request."
// *Cause:  A wait call returned because the time expired.
// *Action: This error happens normally in most cases. If this error was not
//          expected, examine the trace and log files for the reason.
/
00017, 0, "waiting call has been posted."
// *Cause:  A wait was interrupted by another thread posting it.
// *Action: This error happens normally in most cases. If this error was not
//          expected, examine the trace and log files for the reason.
/
00018, 0, "endpoint is busy processing other requests."
// *Cause:  
// *Action: 
/
00019, 0, "the object is already contained."
// *Cause:  
// *Action: 
/
00020, 0, "bind address already in use."
// *Cause:  The application attempt to bind an endpoint to an address which has
//          already been bound.
// *Action: Specify another address.
/
00021, 0, "general security authorization failure."
// *Cause:  
// *Action: 
/
00022, 0, "remote entity rejected authorization."
// *Cause:  
// *Action: 
/
00023, 0, "connection operation in progress on endpoint."
// *Cause:  
// *Action: 
/
00024, 0, "marks end of list of valid return codes."
// *Document: NO
// *Cause:  
// *Action: 
/
0025, 0, "enqueue failed because queue is full"
// *Document: NO
// *Cause:  
// *Action: 
/
0026, 0, "dequeue failed because queue is empty"
// *Document: NO
// *Cause:  
// *Action: 
/
0027, 0, "could not find desired entry in queue"
// *Document: NO
// *Cause:  
// *Action: 
/
0028, 0, "failed memory allocation"
// *Document: NO
// *Cause:  
// *Action: 
/
0029, 0, "no one listening on the other end"
// *Document: NO
// *Cause:  
// *Action: 
/
0030, 0, "internal failure caused connection loss"
// *Document: NO
// *Cause:  
// *Action: 
/
0031, 0, "connection gracefully closed locally"
// *Document: NO
// *Cause:  
// *Action: 
/
0032, 0, "comm protocol failure (clsc, packet, etc)"
// *Document: NO
// *Cause:  
// *Action: 

0033, 0, "reuse of an endpoint"
// *Document: NO
// *Cause:  
// *Action: 
/
0034, 0, "connection to GIPCD has failed"
// *Document: NO
// *Cause:  
// *Action: 
/
0035, 0, "communications with GIPCD have timed out"
// *Document: NO
// *Cause:  
// *Action: 
/
0036, 0, "gipcMap key not found"
// *Document: NO
// *Cause:  
// *Action: 
/
0037, 0, "gipcMap bad argument type"
// *Document: NO
// *Cause:  
// *Action: 
/
0038, 0, "gipcMap duplicate key"
// *Document: NO
// *Cause:  
// *Action: 

  
