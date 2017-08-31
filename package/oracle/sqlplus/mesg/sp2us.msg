/
/ Copyright (c) 1989, 2005, Oracle.  All Rights Reserved.
/
/ CONTENTS:
/   Generic error messages for SQL*Plus SP2 errors
/
/ NOTES:
/   The first column is the error number.
/   The second column is reserved and must (for now) be 0.
/   The remainder of the line is the error text.
/
/
/    Range        |  Use
/    -------------+--------------------------
/       0 -  849  | SQL*Plus interface text and error messages
/     850 - 1499  | iSQL*Plus errors
/    1500 - 4999  | SQL*Plus general errors (continued)
/    5000 - 5999  | SQL*Plus interface text (continued)
/    6000 - 6250  | SQL*Plus command-line usage messages
/
/
00000,0, "Commit complete.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00001,0, "Rollback complete.\n"
// *Document: NO
// *Cause: Feedback message. This is an informational message after a
//         successful ROLLBACK.
// *Action:
00002,0, "ACCEPT statement must specify a variable name\n"
// *Cause:  Required variable name was missing after the ACCEPT command.
// *Action: Re-enter the ACCEPT command with a variable argument to
//          store the input value.
00003,0, "Ill-formed ACCEPT command starting as %s\n"
// *Cause:  An invalid option was used in the ACCEPT command.
// *Action: Check the syntax of the ACCEPT command for the correct
//          option.
00004,0, "Nothing to append.\n"
// *Cause:  There was no specified text entered after the APPEND command.
// *Action: Re-enter the APPEND command with the specified text.
00006,0, "not enough room to format computations\n"
// *Cause:  Unable to allocate memory to format computations.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00015,0, "no break(s) defined\n"
// *Cause:  There was no break defined.
// *Action: Define a break. Check the syntax of the BREAK command for
//          the correct options.
00016,0, "break specification must start with ON/BY or ACROSS keyword\n"
// *Cause:  An invalid option was used in the BREAK command.
// *Action: Check the syntax of the BREAK command for the correct
//          options.
00017,0, "missing column name after %s keyword\n"
// *Cause:  There was no column name after the specified keyword.
// *Action: Enter a column name after the specified keyword.
00019,0, "invalid numeric argument to %s option\n"
// *Cause:  An invalid numeric argument was used in the specified
//          option.
// *Action: Correct the argument and try again.
00020,0, "no storage available for '%s'\n"
// *Cause:  An error has occurred. SQL*Plus was unable to allocate
//          memory for a BREAK command.
// *Action: Allocate more memory by closing some applications.
00022,0, "cannot allocate space to modify the %s buffer variable.\n"
// *Cause:  An internal error occurred.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00023,0, "String not found.\n"
// *Cause:  The search string specified was not found.
// *Action: Check the search string to make sure that it is valid.
00024,0, "Nothing to change.\n"
// *Cause:  There was nothing in the SQL buffer when using the CHANGE
//          command.
// *Action: Make sure the SQL buffer is not empty before using the
//          CHANGE command.
00025,0, "Invalid change string.\n"
// *Cause:  An invalid option was used in the CHANGE command.
// *Action: Check the syntax of the CHANGE command for the correct
//          options.
00026,0, "No lines to delete.\n"
// *Cause:  There was nothing in the SQL buffer when using the DEL
//          command.
// *Action: Make sure the SQL buffer is not empty before using the DEL
//          command.
00027,0, "Input is too long (> %d characters) - line ignored\n"
// *Cause:  The input value specified was too long.
// *Action: Re-enter with fewer characters.
00029,0, "command buffer space exhausted\n"
// *Cause:  A large SQL or PL/SQL script is being executed from
//          SQL*Plus.
// *Action: Reduce the size of the SQL statement or PL/SQL block by
//          one of the following:
//            - Remove extra white space and comments.
//            - Re-code to use fewer commands and/or shorter variable names.
//            - Place sections of the block into stored (or packaged)
//              procedures, and then call these procedures from the
//              block.
00030,0, "no room for another line\n"
// *Cause:  The maximum number of lines in a SQL statement or PL/SQL
//          block has been exceeded.
// *Action: Reduce the number of lines and try again.
00032,0, "%s cleared\n"
// *Document: NO
// *Cause:  Feedback message. This is an informational message after a
//          successful CLEAR command.
// *Action:
00038,0, "Command too long. (%d characters)\n"
// *Cause:  The specified command entered was too long.
// *Action: Check the command syntax for the limitation.
00039,0, "command line overflow while substituting into %s\"%.*s%s\""
// *Cause:  The maximum length of the command line has been exceeded.
// *Action: Reduce the length of the data in the substitution
//          variables used in the command.
00041,0, "-- rest of line ignored.\n"
// *Document: NO
// *Cause:  This is a continuation from SP2-42.
// *Action:
00042,0, "unknown command %s\"%.*s%s\" - rest of line ignored.\n"
// *Cause:  The command entered was not valid.
// *Action: Check the syntax of the command you used for the correct
//          options.
00044,0, "For a list of known commands enter HELP\nand to leave enter EXIT.\n"
// *Cause:  An unknown command was entered.
// *Action: Check the syntax of the command you used for the correct
//          options.
00045,0, "* no %s defined\n"
// *Cause:  No columns have been defined.
// *Action: No action required.
00046,0, "%s '%s' not defined\n"
// *Cause:  The column name specified was not defined.
// *Action: Retry again with a valid column name.
00047,0, "invalid number for %s option\n"
// *Cause:  An invalid number was used for this option.
// *Action: Re-try the operation with a valid number.
00048,0, "COLUMN OUTPUT not supported yet\n"
// *Document: NO
// *Cause:  OUTPUT option is not implemented in the COLUMN command.
// *Action:
00052,0, "like %s '%s' not defined\n"
// *Cause:  The column which the format is based on was not defined.
// *Action: Use the COLUMN command to make sure the column the format
//          is based on is defined first.
00054,0, "no room to allocate %s definition. ignored\n"
// *Cause:  Unable to allocate memory to process the COLUMN command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00055,0, "out of room while allocating portion of new %s."
// *Cause:  Unable to allocate memory to store the new definition.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00056,0, "old definition (if any) retained\n"
// *Document: NO
// *Cause:  This is a continuation of SP2-55.
// *Action:
00080,0, "no COMPUTES currently defined\n"
// *Cause:  No COMPUTE definition.
// *Action: Define a COMPUTE. Check the syntax of the COMPUTE command
//          for the correct options.
00081,0, "maximum of %d COMPUTE functions allowed at a time\n"
// *Cause:  The maximum number of COMPUTE functions has been exceeded.
// *Action: Reduce the number of COMPUTE functions.
00082,0, "no COMPUTE functions requested\n"
// *Cause:  No COMPUTE functions requested.
// *Action: No action required.
00083,0, "warning: COMPUTE option %s specified %d times\n"
// *Cause:  A label or a function was specified more than once.
// *Action: Remove the unnecessary labels or functions.
00084,0, "COMPUTE ON keyword specified already\n"
// *Cause:  The ON keyword was specified more than once.
// *Action: Specify the ON keyword once in the command.
00085,0, "COMPUTE OF keyword specified already\n"
// *Cause:  The OF keyword was specified more than once.
// *Action: Specify the OF keyword once in the command.
00087,0, "no room to allocate COMPUTE control block for %s\n"
// *Cause:  Unable to allocate memory to process the COMPUTE command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00088,0, "missing %s keyword\n"
// *Cause:  Missing a keyword in the statement.
// *Action: Check the syntax of the command you used for the correct
//          options, and use the keyword in the appropriate place.
00092,0, "missing columns for %s keyword\n"
// *Cause:  The column name was not specified for the keyword.
// *Action: Specify the column name and try again.
00096,0, "no more room to allocate INTO variable %s\n"
// *Cause:  Unable to allocate memory to process the COMPUTE command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00097,0, "no storage to allocate ON column %s\n"
// *Cause:  Unable to allocate memory to process the COMPUTE command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00098,0, "no storage to allocate COMPUTE block for %s\n"
// *Cause:  Unable to allocate memory to process the COMPUTE command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00102,0, "Connected.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00103,0, "Nothing in SQL buffer to run.\n"
// *Cause:  Nothing was in the SQL buffer to run.
// *Action: Enter a valid SQL command.
00104,0, " Name                            Null?    Type\n"
// *Document: NO
// *Cause:  DESCRIBE against V7 servers.
// *Action:
00105,0, "Illegal, or missing, entity name\n"
// *Cause:  File name was not specified in the GET or SAVE commands.
// *Action: Specify a file name and try again.
00106,0, " ------------------------------- -------- ----\n"
// *Document: NO
// *Cause:  Used under 104.
// *Action:
00107,0, "Nothing to save.\n"
// *Cause:  Nothing in the SQL buffer when attempting to save the
//          content to a file.
// *Action: Enter a SQL command to save.
00108,0, "The filenames CREATE, REPLACE, APPEND, FILE, and abbreviations may not be used.\n"
// *Cause:  An attempt was made to enter a filename using the word FILE,
//          or one of the command keywords CREATE, REPLACE, APPEND, or one
//          of their abbreviations. The filename specified in the command
//          was not permitted.
// *Action: Check the following command syntax and enter a valid filename:
//            command filename[.ext] [CR[EATE]|REP[LACE]|AP[PEND]]
//            where command can be SAVE, SPOOL or STORE SET.
//          To use the command keywords CREATE, REPLACE, APPEND or one of
//          their abbreviations as the filename, or to use the word FILE
//          as the filename, you must enclose it in single quotes.
00109,0, "Cannot append to file \"%s\"\n"
// *Cause:  An attempt was made to append the content of the SQL buffer
//          to a file and the file could not be written. Possible
//          causes:
//            - An error was encountered when creating the
//              destination file.
//            - A directory name specified in the SAVE statement
//              was not found.
//            - A system error made it impossible to open the file.
// *Action: Take the following actions
//            - Check that the destination is valid and that
//              there is sufficient space on the destination device.
//            - Check the statement for a typing mistake in the
//              directory name.  Then issue the statement again
//              after correcting the directory name.
00110,0, "Cannot create save file \"%s\"\n"
// *Cause:  An attempt was made to save the content of the SQL buffer
//          to a file and the file could not be written. Possible
//          causes:
//            - An error was encountered when creating the destination
//              file.
//            - A directory name specified in the SAVE statement
//              was not found.
//            - A system error made it impossible to open the file.
// *Action: Take the following actions:
//            - Check that the destination is valid and that
//              there is sufficient space on the destination device.
//            - Check the statement for a typing mistake in the
//              directory name. Then issue the statement again after
//              correcting the directory name.
00111,0, "Cannot close save file \"%s\"\n"
// *Cause:  The file was in use.
// *Action: Release the file from the other process.
00113,0, "Appended %s to %s\n"
// *Document: NO
// *Cause:  Feedback message for SQL buffer saved to file.
// *Action:
00114,0, "Created %s %s\n"
// *Document: NO
// *Cause:  Feedback message for SQL buffer saved to file.
// *Action:
00115,0, "Replaced %s %s\n"
// *Document: NO
// *Cause:
// *Action:
00116,0, "Illegal SAVE command\n"
// *Cause:  An invalid option was used in the SAVE command.
// *Action: Check the syntax of the SAVE command for the correct
//          options.
00117,0, "Wrote %s %s\n"
// *Document: NO
// *Cause:  Feedback message for SQL buffer saved to file.
// *Action:
00123,0, "page &P4"
// *Document: NO
// *Cause:  TTITLE.
// *Action:
00127,0, "Unknown CMS command"
// *Document: NO
// *Cause:  OSD.
// *Action:
00128,0, "Invalid SUBSET command"
// *Document: NO
// *Cause:  OSD.
// *Action:
00129,0, "LOADMOD failure"
// *Document: NO
// *Cause:  OSD.
// *Action:
00130,0, "Wrong environment"
// *Document: NO
// *Cause:  OSD.
// *Action:
00134,0, "no symbols currently defined\n"
// *Cause:  No DEFINE symbols were defined.
// *Action: No action required.
00135,0, "symbol %s is UNDEFINED\n"
// *Cause:  The specified symbol was undefined.
// *Action: Re-enter the DEFINE command with an assignment clause or a
//          valid symbol or variable name.
00136,0, "DEFINE requires an equal sign (=)\n"
// *Cause:  Expecting an equal sign after a symbol or variable name in
//          the DEFINE command.
// *Action: Specify an equal sign after the symbol or variable name.
00137,0, "DEFINE requires a value following equal sign\n"
// *Cause:  There was no value for the variable or symbol. SQL*Plus
//          expected a value to be assigned to a symbol or variable
//          name after the equal sign.
// *Action: Specify a value for the symbol or variable.
00138,0, "no room to add substitution variable \"%s\"\n"
// *Cause:  Maximum number of variables that can be defined in a
//          SQL*Plus session was exceeded.
// *Action: UNDEFINE any unused variables to make room for this
//          variable and re-run the command.
00142,0, "not implemented"
// *Document: NO
// *Cause:  DEFINE.
// *Action:
00146,0, "Unable to allocate dynamic space needed (%d bytes) - exiting\n"
// *Cause:  An internal error occurred.
// *Action: Note the message and number, and contact the System
//          Administrator.
00152,0, "ORACLE may not be functioning properly\n"
// *Cause:  Unable to initialize a session to the Oracle instance.
// *Action: Make a note of the message and the number, then contact
//          the Database Administrator.
00153,0, "\nConnected to:\n%s\n\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00157,0, "unable to CONNECT to ORACLE after %d attempts, exiting SQL*Plus\n"
// *Cause:  Unable to connect to Oracle after three attempts.
// *Action: Validate login details and re-try.
00158,0, "unknown %s%s%s option %s\"%.*s%s\"\n"
// *Cause:  An invalid option was specified for the given command.
// *Action: Check the syntax of the command you used for the correct
//          options.
00160,0, "unable to open \"%s\"\n"
// *Cause:  Possible causes:
//            - The file was not found under the specified name
//              in the specified location.
//            - File lacked the necessary privileges to open
//              the file.
//            - A system error made it impossible to open the file.
// *Action: Take the following actions:
//            - Make sure the file name specified is stored in the
//              appropriate directory.
//            - Make sure that the file has the privileges necessary for
//              access. If it does not then change privileges accordingly.
//            - Consult operating system documentation or contact the
//              System Administrator.
00161,0, "line %d truncated.\n"
// *Cause:  The line in the file was too long.
// *Action: No action required or reduce the length of the line.
00162,0, "unable to close \"%s\"\n"
// *Cause:  Unable to close the specified file as it was being used.
// *Action: Release the file from the other process.
00171,0, "HELP system not available.\n"
// *Cause:  Command-line SQL*Plus help is not installed in this Oracle
//          instance.
// *Action: Command-line SQL*Plus help is not installed in this Oracle
//          instance. Use the sqlplus/admin/help/hlpbld.sql script to
//          install HELP on this database:
//            sqlplus system/<system_password> @hlpbld.sql helpus.sql
00172,0, "No HELP matching this topic was found.\n"
// *Cause:  There is no help information available for the specified
//          command.
// *Action: Enter HELP INDEX for a list of topics.
00176,0, "Option ? is invalid\n"
// *Cause:  The option ? is not valid in this command.
// *Action: Check the syntax of the command you used for the correct
//          options.
00187,0, "error in variable assignment\n"
// *Cause:  The assignment for the specified variable was incorrect.
// *Action: Check the syntax of the ACCEPT command for the correct
//          options.
00223,0, "No lines in %s buffer.\n"
// *Cause:  There are no lines stored in the buffer.
// *Action: Enter SQL statements into the buffer.
00224,0, "invalid starting line number\n"
// *Cause:  The line number specified was incorrect.
// *Action: Check that the line number is correct and try again.
00225,0, "invalid ending line number\n"
// *Cause:  The line number specified was incorrect.
// *Action: Check that the line number is correct and try again.
00226,0, "Invalid line number %s\n"
// *Cause:  Invalid line number was specified.
// *Action: Re-enter with a valid line number.
00229,0, "Disconnected from %s%s\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00230,0, " (with complications)"
// *Document: NO
// *Cause:  Continuation of  229.
// *Action:
00231,0, "Enter user-name: "
// *Document: NO
// *Cause:  Prompt.
// *Action:
00232,0, "Input too long. Must be less than %d characters\n"
// *Cause:  The input value was too long.
// *Action: Reduce the size of the value and re-enter.
00233,0, "Unable to obtain userid after %d attempts.  Retry command\n"
// *Cause:  SQL*Plus was unable to login after three attempts.
// *Action: Make sure the userid and password is correct and try
//          again.
00234,0, "Enter password: "
// *Document: NO
// *Cause:  Prompt.
// *Action:
00235,0, "Warning: You are no longer connected to ORACLE.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00238,0, "ERROR at line %d:\n%s"
// *Document: NO
// *Cause:
// *Action:
00239,0, "ERROR:\n%s"
// *Document: NO
// *Cause:
// *Action:
00240,0, "Enter value for %s: "
// *Cause:  SQL*Plus was unable to find a value for a substitution
//          variable.
// *Action: Enter a value for the substitution variable at the prompt.
00241,0, "No room for symbol %s (not defined)\n"
// *Cause:  Unable to allocate memory for the symbol.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00244,0, "Cannot issue a PRINT command within a PAGE break.\n"
// *Cause:  The PRINT command is not allowed within a PAGE break.
// *Action: Check the syntax of the PRINT command for the correct
//          options.
00245,0, "Unable to allocate temporary storage for PRINTing\n"
// *Cause:  Unable to allocate temporary storage for printing.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00246,0, "Illegal FORMAT string \"%s\"\n"
// *Cause:  An invalid format was specified for the column.
// *Action: Specify a valid format for the column.
00247,0, "WRAP option seen\n"
// *Document: NO
// *Cause:
// *Action:
00249,0, "%s not a valid variable type for printing.\n"
// *Cause:  The specified variable is not valid for printing.
// *Action: Check the variable type before re-typing the command.
00252,0, "rows will be truncated\n\n"
// *Document: NO
// *Cause:  This is an informational message returned if a column is
//          truncated when it is too big for the line.
// *Action:
00253,0, "data item %d (\"%s\") will not fit on line\n"
// *Cause:  The current line size setting is too small to fit the
//          specified data item on a line.
// *Action: Increase the line size so that the item can be displayed.
00256,0, "truncating (as requested) before column %s\n\n"
// *Document: NO
// *Cause:  This is an informational message. Usually it is caused when
//          the linesize is too small and the SET WRAP system variable is OFF.
// *Action:
00258,0, "could not create variable %s for column %s\n"
// *Cause:  The specified variable could not be created for column -
//          internal error or out of memory.
// *Action: Check memory usage.
00259,0, "could not create variable %s for COMPUTE INTO\n"
// *Cause:  The specified variable could not be created.
// *Action: Check the syntax of the command you used for the correct
//          options.
00260,0, "computation for column %s not uniquely qualified.\n"
// *Cause:  The specified column was not uniquely qualified in the
//          statement.
// *Action: Check the syntax of the command you used for the correct
//          options.
00261,0, "could be for table %s or %s. computation ignored.\n"
// *Document: NO
// *Cause:  Continuation of 260.
// *Action:
00262,0, "no room to allocate CCBDEF pointer array\n"
// *Cause:  An internal memory error occurred.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00263,0, "no room to allocate COMPUTE block for %s ON %s\n"
// *Cause:  Insufficient memory allocated to the COMPUTE block.
// *Action: Allocate more memory by closing other applications.
00265,0, "%s must be set ON or OFF\n"
// *Cause:  An invalid SET option name was specified.
// *Action: Re-enter with either ON or OFF as one of the SET options.
00266,0, "internal error: buffer (%d) smaller than l (%d)\n"
// *Cause:  An internal error occurred.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00267,0, "%s option %d out of range (%d through %u)\n"
// *Cause:  A value for a parameter was out of the specified range.
// *Action: Check the limits of the parameter and enter a value that
//          is within the range.
00268,0, "%s option not a valid number\n"
// *Cause:  Non-numeric value (integer) was entered for a parameter.
// *Action: Enter a valid numeric value (integer).
00270,0, "unknown FLAG in afiset (%d) ignored\n"
// *Cause:  An internal error occurred in the SET command.
// *Action: Make a note of the message, then contact Oracle Support
//          Services.
00271,0, "%s is not a buffer variable\n"
// *Cause:  The specified variable was not defined as a buffer.
// *Action: Make sure that the buffer variable name is correct and try
//          again.
00272,0, "%s character cannot be alphanumeric or whitespace\n"
// *Cause:  The specified character in the SET command cannot be
//          alphanumeric or white-space.
// *Action: Check the syntax of the command you used for the correct
//          options.
00277,0, "%s value not valid\n"
// *Cause:  The value entered was incorrect.
// *Action: Re-enter with a valid value.
00281,0, "%s missing set option\n"
// *Cause:  SET option was missing in the command.
// *Action: Check the syntax of the command you used for the correct
//          options.
00282,0, "is too long. maximum size is %d character.\n"
// *Document: NO
// *Cause:  Continuation of 313 or 314.
// *Action:
00283,0, "is too long. maximum size is %d characters.\n"
// *Document: NO
// *Cause:  Continuation of 313 or 314.
// *Action:
00284,0, "new: "
// *Document: NO
// *Cause:  SET VERIFY.
// *Action:
00285,0, "old: "
// *Document: NO
// *Cause:  SET VERIFY.
// *Action:
00286,0, "FEEDBACK ON for %d or more rows\n"
// *Document: NO
// *Cause:  SHOW FEEDBACK.
// *Action:
00289,0, "lines will be truncated\n"
// *Document: NO
// *Cause:
// *Action:
00290,0, "lines will be wrapped\n"
// *Document: NO
// *Cause:
// *Action:
00291,0, "USER is \"%s\"\n"
// *Document: NO
// *Cause:  SHOW USER.
// *Action:
00292,0, "%s \"%c\" (hex %x)\n"
// *Document: NO
// *Cause:  SHOW BLOCKTERMINATOR.
// *Action:
00294,0, "PAUSE is %s%s%s\n"
// *Document: NO
// *Cause:  SHOW PAUSE.
// *Action:
00295,0, "ON and set to \""
// *Document: NO
// *Cause:  Continuation of 294.
// *Action:
00306,0, "Invalid option.\n"
// *Cause:  Invalid option was specified for the command.
// *Action: Check the syntax of the command you used for the correct
//          options.
00308,0, "cannot close spool file\n"
// *Cause:  The file is currently being used.
// *Action: Release the file from the other process.
00309,0, "SQL*Plus command procedures may only be nested to a depth of %d.\n"
// *Cause:  Maximum number of nested procedures or scripts was reached.
// *Action: Reduce the number of nested procedures or scripts.
00310,0, "unable to open file \"%s\"\n"
// *Cause:  Unable to open the specified file.
// *Action: Check and make sure the file name is valid.
00311,0, "string expected but not found\n"
// *Cause:  SQL*Plus was expecting a string at the end of the command,
//          but could not find it.
// *Action: Retry the command with a valid string. Check the syntax of
//          the command you used for the correct options.
00312,0, "missing terminating quote (%.*s).\n"
// *Cause:  The DESCRIBE command schema or object did not have a
//          terminating quote.
// *Action: Close the opening quotation mark with the corresponding
//          closing quotation mark.
00313,0, "string \"%.*s\" "
// *Document: NO
// *Cause:
// *Action:
00314,0, "string beginning \"%.*s...\" "
// *Document: NO
// *Cause:
// *Action:
00316,0, "no rows selected\n\n"
// *Document: NO
// *Cause:  Feedback message, SET FEEDBACK.
// *Action:
00317,0, "expected symbol name is missing\n"
// *Cause:  SQL*Plus was expecting a symbol, but it was not specified.
// *Action: Check the syntax of the command you used for the correct
//          options.
00318,0, "symbol name beginning \"%.*s...\" is too long (max %d)\n"
// *Cause:  Specified variable name exceeded the maximum name length.
// *Action: Reduce the size of the symbol name and re-enter.
00319,0, "timing for: %s\n"
// *Document: NO
// *Cause:  Feedback message - TIMING.
// *Action:
00320,0, "no timing elements in use\n"
// *Document: NO
// *Cause:  Feedback message - TIMING.
// *Action:
00321,0, "%d timing element in use\n"
// *Document: NO
// *Cause:  Feedback message - TIMING.
// *Action:
00322,0, "%d timing elements in use\n"
// *Document: NO
// *Cause:  Feedback message - TIMING.
// *Action:
00323,0, "no room to add timing element - request denied\n"
// *Cause:  Unable to allocate memory while trying to run the TIMING
//          command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00324,0, "operating system timing error %d - request denied\n"
// *Cause:  The TIMING command failed to initialize due to a possible
//          operating system error.
// *Action: Resolve the operating system error and try again.
00325,0, "no timing elements to %.*s\n"
// *Cause:  There are no timers recorded to SHOW or STOP.
// *Action: Check that timers were created with the TIMING command.
00326,0, " real: %ld.2%ld"
// *Document: NO
// *Cause:  OSD.
// *Action:
00328,0, "no room to allocate title buffer\n"
// *Cause:  Unable to allocate memory while trying to run the TTITLE or
//          BTITLE command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00329,0, "currently spooling to %s\n"
// *Document: NO
// *Cause:  Feedback message - SPOOL.
// *Action:
00330,0, "not spooling currently\n"
// *Document: NO
// *Cause:  Feedback message - SPOOL.
// *Action:
00331,0, "SPOOL OUT disabled\n"
// *Cause:  An attempt was made to use SPOOL OUT where it is not supported.
// *Action: No action possible. SPOOL OUT has been disabled possibly because of
//          lack of printing support at the operating system level.
00332,0, "Cannot create spool file.\n"
// *Cause:  Possible causes:
//            - Insufficient privileges to create a file.
//            - A system error made it impossible to create a
//              file.
// *Action: Take the following actions:
//            - Change privileges to allow creation of the file.
//            - Consult the operating system documentation or contact
//              the System Administrator.
00333,0, "Illegal spool file name: \"%s\" (bad character: '%c')\n"
// *Cause:  An invalid filename was entered in the SPOOL command.
// *Action: Correct the filename and re-enter.
00340,0, "can not execute a sql statement in a before or after procedure\n"
// *Document: NO
// *Cause:
// *Action:
00341,0, "\nline overflow during variable substitution (>%d characters at line %d)\n"
// *Cause:  The maximum number of characters was exceeded in the SQL
//          buffer after the substitution variable was expanded.
// *Action: Reduce the length in the substitution variable and try
//          again.
00342,0, "old%4d: %.*s\n"
// *Document: NO
// *Cause:  Feedback message - SET VERIFY.
// *Action:
00343,0, "new%4d: %.*s\n"
// *Document: NO
// *Cause:  Feedback message - SET VERIFY.
// *Action:
00344,0, "xeqing line "
// *Document: NO
// *Cause:  XIS.
// *Action:
00345,0, "Invalid line number for execute\n"
// *Document: NO
// *Cause:  XIS.
// *Action:
00357,0, "Out of temporary storage\n"
// *Cause:  Unable to allocate memory while trying to run the command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00359,0, "memory exhausted\n"
// *Cause:  Unable to allocate memory while trying to run the command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00381,0, "%s is not available\n"
// *Cause:  The command specified is not implemented.
// *Action: Use the appropriate SQL*Plus command. See the
//          documentation for a list of commands and their correct
//          syntax.
00382,0, "The %s command is not available\n"
// *Cause:  The command was not recognized, or it is disabled. This
//          occurs if it is a command that does not have any meaning
//          in SQL*Plus (such as a SQL buffer editing command), or it
//          is not allowed for security reasons.
// *Action: Remove the command from the script. See the documentation
//          for a list of commands and their correct syntax.
00392,0, "Cannot UNDEFINE the current edit buffer\n"
// *Cause:  The current edit buffer cannot be undefined.
// *Action: No action required.
00394,0, "Illegal buffer name: \"%s\"\n"
// *Cause:  A buffer name contained an illegal character, for example
//          hyphen (-).
// *Action: Correct and remove the illegal character from the buffer
//          name.
00423,0, "Illegal GET command\n"
// *Cause:  An invalid option was used in the GET command.
// *Action: Check the syntax of the command you used for the correct
//          options.
00425,0, "\"%s\" is not a valid %s\n"
// *Cause:  The value entered in the ACCEPT command was not valid
//          for the specified datatype.
// *Action: Enter a valid value, e.g. 123 for a NUMBER variable.
00426,0, "Input truncated to %d characters\n"
// *Cause:  There was no carriage return at the last line of the SQL
//          statement.
// *Action: Insert a carriage return.
00428,0, "ERROR: %.256s\n\n"
// *Document: NO
// *Cause:
// *Action:
00450, 0, "Usage: WHENEVER SQLERROR\n"
// *Document: NO
// *Cause:  Usage message for WHENEVER SQLERROR. An option to WHENEVER
//          SQLERROR was invalid in SQL*Plus.
// *Action: Specify a valid option.
00451, 0, "     { CONTINUE  [ COMMIT | ROLLBACK | NONE ]\n"
// *Document: NO
// *Cause:  Continuation of 450.
// *Action:
00452, 0, "     | EXIT  [ SUCCESS | FAILURE | WARNING | n | <variable> | :<bindvariable> ] \n             [ COMMIT | ROLLBACK ] }\n"
// *Document: NO
// *Cause:  Continuation of 451.
// *Action:
00453, 0, "Usage: WHENEVER OSERROR\n"
// *Document: NO
// *Cause:  An option to WHENEVER OSERROR was invalid in SQL*Plus.
// *Action: Specify a valid option.
00454, 0, "     { CONTINUE  [ COMMIT | ROLLBACK | NONE ]  |  EXIT [ SUCCESS | FAILURE |\n"
// *Document: NO
// *Cause:  Continuation of 453.
// *Action:
00455, 0, "         WARNING | n | <variable> | :<bindvariable> | OSCODE ]\n             [ COMMIT | ROLLBACK ] }\n"
// *Document: NO
// *Cause:  Continuation of 454.
// *Action:
00480,0, "usage: COPY FROM <db> TO <db> <opt> <table> { (<cols>) } USING <sel>\n"
// *Document: NO
// *Cause:  Usage for COPY command was specified incorrectly.
// *Action: Specify a valid option.
00481,0, "  <db>   : database string, e.g., hr/your_password@d:chicago-mktg\n"
// *Document: NO
// *Cause:  Continuation of 480.
// *Action:
00482,0, "  <opt>  : ONE of the keywords: APPEND, CREATE, INSERT or REPLACE\n"
// *Document: NO
// *Cause:  Continuation of 481.
// *Action:
00483,0, "  <table>: name of the destination table\n"
// *Document: NO
// *Cause:  Continuation of 482.
// *Action:
00484,0, "  <cols> : a comma-separated list of destination column aliases\n"
// *Document: NO
// *Cause:  Continuation of 483.
// *Action:
00485,0, "  <sel>  : any valid SQL SELECT statement\n"
// *Document: NO
// *Cause:  Continuation of 484.
// *Action:
00486,0, "A missing FROM or TO clause uses the current SQL*Plus connection.\n"
// *Document: NO
// *Cause:  Continuation of 485.
// *Action:
00495,0, "FROM and TO clauses both missing; specify at least one.\n"
// *Cause:  The FROM and TO clauses were missing from the COPY
//          statement.
// *Action: Specify at least one clause. Check the syntax of the
//          command you used for the correct options.
00496,0, "misplaced FROM clause\n"
// *Cause:  The FROM keyword was in the wrong position in the COPY
//          command.
// *Action: Check the syntax of the COPY command for the correct
//          options.
00497,0, "misplaced TO clause\n"
// *Cause:  The TO keyword was in the wrong position in the COPY
//          command.
// *Action: Check the syntax of the COPY command for the correct
//          options.
00498,0, "missing parenthetical column list or USING keyword\n"
// *Cause:  A parenthetical list was missing in the column list or the
//          USING keyword is missing in the COPY command.
// *Action: Check the syntax of the COPY command for the correct
//          options.
00499,0, "misplaced APPEND keyword\n"
// *Cause:  The APPEND keyword was in the wrong position in the COPY
//          command.
// *Action: Check the syntax of the COPY command for the correct
//          options.
00501,0, "Error in SELECT statement: %.256s\n"
// *Cause:  Invalid SELECT statement found in the COPY command.
// *Action: Check the syntax of the COPY command for the correct
//          options.
00504,0, "\nCPY-%04d: %s\n"
// *Document: NO
// *Cause:
// *Action:
00510,0, "   %lu rows selected from %s@%s.\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00511,0, "   %lu rows inserted into %s.\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00512,0, "   %lu rows committed into %s at %s@%s.\n\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00513,0, "misplaced CREATE keyword\n"
// *Cause:  The CREATE keyword was in the wrong position in the COPY
//          command.
// *Action: Check the syntax of the COPY command for the correct
//          options.
00514,0, "misplaced REPLACE keyword\n"
// *Cause:  The REPLACE keyword was in the wrong position in the COPY
//          command.
// *Action: Check the syntax of the COPY command for the correct
//          options.
00515,0, "maximum number of columns (%d) exceeded\n"
// *Cause:  The maximum number of columns was exceeded in the COPY
//          command.
// *Action: Reduce the number of columns and try again.
00516,0, "invalid %s name \"%s\" encountered\n"
// *Cause:  An invalid or null column name was specified in either the
//          COLUMN or the ATTRIBUTE command.
// *Action: Retry the operation with a valid column name.
00517,0, "missing comma or right parenthesis\n"
// *Cause:  A missing right parenthesis was identified in the COPY
//          command.
// *Action: Retry the operation with a comma or right parenthesis.
00518,0, "missing USING clause\n"
// *Cause:  USING keyword is missing in the USING clause of the COPY
//          command.
// *Action: Specify the USING keyword before the USING clause of the
//          COPY command.
00519,0, "FROM string missing Oracle Net @database specification\n"
// *Cause:  Missing connect string for the database that contains the
//          data to be copied from in the COPY command.
// *Action: Include a FROM clause to specify a source database other
//          than the default.
00520,0, "TO string missing Oracle Net @database specification\n"
// *Cause:  Missing connect string for the database containing the
//          destination table in the COPY command.
// *Action: Include a TO clause to specify a source database other
//          than the default.
00521,0, "\nArray fetch/bind size is %d. (arraysize is %d)\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00522,0, "Will commit when done. (copycommit is 0)\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00523,0, "Will commit after every array bind. (copycommit is 1)\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00524,0, "Will commit after every %d array binds. (copycommit is %d)\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00525,0, "Maximum long size is %d. (long is %d)\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00526,0, "misplaced INSERT keyword\n"
// *Cause:  The INSERT keyword was misplaced in the COPY command.
// *Action: Check the syntax of the COPY command for the correct
//          options.
00527,0, "Table %s dropped.\n\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00528,0, "Table %s created.\n\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00533,0, "Only $HOST0, $HOST1, or $HOST2 are valid connection identifiers\n"
// *Document: NO
// *Cause: Feedback message - COPY. Connection identifiers are $HOST0, $HOST1
//         and $HOST2, other than these codes are invalid.
// *Action: You need to specify either $HOST0, $HOST1, or $HOST2 as connection
//          identifiers.
00534,0, "   %lu rows selected from %s connection.\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00535,0, "   %lu rows committed into %s at %s connection.\n\n"
// *Document: NO
// *Cause:  Feedback message - COPY.
// *Action:
00536,0, "variable"
// *Document: NO
// *Cause:  VARIABLE.
// *Action:
00537,0, "datatype"
// *Document: NO
// *Cause:  VARIABLE.
// *Action:
00540,0, "File \"%s\" already exists.\nUse \"SAVE filename[.ext] REPLACE\".\n"
// *Cause:  The file specified already exists.
// *Action: Use the REPLACE option to overwrite the existing file, or
//          specify another file name.
00543,0, "Warning:  Product user profile information not loaded!\n"
// *Document: NO
// *Cause:  Continuation of 623.
// *Action:
00544,0, "Command \"%s\" disabled in Product User Profile\n"
// *Cause:  An attempt was made to use a command that has been explicitly
//          disabled for your schema in this database.
// *Action: Ask your System Administrator why the Product User Profile (PUP)
//          table has been set to disable this command for your schema.
00545,0, "SET command requires an argument.\n"
// *Cause:  An argument was missing in the SET command.
// *Action: Check the syntax of the SET command for the correct
//          options.
00546,0, "User requested Interrupt or EOF detected.\n"
// *Cause:  Either end-of-file was reached, or CTRL-C was entered to
//          cancel the process.
// *Action: No action required.
00547,0, "%s option %lu out of range (%lu through %lu)\n"
// *Cause:  The specified SET option was out of range.
// *Action: Enter a value within the SET option range and re-try the
//          SET command.
00548,0, "Usage: VAR[IABLE] [ <variable> [ NUMBER | CHAR | CHAR (n [CHAR|BYTE]) |\n"
// *Document: NO
// *Cause:  Incorrect syntax for the VARIABLE command was entered.
// *Action: Check the syntax of the VARIABLE command for the correct
//          usage.
// *Comment: message used in the following order 548, 682, 683, 779
00549,0, "Usage: PRINT [:<variable> ...]\n"
// *Document: NO
// *Cause:  Incorrect syntax for the PRINT command was entered.
// *Action: Check the syntax of the PRINT command for the correct
//          usage.
00550,0, "Usage: SHOW ERRORS [{ FUNCTION | PROCEDURE | PACKAGE |\n   PACKAGE BODY | TRIGGER | VIEW \n"
// *Document: NO
// *Cause:  Incorrect syntax for the SHOW ERRORS command was entered.
// *Action: Check the syntax of the SHOW ERRORS command for the
//          correct options.
// *Comment: message used in the following order 550, 694 and 689
00551,0, "Errors for %s %s:\n"
// *Document: NO
// *Cause:
// *Action:
00552,0, "Bind variable \"%.*s\" not declared.\n"
// *Cause:  The specified bind variable was not declared.
// *Action: Run the VARIABLE command to check that the bind variables
//          you used in your SQL statement exist. Before running a SQL
//          statement with bind variables, you must use the VARIABLE
//          command to declare each variable.
00553,0, "Illegal variable name \"%s\".\n"
// *Document: NO
// *Cause:  Continuation of 318.
// *Action:
00556,0, "Invalid file name.\n"
// *Cause:  Missing file name or an invalid file name specified.
// *Action: Make sure that a file name was specified.
00557,0, "Error in disabling roles in product user profile.\n"
// *Document: NO
// *Cause:  Continuation of 543
// *Action:
00559,0, "Usage: EXEC[UTE] statement\n"
// *Document: NO
// *Cause:  Incorrect syntax for the EXECUTE command was entered.
// *Action: Check the syntax of the EXECUTE command for the correct
//          usage.
00560,0, "Usage: DESCRIBE [schema.]object[.subobject|@db_link] [column]\n"
// *Document: NO
// *Cause:  Incorrect syntax for the DESCRIBE command was entered.
// *Action: Check the syntax of the DESCRIBE command for the correct
//          usage.
00561,0, "Object does not exist.\n"
// *Cause:  The specified object you tried to DESCRIBE does not exist
//          in the database.
// *Action: Retry the command with a valid object name.
00562,0, "Object does not exist in package.\n"
// *Cause:  The specified object you tried to DESCRIBE does not exist
//          in the package.
// *Action: Check and make sure that the object name is correct.
00564,0, "Object \"%s\" is INVALID, it may not be described.\n"
// *Cause:  The specified object you tried to DESCRIBE is invalid.
// *Action: Re-validate the object.
00565,0, "Illegal identifier.\n"
// *Cause:  An invalid character was used in the DESCRIBE command.
// *Action: Correct the character and try again.
00566,0, "Illegal subobject specification.\n"
// *Cause:  Invalid sub-object specification in the DESCRIBE command.
// *Action: Correct the subject specification and try again.
00567,0, "Illegal column specification for PL/SQL object.\n"
// *Cause:  A column was described within an object in the DESCRIBE
//          command.
// *Action: Remove the column specification in the DESCRIBE command
//          and try again.
00568,0, "No bind variables declared.\n"
// *Cause:  There are no bind variables declared.
// *Action: No action required.
00570,0, "Usage: SET SERVEROUTPUT { ON | OFF } [SIZE {n | UNL[IMITED]}]\n             [ FOR[MAT] { WRA[PPED] | WOR[D_WRAPPED] | TRU[NCATED] } ]\n"
// *Document: NO
// *Cause:  An invalid option was used in the SET SERVEROUTPUT command.
// *Action: Specify a valid option.
00571,0, "No errors.\n"
// *Document: NO
// *Cause:  Feedback message - SHOW ERRORS.
// *Action:
00572,0, "COPYTYPECHECK is %s\n"
// *Document: NO
// *Cause:  SHOW COPYTYPECHECK.
// *Action:
00573,0, " Argument Name                  Type                    In/Out Default?\n"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00574,0, " ------------------------------ ----------------------- ------ --------\n"
// *Document: NO
// *Cause:  Continuation of 573.
// *Action:
00575,0, "Use of Oracle SQL feature not in SQL92 %s Level.\n"
// *Cause:  A SQL statement was attempted that is not FIPS compliant.
//          May also occur if a SQL*Plus feature e.g. SET AUTOTRACE
//          that uses Oracle-specific SQL was turned on when you are
//          using FIPS flagging.
// *Action: Use SET FLAGGER and turn FIPS compliance checking OFF,
//          or rewrite the statement.
00576,0, "WARNING:\n%s"
// *Document: NO
// *Cause:
// *Action:
00577, 0, "Usage: SET FLAGGER { OFF | ENTRY | INTERMEDIATE | FULL }\n"
// *Document: NO
// *Cause:  An invalid option was specified in the SET FLAGGER command.
// *Action: Specify a valid option.
00578, 0, "Elapsed: %2.2ld:%2.2ld:%2.2ld.%2.2ld"
// *Document: NO
// *Cause:  Feedback message - TIMING.
// *Action:
00579, 0, " real %5.1d.%2.2ld\n user %5.1d.%2.2ld\n sys %5.1d.%2.2ld\n"
// *Document: NO
// *Cause:  Feedback message - TIMING.
// *Action:
00581, 0, "Object %s is a package; use 'DESCRIBE <package>.<procedure>'\n"
// *Cause:  An attempt was made to describe a package as stand-alone,
//          no sub-object such as a procedure was supplied.
// *Action: Use the DESCRIBE command to describe a sub-object within a
//          package.
00582, 0, "Usage: { EXIT | QUIT }  [ SUCCESS | FAILURE | WARNING | n |\n"
// *Document: NO
// *Cause:  An option to EXIT was invalid in SQL*Plus.
// *Action: Specify a valid option.
00583, 0, "       <variable> | :<bindvariable> ]  [ COMMIT | ROLLBACK ]\n"
// *Document: NO
// *Cause:  Continuation of 582.
// *Action:
00584, 0, "EXIT variable \"%s\" was non-numeric\n"
// *Cause:  The specified EXIT variable is non-numeric.
// *Action: Check the syntax of the EXIT command for the correct
//          usage.
00589, 0, "O/S Message"
// *Document: NO
// *Cause:  Feedback message. This is the OSD error that triggered the
//          WHENEVER OSERROR action.
// *Action:
00590, 0, "A COMPUTE function must appear before each LABEL keyword\n"
// *Cause:  The function COMPUTE must appear before each LABEL keyword.
// *Action: Check the syntax of the COMPUTE command for the correct
//          usage.
00591, 0, "Unable to allocate dynamic space needed (%s bytes)\n"
// *Cause:  Unable to allocate memory to process the command.
// *Action: Free up additional memory by: closing applications not
//          required; reducing the size of the command, or statement;
//          or by recoding the query to select fewer records.
00593, 0, "Label text must follow the LABEL keyword\n"
// *Cause:  Missing label text about the LABEL keyword in the COMPUTE
//          command.
// *Action: Check the syntax of the COMPUTE command for the correct
//          options.
00594, 0, "Usage: SET COLSEP { \" \" | text}\n"
// *Document: NO
// *Cause:  An invalid option was used in the SET COLSEP command.
// *Action: Specify a valid option.
00595,0, "AUTOCOMMIT ON for every %ld DML statements\n"
// *Document: NO
// *Cause:  SHOW AUTOCOMMIT.
// *Action:
00596,0, "Usage: SET AUTO[COMMIT] { OFF | ON | IMM[EDIATE] | n } \n"
// *Document: NO
// *Cause:  An invalid option was used in the SET AUTO[COMMIT] command.
// *Action: Check the syntax of the SET AUTOCOMMIT command for the
//          correct options.
00597, 0, "\"%s\" is not a valid %s format\n"
// *Cause:  The value entered in the ACCEPT command was not in the
//          specified datatype.
// *Action: Correct the datatype and re-enter.
00598, 0, "\"%s\" does not match input format \"%s\"\n"
// *Cause:  The value entered in the ACCEPT command was not in the
//          specified format.
// *Action: Correct the format and try again.
00599, 0, "Usage: SET EDITF[ILE] filename[.ext]\n"
// *Document: NO
// *Cause:  Required filename was missing after the SET EDITFILE
//          command.
// *Action: Check the syntax of the SET EDITFILE command for the
//          correct options.
00603, 0, "Illegal STORE command\n"
// *Cause:  An invalid option was used in the STORE command.
// *Action: Check the syntax of the STORE command for the correct
//          options.
00604, 0, "Usage: STORE {SET} filename[.ext] [CRE[ATE]|REP[LACE]|APP[END]]\n"
// *Document: NO
// *Cause:  Usage message and is a continuation message for 88, 556, 603.
// *Action:
00605, 0, "File \"%s\" already exists.\nUse another name or \"STORE {SET} filename[.ext] REPLACE\"\n"
// *Cause:  The file specified in the STORE command already exists.
// *Action: Use the REPLACE option to overwrite the existing file, or
//          specify another file name.
00606,0, "Cannot create %s file \"%s\"\n"
// *Cause:  The STORE command was unable to create the specified
//          file. There may be insufficient disk space, too many open
//          files, or read-only protection on the output directory.
// *Action:Check that there is sufficient disk space and that the
//          protection on the directory allows file creation.
00607,0, "Cannot close %s file \"%s\"\n"
// *Cause:  The STORE command was unable to close the specified
//          file. Another resource may have locked the file.
// *Action: Check that the file is not locked before closing it.
00608, 0, "Object \"%s\" is a remote object, cannot further describe\n"
// *Cause:  Unable to DESCRIBE the remote object.
// *Action: No action required.
00609, 0, "Usage: SET AUTOT[RACE] {OFF | ON | TRACE[ONLY]} [EXP[LAIN]] [STAT[ISTICS]]\n"
// *Document: NO
// *Cause:  An invalid option was used in the SET AUTOTRACE command.
// *Action: Check the syntax of the SET AUTOTRACE command for the
//          correct options.
00610, 0, "Error initializing %s\n"
// *Cause:  Not enough memory to enable this feature.
// *Action: Free up additional memory by closing applications not
//          required, or reduce the size of the command, statement or
//          query output.
00611, 0, "Error enabling %s report\n"
// *Document: NO
// *Cause:  Continuation of 613 or 618.
// *Action:
00612, 0, "Error generating %s report\n"
// *Cause:  Unable to generate the report using AUTOTRACE.
// *Action: Make a note of the message and the number, then contact
//          the Database Administrator.
00613, 0, "Unable to verify PLAN_TABLE format or existence\n"
// *Cause:  An AUTOTRACE command was issued by a user with insufficient
//          privileges, or who did not have a PLAN_TABLE.
// *Action: Make sure the user has been granted the PLUSTRACE role,
//          and that a PLAN_TABLE has been created for the user.
00614, 0, "Server version too low for this feature\n"
// *Cause:  The current version of the Oracle Server is too low for
//          this feature.
// *Action: Use a higher version of the Oracle Server.
00615, 0, "Execution Plan\n"
// *Document: NO
// *Cause:  AUTOTRACE column heading.
// *Action:
// *Comment: Do not translate.
00616, 0, "Statistics\n"
// *Document: NO
// *Cause:  AUTOTRACE column heading.
// *Action:
// *Comment: Do not translate.
00617, 0, "Cannot construct a unique STATEMENT_ID\n"
// *Cause:  Unable to construct a unique statement ID in AUTOTRACE.
// *Action: Check that AUTOTRACE is configured and that you have the
//          PLUSTRACE role enabled.
00618, 0, "Cannot find the Session Identifier.  Check PLUSTRACE role is enabled\n"
// *Cause:  Unable to find the session identifier.
// *Action: Check that the PLUSTRACE role has been granted.
00619, 0, "Error while connecting\n"
// *Cause:  An error occurred while AUTOTRACE attempted to make a
//          second connection to the database instance.
// *Action: Check that the database limit on number of active sessions
//          has not been exceeded.
00620, 0, "Error while disconnecting\n"
// *Cause:  An error occurred while AUTOTRACE attempted to disconnect
//          from the database instance.
// *Action: Check that the database is still available.
00621, 0, "Error ORA-%s while gathering statistics\n"
// *Cause:  No data was found in the PLAN_TABLE while gathering
//          statistics using AUTOTRACE.
// *Action: Refer to the Oracle Database Error Messages for the specified ORA
//          error message.
00622, 0, "Starting line number must be less than ending line number\n"
// *Cause:  The starting line number specified is larger than the
//          ending number.
// *Action: Re-enter the starting line number with a smaller line
//          number.
00623, 0, "Error accessing PRODUCT_USER_PROFILE\n"
// *Cause:  The PRODUCT_USER_PROFILE table has not been built in the
//          SYSTEM account.
// *Action: The exact format of the file extension and location of the
//          file are system dependent. See the SQL*Plus installation
//          guide provided for your operating system. The script must
//          be run as user SYSTEM.
00624, 0, "You may need to run PUPBLD.SQL as SYSTEM\n"
// *Document: NO
// *Cause:  Continuation of 543.
// *Action:
00625, 0, "Error printing variable \"%s\"\n"
// *Cause:  Error encountered while printing the specified variable.
// *Action: Check that the specified variable is correct and try
//          again.
00626, 0, "Error accessing package DBMS_APPLICATION_INFO\n"
// *Cause:  This message is followed by a successful login to the
//          Oracle Server. The DBMS_APPLICATION package is used to
//          maintain on-line information about a particular
//          application logged onto Oracle. SET APPINFO could not be
//          initialized.
// *Action: This package is created during the running of the
//          CATPROC.SQL and should be available on all databases from
//          Oracle 7.2. Check that your database is correctly
//          installed.
00627, 0, "You may need to install the Oracle Procedural option\n"
// *Document: NO
// *Cause:  Continuation of 626.
// *Action:
00628, 0, "SET APPINFO requires Oracle Server Release 7.2 or later\n"
// *Document: NO
// *Cause:  Continuation of 627.
// *Action:
00629, 0, "Usage: SET APPI[NFO] { ON | OFF | text }\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
00630, 0, "%s is %s and set to \"%s\"\n"
// *Document: NO
// *Cause:  APPINFO.
// *Action:
00631, 0, "String beginning \"%s\" is too long\n"
// *Cause:  The string specified was too long.
// *Action: Reduce the size of the specified string and re-try the
//          operation.
00632, 0, "Maximum size is 1 character\n"
// *Document: NO
// *Cause:  Continuation of 631.
// *Action:
00633, 0, "Maximum size is %s characters\n"
// *Document: NO
// *Cause:  Continuation of 631.
// *Action:
00634, 0, "%s %s %sand is %s\n"
// *Document: NO
// *Cause:  TTITLE or BTITLE.
// *Action:
00635, 0, "%s %s %sand is the following 1 character:\n%.*s\n"
// *Document: NO
// *Cause:  TTITLE or BTITLE.
// *Action:
00636, 0, "%s %s %sand is the following %d characters:\n%.*s\n"
// *Document: NO
// *Cause:  TTITLE or BTITLE.
// *Action:
00637, 0, "%s %s and is the first few characters of the next SELECT statement\n"
// *Document: NO
// *Cause:  TTITLE or BTITLE.
// *Action:
00638, 0, "%s %s and is the following 1 character:\n%.*s\n"
// *Document: NO
// *Cause:  TTITLE or BTITLE.
// *Action:
00639, 0, "%s %s and is the following %d characters:\n%.*s\n"
// *Document: NO
// *Cause:  TTITLE or BTITLE.
// *Action:
00640, 0, "Not connected\n"
// *Cause:  The PASSWORD command was issued when there was no
//          connection to the Oracle instance.
// *Action: Connect to the Oracle database before re-issuing the
//          PASSWORD command.
00641, 0, "\"%s\" requires connection to server\n"
// *Cause:  SQL*Plus was unable to execute the command because there
//          was no connection to a database.
// *Action: Connect to a database and re-try the operation.
00642, 0, "SQL*Plus internal error state %lu, context %u:%u:%u\n"
// *Cause:  An internal error occurred.
// *Action: Make a note of the message, then contact Oracle Support
//          Services.
00643, 0, "Unsafe to proceed\n"
// *Document: NO
// *Cause:  Continuation of 642.
// *Action:
00644, 0, "Unable to proceed\n"
// *Document: NO
// *Cause:  Continuation of 642.
// *Action:
00645, 0, "Operating System error occurred\n"
// *Cause:  An operating system error occurred with the EDIT command.
// *Action: Check that the file was created successfully, and verify
//          that the device you are writing to is still available.
00646, 0, "Unable to complete EDIT command\n"
// *Document: NO
// *Cause:  Continuation of 556 and 645.
// *Action:
00647, 0, "Changing password for %s\n"
// *Document: NO
// *Cause:  Feedback message - PASSWORD.
// *Action:
00650, 0, "New passwords do not match\n"
// *Cause:  The new passwords entered did not match.
// *Action: Re-issue the PASSWORD command and make sure that the new
//          passwords are entered correctly.
00652, 0, "Password changed\n"
// *Document: NO
// *Cause:  Feedback message - PASSWORD.
// *Action:
00659, 0, "Password unchanged\n"
// *Cause:  The PASSWORD command failed to change passwords because:
//            - No passwords were given.
//            - The new passwords did not match.
// *Action: Re-issue the PASSWORD command and make sure that the new
//          passwords are entered correctly.
00660, 0, "Old password: "
// *Document: NO
// *Cause:  PASSWORD.
// *Action:
00661, 0, "New password: "
// *Document: NO
// *Cause:  PASSWORD.
// *Action:
00662, 0, "Retype new password: "
// *Document: NO
// *Cause:  PASSWORD.
// *Action:
00665, 0, "Usage: SET SHIFT[INOUT] {VIS[IBLE|INV[ISIBLE]} \n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
00666, 0, "WARNING: SHIFTINOUT only affects shift sensitive character sets\n"
// *Cause:  The NLS character set used in this session does not contain
//          shift sensitive characters. The SET SHIFTINOUT command is
//          unnecessary.
// *Action: No action required.
00667, 0, "Message file %s<lang>.msb not found\n"
// *Cause:  The SP1, SP2, or CPY message file could not be
//          found. SQL*Plus cannot run.
// *Action: Check the Oracle platform specific documentation to make
//          sure SQL*Plus is installed correctly. This may occur
//          because the ORACLE_HOME environment variable or registry
//          equivalent is not set to the location of the Oracle
//          software. Make sure this value is set correctly. Check
//          that the SQL*Plus binary message files exist in the
//          SQL*Plus message directory, for example
//          $ORACLE_HOME/sqplus/mesg. Check the value of NLS_LANG
//          environment variable or registry equivalent is correct.
00668, 0, "Invalid variable name\n"
// *Cause:  An invalid character was specified as part of the variable
//          name.
// *Action: Specify the variable with valid characters.
00669, 0, "Valid characters are alphanumerics and '_'\n"
// *Cause:  An invalid character was specified as part of the variable
//          name.
// *Action: Specify the variable with alphanumeric characters and '_'.
00670, 0, "Internal number conversion failed\n"
// *Cause:  A conversion request could not be performed because the
//          string contained alphanumeric characters.
// *Action: Make sure that the string only contains numeric digits.
00671, 0, "Usage: SET NEWP[AGE] { 1 | n | NONE }\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
00673, 0, "Usage: SET REFDISP[LAY] { n | UNL[IMITED] }\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
00675, 0, "COPY command not available\n"
// *Cause:  The COPY command is not available in this version of
//          SQL*Plus.
// *Action: Make a note of the message and the number, then contact
//          Oracle Support Services.
00676, 0, "Bind variable length cannot exceed %u%s"
// *Cause:  The length of the bind variable datatype was exceeded.
// *Action: Reduce the length of the bind variable datatype.
00677, 0, "Try reducing ARRAYSIZE or the number of columns selected\n"
// *Document: NO
// *Cause:  Continuation of 591.
// *Action:
00678, 0, "Column or attribute type can not be displayed by SQL*Plus\n"
// *Cause:  The type specified is not supported.
// *Action: Rewrite the query to select the data with types that
//          SQL*Plus supports.
00682,0, "                    VARCHAR2 (n [CHAR|BYTE]) | NCHAR | NCHAR (n) |\n"
// *Document: NO
// *Cause:  Continuation of 548.
// *Action:
// *Comment: message used in the following order 548, 682, 683, 779
00683,0, "                    NVARCHAR2 (n) | CLOB | NCLOB | BLOB | BFILE\n"
// *Document: NO
// *Cause:  Continuation of 682.
// *Action:
// *Comment: message used in the following order 548, 682, 683, 779
00684,0, "CURSOR STATEMENT : %d"
// *Document: NO
// *Cause:  Nested cursor place holder.
// *Action:
00685, 0, "The date \"%s\" is invalid or format mismatched \"%s\"\n"
// *Cause:  An invalid date was entered or does not match the format.
// *Action: Enter a valid date or a date in the required format.
00686, 0, "Usage: DESCRIBE [schema.]object[@db_link]\n"
// *Document: NO
// *Cause:  An invalid option was used in the DESCRIBE command.
// *Action: Check the syntax of the DESCRIBE command for the correct
//          options.
00687, 0, "Disconnected\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00689,0, "   | JAVA SOURCE | JAVA CLASS } [schema.]name]\n"
// *Document: NO
// *Cause:  Continuation of 694.
// *Action:
// *Comment: messages used in the following order 550, 694 and 689
00692, 0, "Usage: CONN[ECT] [{logon|/|proxy} [AS {SYSDBA|SYSOPER|SYSASM}] [edition=value]]\n"
// *Document: NO
// *Cause:  Continuation of 306. An invalid option was entered for the
//          SQL*Plus CONNECT command.
// *Action: Check the syntax for the CONNECT command for the correct
//          usage.
00693, 0, "where <logon> ::= <username>[/<password>][@<connect_identifier>]\n      <proxy> ::= <proxyuser>[<username>][/<password>][@<connect_identifier>]\n"
// *Document: NO
// *Cause:  Continuation of 692.
// *Action:
00694,0, "   | TYPE | TYPE BODY | DIMENSION \n"
// *Document: NO
// *Cause:  Continuation of 550.
// *Action:
00701, 0, "Connected to an idle instance.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00703, 0, "ORACLE instance started.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00704, 0, "ORACLE instance shut down.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00705, 0, "Database mounted.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00706, 0, "Database opened.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00707, 0, "Database dismounted.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00708, 0, "Database closed.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00709, 0, "Media recovery cancelled.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00710, 0, "Media recovery complete.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00711, 0, "Log applied.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00712, 0, "1 log archived.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00713, 0, "%lu logs archived.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00714, 0, "invalid combination of STARTUP options\n"
// *Cause:  The specified options of the STARTUP command cannot be used
//          simultaneously.
// *Action: Check the syntax of the STARTUP command for the correct
//          usage.
00715, 0, "invalid combination of SHUTDOWN options\n"
// *Cause:  The specified options of the SHUTDOWN command cannot be
//          used simultaneously.
// *Action: Check the syntax of the SHUTDOWN command for the correct
//          usage.
00716, 0, "invalid combination of ARCHIVE LOG options\n"
// *Cause:  The specified options of the ARCHIVE LOG command cannot be
//          used simultaneously.
// *Action: Check the syntax of the ARCHIVE LOG command for the
//          correct usage.
00717, 0, "illegal SHUTDOWN option\n"
// *Cause:  An invalid option was used in the SHUTDOWN command.
// *Action: Check the syntax of the SHUTDOWN command for the correct
//          options.
00718, 0, "illegal ARCHIVE LOG option\n"
// *Cause:  An invalid option was used in the ARCHIVE LOG command.
// *Action: Check the syntax of the ARCHIVE LOG command for the
//          correct options.
00719, 0, "Database log mode              Archive Mode\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00720, 0, "Database log mode              No Archive Mode\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00721, 0, "Automatic archival             Enabled\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00722, 0, "Automatic archival             Disabled\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00723, 0, "Archive destination            %s\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00724, 0, "Oldest online log sequence     %lu\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00725, 0, "Next log sequence to archive   %lu\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00726, 0, "Current log sequence           %lu\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00727, 0, "Statement processed.\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00728, 0, "Specify log: {<RET>=suggested | filename | AUTO | CANCEL}\n"
// *Cause:  This is a RECOVER DATABASE command prompt, prompting for
//          the redo log files to be applied.
// *Action: Enter one of the redo log file options.
00729, 0, "cannot SET INSTANCE while connected to a database\n"
// *Cause:  There was a problem with the connection instance while
//          issuing the SET INSTANCE command.
// *Action: Disconnect from the instance before re-issuing the
//          command.
00730, 0, "Name"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00731, 0, "Null?"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00732, 0, "Type"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00733, 0, "Invalid connect string\n"
// *Cause:  An invalid connect string was specified.
// *Action: Check that the connect string is correct.
00734, 0, "unknown command beginning \"%s...\" - rest of line ignored.\n"
// *Cause:  The command entered was invalid.
// *Action: Check the syntax of the command you used for the correct
//          options.
00735,0, "unknown %s%s%s option beginning \"%s...\"\n"
// *Cause:  An invalid option was specified for a given command.
// *Action: Check the syntax of the command you used for the correct
//          options.
00736,0, "command line overflow while substituting into line beginning \"%s...\""
// *Cause:  The maximum length of the command line was exceeded.
// *Action: Reduce the length of the data in the substitution
//          variables used in the command.
00737,0, "Usage: SET DESCRIBE [DEPTH {1|n|ALL}] [LINENUM {ON|OFF}] [INDENT {ON|OFF}]\n"
// *Document: NO
// *Cause:  An invalid option was used in the SET DESCRIBE command.
// *Action: Check the syntax of the SET DESCRIBE command for the
//          correct options.
00738,0, "Restricted command \"%s\" not available\n"
// *Cause:  For security reasons, the command was restricted by the
//          -RESTRICT command-line option.
// *Action: Ask your database administrator why SQL*Plus should be run
//          with a "-RESTRICT" option.
00739,0, "Usage: SET MARKUP HTML [ON|OFF] [HEAD text] [BODY text]\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
00740,0, " [TABLE text] [ENTMAP {ON|OFF}] [SPOOL {ON|OFF}] [PRE[FORMAT] {ON|OFF}]\n"
// *Document: NO
// *Cause:  Continuation of 739.
// *Action:
00741,0, "Usage: [-M[ARKUP] \"HTML [ON|OFF] [HEAD text] [BODY text]\n"
// *Document: NO
// *Cause:  Continuation of 740.
// *Action:
00742,0, "  [TABLE text] [ENTMAP {ON|OFF}] [SPOOL {ON|OFF}] [PRE[FORMAT] {ON|OFF}]\"\n"
// *Document: NO
// *Cause:  Continuation of 741.
// *Action:
00744,0, " Report"
// *Document: NO
// *Cause:  Default title for HTML report.
// *Action:
00745, 0, "Usage: SET SQLPLUSCOMPAT[IBILITY] version.release.[update]\n"
// *Document: NO
// *Cause:  An invalid option was used in the SET SQLPLUSCOMPAT[IBLITY]
//          command.
// *Action: Check the syntax of the SET SQLPLUSCOMPATIBLITY command
//          for the correct options.
00746, 0, "%s option out of range (%s through %s)\n"
// *Cause:  The specified value was not in the range.
// *Action: Specify a value in the range.
00747, 0, "PAGESIZE must be at least %d to run this query with LINESIZE %d\n"
// *Cause:  The PAGESIZE setting was too small to display the specified
//          LINESIZE.
// *Action: Increase the PAGESIZE to at least match the specified
//          LINESIZE.
00749, 0, "Cannot resolve circular path of synonym \"%s\"\n"
// *Cause:  An attempt was made to use a synonym to point to an object that no
//          longer exists where the synonym had the same name as the base
//          object, or an attempt was made to use a synonym that has a circular
//          path that points back to itself.
// *Action: Make sure that the last synonym in the synonym path points to an
//          object that exists, and that it doesn't point back to itself.
00750, 0, "You may need to set ORACLE_HOME to your Oracle software directory\n"
// *Cause:  SQL*Plus was unable to find a message file during program
//          initialization, and could not display error messages or text
//          required for normal operation. The most common cause is that
//          ORACLE_HOME has not been set. For Instant Client, the common
//          cause is that LD_LIBRARY_PATH has not been set to the Instant
//          Client directory or libsqlplusic.so is missing. Other possible
//          causes are a corrupt or unreadable message file.  On Windows the
//          environment variable called "SQLPLUS" may be invalid.
//
//          This message is hard coded (in English) in the SQL*Plus
//          source code so it can be displayed on message file error. It
//          could never be read from this message file because the error
//          occurs only when the message files cannot be opened. This
//          entry in the message file is for documentation purposes
//          only.
// *Action: Make sure that all environment variables or registry entries
//          needed to run SQL*Plus are set. The variables are platform
//          specific but may include ORACLE_HOME, ORACLE_SID, NLS_LANG,
//          and LD_LIBRARY_PATH.
//
//          For Instant Client,make sure LD_LIBRARY_PATH, PATH and SQLPATH
//          are set to location where Instant Client libraries are and
//          libsqlpusic.so exists.
//
//          On Windows if the environment variable called "SQLPLUS" is
//          set, it must contain the directory name of the SQL*Plus
//          message files.  For example %ORACLE_HOME%\sqlplus\mesg.
//
//          Also check that the file sp1XX.msb is in the
//          $ORACLE_HOME/sqlplus/mesg or %ORACLE_HOME%\sqlplus\mesg
//          directory. The "XX" stands for the country prefix associated
//          with your NLS_LANG environment variable.  SQL*Plus reads
//          only one of the sp1XX.msb files. For example sp1ja.msb is
//          read if NLS_LANG is JAPANESE_JAPAN.JA16EUC. If NLS_LANG is
//          not set, then the default (English language) sp1us.msb is
//          used.  Check that the appropriate file is of non-zero size
//          and that the file permissions allow it to be read. Note that
//          ".msb" files are binary. The contents may be meaningless
//          when viewed or printed. If you are unsure which language
//          file is being used, unset NLS_LANG and run SQL*Plus to
//          verify it can read the sp1us.msb file.
00751,0, "Unable to connect to Oracle.  Exiting SQL*Plus\n"
// *Cause:  No connection to an Oracle server could be made.
// *Action: Normally occurs after other errors showing that
//          the database is not running, the network is not configured
//          or that the username and password were invalid.
00752, 0, "Usage: -C[OMPATIBILITY] version.release.[update]\n"
// *Cause:  An invalid option was used in the -C[OMPATIBILITY]
//          command option.
// *Action: Check the syntax of the SQL*Plus executable
//          for the correct options.
00753,0, "STARTUP with MIGRATE only valid with Oracle 9.2 or greater\n"
// *Cause:  STARTUP MIGRATE was used to try to startup an Oracle
//          server for a release prior to 9.2.
// *Action: Check the platform specific environment to verify that
//          you are connecting to an Oracle server that is at least
//          release 9.2.
00754,0, "FROM clause cannot contain AS SYSDBA or AS SYSOPER\n"
// *Cause:  The COPY command does not support AS SYSDBA or AS SYSOPER
//          connections.
// *Action: Remove AS SYSDBA or AS SYSOPER from the FROM clause.
00755,0, "TO clause cannot contain AS SYSDBA or AS SYSOPER\n"
// *Cause:  The COPY command does not support AS SYSDBA or AS SYSOPER
//          connections.
// *Action: Remove AS SYSDBA or AS SYSOPER from the TO clause.
00756,0, "FROM clause length %d bytes exceeds maximum length %d\n"
// *Cause:  The FROM clause is too long.
// *Action: Reduce the string specified in the FROM clause.
00757,0, "TO clause length %d bytes exceeds maximum length %d\n"
// *Cause:  The TO clause is too long.
// *Action: Reduce the string specified in the TO clause.
00758,0, "FROM clause missing username\n"
// *Cause:  The COPY command FROM clause must include a username.
// *Action: Specify a username in the FROM clause.
00759,0, "TO clause missing username\n"
// *Cause:  The COPY command TO clause must include a username.
// *Action: Specify a username in the TO clause.
00760,0, "Enter FROM password: "
// *Document: NO
// *Cause:  Prompt.
// *Action:
00761,0, "Enter TO password: "
// *Document: NO
// *Cause:  Prompt.
// *Action:
00764,0, " %s is an incomplete TYPE\n"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00765,0, " %s extends %s.%s\n"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00766,0, " %s is NOT FINAL\n"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00767,0, " %s is NOT INSTANTIABLE\n"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00768, 0, "Illegal SPOOL command\n"
// *Cause:  An invalid option was used in the SPOOL command.
// *Action: Check the syntax of the SPOOL command for the correct
//          options.
00769, 0, "Usage: SPOOL { <file> | OFF | OUT }\n"
// *Cause:  Incorrect syntax for the SPOOL command was entered.
// *Action: Check the syntax of the SPOOL command for the correct
//          usage.
// *Comment: message used in the following order 769, 770
00770, 0, "where <file> is file_name[.ext] [CRE[ATE]|REP[LACE]|APP[END]]\n"
// *Document: NO
// *Cause:  Continuation of 769.
// *Action:
// *Comment: message used in the following order 769, 770
00771, 0, "File \"%s\" already exists.\nUse another name or \"SPOOL filename[.ext] REPLACE\"\n"
// *Cause:  The file specified in the SPOOL command already exists.
// *Action: Use the REPLACE option to overwrite the existing file, or
//          specify another file name.
00772,0, "ASM instance started\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00773,0, "ASM diskgroups mounted\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00774,0, "ASM instance shutdown\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00775,0, "ASM diskgroups dismounted\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00776,0, "ASM diskgroups volume enabled\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00777,0, "ASM diskgroups volume disabled\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00778,0, "Script filename and arguments too long\n"
// *Cause: The combined length of the script filename and script
//         arguments is too long for SQL*Plus.
// *Action: Reduce the length of the script name and path.  Reduce the
//          number and/or size of the script arguments.
00779,0, "                    REFCURSOR | BINARY_FLOAT | BINARY_DOUBLE ] ]\n"
// *Document: NO
// *Cause:  Continuation of 683.
// *Action:
// *Comment: message used in the following order 548, 682, 683, 779
00780,0, "Value entered is not a valid %s\n"
// *Cause:  The value entered in the ACCEPT command was not valid
//          for the specified datatype.
// *Action: Enter a valid value  within a valid range for the datatype.
00782,0, "Prelim connection established\n"
// *Document: NO
// *Cause:  Feedback message.
// *Action:
00783,0, "Cannot SET %s while connected to a database\n"
// *Cause:  Attempted to set a system variable that cannot
//          be set while still connected to a database instance
// *Action: Disconnect from the database instance before
//          attempting to set the system variable
00784,0, "Invalid or incomplete character beginning 0x%02X returned\n"
// *Cause:  Attempted to return a string from the database that contained
//          an invalid or incomplete character.
// *Action: Replace the invalid or incomplete string in the database with
//          a valid or complete string.
00785,0, "Evaluation Context Comment"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00786,0, "Table Alias Name"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00787,0, "Table Name"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00788,0, "Variable Name"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00789,0, "Variable Type"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00790,0, "Value Function"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00791,0, "Method Function"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00792,0, "Rule Condition"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00793,0, "ECTX Owner"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00794,0, "ECTX Name"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00795,0, "Rule Comment"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00796,0, "Rule Action Context Name"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00797,0, "Rule Action Context Value"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00798,0, "Evaluation Context Owner"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00799,0, "Evaluation Context Name"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00800,0, "Rule Set Comment"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00803,0, "Evaluation Context Function"
// *Document: NO
// *Cause:  DESCRIBE.
// *Action:
00804, 0, "Procedure created with compilation warnings"
// *Cause:  The PL/SQL procedure has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL procedure.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00805, 0, "Procedure altered with compilation warnings"
// *Cause:  The PL/SQL procedure has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL procedure.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00806, 0, "Function created with compilation warnings"
// *Cause:  The PL/SQL function has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL function.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00807, 0, "Function altered with compilation warnings"
// *Cause:  The PL/SQL function has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL function.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00808, 0, "Package created with compilation warnings"
// *Cause:  The PL/SQL package has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL package.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00809, 0, "Package altered with compilation warnings"
// *Cause:  The PL/SQL package has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL package.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00810, 0, "Package Body created with compilation warnings"
// *Cause:  The PL/SQL package body has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL package body.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00811, 0, "Package Body altered with compilation warnings"
// *Cause:  The PL/SQL package body has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL package body.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00812, 0, "View created with compilation warnings"
// *Cause:  The PL/SQL view has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL view.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00813, 0, "View altered with compilation warnings"
// *Cause:  The PL/SQL view has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL view.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00814, 0, "Trigger created with compilation warnings"
// *Cause:  The PL/SQL trigger has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL trigger.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00815, 0, "Trigger altered with compilation warnings"
// *Cause:  The PL/SQL trigger has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL trigger.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00816, 0, "Type created with compilation warnings"
// *Cause:  The PL/SQL type has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL type.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00817, 0, "Type altered with compilation warnings"
// *Cause:  The PL/SQL type has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL type.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00818, 0, "Type Body created with compilation warnings"
// *Cause:  The PL/SQL type body has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL type body.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00819, 0, "Type Body altered with compilation warnings"
// *Cause:  The PL/SQL type body has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL type body.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00820, 0, "Library created with compilation warnings"
// *Cause:  The PL/SQL library has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL library.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00821, 0, "Library altered with compilation warnings"
// *Cause:  The PL/SQL library has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL library.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00822, 0, "Java created with compilation warnings"
// *Cause:  The PL/SQL java has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL java.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00823, 0, "Java altered with compilation warnings"
// *Cause:  The PL/SQL java has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL java.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00824, 0, "PL/SQL compilation warnings"
// *Cause:  The PL/SQL block has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL block.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00825, 0, "Dimension created with compilation warnings"
// *Cause:  The PL/SQL dimension has been created, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL dimension.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00826, 0, "Dimension altered with compilation warnings"
// *Cause:  The PL/SQL dimension has been altered, but has one or more
//          warnings, informational messages or performance messages
//          that may help you to improve your PL/SQL dimension.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00827, 0, "Procedure created with compilation errors"
// *Cause:  The PL/SQL procedure has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00828, 0, "Procedure altered with compilation errors"
// *Cause:  The PL/SQL procedure has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00829, 0, "Function created with compilation errors"
// *Cause:  The PL/SQL function has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00830, 0, "Function altered with compilation errors"
// *Cause:  The PL/SQL function has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00831, 0, "Package created with compilation errors"
// *Cause:  The PL/SQL package has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00832, 0, "Package altered with compilation errors"
// *Cause:  The PL/SQL package has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00833, 0, "Package Body created with compilation errors"
// *Cause:  The PL/SQL package body has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00834, 0, "Package Body altered with compilation errors"
// *Cause:  The PL/SQL package body has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00835, 0, "View created with compilation errors"
// *Cause:  The PL/SQL view has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00836, 0, "View altered with compilation errors"
// *Cause:  The PL/SQL view has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00837, 0, "Trigger created with compilation errors"
// *Cause:  The PL/SQL trigger has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00838, 0, "Trigger altered with compilation errors"
// *Cause:  The PL/SQL trigger has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00839, 0, "Type created with compilation errors"
// *Cause:  The PL/SQL type has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00840, 0, "Type altered with compilation errors"
// *Cause:  The PL/SQL type has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00841, 0, "Type Body created with compilation errors"
// *Cause:  The PL/SQL type body has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00842, 0, "Type Body altered with compilation errors"
// *Cause:  The PL/SQL type body has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00843, 0, "Library created with compilation errors"
// *Cause:  The PL/SQL library has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00844, 0, "Library altered with compilation errors"
// *Cause:  The PL/SQL library has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00845, 0, "Java created with compilation error"
// *Cause:  The PL/SQL java has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00846, 0, "Java altered with compilation errors"
// *Cause:  The PL/SQL java has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00847, 0, "PL/SQL compilation errors"
// *Cause:  The PL/SQL block has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00848, 0, "Dimension created with compilation errors"
// *Cause:  The PL/SQL dimension has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
00849, 0, "Dimension altered with compilation errors"
// *Cause:  The PL/SQL dimension has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.

