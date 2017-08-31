/
/ Copyright (c) Oracle Corporation 1989, 2002. All Rights Reserved.
/
/ CONTENTS:
/   Generic error messages for SQL*Plus CPY errors
/
/ NOTES:
/   The first column is the error number.
/   The second column is reserved and must (for now) be 0
/   The remainder of the line is the error text
/
00000,0, " "
// *Cause:
// *Action:
00002,0, "Illegal or missing APPEND, CREATE, INSERT or REPLACE option\n"
// *Cause: An internal COPY function has invoked COPY with a
//           create option (flag) value that is out of range.
// *Action: Please contact Oracle Worldwide Customer Support
//   Services.
00003,0, "Internal error: logical host number out of range\n"
// *Cause: An internal COPY function has been invoked with a
//          logical host number value that is out of range.
// *Action: Please contact Oracle Worldwide Customer Support
//   Services.
00004,0, "Source and destination table column names don't match\n"
// *Cause: On an APPEND operation or an INSERT (when the table
//          exists), at least one column name in the
//          destination table does not match the corresponding
//          column name in the optional column name list or in
//          the SELECT command.
// *Action: Re-specify the COPY command, making sure that the
//          column names and their respective order in the
//          destination table match the column names and column
//          order in the optional column list or in the SELECT
//          command
00005,0, "Source and destination column attributes don't match\n"
// *Cause: On an APPEND operation or an INSERT (when the table
//          exists), at least one column in the destination
//          table does not have the same datatype as the
//          corresponding column in the SELECT command.
// *Action: Re-specify the COPY command, making sure that the
//          data types for items being selected agree with the
//          destination. Use TO_DATE, TO_CHAR, and TO_NUMBER to
//          make conversions.
00006,0, "Select list has more columns than destination table\n"
// *Cause: On an APPEND operation or an INSERT (when the table
//          exists), the number of columns in the SELECT
//          command is greater than the number of columns in
//          the destination table.
// *Action: Re-specify the COPY command, making sure that the
//          number of columns being selected agrees with the
//          number in the destination table.
00007,0, "Select list has fewer columns than destination table\n"
// *Cause: On an APPEND operation or INSERT (when the table
//          exists), the number of columns in the SELECT
//          command is less than the number of columns in the
//          destination table.
// *Action: Re-specify the COPY command, making sure that the
//          number of columns being selected agrees with the
//          number in the destination table.
00008,0, "More column list names than columns in destination table\n"
// *Cause: On an APPEND operation or an INSERT (when the table
//          exists), the number of columns in the column name
//          list is greater than the number of columns in the
//          destination table.
// *Action: Re-specify the COPY command, making sure that the
//          number of columns in the column list agrees with
//          the number in the destination table.
00009,0, "Fewer column list names than columns in destination table\n"
// *Cause: On an APPEND operation or an INSERT (when the table
//          exists), the number of columns in the column name
//          list is less than the number of columns in the
//          destination table.
// *Action: Re-specify the COPY command, making sure that the
//          number of columns in the column list agrees with
//          the number in the destination table.
00010,0, "\tFETCHED (%d)\tINSERTED (%d)\tCOMMITTED (%d)\n"
// *Document: Feedback message
// *Cause:
// *Action:
00012,0, "Datatype cannot be copied\n"
// *Cause: An attempt was made to copy a datatype that is not
//          supported in the COPY command. Datatypes supported
//          by the COPY command are CHAR, DATE, LONG, NUMBER
//          and VARCHAR2.
// *Action: Re-specify the COPY command, making sure that the
//          unsupported datatype column is removed. For more
//          information, see Appendix B, "SQL*Plus COPY
//          Command".
