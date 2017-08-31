/ $Header: expus.msg 23-jan-2007.01:36:41 kamble Exp $ exumtb.msg 
/ Copyright (c) 1988, 2001 by the Oracle Corporation.  All rights reserved.
/
/ File: v6$knl:[impexp]exumtb.msg
/ Created: 07/12/88
/
/ OWNER
/    Raghu Viswanathan (vraghuna) - 1993
/ MODIFIED:
/    kamble     08/10/06 -  add msg 110/111 for encrypted tablespace
/    jgalanes   08/30/04 -  add msg 107 for encrypted columns
/    bmccarth   05/20/03 -  update for automatic scripts pulling messages out
/    bmccarth   11/06/01 -  Fix typo, and new object consistent args.
/    jgalanes   10/24/01 -  add msgs 222 and 277 for TYPE SYNONYMs
/    jgalanes   07/20/01 -  add MSGINC - INCTYPE is obsolete #41
/    htseng     03/19/01 -  update resumable, add resumable_name,
/                           remove consistent_at
/    bmccarth   03/08/01 -  warning message for v1 domain index in tts mode
/    dgagne     03/01/01 -  Move msg67 from error area to informational area
/    dgagne     03/09/01 -  add tts_full_check to help=y
/    bmccarth   01/08/01 -  Type evolution messages
/    dgagne     01/08/01 -  add message for FLASHBACK_SCN and FLASHBACK_TIME
/    jingliu    12/10/00 -  add help and error message for iAS
/    nireland   06/26/00 -  add message for NLS_NUMERIC_CHARACTERS
/    htseng     03/20/00 -  add resumable support
/    htseng     02/25/00 -  add consistent_at 
/    dgagne     02/16/00 -  add MSGQSE -- questionable statistics exported
/    wfisher    10/05/99 -  add MSGCPT -- cannot pin type
/    wfisher    04/05/99 -  update MSGAPR
/    nireland   03/12/99 -  add message for truncated RECORDLENGTH
/    wfisher    01/06/99 -  bug 745740: give warning on truncated view
/    wfisher    12/15/98 -  removing errno and friends
/    tlee       10/29/98 -  update 44,45,48,49 for transportable tablespaces 
/    tlee       10/26/98 -  message 17 change option to feature 
/    lbarton    09/16/98 -  add FILE_FORMAT message
/    tlee       08/24/98 -  Add HELP msg for transportable tablespaces
/    wfisher    06/24/98 -  Add MSGHSH
/    nvishnub   05/18/98 -  Add set of HELP messages.
/    gclaborn   05/27/98 -  Add procedural object messages
/    wfisher    05/06/98 -  Add messages 263-269
/    lbarton    05/07/98 -  add Java messages
/    tlee       04/17/98 -  new partitioning support
/    gclaborn	04/07/98 -  Add 78, MSGIXM: Problem with dom. index metadata
/    lbarton    02/03/98 -  annotate messages for translation group
/    wfisher	12/10/97 -  Redo MSGDPO message
/    jpearson   11/21/97 -  bug 557731 - obsolete message 68
/    jstenois	09/18/97 -  add messages related to QUERY qualifier
/    jstenois	10/24/97 -  add messages for multi-file export support
/    wfisher    08/27/97 -  add message for missing database options
/    jstenois   08/20/97 -  remove references to unused messages
/    jpearson   05/21/97 -  add feedback to help
/    jpearson   02/26/97 -  more corrections
/    jpearson   02/14/97 -  corrections, comments
/    wfisher    10/28/96 -  add messages for objects in user rows
/    jpearson   11/05/96 -  update object terminology
/    syeung     09/25/96 -  add sub-messages for NCHAR character set
/    syeung     09/11/96 -  add messages for password management project
/    ixhu       09/09/96 -  add message for point-in-time recovery
/    ysang      08/08/96 -  add lrm initialization failure message
/    ixhu       04/15/96 -  add MSGNXP message for Advanced Queue support
/    ccchang    03/15/96 -  support for pti                                    
/    ixhu       02/18/96 -  tablespace point-in-time recovery
/    ixhu       07/20/95 -  report export charset
/    ixhu       07/09/95 -  change MSGICS warning to error
/    lcprice    05/08/95 -  merge changes from branch 1.34.720.1
/    ixhu       03/31/95 -  retain compress interface 
/    ixhu       03/09/95 -  direct path messages
/    ixhu       02/20/95 -  change compress to compact
/    vraghuna   09/12/94 -  bug 235724 - add message 40 for identical files
/    lcprice    04/19/95 -  Bug #267737 - default role processing
/    vraghuna   08/15/94 -  bug 227714 - add check for procedural option
/    vraghuna   08/02/94 -  add loadable NLS changes
/    vraghuna   06/20/94 -  add bad hash cluster message
/    vraghuna   06/16/94 -  add feedback feature
/    vraghuna   02/08/94 -  bug 190437 - merge in unix volsize changes
/    vraghuna   02/04/94 -  add a version message 37
/    vraghuna   02/01/94 -  bug 195920 - change msg 31 from %d to %u
/    vraghuna   01/14/94 -  bug 191751 - add support for deferred RPC & RepCat
/    vraghuna   01/12/94 -  bug 191750 - add support for refresh groups - 239
/    vraghuna   01/11/94 -  bug 191749 - add support for job queues - add 238
/    vraghuna   12/29/93 -  bug 191685 - add %lu to 222
/    vraghuna   12/03/93 -  bug 187466 - add EXP-36
/    vraghuna   06/17/93 -  bug 166480 - add message 237 for exuerc
/    vraghuna   05/13/93 -  bug 164729 - change analyze to statistics in help 
/    vraghuna   04/14/93 -  bug 160006 - change Note messages 
/    jcleland   11/04/92 -  change MLS message for RHILTNER 
/    vraghuna   07/13/92 -  bug 115048 - add message for analyze statement 
/    vraghuna   06/30/92 -  bug 115524 - change warnings to note 
/    cheigham   05/14/92 -  bug 104871: add msg for rows=n,compress=y
/    cheigham   04/30/92 -  fix 'terminated with warnings' msg. to match import
/    cheigham   04/29/92 -  fix spelling in error 29 
/    Dana       09-03-84 -  Add error 43, 44, 45 and modify 2 and 128
/    Dana       05-15-85 -  Add Miners error messages 140-150 from exumtb.h
/    Dana       05-15-85 -  Add #46, modify 15,31,32,38,39,100,101,104,113
/    Miner      05-24-85 -  various export messages
/    Dana       06-26-85 -  change banners, add progress reports
/    Bradbury   08/26/85 -  make "exumtb.msg" contain only export msgs
/    Aoki       05/02/86 -  31: change "Export" to "Export - Production"
/    Hong       02/11/87 -  add messages 60,61,62 
/    Hong       03/16/87 -  modify msg 52
/    Hong       06/16/87 -  modify msg 63, 64, 65, 66
/    Hong       09/19/87 -  add msg 67, 69, 70
/    Kornet     03/20/88 -  reformat for use by LMS
/    Hong       07/12/88 -  major revision/reordering of messages
/    Hong       09/12/88 -  revise for user guide
/    Hong       05/28/89 -  Fix misspelling in message 25.
/    Dana       09-03-84 -  Add error 43, 44, 45 and modify 2 and 128
/
/ This file is converted to header/message files using lmsgen.c
/
/ The first column is the Export error number.
/ The second column is reserved and must be (for now) 00000
/ The remainder of the line is the error text
/
/ Adding an error for Export:
/    Check out this file, add the error, and check it back in. Error numbers
/    should always be ordered.  The second column should always be 00000.
/
/
/ Range 000 - 199: actual Export errors
/ Range 200 - 299: informative messages
/ Range 300 - 399: prompt messages
/ Range 400 - 499: help messages
/
00000, 00000, "Export terminated unsuccessfully\n"
// *Cause:  Export encountered an Oracle error. 
// *Action: Look up the accompanying Oracle message in the ORA message 
//          chapters of this manual, and take appropriate action.
00001, 00000, "data field truncation - column length=%lu, buffer size=%lu actual size=%lu"
// *Cause:  Export could not fit a column in the data buffer. 
// *Action: Record the given size parameters and the accompanying messages and 
//          report this as an Export internal error to customer support. (Part 
//          of the table has been exported. Export will continue with the next 
//          table.) 
00002, 00000, "error in writing to export file"
// *Cause:  Export could not write to the export file, probably because of a 
//          device error. This message is usually followed by a device message 
//          from the operating system. 
// *Action: Take appropriate action to restore the device. 
00003, 00000, "no storage definition found for segment(%lu, %lu)"
// *Cause:  Export could not find the storage definitions for a cluster, 
//          index, or table. 
// *Action: Record the accompanying messages and report this as an Export 
//          internal error to customer support. 
00004, 00000, "invalid username or password"
// *Cause:  An invalid username or password was specified. 
// *Action: Retry with a valid username and password. 
00005, 00000, "all allowable logon attempts failed"
// *Cause:  Attempts were repeatedly made to log on with an invalid username 
//          or password. 
// *Action: Shut down the utility, then restart and retry with a valid 
//          username and password. 
00006, 00000, "internal inconsistency error"
// *Cause:  Export's data structure was corrupted. 
// *Action: Record the accompanying messages and report this as an Export 
//          internal error to customer support. 
00007, 00000, "dictionary shows no columns for %s.%s"
// *Cause:  Export failed to gather column information from the data 
//          dictionary. The table may have been dropped. 
// *Action: Retry the export and, if this error recurs, report it as an Export 
//          internal error to customer support.
00008, 00000, "ORACLE error %lu encountered"
// *Cause:  Export encountered the referenced Oracle error. 
// *Action: Look up the Oracle message in the ORA message chapters of this 
//          manual and take appropriate action. 
00009, 00000, "no privilege to export %s's table %s"
// *Cause:  An attempt was made to export another user's table. Only a 
//          database administrator can export another user's tables. 
// *Action: Ask your database administrator to do the export. 
00010, 00000, "%s is not a valid username"
// *Cause:  An invalid username was specified. 
// *Action: Shut down the utility, then restart and retry with a valid 
//          username.
00011, 00000, "%s.%s does not exist"
// *Cause:  Export could not find the specified table. 
// *Action: Retry with the correct table name. 
00012, 00000, "%s is not a valid export mode"
// *Cause:  An invalid export mode was specified. 
// *Action: Retry with a valid export mode. 
00013, 00000, "respond with either 'Y', 'N', RETURN or '.' to quit"
// *Cause:  An invalid response was entered. 
// *Action: Enter any of the responses shown in the message. 
00014, 00000, "error on row %lu of table %s\n"
// *Cause:  Export encountered an Oracle error while fetching rows. 
// *Action: Look up the accompanying Oracle message in the ORA message 
//          chapters of this manual and take appropriate action. 
00015, 00000, "error on row %lu of table %s, column %s, datatype %lu"
// *Cause:  Export encountered an error while fetching or writing the 
//          column. An accompanying message gives more information. 
// *Action: Correct the error and try again.
00016, 00000, "ORACLE error encountered while reading default auditing options"
// *Cause:  Export encountered an Oracle error while reading the default 
//          auditing options (those for updates, deletes, and so on). 
// *Action: Look up the accompanying Oracle message in the ORA message 
//          chapters of this manual and take appropriate action.
00017, 00000, "feature \"%s\" is needed, but not present in database"
// *Cause:  The command entered requires the specified feature.  Either that 
//	    feature is not installed, or the row describing the feature is
//	    missing from table V$OPTION
// *Action: Reinstall Oracle with the feature specified in the message.
00018, 00000, "datatype (%lu) for column %s, table %s.%s is not supported"
// *Cause:  Export does not support the referenced datatype. 
// *Action: Retry with an acceptable datatype (CHAR, NUMBER, DATE, 
//          LONG, or RAW). 
00019, 00000, "failed to process parameters, type 'EXP HELP=Y' for help"
// *Cause:  Invalid command-line parameters were specified. 
// *Action: Check the online help screen for the set of valid parameters, then 
//          retry. 
00020, 00000, "failed to allocate memory of size %lu"
// *Cause:  Export failed to allocate the necessary memory. 
// *Action: Decrease the export buffer size so that less memory is required, 
//          or increase the runtime memory size for Export. 
00021, 00000, "can only perform incremental export in Full Database mode"
// *Cause:  USER or TABLE mode was specified when doing an incremental export. 
// *Action: Specify FULL database mode (FULL=Y) and retry.
00022, 00000, "must be SYS or SYSTEM to do incremental export"
// *Cause:  The privileges needed to do an incremental export do not exist. 
//          Only a data base administrator can do incremental exports. 
// *Action: Ask the database administrator to do the incremental export. 
00023, 00000, "must be a DBA to do Full Database or Tablespace export"
// *Cause:  The privileges needed to do a FULL database export do not exist. 
//          Only a database administrator can do a FULL database export. 
// *Action: Ask the database administrator to do the FULL database export. 
00024, 00000, "Export views not installed, please notify your DBA"
// *Cause:  The necessary Export views were not installed. 
// *Action: Ask the database administrator to install the required Export 
//          views. 
00025, 00000, "dictionary shows no column for constraint %s.%lu"
// *Cause:  Export failed to gather column information about the referenced 
//          constraint from the data dictionary. The constraint may have 
//          been altered. 
// *Action: Retry the export and, if this error recurs, report it as an Export 
//          internal error to customer support. 
00026, 00000, "conflicting modes specified"
// *Cause:  Conflicting export modes were specified. 
// *Action: Specify only one parameter and retry. 
00027, 00000, "failed to calculate ORACLE block size"
// *Cause:  Export failed to calculate the Oracle block size. 
// *Action: Report this as an Export internal error to customer support. 
00028, 00000, "failed to open %s for write"
// *Cause:  Export failed to open the export file for writing. This message is 
//          usually followed by device messages from the operating system. 
// *Action: Take appropriate action to restore the device. 
00029, 00000, "Incremental export mode and consistent mode are not compatible"
// *Cause:  Both consistent and incremental exports were specified.
// *Action: None. Consistent mode is turned off.
00030, 00000, "Unexpected End-Of-File encountered while reading input"
// *Cause:  Encountered an End-Of-File while reading the user input.
// *Action: If input to export is being redirected, check the file for errors.
00031, 00000, "Arraysize not in valid range. Using arraysize=%u"
// *Cause:  The arraysize value specified is not in the valid range.
// *Action: None
00032, 00000, "Non-DBAs may not export other users"
// *Cause:  Only database administrators can export to other users. A non-
//          database administrator attempted to specify owner=user where 
//          exporter is not the user.
// *Action: Request that this operation be performed by the database 
//          administrator.
00033, 00000, "Could not find environment character set"
// *Cause:  The environment character set is missing or incorrectly specified.
// *Action: Ensure that the environment character set is correctly specified 
//          and is present.
00034, 00000, "error on rowid: file# %lu block# %lu slot# %lu"
// *Cause:  Identifies the rowid on which an error occurred.
// *Action: This is an information message. No action is required.
00035, 00000, "QUERY parameter valid only for table mode exports"  
// *Cause:  You specified the QUERY parameter in an export command, but you  
//	    are not performing a table mode export.  The QUERY parameter cannot
//	    be used for a user mode export, a full export, nor  
//	    a point in time recovery export.  
// *Action: If you want to select a subset of rows for a table, you must export
//	    the table independently with a table mode export.  Issue a table  
//	    mode export command that specifies the table name and the query you
//	    want to execute during export. 
00036, 00000, "Object %lu non-existent in dictionary"
// *Cause:  The specified object could not be found in the dictionary. 
//          The object might have been dropped during the export 
// *Action: The object no longer exists; no action is needed.
00037, 00000, "Export views not compatible with database version"
// *Cause:  The Export utility is at a higher version than the database 
//          version and is thereby incompatible.
// *Action: Use the same version of Export utility as the database.
00038, 00000, "Bad Hash cluster id in clu$"
// *Cause:  The function id in clu$ is not a legal number. Clu$ has become
//          corrupted.
// *Action: Contact Worldwide Support
00039, 00000, "export file %s must be on a disk"
// *Cause:  On some platforms, export can read files from tape.  This message
//	    is displayed if the first file in an export file set was on disk
//	    and you specified a tape device for a second or subsequent file.
// *Action: Verify that you have specified the correct file name for the export
//	    file.  Remember that all export files can be either on disk or all
//	    files can be on tape, but not mixed both tape and disk.
00040, 00000, "Dump file and log file must be different"
// *Cause:  The dump file and log file cannot be the same file.
// *Action: Specify different file names for the dump file and the log file, 
//          then retry the operation.
00041, 00000, "INCTYPE parameter is obsolete"
// *Cause:  Export encountered the INCTYPE parameter when parsing Export
//          options.  Incremental Exports are no longer supported. 
// *Action: Consult the Oracle Backup and Recovery guide.  
//          Export will attempt to continue.
00042, 00000, "Missing NLS_CHARACTERSET/NLS_NCHAR_CHARACTERSET in props$"
// *Cause:  A value for NLS_CHARACTERSET/NLS_NCHAR_CHARACTERSET was not 
//          entered in the props$ table"
// *Action: internal error.
00043, 00000, "Invalid data dictionary information in the row where column \"%s\" is \"%s\" in table %s"
// *Cause:  The export utility retrieved invalid data from the data 
//	    dictionary.
// *Action: Contact Oracle Worldwide Suport.
00044, 00000, "must be connected 'AS SYSDBA' to do Point-in-time Recovery or Transportable Tablespace import"
// *Cause:  The user must log in 'as SYSDBA' to perform transportable
//          tablespace imports or Point-In-Time Recovery imports.
// *Action: Ask your database adminstrator to perform the Transportable 
//          Tablespace import or the Tablespace Point-in-time Recovery import.
00045, 00000, "Cannot export SYSTEM Tablespace for Point-in-time Recovery or Transportable Tablespace"
// *Cause:  SYSTEM tablespace cannot be part of recovery set or transportable tablespace set.
// *Action: Contact Oracle Wordwide Support.
00046, 00000, "Tablespace named %s does not exist"
// *Cause:  The specified tablespace does not exist in dictionary.
// *Action: Contact Oracle Wordwide Support.
00047, 00000, "Missing tablespace name(s)"
// *Cause:  Tablespace name(s) were not supplied
// *Action: Provide tablespace name(s)
00048, 00000, "Cannot export SYSAUX Tablespace for Point-in-time Recovery or Transportable Tablespace"
// *Cause:  SYSAUX tablespace cannot be part of recovery set or transportable tablespace set.
// *Action: Contact Oracle Wordwide Support.
00049, 00000, "%s option is not compatible with Point-in-time Recovery or Transportable Tablespace Export"
// *Cause:  An option was specified incompatible with Point-in-time 
//          Recovery or Transportable Tablespace Export.
// *Action: Retry the Export without the displayed option. 
00050, 00000, "Cannot perform Partition Export \"%s\" on non-partitioned table \"%s\""
// *Cause:  The table specified in this Partition Export is not a
//          partitioned table.
// *Action: Use Table mode, or specify a non-partitioned table.
00051, 00000, "\"%s\" - given partition or subpartition name is not part of \"%s\" table" 
// *Cause:  The specified partition or subpartition name is not in the specified table.
// *Action: Check if the correct table, partition or subpartition name was specified.
00052, 00000, "error on row %lu of partition %s\n"
// *Cause:  Export encountered the referenced Oracle error while fetching 
//          rows.
// *Action: Look up the Oracle message in the ORA message chapters of this 
//          manual and take appropriate action. 
00053, 00000, "unable to execute QUERY on table %s because the table has inner nested tables"  
// *Cause:  You specified the QUERY parameter on a table that has one or more 
//	    inner nested tables.  The QUERY parameter cannot be specified on   
//	    tables that have inner nested tables.  
// *Action: Export the entire table by omitting the QUERY parameter. 
00054, 00000, "error on row %lu of subpartition %s\n"
// *Cause:  Export encountered the referenced Oracle error while fetching rows.
// *Action: Look up the Oracle message in the ORA message chapters of this
//          manual and take appropriate action.  
00055, 00000, "%s.%s is marked not exportable"
// *Cause:  An object was marked as non-exportable in the NOEXP$ table.
// *Action: Consult your database administrator.
/ do NOT translate or document message 56 - it is never displayed
// NLS_DO_NOT_TRANSLATE [56,56]
00056, 00000, "placeholder for OCI error "
// *Document: NO
// *Cause:  filler
// *Action: filler
00057, 00000, "Failure to initialize parameter manager"
// *Cause:  The parameter manager failed in intialization.
// *Action: Record the messages that follow and report this to Oracle Wordwide 
//          Support as an Export internal bug.
00058, 00000, "Password Verify Function for %s profile does not exist"
// *Cause:  Cannot find the function for the profile. 
// *Action: Check if the profile was created properly.
00059, 00000, "error converting an object type's identifier to characters"
// *Cause:  An invalid length of an object type identifier prevented
//          its conversion. 
// *Action: Contact Oracle Worldwide Support
00060, 00000, "an object type had multiple TYPE BODYs"
// *Cause:  More than one TYPE BODY was found for an object type.
// *Action: Try dropping the TYPE BODY, if that is not successful, contact  
//          Oracle Worldwide Support
00061, 00000, "unable to find the outer table name of a nested table "
// *Cause:  While exporting a bitmap index or posttable action
//          on an inner nested table, the name of the outer
//          table could not be located, using the NTAB$ table.
// *Action: Verify the table is properly defined.
00062, 00000, "invalid source statements for an object type"
// *Cause:  TYPE was not found in the statements in SOURCE$ for an
//          Object Type
// *Action: Contact Oracle Worldwide Support.
00063, 00000, "error in changing language handle"
// *Cause:  Unable to change language handle.
// *Action: Contact Oracle Worldwide Support.
00064, 00000, "%s is an inner nested table and cannot be exported."
// *Cause:  An attempt was made to export an inner nested table without its 
//          parent table.
// *Action: Export the parent of the inner nested table.
00065, 00000, "Error writing lob to the dump file."
// *Cause:  The current LOB could not be written to the dump file.
// *Action: Identify the cause of the write failure and fix it.
00066, 00000, "Object table %s is missing its object identifier index"
// *Cause:  All object tables must have an object identifier index, but
//          the specified table was missing an index on its object
//	    identifier column.
// *Action: Recreate the type table and retry the operation.
00068, 00000, "tablespace %s is offline"
// *Cause:  Export failed to export tablespace (tablespace being offline).
// *Action: Make tablespace online and re export.
/ do NOT translate or document message 69 - it is never displayed
// NLS_DO_NOT_TRANSLATE [69,69]
00069, 00000, "placeholder for column level ORA error "
// *Document: NO
// *Cause:  filler
// *Action: filler
00070, 00000, "attempt to free unallocated memory"
// *Cause:  An attempt was made to free memory that was not allocated.
// *Action: Contact Oracle Worldwide Support
00071, 00000, "QUERY parameter not compatible with Direct Path export" 
// *Cause:  You specified a value for the QUERY parameter for a direct path 
//	    export. The QUERY parameter cannot be used with a direct path 
//	    export. 
// *Action: Re-issue the export command with DIRECT=N or omit the DIRECT  
//	    parameter from the command line.
00072, 00000, "error closing export file %s" 
// *Cause:  An error occurred while trying to close the export file.
// *Action: Contact Oracle Worldwide Support.
00073, 00000, "dump file size too small" 
// *Cause:  You specified either the FILESIZE parameter or the VOLSIZE 
//        parameter (if your platform supports it), and the value of the 
//        parameter is too small to hold the header information for the  
//        export file, plus any data.  
// *Action: Increase the value of the FILESIZE or VOLSIZE parameter. 
#ifdef EXU_VOLSIZE 
00074, 0000, "rounding VOLSIZE down, new value is %s" 
// *Cause:  The VOLSIZE parameter must be a multiple of the RECORDLENGTH, 
//        but the value you specified for VOLSIZE does not meet this 
//        requirement.  The value of VOLSIZE has been rounded down to 
//        be a multiple of the RECORDLENGTH used for the dump file. 
// *Action: No action is required.  You can adjust the VOLSIZE or RECORDLENGTH 
//        parameter to avoid this message.  When importing 
//        this file, you must specify the VOLSIZE value reported by this 
//        message. 
#endif 
00075, 0000, "rounding FILESIZE down, new value is %s" 
// *Cause:  The FILESIZE parameter must be a multiple of the RECORDLENGTH, 
//        but the value you specified for FILESIZE does not meet this 
//        requirement.  The value of FILESIZE has been rounded down to 
//        be a multiple of the RECORDLENGTH used for the dump file. 
// *Action: No action is required.  You can adjust the FILESIZE or RECORDLENGTH
//        parameter to avoid this message.  When importing 
//        this file, you must specify the FILESIZE value reported by this 
//        message. 
#ifdef EXU_VOLSIZE 
00076, 0000, "multiple devices specified for tape output"
// *Cause:  You specified multiple file names when doing an export to a tape
//	  device.  EXPORT uses the same device for writing all files, of the 
//	  number of tape volumes required.  For this reason, export will 
//	  accept only one value for the FILE parameter when writing to tape.
// *Action: Reenter the EXPORT command, but specify only one tape device in
//	  the FILE parameter.
#endif
00077, 0000, "multiple output files specified for unbounded export file"
// *Cause:  You specified multiple file names when doing an export and you also
//	  specified a value of 0 for the FILESIZE parameter.  Note that 0 is
//	  the value used if FILESIZE is not specified on the command line.
//	  Since a value of 0 for FILESIZE means that only one file will be 
//	  written and there is no size limit for that file, the other files
//	  you specified in the FILE parameter can never be used.
// *Action:  If you intended to write multiple files, respecify the command
//	  but use the FILESIZE to specify the maximum number of bytes that 
//	  EXPORT should write to each file.  If you intended to write only
//	  one file with no limits on it's size, reissue the EXPORT command 
//	  but specify only one file name for the FILE parameter.
00078, 0000, "Error exporting metadata for index %s. Index creation will be skipped" 
// *Cause:  Domain indexes export private metadata via anonymous PL/SQL blocks
//	  prior to the CREATE INDEX statement. Export does this by calling
//	  the ODCIIndexGetMetadata method on the implementation type
//	  associated with the index. A problem occurred inside this routine.
//	  Because the metadata is considered an integral part of the index,
//	  the CREATE INDEX statement was not written to the dump file.
// *Action: Contact the developer of the index's implementation type. If this
//	  is an Oracle-supplied index (perhaps via a data cartridge), contact
//	  Oracle Worldwide Support.
00079, 0000, "Data in table \"%s\" is protected. Conventional path may only be exporting partial table."
// *Cause:  User without the execute privilege on DBMS_RLS, the access control
//        package, tries to export a table that has access control. Since table
//        owner is also subjected to access control, the owner may not be able 
//        to export all rows in the table, but only the ones he can see.  Also,
//        to preserve integrity of the table, user exporting the table should 
//        have enough privilege to recreate the table with the security 
//        policies at import time. Therefore, it is strongly recommended 
//        the database administrator should be handling exporting of this 
//        table. Granting the table owner execute privilege would also
//        satisfy this security check, though it might have other security 
//        implications. If the table does not have objects, can use direct mode.
// *Action: Ask the database administrator to export/import this table/view.
00080, 0000, "Data in table \"%s\" is protected. Using conventional mode."
// *Cause:  User without the execute privilege on DBMS_RLS, the access control
//        package, tries to direct export a table that has access control
//        enabled. Using conventional export mode instead. Note that
//        because of access control, only a partial table may be exported.
// *Action: Ask the database administrator to export/import this table/view.
00081, 0000, "Exporting access control for table/view \"%s\" as non-DBA."
// *Cause:  A non-DBA user tries to export table/view and the associated
//        fine grain access control policies.  The user may not have enough
//        privilege to recreate the access control policies when importing
//        the table/view. And such an event may cause inconsistency
//        in the security model of the table/view. 
// *Action: Ask the database administrator to export/import this table/view.
00082, 00000, "Invalid function name passed to procedural object support: %s"
// *Cause:  Internal inconsistency error: The listed function is not a method
//          on export's procedural object interface specification.
// *Action: Contact Oracle Worldwide Support
00083, 00000, "The previous problem occurred when calling %s.%s.%s"
// *Cause:  The listed package provides export/import support for procedural
//	actions. The previously listed error occurred while calling the
//	specified function.
// *Action: Contact Oracle Worldwide Support. Most packages are supplied by
//	Oracle internal cartridge or server development groups. The package
//	name will help Support determine the correct owner of the problem.
00084, 00000, "Unexpected DbmsJava error %d at step %u"
// *Cause:  The error was returned from a call to a DbmsJava procedure.
// *Action: Record the accompanying messages and report this as an Export 
//          internal error to customer support. 
00085, 00000, "The previous problem occurred when calling %s.%s.%s for object %lu"
// *Cause:  The listed package provides export/import support for procedural
//	objects, i.e, those whose DDL is supplied by stored procedures. The
//	previously listed error occurred while calling the specified function.
// *Action: Contact Oracle Worldwide Support. Most packages are supplied by
//	Oracle internal cartridge or server development groups. The package
//	name will help Support determine the correct owner of the problem.
00086, 00000, "Primary key REFs in table \"%s\"may not be valid on import"
// *Cause:  The specified table contains primary key REFs which may
//          not be valid in the import database.
// *Action: Do not use Export/Import to move Primary key REFs between
//          databases having differing character sets.
00087, 00000, "Problem with internal hash table of schema/table names"
// *Cause:  Most likely a problem with allocating memory for the hash
//          table entries.
// *Action: Contact Oracle Worldwide Support
// NLS_DO_NOT_TRANSLATE [88,88]
00088, 00000, "null error message, just signal error "
// *Document: NO
// *Cause:  filler
// *Action: filler
00089, 00000, "invalid FILE_FORMAT specification"
// *Cause:  The FILE_FORMAT specification did not contain an
//          instance of "%s".  This wildcard string must be present.
// *Action: Correct the error and reenter the EXPORT command.
00090, 00000, "cannot pin type \"%s\".\"%s\""
// *Cause:  Export was unable to pin the specified type in the object cache.
//          This is typically caused because a type could not be made valid
//          (for example because of authorization violations in accessing 
//          subtypes).
// *Action: Fix the problem with the offending type until the type can be 
//          successfully compiled.
00091, 00000, "Exporting questionable statistics."
// *Cause:  Export was able export statistics, but the statistics may not be
//          usuable. The statistics are questionable because one or more of
//	    the following happened during export: a row error occurred, client
//	    character set or NCHARSET does not match with the server, a query
//	    clause was specified on export, only certain partitions or
//	    subpartitions were exported, or a fatal error occurred while
//	    processing a table.
// *Action: To export non-questionable statistics, change the client character
//	    set or NCHARSET to match the server, export with no query clause,
//	    export complete tables. If desired, import parameters can be
//	    supplied so that only non-questionable statistics will be imported,
//	    and all questionable statistics will be recalculated.
00092, 00000, "Unable to set NLS_NUMERIC_CHARACTERS to required defaults."
// *Cause:  Export was unable to set NLS_NUMERIC_CHARACTERS to '.,'
// *Action: Record the accompanying messages and report this as an Export 
//          internal error to customer support. 
00093, 00000, "Could not convert to server character set's handle"
// *Cause:  Internal error.
// *Action: Contact Worldwide support.
00094, 00000, "Could not convert to server national character set's handle"
// *Cause:  Internal error.
// *Action: Contact Worldwide support.
00095, 00000, "Flashback_time and Flashback_scn are not compatible"
// *Cause:  Both flashback_time and flashback_scn paramerers were specified.
// *Action: Reissue command with only one flashback parameter.
00096, 00000, "The template name specified can not be found."
// *Action: The template name specified does not exist. Verify template name
//          by looking up view %_ias_template.
00097, 00000, "Object type \"%s\".\"%s\" is not in a valid state, type will not be exported"
// *Cause:  The object type's status is invalid which may be caused by 
//          a dependant type's modification (or removal) without cascading 
//          the change. 
// *Action: The type must be recompiled using ALTER TYPE COMPILE.
00098, 00000, "Data in table has not been upgraded, table will not be exported"
// *Cause:  Export is attempting to process a table containing references 
//          to a type which has evolved.  In order for Export to process the 
//          table successfully, all data within each table must be upgraded
//          to the latest revision of each referenced type.
// *Action: The table must be updated using ALTER TABLE UPGRADE DATA.
00099, 00000, "Table \"%s\".\"%s\" is not in a valid state, table will not be exported"
// *Cause:  A table or one of its dependant types has modified without 
//          cascading the change.  This left the table in an INVALID state. 
// *Action: The table must be updated using ALTER TABLE UPDATE.
00100, 00000, "error converting an object type's hashcode to characters"
// *Cause:  An invalid length of an object type identifier prevented
//          its conversion. 
// *Action: Contact Oracle Worldwide Support
00101, 00000, "Version 1 extensible index \"%s\".\"%s\" can not be included in Transportable Tablespace Export"
// *Cause:  Transporable Tablespace extensible indexes must be at least version
//          2.
// *Action: Upgrade extensibile index implementation to version 2 
//          specifications.
00102, 00000, "Resumable parameters ignored -- current session not resumable"
// *Cause:  Current session is not resumable. 
// *Action: Must specify RESUMABLE=Y to enable resumable session in order for
//          the RESUMABLE_NAME and RESUMABLE_TIMEOUT parameters to take effect.
00103, 00000, "The FLASHBACK_TIME parameter was invalid"
// *Cause:  FLASHBACK_TIME did not contain a valid timestamp or an expression
//          that yields a valid timestamp.
// *Action: Specify a timestamp value in the format of YYYY-MM-DD HH24:MI:SS or
//          an expression that evaluates to a valid timestamp. 
00104, 00000, "datatype (%s) of column %s in table %s.%s is not supported, table will not be exported"
// *Cause:  The column is of a datatype which does not contain the required 
//          support.  The table will not be exported.
// *Action: Use the Data Pump version of Export to export this table.
00105, 00000, "parameter %s is not supported for this user"
// *Cause:  The user attempted to specify either CONSISTENT or OBJECT_CONSISTENT
//          when connected as sysdba.
// *Action: If a consistent export is needed, then connect as another user. 
/
00106, 00000, "Invalid Database Link Passwords"
// *Cause:  Invalid Encoded Password for Database Link
// *Action: Please drop the Database Link and recreate it after import.
00107, 00000, "Feature (%s) of column %s in table %s.%s is not supported. The table will not be exported."
// *Cause:  Export does not contain the required support for this feature.
//          The table will not be exported.
// *Action: Use the Data Pump version of Export to export this table.
/
00108, 00000, "NULL lob fetched"
// *Cause:  Internal error
// *Action: Contact Oracle Worldwide Support.
/
00109, 00000, "XSL delimiter not found"
// *Cause:  Internal error
// *Action: Contact Oracle Worldwide Support.
/
00110, 00000, "Tablespace %s is encrypted and will not be exported"
// *Cause: Encrypted Tablespace feature is not supported by classic export
// *Action: Use DATAPUMP Utility to export this tablespace.
/
00111, 00000, "Table %s resides in an Encrypted Tablespace %s and will not be exported" 
// *Cause: Encrypted Tablespace feature is not supported by classic export
// *Action: Use DATAPUMP Utility to export this table.
00112, 00000, "Index %s is of XMLType and could not be exported"
// *Cause: Export does not contain the required support for this feature.
//         The index could not be exported.
// *Action: Use Oracle Data Pump Utility to export this index.
00113, 00000, "Feature %s is unsupported. %s %s.%s could not be exported"
// *Cause:  Export does not contain the required support for this feature.
// *Action: Use Oracle Data Pump Utility
/
/ do NOT translate message 199
// NLS_DO_NOT_TRANSLATE [199,199]
00199, 00000, "event to override default nls_numeric_char setting during import"
// *Document: NO
// *Cause: event to override default nls_numeric_char setting during import
// *Action: THIS IS NOT A USER ERROR NUMBER/MESSAGE.  THIS DOES NOT NEED TO BE
//          TRANSLATED OR DOCUMENTED. IT IS USED FOR SETTING A NEW EVENT TO
//          OVERRIDE DEFAULT NLS_NUMERIC_CHAR SETTING
/ Informative messages
/
// UI[200,205]
00200, 00000, "\nExport terminated successfully without warnings.\n"
00201, 00000, "\n\nAbout to export specified tables "
00203, 00000, "\nCurrent user changed to %s"
00204, 00000, "\n\nAbout to export specified users ..."
00205, 00000, "%11lu rows exported"
/ do NOT translate message 206
// NLS_DO_NOT_TRANSLATE [206,206]
00206, 00000, "Export"
// UI[207,285]
00207, 00000, "\nConnected to: %s"
00208, 00000, "\n\nAbout to export the entire database ..."
00209, 00000, "\n. exporting user definitions"
00210, 00000, "\n. exporting cluster definitions"
00211, 00000, "\n. exporting tablespace definitions"
00212, 00000, "\n. exporting synonyms"
00213, 00000, "\n. exporting default and system auditing options"
00214, 00000, "\n. . exporting table%*.*s%*.*s"
00215, 00000, "\nAbout to export %s's objects ..."
00216, 00000, "\n. about to export %s's tables "
00217, 00000, "\n. exporting database links"
00218, 00000, "\n. exporting rollback segment definitions"
00219, 00000, "\n. exporting sequence numbers"
00220, 00000, "\n. exporting referential integrity constraints"
00221, 00000, "\n. exporting information about dropped objects"
00222, 00000, "\n. exporting PUBLIC type synonyms"
00223, 00000, "\nNote: grants on tables/views/sequences/roles will not be exported"
00224, 00000, "\nNote: indexes on tables will not be exported"
00225, 00000, "\nNote: constraints on tables will not be exported"
00226, 00000, "\nNote: table data (rows) will not be exported"
00227, 00000, "\n. exporting roles"
00228, 00000, "\n. exporting views"
00229, 00000, "\n. exporting triggers"
00230, 00000, "\n. exporting profiles"
00231, 00000, "\n. exporting stored procedures"
00232, 00000, "\n. exporting materialized views"
00233, 00000, "\n. exporting snapshot logs"
00234, 00000, "          Rows not exported"
00235, 00000, "\nWarning: Object %s.%s is invalid"
00236, 00000, "\nExport terminated successfully with warnings.\n"
00237, 00000, "\n. exporting resource costs"
00238, 00000, "\n. exporting job queues"
00239, 00000, "\n. exporting refresh groups and children"
00240, 00000, "\n. exporting posttables actions"
00241, 00000, "\n%61lu rows exported"
00242, 00000, "via Conventional Path ..."
00243, 00000, "via Direct Path ..."
00244, 00000, "\nExport done in %s character set and %s NCHAR character set"
00245, 00000, "\n\nAbout to export Tablespace Point-in-time Recovery objects..."
00246, 00000, "\nFor tablespace %s ..."
00247, 00000, "\n. exporting table definitions"
00248, 00000, "\nWarning: %s option incompatible with Tablespace point-in-time Recovery"
00249, 00000, "\n. . exporting partition%*.*s%*.*s"
00250, 00000, "\n. end point-in-time recovery"
00251, 00000, "\n. exporting user history table"
00252, 00000, "\n. exporting foreign function library names for user %s "
00253, 00000, "\n. exporting object type definitions"
00254, 00000, "\n. exporting object type definitions for user %s "
00255, 00000, "\nNote: Table depends on an object type from a different schema %s.%s"
00256, 00000, "\n. exporting directory aliases"
00257, 00000, "\n. exporting foreign function library names"
00258, 00000, "\nserver uses %s character set (possible charset conversion)"
00259, 00000, "\ncontinuing export into file %s\n"
00260, 00000, "\n. exporting context namespaces"
00261, 00000, "\nAbout to export transportable tablespace metadata..."
00262, 00000, "\n. end transportable tablespace metadata export"
00263, 00000, "\n. exporting operators"
00264, 00000, "\n. exporting indextypes"
00265, 00000, "\n. exporting dimensions"
00266, 00000, "\n. exporting system procedural objects and actions"
00267, 00000, "\n. exporting pre-schema procedural objects and actions"
00268, 00000, "\n. exporting post-schema procedural objects and actions"
00269, 00000, "\n. exporting bitmap, functional and extensible indexes"
00270, 00000, "\n. . exporting composite partition%*.*s%*.*s"
00271, 00000, "\n. . exporting subpartition%*.*s%*.*s"
00272, 00000, "\n. exporting statistics"
00273, 00000, "\nNote: RECORDLENGTH=%lu truncated to %lu\n"
00274, 00000, "\n\nAbout to export selected tablespaces ..."
00275, 00000, "\n. exporting iAS generated DDL statements"
00276, 00000, "\nTable %s will be exported in conventional path."
00277, 00000, "\n. exporting private type synonyms"
/ The following messages are used by the undocumented METRICS facility.
00278, 00000, "\n\nTotals for tables"
00279, 00000, "\n\nTotals for database"
/ Messages 280 thru 283 should all be the same length and right aligned with respect to other messages in the log.
00280, 00000, "\n        Rows    = %10Ld Elapsed Time = %02ld:%02ld:%02ld:%02ld  CPU Time = %02ld:%02ld:%02ld:%02ld"
00281, 00000, "\n  Total Rows    = %10Ld Elapsed Time = %02ld:%02ld:%02ld:%02ld  CPU Time = %02ld:%02ld:%02ld:%02ld"
00282, 00000, "\n        Objects = %10Ld Elapsed Time = %02ld:%02ld:%02ld:%02ld  CPU Time = %02ld:%02ld:%02ld:%02ld"
00283, 00000, "\n  Total Objects = %10Ld Elapsed Time = %02ld:%02ld:%02ld:%02ld  CPU Time = %02ld:%02ld:%02ld:%02ld"
00284, 00000, "\n  %10Ld Buffer Writes of %10Ld bytes = %10.3f Kbytes written"
00285, 00000, "\n  Throughput = %10.3f Kbytes/sec"
/ end of METRICS messages

