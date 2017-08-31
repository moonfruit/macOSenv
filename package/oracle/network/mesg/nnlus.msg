/ Copyright (c) 1991, 1996, 1997, 1998, 1999, 2000, 2001 by the Oracle Corporation.  All rights reserved.
/
/ $Header: nnlus.msg 24-aug-00.05:14:46 plin Exp $
/
/ NAME     
/   nnlus.msg
/
/ FUNCTION 
/   Network Naming controLler US error message file
/
/ NOTES
/       Message text should be limited to a maximum of 76 characters.
/	Messages containing embedded % directives should not overrun
/	the 76 character limit unless they signal unusual errors
/	which do not occur as part of user applications.  For example,
/	startup errors and system-dependent errors can probably get
/	away with longer message text.
/
/	NOTE THE FORMATTING characters in this SNMP portion of this file.
/	Spacing is important; many of these messages appear as part of 
/	tabular displays.
/
/ OWNER
/   markl
/
/ MODIFIED
/    eminer     10/01/01 - new dump alias command
/    bnanjund   08/21/00 - filename-arg for dump_tnsnames
/    eminer     09/03/99 - add un/register_ns commands
/    eminer     08/10/99 - bug 955988; new message for temp file rename failure
/    eminer     06/18/99 - new messages for dump-ldap
/    eminer     06/14/99 - add help message for dump-ldap command
/    eminer     06/02/99 - fix msg number in list help
/    eminer     05/26/99 - add list_domains command
/    eminer     05/24/99 - add list_deleg
/    eminer     05/10/99 - help message for list command
/    eminer     07/21/98 - add messages for load-ldap command
/    eminer     12/09/97 - messages for load-tnsnames command
/    rkasamse   03/28/97 - provide more info for reorder_ns command
/    vjoshi     02/27/97 - addition of save_config_on_stop option.
/    eminer     12/30/96 - Replace missing text for 552 & 554
/    slau       10/16/96 - Add reorder_ns help message
/    rkasamse   10/03/96 - add info. fot the  delegate_domain command
/    mtoeller   08/06/96 - Tidy up the help messages
/    mtoeller   08/01/96 - Fix truncated messages
/    mtoeller   07/30/96 - Fix set password message
/    mtoeller   07/30/96 - Fix help messages in namesctl
/    cluo       07/15/96 -
/
/   $Log:  $
/    slau       08/27/96 - Merge in 2.3.3 changes
/    mtoeller   07/26/96 - merge nn.sl,v 2.22 into NDE
/
/   $Log:  $
/    Revision 1.40  1996/01/22  20:33:54  slau
/    Changed msg no 1057 to fix bug # 324287
/
/    Revision 1.39  1995/11/22  21:50:57  slau
/    Shorten some of the overlength message
/
/    Revision 1.38  1995/11/22  20:44:43  slau
/    Fixed typo.
/
/    Revision 1.37  1995/11/22  20:21:38  slau
/    Changed the help message for restart, reload, reset_stats,
/    log_stats, query, register, unregister and timed_query.
/
/    Revision 1.36  1995/11/10  20:07:47  mtoeller
/    add the word "server's" to help set/show trace/log file name
/
/    Revision 1.35  1995/11/08  19:39:02  slau
/    Add msg for set and show log_file_name
/
/
00000, 00000, "normal, successful completion"
/
/						Translate:
/						==========
/ Control Program Errors   1 - 199		yes
/
/ These messages are errors output by the name server control program
/
00001, 00000, "request argument \"%s\" is invalid"
// *Cause:  The user entered an invalid request command argument.
// *Action: Supply a valid argument.
/
00002, 00000, "request argument \"%s\" is not allowed with this operation"
// *Cause:  The user entered a request command argument which is not valid
// with the particular request command.
// *Action: Supply a valid argument.
/
00003, 00000, "memory exhausted"
// *Cause:  The program has run out of memory
// *Action:  Check the amount of available memory on your machine to ensure
//  that there is enough memory to run this executable. If necessary, free up
// memory by running fewer programs, then try again. 
/
00004, 00000, "invalid command argument \"%s\""
// *Cause:  The user entered an invalid command argument.
// *Action: Supply a valid argument.
/
00005, 00000, "no server has been set.  Use the \"SET SERVER\" command first"
// *Cause:  The user attempted to issue a command which requires that a
// default managed Oracle Names server be set first.
// *Action: Use the SET SERVER command to set your default server, then 
// reissue the command.  Alternatively, if the command allows, re-issue it
// with a specific server name so the control program does not need to use the
// default.
/
00006, 00000, "timeout, server is not responding"
// *Cause:  The control program issued a request to an Oracle Names server 
// and no response arrived in a timely fashion.  The network connection
// between the control program and the server may be faulty, the server may 
// be very heavily loaded, or there may be substantial network delays between 
// the control program and the server.  The latter is especially true for
// WAN links.
// *Action: Reissue the command; if it continues to fail, check to see that
// the server being managed is running correctly and that the network
// connection between the server and the control program is working correctly.
/
00007, 00000, "server responded with an error"
// *Cause:  The control program issued a request to an Oracle Names server
// and the server responded with an error.
// *Action: For further details, turn on tracing and re-execute the failing
// operation.  If the error persists, contact Worldwide Customer Support.
/
00008, 00000, "request not understood by server"
// *Cause:  The control program issued a request to an Oracle Names server
// and the server did not understand the request.
// *Action: If the server and the control program have different versions,
// they may be unable to communicate.  Check your documentation for version
// compatibility constraints.  If the server and control program are 
// compatible, turn on tracing for further details, and re-execute the failing
// operation.  If the error persists, contact Worldwide Customer Support.
/
00009, 00000, "encryption of server password failed"
// *Cause:  The control program attempted and failed to encrypt a server
// password, supplied either through the SET PASSWORD command or the 
// namesctl.server_password configuration parameter.
// *Action: An internal error not normally visible to the user.  Contact 
// Worldwide Customer Support.
/
00010, 00000, "error getting address for server \"%s\""
// *Cause:  The control program attempted to translate a server name to its
// corresponding address, and failed.  There are a large number of possible
// causes for the failure.  The control program's SQLNET.ORA file must exist 
// in the correct system-specific location, and must be readable by the control
// program.  The file must contain a names.preferred_servers entry with
// valid name server addresses.  If the user has changed managed servers with
// the SET SERVER command, the new server must be running, and must be
// able to resolve the address or forward the request to another server which
// can resolve the address.  Alternatively, a TNSNAMES.ORA file with valid
// name server names and addresses must exist in the correct system-specific
// location.
// *Action: For further details, turn on tracing and re-execute the failing
// operation.  If the error persists, contact Worldwide Customer Support.
/
00011, 00000, "no server with name \"%s\" exists"
// *Cause:  The user issued a SET SERVER request and the current managed 
// Oracle Names server was unable to translate that name into an address.
// Alternatively, the user issued a control program request to a specific
// server, and that server's name could not be translated into an address.
// Both problems are almost always caused by mis-typing the server name.
// *Action: Re-issue the request with a valid server name. 
/
00012, 00000, "invalid \"%s\" value \"%s\""
// *Cause:  The first argument is a data type, the second is a value.  The
// user supplied an invalid data value of the specified type.
// *Action: Re-issue the failing operation with correct data.
/
00013, 00000, "not performed, permission denied for supplied password"
// *Cause:  The user issued a request to an Oracle Names server, and the
// password supplied with the request was incorrect.
// *Action: Check to see that the password sent by the control program to the
// server is correct for that server.  You can set a new password with the 
// SET PASSWORD control program command.
/
00014, 00000, "unknown data type \"%s\""
// *Cause:  The user issued a name server request which contained an unknown
// data type.
// *Action: It is possible that the server had no information on the type,
// but automatically fetched it in response to the failing request.  Re-issue
// the failing request; if the server has in the meantime fetched the
// appropriate data type information, the error will go away.  If the error 
// persists, the data type is probably invalid.
/
00015, 00000, "type \"%s\" has \"%s\" syntax, which has no textual representation"
// *Cause:  Not all data type syntaxes can be represented as text.
// This message indicates that the user issued a name server request for
// a type with an non-textual representation.
// *Action: Re-issue the operation with a data type that has a syntax with
// a textual representation.
/
00016, 00000, "cannot start server, error getting program directory's name"
// *Cause:  The user issued a STARTUP request, but the control program was
// unable to start the server because it was unable to find the name of
// the directory where the server executable resides.
// *Action: An internal error not normally visible to the user.  Contact 
// Worldwide Customer Support.
/
00017, 00000, "cannot start server, program \"%s\" does not exist"
// *Cause:  The user issued a STARTUP request, but the control program was
// unable to start the server because it was unable to find the server
// executable.
// *Action: Make sure that a copy of the server executable exists in your
// system's oracle executable directory.
/
00018, 00000, "warning: could not contact default name server"
// *Cause:  The control program was unable to contact its default name server
// during startup.  There are a number of possible causes for this
// error.  The control program's SQLNET.ORA file must exist in the
// correct system-specific location, and must be readable by the control
// program.  The file must contain a names.preferred_servers entry with
// valid name server addresses.  The first server in the preferred-server list
// must be running, and there must be network connectivity between the control
// program and that server.
// *Action: Check to see that all of the above are true.  If the control 
// program is still unable to contact its default server, turn on tracing
// and restart the control program.  If the error persists, contact 
// Worldwide Customer Support.
/
00019, 00000, "warning: server either changed or ignored your request"
// *Cause:  The user issued a request to an Oracle Names server and that
// request was altered in some way.  Typically the user specified an invalid
// argument of some sort, and the server either ignored the request, or
// replaced the invalid argument with a reasonable default.
// *Action: Use the control program to check the current state of the value
// that you attempted to change.  The server's log file may also contain
// information about the exact cause of the problem.  Re-issue the operation
// with correct arguments.
/
00020, 00000, "warning: no TNSNAMES.ORA file and no preferred name servers in SQLNET.ORA" 
// *Cause:  The control program was unable to find a TNSNAMES.ORA file and
// was unable to find a default name server in SQLNET.ORA.  The control
// program will operate in this state, but will be unable to resolve any
// names until a default server has been set, and that server must be set
// using its raw TNS address.
// *Action: The control program's SQLNET.ORA file must exist in the
// correct system-specific location, and must be readable by the control
// program.  The file must contain a names.preferred_servers entry with
// valid name server addresses.  The first server in the preferred-server list
// must be running, and there must be network connectivity between the control
// program and that server.  Alternatively, a TNSNAMES.ORA file with valid
// name server information must exist in the correct system-specific location.
/
00022, 00000, "error changing trace level from %s to %s, level change ignored"
// *Cause:  The user attempted to change the control program's local trace
// level, and the program encountered an error while changing the level.
// Usually the problem is that tracing was enabled for the first time (by
// changing the trace level from OFF to something else) and the trace file
// is not writeable by the control program.
// *Action: Check to see that the trace file is writeable.  Your documentation
// will tell you the name of the trace file.
/
00023, 00000, "SET command is missing an argument"
// *Cause:  The user attempted to issue a SET command with no argument.
// *Action: Supply a valid argument to the SET command.
/
00024, 00000, "warning: no preferred name servers in SQLNET.ORA"
// *Cause:  The control program was unable to find any preferred name servers
// in SQLNET.ORA, and will therefore not connect to a default server.
// *Action: Make sure that the SQLNET.ORA file contains a valid 
// names.preferred_servers entry. 
/
00035, 00000, "File %s or nested IFILEs not found."
// *Cause:  Error in loading from the tnsfile.
// *Action: None.
/
00036, 00000, "No records loaded"
// *Cause:  No loadable data.
// *Action: None.
/
00037, 00000, "Error %d while sequencing through parameter table."
// *Cause:  The NL Parameter system reported an error while retrieving the
// next name from the table.
// *Action: An internal error not normally visible to the user.  Contact 
// Worldwide Customer Support.
/
00038, 00000, "Distinguished Name syntax error"
// *Cause:  Distinguished Name incorrectly specified.
// *Action: Supply a valid DN.
/
00039, 00000, "no RRs"
// *Cause:  Object has no relevant RRs to be mapped to LDAP objects.
// *Action: None.
/
00040, 00000, "Distinguished Name exceeds buffer length: %s"
// *Cause:  Distinguished Name derived from Domain Name is too long.
// *Action: Either move the object to a domain whose name is shorter or
// manually update the LDAP object.
/
00041, 00000, "Object %s not in domain %s"
// *Cause:  Object has no relevant RRs to be mapped to LDAP objects.
// *Action: None.
/
00042, 00000, "LDAP bind failure: %x, %s"
// *Cause:  Call to ldap_bind failed with return set to given number.
// *Action: Correct user/pwd parameters or definitions.
/
00043, 00000, "LDAP open failure"
// *Cause:  LDAP server could not be contacted.
// *Action: Correct connect info or server unavailability.
/
00044, 00000, "Unsupported data type %s not mapped"
// *Cause:  ONames data type could not be mapped to LDAP attributes
// *Action: An internal error not normally visible to the user.  Contact 
// Worldwide Customer Support.
/
00045, 00000, "No host given for LDAP server"
// *Cause:  LDAP open will dump core without a host.
// *Action: Provide appropriate host with '-h' option.
/
00046, 00000, "Name %s exceeds DN template depth"
// *Cause:  There are more domains in the name than are specified in the DN
//  template.
// *Action: Add fields to the template or migrate subdomains with separate
//  dump operations.
/
00047, 00000, "LDAP modify returned error: 0x%x, %s"
// *Cause:  LDAP failed with the return code shown.
// *Action: Refer to LDAP documentation for the meaning of the error.
/
00048, 00000, "Error opening file: %s"
// *Cause:  Named file cannot be opened.
// *Action: Provide for access to file.
/
00049, 00000, "Output in %s cannot be renamed to %s"
// *Cause: The given file cannot be created.
// *Action: Insure that the file specified can be created before running the
// command. Or use the temporary file itself.
/
/						Translate:
/						==========
/ Control Program Operation Messages 200 - 399  yes
/
/ These messages are printed in response to commands that the user issues to 
/ the control program.  They are output without an accompanying facility 
/ and error code (because they are not errors), hence the capitalised first
/ word.
/ 
00201, 00000, "Shutdown occurs in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00202, 00000, "No shutdown currently scheduled"
// *Cause:  Control program general message.
// *Action: None.
/
00203, 00000, "Scheduled shutdown to occur in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00204, 00000, "Cancelled shutdown"
// *Cause:  Control program general message.
// *Action: None.
/
00205, 00000, "Reload check occurs in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00206, 00000, "No reload check currently scheduled"
// *Cause:  Control program general message.
// *Action: None.
/
00207, 00000, "Scheduled reload check to occur in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00208, 00000, "Cancelled reload check"
// *Cause:  Control program general message.
// *Action: None.
/
00209, 00000, "Cache checkpoint interval is currently %s"
// *Cause:  Control program general message.
// *Action: None.
/
00210, 00000, "Cache checkpointing is currently disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00211, 00000, "Cache checkpoint interval is now %s"
// *Cause:  Control program general message.
// *Action: None.
/
00212, 00000, "Cache checkpointing is now disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00213, 00000, "No entry with specified index number, try \"SHOW SYSTEM_QUERIES\""
// *Cause:  Control program general message.
// *Action: None.
/
00214, 00000, "Next auto-refresh for specified index number occurs in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00215, 00000, "Scheduled specified index number's next auto-refresh to occur in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00216, 00000, "Disabled auto-refresh for specified index number"
// *Cause:  Control program general message.
// *Action: None.
/
00217, 00000, "Controller is sleeping for %u seconds"
// *Cause:  Control program general message.
// *Action: None.
/
00218, 00000, "Ignoring spurious trailing text \"%s\""
// *Cause:  Control program general message.
// *Action: None.
/
00219, 00000, "Statistic counter logging interval is currently %s"
// *Cause:  Control program general message.
// *Action: None.
/
00220, 00000, "Statistic counter logging is currently disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00221, 00000, "Statistic counter logging interval is now %s"
// *Cause:  Control program general message.
// *Action: None.
/
00222, 00000, "Statistic counter logging is now disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00223, 00000, "Statistic counters are next logged in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00224, 00000, "Scheduled statistic counters to be logged in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00225, 00000, "Currently managing name server \"%s\""
// *Cause:  Control program general message.
// *Action: None.
/
00226, 00000, "Current request-processing delay is %s"
// *Cause:  Control program general message.
// *Action: None.
/
00227, 00000, "Request-processing delay is currently disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00228, 00000, "Request-processing delay is now %s"
// *Cause:  Control program general message.
// *Action: None.
/
00229, 00000, "Request-processing delay is now disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00230, 00000, "Controller NOCONFIRM mode is currently %s"
// *Cause:  Control program general message.
// *Action: None.
/
00231, 00000, "Controller NOCONFIRM mode is now %s"
// *Cause:  Control program general message.
// *Action: None.
/
00232, 00000, "Auto-refresh failure-retry interval is currently %s"
// *Cause:  Control program general message.
// *Action: None.
/
00233, 00000, "Auto-refresh failure-retry interval is now %s"
// *Cause:  Control program general message.
// *Action: None.
/
00234, 00000, "Auto-refresh failure-retry expiration period is currently %s"
// *Cause:  Control program general message.
// *Action: None.
/
00235, 00000, "Auto-refresh failure-retry expiration period is now %s"
// *Cause:  Control program general message.
// *Action: None.
/
00236, 00000, "Statistic counter reset interval is currently %s"
// *Cause:  Control program general message.
// *Action: None.
/
00237, 00000, "Resetting of statistic counters is currently disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00238, 00000, "Statistic counter reset interval is now %s"
// *Cause:  Control program general message.
// *Action: None.
/
00239, 00000, "Resetting of statistic counters is now disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00240, 00000, "Starting \"%s\"..."
// *Cause:  Control program general message.
// *Action: None.
/
00241, 00000, "Processing of modification requests is currently enabled"
// *Cause:  Control program general message.
// *Action: None.
/
00242, 00000, "Processing of modification requests is currently disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00243, 00000, "Processing of modification requests is now enabled"
// *Cause:  Control program general message.
// *Action: None.
/
00244, 00000, "Processing of modification requests is now disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00245, 00000, "General request processing is currently enabled"
// *Cause:  Control program general message.
// *Action: None.
/
00246, 00000, "General request processing is currently disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00247, 00000, "General request processing is now enabled"
// *Cause:  Control program general message.
// *Action: None.
/
00248, 00000, "General request processing is now disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00249, 00000, "DEFAULT-FORWARDERS-ONLY mode is currently enabled"
// *Cause:  Control program general message.
// *Action: None.
/
00250, 00000, "DEFAULT-FORWARDERS-ONLY mode is currently disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00251, 00000, "DEFAULT-FORWARDER-ONLY mode is now enabled"
// *Cause:  Control program general message.
// *Action: None.
/
00252, 00000, "DEFAULT-FORWARDER-ONLY mode is now disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00253, 00000, "Server-generated requests currently request forwarding"
// *Cause:  Control program general message.
// *Action: None.
/
00254, 00000, "Server-generated requests currently do not request forwarding"
// *Cause:  Control program general message.
// *Action: None.
/
00255, 00000, "Server-generated requests now request forwarding"
// *Cause:  Control program general message.
// *Action: None.
/
00256, 00000, "Server-generated requests now do not request forwarding"
// *Cause:  Control program general message.
// *Action: None.
/
00257, 00000, "Server-generated requests currently require authoritative answers"
// *Cause:  Control program general message.
// *Action: None.
/
00258, 00000, "Server-generated requests currently do not require authoritative answers"
// *Cause:  Control program general message.
// *Action: None.
/
00259, 00000, "Server-generated requests now require authoritative answers "
// *Cause:  Control program general message.
// *Action: None.
/
00260, 00000, "Server-generated requests now do not require authoritative answers"
// *Cause:  Control program general message.
// *Action: None.
/
00261, 00000, "Request forwarding is currently enabled"
// *Cause:  Control program general message.
// *Action: None.
/
00262, 00000, "Request forwarding is currently disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00263, 00000, "Request forwarding is now enabled"
// *Cause:  Control program general message.
// *Action: None.
/
00264, 00000, "Request forwarding is now disabled"
// *Cause:  Control program general message.
// *Action: None.
/
00266, 00000, "Round trip time is %s"
// *Cause:  Control program general message.
// *Action: None.
/
00267, 00000, "Address is %s"
// *Cause:  Control program general message.
// *Action: None.
/
00268, 00000, "Enter name server password: "
// *Cause:  Prompt for password after user has issued 'set password'
// *Action: Type password, invisibly.
/
00270, 00000, "Current default domain is \"%s\""
// *Cause:  Control program general message.
// *Action: None.
/
00271, 00000, "Default domain is now \"%s\""
// *Cause:  Control program general message.
// *Action: None.
/
00272, 00000, "Removed name \"%s\" from caches along the following path:"
// *Cause:  Control program general message.
// *Action: None.
/
/
/  the following two messages start with lower case because they are 
/  continuations of message #240
/
00273, 00000, "server successfully started\n"
// *Cause:  Control program general message.
// *Action: None.
/
00274, 00000, "server not started, errors follow"
// *Cause:  Control program general message.
// *Action: None.
/
00275, 00000, "Trace level is currently %lu"
// *Cause:  Control program general message.
// *Action: None.
/
00276, 00000, "Trace level is now %lu"
// *Cause:  Control program general message.
// *Action: None.
/
00277, 00000, "Maximum number of times a request can be reforwarded is currently %lu"
// *Cause:  Control program general message.
// *Action: None.
/
00278, 00000, "Maximum number of times a request can be reforwarded is now %lu"
// *Cause:  Control program general message.
// *Action: None.
/
00279, 00000, "Restart occurs in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00280, 00000, "No restart currently scheduled"
// *Cause:  Control program general message.
// *Action: None.
/
00281, 00000, "Scheduled restart to occur in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00282, 00000, "Cancelled restart"
// *Cause:  Control program general message.
// *Action: None.
/
00283, 00000, "Next cache checkpoint occurs in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00284, 00000, "Scheduled cache checkpoint to occur in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00285, 00000, "Server has no queued system queries"
// *Cause:  Control program general message.
// *Action: None.
/
00286, 00000, "Server does not own any domains"
// *Cause:  Control program general message.
// *Action: None.
/
00287, 00000, "Cache flush occurs in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00288, 00000, "No cache flush currently scheduled"
// *Cause:  Control program general message.
// *Action: None.
/
00289, 00000, "Scheduled cache flush to occur in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00290, 00000, "Cancelled cache flush"
// *Cause:  Control program general message.
// *Action: None.
/
00291, 00000, "Statistic counters are next reset in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00292, 00000, "Scheduled statistic counters to be reset in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00293, 00000, "Controller's trace level remains unchanged"
// *Cause:  Control program general message.
// *Action: None.
/
00294, 00000, "No entries found"
// *Cause:  Control program general message.
// *Action: None.
/
00295, 00000, "Controller's local trace level is currently %lu"
// *Cause:  Control program general message.
// *Action: None.
/
00296, 00000, "Controller's local trace level changed from %lu to %lu"
// *Cause:  Control program general message.
// *Action: None.
/
00297, 00000, "Cache will be dumped to trace file in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00298, 00000, "No cache dump currently scheduled"
// *Cause:  Control program general message.
// *Action: None.
/
00299, 00000, "Scheduled server cache dump to occur in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00300, 00000, "Cancelled server cache dump"
// *Cause:  Control program general message.
// *Action: None.
/
00301, 00000, "Server shutting down"
// *Cause:  Control program general message.
// *Action: None.
/
00302, 00000, "Server restarting"
// *Cause:  Control program general message.
// *Action: None.
/
00303, 00000, "Server checking for reload"
// *Cause:  Control program general message.
// *Action: None.
/
00304, 00000, "Server flushing its cache"
// *Cause:  Control program general message.
// *Action: None.
/
00305, 00000, "Server dumping statistics to the log file"
// *Cause:  Control program general message.
// *Action: None.
/
00306, 00000, "Server setting all statistic counters to zero"
// *Cause:  Control program general message.
// *Action: None.
/
00307, 00000, "Server checkpointing its cache"
// *Cause:  Control program general message.
// *Action: None.
/
00308, 00000, "Server dumping its cache to the trace file"
// *Cause:  Control program general message.
// *Action: None.
/
00309, 00000, "Specified index number's next auto-refresh will occur immediately"
/
00340, 00000, "Trace file name is currently %s"
// *Cause:  Control program general message.
// *Action: None.
/
00341, 00000, "Trace file name is now %s"
// *Cause:  Control program general message.
// *Action: None.
/
00342, 00000, "Log file name is currently %s"
// *Cause:  Control program general message.
// *Action: None.
/
00343, 00000, "Log file name is now %s"
// *Cause:  Control program general message.
// *Action: None.
/
00344, 00000, "Save_config_on_stop is currently ON"
// *Cause:  Control program general message.
// *Action: None.
/
00345, 00000, "Save_config_on_stop is currently OFF"
// *Cause:  Control program general message.
// *Action: None.
/
00346, 00000, "Save_config_on_stop is now ON"
// *Cause:  Control program general message.
// *Action: None.
/
00347, 00000, "Save_config_on_stop is now OFF"
// *Cause:  Control program general message.
// *Action: None.
/
00348, 00000, "Server saving the config file now"
// *Cause:  Control program general message.
// *Action: None.
/
00349, 00000, "Configuration will be saved in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00350, 00000, "No save config currently scheduled"
// *Cause:  Control program general message.
// *Action: None.
/
00351, 00000, "Scheduled configuration save to occur in %s"
// *Cause:  Control program general message.
// *Action: None.
/
00352, 00000, "Cancelled save config"
// *Cause:  Control program general message.
// *Action: None.
/
00353, 00000, "Not allowed"
// *Cause:  Control program general message.
// *Action: None.
/
/						Translate:
/						==========
/ Special indented response messages 400 - 449  yes
/
/ The following messages are used to display name server response messages
/ to the administrator running the control program.  The indentation spacing
/ on these messages is important; if you need to change it, make sure all 
/ indentation values are exactly the same, for proper readability.
/
00400, 00000, "Response status:       "
// *Cause:  Control program general message.
// *Action: None.
/
00401, 00000, "Authoritative answer:  %s"
// *Cause:  Control program general message.
// *Action: None.
/
00402, 00000, "Authoritative server:  %s"
// *Cause:  Control program general message.
// *Action: None.
/
00403, 00000, "Number of answers:     %d"
// *Cause:  Control program general message.
// *Action: None.
/
00404, 00000, "TTL:                   %s"
// *Cause:  Control program general message.
// *Action: None.
/
00405, 00000, "Forwarding information:  "
// *Cause:  Control program general message.
// *Action: None.
/
00406, 00000, "Canonical name:        %s"
// *Cause:  Control program general message.
// *Action: None.
/
00407, 00000, "Alias translations:"
// *Cause:  Control program general message.
// *Action: None.
/
00408, 00000, "Answers:"
// *Cause:  Control program general message.
// *Action: None.
/
00409, 00000, "    data type is \"%s\""
// *Cause:  Control program general message.
// *Action: None.
/
00410, 00000, "Average response time: %s"
// *Cause:  Control program general message.
// *Action: None.
/
00411, 00000, "Minimum response time: %s"
// *Cause:  Control program general message.
// *Action: None.
/
00412, 00000, "Number of requests:    %lu"
// *Cause:  Control program general message.
// *Action: None.
/
00413, 00000, "Total response time:   %s"
// *Cause:  Control program general message.
// *Action: None.
/
00414, 00000, "Maximum response time: %s"
// *Cause:  Control program general message.
// *Action: None.
/
00415, 00000, "Name:                  %s"
// *Cause:  Control program general message.
// *Action: None.
/
00416, 00000, "Last timestamp:        %d"
// *Cause:  Control program general message.
// *Action: None.
/
00417, 00000, "Distinguished Name:    %s"
// *Cause:  Control program general message.
// *Action: None.
/
00418, 00000, "Attributes Mapped:     %d"
// *Cause:  Control program general message.
// *Action: None.
/
/						Translate:
/						==========
/ Help Text   500 - 799				yes
/
/ The following messages are hints displayed in response to a control program
/ user typing "HELP <command>".  They are intended to describe what the 
/ command in question does.
/
00500, 00000, "Shows information on domains served by this server"
// *Cause:  Control program help text.
// *Action: None.
/
00501, 00000, "set|show log_stats_interval [<seconds>] [<server_list>] :\nset|show the server's statistic counter logging interval"
// *Cause:  Control program help text.
// *Action: None.
/
00502, 00000, "Shows, sets, or cancels when the server next dumps its statistic counters"
// *Cause:  Control program help text.
// *Action: None.
/
00503, 00000, "repeat <number> <command> [<args>] : repeat a command <number> times"
// *Cause:  Control program help text.
// *Action: None.
/
00505, 00000, "log_stats [<server_list>] : write Names server statistics to the log file"
// *Cause:  Control program help text.
// *Action: None.
/
00506, 00000, "reset_stats [<server_list>] : reset Names server statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00507, 00000, "Shows, sets, or cancels the time when an auto-refresh query is next issued"
// *Cause:  Control program help text.
// *Action: None.
/
00508, 00000, "show system_queries [<server_list>] : show system query information"
// *Cause:  Control program help text.
// *Action: None.
/
00509, 00000, "set|show cache_checkpoint_interval [<seconds>] [<server_list>] :\nset|show the server's cache checkpoint interval"
// *Cause:  Control program help text.
// *Action: None.
/
00510, 00000, "Adds a data record to an existing name"
// *Cause:  Control program help text.
// *Action: None.
/
00511, 00000, "Shows or sets the server's system query authority requirements"
// *Cause:  Control program help text.
// *Action: None.
/
00512, 00000, "Shows or sets the server's auto-refresh expiration period"
// *Cause:  Control program help text.
// *Action: None.
/
00513, 00000, "Shows or sets the server's auto-refresh failure retry interval"
// *Cause:  Control program help text.
// *Action: None.
/
00514, 00000, "Creates a new name with a default TTL"
// *Cause:  Control program help text.
// *Action: None.
/
00515, 00000, "Deletes a name and its data"
// *Cause:  Control program help text.
// *Action: None.
/
00516, 00000, "Displays complete server status"
// *Cause:  Control program help text.
// *Action: None.
/
00517, 00000, "Insert-replaces a data item under an existing name"
// *Cause:  Control program help text.
// *Action: None.
/
00518, 00000, "Shows or sets the maximum number of times a server can reforward a request "
// *Cause:  Control program help text.
// *Action: None.
/
00519, 00000, "Shows, enables, or disables modification request processing"
// *Cause:  Control program help text.
// *Action: None.
/
00520, 00000, "Changes an existing name's TTL"
// *Cause:  Control program help text.
// *Action: None.
/
00521, 00000, "Shows or sets the server's system query forwarding requirements"
// *Cause:  Control program help text.
// *Action: None.
/
00522, 00000, "Removes a data item from a name by value or by type"
// *Cause:  Control program help text.
// *Action: None.
/
00523, 00000, "Renames an existing name"
// *Cause:  Control program help text.
// *Action: None.
/
00524, 00000, "Replaces a data item with another data item"
// *Cause:  Control program help text.
// *Action: None.
/
00525, 00000, "Shows or sets the server's default-forwarding status"
// *Cause:  Control program help text.
// *Action: None.
/
00526, 00000, "Starts a server using a non-standard executable and optional arguments"
// *Cause:  Control program help text.
// *Action: None.
/
00527, 00000, "Shows, sets, or cancels the time when the server next checkpoints its cache"
// *Cause:  Control program help text.
// *Action: None.
/
00528, 00000, "[set] password <password> : set the password for subsequent calls"
// *Cause:  Control program help text.
// *Action: None.
/
00529, 00000, "set|show default_domain [<domain_name>] : set|show the current default domain"
// *Cause:  Control program help text.
// *Action: None.
/
00530, 00000, "quit|exit : exit the names control program"
// *Cause:  Control program help text.
// *Action: None.
/
00531, 00000, "flush_name <name> :\nremoves a name from caches along a route to an authoritative server"
// *Cause:  Control program help text.
// *Action: None.
/
00532, 00000, "set|show forwarding_available [<on|off>] [<server_list>] :\nenable, disable or show server request forwarding"
// *Cause:  Control program help text.
// *Action: None.
/
00533, 00000, "ping [<server_list>] : ping one or more Names servers"
// *Cause:  Control program help text.
// *Action: None.
/
00534, 00000, "query <name> [<type>] : query for a desired name and RR type"
// *Cause:  Control program help text.
// *Action: None.
/
00535, 00000, "reload [<server_list>] : reload server cache data if there are changes"
// *Cause:  Control program help text.
// *Action: None.
/
00536, 00000, "set|show requests_enabled [<on|off>] [<server_list>] :\nenable, disable or show server request processing"
// *Cause:  Control program help text.
// *Action: None.
/
00537, 00000, "set|show server [<server_name>] : set|show the currently managed server"
// *Cause:  Control program help text.
// *Action: None.
/
00538, 00000, "stop|shutdown [<server_list>] : stop one or more Names servers"
// *Cause:  Control program help text.
// *Action: None.
/
00539, 00000, "start|startup [<args>] : start the Names server with optional arguments"
// *Cause:  Control program help text.
// *Action: None.
/
00540, 00000, "[show] status [<server_list>] : display server status summary"
// *Cause:  Control program help text.
// *Action: None.
/
00541, 00000, "set|show trace_level [<level>] [<server_list>] :\nset|show the server's tracing level"
// *Cause:  Control program help text.
// *Action: None.
/
00542, 00000, "restart [<server_list>] : restart one or more Names servers"
// *Cause:  Control program help text.
// *Action: None.
/
00543, 00000, "[show] version [<server_list>] :\nshow the name and version of one or more Names servers"
// *Cause:  Control program help text.
// *Action: None.
/
00544, 00000, "Displays operations statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00545, 00000, "Displays query request statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00546, 00000, "Displays delete request statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00547, 00000, "Displays rename request statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00548, 00000, "Displays update request statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00549, 00000, "Displays stream usage statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00550, 00000, "flush [<server_list>] : flush one or more servers' cache(s)"
// *Cause:  Control program help text.
// *Action: None.
/
00551, 00000, "Displays cache statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00553, 00000, "Displays forwarding statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00555, 00000, "Displays meta data statistics"
// *Cause:  Control program help text.
// *Action: None.
/
00556, 00000, "set|show reset_stats_interval [<seconds>] [<server_list>] :\nset|show server statistic counter reset interval"
// *Cause:  Control program help text.
// *Action: None.
/
00557, 00000, "Causes the controller to sleep for N seconds"
// *Cause:  Control program help text.
// *Action: None.
/
00558, 00000, "set|show namesctl_trace_level : set|show the controller's tracing level"
// *Cause:  Control program help text.
// *Action: None.
/
00559, 00000, "Shows, sets, or cancels the time for the next cache dump to the trace file"
// *Cause:  Control program help text.
// *Action: None.
/
00560, 00000, "Shows or sets the server's request-processing delay"
// *Cause:  Control program help text.
// *Action: None.
/
00561, 00000, "register <name> [-t<type>] [-d<address>] [-h<hostname>] [-l<listener_name>] :\nregister an object with Oracle Names"
// *Cause:  Control program help text.
// *Action: None.
/
00562, 00000, "unregister <name> [-d<address>] [-l<listener_name>] :\nunregister an object with Oracle Names"
// *Cause:  Control program help text.
// *Action: None.
/
00563, 00000, "timed_query [<timestamp>] : query all objects in the Names server's cache"
// *Cause:  Control program help text.
// *Action: None.
/
00565, 00000, "set trace_file_name [<filename>] [<server_list>] :\nset|show the server's trace file name"
// *Cause:  Control program help text.
// *Action: None.
/
00566, 00000, "set|show log_file_name [<filename>] [<server_list>] :\nset|show the log file name on one or more servers"
// *Cause:  Control program help text.
// *Action: None.
/
00567, 00000, "reorder_ns [<server_address>] : Generate the enhanced discovery file"
// *Cause:  Control program help text.
// *Action: None.
/
00568, 00000, "delegate_domain <domain_name> <NS_name> <NS_Addr> : Delegate the given domain to the given nameserver"
// *Cause:  Control program help text.
// *Action: None.
/
00569, 00000, "domain_hint <domain_name> <NS_name> <NS_Addr> : Provide hint of a nameserver for a given domain"
// *Cause:  Control program help text.
// *Action: None.
/
00570, 00000, "save_config [<server_list>] : saves server configuration to parameter file"
// *Cause:  Control program help text.
// *Action: None.
/
00571, 00000, "set|show save_config_on_stop [<on|off>]"
// *Cause:  Control program help text.
// *Action: None.
/
00572, 00000, "set|show save_config_interval [<seconds>] [<server_list>] : set time of next config save"
// *Cause:  Control program help text.
// *Action: None.
/
00573, 00000, "load_tnsnames [<file>, ... ] : load tnsnames into ONames"
// *Cause:  Control program help text.
// *Action: None.
/
00574, 00000, "dump_tnsnames [<file>] : dump ONames addresses into tnsnames file"
// *Cause:  Control program help text.
// *Action: None.
/
00575, 00000, "list_objects: list all objects in a domain or subtree"
// *Cause:  Control program help text.
// *Action: None.
/
00576, 00000, "list_delegated: list all delegated domains in the region or subtree"
// *Cause:  Control program help text.
// *Action: None.
/
00577, 00000, "list_domains: list authoritative domains in the region or subtree"
// *Cause:  Control program help text.
// *Action: None.
/
00578, 00000, "dump_ldap: dump addresses in the domain or region to LDAP"
// *Cause:  Control program help text.
// *Action: None.
/
00579, 00000, "_scan: find objects/records matching the given types"
// *Cause:  Control program help text.
// *Action: None.
/
00580, 00000, "register_ns: <name server> <address> <domain>"
// *Cause:  Control program help text.
// *Action: None.
/
00581, 00000, "unregister_ns: <name server> <domain>"
// *Cause:  Control program help text.
// *Action: None.
/
00582, 00000, "dump_alias: dump aliases in the domain or region to LDAP"
// *Cause:  Control program help text.
// *Action: None.
/
/
/						Translate:
/						==========
/ SNMP variable descriptions	800 - 1199	yes
/
/ The following messages are statistics descriptions.  They are printed in 
/ response to various control program status commands.  The messages are
/ printed without an accompanying facility and error code (because they are 
/ not errors), hence the capitalised first word.  The indentation is 
/ important because the controller displays statistics in tabular form.  If
/ you need to change the indentation, change it to the same value for all
/ statistics.  Because these statistics are intended for use by name server
/ administrators, there are a number of technical terms in the descriptions.
/
/  ops.query   801 - 829
/
00800, 00000, "Query requests received:                  %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00801, 00000, "Queries received, type ANY:               %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00802, 00000, "Queries received, type ADDRESS:           %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00803, 00000, "Queries received, type ALIAS:             %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00804, 00000, "Queries received, type META-DATA:         %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00805, 00000, "Queries received, type NAME-SERVER:       %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00806, 00000, "Queries received, type RELATED-INFO:      %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00807, 00000, "Queries received, type SOA:               %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00808, 00000, "Queries received, all user-defined types: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00809, 00000, "Queries received, multiple types:         %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00810, 00000, "Queries received with no type:            %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00811, 00000, "Fastest query processing time:            %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00812, 00000, "Slowest query processing time:            %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00813, 00000, "Average query processing time:            %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00814, 00000, "Total query processing time:              %s"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  ops.delete  830 - 849
/
00830, 00000, "Delete requests received:                 %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00831, 00000, "Deletes refused, name is not a leaf name: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00832, 00000, "Deletes refused, name is a topology name: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00833, 00000, "Fastest delete processing time:           %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00834, 00000, "Slowest delete processing time:           %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00835, 00000, "Average delete processing time:           %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00836, 00000, "Total delete processing time:             %s"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  ops.rename  850 - 869
/
00850, 00000, "Rename requests received:                 %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00851, 00000, "Renames refused, name is not a leaf name: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00852, 00000, "Renames refused, name is a topology name: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00853, 00000, "Renames refused, new name already exists: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00854, 00000, "Fastest rename processing time:           %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00855, 00000, "Slowest rename processing time:           %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00856, 00000, "Average rename processing time:           %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00857, 00000, "Total rename processing time:             %s"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  ops.update  870 - 889
/
00870, 00000, "Update requests received:                 %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00871, 00000, "Updates refused, name is a topology name: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00872, 00000, "Updates refused, data is topology data:   %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00873, 00000, "Fastest update processing time:           %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00874, 00000, "Slowest update processing time:           %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00875, 00000, "Average update processing time:           %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00876, 00000, "Total update processing time:             %s"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  ops  890 - 929
/
00890, 00000, "Messages received:                        %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00891, 00000, "Corrupted messages received:              %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00892, 00000, "Duplicate requests received:              %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00893, 00000, "Similar requests received:                %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00894, 00000, "Requests refused, permission denied:      %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00895, 00000, "Requests refused, processing disabled:    %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00896, 00000, "Requests refused, modifications disabled: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00897, 00000, "Messages sent:                            %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00898, 00000, "Responses sent:                           %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00899, 00000, "OK responses sent:                        %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00900, 00000, "NO SUCH NAME responses sent:              %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00901, 00000, "CONTENT ERROR responses sent:             %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00902, 00000, "ALIAS LOOP responses sent:                %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00903, 00000, "SERVER FAILURE responses sent:            %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00904, 00000, "NAME EXISTS responses sent:               %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00905, 00000, "NOT AUTHORITY responses sent:             %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00906, 00000, "NOT A LEAF NAME responses sent:           %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00907, 00000, "NOT ALLOWED responses sent:               %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00908, 00000, "UNKNOWN TYPE responses sent:              %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00909, 00000, "META VIOLATION responses sent:            %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00910, 00000, "VERSION SKEW responses sent:              %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00911, 00000, "Responses sent with invalid error code:   %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00912, 00000, "Alias loops detected:                     %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00913, 00000, "Server-generated requests sent:           %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00914, 00000, "Forwarding desired on server queries:     %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00915, 00000, "Authority required on server queries:     %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00916, 00000, "Modification requests enabled:            %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00917, 00000, "Artificial request processing delay:      %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00918, 00000, "Time until server restart:                %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00919, 00000, "Time until server shutdown:               %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00920, 00000, "Time until next config save:              %s"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  meta   930 - 949
/
00930, 00000, "Requests refused, unknown data type:      %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00931, 00000, "Requests refused, no cached meta-data:    %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00932, 00000, "Requests refused, type syntax mismatch:   %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00933, 00000, "Requests refused, OTHER-DATA violation:   %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00934, 00000, "Requests refused, ALIAS-EXISTS violation: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00935, 00000, "Requests refused, SINGLE-VALUE violation: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00936, 00000, "Requests refused, DATA-EXISTS violation:  %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  cache    950 - 969
/
00950, 00000, "Cache lookup requests:                    %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00951, 00000, "Names created on lookup:                  %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00952, 00000, "Cache lookup failures:                    %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00953, 00000, "Cache lookup exact matches:               %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00954, 00000, "Hash tables created:                      %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00955, 00000, "Hash tables enlarged:                     %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00956, 00000, "Hash tables freed:                        %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00957, 00000, "Name nodes created:                       %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00958, 00000, "Name nodes freed:                         %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00959, 00000, "Time until cache dump to trace file:      %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00960, 00000, "Time until cache flush:                   %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00961, 00000, "Cache checkpoints:                        %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00962, 00000, "Cache checkpoint failures:                %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00963, 00000, "Timeouts, name TTL expired:               %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/ autoRef   970 - 979
/
00970, 00000, "System query index number:                %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00971, 00000, "  Query ID:                               %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00972, 00000, "  Query next issued in:                   %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00973, 00000, "  Query state:                            %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00974, 00000, "  Name:                                   %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00975, 00000, "  Desired data type:                      %s"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  forward   980 - 1029
/
00980, 00000, "Forwarding failures:                      %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00981, 00000, "Timeouts, server not responding:          %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00982, 00000, "Not forwarded, no servers found:          %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00983, 00000, "Name-to-hint translations:                %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00984, 00000, "Name-to-hint translations failed:         %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00985, 00000, "Requests reforwarded using referrals:     %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00986, 00000, "Reforwarded requests expired:             %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00987, 00000, "Authoritative answers when authority:     %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00988, 00000, "Non-authoritative NACKs received:         %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00989, 00000, "Objects received with no TTL:             %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00990, 00000, "DEFAULT-FORWARDERS-ONLY mode:             %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00991, 00000, "Maximum number of reforwards per request: %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00992, 00000, "Auto-refresh failure retry interval:      %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00993, 00000, "Auto-refresh failure retry expiration:    %s"
// *Cause:  Control program statistic description
// *Action: None.
/
00994, 00000, "Responses received:                       %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00995, 00000, "Unmatched responses received:             %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00996, 00000, "OK responses received:                    %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00997, 00000, "NO SUCH NAME responses received:          %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00998, 00000, "CONTENT ERROR responses received:         %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
00999, 00000, "ALIAS LOOP responses received:            %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01000, 00000, "SERVER FAILURE responses received:        %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01001, 00000, "NAME EXISTS responses received:           %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01002, 00000, "NOT AUTHORITY responses received:         %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01003, 00000, "NON LEAF responses received:              %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01004, 00000, "NOT ALLOWED responses received:           %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01005, 00000, "UNKNOWN TYPE responses received:          %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01006, 00000, "META VIOLATION responses received:        %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01007, 00000, "VERSION SKEW responses received:          %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01008, 00000, "Outbound message contexts allocated:      %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01009, 00000, "Outbound message contexts freed:          %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01010, 00000, "Forwarding contexts allocated:            %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01011, 00000, "Forwarding contexts freed:                %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  domainInfo  1030 - 1039
/
01030, 00000, "Domain index number:                      %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01031, 00000, "  Name:                                   %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01032, 00000, "  Minimum TTL:                            %s"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  stream   1040 - 1049
/
01040, 00000, "Data streams opened by server:            %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01041, 00000, "Data stream open failures:                %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01042, 00000, "Data streams answered by server:          %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01043, 00000, "Data stream answer failures:              %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01044, 00000, "Errors reading data stream:               %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01045, 00000, "Errors writing data stream:               %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
/
/  server   1050 - 1079
/
01050, 00000, "Version banner is \"%s\"\n"
// *Cause:  Control program statistic description
// *Action: None.
/
01051, 00000, "Server name:                              %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01052, 00000, "Server has been running for:              %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01053, 00000, "Request processing enabled:               %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01054, 00000, "Request forwarding enabled:               %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01055, 00000, "Requests received:                        %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01056, 00000, "Requests forwarded:                       %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01057, 00000, "Foreign data items cached:                %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01058, 00000, "Region data next checked for reload in:   %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01059, 00000, "Region data reload check failures:        %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01060, 00000, "Cache next checkpointed in:               %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01061, 00000, "Cache checkpoint interval:                %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01062, 00000, "Cache checkpoint file name:               %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01063, 00000, "Statistic counters next reset in:         %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01064, 00000, "Statistic counter reset interval:         %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01065, 00000, "Statistic counters next logged in:        %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01066, 00000, "Statistic counter logging interval:       %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01067, 00000, "Trace level:                              %lu"
// *Cause:  Control program statistic description
// *Action: None.
/
01068, 00000, "Trace file name:                          %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01069, 00000, "Log file name:                            %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01070, 00000, "System parameter file name:               %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01071, 00000, "Command-line parameter file name:         %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01072, 00000, "Administrative region name:               %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01073, 00000, "Administrative region description:        %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01074, 00000, "ApplTable Index:                          %d"
// *Cause:  Control program statistic description
// *Action: None.
/
01075, 00000, "Contact                                   %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01076, 00000, "Operational Status                        %d"
// *Cause:  Control program statistic description
// *Action: None.
/
01077, 00000, "Save Config on Stop                       %s"
// *Cause:  Control program statistic description
// *Action: None.
/
01078, 00000, "Access/Create File Error : %s"
// *Cause:  Failed to access/create named file or 
// its backup File due to incorrect permissions  
// *Action: Provide correct access to file.
/
