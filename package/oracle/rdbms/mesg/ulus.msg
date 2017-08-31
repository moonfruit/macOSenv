/
/ $Header: rdbms/mesg/ulus.msg /main/159 2008/08/11 12:25:33 rphillip Exp $ ulemtb.msg 
/ 
/ Copyright (c) 1979, 2006 Oracle Corporation.  All rights reserved. 
/ 
/
/NAME
/  ulemtb - Loader Error Message TaBle
/CONTENTS
/  Contents of error message table
/NOTES
/   WARNING: A single message in this table should NOT exceed 75 characters
/            If it does the message will be TRUNCATED.
/
/OWNER
/  Heigham

/MODIFIED
/    bmccarth   12/08/06 - Change %d to %ul in message 2908 to avoid
/                          overflow.
/    cmlim      06/20/06 - jstenois: project 19648: add message 300
/    smashimo   07/03/06 - 5104257: add message 490
/    msakayed   06/15/06 - Project 20586: interval partitioning support
/    msakayed   05/24/06 - project 18265: add message 299
/    msakayed   04/03/06 - system partitioning support, add message 610
/    smashimo   04/21/05 - 4270008: add message 298
/    cmlim      03/15/04 - bug 3907012: add msgs 295, 296, & 297
/    rphillip   10/20/04 - Add new varray skip message
/    smashimo   09/17/04 - 3866720: Add message 713 
/    jstenois   09/27/04  - 2757453: better error if no mem for read buffer
/    jstenois   03/30/04 - integrate os390 PL changes for sllf.c 
/    rphillip   04/22/04 - Add message 971
/    ebatbout   03/23/04 - 3134755: add message, 970
/    ebatbout   03/08/04 - Add error message, 489, cannot insert NULL object 
/                          into object tables.
/    rphillip   02/18/04 - Add varrays to message 292 
/    smashimo   02/12/04 - 3424515: change message 2028, 2038
/    jstenois   07/08/03 - support FILLER for VARRAYs
/    jstenois   04/03/03 - 2825272: error for SQl-string with collection column
/    jstenois   04/11/03 - 2867635: error if SID or OID not 16 bytes
/    jstenois   03/13/03 - free unused messages
/    najain     01/31/03 - move xmltype errors into e29250.msg
/    najain     01/27/03 - add error msg for partitioned xmltype col
/    najain     01/22/03 - add error msg for obj-rel XML col with inheritance
/    ebatbout   01/22/03 - Add generic error message
/    ebatbout   12/05/02 - Incorporate review comments
/    ebatbout   12/04/02 - Resolve merge conflicts
/    ebatbout   12/04/02  - Add error msg when an attempt made to load object-
/                           relational XML col attributes in dp mode
/    jstenois   02/03/03  - add message for when ROWS is modified
/    jstenois   01/03/03  - do not support TREAT AS for obj tables with external tables
/    jstenois   12/23/02  - fix help for 294
/    rphillip   12/27/02  - Add partial record message
/    ykunitom   11/12/02  - Bug#633120: Add message 5100 - 5130, change 4004
/    jstenois   11/11/02  - handle case sensitivity in type names
/    rphillip   09/25/02  - field preserve blanks
/    ebatbout   07/22/02  - Add new external table message 822 
/    ebatbout   07/24/02  - Add message 293.
/    ebatbout   07/22/02  - Add XML columns to error message, 434
/    ykunitom   05/23/02  - Bug#2211255: Add message 292
/    ykunitom   03/27/02  - Bug#2211249: Add message 3141
/    jstenois   12/13/01  - last update before message freeze
/    smalathe   10/15/01  - Bug#2043075: Add messages 3121, 3122
/    preilly    10/11/01  - Add error mesage for bug 1790216 - ROWS invalid for IOT
/    ykunitom   10/03/01  - Bug 1665947: change message 1039
/    smalathe   09/19/01  - Bug#2003039: Change Usage: SQLLOAD to Usage: SQLLDR
/    rphillip   05/02/01  - Add date cache message
/    ebatbout   03/21/01  - Add resumable error messages
/    ebatbout   03/20/01  - Add resumable support
/    msakayed   02/09/01  - prefix message 2092 with newline
/    jstenois   01/23/01  - use directories for output files
/    rpfau      02/07/01  - Add message for ASCII/EBCDIC NLS_LANG versus
/                           platform conflict. Add message for variable length
/                           field maximum exceeded.
/    msakayed   01/23/01  - remove "%s" from message 2092
/    jdavison   01/16/01  - Use sqlldr instead of sqlload
/    jstenois   01/24/01  - no ranges in generated where clause
/    jkaloger   01/03/01 -  XML support
/    rpfau      01/19/01  - Do byteorder mark update for LOBFILEs and SDFs
/    rpfau      01/16/01  - Make byte order mark conflict a fatal error.
/    rpfau      01/02/01  - Add byteordermark check/nocheck keywords, plus
/			    log file messages.
/    rpfau      12/20/00 -  Add message about utf8 byteorder mark
/    jstenois   12/20/00  - add parallel support to external tables
/    rpfau      11/30/00 -  Add warning for al16utf16 character set with
/                           little datafile.
/    rphillip   10/31/00  - Mention columnarrayrows in message 00700
/    jkaloger   11/14/00 -  Inheritance support
/    jstenois   11/29/00  - add options for EXTERNAL_TABLE param
/    rpfau      11/28/00 -  Put in check for delimiter being valid characters
/    jstenois   10/17/00  - don't display directory names if SILENT=TESTING
/    jstenois   09/29/00  - improve sqlldr logs for external table loads
/    jkaloger   10/06/00 -  DPMODE SQL String support
/    jkaloger   10/16/00 -  Add linefeed to msg 440
/    jstenois   09/19/00  - improve formatting for external table messages
/    rpfau      09/05/00 -  Byte order mark support
/    cevankov   07/27/00 -
/    preilly    08/21/00 -  Add option for evaluating constraints in direct pat
/    rphillip   08/24/00 -  little endian utf16
/    rphillip   06/19/00 -  Add messages for multi threading errors
/    cevankov   07/07/00 -  add messages for exttables
/    jkaloger   06/13/00 -  Adjust messages for packed/zoned decimals
/    jkaloger   05/19/00 -  Bug #1076855: Allow hidden columns to be loaded
/    jkaloger   04/20/00 -  Add EXPRESSION keyword
/    rpfau      05/05/00 -  First pass for unicode 8.2 support
/    jkaloger   05/08/00 -  Support SQL strings on ADTs
/    jkaloger   03/15/00 -  Bug #322748 - check eof for quoted strings
/    jkaloger   02/17/00 -  Add support for unsigned integers
/    jstenois   01/27/00 -  update message 961
/    ykunitom   12/24/99 -  bug 916948: add message 288
/    jstenois   12/30/99 -  support connect with AS SYSDBA
/    ykunitom   12/20/99 -  bug 916948: add message 288
/    cmlim      12/03/99 -  add 2026: load cannot continue/load aborted msg
/    preilly    09/17/99 -  Fix bug 996219 - add error message when trying to l
/    cmlim      10/15/99 -  Bug 1035212: update 462, 463, & 464. add 646.
/    jstenois   09/14/99 -  remove unused %s from message
/    jstenois   09/02/99 -  use slf for file I/O for files > 2GB
/    jkaloger   09/17/99 -  Add support for INTEGER(n)
/    mluong     09/03/99 -  fix merge
/    jkaloger   08/10/99 -  Add message for missing control file name
/    amsrivas   08/13/99 -  rollback change for 861921
/    amsrivas   08/02/99 -  #861921: add messages for invalid parallel loads.
/    cmlim      07/16/99 -  BOUNDFILLER support of opaque datatype; add 285,286
/    jstenois   07/03/99 -  add messages for sllf status
/    nkandalu   06/15/99  - Bug#902012: change mesg nos. 2037,2038,2049
/    msakayed   07/28/99 -  do not translate message 120
/    hikimura   07/05/99 -  Bug #918211: sqlload core dumps when specifying
/                           the length field for VARCHARC more than 10.
/    rpfau      08/10/99 -  Allow continuation columns as data
/    msakayed   06/28/99 -  datetime support for 8.1.6
/    jstenois   05/25/99 -  add message to use when no attr. of type specified
/    jstenois   03/30/99 -  adjust bind array size if too small
/    jstenois   05/28/99 -  more dpapi support
/    jstenois   04/13/99 -  optimize memory allocation
/    vnimani    03/16/99  - add message 309 on: no sql string on lob fields    
/    cmlim      01/18/99 -  change 1035 to 1045; Bug #704651 - add 1046, 1047
/    cmlim      12/07/98 -  add 1035(v806)/1045(v816); add 257(v806)/284(v816)
/    jstenois   02/25/99 -  use direct path API
/    cmlim      11/17/98 -  put back msg 125, which is used by uln.c
/    vnimani    11/06/98  - fix mesg 524                                       
/    jstenois   10/29/98 -  final update for 8.1.5

/    cmlim      10/02/98 -  Bug #704651: update 3080.
/    jstenois   09/11/98 -  more varray support
/    vnimani    09/03/98  - REF support                                        
/    jstenois   10/06/98 -  add error if value not set for dynamic SDF/LOBFILE
/    jstenois   08/31/98 -  update log file format for new 8.1 features
/    jstenois   08/22/98 -  message cleanup
/    jstenois   08/21/98 -  make ulprt type friendly
/    vnimani    08/20/98 -  add can't ref varray field in nullif/defaultif mesg
/    jstenois   08/02/98 -  varray conversion
/    jstenois   07/16/98 -  add OID and REF support
/    jstenois   07/29/98 -  improved error handling
/    jstenois   07/15/98 -  varray support
/    jstenois   07/07/98 -  varray support
/    ldang      06/29/98 -  Bug 600017: Size of SQL string in 3072 is 16000
/                           bytes.  Any SQL string longer than that will be
/                           truncated.
/    jstenois   06/19/98 -  add messages for OCI status codes
/    vnimani    06/15/98  - varray support                                     
/    msakayed   06/15/98 -  support for 8.1 subpartitioning
/    jstenois   06/09/98 -  improve error messages for ADTs
/    jstenois   06/08/98 -  support delimited lobs in LOBFILES
/    msakayed   06/03/98 -  support for 8.1 subpartitioning
/    jstenois   05/28/98 -  update messages for 8.1.3
/    jstenois   05/01/98 -  support bfile loading
/    vnimani    04/30/98  - bfile support                                      
/    jstenois   03/30/98 -  oci8 conversion
/    msakayed   02/10/98 -  Bug #299144: de-couple read buffer/bind array(s)
/    jstenois   02/03/98 -  add messages for lob loading
/    rjenkins   01/08/98 -  adding carriage return to message 3087
/    rjenkins   12/05/97 -  distinguish enable from validate constraints
/    jhwang     09/18/97 -  obsolete error messages: 257, 260, 270, 280,
/                           413, 414, 415, 502, 506, 507, 519, 701, 907, 912,
/                           917, 920, 921, 922, 923, 928, 960, 964,
/                           967, 968, 1004, 1005, 1016, 1017, 1018, 1035,
/                           2012, 2021, 2023, 2026, 2027, 2046, 2047, 
/                           3002, 3003, 3076, 5000
/    abrumm     08/26/97 -  Bug #514684: error codes for char set conversion
/    abrumm     08/19/97 -  add message for char set id
/    msakayed   07/07/97 -  Bug #324122: add message 459
/    msakayed   07/07/97 -  Modify messages 520-523 as per tpfaeffl
/    anolan     05/14/97 -  Demo.
/    abrumm     03/23/97 -  Bug #462556: fix FILE= for partitioned tables
/    msakayed   03/11/97 -  Bug #342837: Add LFI error messages
/    msakayed   03/11/97 -  Bug #165338: Add exit code message (707)
/    abrumm     12/27/96 -  Bug #433454: add simple error msg format
/    jnewman    12/03/96 -  edit Cause and Action statements
/    abrumm     11/20/96 -  update 621 error
/    abrumm     08/10/96 -  better error mesg text
/    abrumm     07/12/96 -  add error message for constraints
/    abrumm     04/30/96 -  add messages for new OPTIONS
/    abrumm     04/09/96 -  add new _synchro options
/    jhealy     01/30/96 -  rewrite and fix direct load save-point mechanism
/    jhealy     01/04/96 -  partition support: new message for partition stats
/    jhealy     12/15/95 -  single partition loads: change 936 mesg
/    jhealy     11/07/95 -  bitmap index support phase 1
/    abrumm     09/22/95 -  partition support
/    jhealy     05/30/95 -  bug #276086: parallel direct path APPEND mode
/    abrumm     02/15/95 -  merge changes from branch 1.22.720.1
/    ksudarsh   04/20/94 -  new messages, for parallel loader
/    ksudarsh   03/10/94 -  new warning message
/    ksudarsh   12/24/93 -  change mesgs to match datatype of passed args
/    ksudarsh   08/16/93 -  change error mesg #918
/    ksudarsh   08/10/93 -  par. query option enabled check
/    ksudarsh   05/26/93 -  add message for dblink when handling synonyms
/    ksudarsh   05/11/93 -  fix message - incorrect for parallel data load 
/    ksudarsh   03/30/93 -  Fix mesg to avoid regress diff 
/    ksudarsh   09/22/92 -  PDL: New messages 
/    ksudarsh   01/20/93 -  username prompt 
/    cheigham   06/27/92 -  add message for disconnect error 
/    cheigham   03/16/92 -  add null clause text msg 
/    cheigham   01/28/92 -  merge fix for  bug 94092 
/    cheigham   10/22/91 -  add error 268 for unrecoverable 
/    cheigham   07/15/91 -         add error message for failed truncate 
/  Heigham    03/04/91 - fix msg 600
/  Heigham    01/29/91 - add 'records processed' message
/  Heigham    11/13/90 - add causes/actions
/  Heigham    10/30/90 - more msgs. for command-line help
/
/
/  Message headers
/
1, 0, "SQL*Loader-%03d: "
2, 0, "  SQL*Loader-%03d: "
/
/ Command-line errors
/
100, 0, "Syntax error on command-line\n"
// *Cause: Possible causes for this error include: placing a positional 
//         argument after keyword arguments, misspelling a keyword, not 
//         balancing parentheses or quotes, or leaving space between the 
//         operator, '=', and an argument.
// *Action: Check the command syntax and the spelling, then retry. 
101, 0, "Invalid argument for username/password\n"
// *Cause: The username/password argument specified on the command line was 
//         not recognized. Another argument (not identified by a keyword) 
//         could be in the position where username/password is expected.    
//         

