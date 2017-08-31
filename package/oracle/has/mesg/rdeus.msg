/ Copyright (c) Oracle 2005, 2006, 2008.  All Rights Reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   rdus.msg
/ DESCRIPTION
/   Message file for Resource Discovery
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   rwessman     12/11/08  - Fixed typo.
/   rwessman     08/07/08  - Added message #68 as part of the fix for bug
/                            6912272.
/   rwessman     06/12/08  - Incorporated review comments from bmanry.
/   rwessman     10/25/07  - Added "wrapper" errors to improve diagnosability.
/   rwessman     10/18/07  - Added Apple message indicating that the responder
/                            is not running.
/   rwessman     10/11/07  - Changed messages to not use lengths in string
/                            specifiers so that CLSK can be used to format
/                            messages.
/   rwessman     10/11/07  - Changed message 51 to be generic.
/   rwessman     06/13/07  - Added "no providers available.
/   rwessman     10/12/06  - Added message 53.
/   rwessman     10/12/06  - Added message 52.
/   rwessman     09/07/06  - Added message 51.
/   rwessman     08/30/06  - Added unavailable providers message.
/   rwessman     04/24/06  - Added message 49.
/   rwessman     04/21/06  - Added message 48.
/   rwessman     04/10/06  - Added message 47. 
/   rwessman     04/07/06  - Added error for a generic address that does not 
/                            have a port. 
/   rwessman     04/06/06  - Fixed a couple of messages to be more accurate. 
/   rwessman     03/19/06  - Added parsing errors. 
/   rwessman     03/15/06  - Made Apple invalid protocol error generic. 
/   rwessman     03/09/06  - Added parsing errors. 
/   rwessman     12/30/05  - Added yes/no pseudo-messages for parameter 
/                            validation. 
/   rwessman     11/21/05  - Added "no protocol" error for the Apple provider. 
/   rwessman     11/17/05  - Added generic message for "service type too long" 
/                            and Apple message "invalid service type. 
/   rwessman     11/10/05  - Added message for a bad domain. 
/   rwessman     10/31/05  - Added generic internal error and out of memory 
/                            errors. 
/   rwessman     09/21/05  - Added an error for interrupted operations. 
/   rwessman     09/15/05  - Added specific parsing errors. 
/   rwessman     09/01/05  - Added a error that indicates that no server was 
/                            found. 
/   rwessman     08/23/05  - Improved error reporting by using specific error 
/                            messages for different parsing errors. 
/   rwessman     08/18/05  - Added SLP provider errors. 
/   rwessman     07/18/05  - rwessman_rd1
/   rwessman     07/11/05  - Created
/
00000, 0, "no error"
// *Cause:  Operation was successful.
// *Action: No action needed.
00001, 0, "unspecified error"
// *Cause:  An unknown error occurred. This is an internal error.
// *Action: Contact Oracle Customer Support and provide details about how and
//          when the error occurred.
00002, 0, "provider busy"
// *Cause:  The provider is processing a request.
// *Action: This is not an error.
00003, 0, "no value found for service tag %s."
// *Cause:  A value was not found for the given service tag.
// *Action: This is normally not an error.
00004, 0, "operation timeout"
// *Cause:  A FIND or REGISTER operation timed out.
// *Action: For a FIND operation, this is only an error if the find was
//          expected to successfully locate a service.
00005, 0, "invalid universe: \"%s\""
// *Cause:  An unknown universe was specified for the address.
// *Action: Specify a valid universe.
00006, 0, "invalid protocol: \"%s\""
// *Cause:  An invalid protocol was specified in an address.
// *Action: Specify a valid protocol.
00007, 0, "invalid parameter: %s"
// *Cause:  An error occurred while parsing an address.
// *Action: Specify a correct address.
// 00008, 0, "reserved for future use"
// *Cause:  
// *Action: 
00009, 0, "data too large for buffer. Buffer length: %u. Required: %u.\n"
// *Cause:  This error is for internal use only and should not normally be seen
//          by users.
// *Action: Contact Oracle Customer Support.
00010, 0, "not found"
// *Cause:  A value was not found in a list.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
00011, 0, "invalid type: %u"
// *Cause:  The type given for a piece of data was invalid.
//
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
00012, 0, "no list name specified."
// *Cause:  A name was not given for a list.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
00013, 0, "name busy."
// *Cause:  This is an internal error. 
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
00014, 0, "operation was interrupted."
// *Cause:  An operation was interrupted.
// *Action: None. This normally is not an error.
00015, 0, "load of provider library failed."
// *Cause:  The load of a library which implements the interface for a provider
//          failed.
// *Action: Enable tracing to determine the exact error that occurred.
00016, 0, "no provider libraries found."
// *Cause:  It was not possible to locate any provider libraries.
// *Action: Make sure that the provider libraries have been installed.
00017, 0, "provider error."
// *Cause:  A provider generated an error.
// *Action: If errors follow, examine them to determine the exact error.
//          Otherwise, enable tracing to determine the exact error.
00018, 0, "regular expression compilation failed. Pattern \"%s\" Error: %u.\n"
// *Cause:  The creation of a pattern for use in a comparison failed.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
00019, 0, "pattern match failed. String: \"%s\" Pattern: \"%s\" Error: %d.\n"
// *Cause:  A comparison against a regular expression failed.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
00020, 0, "no host name or IP address."
// *Cause:  An address must contain either the name of the server or its IP
//          address.
// *Action: Specify a host name or an IP address in the address.
00021, 0, "no providers found for universe \"%s\"."
// *Cause:  A provider was not found for the specified universe.
// *Action: Either specify a different universe or obtain a provider library
//          for that universe. Examine the errors that follow (if any) for
//          more information.
00022, 0, "property not found."
// *Cause:  A provider property was not found.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
00023, 0, "provider not found. Universe \"%s\"."
// *Cause:  A provider was not found for the specified universe.
// *Action: Either specify a different universe or obtain a provider library
//          for that universe.
00024, 0, "address invalid"
// *Cause:  The address is not in the correct format.
// *Action: Specify an address in the correct format. The syntax is described
//          in rd.h.
00025, 0, "service type not specified."
// *Cause:  The service type is not specified in the address.
// *Action: Specify an address with the service type.
00026, 0, "expected delimiter not found. Expected: \"%s\" Found: \"%s\""
// *Cause:  The delimiter expected in the address was not found.
// *Action: Correct the address so that the delimiter is present.
00027, 0, "port number not found."
// *Cause:  When a colon (":") follows the host name, it must be followed by
//          a port number.
// *Action: Specify a port number.
00028, 0, "initialization failed."
// *Cause:  Initialization of RD failed.
// *Action: Examine the errors that follow this one to determine the problem
//          that is causing the error.
00029, 0, "no server found."
// *Cause:  No server for the specified provider could be found to perform the
//          desired operation.
// *Action: Start a server for the desired provider or use a different
//          provider.
00030, 0, "memory allocation failure"
// *Cause:  An operation failed because it was not possible to allocate enough
//          process memory.
// *Action: If memory is low on the system, terminate other processes and/or
//          threads and try the operation again. Otherwise, this is an internal
//          error and Oracle Customer Support should be contacted.
00031, 0, "invalid domain: %d."
// *Cause:  The application specified an invalid number for the domain.
// *Action: Specify a correct domain. See rd.h for the allowed values.
00032, 0, "length of service type \"%s\" (%d) is greater than than the maximum allowed: %d"
// *Cause:  The user specified a service type which is longer than that
//          permitted by the provider.
// *Action: Use a shorter service type.
00033, 0, "no universe specified."
// *Cause:  The user did not specify a universe in the address.
// *Action: Specify a universe.
00034, 00000, "address not registered: \"%s\""
// *Cause:  The application attempted to use an address which does not exist.
// *Action: Specify a registered address.
00035, 00000, "yes"
// *Document: NO
// This is not an error message. It is a value used in validating boolean
// values.
00036, 00000, "no"
// *Document: NO
// This is not an error message. It is a value used in validating boolean
// values.
00037, 00000, "invalid service instance tag: %u"
// *Cause:  The value for a service instance tag was incorrect.
// *Action: Specify a valid tag. They are listed in rd.h.
/
00038, 0, "invalid protocol type: \"%s\" Valid protocols: %s"
// *Cause:  The user specified a protocol which is not supported by the
//          provider.
// *Action: Specify a valid protocol. The protocol must be at least one
//          character which is not a period (".").
/
00039, 00000, "invalid host name: \"%s\""
// *Cause:  The name of the host specified was not in the correct
//          format.
// *Action: Use the correct host name format. The host name must be one of the
//          following:
//          1. The name of the machine;
//          2. A valid IPv4 address (N.N.N.N);
//          3. A valid IPv6 address (N[:N]*).
/
00040, 00000, "invalid search domain: \"%s\""
// *Cause:  The name of the domain searched by the service was not in
//          the correct format.
// *Action: Use the correct domain name format. A domain is a series of one or
//          more alphanumeric characters.
/
00041, 00000, "no protocol or domain specified."
// *Cause: The service name was followed by a period separator, but no
//         protocol or domain was found after it.
// *Action: Specify a valid protocol and/or domain.
/
00042, 00000, "invalid port number: \"%s\""
// *Cause: The port specified in the service address was not valid. A
//          port number may only be a positive decimal number.
// *Action: Specifiy a valid port number.
/
00043, 00000, "no search domain specified."
// *Cause: No search domain followed the period separator.
// *Action: Specify a valid search domain.
/
/
00044, 00000, "no protocol specified."
// *Cause: No protocol was specified for the service.
// *Action: Specify a valid protocol.
/
00045, 00000, "port number required to register with a generic address."
// *Cause: Because of the requirements of some providers, the port
//         number must be specified when registering using a generic address.
// *Action: Specify a port number.
00046, 00000, "invalid attribute"
// *Cause: An attribute was specified using an incorrect format.
// *Action: An attribute should be specified using the following format:
//          "name=value[, name1=value1 ...]"
/
00047, 00000, "no name specified for attribute."
// *Cause: A value was given for an attribute but no name was
//          specified.
// *Action: Specify a name for the attribute.
/
00048, 00000, "no attribute specified."
// *Cause: An attribute was not found in the address where it was expected.
// *Action: Specify a valid attribute. An attribute is composed of a
//          name followed by an equals sign ("=") and then by an
//          optional value. The name and value may both contain
//          spaces.
/
00049, 00000, "expected separator not found. Expected: \"%s\" Found: \"%s\""
// *Cause: The separator expected to be present between the mandatory and
//         optional sections of the address was not found.
// *Action: Specify the separator.
/
00050, 00000, "provider initialization for universe \"%s\" failed."
// *Cause:  The operation failed because providers could not be initialized
//          for the specified universe.
// *Action: The message(s) that follow describe the errors encountered
//          by the providers.
/
00051, 00000, "provider \"%s\" error."
// *Cause: The specified provider failed to perform an operation.
// *Action: The message(s) that follow describe the errors encountered
//          by the provider.
/
00052, 00000, "invalid numeric value specified: \"%s\"."
// *Cause:  The value specified as a number was not valid.
// *Action: Specify a valid number.
/
00053, 00000, "invalid or null service instance."
// *Cause:  The service instance used for an operation is either
//          invalid or null.
// *Action: Specify a valid service instance.
/
00054, 00000, "invalid operation: %u.\n"
// *Cause:  The operation specified was not valid.
// *Action: Specify a valid operation.
/
00055, 00000, "no providers available."
// *Cause:  No providers were available for an operation. This may be caused by
//          the failure of a process or service needed by the provider (e.g.
//          the mDNS service).
// *Action: Examine the trace and log files for details. Ensure that the
//          process or service required by the process is running.
/
00056, 00000, "registration of service instance \"%s\" failed."
// *Cause:  The registration of the specified service instance failed.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00057, 00000, "unregistration of service instance \"%s\" failed."
// *Cause:  The deletion of the registration of the specified service instance
//          failed.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00058, 00000, "confirmation of service instance \"%s\" failed."
// *Cause:  The confirmation of the specified service instance failed.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00059, 00000, "location of service types \"%s\" failed."
// *Cause:  It was not possible to retrieve types of services supported by
//          Resource Discovery.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00060, 00000, "service instance \"%s\"  was not found."
// *Cause:  The location of the specified service.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00061, 00000, "retrieval of details about service instance \"%s\" failed."
// *Cause:  It was not possible to get details about the specified service
//          instance.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00062, 00000, "termination failed."
// *Cause:  The call to terminate the use of Resource Discovery failed.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00063, 00000, "operation failed."
// *Cause:  A FIND or REGISTER operation failed.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00064, 00000, "retrieval of a provider for universe \"%s\" failed."
// *Cause:  It was not possible to retrieve a provider descriptor for the
//          specified universe.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00065, 00000, "creation of service instance failed."
// *Cause:  An error occurred while trying to assemble a service instance using
//          components.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00066, 00000, "parsing of service instance \"%s\" failed."
// *Cause:  An error occurred while trying to parse the specified address.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00067, 00000, "location of domain failed."
// *Cause:  An error occurred while trying to locate domains of the specified
//          type.
// *Action: Examine the errors that follow for more information about the
//          error.
/
00068, 00000, "length of universe component \"%s\" (%u) is longer than the maximum: %u."
// *Cause:  The string specified for the universe-specific portion of the
//          service instance is longer than the maximum allowed by the
//          provider.
// *Action: Specify a universe component which is shorter than the maximum.
//          If this error occurs when no universe-specific portion was
//          specified, the provider may have used the service type for the
//          universe-specific component. In that case, make sure that the
//          length of the service type does not exceed the maximum.
/

