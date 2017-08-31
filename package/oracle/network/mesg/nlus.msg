/ Copyright (c) 1991, 2000 by the Oracle Corporation.  All rights reserved.
/
/ $Header: nlus.msg 27-feb-2007.23:07:29 sreguna Exp $
/
/ NAME     
/   nlus.msg
/
/ FUNCTION 
/   Network Library US error message file
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
/    sreguna    06/14/06 - Add diagnosability error messages 
/    sreguna    03/28/06 - Add snlin null context error 
/    qcao       02/18/05 - add invalid port error 
/    pthiruna   01/22/04 - Added SNLINET messages
/    rneela     04/22/03 - cleanup net otrace msgs
/    pthiruna   10/04/02 - New messages NLEM(611),NLPA(412),generic code 56,
/                          NLDA(826),NLDS(281),NLEM(612),NLPA(413),NLPA(414)
/    rachacos   09/05/00 - add messages for NLEPE component.
/
/   $Log:  $
/    Revision 1.29  1995/11/02  23:29:15  smaring
/    added error codes for otrace error support
/
/    Revision 1.28  1995/05/31  16:11:38  heneman
/    Added generic error codes 53, 54, and 55.
/
/    Revision 1.27  1993/06/30  20:32:25  jgraham
/    add password encryption errors
/
/    Revision 1.26  1993/04/13  05:02:41  dmorriso
/    Added messages for nlda
/
/    Revision 1.25  1993/03/09  02:08:09  dmorriso
/    bug 153140, fixed two spelling errors
/
/    Revision 1.24  1993/02/12  01:27:58  markl
/    Make nlcp errors conform to standards
/
/    Added message 866 for a "help" command.
/
/
/   Markl    02/01/91     Punt error 1, move error 3 to be error 1
/   Markl    01/29/91     Creation
/
00000, 00000, "normal, successful completion"
/
/
/ Reserve error blocks here...
/ ============================
/
/ NLH  (generic LRU cache) errors       1 - 49
/ NL generic errors                    50 - 99
/ NLDS (debug streams)    errors      200 - 299
/ NLNV (name-value pairs) errors      300 - 399
/ NLPA (param component)  errors      400 - 499
/ NLDT (debug tracing)    errors      500 - 599
/ NLEM (err msg component)errors      600 - 699
/ NLER (error component)  errors      700 - 799
/ NLTM (timer component)  errors      800 - 899
/ NLPU (parsing component) errors     900 - 999
/ SNLINET (AF-independent TCP/IP API component) errors 6001 - 7000
/ NLDD (diagnosability component) errors 8000 - 8099
/
/
/ List error messages in (numerical) ascending order here.
/ Precede each block of errors with a comment.
/ ========================================================
/
/
/ NLH (generic LRU cache) errors      1 - 49
/
00001, 00000, "cache overflow"
00002, 00000, "illegal cache handle"
00003, 00000, "memory exhausted"

/
/ NL generic errors                    50 - 99
/
/ Do not change err codes 51 & 52.
/

00051, 00000, "internal error code, arguments: [%s], [%s], [%s], [%s], [%s], [%s], [%s]"
// *Cause:  This is the generic internal error code for NPD program 
// exceptions.  This indicates that a process has encountered an
// exceptional condition.
// *Action: Report as a bug - the first argument is the internal error number
// The second argument is the "emfi" (err msg file index).

00052, 00000, "fatal error occurred: unwise to proceed"
// *Cause:  The application is in an unrecoverable state.
// *Action: Shutdown and restart the system.

00053, 00000, "Could not allocate memory"
// *Cause:  Insufficient swap space or system memory.
// *Action: Increase swap space or system memory.

00054, 00000, "Invalid usage"
// *Cause:  Bad function parameter.
// *Action: Check function call.

00055, 00000, "Unexpected error"
// *Cause:  A function returned an unexpected error code.
// *Action: Check function call.

00056, 00000, "Transition failed"
// *Cause: Dynamic transition to thread-safe mode failed.
// *Action: Check function call.

00057, 00000, "Null handle passed"
// *Cause: Null handle passes to funciton.
// *Action: Check function call