//         This error could also result from a spelling mistake. The password, 
//         if present, must be separated by a slash (/). No spaces can 
//         appear between the slash and username or password. Otherwise, 
//         SQL*Loader sees them as multiple arguments. 
// *Action: Check the format of the username/password argument, which is the 
//         first argument on the command line, if arguments are given 
//         without keywords.  
102, 0, "Invalid control file name on command line\n"
// *Cause: The control filename specified on the command line was not 
//         recognized. It could be misspelled, or another argument (not 
//         identified by a keyword) could be in its place. One possible 
//         cause is the existence of a space between username and password. 
//         See error 101, above. 
// *Action: Check the spelling and position of the arguments on the command 
//         line.  
103, 0, "Invalid log file name on command line\n"
// *Cause: The log file name specified on the command line was not recognized. 
//         It could be misspelled, or another argument (not identified by a 
//         keyword) could be in its place. 
// *Action: Check the spelling and position of the arguments on the command 
//         line.  
104, 0, "Invalid bad file name on command line\n"
// *Cause: The bad file name specified on the command line was not recognized. 
//         It could be misspelled, or another argument (not identified by a 
//         keyword) could be in its place. 
// *Action: Correct it.
105, 0, "Invalid data file name on command line\n"
// *Cause: The datafile name specified on the command line was not recognized. 
//         It could be misspelled, or another argument (not identified by a 
//         keyword) could be in its place. 
// *Action: Check the spelling and position of the arguments on the command 
//         line.  
106, 0, "Invalid discard file name on command line\n"
// *Cause: The discard file name specified on the command line was not 
//         recognized. It could be misspelled, or another argument (not 
//         identified by a keyword) could be in its place. 
// *Action: Check the spelling and position of the arguments on the command 
//         line. 
107, 0, "Invalid maximum number of discards\n"
// *Cause: The argument's value is inappropriate, or another argument (not 
//         identified by a keyword) is in its place. 
// *Action: Check the command line and retry.  
108, 0, "Invalid number of logical records to load\n"
// *Cause: The argument's value is inappropriate, or another argument (not 
//         identified by a keyword) is in its place. 
// *Action: Check the command line and retry.  
109, 0, "Invalid number of logical records to skip\n"
// *Cause: The argument's value is inappropriate, or another argument (not 
//         identified by a keyword) is in its place. 
// *Action: Check the command line and retry.  
110, 0, "Invalid maximum number of errors\n"
// *Cause: The argument's value is inappropriate, or another argument (not 
//         identified by a keyword) is in its place. 
// *Action: Check the command line and retry.  
111, 0, "Invalid number of rows for bind array or data saves\n"
// *Cause: The argument's value is inappropriate, or another argument (not 
//         identified by a keyword) is in its place. 
// *Action: Check the command line and retry.  
112, 0, "Invalid maximum bind array size\n"
// *Cause: The argument's value is inappropriate, or another argument (not 
//         identified by a keyword) is in its place. 
// *Action: Check the command line and retry.  
113, 0, "Invalid silent mode option\n"
// *Cause: The only valid options for the SILENT command-line argument are 
//         ALL, ERROR, FEEDBACK, or HEADER. The argument could be 
//         misspelled, or another argument (not identified by a keyword) could 
//         be in its place. 
// *Action: Check the command line and retry.  
114, 0, "Error in OPTIONS statement\n"
// *Cause: Command line options specified in the SQL*Loader control file with
//         the OPTIONS clause were found to be incorrect. 
// *Action: Check the format of the OPTIONS clause in the SQL*Loader 
//          control file.  
115, 0, "Invalid direct path option\n"
// *Cause: The only valid options for the DIRECT command-line argument are 
//         TRUE or FALSE. The argument could be misspelled, or another 
//         argument (not identified by a keyword) could be in its place. 
// *Action: Check the command line and retry.  
116, 0, "Error prompting for password\n"
// *Cause: An internal error has occurred. 
// *Action: Contact customer support. 
/
/  FOR INTERNAL USE ONLY
117, 0, "Don't use both silent=testing and silent=performance.\n"
/ 
118, 0, "Invalid parallel load option\n"
// *Cause: The command-line argument used for the parallel load is incorrect.
// *Action: Use only TRUE or FALSE as the value for the parallel load option.
119, 0, "Invalid parallel file (data file) name on command line\n"
// *Cause: The command-line argument for the parallel file was entered incorrectly.
// *Action: Check the command line argument and retry the operation.
/
/  FOR INTERNAL USE ONLY
// NLS_DO_NOT_TRANSLATE [120] - INTERNAL ERROR MESSAGE
120, 0, "Invalid _synchro option string\n"
// *Cause: The command-line argument _synchro is incorrect.
// *Action: Use only one of the allowed modes: see ulminv[].
121, 0, "Invalid skip_unusable_indexes option\n"
// Cause: The command line argument for skip_unusable_indexes is incorrect.
// Action: Use only TRUE or FALSE as the value for the skip_unusable_indexes 
//         option.
122, 0, "Invalid skip_index_maintenance option\n"
// Cause: The command line argument for skip_index_maintenance is incorrect.
// Action: Use only true or falseas the value for the  
//         skip_index_maintenance option. (Note: only on direct loads!)
/  
123, 0, "specified value for bindsize(%d) less than readsize(%d)\n"  
// Cause: The command line argument specified for bindsize was less than  
//        the value of readsize.  
// *Action: No action is required. SQL*Loader automatically adjusts 
//          the value of bindsize to equal the value of readsize.
124, 0, "specified value for readsize(%d) less than bindsize(%d)\n"  
// Cause: The command line argument specified for readsize was less than  
//        the value of bindsize.  
// *Action: No action is required. SQL*Loader automatically adjusts 
//          the value of readsize to equal the value of bindsize.
125, 0, "specified value for readsize(%d) less than max_record_size(%d)\n"  
// Cause: The command line argument specified for readsize was less than  
//        the value of max_record_size.  
// *Action: No action is required. SQL*Loader automatically adjusts 
//          the value of readsize to equal the value of max_record_size.
126, 0, "Invalid read size\n"
// *Cause: The argument's value is inappropriate, or another argument (not 
//         identified by a keyword) is in its place. 
// *Action: Check the command line and retry.  
127, 0, "Invalid maximum record size\n"
// *Cause: The argument's value is inappropriate, or another argument (not 
//         identified by a keyword) is in its place. 
// *Action: Check the command line and retry.  
128, 0, "unable to begin a session\n"
// *Cause:  An error occurred when attempting to start a session on the
//          database.
// *Action: See the message that follows this message for information on
//          the cause of the error.
129, 0, "Invalid number of rows for direct path column array\n"
// *Cause: The argument's value is inappropriate 
// *Action: Check the command line and retry.  
130, 0, "Invalid direct path stream size\n"
// *Cause: The argument's value is inappropriate
// *Action: Check the command line and retry.  
131, 0, "Invalid multithreading option\n"
// *Cause: The only valid options for the MULTITHREADING  command-line 
//         argument are TRUE or FALSE. The argument could be misspelled, 
//         or another argument (not identified by a keyword) could be in 
//         its place. 
// *Action: Check the command line and retry.  
132, 0, "invalid argument for external table option\n"
// *Cause: The command line argument specified for external_tables was not 
//         TRUE or FALSE
// *Action: Check the command line and retry.  
133, 0, "Can't specify both direct path and external tables\n"
// *Cause: Both options for direct path and exrernal tables were indicated.
//         Only one of these can be applied at a time. 
// *Action: Change at least one of the parameters to enable only one.
134, 0, "invalid option specified for EXTERNAL_TABLE parameter\n"
// *Cause: An invalid value was specified for the EXTERNAL_TABLE parameter.
// *Action: Specify one of the following values. NOT_USED disables use of
//          external tables.  GENERATE_ONLY generates the SQL statements 
//          that will use external tables to load the data.  EXECUTE both
//          generates the SQL statements and then executes them.
135, 0, "Invalid argument for RESUMABLE\n"
// *Cause: The command line argument specified for RESUMABLE was not 
//         TRUE or FALSE.
// *Action: Check the command line and retry.
136, 0, "Invalid argument for RESUMABLE_NAME\n"
// *Cause: The command line argument specified for RESUMABLE_NAME was not 
//         a valid string.
// *Action: Check the command line and retry.
137, 0, "Invalid value for RESUMABLE_TIMEOUT\n"
// *Cause: The command line argument specified for RESUMABLE_TIMEOUT was not 
//         a valid positive integer.
// *Action: Check the command line and retry.
138, 0, "Invalid value for DATE_CACHE\n"
// *Cause: The command line argument specified for DATE_CACHE was not 
//         a valid positive integer.
// *Action: Check the command line and retry.
/
/  FOR INTERNAL USE ONLY
// NLS_DO_NOT_TRANSLATE [139] - INTERNAL ERROR MESSAGE
139, 0, "Invalid value for _testing_server_slot_size\n"
// *Document: NO
// *Cause: The command line argument specified was not a valid positive
//         integer.
// *Action: Check the command line and retry.
/
/  FOR INTERNAL USE ONLY
// NLS_DO_NOT_TRANSLATE [140] - INTERNAL ERROR MESSAGE
140, 0, "Invalid value for _testing_server_ca_rows\n"
// *Document: NO
// *Cause: The command line argument specified was not a valid positive 
//         integer.
// *Action: Check the command line and retry.
/
/  FOR INTERNAL USE ONLY
// NLS_DO_NOT_TRANSLATE [141] - INTERNAL ERROR MESSAGE
141, 0, "Invalid value for _testing_server_max_rp_ccnt\n"
// *Document: NO
// *Cause: The command line argument specified was not a valid positive 
//         integer.
// *Action: Check the command line and retry.
/
/  FOR INTERNAL USE ONLY
// NLS_DO_NOT_TRANSLATE [142] - INTERNAL ERROR MESSAGE
142, 0, "Invalid value for _testing_ncs_to_clob\n"
// *Document: NO
// *Cause: The command line argument specified was not a valid boolean. 
// *Action: Check the command line and retry.
/
/  FOR INTERNAL USE ONLY
// NLS_DO_NOT_TRANSLATE [143] - INTERNAL ERROR MESSAGE
143, 0, "Invalid value for _parallel_lob_load\n"
// *Document: NO
// *Cause: The command line argument specified was not a valid boolean.
// *Action: Check the command line and retry.
/ 
/ conflicting load method messages
144, 0, "Conflicting load methods: %s/%s specified.\n"
// *Cause:  External table mode and direct path mode were both specified.
// *Action: Specify only one load method.
/
/ bad value for NO_INDEX_ERRORS 
145, 0, "Invalid value for NO_INDEX_ERRORS\n"
// *Cause:  The command line argument specified was not a valid boolean.
// *Action: Check the command line and retry.
/
/ bad value for _PARTITION_MEMORY 
146, 0, "Invalid value for _PARTITION_MEMORY\n"
// *Cause:  The command line argument specified was not -1, 0, or positive.
// *Action: Check the command line and retry.
/
/ data generation message -- FOR INTERNAL USE ONLY
/
150, 0, "Only 1 table allowed if generating data\n"
151, 0, "Data generation is being used -- NOT FOR CUSTOMER USE\n"
152, 0, "%ld rows being generated.\n"
153, 0, "Cannot convert input character set to output one.\n"
154, 0, "Bad file must be specified.\n"
155, 0, "%*s"
156, 0, "|[%ld]%s|"
157, 0, "%-*lu"
158, 0, "|[%d]"
159, 0, "%1.1c"
160, 0, "%02X"
161, 0, "%s| "
162, 0, "%1.1s"
163, 0, "%c"
164, 0, "|[%ld]%s| "
/
/ control file errors/warnings
/
200, 0, "FORMAT clause should not be present - flat data files only\n"
// *Cause:  SQL/DS FORMAT clause is not supported. 
// *Action: Remove the FORMAT command from the SQL*Loader control file or 
//          Comment it out.  
250, 0, "Work data sets are not used by SQL*Loader\n"
// *Cause: The SQL*Loader control file contains a WRKDDN statement. 
//         SQL*Loader ignores this clause. 
// *Action: No action required. This is an informational message.  
251, 0, "Sort devices are not used by SQL*Loader\n"
// *Cause: The SQL*Loader control file contains a SORTDEVT statement.
//         SQL*Loader ignores this clause. 
// *Action: No action required. This is an informational message.  
252, 0, "Sort data sets are not used by SQL*Loader\n"
// *Cause: The SQL*Loader control file contains a SORTNUM statement.
//         SQL*Loader ignores this clause. 
// *Action: No action required. This is an informational message.  
253, 0, "DB2 partition number has no significance -- ignored\n"
// *Cause: The SQL*Loader control file contains a PART statement.
//         SQL*Loader ignores this clause.
// *Action: No action required. This is an informational message.
254, 0, "Cannot have DISCARDFILE specs here when multiple data files\n"
// *Cause:  The SQL*Loader control file contained multiple INFILE statements
//          and a DISCARDFILE statement was found below the RESUME clause.
// *Action: Move the DISCARDFILE statement above the RESUME clause, so it is 
//         adjacent to one of the INFILE statements.  
255, 0, "Log file for error recovery not used by SQL*Loader\n"
// *Cause: The SQL*Loader control file contains a LOG statement. SQL*Loader
//         ignores this clause. 
// *Action: No action required. This is an informational message.  
256, 0, "SORTED INDEXES option allowed only for direct path\n"
// *Cause: The SQL*Loader control file contains a SORTED INDEXES statement, 
//         but it was not used in a direct path load. 
// *Action:  Specify a direct path load with DIRECT=TRUE on the command 
//         line, remove the statement from the SQL*Loader control file, or 
//         Comment it out.  
257, 0, "TERMINATED BY EOF option not valid with ENCLOSED BY option\n"
// *Cause: A field description in the SQL*Loader control file contains both the
//         TERMINATED BY EOF and the ENCLOSED BY options.  These options
//         are mutually exclusive.
// *Action: Remove either or both of the clauses.
258, 0, "Maximum number of SORTED INDEXES (%d) exceeded on table %s\n"
// *Cause: There are too many indexes in the SORTED INDEX clause. The 
//         message displays the maximum number that are permitted. 
// *Action: Reduce the number of indexes specified in the SORTED INDEX 
//         clause or use the conventional path load instead of the direct path 
//         load. 
259, 0, "Could not escalate DDL share lock to exclusive on table %s\n"
// *Cause:  This error occurs when another user has a parse lock on the table, 
//         for example, when another user is doing a select on the table. 
//         The parse lock should clear momentarily. 
// *Action: Give the parse lock a chance to clear and then retry or else use 
//         the conventional path load.  
260, 0, "TERMINATED BY EOF option available only with LOBFILE option\n"
// *Cause: The TERMINATED BY EOF option can be used only when describing
//         data to be loaded from a LOBFILE.
//         It cannot be specified at the table level and it cannot be
//         for data in "regular" data files.
// *Action: Verify that you have specified the correct option for
//          TERMINATED BY and verify that the TERMINATED BY option is
//          specified for the correct fields.
261, 0, "illegal use of TERMINATED BY for RAW field\n"
// *Cause: The TERMINATED BY option cannot be used for loading data
//         of type RAW from the data file.  The only exception is when loading
//         RAW data from LOBFILES. In that case, you may specify the 
//         TERMINATED BY EOF option.
// *Action: Remove the TERMINATED BY option from the RAW field in the 
//          SQL*Loader control file.
262, 0, "PIECED keyword (on column %s) allowed only when path is direct\n"
// *Cause:  The PIECED keyword cannot be used in a conventional path load.
// *Action: Remove the PIECED keyword or use the direct path load. 
263, 0, "PIECED column %s must be last specified column in table %s\n"
// *Cause: A column that is not the last column was specified as PIECED.
// *Action: Remove the PIECED keyword or place the column last.  
264, 0, "File mode token %s parsed but ignored\n"
// *Cause: An obsolete file mode token was used in the SQL*Loader control 
//         file. As of Release 1.1 of SQL*Loader, the file-processing options
//         string is used to control file processing, rather than keywords 
//         like STREAM, RECORD, FIXED, and VARIABLE. 
// *Action: No action required. This message is informational. Removing the 
//         obsolete keywords will eliminate the message without changing the 
//         way in which the datafile is processed. 
265, 0, "Unable to get default character set name.\n"
// *Cause: SQL*Loader was unable to locate the default character set name 
//         for the environment. 
// *Action:  Supply a character set name with the CHARACTERSET keyword.  
266, 0, "Unable to locate character set handle for %s.\n"
// *Cause: SQL*Loader could not find the character set handle for the named 
//         character set. 
// *Action: Correct the character set name.  
267, 0, "Control file must be first data file.\n"
// *Cause: The SQL*Loader control file is specified as containing data using 
//         the INFILE "*" clause, but other datafiles were named first. 
// *Action: Move the INFILE "*" clause so that it is the first datafile 
//         declared in the SQL*Loader control file. 
268, 0, "UNRECOVERABLE keyword may be used only in direct path.\n"
// *Cause: The UNRECOVERABLE keyword can only be specified in the direct 
//         path load.
// *Action: Use the direct path load or remove the keyword. (Conventional path 
//         loads are always recoverable). 
269, 0, "Null string not allowed as clause comparison text.\n"
// *Cause:  A clause is being compared to a null string.
// *Action: Modify the clause to compare to at least one character. 
270, 0, "TERMINATED BY EOF valid only for CHAR or RAW datatypes\n"
// *Cause: A field description in the SQL*Loader control file used the
//         TERMINATED BY EOF option when the field was not a RAW or CHAR 
//         datatype.
// *Action: Modify the SQL*Loader control file to either remove the 
//          TERMINATED BY EOF clause or change the datatype for the 
//          field to be CHAR or RAW.
271, 0, "Not a Parallel load. Table level OPTIONS statement ignored.\n"
// *Cause:  A table-level OPTIONS statement was specified for a non-parallel 
//         load.
// *Action: Remove the OPTIONS statement from the SQL*Loader control file. 
272, 0, "  Table level OPTIONS statement ignored.\n"
// *Cause:  In the parallel load option, the file specified on the command 
//         line overrides the file specified in the SQL*Loader control file.
// *Action: Remove the OPTIONS statement from the SQL*Loader control file. 
273, 0, "READBUFFERS may be used only in direct path.\n"
// *Cause: The READBUFFERS specification was not entered as part of a direct 
//         path.
// *Action: Use the direct path or remove the READBUFFERS specification from
//          the SQL*Loader control file.
274, 0, "At least 2 read buffers have to be specified.\n"
// *Cause: Fewer than 2 read buffers have been specified.
// *Action: Specify at least 2 read buffers in the READBUFFERS statement,
//          in the SQL*Loader control file.
275, 0, "Data is in control file but \"INFILE *\" has not been specified.\n\n"
// *Cause: The INFILE specification was not entered in the SQL*Loader control 
//         file.
// *Action: If data in the SQL*Loader control file is to be read, specify 
//          INFILE * in the SQL*Loader control file. 
276, 0, "Local storage option overrides global storage.\n"
// *Cause: A storage clause has been specified in the table level options
//         statement and also in the global options statement.
// *Action: This is only a warning message. Table level options take 
//         precedence
//          over global options. Drop the table level options statement if 
//         this
//          is not the intent.
277, 0, "Local file specification overrides global file specification.\n"
// *Cause: A filename has been specified in the table level options
//         statement and also in the global options statement.
// *Action: This is only a warning message. Table level options take 
//         precedence
//          over global options. Drop the table level options statement if 
//         this
//          is not the intent.
278, 0, "Incorrect file specification for parallel load.\n"
// *Cause: The filename used to perform the parallel load was entered 
//         incorrectly. 
// *Action: Correct the filename and re-invoke parallel loader.
279, 0, "Only APPEND mode allowed when parallel load specified.\n"
// *Cause: INSERT, REPLACE, or TRUNCATE mode was used in a parallel load 
//         specification. 
// *Action: Change the SQL*Loader control file to use the APPEND keyword 
//          and re-invoke the parallel loader.
280, 0, "table %s is a temporary table\n"
// *Cause:  The sqlldr utility does not load temporary tables.  Note that if
//          sqlldr did allow loading of temporary tables, the data would 
//          disappear after the load completed.
// *Action: Load the data into a non-temporary table.
281, 0, "Warning: ROWS parameter ignored in parallel mode.\n"
// *Cause:  Specifying save points using the ROWS parameter is not supported
//          for parallel loads.
// *Action: Remove the ROWS parameter from the command-line arguments or 
//          specify a non-parallel direct load to have save points performed.
282, 0, "Unable to locate character set handle for character set ID (%d).\n"
// *Cause: SQL*Loader could not find the character set handle for the given
//         character set ID.
// *Action: The character set ID was obtained from the database server, the
//          SQL*Loader client does not have knowledge of the given
//          character set ID.  Possible mis-match of NLS data on the
//          client and server side.
283, 0, "file processing string \"%s\" ignored for INFILE *\n"
// *Cause:  The SQL*Loader control file specified INFILE * for a load data 
//          file along with an optional file processing string.  This message 
//          is a warning that the file processing string will be ignored since
//          SQLLDR will expect the data to have the same record format as the
//          SQL*Loader control file.
// *Action: If the data in the SQL*Loader control file is in the same format 
//          as the rest of the SQL*Loader control file, then you don't need 
//          to do anything.  Removing the file processing string will get 
//          rid of this error message.  If the data in the SQL*Loader control 
//          file has a different record format, then you need to copy the 
//          data into a separate file and use that file's name in the 
//          INFILE clause.
284, 0, "Warning: Input data file %s specified multiple times.\n"
// *Cause: The same input datafile is loaded multiple times.  This can 
//         occur if the INFILE keyword is placed out of order in the 
//         load syntax statement, which causes the filename of the first 
//         datafile loaded to default to the name of the control file with
//         an extension or file type of DAT.
// *Action: Check that INFILE keyword is not placed after one of these -
//          BADFILE/BADDN/DISCARDFILE/DISCARDDN/DISCARDS.  
285, 0, "%s may be used only in conventional path.\n"
// *Cause: HIDDEN can only be specified in the conventional path load.
// *Action: Use the conventional path load. 
286, 0, "ROWS parameter is not supported when loading an IOT.\n"
// *Cause: Specifying save points using the ROWS parameter is not supported
//      when loading an IOT.
// *Action: Remove the ROWS parameter from the command-line arguments. 
287, 0, "No control file name specified.\n"
// *Cause: No control file name was provided at the control prompt.
// *Action: Provide the name of a valid control file at the prompt or on
//          the command line.  
288, 0, "Delimiters may not be specified for collections stored in SDF.\n"
// Cause:  A TERMINATED BY or ENCLOSED BY clause was found along with an SDF
//         (secondary data files) clause for a nested table or varray field.
// Action: The TERMINATED BY or ENCLOSED BY clauses may be specified only if
//         the nested table or VARRAY data is stored in the record in the main
//         data file.
//         If you are loading nested table or VARRAY data from a secondary
//         data file, then you must use COUNT to indicate the number of
//         elements in the secondary data file that are stored in the file.
289, 0, "SQL string for column %s occludes SQL string for column %s.\n"
// Cause:  A SQL string has been associated with both a column object and
//         one of its attributes in the control file. Because the SQL string 
//         of the column object will replace the entire column object in the 
//         VALUE clause of the INSERT statement, the SQL string of the 
//         attribute is ignored. This could cause unexpected or incorrect 
//         values to be loaded.
// Action: Correct the control file so that only the column object or its
//         attribute has a SQL string, but not both.
290, 0, "PIECED keyword (on column %s) allowed only for lob or long columns\n"
// *Cause:  The PIECED keyword cannot be used for non lob or long columns.
// *Action: Remove the PIECED keyword or use lob or long column type. 
291, 0, "Invalid bind variable %.*s in SQL string for column %s.\n"
// Cause:  A bind variable may not refer to a filler field or to a 
//         non-existent field. Also, when running in direct-path mode, a
//         bind variable may not refer to field that represents a LOB stored
//         in a secondary file or a collection.
// Action: Remove the offending bind variable from the SQL string.
292, 0, "ROWS parameter ignored when an XML, LOB or VARRAY column is loaded\n"
// *Cause:  Command-line arguments contained a ROWS parameter. 
//          Specifying save points using the ROWS parameter is not supported
//          when any table being loaded contains a LOB or a column stored as
//          a LOB. XML and VARRAY columns may be stored as a LOB.
// *Action: Remove the ROWS parameter from the command-line arguments.
293, 0, "Missing XMLTYPE directive in control file for table %s\n"
// *Cause: A table of sys.xmltype must specify the XMLTYPE directive.
// *Action:  Add XMLTYPE directive to control file.
294, 0, "invalid name % specified in TREAT AS clause\n"
// *Cause: The type name specified in a TREAT AS clause is invalid.  It might
//         contain characters that are not valid in the client character set 
//         or a quoted string might not be terminated or the name might be 
//         too long to contain a valid schema name and type name.
// *Action: Verify that the type name has valid characters and is not too
//         long. Also, ensure that all quoted strings are terminated.
295, 0, "Warning: Table %s, Column %s - Quoting rule of object attribute bind variables has changed.\n\n"
// Cause:  The quoting rule of bind variables consisting of full object
//         attribute names changed.  The old quoting rule is incorrect because
//         it can lead to ambiguous column references.  For backward
//         compatibility, current load will continue unless ambiguous column
//         references are detected.
// Action: This is only a warning message.  Because the quoting rule of object
//         attribute bind variables has changed, it is recommended that the
//         control file be replaced with the new rule.
//         With the new rule, a full object attribute bind variable name
//         is not enclosed in its entirety in double quotes.  Instead, each
//         attribute name in the bind variable should be independently quoted
//         as needed.  Note that each attribute name is actually an identifier
//         on its own and thus should follow the quoting rules for an
//         identifier.  For example, bind variable ':A.B.C' here consists of
//         3 attribute names (or identifiers): 'A', 'B', and 'C'.
296, 0, "Bind variable %.*s for column %s is ambiguous.\n"
// Cause:  A bind variable can only refer to one column in the control file.
//         Current load could not continue due to ambiguous column references.
// Action: Fix the bind variable.  If this bind variable consists of quotes,
//         check that the quotes are used correctly.
//         For example, the old quoting rule of bind variables consisting of
//         full object attribute names was incorrect because it can lead
//         to ambiguous column references.  Let's say we have an expression
//         "LTRIM(:\"A.B.C\")".   Using the old quoting rule, this bind
//         variable can refer to object attribute columns '"A"."B"."C"',
//         '"A.B".C', and '"A"."B.C"'.  To avoid this confusion, use the new
//         quoting rule for object attribute bind variables, which is to quote
//         each attribute name independently as needed.
//         In the preceding example, if the intended object attribute column is
//         'A.B.C', then the expression rewritten as "LTRIM(:A.B.C)" or 
//         "LTRIM(:\"A\".\"B\".\"C\") will not lead to ambiguities.
297, 0, "Invalid syntax or bind variable in SQL string for column %s.\n"
// Cause:  See following error message for more information.
//         A SQL string cannot have quoted strings improperly terminated.
//         A bind variable in a SQL string cannot have a length of 0, cannot
//         exceed maximum length of 30 characters, and cannot be missing a
//         double quote.
// Action: Fix the SQL string.  See following error for more information.
298, 0, "Filler field name is too long\n"
// *Cause: The specified filler field name exceeded the maximum of
//         30 characters.
// *Action: Specify at most 30 characters.
299, 0, "Virtual column %s in table %s.%s cannot be loaded.\n"
// *Cause: Virtual columns were specified in the control file.
// *Action: Virtual columns cannot be specified in the control file.
//          Remove the virtual column from the SQL*Loader control file.
300, 0, "error while attempting to enable tracing\n"
// *Cause: An error occurred while executing an ALTER SESSION statement to
//         enable tracing.  This message will be followed by the error 
//         returned from ALTER SESSION.
// *Action: No action required.
/
/ Syntax errors
/
301, 0, "string for TERMINATED BY or ENCLOSED BY clause is longer than %d bytes\n"
// *Cause: The size of a string literal is longer than the maximum number 
//         of bytes allowed for an ENCLOSED BY or TERMINATED BY string.  
//         This error can also occur if the string needs to be converted 
//         to the character set of the data file and the resulting string
//         is too long.
// *Action: Use shorter strings for the TERMINATED BY and ENCLOSED BY clauses.
303, 0, "Non-hex character encountered where hex char expected\n"
// *Cause: A non-hex character was found in a hexadecimal string.
// *Action: Change it to the intended hexadecimal character.
304, 0, "Illegal combination of non-alphanumeric characters\n"
// *Cause:  The SQL*Loader control file contains a combination of 
//          non-alphanumeric characters that SQL*Loader does not recognize. 
//          For example, the combination != is recognized as "not equal", 
//          but the combination =! is not valid. 
// *Action: Remove the unrecognized characters from the control file. 
305, 0, "More than one end of file character encountered\n"
// *Cause: The file contains multiple end-of-file marks. 
// *Action: Remove the excess end-of-file characters. 
306, 0, "Token longer than max allowable length of %ld chars\n"
// *Cause: The SQL*Loader control file contains a single word or combination of
//          characters (a token) that is longer than the maximum permissible 
//          value. The maximum possible value is shown. This error could 
//          result from missing spaces, so that multiple tokens are joined. 
// *Action: Check that the proper SQL*Loader control file is being executed
//          Separate tokens, if joined, or shorten the token. 
307, 0, "Warning: conflicting lengths %lu and %lu specified for column %s table %s\n"
// *Cause: The SQL*Loader control file specifies two different lengths for 
//         the named column. There are three ways to specify the length of 
//         a field:      
//          --with the POSITION keyword: POSITION(1:3)      
//         -- with the length specifier: CHAR(6)      
//         -- with the implied length of a datatype; for example, INTEGER     
//          -- A conflict could occur between any two of these 
//            specifications (or among all three, but only two are shown).     
//          A common cause of this error is the specification of some 
//          numeric datatype, such as INTEGER, when the numeric external 
//          form is intended (INTEGER EXTERNAL). The external form consists of 
//          character data, so it is considerably longer than the numeric 
//          form, which consists of binary data. 
// *Action: No action is necessarily required, because SQL*Loader uses only 
//          one of the lengths. Check the log file under the heading "Len" 
//          in the table-description section to see which length was used. 
//          Adjusting the SQL*Loader control file to produce uniform length 
//          specifications will remove the warning.  
308, 0, "%s SQL string of column %s must be in double quotes.\n"
// *Cause: A SQL string was found that was not quoted or in single quotes. 
// *Action: Use double quotes for the SQL string, rather than single quotes.  
309, 0, "No SQL string allowed as part of %s field specification\n"
// *Cause:  Particular field types do not allow SQL strings as part of their
//          field specification (e.g. field corresponding to a LOB column).
//          This was violated and needs to be corrected.
// *Action: Remove the SQL string from the particular field specification.  
310, 0,     "Interval partition values of table %s must be in double quotes.\n"
// *Cause:  A string specified for interval partitioning was found that was 
//          not quoted or in single quotes. 
// *Action: Use double quotes for the interval partitioning values string, 
//          rather than single quotes.  
350, 0, "Syntax error at line %lu.\n"
// *Cause:  num identifies the line in the SQL*Loader control file at which 
//          the error occurred. This message is followed by another of the 
//          form     
//          -- Expecting str1, found str2      
//          where str1 is a description of what SQL*Loader expected in the 
//          SQL*Loader control file, and str2 is what was found. Then 
//          SQL*Loader displays the offending line from the SQL*Loader 
//          control file, indicating the location of the error in the 
//          line by a carat (^) or an asterisk 
//          (*). An example follows:      
//          -- SQL*Loa     er-350: Syntax error at line 28      
//          -- Expecting column name, found keyword CHAR      
//          -- col3 ENCLOSED BY '"', CHAR ENCLOSED "'", 
// *Action: Compare the DDL syntax against the syntax diagrams in Oracle7 
//          Server Utilities and make any necessary corrections.  
//
/ Column errors
/
401, 0, "End field position %ld must be greater than or equal to start %ld\n"
// *Cause: The named field contains a (start:end) clause in which end is 
//          less than start. 
// *Action: Modify the clause so that end is greater than or equal to start.  
402, 0, "Unable to determine length of column %s from specification\n"
// *Cause: The specified datatype does not have an implied length (for 
//          example, a numeric external or RAW datatype), it is not 
//          specified with delimiters, no length was specified, and a length 
//          cannot be determined from a POSITION clause. 
// *Action: If a POSITION clause is specified, adding an end location to it 
//          produces a length specification. This clause then has the form     
//          POSITION(start:end)     
//          A length can also specified after the datatype, as in    
//           INTEGER EXTERNAL (6)      
//          Finally, the field could be specified with delimiters, or the 
//          datatype changed to one that has an implied length. 
403, 0, "Referenced column %s not present in table %s.\n"
// *Cause: The named column is not present in the given table. 
// *Action: Correct the column name or table name. 
404, 0, "Column %s present more than once in %s's INTO TABLE block.\n"
// *Cause: The named column is specified more than once in a single INTO TABLE 
//          statement. 
// *Action: Remove the extraneous column specification.  
405, 0, "Need termination delim with optional enclosure delim: column %s table %s\n"
// *Cause: The named column was specified with an optional enclosure 
//          delimiter, but no termination delimiter. Enclosure delimiters 
//          can only be optional when termination delimiters are present. 
// *Action: Specify a termination delimiter or make the enclosure delimiters 
//          non-optional. 
406, 0, "If data is all generated, number to load cannot be ALL\n"
// *Cause: When only generated data is loaded, a number to load must be 
//          given so SQL*Loader knows when to stop. 
// *Action: Specify a number to load.  
407, 0, "If data is all generated, number to skip is meaningless\n"
// *Cause: When all data is generated, no file is read, and there are no 
//          records to skip. 
// *Action: Remove the number to skip.  
408, 0, "Physical record stack overflow\n"
// *Cause: An internal error has occurred. 
// *Action: Contact customer support.
409, 0, "Number to skip must be table-level, not load-level on continued loads\n"
// *Cause: The SKIP parameter was specified on the command line or in the 
//          OPTIONS statement, but the load was specified as continued with 
//          CONTINUE_LOAD.      
//
//          When a multiple-table direct load is interrupted, it is possible 
//          that a different number of records were loaded into each table. As 
//          a result, the number of records to skip must be specified for each 
//          table when continuing the load. In this case, the load is 
//          specified as continued with the CONTINUE_LOAD statement, and the 
//          number of records to skip is given in each INTO TABLE statement.      
//
//          See also messages 410 and 411 for more information. 
// *Action: Check the log file to determine the appropriate number of 
//          records to skip for each table and specify this number in the INTO 
//          TABLE statement for each table in a continued load or with the 
//          command-line SKIP parameter in a standard load.  
410, 0, "Number to skip must be load-level, not table-level\n"
// *Cause: A SKIP clause was found in the INTO TABLE statement of a standard 
//          (non-continued) load.      
//
//          In a standard load, specified with LOAD DATA, it is not possible 
//          to skip a different number of records for each table. The number 
//          of records to skip must be specified for the entire load by 
//          using the SKIP parameter on the command line or in the OPTIONS 
//          clause.      
//
//          If table-level skip is required, because a different number of 
//          records were loaded into each table (only possible for a multiple-
//          table direct load), then specify a continued load with the 
//          CONTINUE_LOAD statement.      
//
//          See also messages 409 and 411 for more information. 
// *Action: If the load was not a multiple-table, direct path load, then 
//          move the SKIP clause from the INTO TABLE statements to the command 
//          line or to the OPTIONS clause. Otherwise, specify the load as 
//          continued with CONTINUE_LOAD.  
411, 0, "Only a direct path load may be continued\n"
// *Cause: The load is specified with CONTINUE_LOAD, but DIRECT=FALSE. 
//          CONTINUE_LOAD is only possible for a direct path load and is 
//          only necessary for a multiple-table, direct path load when a 
//          different number of records have been loaded into each table.      
//
//          See also messages 409 and 410 for more information. 
// *Action: If CONTINUE_LOAD is necessary, specify a direct load and put the 
//          number of records to skip in each INTO TABLE statement. Otherwise, 
//          use the command line or OPTIONS clause to specify the number of 
//          records to skip and use LOAD DATA instead of CONTINUE_LOAD.  
412, 0, "More columns specified for table %s than the maximum (%d)\n"
// *Cause: More columns were specified for the table than the maximum number 
//          allowed by the database. 
// *Action: Remove the extraneous columns. 
413, 0, "NULLIF or DEFAULTIF clause specified for filler field %s in table %s.\n"
// *Cause: A NULLIF or DEFAULTIF clause was specified in the SQL*Loader
//         control file for the named filler field.  These options cannot 
//         be specified for filler fields.
// *Action: Remove the NULLIF or DEFAULTIF clause from the field definition.
414, 0, "no columns to load for table %s\n"
// *Cause: There were no fields in the data file to be loaded for the table.
//         Probably all fields were identified as FILLER fields.
// *Action: Verify that the FILLER attribute was set correctly for the fields.
415, 0, "column %s in table %s cannot use and be the object of an SDF or LOBFILE\n"
// *Cause:  The named column is identified as the target of a secondary
//          data file (SDF) or LOBFILE clause.  However, the column also gets
//          it's value from an SDF or LOBFILE.  If a field name is named in 
//          an SDF or LOBFILE  clause, then that field cannot have an SDF 
//          or LOBFILE clause.
// *Action: Verify that the SDF and LOBFILE clauses in the SQL*Loader control
//          file name the correct fields.  Also verify that the SDF and LOBFILE
//          clauses are specified for the correct field.
416, 0, "SDF clause for field %s in table %s references a non existent field.\n"
// *Cause:  The secondary data file clause for the field identified another
//          field that doesn't exist in the table definition for the
//          SQL*Loader control file.
// *Action: Verify the definition of the secondary data file to make sure it
//          identifies the intended field.
417, 0, "SQL string (on column %s) not allowed in direct path.\n"
// *Cause:  Because the direct path bypasses SQL processing, the SQL 
//          string cannot be used. 
// *Action: Remove the SQL string or use the conventional path.  
418, 0, "Bad datafile datatype for column %s\n"
// *Cause:  The datatype in the data file specified for the column cannot be
//          used to load the column.  This message is often displayed for
//          columns that need to be loaded with special features.  For
//          example, BFILE columns can only be loaded via the BFILE directive
//          in the control file; same goes for REF fields.
//          in the SQL*Loader control file.  Similarly, REF columns can only
//          be loaded with theREF datatype in the SQL*Loader control file.
// *Action: Determine the datatype of the column in the database check the
//          documentation for the correct mechanisms to use to load columns
//          of that type.
419, 0, "input datatype for column %s is not supported when loading varrays\n"
// *Cause:  The datatype in the SQL*Loader control file for the column is 
//          cannot be used to load data in a varray.
// *Action: Use a different datatype.
420, 0, "unsupported datatype conversion requested for column %s in table %s\n"
// *Cause:  The colummn needs to have it's data converted to another datatype 
//          before loading the data.  The required conversion cannot be done by
//          sqlldr.
// *Action: Verify that the correct datatype was specified for the column. 
421, 0, "error converting data\n"
// *Cause:  This message can be displayed as one of the reasons for rejecting a
//          row.  The sqlldr utility was attempting to convert data for the 
//          column from its datatype in the data file to the datatype for the
//          column in the database.  This message should be followed with
//          another message describing the conversion error.
// *Action: Correct the data in the data file so that it can be converted.
422, 0, "constant element count of %d for column %s is greater than maximum, %d\n"
// *Cause:  The number of elements specified for a varray column in a
//          table is greater than the maximum number of elements
//          allowed for the type of the varray column.
// *Action: Increase the number of elements allowed for the type or remove
//          unwanted elements from the data file.
423, 0, "element count is greater than maximum allowed for the column\n"
// *Cause:  When building a varray from the data file, SQL*Loader encountered
//          more varray elements than are allowed for the column.
// *Action: The previous error messages contain the name of the column and
//          the row number containing the bad data.
424, 0, "table %s makes illegal reference to collection field %s\n"
// *Cause:  A WHEN, OID or SID clause for the table refers to a field declared
//          inside of a collection. 
// *Action: Move the data containing the value for a SID or OID clause outside
//          of the collection definition.
425, 0, "column %s makes illegal reference to collection field %s\n"
// *Cause:  A clause, such as NULLIF or BFILE clause, for the column refers 
//          to a field declared inside of a collection. 
// *Action: Move the data containing the value for a SID or OID clause outside
//          of the collection definition.
426, 0, "count of elements in VARRAY %s comes after the data for the varray\n"
// *Cause:  The COUNT clause for a VARRAY field indicates that the count of
//          elements in the varray is stored in another data field.  However,
//          that data field comes after the varray data in the data file.
//          Since finding the count field would require SQL*Loader to know the
//          number of elements in the VARRAY first, SQL*Loader requires that
//          the count field come before the VARRAY data. 
// *Action: Move the count field to be before the collection data in the data
//          file. 
427, 0, "a field condition references a non-scalar field or a LOB field %s\n"
// *Cause:  The field condition is referencing a field which is either a 
//          nested table, varray, column object, LOB or BILE field.
//          These fields with these typescannot be references by other field.
// *Action: Correct the NULLIF, DEFAULTIF, or WHEN clauses to reference only
//          non-LOB scalar data fields.
428, 0, "count for field %s not stored in character or integer field\n"
// *Cause:  The count clause for a field references another field, but the
//          referenced field is not a character or integer datatype.
// *Action: Modify the count field so that it reference a a data field that
//          has the count in an integere or character format.
429, 0, "insufficient number of elements found for varray\n"
// *Cause:  The COUNT directive was specified for a varray, but the number of
//          elements found is less than the number specified by the COUNT
//          directive.
// *Action: Correct the data so that the count and the number of 
//          elements agree.
430, 0, "NULL nested table element is not allowed\n"
// *Cause:  A row in a nested table was set to NULL.  Nested tables cannot
//          contain NULL fields.
// *Action: Correct the data so that there are no NULL rows in the nested 
//          table.
431, 0, "illegal NULLIF or DEFAULTIF clause specified for nested table column %s\n"
// *Cause:  Rows in a nested table cannot be set to NULL.  SQLLDR displays this
//          error when a NULLIF clause was specified for the element that
//          defines the row that make up a nested table.  SQLLDR also displays
//          this error if a DEFAULTIF clause is specified for an element that
//          is a named type, since SQLLDR will set a named type to NULL if
//          the DEFAULTIF evaluates to TRUE.
432, 0, "converted data too large\n"
// *Cause:  This message is preceded by a message identifying a row and column.
//          It is displayed when there is insufficient room to convert the
//          data from the datatype in the input file to the datatype for 
//          the column in the database.
// *Action: Modify the data so that it fits in the database field.
433, 0, "no attributes found for column object %s in table %s\n"
// *Cause:  No attributes are to be loaded for a column object named in the 
//	    control file.  This can happen if all fields in the definition for
//	    the column object in the control are designated as FILLER fields.
// *Action: Either specify attributes to load for the column object or remove
//          the column object from the control file.
434, 0, "Can not load LOB/XML in a nested table along with the parent table.\n"
// *Cause: Loading LOBs and XML data within a nested table at the same time 
//         as the parent table is not supported.
// *Action: Load the nested table with the LOB or XML column separately from 
//          the parent table.  
435, 0, "invalid constant value %s for nested table column %s\n"
// *Cause:  A constant value was specified for the SETID of a nested table
//          column.  An error occured while translating the character constant
//          into a SETID.
// *Action: Make sure the constant string contains valid hexadecimal
//          characters and that there are 32 hexadecimal characters.
436, 0, "error converting GUID\n"
// *Cause: The value of the field named in the message is used to populate
//         the column named in the messsage.  Because column is a Set ID or
//         an Object ID, the field needs to be converted.  This message 
//         indicates that there was a conversion error.  If the field is 
//         a character field, then the conversion error could be caused by 
//         too many or too few haxeadecimal charactersI. Also, one or more 
//         of the characters in the field might not be a valid hexadecimal 
//         character.  If the field contains RAW data, then either too many 
//         or to few bytes were specified for the field.
// *Action: Fix the data and reload the row.
/
/ REF related error(s):
/
440, 0, "Invalid table specified as scope of a REF\n"
// *Cause:  As part of the REF directive one specifies the table name or
//          another fields name which contains the table name of the table
//          which the REF references.
// *Action: Make sure that the right referenced table name is specified.