/
/ Prompt messages
/
// UI[300,311]
00300, 00000, "\nEnter array fetch buffer size: %lu > "
00301, 00000, "\nUsername: "
00302, 00000, "Password: "
00303, 00000, "\nTable(T) or Partition(T:P) to be exported: (RETURN to quit) > "
00304, 00000, "\nUser to be exported: (RETURN to quit) > " 
00305, 00000, "Compress extents"
/
/ These messages used to accept only the first letter of the mode.
/ Now they also accept the number indicated in parentheses so they
/ are language-independent.
00306, 00000, "\n(1)E(ntire database), (2)U(sers), or (3)T(ables): (2)U > "
00307, 00000, "\n(2)U(sers), or (3)T(ables): (2)U > "
/
00308, 00000, "\n%s (%s/%s): %s > "
00309, 00000, "\nExport file: %s > "
00310, 00000, "Export grants"
00311, 00000, "Export table data"
#ifdef EXU_VOLSIZE
/
/ prompt for volsize
/
// UI[398,399]
00398, 00000, "\nVolume size (<ret> for no restriction) > "
00399, 00000, "\nPlease mount the next volume and hit <ret> when you are done.\n"
#endif /* EXU_VOLSIZE */

/
/ HELP messages, range defined as EXUSHLP and EXUEHLP in exudef.h
/
// UI[400,436]
00400, 00000, "\n\nYou can let Export prompt you for parameters by entering the EXP\n"
00401, 00000, "command followed by your username/password:\n"
00402, 00000, "\n"
00403, 00000, "     Example: EXP SCOTT/TIGER\n"
00404, 00000, "\n"
00405, 00000, "Or, you can control how Export runs by entering the EXP command followed\n"
00406, 00000, "by various arguments. To specify parameters, you use keywords:\n"
00407, 00000, "\n"
00408, 00000, "     Format:  EXP KEYWORD=value or KEYWORD=(value1,value2,...,valueN)\n"
00409, 00000, "     Example: EXP SCOTT/TIGER GRANTS=Y TABLES=(EMP,DEPT,MGR)\n"
00410, 00000, "               or TABLES=(T1:P1,T1:P2), if T1 is partitioned table\n"
00411, 00000, "\n"
00412, 00000, "USERID must be the first parameter on the command line.\n"
00413, 00000, "\n"
00414, 00000, "Keyword    Description (Default)      Keyword      Description (Default)\n"
00415, 00000, "--------------------------------------------------------------------------\n"
00416, 00000, "USERID     username/password          FULL         export entire file (N)\n"
00417, 00000, "BUFFER     size of data buffer        OWNER        list of owner usernames\n"
00418, 00000, "FILE       output files (EXPDAT.DMP)  TABLES       list of table names\n"
00419, 00000, "COMPRESS   import into one extent (Y) RECORDLENGTH length of IO record\n"
00420, 00000, "GRANTS     export grants (Y)          INCTYPE      incremental export type\n"
00421, 00000, "INDEXES    export indexes (Y)         RECORD       track incr. export (Y)\n"
00422, 00000, "DIRECT     direct path (N)            TRIGGERS     export triggers (Y)\n"
00423, 00000, "LOG        log file of screen output  STATISTICS   analyze objects (ESTIMATE)\n"
00424, 00000, "ROWS       export data rows (Y)       PARFILE      parameter filename\n"
00425, 00000, "CONSISTENT cross-table consistency(N) CONSTRAINTS  export constraints (Y)\n\n"
00426, 00000, "OBJECT_CONSISTENT    transaction set to read only during object export (N)\n"
00427, 00000, "FEEDBACK             display progress every x rows (0)\n"
00428, 00000, "FILESIZE             maximum size of each dump file\n"
00429, 00000, "FLASHBACK_SCN        SCN used to set session snapshot back to\n"
00430, 00000, "FLASHBACK_TIME       time used to get the SCN closest to the specified time\n"
00431, 00000, "QUERY                select clause used to export a subset of a table\n"
00432, 00000, "RESUMABLE            suspend when a space related error is encountered(N)\n"
00433, 00000, "RESUMABLE_NAME       text string used to identify resumable statement\n"
00434, 00000, "RESUMABLE_TIMEOUT    wait time for RESUMABLE \n"
00435, 00000, "TTS_FULL_CHECK       perform full or partial dependency check for TTS\n"
00436, 00000, "VOLSIZE              number of bytes to write to each tape volume\n"
/
/ HELP messages for transportable tablespace, range defined as EXUTSHLP and 
/ EXUTEHLP in exudef.h
/
// UI[461,463]
00461, 00000, "TABLESPACES          list of tablespaces to export\n"
00462, 00000, "TRANSPORT_TABLESPACE export transportable tablespace metadata (N)\n"
/
/ HELP message for iAS mode export.
00463, 00000, "TEMPLATE             template name which invokes iAS mode export\n"