00058, 00000, "Invalid argument"
// *Cause: Invalid argument to function call
// *Action: Check function call

/
/  $$$ Remaining errors have been shamelessly stolen from their corresponding
/  header files, with no attempt at readability (markl 8/29/91)
/
/ NLDS (debug streams)    errors      200 - 299
00200, 00000, "null stream handle"
00201, 00000, "stream type not implemented yet"
00202, 00000, "memory allocation failed"
00203, 00000, "O/S error"
00204, 00000, "stream type is invalid"
00205, 00000, "stream not initialized"
00206, 00000, "stream not open"
00215, 00000, "function not implemented yet"
00216, 00000, "function not available"
00220, 00000, "null open function"
00221, 00000, "null close function"
00222, 00000, "null destroy function"
00223, 00000, "null read function"
00224, 00000, "null write function"
00225, 00000, "null vfprintf function"
00226, 00000, "null flush function"
00230, 00000, "error in file name construction"
00231, 00000, "error in file open"
00232, 00000, "error in setting file read or write offset"
00233, 00000, "error in file close"
00234, 00000, "error in file flush"
00235, 00000, "error in file flush"
00236, 00000, "error in file vfprintf"
00238, 00000, "error in file seek"
00239, 00000, "error in file read"
00240, 00000, "maximum file size exceeded"
00241, 00000, "tell and seek not implemented yet"
00250, 00000, "error in terminal open function"
00251, 00000, "error in terminal close function"
00252, 00000, "error in terminal destroy function"
00253, 00000, "error in terminal read function"
00254, 00000, "error in terminal write function"
00255, 00000, "error in terminal vfprintf function"
00256, 00000, "error in terminal flush function"
00260, 00000, "error in error stream open function"
00261, 00000, "error in error stream close function"
00262, 00000, "error in error stream destroy function"
00263, 00000, "error in error stream read function"
00264, 00000, "error in error stream write function"
00265, 00000, "error in error stream vfprintf function"
00266, 00000, "error in error stream flush function"
00270, 00000, "error in super stream open function"
00271, 00000, "error in super stream close function"
00272, 00000, "error in super stream destroy function"
00273, 00000, "error in super stream read function"
00274, 00000, "error in super stream write function"
00275, 00000, "error in super stream vfprintf function"
00276, 00000, "error in super stream flush function"
00277, 00000, "no arguments specified for super stream"
00278, 00000, "cannot open log file"
00279, 00000, "Log messages written to %s"
00280, 00000, "error creating log stream %s"
00281, 00000, "could not initialize SLTS mutex"
00282, 00000, "could not write ADR log message"
/
/ NLNV (name-value pairs) errors      300 - 399
/
00301, 00000, "failure return code"
00302, 00000, "not a binding"
00303, 00000, "syntax error in NV string"
00304, 00000, "syntax error in path name string"
00305, 00000, "the specified path name does not exist"
00306, 00000, "memory allocation failed"
00307, 00000, "memory free failed"
00308, 00000, "NV pair contains a list"
00309, 00000, "NV pair contains an atom"
00310, 00000, "internal error in NLNV implementation"
00311, 00000, "invalid list index"
00312, 00000, "NV string too long to fit in buffer"
00313, 00000, "null pointer or null size"
00351, 00000, "premature end of string"
00352, 00000, "unescaped meta character is first character in stream"
00353, 00000, "unescaped begin delimiter in string"
00354, 00000, "unescaped end delimiter in string"
00355, 00000, "unescaped assignment operator in path name"
00356, 00000, "unescaped path name delimiter in NV string"
00357, 00000, "no end quote in quoted string"
00371, 00000, "expecting end of string, too much input"
00372, 00000, "expecting begin delimiter"
00373, 00000, "expecting end delimiter"
00374, 00000, "expecting assignment operator"
00375, 00000, "expecting path delimiter"
/
/ NLPA (param component)  errors      400 - 499
/
00401, 00000, "failure return code"
00402, 00000, "memory allocation failed"
00403, 00000, "memory free failed"
00404, 00000, "null context"
00405, 00000, "cannot open parameter file"
00406, 00000, "cannot put into parameter table"
00407, 00000, "bad command line argument"
00408, 00000, "cannot find or read value"
00409, 00000, "incorrect value type"
00410, 00000, "value buffer too small"
00411, 00000, "match not found in parameter's list"
00412, 00000, "SLTS RW-lock operation failed"
00413, 00000, "SLTS mutex initialization failed"
00414, 00000, "SLTS RW-lock initialization failed"
00421, 00000, "end of file"
00422, 00000, "premature end of file"
00423, 00000, "NULL key"
00424, 00000, "no equal separator"
00425, 00000, "bad continuation line"
00426, 00000, "bad address specification"
00427, 00000, "bad list"
00428, 00000, "bad quote string"
00429, 00000, "bad include directive, ignored"
00430, 00000, "maximum include depth reached"
00451, 00000, "failure return code"
00452, 00000, "cannot create binding"
00453, 00000, "cannot count bindings"
00454, 00000, "cannot get binding"
00455, 00000, "cannot get name"
00456, 00000, "cannot get atom (path name)"
00457, 00000, "bad na format"
00458, 00000, "value buffer size too small"
00459, 00000, "System parameter file is %s"
00460, 00000, "Local parameter file is %s"
00461, 00000, "Command-line specified parameter file is %s"
00462, 00000, "error loading parameter file %s"
00463, 00000, "Unable to contact Directory Server" 
00464, 00000, "Unable Initialize the Parameter System" 
/
/ NLDT (debug tracing)    errors      500 - 599
/
00500, 00000, "null context"
00501, 00000, "null stream handle"
00502, 00000, "memory allocation failed"
00503, 00000, "bad level"
00504, 00000, "bad type"
00505, 00000, "bad mode"
00506, 00000, "stream write failed"
00507, 00000, "internal error, bad parameter name"
00508, 00000, "cannot open trace file"
00509, 00000, "Trace information written to %s"
00510, 00000, "Trace level is currently %d"
00511, 00000, "error opening trace file %s"
/
/ NLEM (err msg component)errors      600 - 699
/
00600, 00000, "null context"
00601, 00000, "memory allocation failed"
00602, 00000, "emfi already registered"
00603, 00000, "emfi not registered"
00604, 00000, "message file open failed"
00605, 00000, "LI err"
00606, 00000, "LMS initialization error"
00607, 00000, "bad emfi"
00608, 00000, "bad product name"
00609, 00000, "bad facility name"
00610, 00000, "bad output buffer or output buffer size"
00611, 00000, "SLTS RW-lock operation failed"
00612, 00000, "SLTS RW-lock initialization failed"
/
/ NLER (error component)  errors      700 - 799
/
00700, 00000, "null context"
00701, 00000, "memory allocation failed"
/
/ NLTM (timer component)  errors      800 - 820
/
00800, 00000, "timers not initialized"
00801, 00000, "attempt to set or clear a free timer"
00802, 00000, "memory exhausted"
00803, 00000, "error manipulating timer interrupt handler"
/
/ NLDA (command processor component) messages    825 - 849
/
00825, 00000, "memory allocation failed"
00826, 00000, "error using LDX package"
/
/ NLCP (command processor component) messages    850 - 870
/
00850, 00000, "Welcome to %s, type \"help\" for information.\n"
00851, 00000, "%s finished"
00852, 00000, "too many arguments, command ignored"
00853, 00000, "undefined%s command \"%s\".  Try \"help%s\""
00854, 00000, "Ambiguous text \"%s\", valid completions are:"
00855, 00000, "multiple modifiers are not allowed"
00856, 00000, "Missing or illegal command modifier, valid modifiers are:"
00857, 00000, "wrong number (%s - %s needed) of arguments to \"%s\""
00858, 00000, "wrong number (%s needed) of arguments to \"%s\""
00859, 00000, "command not confirmed"
00860, 00000, "The following operations are available after%s"
00861, 00000, "An asterisk (*) denotes a modifier or extended command:"
00862, 00000, "Confirm [yes or no]: "
00863, 00000, "Internal error"
00864, 00000, "command \"%s\" accepts no modifiers"
00865, 00000, "could not open command file \"%s\""
00866, 00000, "The following operations are available"
/
/ NLEPE (primitive error stack component) messages    871 - 880
/
00871, 00000, "memory allocation failed"
00872, 00000, "shared signals initialization failed"
/
/
/ NLPU errors      900 - 999
/
/
00901, 00000, "internal failure error code"
00902, 00000, "memory exhausted"
00903, 00000, "memory free failed"
00904, 00000, "received pointer to a null context"
00905, 00000, "error opening %s"
00906, 00000, "cannot put value into parameter table"
00907, 00000, "invalid command line argument"
00908, 00000, "no such value in parameter table"
00909, 00000, "no parameter %s in parameter table"
00910, 00000, "value type mismatch"
00911, 00000, "supplied buffer of insufficient length"
00912, 00000, "error occurred while reading from parameter file %s"
/
/ error codes (920-949) for syntax errors encountered in parsing 
/
00921, 00000, "syntax error while parsing parameter %s"
00922, 00000, "unexpected end of file"
00923, 00000, "null key pointer"
00924, 00000, "missing equal separator"
00925, 00000, "invalid continuation line"
00926, 00000, "invalid address specification"
00927, 00000, "invalid list syntax"
00928, 00000, "invalid quoted string"
00929, 00000, "invalid IFILE directive"
00930, 00000, "maximum include file depth reached"
00931, 00000, "parenthesis mismatch"
00932, 00000, "unexpected extra text after parameter value"
00933, 00000, "unexpected end of parameter definition"
00934, 00000, "unescaped meta character is first character in parameter string"
00935, 00000, "unescaped list begin delimiter"
00936, 00000, "unescaped list end delimiter"
00937, 00000, "missing end quote"
00938, 00000, "text encountered when expecting end of string"
00939, 00000, "expecting begin delimiter"
00940, 00000, "expecting end delimiter"
00941, 00000, "mismatched single quote"
00942, 00000, "mismatched double quote"
/
/ data structures' manipulation errors 
/
00950, 00000, "not a valid value structure"
00951, 00000, "syntax error in parameter text"
00952, 00000, "syntax error in path name string"
00953, 00000, "the specified path name does not exist"
00954, 00000, "value structure contains a list"
00955, 00000, "value structure contains a list"
00956, 00000, "internal error in NLPU implementation"
00957, 00000, "invalid list index"
00958, 00000, "supplied buffer of insufficient length"
00959, 00000, "expecting a list"
00960, 00000, "null pointer or size"
00961, 00000, "empty list of values"
00962, 00000, "invalid list of values"
00963, 00000, "unescaped assignment operator in path name"
00964, 00000, "unescaped path name delimiter in NV string"
00965, 00000, "expecting path delimiter"
/
/ password encryption errors
/
00966, 00000, "invalid cleartext buffer length"
00967, 00000, "invalid encryption buffer length"
00968, 00000, "encryption failed"
/
/ SNLINET errors (7000 to 7999)
/
07001, 00000, "could not resolve the provided node name"
07002, 00000, "could not allocate memory"
07003, 00000, "could not resolve the provided service name"
07004, 00000, "invalid arguments supplied to the function"
07005, 00000, "supplied address is invalid"
07006, 00000, "supplied buffer of insufficient length"
07007, 00000, "internal error"
07008, 00000, "supplied port number is invalid"
07009, 00000, "null context"
/
/ NLDD errors /
/
08000, 00000, "null context"
08001, 00000, "could not allocate memory"
08002, 00000, "Diagnosability  context creation failed"
08003, 00000, "UTS Bucket creation fialed"
08004, 00000, "SLTS init fialed"
08005, 00000, "UTS write failed"
08006, 00000, "Bad parameter"
08007, 00000, "Diagnosability service not available"
08008, 00000, "Diagnosability not initialized"
08009, 00000, "ADR not open"
08010, 00000, "Failed to release the Diagnosability context "
08011, 00000, "Bad level specified for tracing"
08012, 00000, "Failed to retreive the ADR Service path"
08013, 00000, " Invalid ADR Base directory" 
08014, 00000, "Failed to initialize Diagnosability framework, falling back to old network tracing/logging \n %s"
08015, 00000, "Client(OCI) side initialization of Diagnosability framework failed"

