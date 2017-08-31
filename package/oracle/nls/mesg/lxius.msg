/ 
/ $Header: lxius.msg@@/main/3 \
/ Checked in on Tue May 21 18:14:34 PDT 1996 by tlai \
/ Copyright (c) 1996, 1997, 1998, 2000 by Oracle Corporation. All Rights Reserved. \
/ $ 
/ 
/ 
/ Copyright (c) Oracle Corporation 1992, 1989, 1996, 1997, 1998, 2000. All Rights Reserved.
/
/ NAME:
/   LXIUS.MSG
/
/ CONTENTS:
/   Informative and error messages for the NLSRTL loadable data installer.
/
/ NOTES:
/   Language      : American
/   Character set : US7ASCII
/
/ MODIFIED:
/    chaowang   08/11/97 -  Reorganization
/    tlai       07/11/94 -  Creation 
/    thesp      06/23/93 -  Creation 
/
/
/==============================================================================
/  00001 .. 00049 Program lxinst prompt message. (severity code 0 or 1)
/==============================================================================
00001,0, "Generating binary object and installation boot files..."
// *Cause:
// *Action:
00005,0, "Merging installation and system boot files..."
// *Cause:
// *Action:
00010,1, "System boot file not found, new file created successfully"
// *Cause:
// *Action:
00015,0, "NLSRTL Object installation successfully completed"
// *Cause:
// *Action:
/==============================================================================
/  00100 .. 00199 Program lxinst generic error message. (severity code 4)
/==============================================================================
00101,4, "Invalid command-line parameter %s"
// *Cause:
// *Action:
00102,4, "Invalid value for command-line parameter %s"
// *Cause:
// *Action:
00103,4, "Neither OraXMLNLS path nor ORA_NLS33 environment variable is specified"
// *Cause:
// *Action:
00104,4, "Error in command-line parameters"
// *Cause:
// *Action:
00110,4, "Cannot open file %s"
// *Cause:
// *Action:
00111,4, "Cannot read file %s"
// *Cause:
// *Action:
00112,4, "Cannot close file %s"
// *Cause:
// *Action:
00113,4, "Error occurred while creating file %s"
// *Cause:
// *Action:
00114,4, "Error occurred while writing to file %s"
// *Cause:
// *Action:
00115,4, "Invalid object data generation ordering when generating %s"
// *Cause:
// *Action:
00116,4, "Access mode of file %s is incorrect (internal installation error)"
// *Cause:
// *Action:
00117,4, "Cannot find installation boot file"
// *Cause:
// *Action:
00118,4, "File %s generation size overflow"
// *Cause:
// *Action:
00119,4, "Cannot allocate memory when generating %s"
// *Cause:
// *Action:
00120,4, "In %s, unexpected end-of-file is reached"
// *Cause:
// *Action:
00130,4, "In %s at line %d, version keyword is invalid"
// *Cause:
// *Action:
00131,4, "In %s at line %d, version number is invalid"
// *Cause:
// *Action:
00132,4, "In %s at line %d, object id is incorrect"
// *Cause:
// *Action:
00133,4, "In %s at line %d, incorrect data generation sequence"
// *Cause:
// *Action:
00150,4, "In %s at line %d, the entry is invalid"
// *Cause:
// *Action:
00190,4, "Unknown error returned by LXF function %s (internal error)"
// *Cause:
// *Action:
00191,4, "NLS Data loading error returned by LXF function %s (internal error)"
// *Cause:
// *Action:

