/ Copyright (c) 1991, 1997, 2001 by the Oracle Corporation.  All rights reserved.
/
/ $Header: niqus.msg 06-dec-2002.07:09:48 mclose Exp $ niqus.msg
/
/ NAME     								 /
/   niqus.msg								 /
/									 /
//////////////////////////////////////////////////////////////////////////
/
/
/
/ FUNCTION 
/   NI error message file.
/
/   These errors are part of the rdbms ("ora") error space.
/   Porters need to insert these into the appropriate error
/   rdbms message file, and regenerate the corresponding ".msb" files.
/
/ NOTES
/       This file has been adapted from version 1.26 of osnqus.msg from
/       Sqlnet v2
/
/       Message text should be limited to a maximum of 76 characters.
/	Messages containing embedded % directives should not overrun
/	the 76 character limit unless they signal unusual errors
/	which do not occur as part of user applications.  For example,
/	startup errors and system-dependent errors can probably get
/	away with longer message text.
/
/
/	'/' at beginning-of-line for comments.
/	'//' at beginning-of-line for *Cause: and *Action: fields.
/
/
/ OWNER
/   sviavant
/
/ MODIFIED
/    mclose     10/03/02 - Improved messages
/    bnanjund   04/16/01 - 1714563_bugfix
/    jgraham    03/21/97 - fix syntax error
/   sviavant    04/24/91     Creation
/
///////////////////////////////////////////////////////////////////////////
/
/
/ These 2 (6403, 6413) may or may not already be present in SBU rdbms
/ error msg files, from SQL*Net V1. Check for duplication.
/
6403, 00000, "Unable to allocate memory"
// *Cause:  System unable to allocate needed virtual memory.
// *Action: Configure more memory, reduce load, or simply try again.
/
6413, 00000, "Connection not open"
// *Cause:  Unable to establish connection.
// *Action: Use diagnostic procedures to ascertain exact problem.
/
/
/
///////////////////////////////////////////////////////////////////////////
/
/ New errors from SQL*Net V2 / Net8 / Oracle Net. These must be merged into
/ SBU rdbms message files.
/
12150, 00000, "TNS:unable to send data"
// *Cause:  Unable to send data. Connection probably disconnected.
// *Action: Re-establish connection. If the error is persistent, turn
// on tracing and reexecute the operation.
/
12151, 00000, "TNS:received bad packet type from network layer"
// *Cause:  Internal error.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12152, 00000, "TNS:unable to send break message"
// *Cause:  Unable to send break message. Connection probably disconnected.
// *Action: Re-establish connection. If the error is persistent, turn
// on tracing and reexecute the operation.
/
12153, 00000, "TNS:not connected"
// *Cause:  Not currently connected to a remote host.
// *Action: Re-establish connection.
/
12154, 00000, "TNS:could not resolve connect identifier specified"
// *Cause:  The connect identifier specified could not be found or was not
// correctly specified.
// *Action:  Make the following checks and correct the error:
//           - If you are using local naming:
//                - Verify that a TNSNAMES.ORA file exists and is in the
//                  proper place and accessible.
//                - Check to see that the net service name exists in the
//                  TNSNAMES.ORA file being used.
//                - Make sure there are no syntax errors anywhere in the file.
//                  Look for unmatched parentheses or stray characters. Errors
//                  in a TNSNAMES.ORA file may make it unusable.
//           - If you are using directory naming:
//                - Verify that the directory server (OID) is up and that it
//                  is accessable on the network.
//                - Verify that the database or net service name is configured
//                  in the directory.
//           - If you are using easy connect naming:
//                - Try enclosing the connect identifier in quote marks.
//                - Make sure the host, port and service name specified
//                  are correct.
// 
//           See the Oracle Net Administrators Guide or the operating system
//           specific guide for more detailed information on naming.
/
12155, 00000, "TNS:received bad datatype in NSWMARKER packet"
// *Cause:  Internal error during break handling.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12156, 00000, "TNS:tried to reset line from incorrect state"
// *Cause:  Internal error during break handling.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12157, 00000, "TNS:internal network communication error"
// *Cause:  Internal error during network communication.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12158, 00000, "TNS:could not initialize parameter subsystem"
// *Cause:  Unable to locate parameter file.
// *Action: Verify that a valid parameter file exists, and is readable.
/
12159, 00000, "TNS:trace file not writeable"
// *Cause:  The trace file to be generated is not writeable by this user.
// *Action: If the user does not have write permissions in the directory
// to which the trace file will be written, contact an administrator to
// get the proper permissions or set the TRACE_DIRECTORY_CLIENT
// parameter in the net profile (SQLNET.ORA file) to a directory the
// user can write to.
/
12160, 00000, "TNS:internal error: Bad error number"
// *Cause:  Corrupt error reporting subsystem.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12161, 00000, "TNS:internal error: partial data received"
// *Cause:  The connection may be terminated.
// *Action: Reconnect and try again. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12162, 00000, "TNS:net service name is incorrectly specified"
// *Cause:  The connect descriptor corresponding to the net service name in
// TNSNAMES.ORA or in the directory server (Oracle Internet Directory) is
// incorrectly specified.
// *Action: If using local naming make sure there are no syntax errors in
// the corresponding connect descriptor in the TNSNAMES.ORA file. If using
// directory naming check the information provided through the administration
// used for directory naming.
/
12163, 00000, "TNS:connect descriptor is too long"
// *Cause:  The connect descriptor corresponding to the net service name
// specified as the connect identifier is too long. The maximum length for
// a connect descriptor is 512 bytes and this limit has been exceeded.
// TNSNAMES.ORA or stored in the Oracle Internet Directory is too long.
// *Action: Check the net service name's connect descriptor in the local
// naming file (TNSNAMES.ORA) or in the directory server (Oracle Internet
// Directory). Use a smaller connect descriptor. If this is not possible,
// contact Worldwide Customer Support.
/
12164, 00000, "TNS:Sqlnet.fdf file not present"
// *Cause:  The sqlnet.fdf file doesn't exist in $ORACLE_HOME/network/admin.
// *Action: The sqlnet.fdf file is required for Oracle Tracing to occur.
// Either install the sqlnet.fdf file in $ORACLE_HOME/network/admin or
// turn off tracing in your ORA file.
/
12165, 00000, "TNS:Trying to write trace file into swap space"
// *Cause:  Oracle Trace doesn't allow writing trace information into your
// swap space.
// *Action: Oracle Trace cannot write trace information into swap space
// so either disable tracing or redirect trace files to be written to another
// area of your disk.
/
12168, 00000, "TNS:Unable to contact LDAP Directory Server"
// *Cause:  Cannot contact LDAP directory server to get Oracle Net configuration.
// *Action: Verify that the directory server is up and accessable from the network.
//          Verify that directory access configuration is correct.  For more
//          information see the Oracel Internet Directory Administrators Guide or
//          the Oracle Net Administrators Guide.
/
12169, 00000, "TNS:Net service name given as connect identifier is too long"
// *Cause: The net service name you are attempting to resolve is too long.
// *Action: The maximum length of a net service name is 255 bytes; this limit
//          has been exceeded. Use a smaller net service name. If this
//          is not possible, contact Worldwide Customer Support.
/
/ This line is an NI Magic Cookie. Don't eat it. Last NI error in 2.0.9.
/
/
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
/
/ 12196 - 12285 NR errors reportable to NI.
/
12196, 00000, "TNS:received an error from TNS"
// *Cause:  The navigation layer received an error from TNS.
// *Action: See the error log file for the specific TNS error.
/
12197, 00000, "TNS:keyword-value resolution error"
// *Cause:  The navigation layer received an error while trying to look up a
//  value for a keyword.
// *Action: Check the syntax of the connect descriptor.
/
12198, 00000, "TNS:could not find path to destination"
// *Cause:  Could not navigate a path through Interchanges to the destination.
// This error occurs if an invalid community is in the address string, or
// the address includes a protocol that is not available or the
// TNSNAV.ORA file does not have a correct CMANAGER address specified or
// the Interchange is down.
// *Action: Assure that Interchanges necessary to get to the desired
// destination are up and have available capacity for an additional
// connection. Also check that the correct community and protocol have been
// specified in the CMANAGER address used.
/
12200, 00000, "TNS:could not allocate memory"
// *Cause:  Out of memory on machine.
// *Action: Reconfigure machine to have more storage or run fewer applications
//  while the Interchange is running.
/
12201, 00000, "TNS:encountered too small a connection buffer"
// *Cause: TNS connection buffer supplied by the application was too small
// to retrieve the data sent back.
// *Action: Supply a larger connection buffer. If problem persists, call
// Worldwide Customer Support.
/
12202, 00000, "TNS:internal navigation error"
// *Cause: Internal navigation error.
// *Action: Not normally visible to the user. For further details contact
// Worldwide Customer Support.
/
12203, 00000, "TNS:unable to connect to destination"
// *Cause: Invalid address specified or destination is not listening.
// This error can also occur because of underlying network or network
// transport problems.
// *Action: Verify that the net service name you entered was correct.
// Verify that the ADDRESS portion of the connect descriptor which
// corresponds to the net service name is correct.  Ensure that the
// destination process (for example the listener) is running at the
// remote node.
/
12204, 00000, "TNS:received data refused from an application"
// *Cause: The application using Connection Manager refused the
// connection at the listener.
// *Action: Make sure that the application listener at the destination is
// functioning correctly. If it is and the problem persists, contact
// Worldwide Customer Support.
/
12205, 00000, "TNS:could not get failed addresses"
// *Cause: Internal navigation error.
// *Action: Not normally visible to the user. For further details contact
// Worldwide Customer Support.
/
12206, 00000, "TNS:received a TNS error during navigation"
// *Cause: Internal navigation error because of an unexpected TNS error.
// *Action: Look at the log file to find the TNS error. If necessary, turn
// on tracing and repeat the operation.
/
12207, 00000, "TNS:unable to perform navigation"
// *Cause: Improperly configured navigation file TNSNAV.ORA.
// *Action: Check the syntax of the TNSNAV.ORA file on the application`s
// machine,and verify that it lists the correct communities.
/
12208, 00000, "TNS:could not find the TNSNAV.ORA file"
// *Cause: Either the ORACLE environment is not set up correctly, or the
// TNSNAV.ORA file is not present.
// *Action: Ensure that the ORACLE environment is set up appropriately
// on your platform and that a TNSNAV.ORA file is present.
/
12209, 00000, "TNS:encountered uninitialized global"
// *Cause: Application calling navigation routine has not properly configured
// the global variables. There are no TNSNAV.ORA files available, or they
// are defective.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12210, 00000, "TNS:error in finding Navigator data"
// *Cause: Application calling navigation routine has not properly configured
// the TNSNAV.ORA file.
// *Action: Check the syntax of the TNSNAV.ORA file.
/
12211, 00000, "TNS:needs PREFERRED_CMANAGERS entry in TNSNAV.ORA"
// *Cause: TNSNAV.ORA does not have a PREFERRED_CMANAGERS defined.
// *Action: Add a PREFERRED_CMANAGERS entry to the TNSNAV.ORA file.
/
12212, 00000, "TNS:incomplete PREFERRED_CMANAGERS binding in TNSNAV.ORA"
// *Cause: The PREFERRED_CMANAGERS binding in the client's TNSNAV.ORA file
// does not have a CMANAGER_NAME specified.
// *Action: Define the CMANAGER_NAME as part of the PREFERRED_CMANAGERS
// binding. Use of the Oracle Network Manager should eliminate this
// error.
/
12213, 00000, "TNS:incomplete PREFERRED_CMANAGERS binding in TNSNAV.ORA"
// *Cause: The PREFERRED_CMANAGERS binding in the client's TNSNAV.ORA file
// does not have an ADDRESS specified.
// *Action: Define the ADDRESS as part of the PREFERRED_CMANAGERS binding.
/
12214, 00000, "TNS:missing local communities entry in TNSNAV.ORA"
// *Cause: There is no LOCAL_COMMUNITIES  entry in TNSNAV.ORA.
// *Action: Define the LOCAL_COMMUNITIES for this node in the TNSNAV.ORA
// file.
/
12215, 00000, "TNS:poorly formed PREFERRED_NAVIGATORS Addresses in TNSNAV.ORA"
// *Cause: Address binding for PREFERRED_NAVIGATORS entry is improperly entered.
// entry.
// *Action: Check your PREFERRED_NAVIGATORS entry and fix it in TNSNAV.ORA
//
/
12216, 00000, "TNS:poorly formed PREFERRED_CMANAGERS addresses in TNSNAV.ORA"
// *Cause: Address binding for the PREFERRED_CMANAGERS entry in the client's
// TNSNAV.ORA file is improperly entered.
// *Action: Define the ADDRESS as part of the PREFERRED_CMANAGERS binding.
/
12217, 00000, "TNS:could not contact PREFERRED_CMANAGERS in TNSNAV.ORA"
// *Cause: There is a syntax error in the PREFERRED_CMANAGERS entry, or
// addresses specified are wrong, or the intended Connection Managers are
// unavailable.
// *Action: Check the PREFERRED_CMANAGERS entries in the client's
// TNSNAV.ORA file and correct them or talk with your network administrator
// to determine if the specified Connection Managers are available.
// Verify that the Interchangess are active by using the INTCTL STATUS
// command.
/
12218, 00000, "TNS:unacceptable network configuration data"
// *Cause: Poorly formed network configuration data. For example, a
// PREFERRED_CMANAGERS entry may have an incorrect CMANAGER_NAME in the
// client's TNSNAV.ORA file. Or an Interchange downtime parameter
// (TIMEOUT_INTERVAL) on the Navigator may be set to zero in INTCHG.ORA.
// *Action: Check the entries in TNSNAV.ORA and the Interchange
// configuration files and correct them. If necessary, talk with your
// network administrator to determine if the specified Interchanges
// (Connection Managers) are available and properly configured.
// Use the Oracle Network Manager to generate the configuration files
// if necessary.
/
12219, 00000, "TNS:missing community name from address in ADDRESS_LIST"
// *Cause: This error occurs when an ADDRESS_LIST has some ADDRESSes in it
// that have no COMMUNITY component and others that do have a COMMUNITY
// component.
// *Action: Check that in the connect descriptors you are using either
// all the ADDRESSes have a COMMUNITY component or all do not.
/
/ All succeeding errors are a remap of NS erros in NR
/
12221, 00000, "TNS:illegal ADDRESS parameters"
// *Cause: An illegal set of protocol adapter parameters was specified. In
// some cases, this error is returned when a connection cannot be made to the
// protocol transport.
// *Action: Verify that the destination can be reached using the specified
// protocol. Check the parameters within the ADDRESS section of
// TNSNAMES.ORA or in the directory.  Legal ADDRESS parameter formats may
// be found in the Oracle operating system specific documentation or the
// Oracle Net Admnistrator's Guide. Protocols that resolve names at the
// transport layer are vulnerable to this error if not properly configured
// or names are misspelled.
/
12222, 00000, "TNS:no support is available for the protocol indicated"
// *Cause: The protocol requested in the ADDRESS portion of the connect
// descriptor identified through the net sevice name is not available.
// If the supplied ADDRESS is typographically correct then support for
// that protocol is not installed.
// *Action: Install support for the protocol or correct typographical error,
// as appropriate.  Note: if the supplied address was derived from
// resolving the net service name, check the address in the appropriate file
// (TNSNAMES.ORA, LISTENER.ORA) or in the directory server.
/
12223, 00000, "TNS:internal limit restriction exceeded"
// *Cause: Too many TNS connections open simultaneously.
// *Action: Wait for connections to close and re-try.
/
12224, 00000, "TNS:no listener"
// *Cause: The connection request could not be completed because the listener
// is not running.
// *Action: Ensure that the supplied destination address matches one of
// the addresses used by the listener - compare the TNSNAMES.ORA entry with
// the appropriate LISTENER.ORA file (or TNSNAV.ORA if the connection is to
// go by way of an Interchange). Start the listener on the remote machine.
/
12225, 00000, "TNS:destination host unreachable"
// *Cause: Contact can not be made with remote party.
// *Action: Make sure the network driver is functioning and the network is up.
/
12226, 00000, "TNS:operating system resource quota exceeded"
// *Cause: The current user has exceeded the allotted resource assigned in the
// operating system.
// *Action: Acquire more operating system resource, or perform a different
// function.
/
12227, 00000, "TNS:syntax error"
// *Cause: The supplied connect descriptor contains illegal syntax.
// *Action: Check the syntax of the connect descriptor in TNSNAMES.ORA.
/
12228, 00000, "TNS:protocol adapter not loadable"
// *Cause:  On some platforms (such as Windows) protocol support is loaded at
// run-time. If the shared library (or DLL) for the protocol adapter is
// missing or one of its supporting libraries is missing then this error is
// returned.
// *Action: For further details, turn on tracing and reexecute the operation.
// The trace file will include the name of the shared library (or DLL) that
// could not be loaded.
/
12229, 00000, "TNS:Interchange has no more free connections"
// *Cause:  One or more Interchanges along the path to the destination
// desired has no more free connections available to be used for this
// call.
// *Action: Try again later when the Interchanges are less busy, or contact
// your network administrator to have him determine which interchange it is,
// and increase the number of connections available on that interchange.
/
12230, 00000, "TNS:Severe Network error ocurred in making this connection"
// *Cause: This error is reported by an interchange which fails to make
// contact with the destination due to a physical network error while calling
// a destination.
// *Action: Try again later when the network service may have been fixed
// or report the problem to your Network Administrator so that he may fix
// the problem.
/
/ This line is an NI Magic Cookie. Don't eat it. Last NR error in 2.0.9.
/
/
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
/
/ 12500 - 12530 Reserved for NSG errors reportable to NI.
/
/ tnslsnr errors...
12500, 00000, "TNS:listener failed to start a dedicated server process"
// *Cause:  The process of starting up a dedicated server process failed.
// The executable could not be found or the environment maybe set up
// incorrectly.
// *Action: Turn on tracing at the ADMIN level and reexecute the operation.
// Verify that the ORACLE Server executable is present and has execute
// permissions enabled. Ensure that the ORACLE environment is specified
// correctly in LISTENER.ORA. If error persists, contact Worldwide Customer
// Support.
/
12502, 00000, "TNS:listener received no CONNECT_DATA from client"
// *Cause:  No CONNECT_DATA was passed to the listener.
// *Action: Check that the service name resolved from TNSNAMES.ORA has
// the CONNECT_DATA component of the connect descriptor.
/
12504, 00000, "TNS:listener was not given the SID in CONNECT_DATA"
// *Cause:  The SID was missing from the CONNECT_DATA.
// *Action: Check that the connect descriptor corresponding to the service
// name in TNSNAMES.ORA has an SID component in the CONNECT_DATA.
/
12505, 00000, "TNS:listener could not resolve SID given in connect descriptor"
// *Cause:  The SID in the CONNECT_DATA was not found in the listener's tables.
// *Action: Check to make sure that the SID specified is correct.
// The SIDs that are supported can be obtained by typing
// "LSNRCTL STATUS <service name>" and matching the SID specified in
// TNSNAMES.ORA with one of the SIDs displayed in the services summary.
/
12508, 00000, "TNS:listener could not resolve the COMMAND given"
// *Cause:  The COMMAND given to listener is not supported.
// *Action: This is not seen in normal use of Oracle Net.
// *Comment: Check the COMMAND given to listener. This error is probably
// caused by incompatible Oracle Net versions.
// Do not include in error manual.
/
12509, 00000, "TNS:listener failed to redirect client to service handler"
// *Cause:  The dispatcher terminated unexpectedly
// *Action: Attempt to connect again and if the same error occurs,
// contact the DBA to check the state of the dispatchers for this SID.
// If the problem persists, turn on tracing in the listener to determine
// the TNS error caused by the redirect.
/
12510, 00000, "TNS:database lacks resources to handle the request for this SID"
// *Cause:  The dispatchers are busy handling other requests.
// *Action: Contact the DBA to increase the number of dispatchers
// servicing this SID.
/
12511, 00000, "TNS:service handler found but it is not accepting connections"
// *Cause:  The dispatchers are busy handling other requests and they notified
// the listener that they are temporarily busy.
// *Action: Attempt the connection again. If error persists, ask
// the DBA to increase the number of dispatchers.
/
12513, 00000, "TNS:service handler found but it has registered for a different protocol"
// *Cause:  The dispatchers registered for this service are connected to
// the listener by way of a different network protocol than that of the client.
// *Action: Contact the DBA to register a dispatcher on your protocol.
/
/ This line is an NI Magic Cookie. Don't eat it. Last NSG error in 2.0.9.
/
/
////////////////////////////////////////////////////////////////////
/
/ 12531 - 12629 ns errors reportable to ni:
/
/               12531 - 15609 ns primary errors
/               12610 - 12629 ns secondary errors
/
/               A primary may (optionally) be qualified by a secondary
/               error.  For example: 12531 ("invalid argument") might
/               be qualified by 12617 ("bad 'what' value").
/
12531, 00000, "TNS:cannot allocate memory"
// *Cause:  Sufficient memory could not be allocated to perform the desired
// activity.
// *Action:  Either free some resource for TNS, or add more memory to the
// machine. For further details, turn on tracing and reexecute the operation.
/
12532, 00000, "TNS:invalid argument"
// *Cause:  An internal function received an invalid parameter.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12533, 00000, "TNS:illegal ADDRESS parameters"
// *Cause: An illegal set of protocol adapter parameters was specified. In
// some cases, this error is returned when a connection cannot be made to the
// protocol transport.
// *Action: Verify that the destination can be reached using the specified
// protocol. Check the parameters within the ADDRESS section of
// TNSNAMES.ORA.  Legal ADDRESS parameter formats may be found in the
// Oracle operating system specific documentation for your platform.
// Protocols that resolve names at the transport layer (such as DECnet object
// names) are vulnerable to this error if not properly configured or names are
// misspelled.
/
12534, 00000, "TNS:operation not supported"
// *Cause:  An internal function received a request to perform an
// operation that is not supported (on this machine).
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12535, 00000, "TNS:operation timed out"
// *Cause: The requested connection could not be completed within the timeout
// period specified by the CONNECT_TIMEOUT parameter in listener.ora. This
// error arises from the tnslsnr.
// *Action: Either reconfigure CONNECT_TIMEOUT to be 0, which means
// wait indefinitely, or reconfigure CONNECT_TIMEOUT to be some higher
// value. Or, if the timeout is unacceptably long, turn on tracing
// for further information.
/
12536, 00000, "TNS:operation would block"
// *Cause: An internal operation did not commence because to do so would
// block the current process and the user has requested that operations be
// non-blocking.
// *Action:  None needed; this is an information message.
/
12537, 00000, "TNS:connection closed"
// *Cause: "End of file" condition has been reached; partner has disconnected.
// *Action: None needed; this is an information message.
/
12538, 00000, "TNS:no such protocol adapter"
// *Cause: The protocol adapter requested (by way of the "(PROTOCOL=..)"
// keyword-value pair in a TNS address) is unknown. If the supplied address
// is typographically correct then the protocol adaptor is not installed.
// *Action: Install the protocol adapter or correct typographical error,
// as appropriate.  Note: if the supplied address was derived from
// resolving the service name, check the address in the appropriate file
// (TNSNAMES.ORA or LISTENER.ORA).
/
12539, 00000, "TNS:buffer over- or under-flow"
// *Cause: Buffer too small for incoming data or too large for outgoing data.
// *Action:  This restriction (which is associated with CONNECT DATA) is not
// normally visible to the user. For further details, turn on tracing and
// reexecute the operation; contact Worldwide Customer Support.
/
12540, 00000, "TNS:internal limit restriction exceeded"
// *Cause: Too many TNS connections open simultaneously.
// *Action: Wait for connections to close and re-try.
/
12541, 00000, "TNS:no listener"
// *Cause: The connection request could not be completed because the listener
// is not running.
// *Action: Ensure that the supplied destination address matches one of
// the addresses used by the listener - compare the TNSNAMES.ORA entry with
// the appropriate LISTENER.ORA file (or TNSNAV.ORA if the connection is to
// go by way of an Interchange). Start the listener on the remote machine.
/
12542, 00000, "TNS:address already in use"
// *Cause: Specified listener address is already being used.
// *Action: Start your listener with a unique address.
/
12543, 00000, "TNS:destination host unreachable"
// *Cause: Contact can not be made with remote party.
// *Action: Make sure the network driver is functioning and the network is up.
/
12544, 00000, "TNS:contexts have different wait/test functions"
// *Cause: Two protocol adapters have conflicting wait/test functions.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12545, 00000, "TNS:name lookup failure"
// *Cause: A protocol specific ADDRESS parameter cannot be resolved.
// *Action: Ensure the ADDRESS parameters have been entered correctly;
// the most likely incorrect value is the node name.
/
12546, 00000, "TNS:permission denied"
// *Cause: User has insufficient privileges to perform the requested operation.
// *Action: Acquire necessary privileges and try again.
/
12547, 00000, "TNS:lost contact"
// *Cause: Partner has unexpectedly gone away, usually during process
// startup.
// *Action: Investigate partner application for abnormal termination. On an
// Interchange, this can happen if the machine is overloaded.
/
12548, 00000, "TNS:incomplete read or write"
// *Cause: A data send or receive failed.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12549, 00000, "TNS:operating system resource quota exceeded"
// *Cause: The current user has exceeded the allotted resource assigned in the
// operating system.
// *Action: Acquire more operating system resource, or perform a different
// function.
/
12550, 00000, "TNS:syntax error"
// *Cause: The supplied connect descriptor contains illegal syntax.
// *Action: Check the syntax of the connect descriptor in TNSNAMES.ORA.
/
12551, 00000, "TNS:missing keyword"
// *Cause: The supplied connect descriptor is missing one or more TNS
// keywords.
// *Action: Check the syntax, and ensure all required keywords are present.
/
12552, 00000, "TNS:operation was interrupted"
// *Cause: An internal operation was interrupted and could not complete.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12555, 00000, "TNS:permission denied"
// *Cause: User has insufficient privileges to perform the requested operation.
// *Action: Acquire necessary privileges and try again.
/
12556, 00000, "TNS:no caller"
// *Cause: TNS detected an incoming connect request but there was no caller.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact 
// Worldwide Customer Support.
/
12557, 00000, "TNS:protocol adapter not loadable"
// *Cause:  On some platforms (such as Windows) protocol support is loaded at
// run-time. If the shared library (or DLL) for the protocol adapter is
// missing or one of its supporting libraries is missing then this error is
// returned.
// *Action: For further details, turn on tracing and reexecute the operation.
// The trace file will include the name of the shared library (or DLL) that
// could not be loaded.
/
12560, 00000, "TNS:protocol adapter error"
// *Cause: A generic protocol adapter error occurred.
// *Action: Check addresses used for proper protocol specification. Before
// reporting this error, look at the error stack and check for lower level
// transport errors.For further details, turn on tracing and reexecute the
// operation. Turn off tracing when the operation is complete.
/
12561, 00000, "TNS:unknown error"
// *Cause: A generic protocol error occurred.
// *Action: For further details, turn on tracing and reexecute the operation.
/
12562, 00000, "TNS:bad global handle"
// *Cause: Internal error - bad 'gbh' agrument passed to TNS from caller.
// System may have been linked with old libraries.
// *Action: Not normally visible to the user, contact Worldwide Customer
// Support.
/
12564, 00000, "TNS:connection refused"
// *Cause: The connect request was denied by the remote user (or TNS software).
// *Action: Not normally visible to the user.  For further details, turn on
// tracing and reexecute the operation.
/
12566, 00000, "TNS:protocol error"
// *Cause: An unexpected TNS protocol error has occurred.
// *Action: For further details, turn on tracing and reexecute the operation.
// If error persists, contact Worldwide Customer Support.
/
12569, 00000, "TNS:packet checksum failure"
// *Cause: The data received is not the same as the data sent.
// *Action: Attempt the transaction again. If the error is persistent, turn
// on tracing and reexecute the operation.
/
12570, 00000, "TNS:packet reader failure"
// *Cause: An error occurred during a data receive.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12571, 00000, "TNS:packet writer failure"
// *Cause: An error occurred during a data send.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12574, 00000, "TNS:redirection denied"
// *Cause: The connect request failed because it would have required
// redirection and the caller has requested no redirections.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12582, 00000, "TNS:invalid operation"
// *Cause:  An internal function received an invalid request.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12583, 00000, "TNS:no reader"
// *Cause:  A send operation has been requested but partner has already
// disconnected.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12585, 00000, "TNS:data truncation"
// *Cause:  A receive operation has completed with insufficient data
// to satisfy the user's request.
// *Action: Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12589, 00000, "TNS:connection not bequeathable"
// *Cause: An attempt to hand-off a connection from one process to another
// has failed because the protocol provider does not support it.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12590, 00000, "TNS:no I/O buffer"
// *Cause: An attempt to perform an I/O operation failed because no buffer
// was available.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12591, 00000, "TNS:event signal failure"
// *Cause: The TNS software is unable to signal an event occurrence.
// *Action: For further details, turn on tracing and reexecute the operation.
// If error persists, contact Worldwide Customer Support.
/
12592, 00000, "TNS:bad packet"
// *Cause: An ill-formed packet has been detected by the TNS software.
// *Action: For further details, turn on tracing and reexecute the
// operation. If error persists, contact Worldwide Customer Support.
/
12593, 00000, "TNS:no registered connection"
// *Cause: An attempt to solicit network event activity has failed because
// no connections are registered for event notification.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12595, 00000, "TNS:no confirmation"
// *Cause: TNS is unable to get requested confirmation acknowledgement from
// remote partner.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12596, 00000, "TNS:internal inconsistency"
// *Cause: TNS has detected an internal inconsistency.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation and contact Worldwide Customer
// Support.
/
12597, 00000, "TNS:connect descriptor already in use"
// *Cause:  Internal error - illegal use of connect descriptor.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12598, 00000, "TNS: operation failed due to error returned by native service"
// *Cause: The TNS native service component returned an error.
// *Action: Details of the exact violation are reported in the "secondary
// error" field of the TNS result descriptor.  If necessary, turn on
// tracing and reexecute the operation to see the result descriptor.
/
12599, 00000, "TNS:cryptographic checksum mismatch"
// *Cause: The data received is not the same as the data sent.
// *Action: Attempt the transaction again. If error persists, check
// (and correct) the integrity of your physical connection.
/
/ 12610 - 12629 ns secondary errors
/
/12611, 00000, "TNS:operation is not portable"
// *Cause: Attempted operation is not portable.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
/12612, 00000, "TNS:connection is busy"
// *Cause: Attempted operation failed because it conflicts with an on-going
// action or status of the connection.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
/12615, 00000, "TNS:preempt error"
// *Cause: A request to service an event failed because no event notification
// has yet been posted.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12616, 00000, "TNS:no event signals"
// *Cause: The TNS software is unable to enable event signals.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
/12617, 00000, "TNS:bad 'what' type"
// *Cause: The operation failed because the type of data specified is unknown.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. Iferror persists, contact
// Worldwide Customer Support.
/
12618, 00000, "TNS:versions are incompatible"
// *Cause: The two machines are running incompatible versions of TNS.
// *Action: Check the version numbers, and upgrade the machine with the
// smaller one.
/
12619, 00000, "TNS:unable to grant requested service"
// *Cause: The connect request failed because requested service could not be
// provided by the local TNS software.
// *Action: If appropriate, reexecute with reduced service requirements.
/
12620, 00000, "TNS:requested characteristic not available"
// *Cause: The connect request failed because a requested transport
// characteristic could not be supported by the remote TNS software.
// *Action: If appropriate, reexecute with reduced requirements.
/
12622, 00000, "TNS:event notifications are not homogeneous"
// *Cause: An attempt to register a connection for event notification failed
// because the event notification type conflicts with existing registrations.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation and contact Worldwide Customer
// Support.
/
12623, 00000, "TNS:operation is illegal in this state"
// *Cause: Connection is half-duplex and a full-duplex operation was
// attempted.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation. If error persists, contact
// Worldwide Customer Support.
/
12624, 00000, "TNS:connection is already registered"
// *Cause: An attempt to register a connection for event notification failed
// because the connection is already registered.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation and contact Worldwide Customer
// Support.
/
12625, 00000, "TNS:missing argument"
// *Cause: An operation failed because an argument was missing"
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation and contact Worldwide Customer
// Support.
/
12626, 00000, "TNS:bad event type"
// *Cause: An attempt to register a connection for event notification failed
// because the event type is unknown.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation and contact Worldwide Customer
// Support.
/
12628, 00000, "TNS:no event callbacks"
// *Cause: An attempt to register a connection for event notification failed
// because asynchronous callbacks are not available.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation and contact Worldwide Customer
// Support.
/
12629, 00000, "TNS:no event test"
// *Cause: An attempt to register a connection for event notification failed
// because the ability to test for events is not available.
// *Action:  Not normally visible to the user. For further details, turn
// on tracing and reexecute the operation and contact Worldwide Customer
// Support.
/
/ 12630 - 12699 Reserved for NA errors.
/
12630, 00000, "TNS:native service operation not supported"
// *Cause:  An operation requested by a user is not supported by the native
//          services component.
// *Action: This may be an internal error if the operation should have been
//          supported.
/
12631, 00000, "TNS:name retrieval failed"
// *Cause:  The authentication service failed to retrieve the name of a user.
// *Action: Enable tracing to determine which routine is failing.
/
12632, 00000, "TNS:role fetch failed"
// *Cause:  The authentication service failed to retrieve one of the user's
//          roles.
// *Action: Enable tracing to determine which routine is failing.
/
12633, 00000, "TNS:no shared authentication services"
// *Cause:  The list of authentication services specified by the user does not
//          match those supported by the process.
// *Action: Either specify another list or relink the executable with the
//          desired services.
/
12634, 00000, "TNS:memory allocation failed"
// *Cause:  Process was unable to allocate memory.
// *Action: Terminate other processes in order to reclaim needed memory.
/
12635, 00000, "TNS:no authentication adapters available"
// *Cause:  The executable was not linked with any authentication service
//          adapters but the sqlnet.ora parameter that determines whether or
//          not authentication is required was set to true.
// *Action: Either disable the parameter or relink the executable with service
//          adapters.
/
12636, 00000, "TNS:packet send failed"
// *Cause:  A process was unable to send a packet to another process.
//          Possible causes are:
//          1. The other process was terminated.
//          2. The machine on which the other process is running went down.
//          3. Some other communications error occurred.
// *Action: If the cause is not obvious, contact Worldwide Customer Support.
/
12637, 00000, "TNS:packet receive failed"
// *Cause:  A process was unable to receive a packet from another process.
//          Possible causes are:
//          1. The other process was terminated.
//          2. The machine on which the other process is running went down.
//          3. Some other communications error occurred.
// *Action: If the cause is not obvious, contact Worldwide Customer Support.
/
12638, 00000, "TNS:credential retrieval failed"
// *Cause:  The authentication service failed to retrieve the credentials of a
//          user.
// *Action: Enable tracing to determine the exact error.
/
12639, 00000, "TNS:authentication service negotiation failed"
// *Cause:  No match was found between the types of authentication services
//          that the client supports and those that the server is using.
// *Action: Possible solutions:
//          1. Change the entry in sqlnet.ora that determines which services
//             are to be used.
//          2. Relink the client with at least one of the authentication
//             service adapters that the server supports.
//          3. Relink the server with at least one of the authentication
//             service adapters that the client supports.
//          4. Disable authentication on both the client and server.
/
12640, 00000, "TNS:authentication service initialization failed"
// *Cause:  The function specified in the authentication table entry for the
//          service failed.
// *Action: Enable tracing to determine the exact error.
/
12641, 00000, "TNS:authentication service failed to initialize"
// *Cause:  The authentication service failed during initialization.
// *Action: Enable tracing to determine the exact error.
/
12642, 00000, "TNS:no session key"
// *Cause:  A process has no session key associated with it because the
//          authentication service being used does not use one.
// *Action: If a session key is required, use another authentication service.
/
12643, 00000, "TNS:process communication failed"
// *Cause:  A process was unable to communicate with another process.
//          Possible causes are:
//          1. The other process was terminated.
//          2. The machine on which the other process is running went down.
//          3. Some other communications error occurred.
// *Action: If the cause is not obvious, contact Worldwide Customer Support.
/
12644, 00000, "TNS:authentication service initialization failed"
// *Cause:  The routine called to initialize the authentication adapter failed.
// *Action: Enable tracing to determine the exact error. A likely cause is that
//          memory is exhausted.
/
12645, 00000, "TNS:parameter does not exist."
// *Cause:  A sqlnet.ora parameter from which a value was needed does not
//          exist.
// *Action: Set the parameter in the parameter file.
/
12646, 00000, "TNS:invalid value specified for boolean parameter"
// *Cause:  The value specified for a parameter was set to a value other than
//          true/false or on/off.
// *Action: Correct the value of the parameter.
/
12647, 00000, "TNS:authentication required"
// *Cause:  The parameter that controls whether authentication is required was
//          set to true, but the executable does not have an
//          authentication service linked in.
// *Action: Either re-link the executable with an authentication service
//          adapter or disable the parameter.
/
12648, 00000, "TNS:encryption or data integrity algorithm list empty"
// *Cause:  An Oracle Advanced Security list-of-algorithms parameter was
//          empty, e.g. "()".
// *Action: Change the list to contain the name of at least one
//          installed algorithm, or remove the list entirely if every
//          installed algorithm is acceptable.
/
12649, 00000, "TNS:unknown encryption or data integrity algorithm"
// *Cause:  An Oracle Advanced Security list-of-algorithms parameter
//          included an algorithm name that was not recognized.
// *Action: Either remove that algorithm name, correct it if it was
//          misspelled, or install the driver for the missing
//          algorithm.
/
12650, 00000, "TNS:no common encryption or data integrity algorithm"
// *Cause:  The client and server have no algorithm in common for
//          either encryption or data integrity or both.
// *Action: Choose sets of algorithms that overlap.  In other words,
//          add one of the client's algorithm choices to the server's
//          list or vice versa.
/
12651, 00000, "TNS:encryption or data integrity algorithm unacceptable"
// *Cause:  The algorithm the server chose to use for encryption or
//          data integrity was not one of the choices acceptable to
//          the client.  This is either the result of an internal
//          error, of a network data transmission error, or of
//          deliberate tampering with the transmitted data.
// *Action: For further details, turn on tracing, re-execute the
//          operation, and contact Worldwide Customer Support.
/
12652, 00000, "TNS:string truncated"
// *Cause:  Not enough memory was allocated for a string so it had to be
//          trucated
// *Action: If it is OK that the string is truncated, then it is not an
//          error. Otherwise, call the routine that reported the error
//          again with a larger string buffer.
/
12653, 00000, "TNS:authentication control function failed"
// *Cause:  The control function utilized by the authentication service driver
//          failed.
// *Action: Enable tracing to determine the exact error.
/
12654, 00000, "TNS:authentication conversion failed"
// *Cause:  The authentication service was unable to convert the credentials
//          of a user from the format specific to the format into the
//          ORACLE format.
// *Action: Enable tracing to determine the exact error.
/
12655, 00000, "TNS:password check failed"
// *Cause:  The authentication service being used was unable to verify the
//          provided password.
// *Action: Enable tracing to determine the exact error.
/
12656, 00000, "TNS:cryptographic checksum mismatch"
// *Cause:  The cryptographic checksum received with a packet of
// 	    incoming data didn't match the checksum computed by the
// 	    receiving end.  This indicates that the packet was
// 	    tampered with or otherwise corrupted in transit.
// *Action: Look for sources of data corruption, perhaps including
// 	    deliberate tampering.
/
12657, 00000, "TNS:no algorithms installed"
// *Cause:  The near side of the connection required the use of a
// 	    service (either encryption or checksumming) when no
// 	    algorithms for that service were installed.
// *Action: Remove the "ON" requirement for that service.
/
12658, 00000, "TNS:native service required but TNS version is incompatible"
// *Cause:  A process that is running an earlier version of TNS attempted to
//          connect but the connection failed because the server process
//          required that a native service (authentication, encryption, etc.)
//          be used.
// *Action: Relink the calling executable and retry the connection or eliminate
//          the requirement that the service be used on the server side.
/
12659, 00000, "TNS:error received from other process"
// *Cause:  An error was received by one or more services from the process on
//          the other side of the connection.
// *Action: Enable tracing to determine the exact error(s).
//          The error(s) is (are) not returned directly because an error
//          generated by a server may not make sense on the client side and
//          vice-versa.
/
12699, 00000, "TNS:native service internal error"
// *Cause:  An internal error occurred in the native services component.
// *Action: Enable tracing to determine the exact error. Contact Worldwide
//          Customer Support.
/
/
