/
/ $Header: lrmus.msg 19-jun-2003.17:48:08 Exp $
/
/ Copyright (c) 1996, 2003, Oracle.  All rights reserved.
/   NAME
/     lrmus.msg - CORE error message file for the parameter manager (LRM)
/   DESCRIPTION
/     Listing of all CORE error messages for LRM
/
/ 100 LRM internal error
/
100, 0, "internal error [%d]"
// *Cause: An internal error has occurred.
// *Action: Contact Oracle Support Services and report the error.
/
/ 101 - 199 LRM user errors
/
101, 0, "unknown parameter name '%.*s'"
// *Cause: The parameter name was misspelled.
// *Action: Spell the parameter name correctly.
102, 0, "'%.*s' is not in the legal range for '%.*s'"
// *Cause: The value of the parameter is not within the legal range.
// *Action: Refer to the manual for the allowable values for this parameter.
103, 0, "'%.*s' contains an illegal integer radix for '%.*s'"
// *Cause: An illegal integer radix specification was found.
// *Action: Only 'd', 'h', 'D', and 'H' may be used as radix specifications.
104, 0, "'%.*s' is not a legal integer for '%.*s'"
// *Cause: The value is not a valid integer.
// *Action: Specify only valid integers for this parameter.
105, 0, "'%.*s' is not a legal Boolean for '%.*s'"
// *Cause: The value is not a valid Boolean.
// *Action: Refer to the manual for allowable Boolean values.
106, 0, "out of memory"
// *Cause: The operating system has run out of memory.
// *Action: Take action to make more memory available to the program.
107, 0, "parameter name abbreviation '%.*s' is not unique"
// *Cause: The given abbreviation was not unique.
// *Action: Use a longer abbreviation to make the parameter name unique.
108, 0, "invalid positional parameter value '%.*s'"
// *Cause: An invalid positional parameter value has been entered.
// *Action: Remove the invalid positional parameter.
109, 0, "could not open parameter file '%.*s'"
// *Cause: The parameter file does not exist.
// *Action: Create an appropriate parameter file.
110, 0, "syntax error at '%.*s'"
// *Cause: A syntax error was detected.
// *Action: Change the input so that the correct syntax is used.
111, 0, "no closing quote for value '%.*s'"
// *Cause: A quoted string was started but not finished.
// *Action: Put a closing quote in the proper location.
112, 0, "multiple values not allowed for parameter '%.*s'"
// *Cause: An attempt was made to specify multiple values for a parameter which
//         can take only one value.
// *Action: Do not specify more than one value for this parameter.
113, 0, "error when processing file '%.*s'"
// *Cause: A problem occurred when processing this file.
// *Action: Examine the additional error messages and correct the problem.
114, 0, "error when processing from command line"
// *Cause: A problem occurred when processing the command line.
// *Action: Examine the additional error messages and correct the problem.
115, 0, "error when processing an environment variable"
// *Cause: A problem occurred when processing an environment variable.
// *Action: Examine the additional error messages and correct the problem.
116, 0, "syntax error at '%.*s' following '%.*s'"
// *Cause: A syntax error was detected.
// *Action: Change the input so that the correct syntax is used.
117, 0, "syntax error at '%.*s' at the start of input"
// *Cause: A syntax error was detected.
// *Action: Change the input so that the correct syntax is used.
118, 0, "syntax error at '%.*s' at the end of input"
// *Cause: A syntax error was detected.
// *Action: Change the input so that the correct syntax is used.
119, 0, "unable to obtain a valid value for '%.*s'"
// *Cause: No valid value was obtained for this parameter.
// *Action: Rerun the application and enter a valid value.
120, 0, "'%.*s' is not a legal Oracle number for '%.*s'"
// *Cause: The value is not a valid Oracle number.
// *Action: Refer to the manual for allowable Oracle number values.
121, 0, "'%.*s' is not an allowable value for '%.*s'"
// *Cause: The value is not a legal value for this parameter.
// *Action: Refer to the manual for allowable values.
122, 0, "value '%.*s' for '%.*s' must be between '%d' and '%d'"
// *Cause: The value of the parameter is not within the legal range.
// *Action: Specify a value that is within the legal range.
123, 0, "invalid character %u found in the input file"
// *Cause: A character that is invalid was found in the input file.
// *Action: Specify an input file that contains only valid characters.
/