/==============================================================================
/  00200 .. 00249 Language generation specific error message (severity code 4)
/==============================================================================
/==============================================================================
/  00250 .. 00299 Territory generation specific error message (severity code 4)
/==============================================================================
/==============================================================================
/  00300 .. 00349 Char set generation specific error message (severity code 4)
/==============================================================================
00300,4, "In %s at line %d, the base character set definition file not found"
// *Cause:
// *Action:
00302,4, "In %s at line %d, invalid base character set file version"
// *Cause:
// *Action:
00304,4, "In %s at line %d, the position of base_char_set is not correct"
// *Cause:
// *Action:
00306,4, "In %s at line %d, the base char set name or id invalid or not found"
// *Cause:
// *Action:
00308,4, "In %s at line %d, the base object file %s contains bad data"
// *Cause:
// *Action:
00310,4, "In %s at line %d, the base character set cannot be the unicode"
// *Cause:
// *Action:
00312,4, "In %s at line %d, the flag can't be redefined over base character"
// *Cause:
// *Action:
00314,4, "In %s at line %d, a different length char in a fixed width char set"
// *Cause:
// *Action:
00316,4, "In %s at line %d, display_width defined before classification"
// *Cause:
// *Action:
00320,4, "In %s, multibyte char(s) defined in a single byte char set"
// *Cause:
// *Action:
00322,4, "In %s, no classification defined for multibyte data"
// *Cause:
// *Action:
00324,4, "In %s, no SI/SO chars defined for shift-sensitive character set"
// *Cause:
// *Action:
00326,4, "In %s, wrong definition for a NCHAR character set"
// *Cause:
// *Action:
00328,4, "In %s at line %d, splited base binary definition file not found"
// *Cause:
// *Action:
00330,4, "In %s at line %d, the base name needs to be double quoted"
// *Cause:
// *Action:
00332,4, "In %s, the case definition inconsistent with classification"
// *Cause:
// *Action:
00334,4, "In %s at line %d, an invalid display width value"
// *Cause:
// *Action:
/==============================================================================
/  00350 .. 00399 Linguistic generation specific error message(severity code 4)
/==============================================================================
/==============================================================================
/  00400 .. 00449 Table generation specific error message  (severity code 4)
/==============================================================================
00400,4, "In %s, no data in table definition"
// *Cause:
// *Action:
/==============================================================================
/  00500 .. 00599 Program warning messages. (severity code 1-3)
/==============================================================================
00500,1, "In %s at line %d, classification of %#x redefined"
// *Cause:
// *Action:
00501,1, "In %s at line %d, case of %#x redefined"
// *Cause:
// *Action:
00502,1, "In %s at line %d, multibye equivlent of %#x redefined"
// *Cause:
// *Action:
00503,1, "In %s at line %d, shift character redefined"
// *Cause:
// *Action:
00504,1, "In %s at line %d, display width of %#x redefined"
// *Cause:
// *Action:
00505,1, "In %s at line %d, pad char redefined"
// *Cause:
// *Action:
00506,1, "In %s at line %d, underscore char redefined"
// *Cause:
// *Action:
00507,1, "In %s at line %d, percent char redefined"
// *Cause:
// *Action:
00508,1, "In %s at line %d, default replacement char redefined"
// *Cause:
// *Action:
00509,1, "In %s at line %d, default multibyte replacement char redefined"
// *Cause:
// *Action:
00510,1, "In %s at line %d, unicode %#x out of private use range"
// *Cause:
// *Action:
00511,2, "In %s at line %d, unicode %#x already mapped by others"
// *Cause:
// *Action:
00512,3, "In %s at line %d, character %#x is remapped"
// *Cause:
// *Action:
00513,1, "In %s at line %d, replacement unicode %#x is redefined"
// *Cause:
// *Action:
00514,1, "In %s at line %d, property of Unicode %#x redefined"
// *Cause:
// *Action:
/
/
/==============================================================================
/  00900 .. 00999 Program usage information.
/==============================================================================
0900,0, "Usage: %s [Parameters]"
// *Cause:
// *Action:
0901,0, "Optional parameters are (default values given):"
// *Cause:
// *Action:
0912,0, "OraXMLNLS=<$ORA_NLS10> Specifies where to find the xml-format boot and"
// *Cause:
// *Action:
0913,0, "                       object files and where to store the new binary"
// *Cause:
// *Action:
0914,0, "                       files."
// *Cause:
// *Action:
0915,0, "SysDir=<OraXMLNLS>     Specifies where to find the existing system boot"
// *Cause:
// *Action:
0916,0, "                       file."
// *Cause:
// *Action:
0917,0, "DestDir=<OraXMLNLS>    Specifies where to put the new (merged) system"
// *Cause:
// *Action:
0918,0, "                       boot file."
// *Cause:
// *Action:
0919,0, "Help=NO                Show this help information."
// *Cause:
// *Action:
0920,0, "WARNING=0|1|2|3        Show different levels of warning messages"
// *Cause:
// *Action:
0950,0, "If the OraXMLNLS path is not specified, the value of $ORA_NLS10 will be"
// *Cause:
// *Action:
0951,0, "used. If either of the other path parameters is not specified, the"
// *Cause:
// *Action:
0952,0, "OraXMLNLS path will be used."
// *Cause:
// *Action:
/==============================================================================
/  01001 .. 01099 Unicode collation generation specific error message
/                 ] (severity code 4)
/==============================================================================
01001,4, "In %s at line %d, Illegal character "
// *Cause: Illegal character 
// *Action: stop
01002,4, "In %s at line %d, Parser Handle error "
// *Cause: Parser Handle error - internal error
// *Action: stop
01003,4, "In %s at line %d, syntax error  "
// *Cause: syntax error
// *Action: stop
01004,4, "In %s at line %d, unexpected begin i.e. {,[,( or <  "
// *Cause: unexpected begin
// *Action: stop
01005,4, "In %s at line %d, unexpected end i.e. },],) or > "
// *Cause: unexpected end
// *Action: stop
01006,4, "In %s at line %d, codepoint type error "
// *Cause:  codepoint type error
// *Action: stop
01007,4, "In %s at line %d,  digit error of codepoint"
// *Cause:  digit error of codepoint
// *Action: stop
01008,4, "In %s at line %d, duplicate definition of codepoint in mapping tab."
// *Cause:  duplicate definition of codepoint
// *Action: stop
01009,4, "In %s at line %d, contract/expand table full "
// *Cause: contract/expand table full 
// *Action: stop
01010,4, "In %s at line %d,  exceed max no. of char in contracting or expanding character"
// *Cause:  exceed max no. of char
// *Action: stop
01011,4, "In %s at line %d, expecting codepoint value "
// *Cause: expecting codepoint value 
// *Action: stop
01012,4, "In %s at line %d, expecting codepoint type "
// *Cause:  expecting codepoint type
// *Action: stop
01013,4, "In %s at line %d,  expecting equal sign"
// *Cause: expecting equal sign 
// *Action: stop
01014,4, "In %s at line %d,duplicate expanded character definiton  "
// *Cause: duplicate expanded character definiton 
// *Action: stop
01015,4, "In %s at line %d,no sorting value of expanding char  "
// *Cause: no sorting value of expanding char 
// *Action: stop
01016,4, "In %s at line %d, non-unicode collation info error "
// *Cause: non-unicode collation info error 
// *Action: stop
01017,4, "In %s at line %d, exceed fourth level number of bits limit "
// *Cause: exceed fourth level number of bits limit 
// *Action: stop
01018,4, "In %s at line %d,  special letter table overflow"
// *Cause:  special letter table overflow
// *Action: stop
01019,4, "In %s at line %d,context sensitive prev code point inconsistant  "
// *Cause:  context sensitive prev code point inconsistant
// *Action: stop
01020,4, "In %s at line %d, context sensitive table overflow "
// *Cause: context sensitive table overflow 
// *Action: stop
01021,4, "In %s at line %d, context sensitive block overflow "
// *Cause:  context sensitive block overflow
// *Action: stop
01022,4, "In %s at line %d, duplicate cs character definiton "
// *Cause: duplicate cs character definiton 
// *Action: stop
01023,4, "In %s at line %d, no cs character definiton error "
// *Cause:  no cs character definiton error
// *Action: stop
01024,4, "In %s at line %d, surrogate char cannot be defined as contracting char"
// *Cause: surrogate char cannot be defined as contracting char 
// *Action: stop
01025,4, "In %s at line %d, base collation ID error "
// *Cause:  base collation ID error
// *Action: stop
01026,4, "In %s at line %d, no base collation rule error "
// *Cause: no base collation rule error 
// *Action: stop
01027,4, "In %s at line %d,  base codepoint is undefined "
// *Cause:  base codepoint is undefined 
// *Action: stop
01028,4, "In %s at line %d, range definition error "
// *Cause:  range definition error
// *Action: stop
01029,4, "In %s at line %d, duplicate customized codepoint definition "
// *Cause:  duplicate customized codepoint definition
// *Action: stop
01030,4, "In %s at line %d, base char can't be expanding char "
// *Cause:  base char can't be expanding char
// *Action: stop
01031,4, "In %s at line %d,  base char type error"
// *Cause:  base char type error
// *Action: stop
01032,4, "In %s at line %d,base char reference conflict  "
// *Cause:  base char reference conflict
// *Action: stop
01033,4, "In %s at line %d,  LXFBLI internal error"
// *Cause:  LXFBLI internal error
// *Action: stop