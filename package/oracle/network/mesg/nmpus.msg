/ Copyright (c) 1991 by the Oracle Corporation.  All rights reserved.
/
/ $Header: /netrcs/RCS/oracle/network/nm/nmp/RCS/nmpus.msg,v 1.6 1994/02/07 01:41:24 eminer Exp $
/
/ NAME     
/   nmpus.msg
/
/ FUNCTION 
/   Network Management Protocol US error message file
/
/ NOTES
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
/
00000, 00000, "normal, successful completion"
/
/						Translate:
/						==========
/ general errors 1 - 99				yes
/
00001, 00000, "value too big"
// *Cause: The SNMP program interface received a value too large for it to
// process.  This error is usually displayed underneath an error which
// describes in more detail the value which caused the problem.
// *Action: Not normally visible to the user.  For further details, turn on
// tracing and re-execute the failing operation.  If the error persists, 
// contact Worldwide Customer Support.
/
00002, 00000, "no such SNMP variable name"
// *Cause: An SNMP request was not processed because the one or more of the
// variable names in the request does not exist.  This error is not normally
// visible to the user except in a trace file, where it is usually part of
// a "soft" error condition which is normal.
// *Action: 
// The error may indicate that a managed server does not support an operation 
// requested by its control program, perhaps because of version 
// incompatibility.  For further details, turn on tracing and re-execute the
// failing operation.  If the error persists, and does not occur as part of a
// "soft" error condition as noted in the trace file, contact Worldwide
// Customer Support.
/
00003, 00000, "bad SNMP variable value"
// *Cause: The SNMP program interface received a variable value which has an
// unsupported data type.  This error may occur if a standard SNMP network
// monitor is sending requests to an Oracle service through an SNMP-to-TNS
// gateway, and that service cannot understand the requests.
// *Action: Not normally visible to the user.  For further details, turn on
// tracing and re-execute the failing operation.  If the error persists, and
// occurs when an Oracle control program sends requests to an Oracle service,
// contact Worldwide Customer Support.
/
00004, 00000, "SNMP variable is read only"
// *Cause: The user attempted to change a variable value at a remote server,
// and that variable is read-only.  This error is usually displayed underneath
// an error which describes the problem in more detail.
// *Action: Read-only variables may never be modified.
/
00005, 00000, "general SNMP error"
// *Cause: an SNMP error occured which did not fall under the heading of any
// other more specific error condition.  This error may occur if a standard
// SNMP network monitor is sending requests to an Oracle service through an
// SNMP-to-TNS gateway, and that service cannot understand the requests.
// *Action: Not normally visible to the user.  For further details, turn on
// tracing and re-execute the failing operation.  If the error persists, and
// occurs when an Oracle control program sends requests to an Oracle service,
// contact Worldwide Customer Support.
/
00006, 00000, "uninitialized SNMP context"
// *Cause: An internal function attempted to use an uninitialize SNMP handle.
// *Action: Not normally visible to the user.  For further details, turn on
// tracing and re-execute the failing operation.  If the error persists, 
// contact Worldwide Customer Support.
/
00007, 00000, "I/O failure"
// *Cause: The SNMP program interface attempted to send or receive an SNMP
// request and was unable to do so because of a network failure of some sort.
// This error is usually displayed underneath an error which describes the
// problem in more detail.  The problem typically occurs when a control
// program is attempting to communicate with a service and either that service
// has unexpectedly terminated or the network path between the control program
// and the service has been interrupted.
/
00008, 00000, "SNMP message has incorrect version, version 0 is required"
// *Cause: The SNMP program interface received a protocol request with an 
// illegal version number.  This error may occur if a standard SNMP network
// monitor is sending malformed requests to an Oracle service through an 
// SNMP-to-TNS gateway.
// *Action: Ensure that the management platform in question is sending SNMP
// requests with the correct version number.  If the error persists, and
// occurs when an Oracle control program sends requests to an Oracle service,
// contact Worldwide Customer Support.
/
00009, 00000, "SNMP initialization failure"
// *Cause: The SNMP program interface could not be initialized, either
// because its error message file could not be found, or because there is a
// malformed snmp.communities parameter value in the parameter table.
// *Action: Check that SQL*Net has been installed properly and that all message
// files are in their proper locations.  Turn on tracing and look for parameter
// table load errors.
/
00010, 00000, "memory exhausted"
// *Cause: The program interface has run out of memory.
// *Action: Add more memory or run fewer processes.
/
00011, 00000, "internal SNMP program interface error"
// *Cause: An internal error occurred inside the SNMP program interface.
// This error is usually displayed underneath an error which describes the
// problem in more detail.
// *Action: Not normally visible to the user.  For further details, turn on
// tracing and re-execute the failing operation.  If the error persists, 
// contact Worldwide Customer Support.