//
// Errors in range 850 to 1499 are reserved for iSQL*Plus errors
// SQL*Plus general errors continue from 1500
//

00850,0, "Command \"%s\" is not available in iSQL*Plus\n"
// *Cause:  The command was not recognized by the SQL*Plus engine, or
//          it is disabled in iSQL*Plus. This occurs if it is a command
//          that does not have any meaning in iSQL*Plus (such as a SQL
//          buffer editing command), it is not allowed for security
//          reasons, or it is an obsolete command.
// *Action: Remove the command from your script. If you used a
//          disabled command, check the documentation for a
//          replacement command.
00851,0, "Command beginning \"%s...\" is not available in iSQL*Plus\n"
// *Cause:  The command was not recognized by the SQL*Plus engine, or
//          it is disabled in iSQL*Plus. This occurs if it is a command
//          that does not have any meaning in iSQL*Plus (such as a SQL
//          buffer editing command), it is not allowed for security
//          reasons, or it is an obsolete command.
// *Action: Remove the command from your script. If you used a
//          disabled command, check the documentation for a
//          replacement command.
00852,0, "Option not available in iSQL*Plus\n"
// *Cause:  The command option is not available in iSQL*Plus. This
//          error usually occurs after SP2-158 or SP2-735. Some
//          options are disabled in a web based context because they
//          have no meaning, because they prevent proper operation, or
//          because they pose a security risk.
// *Action: Remove the option from the command.
00853,0, "Empty username field\n"
// *Cause:  The Username field of the iSQL*Plus Login screen was
//          empty.
// *Action: Enter a username before attempting to log in.
00854,0, "Password cannot be entered twice\n"
// *Cause:  An error occurred while parsing the Username and
//          Password fields of the iSQL*Plus Login screen.
// *Action: Check that you haven't specified a password as part of the
//          username (for example "hr/your_password") and simultaneously
//          put the password in the Password field of the Login
//          screen. The password should appear once only. This error
//          occurs when iSQL*Plus can't determine what password you
//          intended to use.
00855,0, "Connect identifier cannot be entered twice\n"
// *Cause:  An error occurred while trying to read the connection
//          identifier in the Connection Identifier field of the
//          iSQL*Plus Login screen.
// *Action: If the full connection syntax is used in the Username
//          field (for example "username/password@connect_identifier")
//          then the Connection Identifier field must be empty.
00856,0, "Usage: CONN[ECT] username/password[@connect_identifier] [AS {SYSOPER|SYSDBA|SYSASM}]\n"
// *Document: NO
// *Cause:  Continuation of 306. iSQL*Plus was unable to connect to an
//          Oracle instance, or the username and password were incorrect.
//          An incomplete or incorrect CONNECT command was specified in
//          an iSQL*Plus script.
// *Action: All authentication information must be included in the
//          CONNECT command in iSQL*Plus.  Make sure that both a
//          username and password are used.
00858,0, "Usage: SET MARKUP HTML [ON] [HEAD text] [BODY text]\n"
// *Document: NO
// *Cause:  An invalid option to SET MARKUP was entered in iSQL*Plus.
// *Action: Remove the invalid option.
00859,0, "            [TABLE text] [ENTMAP {ON|OFF}] [PRE[FORMAT] {ON|OFF}]\n"
// *Document: NO
// *Cause:  This is a continuation of SP2-858
// *Action:
00860,0, "For a list of known commands enter HELP\n"
// *Cause:  An invalid command sequence was entered.
// *Action: Use the HELP command to show the syntax of SQL*Plus
//          commands.
00861,0, "            [TABLE text] [PRE[FORMAT] {ON|OFF}]\n"
// *Document: NO
// *Cause:  This is a continuation of SP2-858
// *Action:
00863,0, "iSQL*Plus processing completed\n"
// *Cause:  All commands in the iSQL*Plus input script have been
//          executed with no explicit output.
// *Action: No action required
00864,0, "Session has expired.  Please log in again"
// *Cause:  The iSQL*Plus session was idle for too long and the
//          context has been removed to free resources for other
//          connections.
// *Action: Reconnect to iSQL*Plus. The system administrator
//          configures the timeout period.
00865,0, "Session is blocked.  Please log in again\n"
// *Cause:  An attempt was made to execute a query from iSQL*Plus while
//          a previous query was still processing. This condition
//          occurs when the browser Back button, or Stop button is
//          pressed during query processing.
// *Action: Reconnect to iSQL*Plus.
00866,0, "Please enter statements in the input area\n"
// *Cause:  The Execute button was clicked when there were no
//          statements in the input area to execute.
// *Action: Enter statements to run in the input area and click
//          Execute again.
00867,0, "No script to be saved\n"
// *Cause:  Save Script was clicked when there were no statements in
//          the input area to save.
// *Action: Enter statements to save in the input area and click
//          "Save Script" again.
00868,0, "No script to execute\n"
// *Cause:  An attempt was made to execute a script and output the
//          results to a file when there were no statements in the
//          script to execute.
// *Action: Make sure the script contains statements to execute and
//          execute the script again.
00869,0, "Invalid file content\n"
// *Cause:  Attempted to load a script into the input area with a
//          format the web server cannot understand.
// *Action: Make sure that the script is in a text file and the
//          MIME type settings needed by your browser to recognize
//          the file are set correctly. Typically if you are
//          loading a file with the extension .SQL then make sure
//          you have a "SQL" MIME type.
00871,0, "No script to load\n"
// *Cause:  Clicked Load Script but either no file name was specified,
//          or the specified file name did not exist, or if it
//          existed, it was empty.
// *Action: Enter the name of an existing file into the field and try
//          again, or if the specified file existed but was empty, no
//          action is required.
00872,0, "SET AUTORECOVERY ON must be used in iSQL*Plus\n"
// *Cause:  Attempted to use the interactive mode of the RECOVER
//          command in iSQL*Plus. Use the autorecovery mode in
//          iSQL*Plus.
// *Action: Switch SET AUTORECOVERY ON and rerun the RECOVER command.
00873,0, "An unexpected quote was found in the URL argument\n"
// *Cause:  A quote was found in the middle of the value portion of
//          a keyword/value pair.
// *Action: Check for and remove the extra quote.
00874,0, "URL argument is missing a keyword\n"
// *Cause:  No keyword was found in a keyword/value pair of a URL
//          argument.
// *Action: Check for a missing keyword or perhaps a missing equals
//          sign.
00875,0, "URL argument contains a keyword but no value\n"
// *Cause:  The value for a keyword was missing in a keyword/value pair
//          of a URL.
// *Action: Check for a missing value or perhaps a missing equals
//          sign.
00876,0, "URL argument is missing an end quote\n"
// *Cause:  Could not find the end quote to match an open quote in a
//          keyword/value pair of a URL.
// *Action: Check for and insert the matching end quote.
00877,0, "Found an unexpected character in a URL argument\n"
// *Cause:  Already have a keyword/value pair where the value is quoted
//          but extra characters were still found in a URL argument.
// *Action: Remove the extra characters.
00878,0, "Duplicate keyword \"%s\" specified\n"
// *Cause:  The keyword was already specified in a previous
//          parameter of a URL argument.
// *Action: Remove one of the keyword occurrences.
00879,0, "Must specify a script for dynamic reports to execute\n"
// *Cause:  The script keyword was not specified in the URL.
// *Action: Add a script keyword/value pair to the URL argument.
00880,0, "Enter connection details to run script \"%s\"\n"
// *Cause:  iSQL*Plus could not log in to the server because there was
//          no URL "userid" argument, or the information supplied was
//          insufficient or incorrect.
// *Action: Log in via the Login screen to execute the Dynamic Report
//          script.
00882,0, "Empty password field\n"
// *Cause:  The password field of the iSQL*Plus Login screen was empty.
// *Action: Enter your password before attempting to log in.
00883,0, "Invalid input area size specified\n"
// *Cause:  The width or height specified for the input area size
//          was either not a numeric value, or was not in the range
//          1 to 999.
// *Action: Re-enter valid numeric values for the input area size.
00884,0, "Connection to database \"%s\" is not allowed\n"
// *Cause:  An attempt was made to connect to a database that
//          SQL*Plus has not been configured to allow connections to.
// *Action: If this occurred with the CONNECT command in iSQL*Plus,
//          the "iSQLPlusConnectIdList" configuration parameter in the
//          isqlplus.conf file does not include the connection
//          identifier used.  For example, when the command
//          "CONNECT username/password@connect_identifier" is entered,
//          the "connect_identifier" must match a connection identifier in
//          the parameter list. The connection identifier is not case
//          sensitive.
00885,0, "Only a valid username or '/' is allowed in the username field\n"
// *Cause:  An attempt was made to enter a value other than a username or
//          '/' in the iSQL*Plus Login screen Username field.
// *Action: Only a username is allowed in the iSQL*Plus Login screen Username
//          field. A username, or "/" is allowed in the iSQL*Plus DBA Login
//          screen.
00886,0, "No scripts in history\n"
// *Cause:  No scripts are available in the history list
//          because no scripts have yet been executed in this
//          session.
// *Action: Scripts are only made available in the history list
//          after they have been executed in the session.
00887,0, "History size specified is non numeric or outside the range [0 - 100]\n"
// *Cause:  The history size specified was either not a numeric
//          value, or was not in the range 0 to 100.
// *Action: Re-enter a numeric value in the range 0 to 100 for
//          the history size.
00889,0, "The value specified for the keyword TYPE must be either URL or TEXT\n"
// *Cause:  The value entered for the specified keyword was invalid.
// *Action: Re-enter the command using a valid value for the specified keyword.
//          Valid values for the keyword "TYPE" are "URL" or "TEXT".
00890,0, "Instance not set, or connect identifier not specified\n"
// *Cause:  No connect identifier or database instance was specified for
//          the connect command or SET INSTANCE command.
// *Action: Re-enter the command and specify a valid connect identifier or
//          database instance.
00892,0, "Error expiring %s\n"
// *Cause:  iSQL*Plus could not close the timed out session identified
//          by the user session Id.
// *Action: No action required. This is a debugging message.
00893,0, "Expired %s\n"
// *Cause:  iSQL*Plus has expired the timed out session identified
//          by the user session Id.
// *Action: No action required. This is a debugging message.
00894,0, "Unsuccessful log in for %s from %s to %s\n"
// *Cause:  iSQL*Plus failed to log in user with the given username,
//          URL and connect identifier.
// *Action: No action required. This is a debugging message.
00896,0, "Failed to log out %s\n"
// *Cause:  iSQL*Plus failed to log out user with given user session Id.
// *Action: No action required. This is a debugging message.
00903,0, "An invalid action was perfomed\n"
// *Cause:  If a user submits a page that is out of sync with the state of the
//          system, eg, Next Page when there are no more results to fetch.
// *Action:
00904,0, "A system error occured\n"
// *Cause:  Used as a general catch-all system error.
// *Action:
00905,0, "The Next Page button was selected, but there are no results to display.\n"
// *Cause:  Used if Next Page was requested, but there are no more
//          results to fetch.  The user may have used browser
//          controls to change state, i.e. the Back button.
// *Action:
00906,0, "No input is required\n"
// *Cause:  Used if Input is given but not requested.
// *Action:
00907,0, "A login error occured\n"
// *Cause:  Used if Login exception thrown. Not necessarily logged
//          into SQL*Plus yet.
// *Action:
00908,0, "iSQL*Plus may have been restarted without being properly shut down\n"
// *Cause:  Used if JNI restarted but not shutdown properly.
// *Action: Contact your iSQL*Plus Administrator.
00909,0, "%s was required, but was not submitted\n"
// *Cause:  This occurs if the number of elements in a Preferences
//          screen differs from the required number of elements.
//          This could occur if a user manually submits a form.
// *Action:
00911,0, "Only a password is allowed in the password field\n"
// *Cause:  An attempt was made to enter a value other than a password in the
//          iSQL*Plus Login screen Password field.
// *Action: Only a valid password is allowed in the Password field.
00912,0, "Only a connect identifier is allowed in the connection identifier field\n"
// *Cause:  An attempt was made to enter a value other than a valid connection
//          identifier in the iSQL*Plus Login screen Connection Identifier
//          field.
// *Action: Only a valid connection identifier or a valid alias is allowed in
//          the Connection Identifier field.
00913,0, "No keywords recognized by iSQL*Plus\n"
// *Cause:  An attempt was made to request a service from iSQL*Plus by
//          manually typing in the URL but no keywords could be recognized.
// *Action: Refer to iSQL*Plus documentation for the syntax, and types
//          of service that can manually entered in a URL.
00914,0, "Value \"%s\" for keyword \"%s\" not recognized by iSQL*Plus\n"
// *Cause:  An attempt was made to request a service from iSQL*Plus by
//          manually typing in the URL, but the value specified for a keyword
//          was not recognized.
// *Action: Refer to iSQL*Plus documentation for the syntax, and types
//          of service that can manually entered in a URL.
00915,0, "Cookies may have been disabled\n"
// *Cause:  After logging in, iSQL*Plus can only process further requests if
//          cookies are enabled on your browser.
// *Action: Enable cookies on your browser and log in again.
00916,0, "Scheme %s not supported\n"
// *Cause:  iSQL*Plus only supports HTTP, HTTPS and FTP.
// *Action: Change the scheme to one that is supported.
00917, 0, "User requested cancel\n"
// *Cause:  The iSQL*Plus script that was running has been cancelled
//          by the user.  It may have been cancelled by clicking the
//          Cancel button, by re-executing the script, or by clicking
//          any other button or link on the Work screen.
// *Action: No action required.
00918, 0, "HTTP error %d on attempt to open URL\n"
// *Cause:  An HTTP error occurred while attempting to fetch
//          the contents of a URL. The URL may have been renamed,
//          removed or be temporarily unavailable.
// *Action: Check that the URL is spelled correctly and that it is available
//          from the requested server.
00920, 0, "HTTP error '%s' on attempt to open URL\n"
// *Cause:  An HTTP error occurred while attempting to fetch
//          the contents of a URL. The URL may have been renamed,
//          removed or be temporarily unavailable.
// *Action: Check that the URL is spelled correctly and that it is available
//          from the requested server.
00921,0, "The value specified for the keyword action must be either EXECUTE or LOAD\n"
// *Cause:  The value entered for the specified keyword was invalid.
// *Action: Re-enter the command using a valid value for the specified keyword.
//          Valid values for the keyword "action" are "EXECUTE" or "LOAD".
00923,0, "AS SYSDBA or AS SYSOPER login not allowed through the iSQL*Plus URL\n"
// *Cause:  An attempt was made to log in through the iSQL*Plus URL with
//          AS SYSDBA or AS SYSOPER privilege.
// *Action: AS SYSDBA or AS SYSOPER privileged login is only permitted
//          through the iSQL*Plus DBA URL. Remove the AS SYSDBA or AS SYSOPER
//          arguments from the login request, or log in through the iSQL*Plus
//          DBA URL.
00924,0, "Supplied connect string has duplicate or incorrect keyword\n"
// *Cause:  The login details supplied in the connect string may contain a
//          duplicate keyword, an incorrect keyword or an out of sequence
//          keyword.
// *Action: Check the syntax of the connect string and fix or remove the
//          incorrect content.
00925,0, "No scripts selected to load or delete\n"
// *Cause:  In the Script History page, no scripts were selected for
//          loading or deleting from the history list.
// *Action: Click the checkbox of each script to be loaded or deleted
//          and then click the Load or Delete button.
00926,0, "iSQL*Plus internal error: state = %u, message = %s\n"
// *Cause:  An internal error has occurred in iSQL*Plus.
// *Action: Make a note of the message, then contact Oracle Support
//          Services.
00927,0, "CONNECT AS SYSDBA or AS SYSOPER not allowed through iSQL*Plus URL\n"
// *Cause:  An attempt was made to CONNECT with AS SYSDBA or AS SYSOPER
//          privileges through the iSQL*Plus URL.
// *Action: CONNECT with AS SYSDBA or AS SYSOPER privileges is only
//          permitted through the iSQL*Plus DBA URL. Remove the AS
//          SYSDBA or AS SYSOPER arguments from the CONNECT request,
//          or CONNECT through the iSQL*Plus DBA URL.
00928,0, "   or: CONN[ECT] /[@connect_identifier] AS {SYSOPER|SYSDBA|SYSASM}\n"
// *Document: NO
// *Cause:  Continuation of 856. iSQL*Plus was unable to connect to an
//          Oracle instance, or the username and password were incorrect.
//          An incomplete or incorrect CONNECT command was specified in
//          an iSQL*Plus script.
// *Action: All authentication information must be included in the
//          CONNECT command in iSQL*Plus.  Make sure that both a
//          username and password are used.
00929,0, "To use ENTMAP reconfigure iSQLPlusAllowUserEntMap in the iSQL*Plus Server\n"
// *Cause:  The iSQL*Plus Server has been configured to prevent the
//          use of SET MARKUP HTML ENTMAP and COLUMN ENTMAP.
// *Action: The System Administrator can change the value of
//          iSQLPlusAllowUserEntMap in the iSQL*Plus Server
//          configuration to allow use of the ENTMAP option.
00930,0, "Enter a URL or a path and file name, not both\n"
// *Cause:  This occurs on the iSQL*Plus Load Script screen. Both the URL
//          and File fields contain the location of a script to load into the
//          Workspace. A script can be loaded from either the local file system,
//          or from a URL, but not from both at the same time.
// *Action: Enter either a URL, or a path and file name.
00931,0, "Connect Identifier contains illegal parameter\n"
// *Cause:  This occurs if the connect identifier contains an illegal parameter.
//          Illegal parameters are:
//          "(PROTOCOL=BEQ)", "(PRO=BEQ)", "(COMMAND=" and "(CMD=".
// *Action: Only a valid connect identifier is allowed in the
//          Connect Identifier field.
00932,0, "Size specified for script width is non numeric or outside the range [1 -500]\n"
// *Cause:  The size specified for the script width was either not a numeric
//          value, or was not in the range 1 to 500.
// *Action: Re-enter a numeric value in the range 1 to 500 for
//          the Input script width.
00933,0, "Size specified for script height is non numeric or outside the range [1 - 300]\n"
// *Cause:  The size specified for the script height was either not a numeric
//          value, or was not in the range 1 to 300.
// *Action: Re-enter a numeric value in the range 1 to 300 for
//          the Input script height.
00934,0, "iSQL*Plus Server currently has insufficient memory to complete this script\n"
// *Cause: The iSQL*Plus Server could not completely execute the
//         script because there was not enough memory available.  Part of the
//         script may have executed.  Some specific causes are:
//           1. The Java VM heap grew too large due to executing scripts with large
//              output or with too many concurrent sessions.
//           2. Insufficient physical memory available for the Java VM.
// *Action: One or more of the following may help:
//           1. Edit queries to reduce the number of rows returned.
//           2. Turn iSQL*Plus multi page output on to reduce the number of rows
//              cached.
//           3. Schedule large scripts sequentially.
//           4. Use Oracle Resource Manager to limit user queries.
//           5. Modify the iSQL*Plus OC4J startup script.  Increase the -Xmx and -Xms
//              values to allocate more memory to iSQL*Plus.
//           6. Review DDL and DCL that may have been executed prior to the memory
//              shortage.  Reexecute the script.
00935,0, "Invalid dynamic report URL\n"
// *Cause:  Either required parameters are missing from
//          the dynamic report URL or there are special
//          characters in the URL that are not HTML encoded.
// *Action: Check that all parameters are correct and
//          that any special characters are HTML encoded
//          before submitting the dynamic report URL again.
00936,0, "URL access is disabled in iSQL*Plus\n"
// *Cause:  @, @@ or START was used with a URL, or a dynamic report
//          referenced a URL.  The iSQL*Plus Administrator has
//          disabled this functionality.
// *Action: Contact your iSQL*Plus Administrator.

