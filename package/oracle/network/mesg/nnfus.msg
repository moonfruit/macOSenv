/ Copyright (c) 1993, 1997, 1998 by the Oracle Corporation.  All rights reserved.
/
/ $Header: nnfus.msg 28-apr-98.13:00:26 cekberg Exp $
/
/ NAME     
/   nnfus.msg
/
/ FUNCTION 
/   Network Naming Foreign US error message file
/
/ NOTES
/       Message text should be limited to a maximum of 76 characters.
/	Messages containing embedded % directives should not overrun
/	the 76 character limit unless they signal unusual errors
/	which do not occur as part of user applications.  For example,
/	startup errors and system-dependent errors can probably get
/	away with longer message text.
/
/ MODIFIED
/    cekberg    04/28/98 - add 'set authinfo'
/    cekberg    04/13/98 - add messages for new error codes
/    cekberg    03/09/98 - make global_dbname optional
/    cekberg    03/06/98 - new strings for tnnfg
/    eminer     03/18/97 - cleanup as per Sandy's review
/
/   $Log:  $
/    Revision 1.13  1995/04/03  16:58:34  slau
/    changed netman to Network Manager
/
/    Revision 1.12  1995/03/31  01:25:57  smckinle
/    Removed TBD's.
/
/    Revision 1.11  1994/09/12  19:07:56  mkanaley
/    add error code NNF 540 if inserting name that already exists
/
/    Revision 1.10  1994/09/09  22:45:42  ogeest
/    Added messages for tns2nis conversion
/
/    Revision 1.9  1994/06/21  15:00:47  dmorriso
/    Added BIND/DNS error messages
/
/    Revision 1.8  1994/05/22  11:24:32  dmorriso
/    Added tnnfg help text.
/    Added NIS adapter error messages
/
/
/   drmorris    07/22/93     Creation
/
00000, 00000, "normal, successful completion"
/
/
/ Reserve error blocks here...
/ ============================
/
/ NNF  (generic)          errors        1 - 99
/ NNFG (generic component) errors     100 - 999
/ NNFD (DCE component)    errors     1000 - 1999
/  XDS errors                        1100 - 1199
/  XOM errors                        1200 - 1200
/ NNF NIS adapter errors             2000 - 2999
/ NNFB (BIND/DNS component)          3000 - 3999
/ NNF conversion tool                4000 - 4999
/
/ List error messages in (numerical) ascending order here.
/ Precede each block of errors with a comment.
/ ========================================================
/
/
/ NNFG (generic)          errors        1 - 99
/
00001, 00000, "Not a TNS address"
// *Cause: While asking to read an address the name service returned
// a record which was not an address.
// *Action: Not normally visible to the user.  For further details, turn on
// tracing and re-execute the failing operation.  If the error persists, 
// contact Worldwide Customer Support.
/
00002, 00000, "Invalid value passed to function call"
// *Cause: An invalid value was passed to an interface function.
// *Action: Not normally visible to the user.  For further details, turn on
// tracing and re-execute the failing operation.  If the error persists, 
// contact Worldwide Customer Support.
/
00003, 00000, "Naming adapter %s does not exist"
// *Cause: The requested name service adapter was not found in the
// current adapter table.
// *Action: Check the spelling of the adapter reqested.  Verify that the
// adapter runs on this platform, and the adapter is compiled into the
// adapter table linked into the executable.
/
00004, 00000, "Operation not supported in %s"
// *Cause: The operation requested is not supported under this adapter.
// *Action: Verify that the operation being performed is not under
// restriction, such as writing to read-only name service.  For further
// details, turn on tracing and re-execute the failing operation.  
// If the error persists, contact Worldwide Customer Support.
/
00005, 00000, "Functionality not implemented"
// *Cause: The operation requested is not supported in this implementation.
// *Action: If this is retrieved from a production release, contact
// Worldwide Customer Support.  Otherwise, check the release notes as to
// the restrictions in this release.
/
/ return values for 8.1+ API NNFG adapters (NNFL)
/
00100, 00000, "memory allocation failed"
00101, 00000, "could not connect to directory"
00102, 00000, "initialization failed"
00103, 00000, "not initialized" 
00104, 00000, "authorization failed"
00105, 00000, "operation timed out"
00106, 00000, "no entries found"
00107, 00000, "buffer too small"
00108, 00000, "permission denied"
00109, 00000, "attribute does not exist"
00110, 00000, "no values exist"
/
/
/ 500 - 599 - test component
/
/ The following messages are hints displayed in response to a control program
/ user typing "HELP <command>".  They are intended to describe what the 
/ command in question does.
/
// *Cause:  Test program help text.
// *Action: None.
/
00501, 00000, "Shows or sets the current native naming adapter"
00502, 00000, "Display the information retrieved by the last query"
00503, 00000, "Shows or sets internal buffer sizes"
00504, 00000, "Shows or sets the control flags for name service operations"
00505, 00000, "Shows or sets the current data used for the next modify operation"
00506, 00000, "Loads the addresses found in a TNSNAMES.ORA file into DCE CDS"
00507, 00000, "Deletes a name and all its attributes"
00508, 00000, "Shows or sets the current default domain"
00509, 00000, "Loads addresses found in the given file into the current adapter"
00510, 00000, "Modifies the contents of a name"
00511, 00000, "Retrieves addresses associated with a name via the directory path"
00512, 00000, "Qualifies an unqualified name as per the current adapter"
00513, 00000, "Queries a name with the current adapter"
00514, 00000, "Exits the program"
00515, 00000, "Rename a name with the current adapter"
00516, 00000, "Shows or sets the replace data used for the next modify operation"
00517, 00000, "Verify that a name is valid with the current adapter"