456, 0, "end of collection found after %d elements when looking for %d elements\n"
// *Cause:  A count value was specified for a varray or nested table column
//          and the number of rows found is less than the number of rows 
//          specified
// *Action: Verify that the count field has the correct value and that there
//          is no missing data for the collection.
457, 0, "Comparison text of CONTINUEIF LAST must have length 1 not %ld\n"
// *Cause: The comparison text is too long. It can only be one character. 
// *Action: Reduce the comparison text to one character.  
458, 0, "Comparison text ('%s') of CONTINUEIF LAST must be non-whitespace\n"
// *Cause: The comparison text is a whitespace character (blank or tab). 
// *Action: Change the comparison text to a non-whitespace character.  
459, 0, "error fetching numeric value for sequence on column (%s)\n"
// *Cause: An attempt was made to retrieve a non-numeric value for
// a sequenced column.
// *Action: Verify that the data for the sequenced column is numeric. Then
//          retry the operation.
460, 0, "Column (%s), form of use (%d) does not match char set id of (%d)\n"
// *Cause: The given column with the given form of use does not have
//         the same character set ID as a previous column with the same
//         form of use.
// *Action: This should not happen.  Contact ORACLE support and supply
//          the following information: DDL for the table being loaded,
//          and the SQL*Loader control file.
//
// ADDED in 8.1
461, 0, "direct path loading of datatype for column %s not supported\n"
// *Cause: The datatype for the specified column is one that cannot be 
//         loaded with direct path.
// *Action: If the datatype is supported with conventional path, load the 
//          table using conventional path.  
462, 0, "error inserting LOB into column %s, row %ld, table %s\n"
// *Cause:  An error occurred while attempting to write a lob into a row.  
// *Action: See accompanying messages describing why the LOB could not be 
//          loaded, what actions sqlldr took (if any),  and where the errors
//          may be in order to reload.  
463, 0, "secondary data file for LOB is %s\n"
// *Cause:  The secondary data file that was in use for populating the LOB 
//          when an error occured.
464, 0, "file offset for beginning of lob is %s\n"
// *Cause:  The offset into the secondary data file that contains the 
//          start of the LOB that was being written when an error occured.
465, 0, "%s directive expects %d arguments, %d found.\n"
// *Cause:  You specified a directive such as COUNT() or BFILE() in the 
//          SQL*Loader control file.  This directive specifies a fixed number 
//          of arguments, but the SQL*Loader control file contains a 
//          different number of arguments.
// *Action: Correct the SQL*Loader control file so that the directive 
//          contains the correct number of arguments.
466, 0, "Column %s does not exist in table %s.\n"
// *Cause:  The SQL*Loader control file specified a table column that 
//          does not exist.
467, 0, "attribute %s does not exist in type %s for table %s.\n"
// *Cause:  The SQL*Loader control file specified an attribute that does 
//          not exist for the specified type.  The table that contains the
//          type is also identified in the error message.
// *Action: Verify that the correct table in the correct schema is named in
//          the SQL*Loader control file. Also verify that the column name 
//          is spelled correctly.
468, 0, "OID directive expects 1 argument, %d found.\n"
// *Cause:  More than one argument was specified for an OID clause.
// *Action: Specify the name of the field containing the value to use for the
//          OID.  If the OID for the table is user-defined, then do not use
//          the OID clause in the control file.
469, 0, "SID directive expects 1 argument, %d found.\n"
// *Cause:  More than one argument was specified for a SID clause.
// *Action: Only specify the name of the field containing the value to use for
//          the SID in the SID clause.
470, 0, "table %s does not have system generated OID\n"
// *Cause:  You specified an OID clause for a table but the table is either
//          not an object table or the table is an object table but the OIDs
//          for the rows are not system generated.
// *Action: Verify that the you are loading the correct table.  If you are,
//          then you must not specify the OID clause for this table.
//          You should use the OID clause only when the table is an object
//          table, has system generated OIDs and when you want to specify 
//          OIDs to be assigned to each row of the table.
471, 0, "OID or SID clause has an argument that is CONSTANT\n"
// *Cause:  You specified a CONSTANT as an argument in an OID clause for an
//          object table or in the SID clause for a nested table column.  Since
//          these columns must have unique values, SQL Loader does not allow
//          the a constant to be specified for their values.
// *Action: Store the OID for each row in a filler field and specify the name
//          of the filler field as an argument.
472, 0, "collections can contain only one non FILLER field specification\n"
// *Cause:  More than one non filler field specification is found in a 
//          collection field's member field list.
// *Action: See correct syntax in the Utilities Manual.  If indeed there
//          is more than one attribute that makes up the particular
//          collection, then it must be a collection of a object type which
//          needs to be specified using the COLUMN OBJECT field specification
//          syntax.
473, 0, "nesting of collections is not allowed.\n"
// *Cause:  Nesting of one collection type field description within another
//          is not allowed.
// *Action: Verify that collection nesting is attempted in the 
//          SQL*Loader control file.  Correct the mistake.
474, 0, "no value set for dynamic file for column %s in table %s row %ld\n"
// *Cause:  The data for the named column is in a dynamic LOBFILE or 
//          secondary data file.  This message is returned when the field 
//          containing the name of the file with the data for this field 
//          has not been set or is NULL.  This could be because the record
//          in the data file does not match the format described by the 
//          SQL*Loader control file.
// *Action: Correct any errors in the data file or the SQL*Loader control file.
475, 0, "field for dynamic file name is %s in table %s\n"
// *Cause:  This message is always displayed after message 474.
476, 0, "count of elements for collection is not set or null, 0 will be used\n"
// *Cause:  This message is displayed following a message that identifies the
//          column and row that contained the problem.  The message indicates
//          that the collection field named in the previous message has the
//          count of elements in the collection stored in another field.
//          This message is displayed if the field containing the count 
//          does not have a value or is set to NULL.  When this happens, 
//          SQL*Loader uses 0 as the number of elements.
// *Action: If 0 is not the count of elementsfor the collection, correct the
//          data in the data file.
477, 0, "REF directive for field %s requires at least two arguments\n"
// *Cause:  The SQL Loader control file contains a REF directive for the field,
//          but only one argument was supplied for the directive.  The REF
//          directive always requires at least two arguments.
// *Action: Supply the missing argument to the REF directive.  Remember that
//          you must always supply a table name to the REF directive even if
//          the REF is scoped.
478, 0, "unable to continue due to missing filename for LOBFILE or SDF\n"
// *Cause:  The name for a LOBFILE or secondary data file is either missing
//          or NULL for the current row.  SQL*Loader is unable to continue 
//          loading since it can't determine how to get the LOB for the 
//          next row.
// *Action: Correct the data file so that there are valid values for all
//          fields containing the names of LOBFILEs and secondary data files.
479, 0, "REF directive for column %s expects %d arguments; found %d.\n" 
// *Cause:  The number of arguments in the REF directive for the column is 
//          incorrect.
// *Action: Specify the correct number of arguments for REF.  Remember that 
//          the REF directive always requires a table name.  Also, primary key
//          REFs require one arguments for each field in the primary key.
480, 0, "EXPRESSION may not be used with elements of a collection.\n"
// *Cause:  The EXPRESSION keyword is followed by a required SQL string
//          expression and is used to load a column with the result of the
//          SQL string expression instead of with a value from the input
//          data file.  However, this capability is not allowed with elements
//          of a collection.
// *Action: Remove the EXPRESSION keyword and associated SQL string from the
//          collection element in the control file.
481, 0, "HIDDEN may not be used with non-scalar fields.\n"
// *Cause:  The HIDDEN keyword is only allowed for scalar fields.
// *Action: Remove the HIDDEN keyword from the non-scalar field in the
//          control file.
482, 0, "type %s is not a subtype\n"
// *Cause:
// *Action:
//
483, 0, "type %s is not instantiable\n"
// *Cause:
// *Action:
//
484, 0, "type %s is not a valid subtype for %s\n"
// *Cause:
// *Action:
//
485, 0, "table %s may not be loaded using a subtype\n"
// *Cause:
// *Action:
//
486, 0, "sql-strings may not be specified for collection field %s\n"
// *Cause: A sql-string was specified as part of the description of the field
//	   that is inside a nested table or varray.  Sql-strings cannot be 
//	   used to load a field in a varrary or nested tables.
// *Action: Remove the sql-string from the field description.  Modify the 
//	    data file so that it contains the values to be loaded into the
//	    column in the collection.
487, 0, "COUNT clause required for collection %s\n"
// *Cause: A VARRAY or NESTED TABLE was defined in the SQL Loader control file
//         and all of the fields in the VARRAY or NESTED TABLE are generated
//         by SQL Loader and do not come from a data file.  SQL Loader 
//         requires a COUNT clause be specified so that it knows how many 
//         elements to add to the VARRAY or NESTED TABLE for each row.
// *Action: Add a COUNT clause to the VARRAY or NESTED TABLE definition.
488, 0, "%s not a named collection type for filler field %s\n"
// *Cause: The FILLER option was specified for a VARRAY or NESTED TABLE field
//         in the SQL Loader control file.  However, the type name specified
//         for the field is not the name of a VARRAY or NESTED TABLE type.
// *Action: Verify that the correct type name was specified. If the type is
//          defined in a different schema, also verify that the correct
//          schema name is specified.
489, 0, "cannot insert NULL object into object table %s, row %d \n"
// *Cause: There was no data specified in the control file, a lob file,
//         or a secondary data file for this object column.
// *Action: Place valid data for this column in the appropriate file prior
//          to invoking SQL*Loader to load data into this table. 
490, 0, "absolute position is not allowed for inline collections\n"
// *Cause:  The absolute position specification was used for inline collections.
//          Specifying the absolute position for inline collections is not
//          supported.
// *Action: Use relative positioning for inline collections.
/
/ file i/o and o/s errors
/
500, 0, "Unable to open file (%s)\n"
// *Cause: SQL*Loader could not open the named file. 
// *Action: Check the operating system messages below this one in the log 
//         file.  
501, 0, "Unable to read file (%s)\n"
// *Cause:  SQL*Loader could not read the named file. 
// *Action: Check the operating system messages following this message
//          in the log file.  
502, 0, "unable to open data file '%s' for field %s table %s\n"
// *Cause:  An attempt to open a LOBFILE or secondary data file failed.
// *Action: Check the operating system messages following this message for
//          information on why the open failed.  Verify that the correct 
//          name is specified for the LOBFILE or secondary data file.
503, 0, "Error appending extension to file (%s)\n"
// *Cause: SQL*Loader could not append the default extension to create the 
//         filename. The given name could be too long or contain illegal 
//         characters. 
// *Action: Check the specified filename.  
504, 0, "Error skipping records in file (%s)\n"
// *Cause: SQL*Loader could not open the file or could not read from it. 
// *Action: Check that the file is where it is expected and that read access 
//         has been granted.
505, 0, "error reading LOBFILE\n"
// *Cause:  An attempt to read a secondary data file failed.
// *Action: Check the operating system message that follows this message for
//          more information.
506, 0, "formatting error reading SDF or LOBFILE %s for column %s in table %s\n"
// *Cause:  The the record format of the named LOBFILE or SDF file is 
//          incorrect.
// *Action: Fix the record formatting problems in the file.
507, 0, "unexpected EOF reading SDF or LOBFILE %s for column %s in table %s\n"
// *Cause:  The end of file was reached for a secondary data file or LOBFILE
//	    before the data for the current row was found.
// *Action: If the file is a LOBFILE, verify the correct datatype was
//	    specified for the field.  If the file is a secondary data file,
//          make sure the record format is specified correctly in the 
//          SQL*Loader control file.
508, 0, "record formating error in data file %s\n"
// *Cause:  The data found in the data file does not correspond to the record
//          format in the SQL*Loader control file.
// *Action: Verify that all records in the data file match the format as
//          described in the SQL*Loader control file.
509, 0, "System error: %s\n"
// *Cause: A platform-specific error was returned during an operation.  This
//         message is used to display the text of the error.
510, 0, "Physical record in data file (%s) is longer than the maximum(%ld)\n"
// *Cause: The datafile has a physical record that is too long. 
// *Action: Use CONCATENATE or CONTINUEIF. Break up the physical records.  
511, 0, "Unable to initialize read functions\n"
// *Cause: SQL*Loader could not initialize the read functions. 
// *Action: Check the errors below this message in the log file for more 
//         information. 
512, 0, "Unable to free read buffer\n"
// *Cause: An internal error has occurred. 
// *Action: Contact customer support.
513, 0, "Unable to close file (%s)\n"
// *Cause: SQL*Loader could not close the named file. 
// *Action: Check the errors below this message in the log file for more 
//         information. 
514, 0, "Error getting elapsed time\n"
// *Cause: SQL*Loader could not get the elapsed time from the system. 
// *Action: No action required.  
515, 0, "Error getting CPU time\n"
// *Cause: SQL*Loader could not get the CPU time from the system. 
// *Action: No action required.  
516, 0, "Control file (%s) has no contents\n"
// *Cause: The named file was found to be empty. 
// *Action: Check that the intended file was referenced and that it is not 
//          empty.  
517, 0, "Error decomposing file name (%s)\n"
// *Cause: SQL*Loader could not break down the filename into its component 
//          parts. 
// *Action: Check the filename for illegal characters.  
518, 0, "Error reassembling file name (%s)\n"
// *Cause: SQL*Loader could not put the filename back together again from 
//          its components. 
// *Action: Check the filename for illegal characters.  
520, 0, "lfimknam failed for file (%s)\n"
// *Cause: LFI failed to make a name object for the file.
// *Action: Contact Oracle Worldwide Support.
521, 0, "lfilini failed for file (%s)\n"
// *Cause: LFI failed to create or initialize a file object for the file.
// *Action: Contact Oracle Worldwide Support.
522, 0, "lfiopn failed for file (%s)\n"
// *Cause: LFI failed to open the file.
// *Action: Check for any possible operating system errors and/or potential
//          memory problems.
523, 0, "error %ld writing to file (%s)\n"
// *Cause: Could not write to specified file.
// *Action: Check the following:
//        the file actually resides in the specified location
//        you have write privileges on the file
//        you have sufficient disk space
//        you have not exceeded your disk quota
//
//       If all of these conditions are satisfied, then retry the operation.
524, 0, "partial record found at end of datafile (%s)\n"  
// *Cause: An incomplete record was found at the end of the indicated  
//         datafile.  
// *Action: Make sure the last record in the datafile is complete and has 
//          the correct terminating character(s). Also, if fixed-length records
//          are in use, verify that no record exceeds the platform-specific 
//          length for a single record.  
525, 0, "OCI return status: success\n"
// *Cause: The message describes the status code returned by an OCI call.
// *Action: See surrounding messages for more information.
526, 0, "OCI return status: success with info\n"
// *Cause: The message describes the status code returned by an OCI call.
// *Action: See surrounding messages for more information.
527, 0, "OCI return status: no data\n"
// *Cause: The message describes the status code returned by an OCI call.
// *Action: See surrounding messages for more information.
528, 0, "OCI return status: error\n"
// *Cause: The message describes the status code returned by an OCI call.
// *Action: See surrounding messages for more information.
529, 0, "OCI return status: invalid handle\n"
// *Cause: The message describes the status code returned by an OCI call.
// *Action: See surrounding messages for more information.
530, 0, "OCI return status: need data\n"
// *Cause: The message describes the status code returned by an OCI call.
// *Action: See surrounding messages for more information.
531, 0, "OCI return status: still executing\n"
// *Cause: The message describes the status code returned by an OCI call.
// *Action: See surrounding messages for more information.
532, 0, "OCI return status: continue\n"
// *Cause: The message describes the status code returned by an OCI call.
// *Action: See surrounding messages for more information.
533, 0, "OCI return status: unknown, value is %d\n"
// *Cause: An unknown status was returned by an OCI call.
// *Action: See surrounding messages for more information.
/
/
/ Start of messages corresponding to status returned by sllf
/ Note that because of how these messages are used, no formatting arguments
/ are allowed in these messages.
/
550, 0, "success\n"
551, 0, "internal error: error initializing slf\n"
// *Cause: An internal error occured while trying to initialize the file 
//         I/O component.
// *Action: Call customer support.
552, 0, "insufficient privilege to open file\n"
// *Cause: SQL*Loader does not have the previleges required to open the file.
// *Action: Verify that the correct file was specified and that the file has
//          the appropriate permissions.
553, 0, "file not found\n"
// *Cause: The specified file cannot be found.
// *Action: verify that the correct name exists and whether the file is in 
//          the intended location.
554, 0, "error opening file\n"
// *Cause: An error occurred while trying to open the file.  No further
//         information is available.
// *Action: Verify that the file is accessible.
555, 0, "unrecognized processing option\n"
// *Cause: The processing option specified for the file cannot be processed. 
// *Action: Verify that the processing options specified for the file contain
//          legal syntax for the platform where SQL*Loader is running.
556, 0, "unable to allocate read buffer\n"
// *Cause: Attempt to allocate the read buffer failed.
// *Action: If possible, try specifying a smaller size for the read buffer.
557, 0, "unable to allocate memory\n"
// *Cause: An attempt to allocate some memory to track I/O for the file
//         failed.
// *Action: Contact customer support.
558, 0, "attempt to use SKIP parameter with linked-in loader\n"
// *Cause: SKIP parameter was specified with a linked-in file processor.
// *Action: Do not use the SKIP parameter in this case.
559, 0, "error closing file\n"
// *Cause: An error occured while closing the file.
// *Action: Contact customer support.
560, 0, "error reading file\n"
// *Cause: An error occurred while reading the file.
// *Action: Make sure the file is still accessible.
561, 0, "end of file\n"
// *Cause: End of file reached.
562, 0, "record too big\n"
// *Cause: A record in the file is larder than the read buffer.
// *Action: Verify that the file is not corrupt.  If not, try specifying a
//          larger size for the read buffer.
563, 0, "bad length for VAR record\n"
// *Cause: The length protion of a VAR record contains non-numeric data.
// *Action: Fix the data in the file.
564, 0, "illegal hexadecimal literal specified for record delimiter\n"
// *Cause: A hexadecimal literal that contains the record delimiter for 
//	   the file does not contain a valid hexadecimal string.
// *Action: Verify that the correct hexadecimal value was specified in
//          the processing options for the file.
565, 0, "unexpected error during skip\n."
// *Cause: an unexpected error occured while attempting to skip records.
// *Action: This message should be followed by another message giving more 
//	    specific information about the error
566, 0, "partial record found at end of datafile\n"  
// *Cause: An incomplete record was found at the end of file.  
// *Action: Make sure the last record in the datafile is complete and has 
//          the correct terminating character(s).
567, 0, "unable to derive file name\n"  
// *Cause: An error occured while attempting to build a name for a data file,
//         bad file, discard file or log file.  
// *Action: Instead of relying on SQL Loader to build these file names, try
//          specifying full file specifications for these files in the control
//          file or on the SQL Loader command line.
568, 0, "error writing to file\n"
// *Cause: Unexpected error occured while writing to a file.  This message 
//         is followed by another message with more information about the 
//         error.
569, 0, "READSIZE parameter exceeds maximum value %s for platform\n"
// *Cause: The value specified for the READSIZE parameter on the SQL Loader
//         command line was larger than the maximum size allowed on the 
//         platform executing the SQL Loader command
// *Action: Decrease the size of the READSIZE parameter to be less than the
//         maximum size allowed on the platform.
/
600, 0, "Bind size of %lu bytes increased to %lu bytes to hold 1 row.\n"
// *Cause: The space needed to contain a single row is longer than the 
//          specified bind size.  The value used for the bind size will be
//          increased to handle the larger size
// *Action: No action is required.  This message will go away if the new value
//          in the error message is specified for the bind size.
601, 0, "For INSERT option, table must be empty.  Error on table %s\n"
// *Cause: A non-empty table is being loaded with the INSERT option. 
// *Action: Use the REPLACE keyword to empty the old table and store the new 
//          data in its place. Use the APPEND keyword to leave the table's 
//          contents intact 
//          and add the new data to it. 
602, 0, "Maximum converted length %lu of column %s is too big for bind array\n"
// *Cause:  The named column cannot undergo the specified character set 
//          conversion and still be placed in a contiguous piece of memory 
//          on the system. 
// *Action:  Specify a shorter data column or eliminate the conversion.  
603, 0, "Maximum length %lu of column %s is too big for bind array\n"
// *Cause:  The named column cannot be put in a contiguous piece of memory 
//          on the system. 
// *Action:  Specify a shorter data column. 
604, 0, "Error occurred on an attempt to commit\n"
// *Cause: An error occurred while trying to commit changes to the database. 
// *Action: Look at the message listed below this one in the log file for more 
//          information. 
605, 0, "Non-data dependent ORACLE error occurred -- load discontinued.\n\n"
// *Cause: An error occurred that is independent of the data. For example, 
//          an out-of-space condition. Because all further rows will be 
//          rejected, the load is discontinued. (If the error were data 
//          dependent, then other rows might succeed.) 
// *Action: See the errors below this one in the log file for more 
//          information.  
606, 0, "Object %s in INTO TABLE clause is not a local table\n"
// *Cause: The synonym specified in the INTO TABLE clause in the SQL*Loader 
//          control file specifies a remote object via a database link. Only a 
//          synonym for an existing local table can be specified in the INTO 
//          TABLE clause.
// *Action: Ensure that a local table name or a synonym for a local table is 
//          fully specified in the INTO TABLE clause. The table must already 
//          exist. 
607, 0, "partition not empty for INSERT option; table %s, partition %s\n"
// *Cause: An attempt was made to use the INSERT option on a non-empty 
//          partition.
// *Action: Empty the partition, or use the REPLACE or TRUNCATE option.
608, 0, "subpartition not empty for INSERT option; table %s, subpartition %s\n"
// *Cause: An attempt was made to use the INSERT option on a non-empty 
//          subpartition.
// *Action: Empty the subpartition, or use the REPLACE or TRUNCATE option.
609, 0, "value used for ROWS parameter changed from %d to %d\n"
// *Cause: SQL Loader adjusted the value it was using for the ROWS parameter to
//         the new value reported.  This is an informational message and not
//         an error. SQL Loader will adjust the value of the ROWS parameter if
//         the amount of memory specified by BINDSIZE is not large enough to
//         hold data for the number of rows specified.  SQL Loader will also
//         change the value of the ROWS parameter for conventional path loads
//         if the value is larger than 65534.  Conventional path load can load
//         at most 65534 rows at a time. 
// *Action: If the limit of 65534 rows for conventional path load is not being
//          reached, then try increasing the value of BINDSIZE.
610, 0, "cannot load system partitioned table %s; partition name(s) required\n"
// *Cause: An attempt was made to load a system partitioned table with no
//          partitioning clause specified in the SQL*Loader control file.
// *Action: Specify the partition name(s) in the SQL*Loader control file.
/
/ format errors
/
620, 0, "Initial enclosure character not found\n"
// *Cause: A mandatory initial enclosure delimiter was not present. Either 
//          it is missing on the current field or the previous field is 
//          missing an identical closing delimiter. 
// *Action: Supply the missing delimiters.  
621, 0, "Field in data file exceeds maximum length\n"
// *Cause: A field exceeded its maximum allowable length.  The maximum length
//         is either the length specified in the SQL*Loader control file, or,
//         for delimitable fields without a length specified, the default
//         maximum length (255 bytes).
// *Action: Check for missing delimiters and/or shorten the field.
622, 0, "Column not found before end of logical record (use TRAILING NULLCOLS)\n"
// *Cause: The logical record ended before all specified fields were found.
// *Action: If the missing fields should be loaded as null, use the TRAILING 
//          NULLCOLS clause. Otherwise, correct the data.  
623, 0, "second enclosure string not present\n"
// *Cause: The logical end of record or the end of a LOBFILE was reached
//         before a second enclosure delimiter was found. 
// *Action: Correct the data file to include the missing delimiter. 
624, 0, "no terminator found after TERMINATED and ENCLOSED field\n"
// *Cause: No termination delimiter was found after the enclosed field ended. 
// *Action: Supply the missing termination delimiter.  
/
/ 	625 -639 reserved for multi-byte prototype 
/
625, 0, "Multibyte character error in control file.\n"
// *Cause:  Incomplete multi-byte character strings were found in the 
//          SQL*Loader control file. 
// *Action: Edit the SQL*Loader control file to check that all multi-byte
//          character data is valid. 
626, 0, "Character set conversion buffer overflow.\n"
// *Cause:  A conversion from the datafile character set to the client
//          character set required more space than that allocated for
//          the conversion buffer.  The size of the conversion buffer
//          is limited by the maximum size of a varchar2 column.
// *Action: The input record is rejected.  The data will not fit into
//          the column.
627, 0, "Character set conversion graph not available.\n"
// *Cause:  A conversion from the datafile character set to the client
//          character failed due to the conversion graph not being available.
// *Action: Contact Oracle support.  Check NLSRTL installation.
628, 0, "Character set conversion error.\n"
// *Cause:  A character set conversion error occurred.
// *Action: Contact Oracle support.  Check NLSRTL installation.  Provide
//          a reproduceable test case.
//
640, 0, "Variable length field was truncated.\n"
// *Cause: The end of the logical record was encountered before the end of a 
//          variable length field. The length of each variable-length field is 
//          embedded in the field, so SQL*Loader knows that more data should 
//          have been present. 
// *Action: Check the data for inadvertent truncation and verify the 
//          SQL*Loader control file specifications against the log file;
//          the field may be starting in the wrong place. 
641, 0, "Invalid packed decimal nibble.\n"
// *Cause: Each byte in a packed decimal field contains two 4-bit 
//          nibbles. Each nibble must have a valid value. 
// *Action: Check the SQL*Loader control file's specifications against the 
//          log file to  ensure that the field location was specified 
//          correctly. Check the contents of the field.  
642, 0, "Relative start position > absolute field end position.\n"
// *Cause: A field specified as POSITION(*+n:y) had its relative start occur 
//          after the absolute position y.
// *Action: Check that a delimiter is not missing and that the values of n and 
//          y are correct. 
643, 0, "error executing INSERT statement for table %s\n"
// *Cause: A fatal error occured while attempting to insert data into the
//         table.
// *Action: Refer to the messages that follow for more information. If you 
//	    specified SQL stings for any of your columns, verify that strings
//	    are correct.  Specifcally, check for balanced parenthesis and 
//	    correct use of quotation marks.
//
// Another format error
644, 0, "end of logical record found when reading length of varying length field\n"
//* Cause:  While attempting to read the length portion of a varying 
//          length field, then end of the logical record was reached.
//* Action:  Verify that the SQL*Loader control file describes the data 
//           correctly and that the data in the data file matches the 
//           description in the SQL*Loader control file 
645, 0, "error converting character length field to a number\n"
//* Cause: An error occurred while attempting to convert the characters 
//         containing the count portion of a VARCHARC or VARRAWC field.
//* Action: Verify that the count portion for the column has the correct value.
646, 0, "lob set to EMPTY in column %s, row %ld, table %s\n"
//* Cause: Encountered errors (e.g. parsing errors in LOBFILE) while loading 
//         LOBs.  The row will remain in the table and its LOB column will 
//         be initialized to empty.  Loading of other records will continue.
//* Action: Correct the data file (see accompanying messages) and reload.
647, 0, "Integer to number conversion error\n"
// *Cause: An error occurred while attempting to convert an integer to an
//         Oracle number format. 
// *Action: Verify that the integer field in the data file is a valid integer.
//          If the INTEGER(N) syntax was used, then verify that the length
//          specified is valid. 
648, 0, "Value larger than specified precision allows for this column\n"
// *Cause: 
// *Action: 
649, 0, "Quoted string missing closing quote\n"
// *Cause: A quoted string in the control file is missing a closing quote.
// *Action: Insert the closing quote as appropriate.
650,0,"incomplete lob data written for column %s, row %ld, table %s\n"
//* Cause: Encountered errors (e.g. parsing errors in LOBFILE) while loading 
//         LOBs using direct path.  The row will remain in the table and its 
//         LOB column may not be complete.  Loading of other records will 
//         continue.
//* Action: Correct the data file (see accompanying messages) and reload.
651,0,"error skipping lob for column %s, row %ld, table %s\n"
//* Cause: Encountered errors (e.g. parsing errors in LOBFILE) while skipping 
//         LOBs.
//* Action: Correct the data file (see accompanying messages) and reload.
652, 0, "Invalid zoned decimal byte.\n"
// *Cause: Each byte of a zoned decimal field must have a valid value
//         based on the character set encoding used.  ASCII-based zoned
//         decimals must follow the formats specified in the VAX Architecture
//         Reference Manual. EBCDIC-based zoned decimals must follow the
//         formats specified in the ESA/390 Principles of Operations,
//         version 8.1.
// *Action: Check the SQL*Loader control file's specifications against the 
//          log file to  ensure that the field location was specified 
//          correctly. Check the contents of the field.
653, 0, "XML data set to NULL in column %s, row %ld, table %s\n"
//* Cause: Encountered errors (e.g. parsing errors in LOBFILE) while loading
//         LOBs into an XML column.  The row will remain in the table and 
//         its XML column will be initialized to null.  Loading of other 
//         records will continue.
//* Action: Correct the data file (see accompanying messages) and reload.
654, 0, "Variable length field exceeds maximum length.\n"
// *Cause: A variable length field (with a leading length subfield) exceeded
//         its maximum allowable length.  The maximum length is either the
//         length specified in the SQL*Loader control file, or, the default if
//         not specified (4kb).
// *Action: Shorten the field and its length.
655, 0, "cannot load object-relational XML attribute using direct path \n"
// *Cause: The table being loaded contains a column object which contains
//         an XML attribute with a storage type of object-relational.  This
//         type of attribute cannot be loaded with direct path.
// *Action:Perform the load with conventional path mode.
656, 0, "position specification for column %s is not allowed in external table loads\n"
// *Cause: Use of a position specification was present in an external table
//         load.
// *Action: Either remove the position specification, change the position
//          specification to a field name reference, use direct path, or use
//          conventional path.
/
/ internal errors
/
700, 0, "Out of memory while performing essential allocations [%ld]\n"
// *Cause: SQL*Loader could not allocate the memory it needs. 
// *Action: Check the operating system and process memory. Increase memory 
//          available to SQL*Loader, if possible. If using direct path,
//          try lowering the columnarrayrows option (see log file for current
//          default value).
702, 0, "Internal error - %s\n"
// *Cause: An internal error has occurred. 
// *Action: Make a note of the message and contact customer support.  
703, 0, "Internal error: argument %d\n"
// *Cause: An internal error has occurred. 
// *Action: Make a note of the message and the number, then contact customer 
//          support.  
704, 0, "Internal error: %s [%d]\n"
// *Cause: An internal error has occurred. 
// *Action: Make a note of the message and the number, then contact customer 
//          support.  
705, 0, "Internal error\n"
// *Cause: An internal error has occurred. 
// *Action: Contact customer support.
706, 0, "Bad argument to ulerr [%lu].\n"
// *Cause: An internal error has occurred. 
// *Action: Contact customer support.
707, 0, "\nSql*Loader exiting with return code=[%d].\n"
708, 0, "Internal error: unknown status %d returned from sllf layer\n"
// *Cause: An unknown status was returned by a call to the sllf layer.
// *Action: Contact customer support.
709, 0, "Internal error calling SLTS layer: %s failed\n"
// *Cause: A nonsuccess status was returned by a call to the SLTS layer.
// *Action: Contact customer support.
710, 0, "Internal error: direct path stream buffer not loaded\n"
// *Cause: A direct path stream buffer was built but not loaded.
// *Action: Contact customer support.
711, 0, "Internal error: bad address for little endian UTF16 conversion\n"
// *Cause: Address for little endian UTF16 data not in a valid buffer.
// *Action: Contact customer support.
712, 0, "Internal error: bad address for big endian UTF16 conversion\n"
// *Cause: Address for big endian UTF16 data not in a valid buffer.
// *Action: Contact customer support.
713, 0, "Internal error calling SLTS layer: %s failed with return code [%d].\n"
// *Cause: A nonsuccess status was returned by a call to the SLTS layer.
// *Action: Contact customer support.
/
/ external table load specific errors
/
800, 0, "%s specified and ignored\n"
// *Cause: An option was specified that is not supported by External Table
//         load.
// *Action: Do not specify the unsupported option or do not use External Table
//          load.
801, 0, "all INTO TABLE clauses must have the same options (%s)\n"
// *Cause: At least two INTO TABLE clauses have different options set.
// *Action: Set the options to be the same or do the loads separately.
802, 0, "numeric EXTERNAL with DEFAULTIF clause not supported by External Table\n"
// *Cause: A numeric EXTERNAL type was specified with a DEFAULTIF clause and that
//         is not supported by External Table Load.
// *Action: Remove the clause if possible or do not use External Table Load.
803, 0, "%s field type not supported by External Table\n"
// *Cause: The specified field type is not supported by External Table Load.
// *Action: Remove the specified field type or do not use External Table Load.
804, 0, "SEQUENCES with intervals are not supported by External Table Load.\n"
// *Cause: A sequence with an interval is specified and is not supported by
//         External Table Load.
// *Action: Remove the interval from the sequence, or the the sequence itself,
//          or do not use External Table Load.
805, 0, "%s not supported by External Table\n"
// *Cause: The specified option is not supported by External Table Load.
// *Action: Remove the specified option or do not use External Table Load.
806, 0, "unknown record format specified for data file\n"
// *Cause: The osd string containing file processing options in the control
//          file specified an unknown file processing option.
// *Action: Verify the correct options are specified for the platform being 
//          used.
807, 0, "error loading table\n"
// *Cause: An INSERT statement used to load a table from an external table or
//         a temporary internal table failed.  The statement that failed is
//         shown immediately preceding this mesage.
// *Action: See subsequent messages for more information about the error.
808, 0, "error creating sequence: %s\n"
// *Cause: An attempt to create a sequence needed for the load failed.
// *Action: See messages that follow this one for information about the 
//          failure.
809, 0, "error dropping sequence: %s\n"
// *Cause: A sequence needed to be dropped either because SQL Loader found a
//         sequence with the same name it is trying to create or because SQL
//         Loader is cleaning up from sequences it created at the beginning
//         of the load.
// *Action: See messages that follow this one for information about why the 
//          attampt to drop the sequence failed.
810, 0, "error creating external table: %s\n"
// *Cause: An attempt to create the external table sued for the load failed.
// *Action: See messages that follow for more information about the failure.
811, 0, "error dropping external table: %s\n"
// *Cause: An error occurred when trying to drop an external table.  Note that
//         the table may have been left from a previous load.
812, 0, "error creating internal table: %s\n"
// *Cause: An error was encountered trying to create a temporary internal
//         table.  The internal table is used only when loading multiple
//         tables from the same data file.  The internal table is loaded
//         once and the target tables are loaded from the internal table.
813, 0, "error dropping internal table: %s\n"
// *Cause: An error was encountered trying to drop a temporary internal
//         table.  The internal table is used only when loading multiple
//         tables from the same data file. The internal table is loaded
//         once and the target tables are loaded from the internal table.
//         The internal table may have been left from a previous build.
814, 0, "error loading internal table: %s\n"
//
815, 0, "error enabling parallel DML for external table load\n"
//
816, 0, "error creating temporary directory object %s for file %s\n"
// *Cause: No existing directory object was found in the database for the
//         directory containing the file.  Since all files loaded by external
//         tables must be in a directory named by a directory object,
//         SQL Loader tried to create a directory object for the file.
// *Action: See error messages that follow this message for more information.
817, 0, "error dropping directory object %s\n"
// *Cause: SQL Loader created a directory object as part of an external 
//         table load.  An attempt to cleanup the directory object failed.
// *Action: See messages following this one for more information about the
//          error.
818, 0, "\ncreating external table:\n%s\n"
819, 0, "\nexecuting insert statement for database table:\n%s\n"
820, 0, "cannot create where clause with range for table %s\n"
// *Cause: The EXTERNAL_TABLE parameter was specified for a multi-table load,
//         and a WHEN clause for one of the tables contains a reference to a 
//         range of bytes in the record.  SQL Loader uses
//         the WHEN clause from the control file to generate the WHERE clause
//         in the INSERT statement.  If the WHERE clause contains a reference
//         to a range of bytes in the table, then a valid WHERE clause can not
//         be generated.  Note that SQL Loader will proceed as if
//         GENERATE_ONLY was specified for the EXTERNAL_TABLE parameter. 
// *Action: Modify the control file to only use field references in the WHEN
//          clause.  Note that this may require creating a filler field.  
//          Another alternative is to create one control file for each table
//          to be loaded and load the table separately.
821, 0, "switching to GENERATE_ONLY\n"
// *Cause: SQL Loader is not able to execute the SQL statements it generated
//         for loading the data using external tables.  See previous messages
//         for more information.
822,0000, "operation not supported on external organized table\n"
// *Cause:  User attempted on operation on an external table which is
//          not supported.
// *Action: Don't do that!
823, 0, "TREAT AS clause for object tables not supported for external tables\n"
// *Cause: A TREAT AS clause was specified in the INTO TABLE clause for an
//         object table in the SQL*Loader control file and the EXTERNAL_TABLES
//         command line parameter was set to either EXECUTE or GENERATE_ONLY.
//         External tables can be used to load the data, but SQL*Loader
//         does not generate the correct SQL statements to do this.
// *Action: Use SQL*Loader direct path or SQL*Loader conventional path to load
//         the table. 
/
/ direct path preparation errors
/
901, 0, "Error logging on to ORACLE:\n"
// *Cause:  An attempt was made to log on to Oracle in direct path load mode. 
// *Action: Ensure that the instance is up and running. Check the Oracle 
//          messages below this one in the log file for more information.  
902, 0, "Error opening cursor: [%ld] \n"
// *Cause: An internal error has occurred. 
// *Action: Check the Oracle messages below this one in the log file and 
//          contact customer support.  
903, 0, "Database must be at least version %d.%d.%d.%d.%d for direct path\n"
// *Cause: The direct path load mode is being used with an incompatible 
//          database. 
// *Action: Upgrade the database to the specified version or else use the 
//          conventional path load.  
904, 0, "You cannot used the direct path when linked with v5 of the database\n"
// *Cause: The direct path mode is being used after SQL*Loader has been linked 
//          with a Version 5 database. 
// *Action: Use the conventional path.  
905, 0, "Error parsing SQL statement for upi: [%ld] \n"
// *Cause:  Header message. 
// *Action: Check the message below this one in the log file for more 
//          information. 
906, 0, "Error executing SQL statement for upi: [%ld] \n"
// *Cause: An internal error has occurred. 
// *Action: Check the message below this one in the log file for more 
//          information.  
909, 0, "Loader views must be loaded (as SYS) for direct path to be used\n"
// *Cause: Database views required for the direct path mode are not present. 
// *Action: The  Oracle7 Server Administrator's Guide details how to run the 
//          required scripts as user SYS for loading the required views.  
910, 0, "Error binding input variables for upi: [%ld] \n"
// *Cause: Header message. 
// *Action: Check the message below this one in the log file for more 
//          information.  
911, 0, "Error defining output variable(s) for upi: [%ld] \n"
// *Cause:Header message.  
// *Action: Check the message below this one in the log file for more 
//          information.  
913, 0, "Error fetching results of select statement (upi): [%ld] \n"
// *Cause: Header message. 
// *Action: Check the message below this one in the log file for more 
//          information.  
914, 0, "Error locking table %s in exclusive mode.\n"
// *Cause:  The direct path mode could not lock the named table.
// *Action:  Check the message below this one in the log file for more 
//          information. Check that the necessary privileges have been 
//          granted. 
915, 0, "Error closing cursor: [%ld] \n"
// *Cause: Header message. 
// *Action: CCheck the message below this one in the log file for more 
//          information.
916, 0, "Error checking path homogeneity\n"
// *Cause: To do a direct path load load when the front end and back end of 
//          the database are on separate hardware systems, the systems must be 
//          identical, using the same machine, operating system, and character 
//          set. This error occurs when SQL*Loader detects a difference 
//          between the systems that will prevent a direct load from operating 
//          properly. 
// *Action: Use a conventional path load for this configuration. 
918, 0, "The catalog must be loaded (as SYS) for SQL*Loader to be used\n"
// *Cause: The catalog is not loaded.
// *Action: Logon as user SYS and load the Oracle7 catalog and the views in 
//          the script ULVIEW.SQL.
919, 0, "Error during upi fetch: [%ld] \n"
// *Cause: An internal error has occurred. 
// *Action: Check the message below this one in the log file for more 
//          information. 
924, 0, "%s\n"
925, 0, "Error while %s\n"
// *Cause: An internal error has occurred.
// *Action: Check the message below this one in the log file for more
//          information. The table or column referenced may not be accessible.
926, 0, "OCI error while %s for table %s\n"
// *Cause: An OCI error has occurred.
// *Action: Check the message below this one in the log file for more
//          information. The table or column referenced may not be accessible.
929, 0, "Error parsing insert statement for table %s.\n"
// *Cause: The table's insert statement caused a parse error.
// *Action:  Check all SQL strings that were used.
930, 0, "Error parsing insert statement for table %s column %s.\n"
// *Cause: The named column's INSERT statement caused a parse error. 
// *Action: Check the message below this one in the log file for more 
//          information. Check the SQL string used for this column. 
931, 0, "OCI error while binding variable for column %s in table %s\n"
// *Cause: An OCI error has occurred. 
// *Action: Check the errors below it for more information. The SQL string for 
//          this column may be in error. 
932, 0, "Could not truncate table %s.\n"
// *Cause: Truncation of the table was attempted and failed.
// *Action: Check the following errors for more information. Truncation due to 
//          referential constraints should not occur.
933, 0, "Specified file %s not part of database\n"
// *Cause: The specified filename to load the table is not a database file.
// *Action: Specify a valid datafile.
934, 0, "Incorrect data file %s specified for table %s\n"
// *Cause: A datafile name was given to load the table that is
//         not a part of the tablespace in which the table resides.
// *Action: Specify a valid datafile.
935, 0, "Error verifying required option for parallel load.\n"
// *Cause: An error was encountered because a required option was not found or 
//          was invalid.
// *Action: Correct the problem as described in the accompanying Oracle 
//          message.
937, 0, "parallel load requested and %s has enabled triggers or constraints\n"
// *Cause:  A request was made for a parallel direct load, but the object to
//          be loaded has an enabled constraint (check, referential)
//          and/or enabled triggers.
// *Action: Disable the offending enabled constraints and/or triggers
//          and retry the parallel direct load.
938, 0, "partition load requested and %s has enabled triggers or constraints\n"
// *Cause:  A request was made for a direct load of a single partition, but 
//          the object
//          to be loaded has an enabled constraint (check, referential)
//          and/or enabled triggers.
// *Action: Disable the offending enabled constraints and/or triggers
//          and retry the parallel direct load.
939, 0, "OCI error while %s for table %s partition %s\n"
// *Cause: Header message.
// *Action: Check the following errors for more information.
//          The table or partition referenced may not be accessible.
940, 0, "UPI error while setting NCHAR bind attributes for column %s table %s\n"
// *Cause:  An error occured while setting the charsetform attribute of an
//          NCHAR column.
// *Action: This is an internal error.  Report to ORACLE support.
941, 0, "Error during describe of table %s\n"
// *Cause: Error while executing a describe of a select list on the given
//         table.  Check the error immediately preceding this error.
942, 0, "partition %s not part of table %s\n"
// *Cause: the specified partition is not part of the specified table
943, 0, "incorrect datafile %s specified for table %s partition %s\n"
// *Cause: The specified datafile is not in the tablespace of the
//         specified partition.  Due to use of FILE= keyword on
//         a partitioned table.  When loading all partitions of
//         a partitioned table, the partitions must be in the same
//         tablespace.  When loading a single partition, the tablespace
//         of the partition being loaded must be the same as the tablespace
//         in which the specified datafile file resides.
944, 0, "error preparing insert statement for table %s.\n"
// *Cause: A call to OCIStmtPrepare for the table's insert statement   
//         returned an error.  
// *Action: Refer to the message that follows for information about the  
//          error returned by OCIStmtPrepare. Make sure the syntax is 
//          correct for all SQL strings specified in the SQL*Loader control
//          file.  
945, 0, "record size %d too large for direct path \n"
// *Cause: The maximum size of records in the data file is larger than the
//       maximum size supported by direct path, which is 65535
// *Action: Load the data file using conventional path.
946, 0, "OCI error while %s for table %s subpartition %s\n"
// *Cause: Header message.
// *Action: Check the following errors for more information.
//          The table or subpartition referenced may not be accessible.
947, 0, "subpartition load requested and %s has enabled triggers or constraints\n"
// *Cause:  A request was made for a direct load of a single subpartition, but 
//          the object
//          to be loaded has an enabled constraint (check, referential)
//          and/or enabled triggers.
// *Action: Disable the offending enabled constraints and/or triggers
//          and retry the parallel direct load.
948, 0, "subpartition %s not part of table %s\n"
// *Cause: the specified subpartition is not part of the specified table
949, 0, "incorrect datafile %s specified for table %s subpartition %s\n"
// *Cause: The specified datafile is not in the tablespace of the
//         specified subpartition.  Due to use of FILE= keyword on
//         a subpartitioned table.  When loading all subpartitions of
//         a subpartitioned table, the subpartitions must be in the same
//         tablespace.  When loading a single subpartition, the tablespace
//         of the subpartition being loaded must be the same as the tablespace
//         in which the specified datafile file resides.
/
/  Header messages
/
950, 0, "Error shipping data structures across 2-task\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
951, 0, "Error calling once/load initialization\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
952, 0, "Error calling once/data file initialization\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
953, 0, "Error shipping read buffer across 2-task\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
954, 0, "Error shipping index to read buffer across 2-task\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
955, 0, "Error calling col array build, block formatter\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
956, 0, "Error calling once/data file finishing\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
957, 0, "Error shipping text string across 2-task\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
958, 0, "Error popping data relocation address stack\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
959, 0, "Error shipping buffer across 2-task\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
961, 0, "Error calling once/load finishing for table %s\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
962, 0, "Error setting user-side Ctrl-C handler\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
963, 0, "Error clearing user-side Ctrl-C handler\n"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
965, 0, "Error %ld disabling constraint %s on table %s"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
966, 0, "Error %ld disabling all triggers on table %s"
// *Cause: Header message.
// *Action: Check the error(s) below it for more information.
969, 0, "Error performing file name translation on kernel side\n"
// *Cause: File specified for parallel load is probably not a valid
//         database file.
// *Action: Specify a valid database file.
970, 0, "enabled constraint on an XML column not allowed in direct path\n"
// *Cause:  An enabled check constraint existed on an XML column.
// *Action: Disable the check constraint before attempting to load the table
//          data using the direct path mode, or leave the constraint enabled 
//          but use the conventional path mode instead.
971, 0, "parallel load option not allowed when loading lob columns\n"
// *Cause:  An attempt was made to load lob columns using parallel=true. This
//          error will also be issued when loading columns stored as lobs 
//          (such as varrays and xml types)
// *Action: Do not use the parallel option when loading lob columns.
972, 0, "Warning: ROWS parameter ignored when NO_INDEX_ERRORS is used.\n"
// *Cause:  Specifying save points using the ROWS parameter was not supported
//          with NO_INDEX_ERRORS=TRUE.
// *Action: Remove the ROWS parameter from the command-line arguments or do
//          not specify NO_INDEX_ERRORS=TRUE.
973, 0, "Warning: ROWS parameter ignored when PARTITION_MEMORY is used.\n"
// *Cause:  Specifying save points using the ROWS parameter was not supported
//          with PARTITION_MEMORY=n.
// *Action: Remove the ROWS parameter from the command-line arguments or do
//          not specify PARTITION_MEMORY=n.
/
/ syntax error message parts
/
1000, 0, "Expecting %s, found %s.\n"
1001, 0, "Expecting %s or %s, found %s.\n"
1002, 0, "Expecting %s, %s or %s, found %s.\n"
1003, 0, "keyword %s"
1006, 0, "quoted string"
1007, 0, "column name"
1008, 0, "filename"
1009, 0, "integer"
1010, 0, "table name"
1011, 0, "positive integer"
1012, 0, "end of file"
1013, 0, "quoted character"
1014, 0, "identifier"
1015, 0, "valid column specification"
1019, 0, "double quote"
1020, 0, "single char"
1021, 0, "single quote"
1022, 0, "keyword LOAD"
1023, 0, "keyword YES"
1024, 0, "keyword NO"
1025, 0, "keywords NO REPLACE"
1026, 0, "keyword INTO"
1027, 0, "keyword BEGINDATA"
1028, 0, "keyword TABLE"
1029, 0, "keyword COUNT"
1030, 0, "keyword MAX"
1031, 0, "keyword ENCLOSED"
1032, 0, "non-negative integer"
1033, 0, "hex identifier"
1034, 0, "partition name or list of names"
1035, 0, "field-name"
1036, 0, "keyword LOBFILE"
1037, 0, "keyword SDF"
1038, 0, "keyword VARRAW"
1039, 0, "Expecting a positive integer %d or less, found %s\n"
1040, 0, "keyword OBJECT"
1041, 0, "delimiter specification"
1042, 0, "COUNT directive"
1043, 0, "Optional"
1044, 0, "Required"
1045, 0, "keyword INFILE"
1046, 0, "keyword FILE"
1047, 0, "keyword STORAGE"
1048, 0, "keyword ZONE"
1049, 0, "keyword TIME"
1050, 0, "keyword TO"
1051, 0, "keyword MONTH"
1052, 0, "keyword SECOND"
1053, 0, "keyword YEAR or DAY"
1054, 0, "SQL string"
1055, 0, "keyword BYTE"
1056, 0, "keyword CHARACTER"
1057, 0, "keyword CHAR"
1058, 0, "keyword LITTLE"
1059, 0, "keyword BIG"
1060, 0, "CHAR(0)"
1061, 0, "keyword CHECK_CONSTRAINT"
1062, 0, "keyword AS"
1063, 0, "Illegal hexadecimal literal specified for delimiter - not valid characters\n"
1064, 0, "keyword CHECK"
1065, 0, "keyword NOCHECK"
1066, 0, "BYTEORDERMARK CHECK illegal for a non-unicode character set\n"
1067, 0, "keyword PRESERVE"
1068, 0, "keyword BLANKS" 
1069, 0, "keyword VARRAY"
1070, 0, "keyword POSITION"
/
/ log file text
/
2000, 0, "\nTable %s:\n"
2001, 0, "  %lu %s not loaded due to data errors.\n"
2002, 0, "  %lu %s not loaded because all WHEN clauses were failed.\n"
2003, 0, "  %lu %s not loaded because all fields were null.\n\n"
2004, 0, "\nSpace allocated for bind array:               %8lu bytes(%lu rows)\n"
2005, 0, "Space allocated for memory besides bind array: %8lu bytes\n"
2006, 0, "\nTotal logical records skipped:   %8ld\n"
2007, 0, "Total logical records read:      %8ld\n"
2008, 0, "Total logical records rejected:  %8lu\n"
2009, 0, "Total logical records discarded: %8lu\n"
2010, 0, "\nMAXIMUM ERROR COUNT EXCEEDED - "
2011, 0, "Above statistics reflect partial run.\n"
2013, 0, "\nData File %s -\n\n"
2014, 0, "\nLoad completed - logical record count %lu.\n"
2015, 0, "Discard limit reached - processing terminated on data file %s.\n\n"
2016, 0, "Commit point reached - logical record count %lu\n"
2017, 0, "Record %lu: Rejected - Error on table %s, column %s.\n"
2018, 0, "Record %lu: Rejected - Error on table %s.\n"
2019, 0, "Record %lu: Discarded - failed all WHEN clauses.\n"
2020, 0, "Record %lu: Discarded - all columns null.\n"
2022, 0, "Record %lu: Warning on table %s, column %s\n"
2023, 0, "collection element %lu\n"
2024, 0, "Row"
2025, 0, "Rows"
2026, 0, "the load was aborted because SQL Loader cannot continue.\n"
//* Cause: The load cannot continue. See the error message before this
//*        message for the cause of the error.
//* Action: See the action for the error message that precedes this one.
2028, 0, "load discontinued to user interrupt (Ctrl-C) [%d]\n"
2029, 0, "  %lu %s successfully loaded.\n"
2030, 0, "  %lu %s successfully read.\n"
2031, 0, "  %lu %s skipped.\n"
2032, 0, "Bind array size not used in direct path.\n"
2033, 0, "\nReferential Integrity Constraint/Trigger Information:\n"
2034, 0, "NULL, UNIQUE, and PRIMARY KEY constraints are unaffected.\n\n"
2035, 0, "No CHECK, REFERENTIAL constraints were re-enabled after the load.\n"
2036, 0, "Constraint %s.%s was re-enabled by another process.\n"
2037, 0, "Trigger %s was re-enabled by another process.\n"
2038, 0, "%s was not re-enabled due to ORACLE error %d.\n"
2039, 0, "%s was re-enabled.\n"
2040, 0, "\nTable %s has no constraint exception table.\n"
2041, 0, "\nTable %s has constraint exception table %s.\n"
2042, 0, "Constraint %s.%s was disabled and novalidated before the load.\n"
2043, 0, "There were no REFERENTIAL or CHECK constraints on this table.\n"
2044, 0, "ORACLE error occurred (see below) which terminates load, but the\n"
2045, 0, "triggers/constraints above have been disabled.\n"
2046, 0, "The following index(es) on table %s were processed:\n"
2048, 0, "Save data point reached - logical record count %lu.\n"
2049, 0, "Trigger %s was disabled before the load.\n"
/
/ 	2050-2075 reserved for multi-byte prototype 
2050, 0, "Multibyte character error.\n" 
// *Cause: Text specified by POSITION or terminated by newlines is invalid.
// *Action: Edit the SQL*Loader control file or the data file to fix 
//          alignment of column.
2076, 0, "Total stream buffers loaded by SQL*Loader main thread: %8lu\n"
2077, 0, "Total stream buffers loaded by SQL*Loader load thread: %8lu\n"
2078, 0, "Column array  rows :%8lu\n"
2079, 0, "Stream buffer bytes:%8lu\n"
2080, 0, "Read   buffer bytes:%8lu\n"
2081, 0, "Direct path multithreading optimization is disabled\n"
2082, 0, "Bind array size not used in External Table path.\n"
2083, 0, "\ncreating external table %s\n\n"
2084, 0, "\nexecuting INSERT statement to load database table %s\n\n"
2085, 0, "\ncreating temporary internal table %s\n\n"
2086, 0, "\ntable %s already exists...attempting to delete and recreate\n"
2087, 0, "\ncreating temporary internal table %s\n\n"
2088, 0, "\nexecuting INSERT statement to load internal table %s\n\n"
2089, 0, "\ndropping temporary internal table %s\n"
2090, 0, "\ndropping external table %s\n"
2091, 0, "\ndropping temporary sequences\n"
2092, 0, "\ncreating temporary sequences\n"
2093, 0, "%u rows loaded into temporary internal table %s\n"
2094, 0, "created temporary directory object %s for path %s\n"
2095, 0, "created temporary directory object %s\n"
2096, 0, "CREATE DIRECTORY statements needed for files\n"
2097, 0, "directory objects created for one or more data files\n"
2098, 0, "\nenable parallel DML: %s\n"
2099, 0, "  Date cache:\n   Max Size:%10lu\n   Entries :%10lu\n   Hits    :%10lu\n   Misses  :%10lu\n\n"
/
/ more log file text
/
2100, 0, "%s"
2101, 0, "%s\n"
2102, 0, "%.*s\n"
2103, 0, "%*s^\n"
2104, 0, "  Date conversion cache disabled due to overflow (default size:%5lu)\n\n"
2105, 0, "Server slot size         :%8lu\n"
2106, 0, "Server column array rows :%8lu\n"
2107, 0, "Server max row piece ccnt:%8lu\n"
2108, 0, "Non char scalar to clob  :%8lu\n"
2900, 0, "    Count for VARRAY\n"
2901, 0, "    Static %s.  Filename is %s\n"
2902, 0, "    Dynamic %s.  Filename in field %s\n"
2903, 0, "LOBFILE"
2904, 0, "Secondary Data File"
2905, 0, "\n*** Fields in %s\n"
2906, 0, "*** End of fields in %s\n\n"
2907, 0, "*****"
2908, 0, "    Maximum field length is %lu\n"
2909, 0, "    Arguments are:\n"
2910, 0, "OID for table rows are in:\n"
2911, 0, "SID for table rows are derived from:\n"
2912, 0, "DERIVED"
3000, 0, "Control File:   %s\n"
3001, 0, "Data File:      %s\n"
3004, 0, "  Bad File:     %s\n"
3005, 0, "\nNumber to load: %lu\n"
3006, 0, "\nNumber to load: ALL\n"
3007, 0, "Number to skip: %lu\n"
3008, 0, "Errors allowed: %lu\n"
3009, 0, "Errors allowed: ALL\n"
3010, 0, "Bind array:     %lu rows, maximum of %lu bytes\n"
3011, 0, ", in current physical record\n"
3012, 0, "Record Length:  %ld (Parsed but ignored)\n"
3013, 0, "Continuation:   "
3014, 0, "Last non-white character %s"
3015, 0, "%ld:%ld %s"
3016, 0, "%s %s"
3018, 0, "    NULL if "
3019, 0, "    DEFAULT if "
3020, 0, ", in next physical record\n"
3021, 0, "Concatenate every %ld physical records\n"
3022, 0, "                  and "
3023, 0, "\nTable %s, "
3024, 0, "when "
3025, 0, "from every logical record.\n"
3026, 0, "\n"
3027, 0, "\nThere are %ld data files:\n"
3028, 0, "  Discard File: %s \n"
3029, 0, " (Allow %lu discards)\n"
3030, 0, " (Allow all discards)\n"
3031, 0, "Insert option in effect for this table: %s\n"
3032, 0, " none specified\n"
3033, 0, "Silent options: "
3034, 0, "FEEDBACK"
3035, 0, "ERRORS"
3036, 0, "DISCARDS"
3037, 0, " and "
3038, 0, ", "
3039, 0, "%-30s %10s %5s %4s %4s %-21s\n"
3040, 0, "%s:%lu"
3041, 0, "NEXT%s"
3042, 0, "FIRST%s"
3043, 0, "O(%c)"
3044, 0, "  %c "
3045, 0, "                                                      %s\n"
3046, 0, "%-30s                            RECNUM\n"
3047, 0, "%-30s                            SEQUENCE (COUNT, %s)\n"
3048, 0, "%-30s                            SEQUENCE (MAX, %s)\n"
3049, 0, "%-30s                            SEQUENCE (%s, %s)\n"
3050, 0, "%-30s                            CONSTANT\n    Value is '%s'\n"
3051, 0, "\n   Column Name                  Position   Len  Term Encl "
3052, 0, "Datatype"
3053, 0, "\n------------------------------ ---------- ----- ---- ---- "
3054, 0, "---------------------\n"
3055, 0, "    *"
3056, 0, "+%lu"
3057, 0, " WHT"
3058, 0, "O(X%02.02X)"
3059, 0, "X%02.02X"
3060, 0, "%02.02x"
3061, 0, "(character '%s')"
3062, 0, " 0X"
3063, 0, "\nNOTE: Since the data is all generated, no data files are used\n\n"
3064, 0, "%lu"
3065, 0, "Path used:      "
3066, 0, "Direct"
3067, 0, "Conventional"
3068, 0, " BLANKS"
3069, 0, "TRAILING NULLCOLS option in effect\n"
3070, 0, "None"
3071, 0, "Bind array: Test mode - (O/S dependent) default bindsize.\n"
3072, 0, "    SQL string for column : \"%.16000s\"\n"
3073, 0, "%-30s                            SYSDATE\n"
3074, 0, "  File processing option string: \"%s\"\n"
/ Remove 1 carriage return from this message and put an extra one out after
/ the character length semantics line. That way we can line up the messages
/ proprerly for SDF files and LOB files.
3075, 0, "Character Set %s specified for all input.\n"
3076, 0, "        CONSTANT '%s'\n"
3077, 0, "        %s\n"
3078, 0, "\nLoad is UNRECOVERABLE; invalidation redo is produced.\n"
3079, 0, " - with parallel option.\n"
3080, 0, "  Global file %s specified.\n"
3081, 0, "partition %s, loaded "
3082, 0, "loaded "
3083, 0, "Insert option in effect for this partition: %s\n"
3084, 0, "Record %lu: Rejected - Error on table %s, partition %s.\n"
3085, 0, "\nTable %s, partition %s:\n"
3086, 0, "  Partition %s: %lu %s loaded.\n"
3087, 0, "Constraint %s.%s was validated\n"
3088, 0, "%s.%s was not re-validated due to ORACLE error.\n"
3089, 0, "  (FILLER FIELD)                                      %s\n"
3090, 0, "  (FILLER FIELD)\n"
3091, 0, "  (BOUNDFILLER FIELD)                                 %s\n"
3092, 0, "  (BOUNDFILLER FIELD)\n"
3093, 0, "%-30s    DERIVED                 BFILE\n"
3094, 0, "%-30s    DERIVED                 REF\n"
3095, 0, "%-30s    DERIVED                 SID\n"
3096, 0, "    Terminator string : '%s'\n"
3097, 0, "    First enclosure string : '%s'\n"
3098, 0, "    Second enclosure string : '%s'\n"
3099, 0, "    Enclosure string : '%s'\n"
3100, 0, "                Preserving continuation characters as data"
3101, 0, "(unsigned)"
3102, 0, "%-30s                            EXPRESSION\n"
3103, 0, "Using character length semantics.\n"    
/ For lining up messages for SDF's and LOB files
3104, 0, "    "
3105, 0, "Byteorder %s endian specified.\n"
3106, 0, "little"
3107, 0, "big"
3108, 0, "SQL*Loader running on a %s endian platform. Swapping bytes where needed.\n"
3109, 0, "External Table"
3110, 0, "  (HIDDEN COLUMN)\n"
3111, 0, "CREATE TABLE statement for external table:\n"
3112, 0, "sequences created to simulate SEQ in control file:\n"
3113, 0, "CREATE TABLE for internal table used in multi-table load:\n"
3114, 0, "INSERT statement used to load internal table (multi-table load):\n"
3115, 0, "INSERT statements used to load internal tables:\n"
3116, 0, "statements to cleanup objects created by previous statements:\n"
3117, 0, " EOF"
3118, 0, "First primary datafile %s has a\n %s%s byte order mark in it.\n"
3119, 0, "Warning: Byte order mark in the first primary datafile\n %s different from value specified with BYTEORDER keyword.\n Using %s endian from byte order mark.\n"
3120, 0, "Resumable parameters ignored -- current session not resumable\n"
// *Cause: Current session is not resumable.
// *Action: Must specify RESUMABLE=TRUE to enable resumable session in order 
//          for the RESUMABLE_NAME and RESUMABLE_TIMEOUT parameters to take 
//          effect.
3121, 0, "\nWARNING: Use of the _parallel_lob_load option can result in corrupted LOB\nWARNING: columns if the load does not complete without error.\n"
/
/ Messages 3122 is free
/
/ Message 3123 is for use in messages 3127, 3131, 3132, and 3133.
/  Also used, 2903 has "LOBFILE", 2904 has "Secondary Data File"
3123, 0, "datafile"
3124, 0, "------------------------------------------------------------------------\n"
3125, 0, "\n\n"
3126, 0, "\n*** Fields in %s treated as type %s\n"
3127, 0, "WARNING: AL16UTF16 (which is big endian UTF16) specified as the\n character set, but the %s is little endian. Processing the %s\n %s as little endian UTF16.\n"
3128, 0, "utf8"
/ The leading space is so that "big endian byte order mark" or "little endian
/ byte order mark" will print, but "utf8 byte order mark" will not have an
/ extra space.
3129, 0, " endian"
/ Null string, used for message 3118 if utf8. In that case, just say utf8
/ byte order mark (do not say "endian")"
3130, 0, ""
3131, 0, "Byte order mark in %s\n %s\n different from byte order mark in the first primary data file\n %s\n%s"
3132, 0, "Byte order mark in %s %s\n different from byte order used for first primary datafile, from system\n environment.\n%s"
3133, 0, "Byte order mark in %s %s\n different from byte order specified with BYTEORDER keyword.\n"
3134, 0, "BYTEORDERMARK CHECK specified and a unicode character set specified.\n%s Checking for a byte order mark.\n"
3135, 0, "BYTEORDERMARK NOCHECK specified and a unicode character set specified.\n%s Not checking for a byte order mark.\n"
3136, 0, "Byte order mark in %s %s different\n from byte order specified with BYTEORDER keyword for primary datafiles.\n%s"
3137, 0, " Specify BYTEORDER with this file to override the setting from the\n primary datafiles.\n"
3138, 0, "Specify SKIP=%d when continuing the load.\n"
3139, 0, "Processing %s as %s endian.\n"
3140, 0, "Invalid NLS_LANG character set for this OS environment\n"
3141, 0, "Specify SKIP=%d for table %s when continuing the load.\n"
3142, 0, "Cannot skip varray data for column %s due to the previous error\n" 
4000, 0, "Elapsed time was:     %02ld:%02ld:%02ld.%02ld\n"
4001, 0, "CPU time was:         %02ld:%02ld:%02ld.%02ld"
/
/ help text
/
4002, 0, "\nUsage: SQLLDR keyword=value [,keyword=value,...]\n\n"
4003, 0, "Valid Keywords:\n\n"
4004, 0, "%10s -- "
4005, 0, "  (Default %lu)\n"
4006, 0, "  (Default all)\n"
4007, 0, "  (Default %s)\n"
4008, 0, "\nRun began on %s\n"
4009, 0, "Run ended on %s\n\n"
4010, 0, "     (May not include ORACLE CPU time)"
4011, 0, "TRUE"
4012, 0, "FALSE"
4013, 0, "PLEASE NOTE: Command-line parameters may be specified either by\n"
4014, 0, "position or by keywords.  An example of the former case is 'sqlldr\n"
4015, 0, "scott/tiger foo'; an example of the latter is 'sqlldr control=foo\n"
4016, 0, "userid=scott/tiger'.  One may specify parameters by position before\n"
4017, 0, "but not after parameters specified by keywords.  For example,\n"
4018, 0, "'sqlldr scott/tiger control=foo logfile=log' is allowed, but\n"
4019, 0, "'sqlldr scott/tiger control=foo log' is not, even though the\n"
4020, 0, "position of the parameter 'log' is correct.\n"
4021, 0, "\n               (Default: Conventional path %lu, Direct path all)\n"
4022, 0, "Record %lu: Rejected - Error on table %s, subpartition %s.\n"
4023, 0, "\nTable %s, subpartition %s:\n"
4024, 0, "  Sub-Partition %s: %lu %s loaded.\n"
4025, 0, "subpartition %s, loaded "
4026, 0, "Insert option in effect for this subpartition: %s\n"
/
/ Debugging
/
4500, 0, "rows processed: %ld\n"
4501, 0, "rows left: %ld\n"
4502, 0, "offset: %ld\n"
4503, 0, "table name: %s\n"
4504, 0, "rows loaded: %ld\n"
4505, 0, "rows in table %s: %ld\n"
/
/ Prompts
/
5001, 0, "Password:"
5002, 0, "Username:"
/
/ Help messages
/
5100, 0, "ORACLE username/password           "
5101, 0, "control file name                  "
5102, 0, "log file name                      "
5103, 0, "bad file name                      "
5104, 0, "data file name                     "
5105, 0, "discard file name                  "
5106, 0, "number of discards to allow        "
5107, 0, "number of logical records to skip  "
5108, 0, "number of logical records to load  "
5109, 0, "number of errors to allow          "
5110, 0, "number of rows in conventional path bind array or between direct path data saves"
5111, 0, "size of conventional path bind array in bytes"
5112, 0, "suppress messages during run (header,feedback,errors,discards,partitions)"
5113, 0, "use direct path                    "
5114, 0, "for internal testing               "
5115, 0, "parameter file: name of file that contains parameter specifications"
5116, 0, "do parallel load                   "
5117, 0, "file to allocate extents from      "
5118, 0, "disallow/allow unusable indexes or index partitions"
5119, 0, "do not maintain indexes, mark affected indexes as unusable"
5120, 0, "commit loaded rows when load is discontinued"
5121, 0, "display exit code for SQL*Loader execution"
5122, 0, "size of read buffer                "
5123, 0, "use external table for load; NOT_USED, GENERATE_ONLY, EXECUTE"
5124, 0, "number of rows for direct path column array"
5125, 0, "size of direct path stream buffer in bytes"
5126, 0, "use multithreading in direct path  "
5127, 0, "enable or disable resumable for current session"
5128, 0, "text string to help identify resumable statement"
5129, 0, "wait time (in seconds) for RESUMABLE"
5130, 0, "size (in entries) of date conversion cache"
5131, 0, "undocumented parameter _trace_events for UTS tracing"
5132, 0, "for internal testing, server slot size for direct path"
5133, 0, "for internal testing, server column array rows for direct path"
5134, 0, "for internal testing, server max row piece columns for direct path"
5135, 0, "for internal testing, testing noncharacter scalar to character lob"
5136, 0, "allow parallel load of LOBs"
5137, 0, "abort load on any index errors"
5138, 0, "for internal testing, direct path partition memory limit"