01999, 0, "internal error"
// *Cause:  RD failed due to some unforeseen reason.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
/

// 2000-3999 Apple provider errors
02000, 0, "invalid service type: \"%s\""
// *Cause:  The user specified a service type which does not conform to the
//          standard specifed by RFC's 1034 and RFC 1123. The service type must
//          be one or more characters and must start and end with a letter or
//          digit. The interior characters may be letters, digits, or hyphens. 
// *Action: Specify a service type which conforms to the RFC.
/
02001, 00000, "failed to connect to the mDNS responder."
// *Cause:  The provider was unable to make a connection with the mDNS
//          responder.
// *Action: Check to ensure that the responder is running. If it is, this is an
//          internal error and Oracle Customer Support should be contacted.
/

// 4000-5999 Embedded Apple provider errors
04000, 0, "client waiting"
// *Cause:  The client uses this error to signal to the server that it is
//          waiting for query results.
// *Action: This error is used for signalling between the client and the DNS
//          server. It should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support
04001, 0, "no error"
// *Cause:  Operation was successful.
// *Action: No action needed.
04002, 0, "unknown error has occurred"
// *Cause:  an unknown error has occurred.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04003, 0, "no such name"
// *Cause:  a record could not be found with the given name.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04004, 0, "memory allocation failed"
// *Cause:  An operation failed because it was not possible to allocate enough
//          process memory.
// *Action: If memory is low on the system, terminate other processes and/or
//          threads and try the operation again. Otherwise, this is an internal
//          error and Oracle Customer Support should be contacted.
04005, 0, "invalid parameter"
// *Cause:  a record contained an illegal or non-existing value.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04006, 0, "invalid reference"
// *Cause:  An unknown DNS record was found.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04007, 0, "invalid state"
// *Cause:  This is an internal error.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04008, 0, "invalid flags"
// *Cause:  This is an internal error.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04009, 0, "unsupported operation"
// *Cause:  The provider interface attempted to perform an operation which is
//          not supported by the provider. 
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04010, 0, "not initialized"
// *Cause:  This is an internal error.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04011, 0, "no cache allocated"
// *Cause:  a DNS query failed because no cache was allocated.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04012, 0, "service already registered"
// *Cause:  The user attempted to register a service that was already
//          registered.
// *Action: A service should only be registered once.
04013, 0, "service name conflict"
// *Cause:  The user attempted to register a service whose name already exists.
// *Action: A service should only be registered once.
04014, 0, "invalid record entry"
// *Cause:  The provider interface attempted to perform an operation whose
//          record contained invalid or non-existent data.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04015, 0, "client software incompatible with server"
// *Cause:  The version of the client software used by the provider interface
//          is not compatible with the version of the server software. 
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04016, 0, "invalid interface"
// *Cause:  The provider interface attempted to use an unknown interface.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04017, 0, "cache size must be increased"
// *Cause:  The size of the cache maintained by the provider interface must
//          be increased.
// *Action: This error is used as a status indicator. It should not be visible
//          to the user. If it occurs, please contact Oracle Customer Support.
04018, 0, "configuration changed"
// *Cause:  The server configuration changed during an operation.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
04019, 0, "client should free resources"
// *Cause:  This error is used as an internal status indicator and should not
//          be visible outside of the provider.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.

