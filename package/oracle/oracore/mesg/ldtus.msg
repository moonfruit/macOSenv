/ 
/ $Header: ldtus.msg 16-dec-96.14:01:21 mshore Exp $ 
/ 
/ Copyright (c) 1991, 1995, 1996 by Oracle Corporation 
/   NAME
/     ldtus.msg - CORE error message file for dates package
/   DESCRIPTION
/     Listing of all CORE error message numbers for dates package
/   NOTES
/     This file has no overlap with the RDBMS error number space.
/   MODIFIED   (MM/DD/YY)
/    mshore     11/12/96 -  #366946: Add 1864
/    mshore     10/21/96 -  #366960: Add 1822
/    dlomax     04/11/96 -  bring up to date with 3.5.3 changes
/    bcchang    12/13/95 -  merged in from V3.5.2
/    jnguyen    12/06/95 -  merged in from V3.5.2 
/    tsaulys    06/02/95 -  #(267037) add 1863 
/    bcchang    10/13/94 -  Update header info 
/    tsaulys    08/30/94 -  get rid of 1419, 1420, 1421 
/    tsaulys    08/30/94 -  get rid of 21000, 21001; add 1862
/    tsaulys    08/25/94 -  update max year in message 1841
/    tsaulys    08/01/94 -  update max Julian day in message 1854 
/    tlai       03/24/92 -  Remove continuation character in message 1859 
/    esedlar    11/20/91 -  Creation 
/        1800 - 1899 Date function errors
/        1800 - 1809 Overflow conditions
/
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
//        1810 - 1829 Conflicting date input format
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
// *Cause:  An era format code, E or EE, was specified in a caledar which
//          does not use era information.
// *Action: Retry the operation using a date format mask which does not 
//          contain era format codes.
/
/        1830 - 1899 Failed input conversions
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
01862, 00000, "the numeric value does not match the length of the format item"
// *Cause: When the FX and FM format codes are specified for an input date,
//  then the number of digits must be exactly the number specified by the 
//  format code.  For example, 9 will not match the format specifier DD but
//  09 will.
// *Action: Correct the input date or turn off the FX or FM format specifier
//  in the format string.
01863, 00000, "the year is not supported for the current calendar"
// *Cause: The year is not supported for the current calendar.
// *Action:  Please check the documentation to find out what years are 
//  supported for the current calendar.
01864, 00000, "the date is out of range for the current calendar"
// *Cause:
// *Action:
01898, 00000, "too many precision specifiers"
// *Cause:
// *Action:
01899, 00000, "bad precision  specifier"
// *Cause:
// *Action:
