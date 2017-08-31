/
/ Copyright (c) 1994, 1995, 1996, 1997, 1998, 1999 by the Oracle Corporation.  All rights reserved.
/
/ File:     kous.msg
/ Created:  12/07/93
/ Owner:    JWIJAYA
/
/ NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
/
/ Please read the header information at least once and understand it before
/ adding or modifying any errors.  The header information consists of
/ the standards for errors and the description of this particular error
/ message file (following the standards).
/
/ For now, you don't have to email BQUIGLEY when adding or modifying errors.
/ It will done when we copy these errors into the master error message file
/ of the Oracle DBMS product, i.e., 'error.msg'.
/
/ NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
/
/
/          -=(  COMPLY WITH STANDARDS WHEN CHANGING MESSAGES  )=-
/
/  Email BQUIGLEY your changes and he will verify compliance with standards.
/
/          -=(  COMPLY WITH STANDARDS WHEN CHANGING MESSAGES  )=-
/
/ Message Standards    
/ =================
/ Author  Brian Quigley
/ Written 07/28/92
/ 
/ Purpose
/ -------
/   When a message is generated, you are speaking directly to the user.  Often,
/ the quality of your software is judged by the ease with which a user can fix
/ problems.  Your purpose is to make it as easy as possible to use Oracle
/ products. 
/ 
/   Note that the "Cause:" and "Action:" sections for a message will also be 
/ seen by the user.  Thus, it is important to keep these sections simple, yet
/ as helpful as possible. 
/ 
/   Whenever possible, include all relevant information within the message.
/ 
/   Your purpose is to make a message as informative as possible.
/ 
/ Size Of Message
/ ---------------
/   Message text should be limited to a maximum of 76 characters. Messages
/ containing embedded % directives should not overrun the 76 character limit
/ unless they signal unusual errors which do not occur as part of user
/ applications.  For example, startup errors and system-dependent errors can
/ probably may have longer message text. 
/
/ 
/ Simple Language
/ ---------------
/   Avoid cryptic messages and overly technical language.
/ 
/     NOT GOOD: index key does not exist root dba %s, dba %s (%s)
/     BETTER  : index key does not exist for row: %s, %s, %s
/ 
/ 
/ Lowercase vs. Uppercase
/ -----------------------
/   Use uppercase for commands and keywords.
/ 
/     NOT GOOD: alter cluster statement no longer supported
/     BETTER  : ALTER CLUSTER statement no longer supported
/ 
/ 
/   Use lowercase in the message wording, including the first letter.
/ 
/     NOT GOOD: Invalid syntax
/     BETTER  : invalid syntax
/ 
/ 
/ Commands, Keywords, Parameters Values
/ -------------------------------------
/   Whenever possible, give the command, keyword, and parameter values that the
/ user used. 
/ 
/   Use uppercase to indicate commands and keywords.
/ 
/     NOT GOOD: missing IDENTIFIED keyword
/     BETTER  : GRANT CONNECT statement requires the IDENTIFIED keyword
/ 
/     NOT GOOD: MAXVALUE is less than current value
/     BETTER  : ALTER SEQUENCE MAXVALUE %s is less than current MAXVALUE %s
/ 
/ 
/ Period
/ ------
/   Do not end a message with a period.
/ 
/ 
/ Numbers
/ -------
/   Do not enclose numbers with special characters.
/ 
/     NOT GOOD: number of control files (%s) does not equal %s
/     BETTER  : specified %s control files while other instances have %s
/ 
/   Spell out the word "number" to ensure the message is understood.
/ 
/     NOT GOOD: change %s for thread (%s) is in sequence #%s
/     BETTER  : the change number %s for thread %s is in sequence number %s
/ 
/ 
/ Numbers - User Input
/ --------------------
/   Do not enclose user-input numbers with special characters.
/ 
/     NOT GOOD: file size (%s) exceeds maximum of %s blocks
/     BETTER  : a file size of %s would exceed the allowed maximum of %s blocks
/ 
/ 
/ Quotes
/ ------
/   Do not use single or double quotes to highlight a text variable or command.
/ 
/     NOT GOOD: 'row_locking = always' requires transaction processing 
/     BETTER  : ROW_LOCKING = ALWAYS requires transaction processing 
/ 
/ 
/ Single Quotes
/ -------------
/   Never use single quotes.
/ 
/ 
/ Double Quotes
/ -------------
/   ALWAYS and ONLY use double quotes to identify database objects.
/ 
/     NOT GOOD: file %s: bad block size "% bytes" expecting "%s"
/     BETTER  : expected block size of %s bytes in file "%s" but found %s
/ 
/     NOT GOOD: duplicate column %s
/     BETTER  : duplicate column "%s" specified for table "%s", schema "%s"
/ 
/ 
/ Ellipses
/ --------
/   Never use ellipses.
/ 
/     NOT GOOD: datatype {%s} for column %s, table %s.%s is not supported
/     BETTER  : datatype %s not support for column "%s" table "%s" schema "%s"
/ 
/ 
/ Parentheses
/ -----------
/   ALWAYS and ONLY use parentheses for identifying constraint names.
/ 
/     NOT GOOD: unique constraint %s.%s violated
/     BETTER  : unique constraint (%s.%s) violated
/ 
/     NOT GOOD: invalid file size (%s)
/     BETTER  : size of %s bytes is invalid for file "%s"
/ 
/ 
/ Brackets
/ --------
/   ALWAYS and ONLY use brackets for identifying program argument values.
/ 
/     NOT GOOD: Internal Error: %s,%s,%s,%s,%s,%s,%s
/     BETTER  : internal error, arguments: [%s],[%s],[%s],[%s],[%s],[%s]
/ 
/ 
/ Grammar
/ ------
/    Use complete sentences whenever possible (but no period at end of
/ sentence).
/ 
/    Use not use multiple sentences in a message, i.e. one sentence only.
/ 
/    Use the active voice.
/ 
/    Do not use an antagonistic tone.
/ 
/    Use correct punctuation whenever possible.
/ 
/ 
/ Recommended Style
/ ---------------------
/   Try to make positive recommendations or suggestions as part of the message.
/ 
/   Explain what is invalid AND what is valid.
/ 
/     NOT GOOD: invalid file size (%s)
/     BETTER  : file size of %s is invalid
/     BEST    : file size of %s bytes is outside valid range %s to %s bytes
/ 
/     NOT GOOD: duplicate column %s
/     GOOD    : duplicate column "%s" in %s
/     BEST    : duplicate column "%s" in %s "%s"
/                                        ^    ^
/                        this variable ...    ... this variable
/                   indicates the TYPE            indicates the NAME
/                   of database object            of the object
/ 
/ 
/   Thus, substituting ... 'colin', 'view'
/ 
/        in:    duplicate column "%s" in %s
/     gives:    duplicate column "colin" in view
/ 
/ 
/   And, substituting ... 'ugotit', 'primary, foreign or index key'
/ 
/        in:    duplicate column "%s" in %s
/     gives:    duplicate column "ugotit" in primary, foreign or index key
/ 
/   And, substituting ... 'pedestal', 'table', 'entablature'
/ 
/        in:    duplicate column "%s" in %s "%s"
/     gives:    duplicate column "pedestal" in table "entablature"
/ 
/   And substituting ... 'wat', 'dee', 'dikins'
/ 
/        in:    illegal constraint (%s.%s) for schema "%s"
/     gives:    illegal constraint (wat.dee) for schema "dikins"
/ 
/ 
/ Text Variables
/ --------------
/   Do not place text variables at the beginning of messages, as this does not 
/ allow correct alphabetical sorting of the messages.  The alphabetical listing
/ at the back of the Messages Manual is a necessary tool for Customer Support.
/ 
/     NOT GOOD: %s not found
/     BETTER  : object %s not found
/     BEST    : object %s not found in schema %s
/ 
/ 
/ Internal Errors & Routine Names
/ -------------------------------
/   Use ORA-00600 messages for internal messages not to be seen by the user.
/ 
/   Do not use routine names in messages.
/ 
/     NOT GOOD: ORA-03116, ttcxxx: invalid buffer length
/     BETTER  : ORA-00600, internal error, arguments: [ttcxxx], [], [], [], []
/ 
/ 
/ Public vs. Non Public Messages 
/ ------------------------------
/   Use ORA-00600 messages for internal messages not to be seen by the user.
/ 
/   For messages which are for internal use only, indicate this in ERROR.MSG
/ message listing or at beginning of the range of this type of message in the
/ file. Debug event codes, CORE messages, are examples. 
/ 
/   Use "// *Document: NO" as follows:
/ 
/   e.g. 
/       10049, 00000, "protect library cache memory heaps"
/       // *Document: NO
/       // *Cause: 
/       // *Action: Use the OS memory protection (if available) to protect
/       //          library cache memory heaps that are pinned.
/ 
/ 
/ Programmer's Comments
/ ---------------------
/   If you wish to add comments regarding a message that should not be seen by
/ the public, use "// *Comment: " as follows:
/ 
/   e.g. 
/       32769, 00000, "incompatible SQL*Net version"
/       // *Cause: An attempt was made to use an older version of SQL*Net that
/       //         is incompatible with current version of ORACLE.
/       // *Action: Use a newer version of SQL*Net.
/       // *Comment: Can only happen if user tried to use an illegal copy of a 
/       //           pre-lease version of SQL*Net.
/ 
/ 
/ ORACLE vs. Oracle
/ -----------------
/    The word ORACLE in uppercase refers to the ORACLE server. Use the term
/ "ORACLE server" when referring to the server.  For ORACLE server version 7,
/ use the term "Oracle7" or "Oracle7 server".  For ORACLE server version 8,
/ use the term "Oracle8" or "Oracle8 server".
/ 
/    The word Oracle in lowercase with capitalized first letter refers to the
/ company.  Use "Oracle Corp." when referring to the company.
/ 
/ 
/------------------------------------------------------------------------------
/
/ MODIFIED:
/    rpingte    07/07/09 -  bug8654548: add LDI messaged for TZ project
/    mbastawa  03/03/03 -   bug2184760: add 21527,195* (kod.h) not used for OMS
/    dlomax     08/08/97 -  Bug 500331: added 1865 for CORE Dates
/    jweisz     08/06/97 -  add 21526
/    skrishna   03/17/97 -  add 22140
/    ramkrish   11/06/96 -  21560: chg Cause, Action; 22285: chg Mesg
/    mshore     10/30/96 -  Add 1822 (CORE Dates Package)
/    ramkrish   10/16/96 -  Reserve 22280-22299 for LOB/FILE; Free 24280-24299
/    ramkrish   07/10/96 -  Reserve 22285-99 for KOLF - Generic File Manager
/    jwijaya    07/09/96 -  synch with error.msg
/    jwijaya    10/23/95 -  review ranges of errors
/    tcheng     06/23/95 -  add error for kol
/    skotsovo   06/06/95 -  add error for ref to value adt type 
/    skotsovo   05/31/95 -  add error for array index out of bounds to KOT 
/    skotsovo   04/13/95 -  add kot multiset errors 
/    jboonleu   02/17/95 -  new koc error message 
/    sthakur    02/14/95 -  add data manager error 
/    skotsovo   02/09/95 -  add type mgr error indicating a ref was passed to 
/                           kotgafp 
/    skotsovo   01/26/95 -  add type manager error 
/    jboonleu   01/12/95 -  update koc error code 
/    jwijaya    09/30/94 -  review KOC errors
/    jwijaya    09/16/94 -  review
/    jwijaya    06/10/93 -  add error 21560
/    jwijaya    12/07/93 -  Creation
/
/------------------------------------------------------------------------------
/ 
/ DESCRIPTION 
/ ----------- 
/ 
/ List of error numbers and messages for 
/   - Object Interface (ORI/ORT/ORL/ORC, now OCI) 
/   - Object Management Subsystem (KO) 
/   - Generic Subsystem (KG) 
/   - Cartridge Services 
/ ----------------------------------------------- 
/ 
/ Error numbers from 21300 to 22799 are reserved for ORI/ORT/ORL/ORC (object 
/ OCI), KO and KG. 
/ These error numbers have been reserved from the master error message 
/ file of the Oracle DBMS product, i.e., 'oraus.msg'. 
/ In addition, this file will also contain errors that have been previously 
/ defined and allocated to existing KG components. 
/ 
/ The purpose of this error message file is to supply the error numbers 
/ and messages for the client-side OCI. 
/ The server-side OCI will be served 
/ by the Oracle DBMS error message file, i.e., 'oraus.msg', which will also 
/ contain the errors within 21300 to 22799 defined here. 
/ 
/ NOTE THAT ANY CHANGES OR ADDITIONS TO OCIUS.MSG MUST ALSO BE DONE TO 
/ ORAUS.MSG.  ORAUS.MSG CONTAINS THE EXACT DUPLICATION OF OCIUS.MSG. 
/ 
/ This file is converted to header/message files using lmsgen.c. 
/ 
/ The first column is the ORACLE error number. 
/ The second column is reserved and must (for now) be 00000. 
/ The remainder of the line is the error text. 
/ 
/ Adding an error: 
/    Check out this file, add the error, and check it back in.	Error numbers 
/    should always be ordered.	The second column should always be 00000. 
/ 
/ Pseudo-error debugging events: 
/    Error numbers 22700 to 22799 are reserved for debugging event 
/    numbers that are not really errors. 
/ 
/ Reserved Ranges of Errors: 
/ - Error numbers from 21300 to 21499 are reserved for future use. 
/ - Error number 21500 is the OCI's or Cartridge Services' internal error. 
/ - Error number 21501 is the OCI's or Cartridge Services' memory allocation error. 
/ - Error number 21503 is the OCI's or Cartridge Services' fatal error. 
/ - Error numbers from 21505 to 21519 are reserved for ORIG/KOG (general). 
/ - Error numbers from 21520 to 21559 are reserved for KOD/KOFD/KOUD (data). 
/ - Error numbers from 21560 to 21599 are reserved for 
/   common ORI/ORT/ORL/ORC/KO and Cartridge Services' errors. 
/ - Error numbers from 21600 to 21699 are reserved for ORI*/KOI* (interface) 
/   and Memory/Duration Cartridge Service. 
/ - Error numbers from 21700 to 21799 are reserved for KOC (cache). 
/ - Error numbers from 21800 to 21999 are reserved for future use. 
/ - Error numbers from 22000 to 22299 are reserved for ORL/KOL (language) 
/   including OCIDate, OCINumber, OCIColl, OCITable, and OCIArray. 
/ - Error numbers from 22300 to 22599 are reserved for ORT/KOT (type). 
/ - Error numbers from 22600 to 22699 are reserved for KOP* (pickler) and 
/   Pickler Cartridge Service. 
/ - Error numbers from 22700 to 22799 are reserved for debugging event numbers. 
/ - Error numbers from 30100 to 30134 are reserved for OCIExtract Cartridge 
/   Service. 
/ - Error numbers from 30135 to 30149 are reserved for OCIThread Cartridge 
/   Service. 
/ - Error numbers from 30150 to 30174 are reserved for OCIFile Cartridge 
/   Service. 
/ - Error numbers from 30175 to 30199 are reserved for OCIFormat Cartridge 
/   Service.
/ - Error numbers from 30200 to 30299 are reserved for NLS Cartridge Service. 
/------------------------------------------------------------------------------
/
/ Error numbers that have been used by existing KG components.
/ These numbers are actually passed to the KG subsystem as parameters/fields
/ in 'kgsf' (see 'kgsf.h').
/
00601, 00000, "cleanup lock conflict"
// *Cause:  PMON process runs into lock conflict trying to recover processes.
// *Action: This is trapped internally, no action necessary.
00602, 00000, "internal programming exception"
// *Cause:  Internal programming exception.
// *Action: Report as a bug.
// Caution: The following error code is not relocatable.
/
00972, 00000, "identifier is too long"
// *Cause:  An identifier with more than 30 characters was specified.
// *Action: Specify at most 30 characters.
/
01013, 00000, "user requested cancel of current operation"
// *Cause:
// *Action:
/
/	 1800 - 1899 Date function errors
/	 1800 - 1809 Overflow conditions
/
01800, 00000, "a literal in the date format was too large to process"
// *Cause:
// *Action:
01801, 00000, "date format is too long for internal buffer"
// *Cause:
// *Action:
01802, 00000, "Julian date is out of range"
// *Cause:
// *Action:
01803, 00000, "failure in getting date/time"
// *Cause:
// *Action:
/
/	 1810 - 1829 Conflicting date input format
/
01810, 00000, "format code appears twice"
// *Cause:
// *Action:
01811, 00000, "Julian date precludes use of day of year"
// *Cause:
// *Action:
01812, 00000, "year may only be specified once"
// *Cause:
// *Action:
01813, 00000, "hour may only be specified once"
// *Cause:
// *Action:
01814, 00000, "AM/PM conflicts with use of A.M./P.M."
// *Cause:
// *Action:
01815, 00000, "BC/AD conflicts with use of B.C./A.D."
// *Cause:
// *Action:
01816, 00000, "month may only be specified once"
// *Cause:
// *Action:
01817, 00000, "day of week may only be specified once"
// *Cause:
// *Action:
01818, 00000, "'HH24' precludes use of meridian indicator"
// *Cause:
// *Action:
01819, 00000, "signed year precludes use of BC/AD"
// *Cause:
// *Action:
01820, 00000, "format code cannot appear in date input format"
// *Cause:
// *Action:
01821, 00000, "date format not recognized"
// *Cause:
// *Action:
01822, 00000, "era format code is not valid with this calendar"
// *Cause:
// *Action:
/
/	 1830 - 1899 Failed input conversions
/
01830, 00000, "date format picture ends before converting entire input string"
// *Cause:
// *Action:
01831, 00000, "year conflicts with Julian date"
// *Cause:
// *Action:
01832, 00000, "day of year conflicts with Julian date"
// *Cause:
// *Action:
01833, 00000, "month conflicts with Julian date"
// *Cause:
// *Action:
01834, 00000, "day of month conflicts with Julian date"
// *Cause:
// *Action:
01835, 00000, "day of week conflicts with Julian date"
// *Cause:
// *Action:
01836, 00000, "hour conflicts with seconds in day"
// *Cause:
// *Action:
01837, 00000, "minutes of hour conflicts with seconds in day"
// *Cause:
// *Action:
01838, 00000, "seconds of minute conflicts with seconds in day"
// *Cause:
// *Action:
01839, 00000, "date not valid for month specified"
// *Cause:
// *Action:
01840, 00000, "input value not long enough for date format"
// *Cause:
// *Action:
01841, 00000, "(full) year must be between -4713 and +9999, and not be 0"
// *Cause: Illegal year entered
// *Action: Input year in the specified range
01842, 00000, "quarter must be between 1 and 4"
// *Cause:
// *Action:
01843, 00000, "not a valid month"
// *Cause:
// *Action:
01844, 00000, "week of year must be between 1 and 52"
// *Cause:
// *Action:
01845, 00000, "week of month must be between 1 and 5"
// *Cause:
// *Action:
01846, 00000, "not a valid day of the week"
// *Cause:
// *Action:
01847, 00000, "day of month must be between 1 and last day of month"
// *Cause:
// *Action:
01848, 00000, "day of year must be between 1 and 365 (366 for leap year)"
// *Cause:
// *Action:
01849, 00000, "hour must be between 1 and 12"
// *Cause:
// *Action:
01850, 00000, "hour must be between 0 and 23"
// *Cause:
// *Action:
01851, 00000, "minutes must be between 0 and 59"
// *Cause:
// *Action:
01852, 00000, "seconds must be between 0 and 59"
// *Cause:
// *Action:
01853, 00000, "seconds in day must be between 0 and 86399"
// *Cause:
// *Action:
01854, 00000, "julian date must be between 1 and 5373484"
// *Cause: An invalid Julian date was entered.
// *Action: Enter a valid Julian date between 1 and 5373484.
01855, 00000, "AM/A.M. or PM/P.M. required"
// *Cause:
// *Action:
01856, 00000, "BC/B.C. or AD/A.D. required"
// *Cause:
// *Action:
01857, 00000, "not a valid time zone"
// *Cause:
// *Action:
01858, 00000, "a non-numeric character was found where a numeric was expected"
// *Cause: The input data to be converted using a date format model was
//  incorrect.  The input data did not contain a number where a number was
//  required by the format model.
// *Action:  Fix the input data or the date format model to make sure the
//  elements match in number and type.  Then retry the operation.
01859, 00000, "a non-alphabetic character was found where an alphabetic was expected"
// *Cause: The input data to be converted using a date format model was
//  incorrect.  The input data did not contain a letter where a letter was
//  required by the format model.
// *Action:  Fix the input data or the date format model to make sure the
//  elements match in number and type.  Then retry the operation.
01860, 00000, "week of year must be between 1 and 53"
// *Cause:
// *Action:
01861, 00000, "literal does not match format string"
// *Cause:  Literals in the input must be the same length as literals in
//  the format string (with the exception of leading whitespace).  If the 
//  "FX" modifier has been toggled on, the literal must match exactly, 
//  with no extra whitespace.
// *Action: Correct the format string to match the literal.
01862, 00000, "wrong number of digits for this format item"
// *Cause: The number of digits used for this format item is not equal
//  to the number necessary for this format when specifying
//  Format eXact ("FX") for this item.
// *Action: Fill out this format item with leading zeros to the number
//  necessary for this format.  (This is generally the number of
//  characters in the format code--DD needs 2 digits, for
//  example.  The exceptions are HH24 & HH12, which
//  both need 2, and J, which needs 9.)
01864, 00000, "the date is out of range for the current calendar"
// *Cause: Your calendar doesn't extend to the specified date.
// *Action: Specify a date which is legal for this calendar.
01865, 00000, "not a valid era"
// *Cause: Era input does not match a known era.
// *Action: Provide a valid era on input.
01866, 00000, "the datetime class was invalid"
// *Document: NO
// *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
01867, 00000, "the interval was invalid"
// *Cause: The character string you specified is not a valid interval.
// *Action: Please specify a valid interval.
01868, 00000, "the leading precision of the interval was too small"
// *Cause: The leading precision of the interval is too small to store the
//  specified interval.
// *Action: Increase the leading precision of the interval or specify an
//  interval with a smaller leading precision.
01869, 00000, "reserved for future use"
// *Cause:
// *Action:
01870, 00000, "the intervals or datetimes were not mutually comparable"
// *Cause: The intervals or datetimes are not mutually comparable.
// *Action: Specify a pair of intervals or datetimes that are mutually
//  comparable.
01871, 00000, "the number of seconds must be less than 60"
// *Cause: The number of seconds specified was greater than 59.
// *Action: Specify a value for seconds that is 59 or smaller.
01872, 00000, "reserved for future use"
// *Cause:
// *Action:
01873, 00000, "the leading precision of the interval was too small"
// *Cause: The leading precision of the interval is too small to store the
//  specified interval.
// *Action: Increase the leading precision of the interval or specify an
//  interval with a smaller leading precision.
01874, 00000, "time zone hour must be between -12 and 14"
// *Cause: The time zone hour specified was not in the valid range.
// *Action: Specify a time zone hour between -12 and 14.
01875, 00000, "time zone minute must be between -59 and 59"
// *Cause: The time zone minute specified was not in the valid range.
// *Action: Specify a time zone minute between -59 and 59.
01876, 00000, "year must be at least -4713"
// *Cause: The specified year was not in range.
// *Action: Specify a year that is greater than or equal to -4713.
01877, 00000, "string is too long for internal buffer"
// *Document: NO
// *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
01878, 00000, "specified field not found in datetime or interval"
// *Cause: The specified field was not found in the datetime or interval.
// *Action: Make sure that the specified field is in the datetime or interval.
01879, 00000, "the hh25 field must be between 0 and 24"
// *Cause: The specified hh25 field was not in the valid range.
// *Action: Specify an hh25 field between 0 and 24.
01880, 00000, "the fractional seconds must be between 0 and 999999999"
// *Cause: The specified fractional seconds were not in the valid range.
// *Action: Specify a value for fractional seconds between 0 and 999999999.
01881, 00000, "time zone region ID is invalid"
// *Cause: The region ID referenced an invalid region.
// *Action: Contact Oracle Support Services.
01882, 00000, "time zone region not found"
// *Cause: The specified region name was not found.
// *Action: Contact Oracle Support Services.
01883, 00000, "overlap was disabled during a region transition"
// *Cause: The region was changing state and the overlap flag
//         was disabled.
// *Action: Contact Oracle Support Services.
01884, 00000, "divisor is equal to zero"
// *Cause: An attempt was made to divide by zero.
// *Action: Avoid zero divisor.
01890, 00000, "NLS error detected"
// *Cause: An NLS error was detected.
// *Action: Look for additional error messages and take appropriate action.
//  If there are no additional errors, call Oracle Support Services.
01891, 00000, "Datetime/Interval internal error"
// *Document: NO
// *Cause: Internal error.
// *Action: Contact Oracle Support Services.
01898, 00000, "too many precision specifiers"
// *Cause: While trying to truncate or round dates, extra data was found in the
//  date format picture
// *Action: Check the syntax of the date format picture and retry.
01899, 00000, "bad precision specifier"
// *Cause:
// *Action:
/
02083, 00000, "database name has illegal character '%s'"
// *Cause:  Supplied database name can contain only A-Z, 0-9, '_', '#', '$'
//          '.' and '@' characters.
// *Action:
02084, 00000, "database name is missing a component"
// *Cause:  Supplied database name cannot contain a leading '.',
//          trailing '.' or '@', or two '.' or '@' in a row.
// *Action:
/
/
/ Error numbers 4020 to 4029 are reserved for KGL* (library cache manager).
/
04020, 00000, "deadlock detected while trying to lock object %s%s%s%s%s"
// *Cause:  While trying to lock a library object, a deadlock is detected.
// *Action: Retry the operation later.
04021, 00000, "timeout occurred while waiting to lock object %s%s%s%s%s"
// *Cause:  While waiting to lock a library object, a timeout is occurred.
// *Action: Retry the operation later.
04022, 00000, "nowait requested, but had to wait to lock dictionary object"
// *Cause:  Had to wait to lock a library object during a nowait request.
// *Action: Retry the operation later.
04028, 00000, "cannot generate diana for object %s%s%s%s%s"
// *Cause:  Cannot generate diana for an object because of lock conflict.
// *Action: Please report this error to your support representative.
04029, 00000, "error ORA-%s occurred when querying %s%s%s"
// *Cause:  The table or view being queried might be missing.  The error
//          number indicates the error.
// *Action: Fix the error.
/
/
/ Error numbers from 4030 to 4039 are reserved for KGH* (heap manager).
/
04030, 00000, "out of process memory when trying to allocate %s bytes (%s,%s)"
// *Cause:  Operating system process private memory has been exhausted
// *Action: 
04031, 00000, "unable to allocate %s bytes of shared memory (\"%s\",\"%s\",\"%s\")"
// *Cause:  More shared memory is needed than was allocated in the shared
//          pool.
// *Action: Either use the dbms_shared_pool package to pin large packages,
//          reduce your use of shared memory, or increase the amount of
//          available shared memory by increasing the value of the
//          init.ora parameter "shared_pool_size".
/
/
/ More error numbers that are used by existing KG components.
/
04054, 00000, "database link %s does not exist"
// *Cause:  During compilation of a PL/SQL block, an attempt was made to use
//          a non-existent database link.
// *Action: Either use a different database link or create the database link.
/
/
/ Error numbers 4060 to 4069 are reserved for KGI* (instantiation manager).
/
04060, 00000, "insufficient privileges to execute %s"
// *Cause:  Attempt to execute a stored procedure without
//          sufficient privileges.
// *Action: Get necessary privileges.
04061, 00000, "existing state of %s has been invalidated"
// *Cause:  Attempt to resume the execution of a stored procedure using the
//          existing state which has become invalid or inconsistent
//          with the stored procedure because the procedure has been altered
//          or dropped.
// *Action: Try again; this error should have caused the existing state of
//          all packages to be re-initialized.
04062, 00000, "timestamp of %s has been changed"
// *Cause:  Attempt to execute a stored procedure to serve
//          an RPC stub which specifies a timestamp that is different from the
//          current timestamp of the procedure.
// *Action: Recompile the caller in order to pick up the new timestamp.
04063, 00000, "%s has errors"
// *Cause:  Attempt to execute a stored procedure or use a view that has
//          errors.  For stored procedures, the problem could be syntax errors
//          or references to other, non-existent procedures.  For views,
//          the problem could be a reference in the view's defining query to
//          a non-existent table.
// *Action: Fix the errors and/or create referenced objects as necessary.
04064, 00000, "not executed, invalidated %s"
// *Cause:  Attempt to execute a stored procedure that has
//          been invalidated.
// *Action: Recompile it.
04065, 00000, "not executed, altered or dropped %s"
// *Cause:  Attempt to execute a stored procedure that has
//          been altered or dropped thus making it not callable from the
//          calling procedure.
// *Action: Recompile its dependents.
04066, 00000, "non-executable object, %s"
// *Cause:  Attempt to execute a non-procedure.
// *Action: Make sure that a correct name is given.
04067, 00000, "not executed, %s does not exist"
// *Cause:  Attempt to execute a non-existent stored procedure.
// *Action: Make sure that a correct name is given.
04068, 00000, "existing state of packages%s%s%s has been discarded"
// *Cause:  One of errors 4060 - 4067 when attempt to execute a stored
//          procedure.
// *Action: Try again after proper re-initialization of any application's
//          state.
/
/
/ Error numbers from 10000 to 10999 are reserved for debugging event numbers.
/
10020, 00000, "partial link restored to linked list (KSG)"
// *Cause:
// *Action:
/
10049, 00000, "protect library cache memory heaps"
// *Cause:
// *Action: Use the OS memory protection (if available) to protect library
//          cache memory heaps that are pinned.
/
10065, 00000, "limit library cache dump information for state object dump"
// *Cause:
// *Action: level 1 - minimal (only the address of state objects)
//          level 2 - little more (no object details)
//          level 3 - normal
/
10235, 00000, "check memory manager internal structures"
// *Cause:
// *Action: 
/
10238, 00000, "instantiation manager"
// *Cause:
// *Action:
/
/
/============================================================================
/       19200 - 19219 Reserved for XMLGEN and XMLAGG error messages
/
/       Begin messages for DBMS_XML errors
/============================================================================
/
19200, 00000, "Invalid column specification"
// *Cause:  All input arguments must be valid columns 
// *Action: Specify a valid list of columns 
19201, 00000, "Datatype not supported"
// *Cause:  The particular datatype is not supported in the XMLGEN operator 
// *Action: Specify only supported datatypes as arguments to the XMLGEN operator
19202, 00000, "Error occurred in XML processing%s"
// *Cause:  An error occurred when processing the XML function 
// *Action: Check the given error message and fix the appropriate problem
19203, 00000, "Error occurred in DBMS_XMLGEN processing%s"
// *Cause:  An error occurred when processing the DBMS_XMLGEN functions 
// *Action: Check the given error message and fix the appropriate problem
19204, 00000, "Non-scalar value '%s' is marked as XML attribute"
// *Cause:  Only scalar values (i.e. values which are not of object or collection type) can be marked as XML attribute,i.e. is prefixed by '@'. In this case, a non-scalar value was prefixed with '@'
// *Action: Remove the '@' sign, or make the value a scalar.
19205, 00000, "Attribute '%s' qualifies a non-scalar value in the select list"
// *Cause:  The attribute immediately follows a value of object or collection type in the select list or type definition.
// *Action: Remove the '@' sign, or make the previous value a scalar.
19206, 00000, "Invalid value for query or REF CURSOR parameter"
// *Cause: The queryString argument passed to DBMS_XMLGEN.newContext was not a valid query, or REF CURSOR.
// *Action: Rewrite the query so that the queryString argument is a valid query or REF CURSOR.
19207,  00000, "scalar parameter %s of XMLELEMENT cannot have an alias."
// *Cause: The scalar parameter to XMLELEMENT has been qualified with an alias.
// *Action: Remove the AS clause of the scalar element.
19208,  00000, "parameter %s of function %s must be aliased"
// *Cause: The indicated parameter of the XML generation function has not been aliased, although it is an expression.
// *Action: Specify an alias for the expression using the AS clause.
19209,  00000, "invalid or unsupported formatting argument"
// *Cause: An invalid or unsupported formatting argument was supplied
// *Action: Change the formatting argument to legal supported values
19210,  00000, "column '%s', specified to be a key or update column for DBMS_XMLSTORE, does not not exist in table '%s'"
// *Cause: The column specified using setKeyColumn()/setUpdateColumn() did not exist in the table.
// *Action: Change the column specified to be a column in the table
19211,  00000, "column '%s', specified as key using DBMS_XMLSTORE.setKeyColumn() , must be of scalar type"
// *Cause: The column specified using setKeyColumn() was a non-scalar type column.
// *Action: Change the column specified to be a scalar column in the table
19212,  00000, "no key columns specified before call to DBMS_XMLSTORE.updateXML()"
// *Cause: No columns were specified as key columns before the call to DBMS_XMLSTORE.updateXML.
// *Action: Use DBMS_XMLSTORE.setKeyColumn() to specify key columns
/
/ Error numbers from 21300 to 21499 are reserved.
/
/ Error numbers from 21300 to 21305 are reserved for KOK (common).
/
21300, 00000, "objects option not installed"
// *Cause: The objects option is not installed at this site.  Object types
//         and other object features are, therefore, unavailable.
// *Action: Install the objects option.  The objects option is not      
//          part of the Oracle Server product and must be purchased
//          separately.  Contact an Oracle sales representative if the
//          objects option needs to be purchased. 
21301, 00000, "not initialized in object mode"
// *Cause:  This function requires the oci process to be initialized in object
//          mode.
// *Action: Specify OCI_OBJECT mode when calling OCIInitialize().
/
/
/ Error number 21500 is the OCI's or Cartridge Service internal error.
/ Error number 21501 is the OCI's or Cartridge Services' memory allocation error. 
/ Error number 21503 is the OCI's or Cartridge Service fatal error.
/
21500, 00000, "internal error code, arguments: [%s], [%s], [%s], [%s], [%s], [%s], [%s], [%s]"
// *Cause:  This is the generic error number for the OCI
//          environment (client-side) internal errors.  This indicates
//          that the OCI environment has encountered an exceptional
//          condition.
// *Action: Report as a bug - the first argument is the internal error number.
/
21501, 00000, "program could not allocate memory"
// *Cause: The operating system has run out of memory.
// *Action: Take action to make more memory available to the program.
/
21503, 00000, "program terminated by fatal error"
// *Cause:  A program is in an unrecoverable error state.
// *Action: Report as a bug.
/
/
/ Error numbers from 21505 to 21519 are reserved for ORIG/KOG (general).
/
/
/ Error numbers from 21520 to 21559 are reserved for KOD/KOFD/KOUD (data).
/
21520, 00000, "database server driver not installed"
// *Cause:  User attempted to access a database server through an object-mode
//          OCI environment but the necessary driver for supporting such
//          access to the database server is not installed or linked
//          in.
// *Action: Check if the driver corresponding to the database server
//          has been installed/linked in and entered in the server driver
//          table.
21521, 00000, "exceeded maximum number of connections in OCI (object mode only)"
// *Cause:  User exceeded the maximum number of connections (255) that can
//          be supported by an OCI environment in object mode.
// *Action: Close some of existing and unused connections before
//          opening more connections.
21522, 00000, "attempted to use an invalid connection in OCI (object mode only)"
// *Cause:  User attempted to use an invalid connection or a connection that
//          has been terminated in an OCI environment (object mode),
//          or user attempted to dereference a REF obtained from a connection
//          which has been terminated.
// *Action: Ensure that the connection exists and is still valid.
21523, 00000, "functionality not supported by the server (object mode only)"
// *Cause:  User attempted to use a functionality that the server does not
//          support.
// *Action: Upgrade the server
21524, 00000, "object type mismatch"
// *Cause:  The object type of the object is different from what is specified.
// *Action: Check the type of the object and correct it.
21525, 00000, "attribute number (or collection element at index) %s violated its constraints"
// *Cause:  Attribute value or collection element value violated its 
//          constraint.
// *Action: Change the value of the attribute or collection element such that
//          it meets its constraints. The constraints are specified as part
//          of the attribute or collection element's schema information.
21526, 00000, "initialization failed"
// *Cause:  The initialization sequence failed.  This can happen, for example,
//          if an environment variable such as NLS_DATE_FORMAT is set to
//          an invalid value.  
// *Action: Check that all NLS environment variables are well-formed.
21527, 00000, "internal OMS driver error"
// *Cause:  A process has encountered an exceptional condition. This is the 
//          generic internal error number for Oracle object management 
//          services exceptions.
// *Action: Report this as a bug to Oracle Support Services.
/
/
/ Error numbers from 21560 to 21599 are reserved for
/ common ORI/ORT/ORL/ORC/KO and Cartridge Service errors.
/
21560, 00000, "argument %s is null, invalid, or out of range"
// *Cause:  The argument is expecting a non-null, valid value but the
//          argument value passed in is null, invalid, or out of range.
//          Examples include when the LOB/FILE positional or size
//          argument has a value outside the range 1 through (4GB - 1),
//          or when an invalid open mode is used to open a file, etc.
// *Action: Check your program and correct the caller of the routine
//          to not pass a null, invalid or out-of-range argument value.
/
21562, 00000, "column %s has unsupported data type %s"
// *Cause: A data type was specified which is currently unsupported.
// *Action: Choose another data type which is supported.
/
21563, 00000, "Error %s while calling %s for column %s with datatype %s"
// *Cause: OCI Error encountered while performing data type conversion.
// *Action: Check the OCI Error code
/
21570, 00000, "current %s LCR has unreceived chunk data"
// *Cause:  The client did not receive all the chunk data for the current 
//          LCR.
// *Action: If OCIXStreamOutLCRCallbackReceive is used in your program then
//          modify your callback functions to return OCI_CONTINUE while
//          OCI_XSTREAM_MORE_ROW_DATA flag is set; otherwise, modify your
//          program to call OCIXStreamOutChunkReceive until all the chunks are
//          received (that is, the flag returned by OCIXStreamOutChunkReceive 
//          API does not have OCI_XSTREAM_MORE_ROW_DATA bit set). 
/
21571, 00000, "must provide a LOB WRITE, LOB TRIM or LOB ERASE LCR in %s call (input LCR=%s)"
// *Cause:  An attempt was made to invoke the specified function without
//          providing a piece-wise LOB LCR (for example, LOB WRITE, 
//          LOB TRIM or LOB ERASE LCR).
// *Action: Correct the 'row_lcrp' argument in the call.
/
21573, 00000, "Invalid command type (%s) when sending a chunk."
// *Cause:  An attempt was made to send a chunk when the command type for 
//          the current LCR was not INSERT, UPDATE, or LOB WRITE.
// *Action: Check your program and provide an LCR with a valid command type to 
//          OCIXStreamInChunkSend call or to OCICallbackXStreamInChunkCreate
//          callback. 
/
21574, 00000, "Invalid data type (%s) specified for LOB chunk."
// *Cause:  Invalid data type specified for LOB chunk in 
//          OCIXStreamInChunkSend call.
// *Action: Check your program and provide either SQLT_CHR or SQLT_BIN for
//          'coldty' argument to OCIXStreamInChunkSend call.
/
21577, 00000, "Input %s LCR has no LOB column."
// *Cause:  An attempt was made to invoke OCILCRLobInfoGet call
//          with an LCR that had no LOB column.
// *Action: Replace the input LCR to OCILCRLobInfoGet call.
/
21578, 00000, "Only one LOB column allowed per %s LCR." 
// *Cause:  An attempt was made to set multiple LOB columns on a 
//          piece-wise LOB LCR.
// *Action: Check your program and make sure OCIXStreamInChunkSend is called
//          for only one column per piece-wise LOB LCR.
/
21579, 00000, "Input LCR must have at least one old or new column." 
// *Cause:  An attempt was made to call OCIXStreamInChunkSend with an
//          LCR that had empty column lists. 
// *Action: Use OCILCRRowColumnInfoSet to add one or more columns to the 
//          input LCR before calling OCIXStreamInChunkSend.
/
21580, 00000, "The LOB operation length (value=%s) for column (%s) must be an even number of bytes." 
// *Cause:  An attempt was made to call OCIXStreamInChunkSend with an
//          odd number of bytes for a column flagged as AL16UTF16 or NCLOB.
// *Action: Correct either the LOB column length or 'column_flag' argument to 
//          OCIXStreamInChunkSend call.
/
21583, 00000, "invalid XStream server name '%s'" 
// *Cause:  An attempt was made to attach to an XStream server with a
//          nonexistent server name.
// *Action: Correct the server name in the attach call.
/
/ Error numbers from 21600 to 21699 are reserved for ORI*/KOI* (interface)
/ and Memory/Duration Cartridge Service
/
21600, 00000, "path expression too long"
// *Cause:  The path expression that is supplied by the user is too long. The
//          path expression is used to specify the position of an attribute in
//          an object. This error occurs when one of the intermediate elements
//          in the path expression refers to an attribute of a built-in type.
//          Thus, the OCI function cannot proceed on to process the rest of the
//          elements in the path expression.
// *Action: User should pass in the correct path expression to locate the
//          attribute.
21601, 00000, "attribute is not an object"
// *Cause:  The user attempts to perform an operation (that is valid only for
//          an object) to an attribute of a built-in type.
//          An example of such an illegal operation is to dynamically set
//          a null structure to an attribute of a built-in type.
// *Action: User should avoid performing such operation to an attribute of
//          built-in type.
21602, 00000, "operation does not support the specified typecode"
// *Cause:  The user attempts to perform an operation that does not support
//          the specified typecode.
// *Action: User should use the range of valid typecodes that are supported
//          by this operation.
21603, 00000, "property id [%s] is invalid"
// *Cause:  The specified property id is invalid.
// *Action: User should specify a valid property id. Valid property ids are
//          enumerated by OCIObjectPropId.
21604, 00000, "property [%s] is not a property of transient or value instances"
// *Cause:  Trying to get a property which applies only to persistent objects.
// *Action: User should check the lifetime and only get this property for
//          persistent objects.
21605, 00000, "property [%s] is not a property of value instances"
// *Cause:  Trying to get a property which applies only to persistent 
//          and transient objects.
// *Action: User should check the lifetime and only get this property for
//          persistent and transient objects.
21606, 00000, "can not free this object"
// *Cause:  Trying to free an object that is persistent and dirty and the 
//          OCI_OBJECTFREE_FORCE flag is not specified.
// *Action: Either flush the persistent object or set the flag to 
//          OCI_OBJECTFREE_FORCE
/
21607, 00000, "memory cartridge service handle not initialized"
// *Cause:  Attempt to use the handle without initializing it.
// *Action: Initialize the memory cartridge service handle.
21608, 00000, "duration is invalid for this function"
// *Cause:  Attempt to use a duration not valid for this function.
// *Action: Use a valid duration - a previously created user duration or
//	    OCI_DURATION_STATEMENT or OCI_DURATION_SESSION.  For callout
//	    duration or external procedure duration, use 
//	    OCIExtProcAllocCallMemory.
21609, 00000, "memory being resized without being allocated first"
// *Cause:  Attempt to resize memory without allocating it first.
// *Action: Allocate the memory first before resizing it.
21610, 00000, "size [%s] is invalid"
// *Cause:  Attempt to resize memory with invalid size.
// *Action: Pass in a valid size (must be a positive integer).
21611, 00000, "key length [%s] is invalid"
// *Cause:  Attempt to use an invalid key length.
// *Action: Key length is invalid and valid range is 0 to 64 
21612, 00000, "key is already being used" 
// *Cause:  Attempt to use a key that is already used.
// *Action: Use a new key that is not yet being used.
21613, 00000, "key does not exist"
// *Cause:  Attempt to use a non-existent key
// *Action: Use a key that already exists.
/
/ Error numbers from 21700 to 21799 are reserved for KOC (cache).
/
21700, 00000, "object does not exist or is marked for delete"
// *Cause:  User attempted to perform an inappropriate operation to
//          an object that is non-existent or marked for delete. 
//          Operations such as pinning, deleting and updating cannot be
//          applied to an object that is non-existent or marked for delete.
// *Action: User needs to re-initialize the reference to reference an
//          existent object or the user needs to unmark the object.
21701, 00000, "attempt to flush objects to different servers"
// *Cause:  User attempted to flush objects to different servers in one 
//          function call.  These objects are obtained by calling a callback 
//          functions provided by the program.
// *Action: User should avoid performing such operation. 
21702, 00000, "object is not instantiated or has been de-instantiated in cache"
// *Cause:  User attempted to perform an inappropriate operation to a transient
//          object that is not instantiated in the object cache.
//          Operations that cannot be applied to a not-instantiated transient
//          object include deleting or pinning such an object.
// *Action: User should check their code to see if they are performing
//          such an operation without instantiating the object first, or
//          performing such an operation after the allocation duration of
//          the object has expired.
21703, 00000, "cannot flush an object that is not modified"
// *Cause:  See the error message.
// *Action: The object should not be flushed.
21704, 00000, "cannot terminate cache or connection without flushing first"
// *Cause:  See the error message.
// *Action: The transaction should be aborted or committed before terminating
//          the cache or connection.
21705, 00000, "service context is invalid"
// *Cause:  The service context that is supplied by the user is not valid.
// *Action: User needs to establish the service context.
21706, 00000, "duration does not exist or is invalid"
// *Cause:  The duration number that is supplied by the user is not valid.
// *Action: User needs to establish the duration or use a correct predefined
//          duration.
21707, 00000, "pin duration is longer than allocation duration"
// *Cause:  The pin duration supplied by the user is longer than the allocation
//          duration. This affects operations such as pinning and setting
//          default parameters.
// *Action: User should use a shorter pin duration or use the null duration.
21708, 00000, "inappropriate operation on a transient object"
// *Cause:  User attempted to perform an inappropriate operation on a
//          transient object.  Operations that cannot be applied to a
//          transient object include flushing and locking.
// *Action: User should avoid performing such operation on a transient object.
21709, 00000, "cannot refresh an object that has been modified"
// *Cause:  User attempted to refresh an object that has been marked for
//          delete, update or insert (new).
// *Action: User should unmark the object before refreshing it.
21710, 00000, "argument is expecting a valid memory address of an object"
// *Cause:  The object memory address that is supplied by the user is invalid.
//          The user may have passed in a bad memory address to a function that
//          is expecting a valid memory address of an object.
// *Action: User should pass in a valid memory address of an object
//          to the function.
/
/
21779, 00000, "duration not active"
// *Cause:  User is trying to use a duration that has been terminated.
// *Action: User should avoid performing such operation.
/
/
/ Error numbers from 21800 to 21999 are reserved.
/
/
/ Error numbers from 22000 to 22299 are reserved for ORL/KOL (language)
/ including OCIDate, OCINumber, OCIColl, OCITable, and OCIArray.
/
22053, 00000, "overflow error"
// *Cause: This operation's result is above the range of Oracle number.
// *Action: Decrease the input value(s) so that the result is in the range 
//          of Oracle number.
/
22054, 00000, "underflow error"
// *Cause: This operation's result is below the range of Oracle number.
// *Action: Increase the input value(s) so that the result is in the range 
//          of Oracle number.
/
22055, 00000, "unknown sign flag value [%s]"
// *Cause:  Signed flag used is not OCI_NUMBER_SIGNED or OCI_NUMBER_UNSIGNED.
// *Action: Use either OCI_NUMBER_SIGNED or OCI_NUMBER_UNSIGNED as sign flag.
/
22056, 00000, "value [%s] is divided by zero"
// *Cause:  Given value is divied by zero.
// *Action: Modify divisor value to be non-zero.
/
22057, 00000, "bad integer length [%s]"
// *Cause:  The length of the integer (ie number of bytes) to be converted
//          to or from an Oracle number is invalid.
// *Action: Use integer length 1, 2, 4 or 8 bytes only.
/
22059, 00000, "buffer size [%s] is too small - [%s] is needed"
// *Cause:  The buffer to hold the resulting text string is too small.
// *Action: Provide a buffer of the required size.
/
22060, 00000, "argument [%s] is an invalid or uninitialized number"
// *Cause:  An invalid or uninitialized number is passed in.
// *Action: Use a valid number. To initialize number call OCINumberSetZero().
/
22061, 00000, "invalid format text [%s]"
// *Cause:  The numeric format string for converting characters to or
//          from an Oracle number is invalid.
// *Action: Use valid format string as documented in OCI Programmer's Guide.
/
22062, 00000, "invalid input string [%s]"
// *Cause:  The text string for converting to numbers is invalid.
// *Action: Use a valid input string as documented in OCI Programmer's Guide.
/
22063, 00000, "reading negative value [%s] as unsigned"
// *Cause:  Attempt to convert a negative number to an unsigned integer.
// *Action: Use the sign flag ORLTSB to convert a signed number.
/
22064, 00000, "invalid NLS parameter string [%s]"
// *Cause:  The NLS parameter string for converting characters to or
//          from an Oracle number is invalid.
// *Action: Use valid format string as documented in OCI Programmer's Guide.
/
22065, 00000, "number to text translation for the given format causes overflow"
// *Cause:  Rounding done due to the given string format causes overflow.
// *Action: Change the format such that overflow does not occur. 
/
22130, 00000, "buffer size [%s] is less than the required size [%s]"
// *Cause:  The size of the buffer into which the hexadecimal REF string
//          is to be written is too small.
// *Action: Provide a buffer of the required size.
/
22131, 00000, "hexadecimal string length is zero"
// *Cause:  The given hexadecimal string length must be greater than zero.
// *Action: Specify a length greater than zero.
/
22132, 00000, "hexadecimal string does not correspond to a valid REF"
// *Cause:  The given hexadecimal string is invalid.
// *Action: Provide a valid hexadecimal string which was previously returned
//          by a call to OCIRefToHex().
/
22140, 00000, "given size [%s] must be in the range of 0 to [%s]"
// *Cause:  The given resize size is invalid.
// *Action: Ensure that the given size is in the required range.
/
22141, 00000, "given size [%s] must be even in UTF-16 environment"
// *Cause:  The given resize size is odd. In a UTF-16 environment, all
//          characters are 2 bytes in length.
// *Action: Ensure that the given size is even.
/
22150, 00000, "variable-length array has not been initialized"
// *Cause:  An un-initialized variable-length array is being operated upon.
// *Action: Initialize the variable-length array prior to calling 
//          this function.
/
22151, 00000, "cannot resize non-zero variable-length array to zero elements"
// *Cause:  Trying to resize a non-zero variable-length array to 0 elements.
// *Action: Specify a non-zero size.
/
22152, 00000, "destination variable-length array is not initialized"
// *Cause:  The variable-length array on the right-hand-side of an 
//          assignment or the destination array of an append
//          is not initialized.
// *Action: Initialize the destination variable-length array prior to calling
//          this function.
/
22153, 00000, "source variable-length array is not initialized"
// *Cause:  The variable-length array on the left-hand-side of an 
//          assignment or the source array of an append
//          is not initialized.
// *Action: Initialize the destination variable-length array prior to calling
//          this function.
/
22160, 00000, "element at index [%s] does not exist"
// *Cause:  Collection element at the given index does not exist.
// *Action: Specify the index of an element which exists.
/
22161, 00000, "type code [%s] is not valid"
// *Cause:  Given type code is not valid.
// *Action: Use one of the typecodes enumerated in OCITypeCode.
/
22162, 00000, "element at index [%s] has been previously deleted"
// *Cause:  Trying to delete a non-existent collection element.
// *Action: Check for the existence of the element prior to calling this
//          function.
/
22163, 00000, "left hand and right hand side collections are not of same type"
// *Cause:  Left hand and right side collections are not of same type.
// *Action: Ensure that the same collection type is passed for both left
//          hand and right hand side of this function.
/
22164, 00000, "delete element operation is not allowed for variable-length array"
// *Cause:  Trying to delete an element of a variable-length array.
// *Action: Ensure that the collection is not a variable-length array prior
//          to calling this function.
/
22165, 00000, "given index [%s] must be in the range of [%s] to [%s]"
// *Cause:  Given index is not in the required range.
// *Action: Ensure that the given index is in the required range.
/
22166, 00000, "collection is empty"
// *Cause:  Given collection is empty.
// *Action: Test if collection is empty prior to invoking this function.
/
22167, 00000, "given trim size [%s] must be less than or equal to [%s]"
// *Cause:  Given trim size is greater than the current collection size.
// *Action: Ensure that the given size is less than or equal to the 
//          collection size prior to calling this function.
/
/ 22275 to 22279 reserved for KOLL - LOBs
/
22275, 00000, "invalid LOB locator specified"
// *Cause:  There are several causes:  (1) the LOB locator was never
//          initialized; (2) the locator is for a BFILE and the routine
//          expects a BLOB/CLOB/NCLOB locator; (3) the locator is for a
//          BLOB/CLOB/NCLOB and the routine expects a BFILE locator;
//          (4) trying to update the LOB in a trigger body -- LOBs in
//          trigger bodies are read only.
// *Action: For (1), initialize the LOB locator by selecting into the locator
//          variable or by setting the LOB locator to empty.  For (2) and (3),
//          pass the correct type of locator into the routine.  For (4),
//          remove the trigger body code that updates the LOB value.
/
22276, 00000, "invalid locator for LOB buffering"
// *Cause:  There are several causes: (1) the locator was never enabled for
//          buffering (2) it is not an updated locator but is being used for
//          a write/flush operation
// *Action: For (1) enable the locator for buffering; (2) ensure that only
//          an updated locator is used for a LOB update operation
/
22277, 00000, "cannot use two different locators to modify the same LOB"
// *Cause: LOB buffering is enabled and an attempt was made to modify the  
//         LOB using two different LOB locators.  
// *Action: When using LOB buffering, modify the LOB through one LOB
//          locator only.
/
22278, 00000, "must update the LOB only through the LOB buffers"
// *Cause: LOB buffering is enabled for this LOB and there are buffers
//         for this LOB in the buffer pool.  Thus, updating the LOB
//         through means other than the LOB buffers is not allowed.
// *Action: Update the LOB through the LOB buffers using the locator that
//          has LOB buffering enabled.  If this operation is required,
//          buffers associated with this LOB should either be flushed as
//          necessary or buffering should be disabled.  Once this is done,
//          reissue the command.
/
22279, 00000, "cannot perform operation with LOB buffering enabled"
// *Cause: The operation attempted is not allowed when LOB buffering is
//         enabled.
// *Action: If the operation is required, LOB buffering should not be used.
//          In this case, flush buffers associated with the input LOB locator
//          as necessary, disable buffering on the input LOB locator and
//          reissue the command.
/
/ 22280 to 22299 reserved for LOBs - LBS(KOLB), DBMS_LOB(KKXL) and BFILE(KOLF)
/
22280, 00000, "no more buffers available for operation"
// *Cause:  There are two causes: (1) All buffers in the buffer pool have been
//          used up by previous operations (2) Attempt to flush a LOB without
//          any previous buffered update operations.
// *Action: For (1), flush the LOB(s) through the locator that is
//          being used to update the LOB.  For (2), write to the LOB through a
//          locator enabled for buffering before attempting to flush buffers.
/
22281, 00000, "cannot perform operation with an updated locator"
//  *Cause:  The input locator has buffering enabled and was used to update
//           the LOB value through the LOB buffering subsystem.  The 
//           modified buffer has not been flushed since the write that was
//           performed by the the input locator; thus, the input locator is 
//           considered an updated locator.  Updated locators cannot be the 
//           source of a copy operation.  Only one locator per LOB may be used 
//           to modify the LOB value through the LOB buffering subsystem.
//  *Action: Depending on whether the modifications made through the input
//           locator to the LOB buffering subsystem should be written to
//           the server, either flush the buffer to write the modifications,
//           or, disable buffering on the locator to discard the 
//           modifications.  Then, reissue the command.
/
22282, 00000, "non-contiguous append to a buffering enabled LOB not allowed"
// *Cause:  The buffered write operation has an input offset value more
//          than one byte or character past the end of the LOB.
// *Action: Specify an input offset value which is exactly one character or
//          byte greater than the length of the LOB that you are attempting
//          to update through a buffered write operation.
/
22285, 00000, "non-existent directory or file for %s operation"
// *Cause: Attempted to access a directory that does not exist, or attempted
//         to access a file in a directory that does not exist.
// *Action: Ensure that a system object corresponding to the specified
//          directory exists in the database dictionary, or
//          make sure the name is correct.
/
22286, 00000, "insufficient privileges on directory or file to perform %s operation"
// *Cause: The user does not have the necessary access privileges on the
//         directory alias and/or the file for the operation.
// *Action: Ask the database/system administrator to grant the required
//          privileges on the directory alias and/or the file.
/
22287, 00000, "invalid or modified directory occurred during %s operation"
// *Cause: The directory alias used for the current operation is not valid
//         if being accessed for the first time, or has been modified by
//         the DBA since the last access.
// *Action: If you are accessing this directory for the first time, provide
//          a valid directory name. If you have been already successful in
//          opening a file under this directory before this error occured,
//          then close the file and retry the operation with a valid
//          directory alias as modified by your DBA. Oracle recommends that
//          directories should be modified only during quiescent periods.
/
22288, 00000, "file operation %s failed\n%s"
// *Cause: The operation attempted on the file failed.
// *Action: See the next error message for more detailed information.  Also,
//          verify that the file exists and that the necessary privileges
//          are set for the specified operation.  If the error
//          still persists, report the error to the DBA.
/
22289, 00000, "cannot perform %s operation on an unopened file"
// *Cause: The file is not open for the required operation to be performed.
// *Action: Check that the current operation is preceded by a successful 
//          file open operation.
/
22290, 00000, "operation would exceed the maximum number of opened files"
// *Cause: The number of open files has reached the maximum limit.
// *Action: Close some of the opened files and retry the operation.
/
/
/ Error numbers from 22300 to 22599 are reserved for ORT/KOT (type).
/
22303, 00000, "type \"%s\".\"%s\" not found"
//  *Cause:  The user is trying to obtain information for a type that
//           cannot be found.
//  *Action: Check that the schema is correct and that the type has been
//           created correctly.
/
22305, 00000, "attribute/method/parameter \"%s\" not found"
//  *Cause:  Type element with the given name is not found in the type.
//  *Action: Check to make sure that the type element exists.
/
22306, 00000, "type \"%s\".\"%s\" already exists"
//  *Cause:  The user is trying to create a type that already 
//           exists.
//  *Action: Check to make sure that the type has not been created prior to
//           this.
/
22307, 00000, "type to alter is not a user-defined type"
//  *Cause:  The user is trying to alter a built-in type.
//  *Action: Check to make sure that only user-defined types
//           are being altered.
/
22309, 00000, "attribute with name \"%s\" already exists"
//  *Cause:  The user is attempting to create an object type where
//           more than one attributes have the same name.
//  *Action: Check to make sure that all attribute names are unique.
/
22311, 00000, "type for attribute \"%s\" does not exist"
//  *Cause:  The type of the attribute does not exist.
//  *Action: No types were created/modified for this DDL transaction.  Redo
//           the DDL transaction and add the creation of the attribute's type
//           in the DDL transaction.
/
22313, 00000, "cannot use two versions of the same type \"%s\""
//  *Cause:  The version of this type conflicts with the version of this
//           type used by another library that was linked in with the
//           application.  An application may only use one version of a type.
//  *Action: Check that the libraries being linked with this application and
//           use the same versions of the type.
/
22314, 00000, "method information mismatch in ALTER TYPE"
//  *Cause:  The number of methods or the method signature do not match that
//           of the original type declaration. This is not supported.
//  *Action: Make sure the method signature stay identical for the previously
//           declared method. Do not drop existing methods.
/
22315, 00000, "type \"%s\" does not contain a map or order function"
//  *Cause:  The input type does not contain a map or order function so one
//           cannot be returned.
//  *Action: Add a map or order function to the type or catch this error.
/
22316, 00000, "input type is not a collection type"
//  *Cause:  The user is trying to obtain information for collection types
//           on a non-named collection type.
//  *Action: Use a named collection type for the function.
/
22317, 00000, "typecode %d is not legal as a number type"
//  *Cause:  The user is trying to use a number typecode that is not valid.
//  *Action: Use only OCI_TYPECODE_SMALLINT, OCI_TYPECODE_INTEGER,
//           OCI_TYPECODE_REAL, OCI_TYPECODE_DOUBLE, OCI_TYPECODE_FLOAT,
//           OCI_TYPECODE_NUMBER, or OCI_TYPECODE_DECIMAL.
/
22318, 00000, "input type is not an array type"
//  *Cause:  The user is trying to obtain the number of elements for a
//           non-array type.
//  *Action: Pass in only a named collection type which is an array.
/
22319, 00000, "type attribute information altered in ALTER TYPE"
//  *Cause:  The type attribute information does not match that of the
//           original type declaration when altering type. Attributes
//           cannot be altered during ALTER TYPE. Only new methods can
//           be added.
//  *Action: Check that all type alterations are legal.
/
22321, 00000, "method does not return any result"
//  *Cause:  OCITypeResult() was called on a method that does not return any
//           results.
//  *Action: Check that you are passing in the correct method descriptor,
//           or that your method creation was done correctly.
/
22337, 00000, "the type of accessed object has been evolved"
// *Cause:  The type of the accessed object has been altered and the client's
//          object is based on an earlier type definition.
// *Action: The user needs to exit application and modify application to
//          accommodate the type change.
//          From SQL/PLUS, reconnect and resubmit statement.
/
/ Error numbers from 22350 to 22370 are reserved for ORT/KOT (Opaque Types).
/
/ Error numbers from 22369 to 22370 are used by SYS.DBMS_INDEXING.
/
22369, 00000, "invalid parameter encountered in method %s"
//  *Cause:  An invalid parameter is being passed to this method of SYS.RowType
//           or SYS.RowSet.
//  *Action: Check the parameters being passed to this method and make sure
//           that the parameters are allowed.
/
22370, 00000, "incorrect usage of method %s"
//  *Cause:  This method of SYS.RowType or SYS.RowSet is being used
//           inappropriately.
//  *Action: Check the documentation for correct usage.
/
/ Error numbers from 22600 to 22699 are reserved for KOP* (pickler) and
/ Pickler Cartridge Service.
/
22600, 00000, "encountered 8.0.2 (Beta) VARRAY data that cannot be processed"
//  *Cause:  Production Oracle8 (8.0.3 and beyond) encounters some VARRAY data
//           which was created and stored by Oracle8 8.0.2 (Beta 2).
//           Production Oracle8 cannot understand or process such VARRAY data.
//  *Action: Delete the VARRAY data from the table by dropping the table,
//           deleting the rows, or nulling out the VARRAY columns, and then
//           re-insert the VARRAY data.  There is no provided
//           script or tool to help automate this conversion.
//           
/
22601, 00000, "pickler TDS context [%s] is not initialized"
//  *Cause:  Attempt to use the pickler TDS context without initializing it.
// *Action:  Use OCIPicklerTdsCtxInit to initialize the context.
22602, 00000, "pickler TDS handle [%s] is not well-formed"
//  *Cause:  Attempt to use the pickler TDS handle without initializing/
//	     constructing it.
// *Action:  Use OCIPicklerTdsInit to initialize the handle before it is 
//	     constructed.  Use OCIPicklerTdsGenerate to generate the 
//	     TDS before its attributes can be accessed.
22603, 00000, "cannot add an attribute to the already generated TDS handle"
//  *Cause:  Attempt to add an attribute to the already constructed TDS.
// *Action:  Use a TDS handle that is initialized but not yet constructed.
22604, 00000, "TDS handle already generated"
//  *Cause:  Attempt to geneate TDS that is already genearated.
// *Action:  Use a TDS handle that is initialized but not yet generated.
22605, 00000, "FDO handle [%s] is not initialized"
//  *Cause:  Attempt to use an uninitialized FDO handle.
// *Action:  Use OCIPicklerFdoInit to initialize FDO handle".
22606, 00000, "pickler image handle [%s] is not well-formed"
//  *Cause:  Attempt to use the image handle without initializing/
//	     constructing it.
// *Action:  Use OCIPicklerImageInit to initialize the handle before it is 
//	     constructed.  Use OCIPicklerImageGenerate to generate the 
//	     image before its attributes can be accessed.
22607, 00000, "image handle already generated"
//  *Cause:  Attempt to geneate image that is already genearated.
// *Action:  Use a image handle that is initialized but not yet generated.
22608, 00000, "cannot add an attribute to the already generated image handle"
//  *Cause:  Attempt to add an attribute to the already constructed image.
// *Action:  Use an image handle that is initialized but not yet constructed.
22609, 00000, "error %s during initialization of FDO"
//  *Cause:  Error during FDO initialization.  
// *Action:  Take an action based on the specified error. 
22626, 00000, "Type Mismatch while constructing or accessing OCIAnyData"
//  *Cause:  Type supplied is not matching the type of the AnyData.
//           If piece wise construction or access is being attempted, the
//           type supplied is not matching the type of the current attribute.
// *Action:  Make sure the type supplied matches the type of object to
//           to be constucted or accessed.
/ NLS_DO_NOT_TRANSLATE [22700,22700]
22700, 00000, "object access trace event number"
// *Cause: N/A
// *Action: If the trace event number is set to a level greater than 0 then
//          all the dangling REFs are dumped.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE.  THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
/
/ Error numbers from 22700 to 22799 are reserved for debugging event numbers.
/
/ Error numbers from 22970 - 22989 Reserved for object Views
/
22975, 00000, "cannot create a PRIMARY KEY-based REF to this object view"
// *Cause:  The object view specified in the MAKE_REF function does not
//          have a PRIMARY KEY-based object identifier.  A PRIMARY KEY-based 
//          REF cannot be created for such a view.
// *Action: Specify an object view that has a PRIMARY KEY-based object 
//          identifier in the MAKE_REF function.
22976, 00000, "incorrect number of arguments to MAKE_REF"
// *Cause:  Number of arguments for MAKE_REF is different from the number
//          of PRIMARY KEY attributes of the object view.
// *Action: Specify all the necessary arguments for MAKE_REF.
/
/ Error numbers from 30100 to 30134 are reserved for OCIExtract Cartridge
/ Service.
/
30100, 00000, "internal error [%d]"
// *Cause: An internal error has occurred.
// *Action: Contact Oracle Worldwide Support and report the error.
/
30101, 00000, "unknown parameter name '%.*s'"
// *Cause: You have misspelled the parameter name.
// *Action: Spell the parameter name correctly.
/
30102, 00000, "'%.*s' is not in the legal range for '%.*s'"
// *Cause: The value of the parameter is not within the legal range.
// *Action: Refer to the manual for the allowable values for this parameter.
/
30103, 00000, "'%.*s' contains an illegal integer radix for '%.*s'"
// *Cause: An illegal integer radix specification was found.
// *Action: Only 'd', 'h', 'D', and 'H' may be used as radix specifications.
/
30104, 00000, "'%.*s' is not a legal integer for '%.*s'"
// *Cause: The value is not a valid integer.
// *Action: Specify only valid integers for this parameter.
/
30105, 00000, "'%.*s' is not a legal boolean for '%.*s'"
// *Cause: The value is not a valid boolean.
// *Action: Refer to the manual for allowable boolean values.
/
30106, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30107, 00000, "parameter name abbreviation '%.*s' is not unique"
// *Cause: The abbreviation given was not unique.
// *Action: Use a longer abbreviation to make the parameter name unique.
/
30108, 00000, "invalid positional parameter value '%.*s'"
// *Cause: An invalid positional parameter value has been entered.
// *Action: Remove the invalid positional parameter.
/
30109, 00000, "could not open parameter file '%.*s'"
// *Cause: The parameter file does not exist.
// *Action: Create an appropriate parameter file.
/
30110, 00000, "syntax error at '%.*s'"
// *Cause: A syntax error was detected.
// *Action: Change the input so that the correct syntax is used.
/
30111, 00000, "no closing quote for value '%.*s'"
// *Cause: A quoted string was begun but not finished.
// *Action: Put a closing quote in the proper location.
/
30112, 00000, "multiple values not allowed for parameter '%.*s'"
// *Cause: You attempted to specify multiple values for a parameter which can
//         take only one value.
// *Action: Do not specify more than one value for this parameter.
/
30113, 00000, "error when processing file '%.*s'"
// *Cause: A problem occurred when processing this file.
// *Action: Examine the additional error messages and correct the problem.
/
30114, 00000, "error when processing from command line"
// *Cause: A problem occurred when processing the command line.
// *Action: Examine the additional error messages and correct the problem.
/
30115, 00000, "error when processing an environment variable"
// *Cause: A problem occurred when processing an environment variable.
// *Action: Examine the additional error messages and correct the problem.
/
30116, 00000, "syntax error at '%.*s' following '%.*s'"
// *Cause: A syntax error was detected.
// *Action: Change the input so that the correct syntax is used.
/
30117, 00000, "syntax error at '%.*s' at the start of input"
// *Cause: A syntax error was detected.
// *Action: Change the input so that the correct syntax is used.
/
30118, 00000, "syntax error at '%.*s' at the end of input"
// *Cause: A syntax error was detected.
// *Action: Change the input so that the correct syntax is used.
/
30119, 00000, "unable to obtain a valid value for '%.*s'"
// *Cause: No valid value was obtained for this parameter.
// *Action: Rerun the application and enter a valid value.
/
30120, 00000, "'%.*s' is not a legal oracle number for '%.*s'"
// *Cause: The value is not a valid oracle number.
// *Action: Refer to the manual for allowable oracle number values.
/
30121, 00000, "'%.*s' is not an allowable value for '%.*s'"
// *Cause: The value is not a legal value for this parameter.
// *Action: Refer to the manual for allowable values.
/
30122, 00000, "value '%.*s' for '%.*s' must be between '%d' and '%d'"
// *Cause: The value of the parameter is not within the legal range.
// *Action: Specify a value that is within the legal range.
/
/ Error numbers from 30123 to 30128 are reserved for possible LRM message
/ expansion.
/
30129, 00000, "invalid function argument received"
// *Cause: A function received an invalid argument
// *Action: Check function calls, make sure correct arguments are being passed.
/
30130, 00000, "invalid parameter key type received"
// *Cause: A function received an invalid parameter key type
// *Action: Check parameter key types in function calls 
/
30131, 00000, "number of keys being set exceeds allocation"
// *Cause: Number of parameter keys being set exceeds allocation
// *Action: Reduce the number of keys being set or increase allocation
/
30132, 00000, "invalid key index supplied"
// *Cause: The key index specified was not within bounds
// *Action:  Change key index to ensure it lies within bounds
/
30133, 00000, "reserved for future use"
// *Cause: None.
// *Action: None.
/
30134, 00000, "reserved for future use"
// *Cause: None.
// *Action: None.
/
/ Error numbers from 30135 to 30149 are reserved for OCIThread Cartridge
/ Service.
/
30135, 00000, "OCI Thread operation fails"
// *Cause: An OCI Thread function call has failed. 
//
// *Action: Check the function call to make sure that the correct parameters 
//          are being passed and take the apropriate action.
//          
/
/ Error numbers from 30150 to 30174 are reserved for OCIFile Cartridge
/ Service.
/
/ OCIFile 30150-30174.
/ Error messages for OCIFile package.
/
30150, 00000, "Invalid argument passed to OCIFile function"
// *Cause: An invalid argument is passed to the OCIFile function. The most
//         common cause is that a NULL pointer is passed where a non-NULL
//         pointer is expected.
// *Action: Make sure that the values passed as arguments are valid. Esp
//          check for NULL pointers.
/
30151, 00000, "File already exists"
// *Cause:  Tried to open a file with OCI_FILE_EXCL flag and the file
//          already exists.
//
// *Action: OCIFile is supposed throw this exception in this case.
/
30152, 00000, "File does not exist"
// *Cause: The OCIFile function requires the file to exist, but it does not.
//
// *Action: Make sure that the file exists.
/
/
30153, 00000, "An invalid File Object is passed to the OCIFile function"
// *Cause: An invalid File Object is passed to the OCIFile function.
//
// *Action: Make sure that the file object is a valid one. Create a new
//          file object by calling OCIFileOpen if needed.
/
/
30154, 00000, "The memory address given as buffer for OCIFileRead/Write is invalid"
// *Cause: An invalid memory address is given as the buffer pointer for 
//         OCIFileRead/Write.
//
// *Action: Make sure that the required memory is allocated and pass a
//          valid memory address as buffer pointer.
/
/
30155, 00000, "An I/O Error occured during an OCIFile function call"
// *Cause: An I/O error occurred at the system level.
//
// *Action: This is a system error and the action will depnd on the error.
/
/
30156, 00000, "Out of disk space"
// *Cause: The disks associated with the underlying file system are full.
//
// *Action: Create more disk space.
/
/
30157, 00000, "An invalid argument was given to operating system call"
// *Cause: The OS call was called with an invalid argument.
//
// *Action: Check the values passed. If unsuccessful to solve the problem
//          contact ORACLE support.
/
/
30158, 00000, "The OCIFileWrite causes the file to exceed the maximum allowed size"
// *Cause: There is no space to write to the file. Its size is at the
//          maximum limit.
//
// *Action: Up to the user.
/
/
30159, 00000, "OCIFileOpen: Cannot create the file or cannot open in the requested mode"
// *Cause:  The create flag was specified in OCIFileOpen such that the file
//          was to be created. But unable to do so. Or the file already exists
//          and the permissions on it doesn't allow the file to be opened in
//          in the requested open mode
//
// *Action: Check whether the user has permissions to create the specified
//          file or if the file exists whether the permissions on it allow
//          the requested open mode.
/
/
30160, 00000, "Unable to access the file"
// *Cause: The function was unable to access the existing the file.
//
// *Action: Check if the user has the required permissions on the file.
/
/
/
30161, 00000, "A system error occurred during the OCIFile function call"
// *Cause: A system error occured while executing the OCIFile function.
//
// *Action: Depend on the error.
/
/
30162, 00000, "The OCIFile context is not initialzed"
// *Cause: The function OCIFileInit need to be called before calling any
//         other OCIFile function to initialize the OCIFile context.
//
// *Action: Call the function OCIFileInit need to be called before calling any
//          other OCIFile function.
/
30163, 00000, "The thread safety initialization failed"
// *Cause: The call to SlgInit failed in OCIFileInit.         
//
// *Action: Contact support
/
/ Error messages for the OCIFormat package: 30175-30199
/
30175, 00000, "invalid type given for an argument"
// *Cause:  There is an argument with an invalid type in the argument list.
// *Action: Use the correct type wrapper for the argument.
/
30176, 00000, "invalid format code used in the format string"
// *Cause:  There is an invalid format code in the format string.
// *Action: Replace the invalid format code with a valid one.
/
30177, 00000, "invalid flag used in a format specification"
// *Cause:  There is an invalid flag in a format specification.
// *Action: Replace the invalid flag with a valid one.
/
30178, 00000, "duplicate flag used in a format specification"
// *Cause:  There is a duplicate flag in a format specification.
// *Action: Remove the duplicate flag.
/
30179, 00000, "invalid argument index used in a format code"
// *Cause:  Zero or negative argument index or index not following (."
// *Action: Replace the invalid argument index with a valid one.
/
30180, 00000, "argument index is too large"
// *Cause:  An argument index exceeds actual number of arguments supplied.
// *Action: Fix format string or pass additional arguments.
/
30181, 00000, "integer in argument index is not immediately followed by )"
// *Cause:  Missing closing parenthesis in argument index.
// *Action: Fix the format specification.
/
30182, 00000, "invalid precision specifier"
// *Cause:  Period in format specification not followed by valid format.
// *Action: Replace the invalid precision specifier with a valid one.
/
30183, 00000, "invalid field width specifier"
// *Cause:  Invalid field width supplied.
// *Action: Replace the invalid field width with a valid one.
/
30184, 00000, "argument type not compatible with a format code"
// *Cause:  Bad argument type given for a format code.
// *Action: Make format and arguments be compatible.
/
30185, 00000, "output too large to fit in the buffer"
// *Cause:  The buffer is not large enough to hold the entire output string.
// *Action: Fix the buffer size and length passed in.
/
30186, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30187, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30188, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30189, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30190, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30191, 00000, "missing argument list"
// *Cause:  No argument list supplied.
// *Action: Modify the argument list to have at least OCIFormatEnd in it.
/
30192, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30193, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30194, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30195, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30196, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30197, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30198, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
30199, 00000, "reserved for future use"
// *Cause:  None.
// *Action: None.
/
/
/ Error numbers from 30200 to 30299 are reserved for NLS Cartridge Service.
/
/
/ Error Numbers 30931 - 31200 are reserved for Project XDB (XML Support)
/
/
/ Errors 30931 - 30979 for XMLType & schema processing
/
30930, 00000, "XML node '%s' (type=%s) does not support this operation"
// *Cause:   The given node's type is not supported for this operation.  For
//           example, trying to add children to an attribute node, or passing
//           in a document node as a child, are unsupported operations.
// *Action:  Use a valid node type for the operation.
30931, 00000, "Element '%s' cannot contain mixed text"
// *Cause:   XML elements must be declared mixed to contain multiple text nodes
// *Action:  Declare this element type as mixed in its schema
30932, 00000, "Reference node '%s' not contained in specified parent node '%s'"
// *Cause:   When using a reference node, it must have the specified parent 
//           node
// *Action:  Use a node in the specified parent as the reference
30933, 00000, "Element '%s' may not appear at this point within parent '%s'"
// *Cause:   The ordering specified by the content model of the parent does
//           not allow for this element to occur at this position.
// *Action:  Reorder the child elements to conform with the content model
//           of the parent element
30934, 00000, "'%s' (%s node) cannot be inserted in parent '%s' (%s node)"
// *Cause:   The schema does not allow a child node of this type to be inserted
//           into a parent node of this type.  For example, only element
//           nodes may only be inserted into a document
// *Action:  Insert only child nodes that make sense for this node type
30935, 00000, "XML maxoccurs value (%s) exceeded"
// *Cause:   An attempt was made to insert more than maxoccurs
//           values into a schema-based XML document.
// *Action:  Do not insert more than maxoccurs values into the document.
30936, 00000, "Maximum number (%s) of '%s' XML node elements exceeded"
// *Cause:   An attempt was made to insert more than the allowed number
//           of elements (specified by the maxoccurs facet) into an XML
//           document.
// *Action:  Do not attempt to add more than the maximum number of elements
//           to XML documents.
30937, 00000, "No schema definition for '%s' (namespace '%s') in parent '%s'"
// *Cause:   The schema definition for the parent node being processed does
//           not allow for the specified child node in its content model.
//           Note that any typecasting via xsi:type must occur before the
//           schema definitions for the new type can be used.
// *Action:  Only insert elements and attributes declared in the schema.
//           Check to make sure that xsi:type (if used) is specified first.
30938, 00000, "No prefix defined for namespace '%s' (particle %s)"
// *Cause:   An XML namespace mapping (xmlns:<prefix>=<namespace URL>) must
//           be defined for each particle (element or attribute) stored in
//           an schema-constrained XMLType document.
// *Action:  Add an xmlns attribute definition (attribute name="xmlns:prefix"
//           and value="namespace URL") to the current XMLType document.
//           The safest place to add this attribute is in the root node of
//           the document to ensure that the mapping will be in scope.
30939, 00000, "Order violation: Element '%s' may not follow element '%s'"
// *Cause:   The XML schema specifies a content model that is sequential,
//           where the order of nodes in the instance must follow the order
//           specified by the schema, and this instance relies on the schema
//           validity to avoid maintaining instance order information
// *Action:  Insert elements only in the order specified in the schema
30940, 00000, "Cannot resolve prefix '%s' for QName node '%s'"
// *Cause:   An attempt was made to store a QName value without having a
//           valid namespace in scope for that prefix.
// *Action:  Declare the namespace for the prefix used
30941, 00000, "Cannot specify empty URI for non-default namespace '%s'"
// *Cause:   An attempt was made to insert a namespace declaration for
//           a non-default namespace using an empty URI string.
// *Action:  Specify a non-empty URI for namespace declarations other than
//           the default namespace.
////////  Errors 30942 to 30950 reserved for XML Schema Evolution
30942, 00000, "XML Schema Evolution error for schema '%s' table %s column '%s'"
// *Cause:   The given XMLType table/column which conforms to the given schema
//           had errors during evolution. For more information, see the more 
//           specific error below this one
// *Action:  Based on the schema, table and column information in this error
//           and the more specific error below, take corrective action 
30943, 00000, "XML Schema '%s' is dependent on XML schema '%s'"
// *Cause:   Not all dependent schemas were specified and/or the schemas were
//           not specified in dependency order, i.e., if schema S1 is dependent
//           on schema S, S must appear before S1.
// *Action:  Include the previously unspecified schema in the list of schemas
//           and/or correct the order in which the schemas are specified. Then 
//           retry the operation.
30944, 00000, "Error during rollback for XML schema '%s' table %s column '%s'"
// *Cause:   The given XMLType table/column which conforms to the given schema
//           had errors during a rollback of XML schema evolution. For more
//           information, see the more specific error below this one
// *Action:  Based on the schema, table and column information in this error
//           and the more specific error below, take corrective action 
30945, 00000, "Could not create mapping table '%s'"
// *Cause:   A mapping table could not be created during XML schema evolution.
//           For more information, see the more specific error below this one
// *Action:  Ensure that a table with the given name does not exist and retry
//           the operation
30946, 00000, "XML Schema Evolution warning: temporary tables not cleaned up"
// *Cause:   An error occurred after the schema was evolved while cleaning up 
//           temporary tables. The schema evolution was successful
// *Action:  If the user needs to remove the temporary tables, use the mapping
//           table to get the temporary table names and drop them.
///////  End of XML Schema Evolution errors (30942 to 30950 reserved)
30951, 00000, "Element or attribute at Xpath %s exceeds maximum length"
// *Cause:   An attempt was made to insert a node of length exceeding the 
//           maximum length (specified by the maxLength facet) into 
//           an XML document.
// *Action:  Do not attempt to add a node exceeding the maximum length
//           to XML documents.
30990, 00000, "insufficient privileges to change owner of resource %s"
// *Cause:   An attempt was made to change the <Owner> field of an
//           XML DB resource without sufficient privileges to do so.
// *Action:  Switch to SYS before performing the ownership change, or have
//           the intended recipient of the resource perform the transfer.
30991, 00000, "cannot use DOM to add special attribute to schema-based parent"
// *Cause:   An attempt was made to add or remove an xsi:schemaLocation,
//           xsi:noNamespaceSchemaLocation, xsi:type, or xsi:nil attribute
//           to or from a schema-based XML node using DOM.
// *Action:  Use the updateXML operator instead of DOM.
31000, 00000, "Resource '%s' is not an XDB schema document"
// *Cause:   The given schema URL does not refer to a registered XDB schema
// *Action:  Make sure the specified schema has been registered in XDB
31001, 00000, "Invalid resource handle or path name \"%s\""
// *Cause:   An invalid resource handle or path name was passed to
//           the XDB hierarchical resolver.
// *Action:  Pass a valid resouce handle or path name to the hierarchical
//           resolver.
31002, 00000, "Path name %s is not a container"
// *Cause:   XDB expected the given path name to represent a container.
// *Action:  Pass a path name or resource handle that represents a container.
31003, 00000, "Parent %s already contains child entry %s"
// *Cause:   An attempt was made to insert a duplicate child into
//           the XDB hierarchical resolver.
// *Action:  Insert a unique name into the container.
31004, 00000, "Length %s of the BLOB in XDB$H_INDEX is below the minimum %s"
// *Cause:   In the XDB$H_INDEX table, the CHILDREN column, a BLOB, must
//           have a certain minimum length without being chained.
//           The calculated length of the LOB was less than the stated minimum.
// *Action:  Set the value of the init.ora parameter db_block_size 
//           to at least 2K.  For XDB to run at its fastest, set 
//           db_block_size to 8K.
31005, 00000, "Path name length %s exceeds maximum length %s"
// *Cause:   The length of a path name passed to the XDB hierarchical
//           resolver exceeded the maximum length.
// *Action:  Choose a shorter path name.
31006, 00000, "Path name segment length %s exceeds maximum length %s"
// *Cause:   The length of a path name segment passed to the XDB
//           hierarchical resolver exceeded the maximum length of a path
//           name segment.
// *Action:  Choose a shorter path name segment.
31007, 00000, "Attempted to delete non-empty container %s/%s"
// *Cause:   An attempt was made to delete a non-empty container in 
//           the XDB hierarchical resolver.
// *Action:  Either perform a recursive deletion, or first delete 
//           the contents of the container.
31009, 00000, "Access denied for property %s"
// *Cause:   An attempt was made to access a property you don't have access to
// *Action:  Check the ACL to see what privileges you have for this property
31010, 00000, "XML element index %s exceeds maximum insertion index %s"
// *Cause:   An attempt was made to insert an XML element at an
//           invalid index location in the node.
// *Action:  Choose a new index that falls within the allowed range.
31011, 00000, "XML parsing failed"
// *Cause:   XML parser returned an error while trying to parse the document.
// *Action:  Check if the document to be parsed is valid.
31012, 00000, "Given XPATH expression not supported"
// *Cause:   XPATH expression passed to the function is currently unsupported.
// *Action:  Check the xpath expression and change it to use a
//           supported expression.
31013, 00000, "Invalid XPATH expression"
// *Cause:   XPATH expression passed to the function is invalid.
// *Action:  Check the xpath expression for possible syntax errors. 
31014, 00000, "Attempted to delete the root container"
// *Cause:   An attempt was made to delete the root container in the 
//           hierarchical index.
// *Action:  Do not delete the root container.
31015, 00000, "Attempted to insert entry without name"
// *Cause:   An attempt was made to insert an entry into the hierarchical
//           resolver without a child name.
// *Action:  Supply a child name and try inserting again.
31016, 00000, "Attempted to delete entry without name"
// *Cause:   An attempt was made to delete an entry from the hierarchical
//           resolver without a child name.
// *Action:  Supply a child name and try deleting again.
31017, 00000, "Error generating unique OID for XML document"
// *Cause:   An error occurred while generating a globally unique OID
//           for storing an XML document.
// *Action:  
31018, 00000, "Error deleting XML document"
// *Cause:   The XMLType object pointed to by the given REF could not 
//           be deleted because either the REF was invalid or it
//           pointed to a non-existent table.
// *Action:  Either use FORCE deletion or supply a valid REF.
31019, 00000, "Recursive deletion snapshot too old for %s/%s"
// *Cause:   Changes were made to the structure of a directory while it
//           was being recursively deleted.
// *Action:  Try deleting the directory again.
31020, 00000, "The operation is not allowed, Reason: %s"
// *Cause:   The operation attempted is not allowed
// *Action:  See reason and change to a valid operation.
31021, 00000, "Element definition not found"
// *Cause:   The element definition was not found.
// *Action:  Supply the definition for the element or use a defined element.
31022, 00000, "Element not found"
// *Cause:   The element was not found.
// *Action:  Make sure the specified element exists.
31023, 00000, "Index size error"
// *Cause:   The index is greater than the allowed value.
// *Action:  Make sure the index is less than allowed value.
31025, 00000, "Invalid document element"
// *Cause:   An attempt was made to replace the data at an invalid
//           index number in the XML document
// *Action:  Supply a correct occurrence number and try again.
31027, 00000, "Path name or handle %s does not point to a resource"
// *Cause:   An attempt was made to retrieve a resource based on
//           a path name or resource handle that points to an entity
//           other than a resource.
// *Action:  Do not attempt to retrieve a resource based on that path
//           name or resource handle.
31028, 00000, "Resource metadata length %s exceeded maximum length %s"
// *Cause:   An attempt was made to insert resource metadata that exceeded
//           the maximum length of that type of metadata.
// *Action:  Keep resource metadata within its allowed length.
31029, 00000, "Cannot bind to unsaved resource"
// *Cause:   An attempt was made to bind to a resource that had not
//           been saved to disk.
// *Action:  Bind only to saved resources.
31030, 00000, "Unable to retrieve XML document"
// *Cause:   The resource had an invalid (dangling) REF to an XML document.
// *Action:  Rebind the resource using a valid XMLType REF.
31033, 00000, "Requested number of XML children %s exceeds maximum %s"
// *Cause:   An attempt was made to add more than the maximum number of
//           allowable children in an XML element.
// *Action:  Redefine the schema to allow breaking up of the children 
//           among siblings.
31035, 00000, "Could not bind locked resource to path %s/%s"
// *Cause:   An attempt was made to bind an existing resource to a new
//           location in the hierarchy, but a lock could not be obtained
//           on the resource.
// *Action:  Commit or roll back the transaction that has the lock on the 
//           resource.
31037, 00000, "Invalid XML attribute name %s"
// *Cause:   The attribute name in the XML document did not match anything in
//           the associated schema.
// *Action:  Supply only schema-defined or XML standard attributes.
31038, 00000, "Invalid %s value: \"%s\""
// *Cause:   The text in the XML document did not represent a valid
//           value given the datatype and other constraints in the schema.
// *Action:  Ensure that the specified value in XML documents is valid
//           with respect to the datatype and other constraints in the schema.
31039, 00000, "XML namespace length %s exceeds maximum %s"
// *Cause:   The length of the disk-formatted XML namespace exceeded the
//           maximum.
// *Action:  Keep XML namespace declarations below the maximum length.
31040, 00000, "Property %s: XML type (%s) not compatible with internal memory type (%s)"
//  *Cause:  The XML datatype given is inconsistent with the database
//           datatype, and a conversion cannot be made.
//  *Action: This is an internal error, generally resulting from corruption
//           of the compiled XML schema.  Re-register schemas, or contact
//           Oracle support.         
//
31041, 00000, "Property %s: Memory type (%s) not compatible with database type (%s)"
//  *Cause:  The memory type associated with this property is mapped to 
//           an incompatible database type, and a conversion cannot be made.
//  *Action: This is an internal error, generally resulting from corruption
//           of the compiled XML schema.  Re-register schemas, or contact
//           Oracle support.         
//
31042, 00000, "Too many properties in type '%s'"
//  *Cause:  The type can only have the same number of properties (elements
//           and attributes) as a table can have columns.
//  *Action: Modify the XML schema to move properties into subelements that
//           are not inlined.    
//
31043, 00000, "Element '%s' not globally defined in schema '%s'"
//  *Cause:  The specified element name has not been defined at the top level
//           of the XML schema (i.e. globally).  Elements must be defined 
//           globally to be the root of an XMLType object.           
//  *Action: Check the XML schema definition to make sure the specified
//           element name has been defined at the top level.
31044, 00000, "Top-level prefix length %s exceeds maximum %s"
//  *Cause:  An attempt was made to save to disk a top-level XML namespace
//           prefix whose length exceeded the maximum.
//  *Action: Do not define XML namespace prefixes that exceed the maximum
//           length.
31045, 00000, "Cannot store more than %s extras outside the root XML node"
//  *Cause:  An attempt was made to store more than the maximum number of
//           XML extras (e.g. comments and processing instructions)
//           either before or after the document's root node.
//  *Action: Keep the number of extras outside the root node below
//           the maximum.
31046, 00000, "Incorrect argument(s) specified in the operator"
//  *Cause:  One or more of the arguments specified in the operator in the 
//           query are incorrect
//  *Action: Correct the arguments specified in the operator
//
31047, 00000, "Could not retrieve resource data at path %s"
// *Cause:   An error occurred while retrieving the contents and/or metadata
//           of a resource.
// *Action:  Contact Oracle customer support.
31048, 00000, "Unsaved resources cannot be updated"
// *Cause:   An attempt was made to update a resource that was never saved
//           to disk.
// *Action:  Perform a resource insertion instead.
31049, 00000, "Internal event to turn off direct path loading of XML"
// *Cause:   N/A
// *Action:  Do not document.
31050, 00000, "Access denied"
//  *Cause:  The  requested access privileges have not been granted to the 
//           current user. User must be granted privileges prior to 
//           resource access.
//  *Action: Check the set of requested access privileges to make sure that
//           they are included in the set of access privilges granted to
//           the user.
//
31051, 00000, "Requested access privileges not supported"
//  *Cause:  The  requested access privileges are not supported for the 
//           specified resource.
//  *Action: Ensure that the set of requested access privileges are valid
//           access privileges for the specified resource.
//
31052, 00000, "Cannot delete ACL with other references"
//  *Cause:  The  requested deletion of an ACL resource cannot proceed. 
//           The ACL is in use by other resources.
//  *Action: Remove the resources that are making reference to the ACL   
//           in question and try again.
//
31053, 00000, "The value of the depth argument in the operator cannot be negative"
//  *Cause:  The value of the depth argument passed to the primary operator 
//           is not a positive integer
//  *Action: Pass a positive value of the depth argument
//
31054, 00000, "The %s operator cannot have an ancillary operator "
//  *Cause:  An ancillary operator was used with an operator which does not 
//           does not support ancillary operators
//  *Action: Remove the ancillary operator in the query 
//
31055, 00000, "A null XMLType element cannot be inserted into RESOURCE_VIEW"
//  *Cause:  The element which is being inserted into the RESOURCE_VIEW is 
//           NULL
//  *Action: Specify a non-null XMLType element to insert into RESOURCE_VIEW
//
31056, 00000, "The document being inserted does not conform to %s"
//  *Cause:  The XMLType element being inserted into the RESOURCE_VIEW does 
//           not conform to the specified Schema
//  *Action: Insert an element which conforms to the specified Schema
//
31057, 00000, "Display Name of the element being inserted is null"
//  *Cause:  The Display Name of the element which is being inserted into the 
//           RESOURCE_VIEW is null
//  *Action: Specify the Display Name and insert the element into RESOURCE_VIEW
//
31058, 00000, "cannot modify read-only XOBs"
//  *Cause:  Read-Only XOBs cannot be modified.
//  *Action: Use only read operations on such a XOB.
//
31059, 00000, "Cannot insert root XML document node if it already exists"
// *Cause:   An attempt was made to insert a root node into an XML 
//           document that already had a root node.
// *Action:  Call the appropriate replace function to replace the node
//           instead of inserting it anew.
31060, 00000, "Resource at path %s could not be deleted"
// *Cause:   An error occurred while deleting the named resource.  The 
//           specific error can be found one lower on the error stack.
// *Action:  Look at the next error on the stack and take approprate action.
31062, 00000, "Cannot delete an unsaved resource"
// *Cause:   An attempt was made to delete a resource that had not
//           been saved to disk.
// *Action:  Delete only saved resources.
31065, 00000, "Cannot modify read-only property [%s]"
// *Cause:   An attempt was made to modify an immutable XML node.
// *Action:  Use only read operations on such properties.
31066, 00000, "Insertion of %s into %s creates a cycle"
// *Cause:   An attempt was made to insert a link into the XDB hierarchy
//           that would create a cycle in the tree.
// *Action:  Ensure that links to existing resources do not cause cycles.
31067, 00000, "XML nodes must be updated with nodes of the same type"
// *Cause:   An attempt was made to use updateXML to update an XML
//           node with a node of another type.
// *Action:  Ensure that the node specified by the XPath matches the type of
//           new data provided.
31068, 00000, "updateXML expected data format [%s] instead of [%s]"
// *Cause:   An attempt was made to use updateXML to update data
//           with a node of the incorrect type.  Text and attribute
//           nodes must be updated with string data, whereas element
//           nodes must be updated with XMLType data.
// *Action:  Use CREATEXML or getStringVal to coerce the new data to the
//           proper format.
31069, 00000, "Cannot apply typed changes to non-schema-based XMLType nodes"
// *Cause:   An attempt was made to insert, delete, or update a 
//           non-schema-based XMLType node using an XML schema definition.
// *Action:  Make changes to non-typed nodes only by referencing their tag
//           names.
31070, 00000, "Invalid database user ID %s"
// *Cause:   An attempt was made set an invalid user ID into an XDB
//           resource metadata property.
// *Action:  Verify the validity of the user ID and try again.
31071, 00000, "Invalid database username or GUID %s"
// *Cause:   An attempt was made to set an invalid username or GUID
//           into an XDB resource metadata property.
// *Action:  Verify the validity of the username or GUID and try again.
31072, 00000, "Too many child nodes in XMLType fragment for updateXML"
// *Cause:   An attempt was made to pass an XMLType fragment with multiple
//           children as new data for the updateXML operator.
// *Action:  Extract the desired child from the XMLType before passing
//           it to updateXML as the desired new XML node.
31073, 00000, "Resource not retrieved using path name"
// *Cause:   An attempt was made to access the path name of a resource
//           that was either never saved to disk or was loaded using
//           a method other than with its path name.
// *Action:  Perform path name operations only on resources obtained using
//           a path name.
//////// 31075 - 31099 reserved for XML Schema Compiler 
31075, 00000, "invalid %s declaration in XML Schema"
//  *Cause:  The XML schema contains an invalid declaration identified 
//           by the message.
//  *Action: Fix the identified error and try again.
//
31076, 00000, "required attribute \"%s\" not specified"
//  *Cause:  The XML schema does not specify a required attribute.
//  *Action: Specify a value for the required attribute.
//
31077, 00000, "invalid attribute \"%s\" specified"
//  *Cause:  The XML schema specifies an invalid attribute.
//  *Action: Remove specification of the invalid attribute.
//
31078, 00000, "error in SQL mapping information"
//  *Cause:  There is an error in the SQL type and table specification 
//           within the XML Schema.
//  *Action: Ensure that all specified SQL types and tables are 
//           valid and compatible with the corresponding XML types.
//
31079, 00000, "unable to resolve reference to %s \"%s\""
//  *Cause:  The identified type or attribute or element could not be resolved.
//  *Action: Make sure that the name corresponds to a valid
//           XML (simple/complex) type or attribute or element and try again.
//
31080, 00000, "type not specified for attribute or element \"%s\""
//  *Cause:  The identified attribute or element does not have a type.
//  *Action: Make sure that every attribute and element has a valid
//           type specification.
//
31081, 00000, "name not specified for global declaration"
//  *Cause:  The XML schema does not specify the name for the global 
//           declaration of attribute or element or simpleType or complexType.
//  *Action: Specify names for all global declarations.
//
31082, 00000, "invalid attribute \"%s\" specified in declaration of \"%s\""
//  *Cause:  The XML schema specifies an invalid attribute.
//  *Action: Remove specification of the invalid attribute.
//
31083, 00000, "error while creating SQL type \"%s\".\"%s\" "
//  *Cause:  An error occurred while trying to create the SQL type based 
//           on the specification of a complex type.
//  *Action: Fix the identified error and try again.
//
31084, 00000, "error while creating table \"%s\".\"%s\" for element \"%s\""
//  *Cause:  An error occurred while trying to create the table based 
//           on the declaration for the identified element.
//  *Action: Fix the identified error and try again.
//
31085, 00000, "schema \"%s\" already registered"
//  *Cause:  An attempt was made to register a schema with the same URL 
//           as a previously registered schema.
//  *Action: Register the schema with a different URL.
31086, 00000, "insufficient privileges to register global schema \"%s\""
//  *Cause:  An attempt was made to register a global schema without 
//           sufficient privileges.
//  *Action: Make sure that the user has sufficient privileges to register 
//           a global schema.
31087, 00000, "insufficient privileges to delete schema \"%s\""
//  *Cause:  An attempt was made to delete a schema resource without 
//           sufficient privileges.
//  *Action: Make sure that the user has sufficient privileges to delete the
//           schema.
31088, 00000, "object \"%s\".\"%s\" depends on the schema"
//  *Cause:  An attempt was made to delete a schema which has dependent 
//           objects.
//  *Action: Either drop the dependent objects prior to deleting the schema
//           or use the CASCADE or FORCE options.
31089, 00000, "schema \"%s\" does not target namespace \"%s\""
//  *Cause:  The schema document contains references (via include and import
//           definitions) to other schemas that do not belong to valid 
//           namespaces.
//  *Action: Make sure that all schemas referenced via include definitions 
//           target the same namespace as the parent schema.
//           Further make sure that the namespace specified in the import 
//           definition matches the actual target namespace of the 
//           specified schema.
31090, 00000, "invalid database schema name \"%s\""
//  *Cause:  The XML schema document contains an invalid database schema name 
//           For example, the value of attribute SQLSchema
//  *Action: Make sure that all database user/schema names specified in the 
//           XML schema document refer to existing database users/schemas.
31091, 00000, "empty string specified as a SQL name"
//  *Cause:  The XML schema document contains a null SQL name. For 
//           example, the values of attributes SQLName, SQLType, defaultTable.
//  *Action: Make sure that all names of SQL schema objects specified in the 
//           XML schema document are valid SQL names. Otherwise, remove 
//           such attributes from the schema and try again.
31092, 00000, "invalid SQL name \"%s\""
//  *Cause:  The XML schema document contains an invalid SQL name. For 
//           example, the values of attributes SQLName, SQLType, defaultTable.
//  *Action: Make sure that all names of SQL schema objects specified in the 
//           XML schema document are valid SQL names. This implies that 
//           the database length and other restrictions on names be satisfied.
31093, 00000, "null or invalid value specified for parameter : %s"
//  *Cause:  The argument value passed for the given parameter is null or 
//           invalid.
//  *Action: Make sure that all the input argument values are valid.
31094, 00000, "incompatible SQL type \"%s\" for attribute or element \"%s\""
//  *Cause:  The SQL type information provided in the XML schema is not 
//           compatible with the XML datatype for the specified attribute 
//           or element.
//  *Action: Make sure that the specified SQL types are compatible with the 
//           declared XML datatypes.
31095, 00000, "cannot generate %s : \"%s.%s\" already exists"
//  *Cause:  The type/table name specified in the XML schema document
//           cannot be generated because it is already being used.
//  *Action: Use different names for types/tables or use the NOGEN mode
//           so that schema compiler does not generate new types/tables.
31096, 00000, "validation failed for schema"
//  *Cause:  The XML Schema could not be validated.
//  *Action: Make sure that the SQLType and other datatype mapping is
//           valid.
31097, 00000, "Hierarchical Index not empty"
// *Cause:   An attempt was made to rebuild the hierarchical index which is
//           not empty.
// *Action:  Delete all rows in the hierarchical index and then
//           rebuild it.
31098, 00000, "Internal event to turn on XDB tracing"
// *Cause:   N/A
// *Action:  Do not document.
31099, 00000, "XDB Security Internal Error"
//  *Cause:  An XDB Security internal error has occurred.
//  *Action: Contact Oracle Support.
//////// 31100 - 31110 reserved for WebDAV compliant resource locks
31100, 00000, "XDB Locking Internal Error"
//  *Cause:  An XDB Locking Internal error has occurred.
//  *Action: Contact Oracle Support.
31101, 00000, "Token \"%s\" not given while locking resource \"%s\""
//  *Cause:  Locking attempted on resource when the pricipal already owns
//           a lock given by the token above.
//  *Action: Reattempt the lock with the token.
31102, 00000, "Already locked in exclusive mode. Cannot add lock."
//  *Cause: The resource is already locked in exclusive mode. Cannot
//          add another lock.
//  *Action: Unlock the existing lock.
31103, 00000, "Resource locked in shared mode. Cannot add exclusive lock"
//  *Cause: The resource is locked in shared mode. Cannot add a shared lock.
//  *Action: Try locking in shared mode or unlocking the existing lock.
31104, 00000, "Cannot find lock with token \"%s\" on \"%s\" for unlock"
//  *Cause: The lock may have been unlock or it may have expired.
//  *Action: No action needed. Unlock already successful.
31105, 00000, "User does not own lock \"%s\""
//  *Cause: The lock to be unlocked is not owned by the user.
//  *Action:
31106, 00000, "Action failed as the parent container is locked"
//  *Cause: 
//  *Action: Supply the lock token on parent container or unlock it
31107, 00000, "Action failed as resource \"%s\" is locked by name lock"
//  *Cause: Lock requests cause the whole request URI to be locked
//  *Action: Supply lock token or unlock the lock
31108, 00000, "Action failed as resource %s is locked"
//  *Cause: Delete/Rename failed because of an existing lock
//  *Action: Do lockdiscovery to find the lock and delete it.
31109, 00000, "Action failed as parent resource %s is locked"
//  *Cause: Delete/Rename failed because of an lock on parent resource
//  *Action: Do lockdiscovery to find the lock and delete it.
31110, 00000, "Action failed as resource %s is locked by name"
//  *Cause: Delete/Rename failed because one of the children is locked.
//  *Action: Do lockdiscovery to find the lock and delete it.
//
31111, 00000, "table %s cannot be hierarchically enabled"
//  *Cause:  Trigger <tabname>_xdb_pitrigger already exists
//  *Action: Either the table is already hierarchically enabled or the
//           user trigger <tabname>_xdb_pitrigger needs to be dropped.
//
// *Action:  Delete all rows in the hierarchical index and then
//           rebuild it.
//
31112, 00000, "fail to %s for %s port using xdb configuration"
//  *Cause:  port number for the defined presentation is not valid
//  *Action: Either the port number is already in use or
//           it is protected. Specify another port number.
//
31113, 00000, "XDB configuration may not be updated with non-schema compliant data"
//  *Cause:  An attempt was made to update the XDB configuration resource with
//           non-schema or non-schema compliant data.
//  *Action: Check the document to make sure it is schema based and schema 
//           compliant.
//
31114, 00000, "XDB configuration has been deleted or is corrupted"
//  *Cause:  The XDB configuration resource has been deleted or corrupted. 
//  *Action: Reinstall XDB, or reinsert a valid configuration document.
//
31115, 00000, "XDB configuration error: %s"
//  *Cause:  An error related to XDB configuration has occurred.
//  *Action: Make sure the configuration resource contains valid data.
//
//
31116, 00000, "Tablespace not specified correctly"
//  *Cause:  XDB cannot be moved to the specified tablespace.
//  *Action: Specify a valid tablespace.
//
//
/  Range 31120 - 31150 for res view, link view & path index 
/
31121, 00000, "The %s operator can not be FALSE"
//  *Cause: The value of the operator that is specified is FALSE
//  *Action: Specify an operator that evaluates to TRUE
31122, 00000, "The %s operator has incorrect RHS value"
//  *Cause: The right hand side value that has been specified for the operator 
//          does not evaluate to TRUE
//  *Action: Specify value on the right hand side that evaluate to TRUE 
//////// 31151 - 31189 reserved for XML Schema Compiler
31151, 00000, "Cyclic definition encountered for %s: \"%s\""
//  *Cause: The schema definition for this type has cycles.
//  *Action: Remove cyclic definition and re-compile schema.
31152, 00000, "Internal event to enable lru XOBs"
//  *Cause: N/A
//  *Action: Do not document
31153, 00000, "Cannot create schema URL with reserved prefix \"http://xmlns.oracle.com/xdb/schemas/\""
//  *Cause: This prefix is reserved for XDB extended schema URLs and cannot
//          be used in a user specified URL.
//  *Action: Modify the prefix to a different one.
31154, 00000, "invalid XML document" 
//  *Cause: The XML document is invalid with respect to its XML Schema.
//  *Action: Fix the errors identified and try again.
31155, 00000, "attribute %s not in XDB namespace"
//  *Cause: The specified attribute should be prefixed with XDB's namespace.
//  *Action: Ensure that all XDB specified attributes are prefixed with 
//           XDB's namespace and try again.
31156, 00000, "Internal event to turn off validation during schema registration"
//  *Cause:  N/A
//  *Action: Do not document
//
31157, 00000, "Invalid Content-Type charset"
//  *Cause:  HTTP Content-Type header had a charset that Oracle does not 
//           understand.
//  *Action: Fix the Content-Type header in the HTTP request.
//
31158, 00000, "schema \"%s\" currently being referenced"
//  *Cause:  The specified schema URL is currently being referenced by
//           the same session. This could happen because of PLSQL
//           XMLType variables still in scope.
//  *Action: Ensure all references to this schema in this session are
//           released and try the operation again.
//
31159, 00000, "XML DB is in an invalid state"
//  *Cause:  XML DB's internal tables are in an invalid state, probably 
//           because the database was not upgraded or the upgrade was
//           not successful
//  *Action: Ensure that the database is upgraded successfully. If the problem
//           persists, contact Oracle Support
//
31160, 00000, "max substitution group size %s exceeded by \"%s\" (%s) for head element \"%s\" (%s)"
//  *Cause:  The maximum limit on nested substitution groups has been exceeded
//           by an element.
//  *Action: Delete specified schema and re-register it after removing the
//           offending substitution element.
//
31161, 00000, "element or attribute \"%s\" cannot be stored out of line"
//  *Cause:  An element or attribute of a simple type has SQLInline=false 
//  *Action: Remove the SQLInline=false qualification for the offending element
//           or attribute
31162, 00000, "element or attribute \"%s\" has no SQLType specified"
//  *Cause:  Schema registration was invoked with GENTYPES=false without 
//           specifying a SQLType for some element or attribute
//  *Action: Specify a SQLType for the offending element or attribute and 
//           register the schema again
31163, 00000, "element or attribute \"%s\" has invalid attribute value \"%s\" (should be \"%s\")"
//  *Cause:  An element or attribute for a complextype derived by restriction
//           has an attribute whose value is different from that in the base 
//           type
//  *Action: Remove the mismatched attribute values from the offending element
//           or attribute           
31164, 0, "cannot load object-relational XML attribute using direct path \n"
// *Cause: The table being loaded contains a xml column with object-relational
//         storage. The xmltype column contains a type with subtypes. This
//         type of attribute cannot be loaded with direct path.
// *Action:Perform the load with conventional path mode.
//
31165, 0, "cannot load object-relational XML attribute using direct path \n"
// *Cause: The table being loaded contains a xml column with object-relational
//         storage. The xmltype column either contains an out-of-line 
//         partitioned table or the table itself is partitioned by one of
//         the attributes of xmltype. This type of table cannot be loaded
//         with direct path.
// *Action:Perform the load with conventional path mode.
//
31166, 0, "internal error code to handle ignorable attributes"
// *Cause: N/A
// *Action: Do not document
//
31167, 00000, "XML nodes over 64K in size cannot be inserted"
// *Cause:   An attempt was made to insert an XML Text Node with a size
//           greater than 64K.  This is not supported.
// *Action:  Create text nodes under 64K.
31168, 00000, "Node localname and namespace values should be less than 64K"
// *Cause:  An attempt was made to specify an XML Node with localname
//          or namespace value greater than or equal to 64K. This is not
//          supported.
// *Action: Node localnames and namespace values should be under 64K.
//////// 31180 - 31189 reserved for PL/SQL DOM API
31180, 00000, "DOM Type mismatch in invalid PL/SQL DOM handle"
//  *Cause:  The specified PL/SQL DOM handle is referencing a DOM Node whose 
//           DOM Type that does not match the one available in the session. 
//           This could happen because the pl/sql handle was reused, or the 
//           original document is no longer available.
//  *Action: Ensure that the pl/sql handle for the target node is valid and
//           try the operation again.
31181, 00000, "PL/SQL DOM handle accesses node that is no longer available"
//  *Cause:  The specified pl/sql handle is referencing a node in a 
//           DOM Document that is no longer available.
//  *Action: Ensure that the pl/sql handle for the target node is valid and
//           try the operation again.
31182, 00000, "Too many PL/SQL DOM handles specified"
//  *Cause:  An attempt was made to create a PL/SQL DOM handle that exceeded
//           the maximum allowable number of PL/SQL DOM handles. 
//  *Action: Free PL/SQL DOM handles and try the operation again.
31185, 00000, "DOM Nodes do not belong to the same DOM Document"
//  *Cause:  The specified PL/SQL DOM Node does not belong to the       
//           parent DOM Document of the referring DOM Node. 
//  *Action: Ensure that both the DOM Nodes are part of the same 
//           DOM Document.
31190, 00000, "Resource %s is not a version-controlled resource"
//  *Cause:  Either one of the following is the cause:
//           - Checkout is requested for a resource that isn't under version
//           control". Only version-controlled resource can be checked out.
//           - Checkout is requested for a row of a non-versioned table.
//  *Action: put the resource under version-control before checking out.
31191, 00000, "Resource %s is already checked out"
//  *Cause:  Either one of the following is the cause:
//           - Checkout is requested for a resource that is already checked
//           out to the workspace by the same of different user.
//  *Action: checked in the resource from the workspace before checking out
31192, 00000, "Resource %s has not been checked out"
//  *Cause:  Either one of the following is the cause:
//           - Checkin or uncheckout is requested for a resource that has not
//           been checked out to the workspace by any user in a workspace
//  *Action: checked in the resource from the workspace before checking out
31193, 00000, "This versioning feature isn't supported for resource %s"
//  *Cause:  Either one of the following is the cause:
//           - Container cannot be put under version-controlled.
//  *Action: Avoid using these features.
31194, 00000, "Resource %s is already deleted"
//  *Cause:  Access a version-controlled resource that is already deleted.
//  *Action: Recreate the resource.
//
//  *Action: Remove the cyclic definitions in the type and retry compilation.
31195, 00000, "XML node '%s' (type=%s) does not support this operation"
// *Cause:   The given node's type is not supported for this operation.  For
//           example, trying to add children to an attribute node, or passing
//           in a document node as a child, are unsupported operations.
// *Action:  Use a valid node type for the operation.
31196, 00000, "XML nodes over %s in size cannot be printed"
// *Cause:   An attempt was made to use an XML Text Node with a size 
//           greater than 64K, or an XML Comment Node with a size greater 
//           than 4K. These cannot be printed. For 
//           example, trying to add children to an attribute node, or passing 
//           in a document node as a child, are unsupported operations. 
// *Action:  Use getClobVal() or getStringVal() to print the Document.
31197, 00000, "Error in processing file %s"
// *Cause:   An error occurred while operating on the specifed file. 
//           The possible causes are 
//             the file header is corrupt or 
//             check the next error on stack
// *Action:  Ensure that the specified file is correct.
//           Look at the next error on the stack and take appropriate action.
31198, 00000, "Mismatch in number of bytes transferred due to non-binary mode"
// *Cause:   An error occurred while reading the specifed file. 
//           The most probable cause is that the transfer was initiated in 
//           ASCII mode.
// *Action:  Ensure that the transfer mode is set to BINARY
31199, 00000, "Warning in processing file %s"
// *Cause:   A warning was raised while operating on the specifed file. 
//           However, the current operation was completed successfully.
// *Action:  This is primarily an informational message.
//           Look at the next error on the stack to obtain further 
//           information.
//
//
/ 32767 -  (MAX ERROR NUMBER; NONE CAN BE LARGER)
/