//
// Errors in range 850 to 1499 are reserved for iSQL*Plus errors
//

//
// SQL*Plus general errors continue from 1500
//

01500,0, "STARTUP with UPGRADE only valid with Oracle 9.2 or greater\n"
// *Cause:  STARTUP UPGRADE was used to try to startup an Oracle
//          server for a release prior to 9.2.
// *Action: Check the platform specific environment to verify that
//          you are connecting to an Oracle server that is at least
//          release 9.2.
01501,0, "STARTUP with DOWNGRADE only valid with Oracle 9.2 or greater\n"
// *Cause:  STARTUP DOWNGRADE was used to try to startup an Oracle
//          server for a release prior to 9.2.
// *Action: Check the platform specific environment to verify that
//          you are connecting to an Oracle server that is at least
//          release 9.2.
01502,0, "The HTTP proxy server specified by http_proxy is not accessible\n"
// *Cause:  The HTTP proxy server used by SQL*Plus cannot be accessed.
//          SQL*Plus will be unable to run scripts located on a web server.
// *Action: Check that the proxy setting has the correct value, or
//          unset it if no proxy is needed.  SQL*Plus may get the proxy
//          name from the environment variable "http_proxy", or the value
//          may be set in another way on your system.
//          Check that the given proxy server is operational.  Most web
//          browsers can be configured to use a proxy.  Configure a browser to
//          use the desired proxy and verify web pages can still be loaded.
01503,0, "Unable to initialize Oracle call interface\n"
// *Cause:  Indicates a library used by SQL*Plus to communicate with
//          the database failed to initialize correctly.
// *Action: Check that the Oracle environment or registry entries are
//          consistent and correct.  If using the SQL*Plus Instant Client
//          make sure the SQL*Plus and Oracle libraries are from the
//          same release. Make sure you have read access to the libraries.
01504,0, "Cannot print uninitialized LOB variable \"%s\"\n"
// *Cause:  The specified LOB variable should be initialized before printing.
// *Action: Check that the specified variable is initialized and try again.
01505,0, "Invalid COL or TAB position entered\n"
// *Cause:  The BTITLE, TTITLE, REPHEADER or REPFOOTER command you entered
//          attempts to use a COL or TAB value greater than 240,
//          or a COL or TAB value greater than LINESIZE if LINESIZE is
//          greater than 240.
// *Action: Make sure the BTITLE, TTITLE, REPHEADER or REPFOOTER command
//          you enter uses a COL or TAB value of 240 or less,
//          or uses a COL or TAB value of LINESIZE or less if LINESIZE
//          is greater than 240.
01506,0, "START, @ or @@ command has no arguments\n"
// *Cause:  A START, @ or @@ command was entered without arguments.
// *Action: Check the syntax of the command for the
//          correct options.
01507,0, "Errorlogging table, role or privilege is missing or not accessible\n"
// *Cause:  Errorlogging table/role/privilege is missing or not accessible.
// *Action: See elgsetup.txt file in the sqlplus doc directory for 
//          information about how to create a non-default error log table.
//          See the Oracle Database Administrator's Guide for information
//          about how to grant privileges.
01508,0, "Invalid option for SET ERRORLOGGING OFF\n"
// *Cause:  An attempt was made to issue the SET ERRORLOGGING OFF command with
//          additional options. SET ERRORLOGGING OFF accepts no other options.
// *Action: Reenter the SET ERRORLOGGING OFF command without any other options.
01509,0, "Invalid option for SET ERRORLOGGING ON\n"
// *Cause:  An attempt was made to enter an invalid option for
//          SET ERRORLOGGING ON.
// *Action: Reenter the SET ERRORLOGGING ON command with valid options.
//          Valid options are: TABLE, IDENTIFIER, and TRUNCATE.
01510,0, "Invalid option %s for SET ERRORLOGGING ON\n"
// *Cause:  An attempt was made to enter an invalid option for
//          SET ERRORLOGGING ON.
// *Action: Reenter the SET ERRORLOGGING ON command with valid options.
//          Valid options are: TABLE, IDENTIFIER, and TRUNCATE.
01511,0, "Missing table name for SET ERRORLOGGING ON TABLE\n"
// *Cause:  Either no table name was entered, or an invalid table or
//          schema name was entered with the SET ERRORLOGGING ON TABLE 
//          command. The table name is assumed to be in the current schema
//          unless another schema is specified with the syntax schema.table.
// *Action: Reenter the SET ERRORLOGGING ON TABLE command with a valid
//          table name. 
01512,0, "Unable to set %s as table name for SET ERRORLOGGING ON TABLE\n"
// *Cause:  Either no table name was entered, or an invalid table or
//          schema name was entered with the SET ERRORLOGGING ON TABLE 
//          command. The table name is assumed to be in the current schema
//          unless another schema is specified with the syntax schema.table.
// *Action: Reenter the SET ERRORLOGGING ON TABLE command with a valid
//          table name. 
01513,0, "Invalid file name %s for SET ERRORLOGGING ON FILE\n"
// *Cause:  Either no file name was entered, or an invalid file name or path
//          was entered with the SET ERRORLOGGING ON FILE command.
// *Action: Reenter the SET ERRORLOGGING ON FILE command with a valid file name
//          and path.
01514,0, "Invalid identifier %s for SET ERRORLOGGING ON IDENTIFIER\n"
// *Cause:  Either no identifier string was entered, or an invalid identifier
//          string was entered with the SET ERRORLOGGING ON IDENTIFIER command.
//          The identifier string cannot contain special characters.
// *Action: Reenter the SET ERRORLOGGING ON IDENTIFIER command with a valid
//          identifier string.
01515,0, "Invalid identifier %s for SET ERRORLOGGING ON IDENTIFIER\n"
// *Cause:  Either no identifier string was entered, or an invalid identifier
//          string was entered with the SET ERRORLOGGING ON IDENTIFIER command.
//          The identifier string cannot contain special characters.
// *Action: Reenter the SET ERRORLOGGING ON IDENTIFIER command with a valid
//          identifier string.
01516,0, "Unmatched quotes in identifier %s for SET ERRORLOGGING ON IDENTIFIER\n"
// *Cause:  An invalid string was found in the SET ERRORLOGGING ON IDENTIFIER
//          command. The identifier string must be contained in single or
//          double quotes.
// *Action: Check string quotes in the identifier before reentering the
//          SET ERRORLOGGING ON IDENTIFIER command.
01517,0, "Unable to flush the error log table %s.%s\n"
// *Cause:  User may have insufficient privileges to flush the error log table.
// *Action: Check the privileges granted to access the error log table.
//          See the Oracle Database Administrator's Guide for information
//          about how to grant privileges.
01518,0, "Errorlogging table %s does not exist in schema %s\n"
// *Cause:  Attempted to write to a non-existent error log table.
// *Action: See elgsetup.txt file in the sqlplus doc directory for 
//          information about how to create a non-default error log table.
01519,0, "Unable to write to the error log table %s.%s\n"
// *Cause:  User may have insufficient privileges to write to the error log
//          table.
// *Action: Check the privileges granted to access the error log table.
//          See the Oracle Database Administrator's Guide for information
//          about how to grant privileges.
01530,0, "Command did not succeed\n"
// *Cause:  The system lacked the necessary resources to create another
//          process or the system-imposed limit on the total number of
//          processes.
// *Action: Check OS error code and consult Windows NT documentation.
01531,0, "No command interpreter\n"
// *Cause:  Unable to find command.com file.
// *Action: Check command.com file exists or not.
01532,0, "Invalid option for SET SECUREDCOL OFF\n"
// *Cause:  An attempt was made to issue the SET SECUREDCOL OFF command with
//          additional options. SET SECUREDCOL OFF accepts no other options.
// *Action: Reenter the SET SECUREDCOL OFF command without any other options.
01533,0, "Invalid option for SET SECUREDCOL ON\n"
// *Cause:  An attempt was made to enter an invalid option for
//          SET SECUREDCOL ON.
// *Action: Reenter the SET SECUREDCOL ON command with valid options.
//          Valid options are: UNAUTH[ORIZED] text and UNK[NOWN] text.
01534,0, "Invalid option %s for SET SECUREDCOL ON\n"
// *Cause:  An attempt was made to enter an invalid option for
//          SET SECUREDCOL ON.
// *Action: Reenter the SET SECUREDCOL ON command with valid options.
//          Valid options are: UNAUTH[ORIZED] text and UNK[NOWN] text.
01535,0, "Unmatched quotes in string %s for SET SECUREDCOL ON\n"
// *Cause:  An invalid string was found in the
//          SET SECUREDCOL ON UNAUTHORIZED text UNKNOWN text command.
//          The identifier string must contain matched single or double quotes.
// *Action: Check that quotes in the string match before reentering the
//          SET SECUREDCOL ON UNAUTHORIZED text UNKNOWN text command.
//
// Errors 1536 & 1537 are Windows specific message. These messages were moved
// from spwus.msg. For unknown historical reason, spwus message were referenced
// in sqlplus command line. So purpose of these messages are for backward 
// compatibilities and remove the dependency of spwus.msg.
// backward compatibility
01536,0, "You cannot run this file in SQL*Plus because its filename is a device on a PC.\n"
// *Cause:  Filename is a device on a PC
// *Action: Rename the filename to something other than COM1, COM2, CON
//          or PRN.
01537,0, "Running this file in SQL*Plus may hang the PC.\n"
// *Cause: This is a continuation from SP2-01536 
// *Action: 
01538,0, "Edition only valid when connected to Oracle Database.\n"
// *Cause: Attempted to connect to an Edition session when Oracle Database not available.
// *Action: Ensure Database is up before attempting to connect to an Edition session.
01539,0, "Edition requires Oracle Database 11g or later.\n"
// *Cause: Attempted to connect to an Edition session on Oracle Database earlier than 11g.
// *Action: Edition feature is only available with Oracle Database 11g or later.
01540,0, "Oracle Database cannot startup in an Edition session.\n"
// *Cause: Attempted to startup Oracle Database when system variable ORA_EDITION is set or connected with Edition option.
// *Action: Undefine system variable ORA_EDITION or connect as SYSDBA without Edition option.
01541,0, "Assembly created with compilation errors"
// *Cause:  The PL/SQL assembly has been created, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.
01542,0, "Assembly altered with compilation errors"
// *Cause:  The PL/SQL assembly has been altered, but has one or more
//          error messages.
// *Action: Use the SQL*Plus SHOW ERR[ORS] command to display
//          the warnings and messages.