// 6000-7999 SLP provider errors
06000, 0, "no more data"
// *Cause:  This error is used internally to signal that there is no more data
//          to be passed by the SLP provider.
// *Action: This error is normal - no action is required.
06001, 0, "no error"
// *Cause:  Operation was successful.
// *Action: This error is normal - no action is required.
06002, 0, "language not supported"
// *Cause:  No service could be found that supports the language required.
// *Action: A service will have to be added or modified which supports the
//          requested language.
06003, 0, "parse error"
// *Cause:  The SLP message rejected by a remote SLP agent.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06004, 0, "invalid registration"
// *Cause:  The SLP provider attempted to register a URL which is malformed.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06005, 0, "scope not supported"
// *Cause:  This is an internal error.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06006, 0, "authenticator not provided"
// *Cause:  The SLP provider failed to authenticate itself.  
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06007, 0, "authentication failed"
// *Cause:  The SLP provider failed to authenticate itself.  
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06008, 0, "invalid update"
// *Cause:  An update for a non-existing registration was issued, or the update
//          includes a service type or scope different than that in the initial
//          registration, etc.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06009, 0, "refresh rejected"
// *Cause:  Attempts were made to refresh a registration more frequently than
//          the minimum refresh interval.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06010, 0, "feature unimplemented"
// *Cause:  An unimplemented feature was used.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06011, 0, "buffer overflow"
// *Cause:  An outgoing request overflowed the maximum network MTU size. 
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06012, 0, "network timed out"
// *Cause:  An reply to an SLP request did not arrive in the configured timeout
//          interval.
// *Action: Check the network connection and retry the request.
06013, 0, "network initialization failure"
// *Cause:  The network failed to initialize properly.
// *Action: Check the network connection and retry the request.
06014, 0, "memory allocation failed"
// *Cause:  The SLP provider was unable to allocate enough process memory.
// *Action: If memory is low on the system, terminate other processes and/or
//          threads and try the operation again. Otherwise, this is an internal
//          error and Oracle Customer Support should be contacted.
06015, 0, "invalid parameter"
// *Cause:  The provider attempted to pass an invalid parameter.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06016, 0, "network error"
// *Cause:  The network failed to initialize properly.
// *Action: Check the network connection and retry the request.
06017, 0, "internal system error"
// *Cause:  The SLP subsystem failed for unknown reasons.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06018, 0, "handle in use"
// *Cause:  The SLP provider attempted to recursively use a handle.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06019, 0, "generic error"
// *Cause:  The provider failed for unknown reasons.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
06020, 0, "unicast query must be sent."
// *Cause:  The provider must send a unicast query.
// *Action: This error should not be visible to the user. If it occurs, please
//          contact Oracle Customer Support.
