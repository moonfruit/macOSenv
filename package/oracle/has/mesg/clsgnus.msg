/ Copyright (c) Oracle 2008.  All Rights Reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clsgnus.msg
/ DESCRIPTION
/   Message file for the Grid Naming Service
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   rwessman     05/28/09  - Added message #186
/   rwessman     05/28/09  - Fixed message 130.
/   rwessman     05/14/09  - Added message #186.
/   rwessman     03/19/09  - Added message #178 and #179.
/   rwessman     03/10/09  - Added message #173.
/   rwessman     03/10/09  - Added message #174.
/   rwessman     03/03/09  - Cleaned up message #161.
/   rwessman     02/02/09  - Bug 8211952.
/   rwessman     01/23/09  - Added message #170.
/   rwessman     12/02/08  - Added message #169.
/   rwessman     11/06/08  - Changed message #2 to state that the address is
/                            optional.
/   rwessman     10/23/08  - Review comments from bmanry.
/   rwessman     10/06/08  - Added message #168.
/   rwessman     09/23/08  - Fixed typo found during translation.
/   rwessman     09/10/08  - Added message #167.
/   rwessman     10/14/08  - Changed message #62 due to fix for bug 7446733.
/   rwessman     09/05/08  - Added message #166.
/   rwessman     08/27/08  - Added message #165.
/   rwessman     08/25/08  - Improved error messages.
/   rwessman     08/08/08  - Added message #163 and message #164 as part of fix
/                            for bug 7316012.
/   rwessman     07/17/08  - Made "packet ignored" message more informative.
/   rwessman     06/25/08  - Added message #162.
/   rwessman     06/10/08  - Added message #161.
/   rwessman     06/06/08  - Added messages for multicast port and DNS bridge
/                            port.
/   rwessman     03/12/08  - Fixed bugs in messages.
/   rwessman     02/11/08  - Added message #31.
/   rwessman     02/07/08  - Added message 158.
/   rwessman     02/06/08  - Fixed message number and added an informational
/                            message for the server state.
/   rwessman     01/30/08  - Added messages to be logged.
/   rwessman     01/16/08  - Added messages 152 and 153.
/   rwessman     01/15/08  - Added message 152.
/   rwessman     12/11/07  - Added message 151.
/   rwessman     12/10/07  - Added message 151
/   rwessman     11/19/07  - Added host deletion command message.
/   rwessman     11/14/07  - Changed to use special LSF format modifiers
/                            because no one else uses them and CLSK formatting
/                            may not support them in the future.
/   rwessman     11/01/07  - Added "unsupported query type.
/   rwessman     09/10/07  - Added internal error 32767.
/   rwessman     09/06/07  - Added message #148.
/   rwessman     08/16/07  - Added message #140.
/   rwessman     08/01/07  - Added messages 138 and 139.
/   rwessman     05/23/07  - Added GPnP errors.
/   rwessman     01/05/06  - Created
/
00000, 0, "no error\n"
// *Cause:  Operation was successful.
// *Action: No action needed.
00001, 00000, "print this message."
// *Document: NO
// *Cause:  
// *Action: 
/
00002, 00000, "stop advertising a host. The address of the host is optional."
// *Document: NO
// *Cause:  
// *Action: 
/
00003, 00000, "unknown command: \"%s\"\n"
// *Cause:  The command entered was invalid.
// *Action: Specify a valid command.
/
00004, 00000, "Disconnected from"
// *Document: NO
// *Cause:  
// *Action: 
/
00005, 00000, "start the gnsd server."
// *Document: NO
// *Cause:  
// *Action: 
/
00006, 00000, "stop the gnsd server."
// *Document: NO
// *Cause:  
// *Action: 
/
00007, 00000, "advertise a host using the IP address."
// *Document: NO
// *Cause:  
// *Action: 
/
00008, 00000, "create an alias for the host."
// *Document: NO
// *Cause:  
// *Action: 
/
00009, 00000, "delete an alias for a host."
// *Document: NO
// *Cause:  
// *Action: 
/
00010, 00000, "get the value of one or all parameters."
// *Document: NO
// *Cause:  
// *Action: 
/
00011, 00000, "set the value of a parameter."
// *Document: NO
// *Cause:  
// *Action: 
/
00012, 00000, "unset the value of a parameter."
// *Document: NO
// *Cause:  
// *Action: 
/
00013, 00000, "save the configuration."
// *Document: NO
// *Cause:  
// *Action: 
/
00014, 00000, "set tracing level."
// *Document: NO
// *Cause:  
// *Action: 
/
00015, 00000, "query for the version of the server."
// *Document: NO
// *Cause:  
// *Action: 
/
00016, 00000, "query for the status of the server."
// *Document: NO
// *Cause:  
// *Action: 
/
00017, 00000, "set the logging level."
// *Document: NO
// *Cause:  
// *Action: 
/
00018, 00000, "parameter has no default value."
// *Cause:  An attempt was made to reset the value of a parameter for
//          which there is no default value.
// *Action: Specify a parameter which has a default value.
/
00019, 00000, "reset value of a parameter to default."
// *Document: NO
// *Cause:  
// *Action: 
/
00020, 00000, "undo changes made in the current session."
// *Document: NO
// *Cause:  
// *Action: 
/
00021, 00000, "no changes to save.\n"
// *Document: NO
// *Cause: There were no changes to save.
// *Action: 
/
00022, 00000, "no changes to rollback.\n"
// *Document: NO
// *Cause: There were no changes to undo.
// *Action: 
/
00023, 00000, "\"%s\" is only available in interactive mode.\n"
// *Cause:  An attempt was made to run or get help for a command from the
//          command line which is available only in interactive mode.
// *Action: Change to interactive mode to run the command.
/
00024, 00000, "Server abort exception caught - shutting down."
// *Cause:  Informational message that the server is aborting.
// *Action:   Examine the alert log and trace files to determine the reason(s)
//            why the abort is occurring.
/
00025, 00000, "Creation of name object for configuration file \"%s\" failed.\n"
// *Cause:  It was not possible to create a name object for the
//          configuration file.
// *Action: Examine the rest of the stack for the exact reason.
/
00026, 00000, "Configuration file \"%s\" does not exist.\n"
// *Cause:  The configuration file specifed could not be found.
// *Action: Specify a file that exists.
/
00027, 00000, "Initialization of object for configuration file \"%s\" failed.\n"
// *Cause:  It was not possible to create a file object for the
//          specified file.
// *Action: Examine the rest of the error stack for the exact reason.
/
00028, 00000, "Open of configuration file \"%s\" failed.\n"
// *Cause:  The open of the configuration file failed.
// *Action: Examine the rest of the error stack for the exact reason.
/
00029, 00000, "Read of configuration file \"%s\" failed.\n"
// *Cause:  A read of the configuration file failed.
// *Action: Examine the rest of the error stack for the exact reason.
/
00030, 00000, "Close of configuration file \"%s\" failed.\n"
// *Cause:  It was not possible to close the configuration file.
// *Action: Examine the rest of the error stack for the exact reason.
/
00031, 00000, "Server failed to start:\n%s"
// *Cause: The GNS server failed to start due to an error encountered by the
//          server.
// *Action: Examine the message that accompanies this one for details. Also,
//          take a look at the server log files for more information.
/
00032, 00000, "Unexpected end of line found in record \"%s\".\n"
// *Cause:  The line ended unexpectedly. For example, the line might
//          have ended before the end of a quoted string was found.
// *Action: Specify a correctly formatted line.
/
00033, 00000, "Too few arguments for value of parameter \"%s\" Minimum: %d\n"
// *Cause:  Not enough arguments were specified for a parameter.
// *Action: Specify the required number of arguments.
/
00034, 00000, "Too many arguments for value of parameter \"%s\" Maximum: %d\n"
// *Cause:  The number of arguments specified for a parameter was greater than
//          maximum allowed.
// *Action: Specify the required number of arguments.
/
00035, 00000, "Record \"%s\" contains too few fields. Minimum: %u. Specified: %u.\n"
// *Cause:  The entry for a parameter in the configuration file does not
//          contain the required number of fields.
// *Action: Correct the entry to have the required number of fields.
/
00036, 00000, "Record \"%s\" contains too many fields. Maximum: %u. Specified: %u.\n"
// *Cause:  The entry for a parameter in the configuration file contains more
//          than the maximum number of fields.
// *Action: Correct the entry to have the required number of fields.
/
00037, 00000, "Yes"
// *Document: NO
// *Cause:  Not an error. Permits the user to specify "yes" as a parameter in
//          his or native language.
// *Action: No action required.
/
00038, 00000, "No"
// *Document: NO
// *Cause:  Not an error. Permits the user to specify "no" as a parameter in
//          his or native language.
// *Action: No action required.
/
00039, 00000, "invalid value for floating point parameter: \"%s\": \"%s\"\n"
// *Cause:  The value specified for a floating point parameter was not floating
//          point.
// *Action: Specify a correct value.
/
00040, 00000, "invalid value for integer parameter: \"%s\": \"%s\"\n"
// *Cause:  The value specified for an integer parameter was not an integer.
// *Action: Specify a correct value, either decimal or hexadecimal.
//          Hexadecimal values start with the string "0x".
/
00041, 00000, "invalid value for boolean parameter \"%s\": \"%s\"\n"
// *Cause:  The value specified for a boolean parameter was not a boolean
//          value.
// *Action: Specify a correct value. Correct values include: TRUE/FALSE,
//          YES/NO, ON/OFF, and 1/0.
/
00042, 00000, "Usage: %s %s\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00043, 00000, "invalid configuration method: \"%s\"\n"
// *Cause:  An unknown type was specified for the method used to store
//          configuration information.
// *Action: Specify a valid type.
/
00044, 00000, "no file name specified.\n"
// *Cause:  No name was specified for a configuration method which uses
//          a file as the repository.
// *Action: Specify a file name.
/
00045, 00000, "initialization failed: %s\n"
// *Cause:  The initialization of GNS failed.
// *Action: Please examine the accompanying message for the exact
//          reason.
/
00046, 00000, "no value found for parameter \"%s\".\n"
// *Cause:  A value was not specified for the parameter.
// *Action: Specify a parameter.
/
00047, 00000, "multiple values found for parameter \"%s\".\n"
// *Cause:  Multiple values were specified for a parameter.
// *Action: Specify a single value.
/
00048, 00000, "type mismatch \"%s\". Expected: %s Actual: %s.\n"
// *Cause:  The type of the value specified for a parameter does not
//          match the required type.
// *Action: Change the type of the parameter.
/
00049, 00000, "unknown parameter: \"%s\".\n"
// *Cause:  The specified parameter is not supported.
// *Action: Specify a supported parameter.
/
00050, 00000, "failure to convert parameter value \"%s\" to \"%s\".\n"
// *Cause:  The attempt to convert the string value for a parameter
//          failed.
// *Action: Specify a value of the correct type.
/
00051, 00000, "unsupported query type: \"%s\""
// *Cause:  The query type passed in is not supported by GNS.
// *Action: Specify a supported query type.
/
00052, 00000, "Initialization of OCR at level %u failed.\n  %s\n"
// *Cause:  Initialization of OCR to the specified level failed.
// *Action: Examine the error message to determine what occurred.
/
00053, 00000, "validate that a host has been advertised."
// *Document: NO
// *Cause:  
// *Action: 
/
00054, 00000, "Invalid IP address: %s"
// *Cause:  The IP address specified is neither in the v4 or v6 format.
// *Action: Specify a correct address.
/
00055, 00000, "Get addresses for a given host."
// *Document: NO
// *Cause:  
// *Action:  
/
00056, 00000, "Unable to resolve host name \"%s\""
// *Cause:  No entry was found in GNS or the system for the specified
//          host.
// *Action: Specify a valid machine.
/
00057, 00000, "Invalid process type specified."
// *Cause:  The caller specified a process type which is not known.
// *Action: Specify a valid type.
/
00058, 00000, "Invalid number of arguments specified: %d.\n"
// *Cause:  The client program sent the wrong number of arguments over
//          for a command.
// *Action: This error should not ordinarily be seen. Contact Oracle
//          Customer Support.
/
00059, 00000, "Unknown command: %u.\n"
// *Cause:  The server received an unknown command from the client.
// *Action: This error should never happen. If it does, contact Oracle Customer
//          Support.
/
00060, 00000, "Conversion of string value \"%s\" failed with error %d.\n"
// *Cause:  The value of a parameter sent over from the client to number
//          failed.
// *Action: Specify a valid parameter value.
/
00061, 00000, "Internal error.\n"
// *Cause:  An unexpected error occurred. The rest of the error stack contains
//          details about the error.
// *Action: This error should never happen. If it does, contact Oracle
//          Customer Support.
/
00062, 00000, "Server spawn failed: could not access subdirectory %s under %s.\n"
// *Cause:  The server process could not be spawned because the
//          directory where the program resides could not be located
//          or accessed.
// *Action: Make sure that the server directory exists and can be
//          accessed by the user starting the program.
/
00063, 00000, "Server spawn failed: executable not accessible: directory: %s file: %s\n"
// *Cause:  The server program could not be accessed.
// *Action: Make sure the server executable exists and can be accessed
//          by the user starting the program.
/
00064, 00000, "spawn of server %s failed.\n"
// *Cause:  The client was unable to start the server process.
// *Action: More details about the failure can be found in messages that follow.
/
00065, 00000, "Unable to create backup for configuration file %s"
// *Cause:  The GNS server was unable to create a backup configuration
//          file.
// *Action: Check the permissions in the configuration directory. Make
//          sure that the GNS process is permitted to create files
//          there.
/
00066, 00000, "Service advertisement initialization failed.\n"
// *Cause:  GNS failed when tried to initialize the Resource Discovery
//          subsystem.
// *Action: Examine the message following this one. It will indicate
//          the cause. If it is a number, consult rdret.h.
/
00067, 00000, "Service advertisement termination failed.\n"
// *Cause:  GNS failed while trying to shut down the Resource Discovery
//          subsystem.
// *Action: Examine the message following this one. It will indicate
//          the cause. If it is a number, consult rdret.h.
/
00068, 00000, "Service advertisement stop failed.\n"
// *Cause:  GNS encountered an error when it tried to stop the advertisement of
//          its service.
// *Action: Examine the message following this one. It will indicate
//          the cause. If it is a number, consult rdret.h.
/
00069, 00000, "Service registration failed.\n"
// *Cause:  GNS was unable to register itself with Resource Discovery.
// *Action: Examine the message following this one. It will indicate
//          the cause. If it is a number, consult rdret.h.
/
00070, 00000, "Service location failed.\n"
// *Cause:  The client program was not able to locate an GNS server.
// *Action: Examine the message following this one for a possible
//          cause. If it is a number, consult rdret.h. Also, make sure that the
//          server process has been started.
/
00071, 00000, "Transport initialization failed.\n"
// *Cause:  GNS was unable to initialize the transport that it was used
//          to communicate between the client and server.
// *Action: The message following indicates the exact error that occurred.
/
00072, 00000, "Connection to server failed.\n"
// *Cause:  GNS was unable to initialize the transport that it was used
//          to communicate between the client and server.
// *Action: The message following indicates the exact error that occurred.
/
00073, 00000, "Send failed\n"
// *Cause:  GNS was unable to send data either from the client to the server or
//          from the server to the client.
// *Action: The message following indicates the exact error that occurred.
/
00074, 00000, "Wait for client connection failed\n"
// *Cause:  An error occurred while the server was waiting for a connection
//          from the client.
// *Action: The message following indicates the exact error that occurred.
/
00075, 00000, "Receive failed.\n"
// *Cause:  GNS was unable to receive data from its peer process.
// *Action: The message following indicates the exact error that occurred.
/
00076, 00000, "Packet ignored: %s.\n"
// *Cause:  The packet was ignored by the server because it was invalid. This
//          may be caused by another process sending malformed packets.
// *Action: Use system tools to determine if a non-GNS process is sending data
//          to the server.
/
00077, 00000, "Invalid DNS message received.\n"
// *Cause:  The GNS server received a message from the master DNS server which
//          was not of the correct format. This could be due to an error by the
//          server or because a malicious process is sending the GNS server
//          invalid packets.
// *Action: The error is informational and should not ordinarily be
//          visible to a user. If it is seen, contact Oracle Customer
//          Support.
/
00078, 00000, "No space in packet buffer. Length: %u. Remaining: %u"
// *Cause:  The GNS server was unable to add data to the packet that it
//          was going to send to the DNS server because an internal
//          buffer ran out of room.
// *Action: This error should ordinarily not be visible to users. If
//          it appears, contact Oracle Customer Support.
/
00079, 00000, "Bonjour initialization failed.\n"
// *Cause:  The function called to initialize Bonjour for use by GNS
//          failed.
// *Action: Examine the accompanying Bonjour error and take corrective action.
/
00080, 00000, "Wait for a DNS server request failed.\n"
// *Cause:  The GNS server attempted to wait for a request to arrive
//          from the DNS server.
// *Action: This error should ordinarily not be visible to users. If
//          it appears, contact Oracle Customer Support.
/
00081, 00000, "The GNS service is not running.\n"
// *Cause:  The GNS service could not be contacted because it is not
//          running.
// *Action: Start the GNS service.
/
00082, 00000, "The GNS service is already running.\n"
// *Cause:  An attempt was made to start the GNS service, but it was
//          already running.
// *Action: Shut down the GNS service before trying to start it.
/
00083, 00000, "Invalid option: \"%s\"\n"
// *Cause:  An unknown option was specified either to a client program
//          or the server.
// *Action: Specify a supported option.
/
00084, 00000, "Invalid trace level: \"%s\"\n"
// *Cause:  The value specified for the trace level was not a number.
// *Action: Specify a number for the trace level.
/
00085, 00000, "An argument must be specified for the \"%s\" option."
// *Cause:  An argument was not specified for the specified option.
// *Action: Provide an argument for the option.
/
00086, 00000, "Service location initialization failed.\n"
// *Cause:  The GNS client failed when it tried to initialize the Resource
//          Discovery subsystem.
// *Action: Examine the message following this one. It will indicate
//          the cause. If it is a number, consult rdret.h.
/
00087, 00000, "Listen on endpoint \"%s\" failed.\n"
// *Cause:  The server was unable to listen for requests on the
//          specified endpoint.
// *Action: The accompanying GIPC error should be examined for the
//          exact error.
/
00088, 00000, "Listen on %s port %u failed due to a lack of privileges.\n"
// *Cause:  The server was unable to listen on the specified port because it
//          does not have privilege to do so. On Linux and Unix systems, this
//          can occur because the server is not running as the root user.
// *Action: Run the server as a user with the needed privileges.
/
00089, 00000, "Not enough arguments specified for the \"%s\" option. Number specified: %u. Minimum number: %u.\n"
// *Cause:  Enough arguments were not specified for a command.
// *Action: Specify the minimum number of arguments.
/
00090, 00000, "Too many arguments specified for the \"%s\" option. Number specified: %u Maximum number: %u.\n"
// *Cause:  Too many arguments arguments specified for a command.
// *Action: Specify the required number of arguments.
/
00091, 00000, "Version: %s\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00092, 00000, "Status: %s\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00093, 00000, "Server failed during start up.\n"
// *Cause:  The GNS server started but later terminated unexpectedly.
// *Action: Examine the trace and log files for the reason.
/
00094, 00000, "DNS service query failed:\n  %s.\n"
// *Cause:  The name resolution component was unable to start a query for names
//          of hosts in the cluster.
// *Action: The following error will detail exactly what occurred. Also,
//          examine the log files for other information.
/
00095, 00000, "Invalid IP address for name \"%s\": \"%s\"\n"
// *Cause:  An attempt was made to register an IP address which was in the
//          incorrect format.
// *Action: Change the address to be in the correct format.
/
00096, 00000, "Connection to the mDNS server failed:\n  %s.\n"
// *Cause:  An attempt to perform an operation on an address failed
//          because it was not possible to connect to the mDNS server.
// *Action: Ensure that the server is up and try the operation again.
/
00097, 00000, "Advertisement of \"%s\" failed.\n"
// *Cause:  An attempt to advertise an address or create an alias
//          failed.
// *Action: Examine the accompanying message for more details as to
//          the reason.
/
00098, 00000, "Name already exists.\n"
// *Cause:  An attempt to advertise an address or create an alias failed
//          because the name already exists.
// *Action: Either delete the record and use a different name.
/
00099, 00000, "Multicast DNS server not running.\n"
// *Cause:  GNS was unable to send a query to the multicast DNS server
//          because it is not running.
// *Action: Start the multicast DNS server.
/
00100, 00000, "The alias \"%s\" already exists."
// *Cause:  The specified alias already exists.
// *Action: Specify an alias which does not exist.
/
00101, 00000, "The alias \"%s\" does not exist."
// *Cause:  An alias for a host could not be found.
// *Action: Specify an alias which exists.
/
00102, 00000, "The host name \"%s\" does not exist."
// *Cause:  A host with the specified name could not be found.
// *Action: Specify a host name which exists.
/
00103, 00000, "Command processed.\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00104, 00000, "Server shut down."
// *Document: NO
// *Cause:  
// *Action:  
/
00105, 00000, "Server aborting abnormally."
// *Document: NO
// *Cause:  
// *Action:  
/
00106, 00000, "Getting information about interfaces failed."
// *Cause:  GNS did not have the privilege to obtain information about the
//          interfaces available on the host.
// *Action: Consult the documentation about the operating system to determine
//          the privileges needed.
/
00107, 00000, "Getting information about interface \"%s\" failed."
// *Cause:  GNS did not have the privilege to obtain information about the
//          given interface.
// *Action: Consult the documentation about the operating system to determine
//          the privileges needed.
/
00108, 00000, "Multicast listener stopped."
// *Document: NO
// *Cause:  
// *Action:  
/
00109, 00000, "No interfaces available."
// *Cause:  GNS was unable to find any interfaces on which it can listen for
//          requests. This error is likely caused by the incorrect
//          specification of the list of interfaces on which GNS is not to
//          listen.
//          Alternatively, it may be caused by an error in system
//          configuration.
// *Action: Correct the list of prohibited interfaces if it was set
//          incorrectly. If this is not the case, check the system
//          configuration.
/
00110, 00000, "One or threads failed - check log.\n"
// *Cause:  One or more GNS failed unexpectedly.
// *Action: Check the log file to determine the exact reasons.
/
00111, 00000, "Acquisition of privileges needed to perform operation failed."
// *Cause:  An attempt to acquire the privileges needed failed.
// *Action: Examine the attached message for more details.
/
00112, 00000, "Platform initialization failed.\n"
// *Cause:  GNS was unable to initialize the layer the provides system-specific
//          services.
// *Action: Examine the accompanying message for details.
/
00113, 00000, "Switch from user \"%s\" to user \"%s\" to perform a network operation failed.\n"
// *Cause:  GNS was not able to switch to a more privileged user in to perform
//          an operation on the network.
// *Action: Examine the accompanying error message for details.
/
// 00114, 00000, "UNUSED"
// *Cause:  
// *Action:
/
00115, 00000, "Authentication failed due to network failure."
// *Cause:  The authentication of the client to the server failed due to a
//          failure in sending or receiving authentication data.
// *Action: Examine the log or trace files to determine the exact error.
/
00116, 00000, "Authentication operation timed out"
// *Cause:  The authentication of the client to the server failed because one
//          of the processes did not send its data in time.
// *Action: The accompanying reason has details about the reason.
/
00117, 00000, "Authentication protocol failure."
// *Cause:  The client program did not send to the server the data in the
//          format that it was expecting.
// *Action: Try the connection again using an Oracle-approved client.
/
00118, 00000, "Client was rejected: %s."
// *Cause:  The client was not allowed to connect to the GNS server.
// *Action: Examine the trace and log files for the specific reason.
/
00119, 00000, "Subdomain: %s\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00120, 00000, "Creation of configuration file \"%s\" failed.\n"
// *Cause:  The creation of the new version of the configuration file failed.
// *Action: Examine the rest of the error stack for the exact reason.
/
/
00121, 00000, "Trace level set to %u."
// *Cause: This is an information message to indicate that the trace level was
//          set.
// *Action: No action is needed.
/
00122, 00000, "Dynamic messaging initalization failed - error %d"
// *Cause:  The facility used to control the GNS server dynamically failed.
// *Action: This error should not be seen in normal use. Contact Oracle
//          Customer Support if it appears.
/
00123, 00000, "---- BEGIN STATE DUMP ----"
// *Document: NO
// *Cause:  
// *Action:  
/
00124, 00000, "---- END STATE DUMP ----"
// *Document: NO
// *Cause:  
// *Action:  
/
/
00125, 00000, "first request serviced."
// *Document: NO
// *Cause:  
// *Action: 
/
00126, 00000, "self-check succeeded."
// *Document: NO
// *Cause:  
// *Action: 
/
00127, 00000, "Privileged user \"%s\" does not exist."
// *Cause:  The user which GNS is to run as in order to run operations which
//          require special privileges does not exist.
// *Action: Specify a user which does exist on the host. This user must have
//          the ability to listen for requests from the DNS server.
/
00128, 00000, "Unprivileged user \"%s\" does not exist."
// *Cause:  The user which GNS is to run as in order to perform operations
//          which do not require special privileges does not exist.
// *Action: Specify a user which exists.
/
00129, 00000, "Privileged group \"%s\" does not exist."
// *Cause:  The group to which a user must belong in order to perform
//          administrative operations does not exist.
// *Action: Specify a group which exists on the host.
/
00130, 00000, "no privileges to access OCR key \"%s\"."
// *Cause:  It was not possible to retrieve the specified key from OCR
//          because the user does not have the required privileges.
// *Action: Either run the command as a user which has the required privileges
//          or configure OCR to allow retrieval of the key.
/
00131, 00000, "no privileges to get value for OCR key \"%s\"."
// *Cause:  It was not possible to retrieve the specified value from OCR
//          because the user does not have the required privileges.
// *Action: Either run the command as a user which has the required privileges
//          or configure OCR to allow retrieval of the key.
/
00132, 00000, "user \"%s\" not authorized to run command."
// *Cause:  A user tried to run a command but has no permission to do so.
// *Action: Run the command as a user which has the proper privileges.
/
00133, 00000, "Exception received:\n%s"
// *Cause:  An exception occurred on the server process.
// *Action: Examine the exception for details.
/
00134, 00000, "Invalid host name: \"%s\"."
// *Cause:  The name of the host to be used for a GNS operation was not valid.
//          The name may have no domain or be qualified with the name of
//          subdomain serviced by GNS.
// *Action: Specify a correct host name.
/
00135, 00000, "Mandatory parameter \"%s\" is not configured."
// *Cause:  A value was not configured for a mandatory parameter.
// *Action: Configure a value in the parameter repository.
/
00136, 00000, "Query for a host address failed."
// *Cause:  An address was not found for the specified host.
// *Action: Register the host using crsctl.
/
00137, 00000, "get the name of the subdomain served by GNS."
// *Document: NO
// *Cause:  
// *Action: 
/
00138, 00000, "No thread names specified."
// *Cause:  The command requires at least one thread name to be specified.
// *Action: Specify at least one thread name.
/
00139, 00000, "Invalid thread name \"%s\""
// *Cause:  The name of the thread was unknown to GNS.
// *Action: Specify a valid thread name.
/
00140, 00000, "OCR key \"%s\" does not exist."
// *Cause:  The specified key cannot be found in the Oracle Cluster Registry.
// *Action: Specify a key that exists This exception often happens when trying
//          to retrieve a configuration parameter.
/
00141, 00000, "The address \"%s\" already exists."
// *Cause:  A mapping for a address to a host already exists.
// *Action: Specify an address which does not exist.
/
00142, 00000, "Open of OCR key \"%s\" failed."
// *Cause:  An error occurred while trying to open the root OCR used by GNS.
// *Action: Examine the accompanying exceptions for more information about the
//          error. This error may be caused by mis-configuration.
/
00143, 00000, "Subdomain \"%s\" already exists."
// *Cause:  An attempt was made to create a GNS subdomain which already exists.
// *Action: Specify a subdomain which does not exist.
/
00144, 00000, "Subdomain \"%s\" does not exist."
// *Cause:  The specified GNS subdomain does not exist.
// *Action: Specify a subdomain which exists.
/
00145, 00000, "The host \"%s\" already exists."
// *Cause:  The specified host already exists.
// *Action: Specify an host which does not exist.
/
00146, 00000, "Address \"%s\" for name \"%s\" does not exist."
// *Cause:  The specified host address does not exist.
// *Action: Specify a host address which exists.
/
00147, 00000, "Address \"%s\" for name \"%s\" is not serviced by GNS."
// *Cause:  The specified address is not served by GNS.
// *Action: Specify a different address or change the subnet mask used by GNS.
/
00148, 00000, "Subnet specified \"%s\" is not valid."
// *Cause:  The subnet specified for GNS is not in the correct format.
// *Action: Specify the subnet in the correct format either a v4 or v6 address
//          followed by the mask e.g. "192.168.4.3/22".
/
00149, 00000, "Host address \"%s\" does not exist."
// *Cause:  The specified address is not known to GNS.
// *Action: Specify a valid address.
/
00150, 00000, "Alias \"%s\" is invalid."
// *Cause:  The name of the alias to be advertised was not valid. The name may
//          have no domain or be qualified with the name of subdomain serviced
//          by GNS.
// *Action: Specify a correct alias.
/
00151, 00000, "Host domain \"%s\" does not match GNS subdomain \"%s\""
// *Cause:  The domain specified for the host does not specify the subdomain
//          served by GNS.
// *Action: Either specify the correct domain or just specify the name of the
//          houst.
/
00152, 00000, "Self-check failed."
// *Cause:  The self-check performed by GNS at initialization time failed.
// *Action: Check the accompanying exceptions and the log and trace files for
//          details as to why it failed. Also verify that DNS has been
//          configured so that it contains a "forwarders" clause which
//          contains the domain used by GNS and the IP address on which the
//          GNS server is listening.
/
00153, 00000, "Subdomain \"%s\" is longer than the maximum: %s."
// *Cause:  The name specified for the subdomain to be served by GNS is longer
//          than the maximum.
// *Action: Specify a shorter subdomain name.
/
00154, 00000, "Invalid subdomain: \"%s\""
// *Cause:  The name of the subdomain does not conform to Internet
//          standards. It must meet the following requirments:
//          1. Only alphanumeric characters, periods are hyphens are allowed;
//          2. It must start and end with an alphanumeric character;
//          3. Consecutive periods are not allowed.
// *Action: Specify a subdomain in the correct format.
/
00155, 00000, "trace level %u is less than the minimum %u - ignoring."
// *Cause:  The trace level specified is lower than the minimum supported.
// *Action: Specify a valid trace level.
/
00156, 00000, "trace level %u is greater than the maximum %u. Using the maximum value instead."
// *Cause:  The trace level specified is greater than the maximum supported.
// *Action: Specify a valid trace level.
/
00157, 00000, "Server state: %s"
// *Document: NO
// *Cause:  
// *Action:  
/
00158, 00000, "Initialization or shut down in progress."
// *Cause:  GNS was unable to process a command because it is either starting
//          up or shutting down.
// *Action: If the server is starting up, try the command again in a few
//          seconds. The server is shutting down, try the command again after
//          the server has restarted.
/
00159, 00000, "Port used for multicast communication: %d."
// *Document: NO
// *Cause:  
// *Action: 
/
00160, 00000, "Port used for communication with the DNS server: %d."
// *Document: NO
// *Cause:  
// *Action: 
/
00161, 00000, "Failed to set GNS trace level: %s."
// *Cause: The call to set the trace level on the GNS server failed.
// *Action: Examine the accompanying error message for details.
/
00162, 00000, "Name \"%s\" and address \"%s\" will not be advertised due to configuration change."
// *Cause:  When GNS attempted to advertise a name and address upon re-start,
//          it failed because the address can no longer be serviced. This can
//          happen if the subnet used by GNS was changed between the time that
//          GNS was stopped and it was started.
// *Action: If this result was expected, the error can be ignored. Otherwise,
//          the subnet needs to be changed in OCR and GNS needs to be stopped
//          and re-started.
/
00163, 00000, "connection with Cluster Synchronization Services failed. Error: %u.\n"
// *Cause:  GNS was unable to contact Cluster Synchronization Services in order
//          to retrieve the name of the cluster.
// *Action: This error is most probably caused by the Cluster Synchronization
//          Services daemon being down. If the daemon is running, contact
//          Oracle Customer Support and provide them with the error code.
/
00164, 00000, "Failed to retrieve cluster name: Error: %u."
// *Cause:  GNS was unable to get the name of the cluster from Cluster
//          Synchronization Services.
// *Action: This error is most probably caused by the Cluster Synchronization
//          Services daemon being down. If the daemon is running, contact
//          Oracle Customer Support and provide them with the error code.
/
00165, 00000, "Running as user \"%s\" which is not privileged."
// *Cause:  GNS is not running as a privileged user e.g. root.
// *Action: Start GNS as a privileged user.
/
00166, 00000, "Creation of OCR key \"%s\" failed.\n  %s"
// *Cause: GNS was unable to create the specified OCR key.
// *Action: Examine the accompanying error for details about what occurred.
//          This error may be caused by mis-configuration.
/
00167, 00000, "Operation is unsupported."
// *Cause:  An operation was attempted which is not currently supported by GNS.
// *Action: Do not attempt the operation.
/
00168, 00000, "Name advertisement or alias re-creation failed."
// *Cause:  When GNS starts, it re-creates the advertisements and aliases that
//          existed when it was shut down. The attempt to re-create an
//          advertisement or alias failed.
// *Action: This error should not occur in normal use. Contact Oracle Customer
//          Support.
/
00169, 00000, "Spawn of thread \"%s\" failed."
// *Cause:  GNS was unable to spawn a thread. This may be due to low system
//          resources.
// *Action: If the memory or processes in use on the system are too high,
//          reduce one or both and restart GNS. If this is not the case,
//          contact Oracle Customer Support.
/
00170, 00000, "Thread \"%s\" failed on startup."
// *Cause: A GNS thread failed when it tried to start.
// *Action: Examine the alert log and and trace file (if any) for details about
//          the error.
/
00171, 00000, "Invalid alias \"%s\" specified for name \"%s\""
// *Cause:  The name of the alias to be advertised was not valid. The name must
//          have no domain or be qualified with the name of subdomain serviced
//          by GNS.
// *Action: Specify an alias whose name is in the correct format.
/
00172, 00000, "Domain given in alias \"%s\" for name \"%s\" does not match GNS domain \"%s\"."
// *Cause:  The  domain specified for an alias does not match the domain
//          serviced by GNS.
// *Action: Either specify the correct domain or do not specify a domain and
//          GNS will use its domain as the default.
/
00173, 00000, "GNS has not been configured."
// *Cause:  An operation on GNS failed because GNS has not configured.
// *Action: Configure GNS and retry the operation.
/
00174, 00000, "Packet replay detected - dropping connection."
// *Cause:  GNS received a duplicate packet from a client. The connection was
//          dropped as a consequence.
// *Action: Examine the trace file for details. It is possible that a malicious
//          user is attempting to send an invalid packet to GNS.
/
00175, 00000, "Invalid packet received - dropping connection."
// *Cause:  The packet was ignored by the server because it was invalid. This
//          may be caused by another process sending malformed packets. This
//          error is usually accompanied by another error which describes the
//          exact error that occurred.
// *Action: Use system tools to determine if a non-GNS process is sending data
//          to the server.
/
00176, 00000, "Packet security check failed."
// *Cause:  The check of the security attributes of a packet failed.
// *Action: Check the trace file for details about the failure. It is possible
//          that a malicious user is attempting to send an invalid packet to
//          GNS.
/
00177, 00000, "Invalid packet type received."
// *Cause:  GNS received a packet whose type is unknown.
// *Action: Check the trace file for details about the failure. It is possible
//          that a malicious user is attempting to send an invalid packet to
//          GNS.
/
00178, 00000, "Resolution of name \"%s\" failed."
// *Cause: GNS failed to retrieve the address of the specified name.
// *Action: Check to make sure that an address for the name has been registered
//          with GNS. If it is configured, check to make sure that DNS has been
//          properly configured.
/
00179, 00000, "No forwarded query received from DNS for name in \"%s\" domain, check DNS configuration"
// *Cause:  A query was not forwarded from DNS to GNS for a name in the
//          subdomain that it services.
// *Action: Check the configuration of DNS. Make sure that it contains the
//          required forwarding directive contained in the following message.
/
/
00180, 00000, "If BIND is being used, the entry will likely look like the following:"
// *Cause:  This message is displayed when the GNS self-check fails.
// *Action: Ensure that the configuration of DNS has the entry listed in the
//          message that follows this one.
/
/
00181, 00000, "zone %s { type forward; forward only; forwarders { %s port %d; }; };"
// *Document: NO
// *Cause:
// *Action: Entry that needs to exists in DNS for GNS.
/
00182, 00000, "Unable to resolve self-check name \"%s\" to address \"%s\"."
// *Cause:    This is an informational message which accompanies other messages
//            describing a self-check failure.
// *Action:   No action is required.
/
/
00183, 00000, "Number of retries exceeded maximum: %u."
// *Cause:  An operation failed after the maximum number of retries.
// *Action: Examine the accompanying message(s) for the reasons to why this
//          error occurred.
/
00184, 00000, "Operation has to be retried."
// *Cause:  An operation failed because it could not be performed at this time
//          and should be tried again later`.
// *Action: Examine the accompanying message(s) for details about the operation
//          that was performed.
/
00185, 00000, "Invalid argument."
// *Cause:  An argument was passed to a function which was incorrect. In the
//          case of a string, for example, a string will be invalid if it is
//          null or has a zero length.
// *Action: Supply a valid argument.
/
00186, 00000, "Insufficient privileges."
// *Cause: The user attempted an operation for which he or she does not have
//          sufficient privileges.
// *Action: Either have the system administrator grant the needed privileges or
//          re-try the operation as a user which has the needed privileges.
/
32767, 00000, "Internal error."
// *Cause:  An unexpected error occurred.
// *Action: Examine the message(s) that accompany this one for details about
//          the error and contact Oracle Customer Support.
/