00518, 00000, "Shows or sets the search path used by show_entry"
00519, 00000, "Show the contents of an entry (address, profile, etc.).  For 8.1+ NNFG API.\nUsage: show_entry <name> <type>"
00520, 00000, "Update entry (address, profile, etc.). For 8.1+ NNFG API.\nUsage: update_entry <name> <c,a,r,d> [type] {<attr> <value>}"
00521, 00000, "Shows or sets the authentication info.\nUsage: set authinfo <type> {[param]}"

00531, 00000, "Shows or sets internal address buffer size"
00532, 00000, "Shows or sets internal name buffer size"
00533, 00000, "Shows or sets internal cname buffer size"
/ The following messages are error codes that the control program will display
00540, 00000, "Failed to insert name: %s"
// *Cause: Failed to insert name into the native service.
// *Action: Verify that the name is not already in the native namespace and
// the appropriate access permissions are set for the namespace.
/
/ NNFD (DCE component)    errors     1000 - 1999
/
01001, 00000, "ds_initialize: workspace initialization failed"
// *Cause: The DCE workspace as setup by ds_initialize() failed to
// initialize.
// *Action: Verify that conditions necessary for a successful
// ds_initialize() call are present on this platform (e.g is there
// enough memory?).  Check that there is not another workspace user in
// this program.  For further details, turn on tracing and re-execute
// the failing operation.  If the error persists, contact Worldwide
// Customer Support. 
/
01002, 00000, "DCE could not open configuration file"
// *Cause: A DCE call returned an error that it could not access its
// configuration file.
// *Action: Check that the DCE configuration file for this platform is
// present, and accessable.  On Unix this file is dce_cf.db.  Check if a
// simple call to dce_cf_get_cell_name() succeeds.
/
01003, 00000, "DCE could not find cell name"
// *Cause: A DCE call returned an error that it could not find the cell
// name in its configuration file.
// *Action: Check that this machine has been configured for a DCE cell.
// Chcek that the DCE configuration file is not corrupted.  On Unix,
// this file is dce_cf.db.  Check if a simple call to
// dce_cf_get_cell_name() succeeds. 
/
01004, 00000, "DCE returned unspecified error %s"
// *Cause: A DCE call returned an status that was not in this
// implementation's list of possible status values for this DCE call.
// *Action: Verify that this platform's DCE release is not beyond those
// supported by this Oracle application.  If the error persists, contact
// Worldwide Customer Support.  
/
01005, 00000, "Internal XOM class violation"
// *Cause: A DCE XOM call returned statuses inconsistent with the class
// definitions in the DCE documentation.
// *Action: Not normally visible to the user.  For further details, turn on
// tracing and re-execute the failing operation.  If the error persists, 
// contact Worldwide Customer Support.
/
01006, 00000, "Attribute %s not available"
// *Cause: A insertion call attempted to use an attribute which did not
// have a translation to a DCE attribute.
// *Action: Use another attribute, or insert the translation into DCE.
/
01007, 00000, "DCE long strings are not supported"
// *Cause: A query returned a object which has a XOM OM_S_LONG_STRING.
// The current implementation does not support such objects.
// *Action: For further details, turn on tracing and re-execute
// the failing operation.  If the error persists, contact Worldwide
// Customer Support. 
/
01008, 00000, "XDS attribute syntax %s incorrect for Oracle Names syntax %s"
// *Cause: The syntax as specified in the XDS object is different than
// that which is expected for the given Oracle names syntax.
// *Action: For further details, turn on tracing and re-execute
// the failing operation.  If the error persists, contact Worldwide
// Customer Support.
/
01009, 00000, "Unknown DCE class"
01010, 00000, "DCE problem code %d does not match XDS class %s"
01011, 00000, "DCE reported OS error"
01012, 00000, "DCE generic security failure"
/
/
01100, 00000, "DS_C_COMMUNICATIONS_ERROR"
01101, 00000, "DS_C_LIBRARY_ERROR"
01102, 00000, "DS_C_NAME_ERROR (matched %s)"
01103, 00000, "DS_C_SECURITY_ERROR"
01104, 00000, "DS_C_SERVICE_ERROR"
01105, 00000, "DS_C_SYSTEM_ERROR"
01106, 00000, "DS_C_UPDATE_ERROR"
01107, 00000, "DS_C_ATTRIBUTE_PROBLEM"
01108, 00000, "DS_C_ABANDON_FAILED"
01109, 00000, "DS_C_ATTRIBUTE_ERROR (object name %s)"
01110, 00000, "Class unknown"
/
/
/  XDS errors                        1100 - 1199
/
01500, 00000, "Normal, successful xds call"
01501, 00000, "ADMIN_LIMIT_EXCEEDED"
01502, 00000, "AFFECTS_MULTIPLE_DSAS"
01503, 00000, "ALIAS_DEREFERENCING_PROBLEM"
01504, 00000, "ALIAS_PROBLEM"
01505, 00000, "ATTRIBUTE_OR_VALUE_EXISTS"
01506, 00000, "BAD_ARGUMENT"
01507, 00000, "BAD_CLASS"
01508, 00000, "BAD_CONTEXT"
01509, 00000, "BAD_NAME"
01510, 00000, "BAD_SESSION"
01511, 00000, "BAD_WORKSPACE"
01512, 00000, "BUSY"
01513, 00000, "CANNOT_ABANDON"
01514, 00000, "CHAINING_REQUIRED"
01515, 00000, "COMMUNICATIONS_PROBLEM"
01516, 00000, "CONSTRAINT_VIOLATION"
01517, 00000, "DIT_ERROR"
01518, 00000, "ENTRY_EXISTS"
01519, 00000, "INAPPROP_AUTHENTICATION"
01520, 00000, "INAPPROP_MATCHING"
01521, 00000, "INSUFFICIENT_ACCESS_RIGHTS"
01522, 00000, "INVALID_ATTRIBUTE_SYNTAX"
01523, 00000, "INVALID_ATTRIBUTE_VALUE"
01524, 00000, "INVALID_CREDENTIALS"
01525, 00000, "INVALID_REF"
01526, 00000, "INVALID_SIGNATURE"
01527, 00000, "LOOP_DETECTED"
01528, 00000, "MISCELLANEOUS"
01529, 00000, "MISSING_TYPE"
01530, 00000, "MIXED_SYNCHRONOUS"
01531, 00000, "NAMING_VIOLATION"
01532, 00000, "NO_INFO"
01533, 00000, "NO_SUCH_ATTRIBUTE_OR_VALUE"
01534, 00000, "NO_SUCH_OBJECT"
01535, 00000, "NO_SUCH_OPERATION"
01536, 00000, "NOT_ALLOWED_ON_NON_LEAF"
01537, 00000, "NOT_ALLOWED_ON_RDN"
01538, 00000, "NOT_SUPPORTED"
01539, 00000, "OBJECT_CLASS_MOD_PROHIB"
01540, 00000, "OBJECT_CLASS_VIOLATION"
01541, 00000, "OUT_OF_SCOPE"
01542, 00000, "PROTECTION_REQUIRED"
01543, 00000, "TIME_LIMIT_EXCEEDED"
01544, 00000, "TOO_LATE"
01545, 00000, "TOO_MANY_OPERATIONS"
01546, 00000, "TOO_MANY_SESSIONS"
01547, 00000, "UNABLE_TO_PROCEED"
01548, 00000, "UNAVAILABLE"
01549, 00000, "UNAVAILABLE_CRIT_EXT"
01550, 00000, "UNDEFINED_ATTRIBUTE_TYPE"
01551, 00000, "UNWILLING_TO_PERFORM"
01590, 00000, "XOM error while manipulating DS error object"
/
/  XOM errors                        1200 - 1299
/
01600, 00000, "Normal, successful xom call"
01601, 00000, "ENCODING_INVALID"
01602, 00000, "FUNCTION_DECLINED"
01603, 00000, "FUNCTION_INTERRUPTED"
01604, 00000, "MEMORY_INSUFFICIENT"
01605, 00000, "NETWORK_ERROR"
01606, 00000, "NO_SUCH_CLASS"
01607, 00000, "NO_SUCH_EXCLUSION"
01608, 00000, "NO_SUCH_MODIFICATION"
01609, 00000, "NO_SUCH_OBJECT"
01610, 00000, "NO_SUCH_RULES"
01611, 00000, "NO_SUCH_SYNTAX"
01612, 00000, "NO_SUCH_TYPE"
01613, 00000, "NO_SUCH_WORKSPACE"
01614, 00000, "NOT_AN_ENCODING"
01615, 00000, "NOT_CONCRETE"
01616, 00000, "NOT_PRESENT"
01617, 00000, "NOT_PRIVATE"
01618, 00000, "NOT_THE_SERVICES"
01619, 00000, "PERMANENT_ERROR"
01620, 00000, "POINTER_INVALID"
01621, 00000, "SYSTEM_ERROR"
01622, 00000, "TEMPORARY_ERROR"
01623, 00000, "TOO_MANY_VALUES"
01624, 00000, "VALUES_NOT_ADJACENT"
01625, 00000, "WRONG_VALUE_LENGTH"
01626, 00000, "WRONG_VALUE_MAKEUP"
01627, 00000, "WRONG_VALUE_NUMBER"
01628, 00000, "WRONG_VALUE_POSITION"
01629, 00000, "WRONG_VALUE_SYNTAX"
01630, 00000, "WRONG_VALUE_TYPE"
/
/ DCE test programs
/
01901, 00000, "Name parameter %s not found.  No name resolved."
/
/ NNFY (NIS/YP component)    errors     2000 - 2999
/
02001, 00000, "NIS client error string: %s"
// *Cause: A call to an NIS (YP) function failed.  This message contains
// the text of the NIS error code returned.
// *Action: Should only be visible when returned as part of another error.
// If the error persists, contact Worldwide Customer Support.
/
02002, 00000, "NIS value does not conform to adapter schema: %s"
// *Cause: The values in the maps used by the NIS adapter must conform
// to a specific set of internal formatting rules.  This value returned
// did not conform to those rules.
// *Action: Should not be visible, unless you are attempting to create
// your own maps.  If the error persists, contact Worldwide Customer
// Support. 
/
02003, 00000, "Unknown NIS error code: %s"
// *Cause: An error code returned by a NIS (YP) function was not in the
// list expected by this program.
// *Action: Verify that the error is generated by the YP functions on
// this platform.  Notify Worldwide Customer Support of the error.
/
02004, 00000, "NIS map %s does not exist"
// *Cause: The requested attribute does not exist.
// *Action: For an unused attribute, no action is required, as this is
// the expected error.  Otherwise, add the attribute and reload the NIS
// (YP) maps.
/
02005, 00000, "NIS key %s does not exist in map %s"
// *Cause: The requested name was not found.
// *Action: For an unused name, no action is required, as this is the
// expected error.  Otherwise, add the name to the map and reload the
// NIS (YP) maps.
/
/
/ NNFB (BIND/DNS component)    errors     3000 - 3999
/
03002, 00000, "Unknown BIND error code: %s"
// *Cause: The return code in the BIND (DNS) query response did not
// conform to those values listed in RFC 1035.
// *Action: Verify that the error is generated by the BIND functions on
// this platform.  Notify Worldwide Customer Support of the error.
/
03003, 00000, "Format error parsing server response"
// *Cause: The query response packet returned from the BIND (DNS) API
// did not conform to the format listed in RFC 1035.
// *Action: Verify that the error is generated by the BIND functions on
// this platform.  Notify Worldwide Customer Support of the error.
/
03004, 00000, "DNS Class mismatch (%s)"
// *Cause: The query response packet returned a class different from the 
// ones expected by the interface.
// *Action: Verify that the error is generated by the BIND functions on
// this platform.  Notify Worldwide Customer Support of the error.
/
/
/ NNF conversion tool                4000 - 4999
04000, 00000, "File succesfully converted"
// *Cause: The requested conversion is performed.
// *Action: Normal condition, no action necessary.
/
04001, 00000, "Error converting input file"
// *Cause: The input file contains lines that cannot be converted by the 
// conversion program. 
// *Action: Check that the syntax of the input file is correct.
/
04002, 00000, "Outputfile already exists"
// *Cause: An old output file already exists in the current directory
// *Action: Remove the existing file, and restart the conversion tool 
/
04003, 00000, "Entry in inputfile is too long"
// *Cause: The makedbm program, limits entries in mapfiles to 1017 
// characters. Therefor, the conversion tool will not process TNS addresses 
// which are longer than 1017 characters.
// *Action: Shorten the offending entry.
/
04004, 00000, "Invalid string in inputfile"
// *Cause: the input file contains invalid lines.
// *Action: Check that the syntax of the input file is correct.
/
04005, 00000, "Cannot open inputfile"
// *Cause: The specified input file could not be found.
// *Action: restart the conversion tool with the correct input file.
/
04006, 00000, "Could not create outputfile"
// *Cause: An output file could not be created in the current working
// directory
// *Action: Change the permissions of the current directory and restart the
// conversion tool.
/
04007, 00000, "Error reading input file"
// *Cause: A problem while reading the input file. This could be caused 
// by an unexpected end of file in the input file.
// *Action: Check that the file is intact and that the syntax of the input
// file is correct.
/
04008, 00000, "Error writing outputfile"
// *Cause: An error occured while writing to the output file. 
// *Action: Check available disk space. If the error persists, contact 
// Worldwide Customer Support.
/
04009, 00000, "Usage: tns2nis <filename>"
// *Cause: The conversion tool was not invoked properly. The filename should
// either be tnsnames.ora or native.ora
// *Action: Restart the conversion tool with the proper parameter.
/