// End of SQL*Plus Errors (continued).
//

//
// Errors in range 5000 to 5999 are SQL*Plus interface text (continued)
//

05000,0, "%s ON SIZE %s FORMAT %s\n"
// *Document: NO
// *Cause:  SHOW SERVEROUTPUT.
// *Action:
05001,0, "%s item(s) selected."
// *Document: NO
// *Cause:
// *Action:
05002,0, "No items selected.\n\n"
// *Document: NO
// *Cause:
// *Action:
05003,0, "Usage: SET XQUERY {BASEURI text | CONTEXT text |\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
05004,0, " NODE {BYVALUE | BYREFERENCE | DEFAULT} |\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
05005,0, " ORDERING {UNORDERED | ORDERED | DEFAULT}}\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
05006,0, "Usage: SET ESCCHAR [OFF|@|?|%c] \n"
// *Document: NO
// *Cause:  Usage message.
// *Action:

//
// End of SQL*Plus interface text.
//


//
// Errors in range 6000 to 6266 are SQL*Plus command-line usage messages
// They are displayed in consecutive sequence.
//

06001,0, "Use SQL*Plus to execute SQL, PL/SQL and SQL*Plus statements.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06002,0, "Usage 1: sqlplus -H | -V\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06003,0, "\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06004,0, "    -H             Displays the SQL*Plus version and the\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06005,0, "                   usage help.\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06006,0, "    -V             Displays the SQL*Plus version.\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06007,0, "\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06008,0, "Usage 2: sqlplus [ [<option>] [{logon | /nolog}] [<start>] ]\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06009,0, "\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06010,0, "  <option> is: [-C <version>] [-L] [-M \"<options>\"] [-R <level>] [-S]\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06011,0, "\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06012,0, "    -C <version>   Sets the compatibility of affected commands to the\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06013,0, "                   version specified by <version>.  The version has\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06014,0, "                   the form \"x.y[.z]\".  For example, -C 10.2.0\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06015,0, ""
// *Document: NO
// *Cause:  Usage message.
// *Action:
// *Comment: This message was for -F (Failover) and it is no longer needed
06016,0, "    -L             Attempts to log on just once, instead of\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06017,0, "                   reprompting on error.\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06018,0, "    -M \"<options>\" Sets automatic HTML markup of output.  The options\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06019,0, "                   have the form:\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06020,0, "                   HTML [ON|OFF] [HEAD text] [BODY text] [TABLE text]\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06021,0, "                   [ENTMAP {ON|OFF}] [SPOOL {ON|OFF}] [PRE[FORMAT] {ON|OFF}]\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06022,0, "    -R <level>     Sets restricted mode to disable SQL*Plus commands\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06023,0, "                   that interact with the file system.  The level can\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06024,0, "                   be 1, 2 or 3.  The most restrictive is -R 3 which \n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06025,0, "                   disables all user commands interacting with the\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06026,0, "                   file system.\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06027,0, "    -S             Sets silent mode which suppresses the display of\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06028,0, "                   the SQL*Plus banner, prompts, and echoing of\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06029,0, "                   commands.\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06030,0, "\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06031,0, "  <logon> is: {<username>[/<password>][@<connect_identifier>] | / }\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06032,0, "              [AS {SYSDBA | SYSOPER | SYSASM}] [EDITION=value]\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06033,0, "\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06034,0, "    Specifies the database account username, password and connect\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06035,0, "    identifier for the database connection.  Without a connect\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06036,0, "    identifier, SQL*Plus connects to the default database.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06037,0, "    The AS SYSDBA, AS SYSOPER and AS SYSASM  options are database\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06038,0, "    administration privileges.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06039,0, "    <connect_identifier> can be in the form of Net Service Name\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06040,0, "    or Easy Connect.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06041,0, "      @[<net_service_name> | [//]Host[:Port]/<service_name>]\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06042,0, "        <net_service_name> is a simple name for a service that resolves\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06043,0, "        to a connect descriptor.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06044,0, "        Example: Connect to database using Net Service Name and the\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06045,0, "                 database net service name is ORCL.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06046,0, "           sqlplus myusername/mypassword@ORCL\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06047,0, "        Host specifies the host name or IP address of the database\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06048,0, "        server computer.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06049,0, "        Port specifies the listening port on the database server.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06050,0, "        <service_name> specifies the service name of the database you\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06051,0, "        want to access.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06052,0, "        Example: Connect to database using Easy Connect and the\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06053,0, "                 Service name is ORCL.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06054,0, "           sqlplus myusername/mypassword@Host/ORCL\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06055,0, "    The /NOLOG option starts SQL*Plus without connecting to a\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06056,0, "    database.\n\n    The EDITION specifies the value for Session Edition.\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06057,0, "    \n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06058,0, "  <start> is: @<URL>|<filename>[.<ext>] [<parameter> ...]\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06059,0, "    Runs the specified SQL*Plus script from a web server (URL) or the\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06060,0, "    local file system (filename.ext) with specified parameters that\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06061,0, "    will be assigned to substitution variables in the script.\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06062,0, "\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06063,0, "When SQL*Plus starts, and after CONNECT commands, the site profile\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06064,0, "(e.g. $ORACLE_HOME/sqlplus/admin/glogin.sql) and the user profile\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06065,0, "(e.g. login.sql in the working directory) are run.  The files may\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06066,0, "contain SQL*Plus commands.\n\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:
06067,0, "Refer to the SQL*Plus User's Guide and Reference for more information.\n"
// *Document: NO
// *Cause:  Usage message.
// *Action:

//
// End of SQL*Plus command-line usage messages
//

