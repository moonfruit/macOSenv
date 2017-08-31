/
/ $Header: lsfus.msg 19-jun-2003.17:48:09 Exp $
/
/ 
/ Copyright (c) 1995, 2003, Oracle.  All rights reserved.
/
/   NAME
/     lsfus.msg - LSF US language error message file
/   DESCRIPTION
/     Contains the LSF error messages.
/   RETURNS
/
/   NOTES
/     
/ --------------------------------------------------------------------------
/ External Exception Codes for LSF
/ --------------------------------------------------------------------------
/
00001, 00000, "The system might have ran out of memory while allocating the LSF data object. [%s] [%d]"
// *Cause:  An internal or external error occurred. 
// *Action: See the error message or perform whatever actions you wish to make
//          more memory available to the runnning program.
// *Code:   LSFXALLOC
//
00002, 00000, "Illegal argument %d given for extracting numeric value from a specific descriptor element."
// *Cause:  Illegal argument provided.
// *Action: Fix the 'argno' parameter.
// *Code:   LSFXARGINDEX
//
00003, 00000, "Illegal to insert LSFEND with lsfdi() or lsfdiv()."
// *Cause:  LSFEND is not a real type, but merely an end marker.
// *Action: Fix the parameters passed in.
// *Code:   LSFXBADEND
//
00004, 00000, "Argument index %d exceeds actual number of arguments %d."
// *Cause:  Bad argument index given where it exceeds actual number of 
//          arguments.
// *Action: Fix format string or pass additional arguments to lsfp(), lsfpv(),
//          or lsfpd().
// *Code:   LSFXBINDEX
//
00005, 00000, "Argument type %s is invalid for format code %s."
// *Cause:  Bad argument type given for a format code.
// *Action: Make format and arguments be compatible when pass in lsfp(), 
//          lsfpv(), or lsfpd().
// *Code:   LSFXBTYPE
//
00006, 00000, "Buffer overflow detected in %s with %d bytes written."
// *Cause:  The buffer is not large enough to hold the entire output string.
//          LSF has NOT written past the end of the buffer.  The number of
//          bytes actually written before detection of overflow is given.
// *Action: Fix the buffer size and length passed in.
// *Code:   LSFXBUFOFLOW
//
00007, 00000, "Insufficient arguments for format: %d expected, %d actual."
// *Cause:  Number of arguments does not match format.
// *Action: Fix format string or pass additional arguments to lsfp(), lsfpv(),
//          or lsfpd().
// *Code:   LSFXCOUNTARG
//
00008, 00000, "Descriptor overflow: argument count exceeds descriptor size limit of %d."
// *Cause:  Client passed in more than the limited arguments to lsfp(), 
//          lsfpv(), lsfdl(), or lsfdlv(), or added arguments that would
//          exceed the descriptor size in lsfdi() or lsfdiv().
// *Action: Fix the number of descriptors passed in.
// *Code:   LSFXDSCOFLOW
//
00009, 00000, "Duplicate flag %s in format code."
// *Cause:  Duplcated flag in format code.
// *Action: Fix format string passed to lsfp(), lsfpv(), or lsfpd().
// *Code:   LSFXDUPFLAG
//
00010, 00000, "Invalid format code %s in format string."
// *Cause:  Client passed in invalid format code.
// *Action: Fix the format string passed to lsfp(), lsfpv(), or lsfpd().
// *Code:   LSFXFMTCODE
//
00011, 00000, "Invalid argument index %d in format code."
// *Cause:  Possible negative or 0 argument index in format.  Opening
//          parenthesis in format specification not followed immediately by
//          a valid index number.
// *Action: Fix the format string passed to lsfp(), lsfpv(), or lsfpd().
// *Code:   LSFXIARGINDEX
//
00012, 00000, "Missing argument list in lsfp() or lsfpv()."
// *Cause:  No argument list provided.
// *Action: Fix the argument list.  A call to lsfp() or lsfpv() must have
//          at least one element LSFEND.
// *Code:   LSFXMIARG
//
00013, 00000, "NLS call failure."
// *Cause:  NLS failure.
// *Action: Contact the development organization.
// *Code:   LSFXNLS
//
00014, 00000, "Integer in argument index position in format specification is not immediately followed by a closing parenthesis."
// *Cause:  Missing closing parenthesis in argument index.
// *Action: Fix the format string passed to lsfp(), lsfpv(), or lsfpd().
// *Code:   LSFXNOCPAREN
//
00015, 00000, "An LSF type-passing macro in the argument list was passed a negative length."
// *Cause:  Negative size argument passed in.
// *Action: Fix the length argument passed to lsfdl() or lsfdlv().
// *Code:   LSFXNSIZE
//
00016, 00000, "Null descriptor passed into lsfdiv(), lsfdi(), lsfdrm(), or lsfdcnt()."
// *Cause:  Null descriptor passed in.
// *Action: Fix the descriptor passed into the functions.
// *Code:   LSFXNULLDSC
//
00017, 00000, "Could not parse argument index due to invalid argument index (non-digit character) or possible out of range."
// *Cause:  Invalid argument index.
// *Action: Fix argument index.
// *Code:   LSFXPARGINDEX
//
00018, 00000, "Parse error in field width specifier."
// *Cause:  Invalid field width passed in to lsfp(), lsfpv(), or lsfpd().
// *Action: Fix field width.
// *Code:   LSFXPFWIDTH
//
00019, 00000, "Illegal insert position %d passed into lsfdi() or lsfdiv()."
// *Cause:  Inserted an invalid position which is not LSFDIFIRST, LSFDILAST,
//          or positive integer.
// *Action: Fix position argument.
// *Code:   LSFXPOS
//
00020, 00000, "Parse error in precision specifier."
// *Cause:  Period in format specification not immediately followed by valid
//          format.
// *Action: Fix the precision specifier.
// *Code:   LSFXPPREC
//
00021, 00000, "An error occurred in allocating an SLTS data type or the system ran out of mutex locks."
// *Cause:  Thread services failure.
// *Action: Contact the development organization.
// *Code:   LSFXTHREAD
//
00022, 00000, "Unknown argument type for format code passed into lsfdlv(), lsfdiv(), or lsfdrm()."
// *Cause:  Unknown argument type given.
// *Action: Make format and arguments be compatible.
// *Code:   LSFXUTYPE
//
00023, 00000, "String with invalid characters passed into lsfpcst()."
// *Cause:  Invalid character within input string.
// *Action: Fix the input string.
// *Code:   LSFEUNFC
//
00500, 00000, "Internal exception code, arguments: %s %s %s %s %d"
// *Cause:  Indicated by parameters.
// *Action: Contact the development organization.
//
//
// **************************************************************************
// Internal Exception Codes for LSF
//
//   The following are classified as internal errors.
//   **** Do NOT erase the following though, because they will help in
//        debugging if internal exceptions do occur.
// **************************************************************************
//
//00300, 00000, "<fname> - LMM Internal Error: <lmm mesg> <lmm code>"
//               OR
//              "<fname> - LSF passed in invalid parameters.  See LMM recorded
//               exception code: <lmm code>"
// *Cause:  Either internal or external LMM error occur.
// *Action: If external, fix parameters passed to LMM or acquire more memory.
//          If internal, contact development organization.
// *Code:   LSFIXALLOC
//
//00301, 00000, "In <fname>, failure occurs.  NULL pointer given.  Number of
//               bytes written: <byte>"
// *Cause:  A NULL pointer is passed into <fname>.
// *Action: Internal LSF problems.
// *Code:   LSFIXARGNULL
//
//00302, 00000, "In <fname>, failure ocurs.  <fname1> failed due to bad oracle
//               number.  Number of bytes written: <byte>"
// *Cause:  Invalid oracle number in <fname1>.
// *Action: Internal LSF problem.
// *Code:   LSFIXBNUM
//
//00303, 00000, "In <fname>, failure occurs. <fname1> failed due to string
//               length isn't LXNOLIMIT.  Number of bytes written: <byte>"
// *Cause:  Invalid parameters passed into <fname1>.
// *Action: Internal LSF problem.
// *Code:   LSFIXBSTR
//
//00304, 00000, "LSF Internal Error.  Descriptor Overflow.  Maximum descriptor
//               size is <limit>."
// *Cause:  Descriptor overflow.
// *Action: Internal LSF problem.
// *Code:   LSFIXDSCOFLOW
//
//00305, 00000, "In <fname>, failure occurs.  lnxfnt() should have pad with
//               zeroes.  Number of bytes written: <bytes>."
// *Cause:  lnxfnt() failed.
// *Action: Internal LSF problem.
// *Code:   LSFIXNOPAD
//
//00306, 00000, "In <fname>, failure occurs.  Called function lsf3pcpad()
//               failed.  Number of bytes written: <bytes>."
// *Cause:  lsf3pcpad failed.
// *Action: Internal LSF problem.
// *Code:   LSFIXPADERR
//
