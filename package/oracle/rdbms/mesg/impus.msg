/ $Header: rdbms/mesg/impus.msg /main/84 2009/02/18 09:50:19 tbhukya Exp $ impmtb.msg 
/ 
/ Copyright (c) 1988, 2000 by the Oracle Corporation.  All rights reserved.
/
/ File: v6$knl:[impexp]impmtb.msg
/ Created: 07/12/88
/
/ OWNER
/    Raghu Viswanathan (vraghuna) - 1993
/ MODIFIED:
/    bmccarth   05/20/03 -  update for automatic scripts pulling messages out
/    bmccarth   11/30/01 -  message about streams and not full
/    jgalanes   10/24/01 -  add msg #96 for TYPE SYNONYM imp error
/    jgalanes   07/20/01 -  add msg re INCTYPE obsolete
/    jgalanes   07/13/01 -  fix msg #93 format for bug 1874410
/    htseng     03/19/01 -  update help message 
/    bmccarth   01/18/01 -  hashcode convert error
/    dgagne     11/29/00 -  add COMPILE switch support
/    htseng     03/20/00 -  add resumable support
/    wfisher    06/10/99 -  always honor TOID_NOVALIDATE
/    wfisher    04/05/99 -  update MSGAPR
/    nireland   12/08/98 -  add message for truncated RECORDLENGTH
/    wfisher    12/15/98 -  removing errno and friends
/    tlee       08/28/98 -  HELP msg for transportable tablespaces
/    lbarton    08/10/98 -  add "Java object already exists"
/    gclaborn   05/27/98 -  Add procedural object messages
/    nvishnub   05/18/98 -  Add set of HELP messages.
/    lbarton    05/07/98 -  add Java messages
/    tlee       03/05/98 -  new partitioning support
/    gclaborn	02/18/98 -  Add hash table error msgs.
/    lbarton    02/02/98 -  Changes for toid_novalidate
/    jstenois	10/24/97 -  add messages for multi-file export support
/    wfisher    08/28/97 -  add message for missing database option
/    jstenois   08/20/97 -  remove references to unused messages
/    jpearson   05/20/97 -  add feedback to help message	
/    jpearson   04/22/97 -  character conversion messages
/    wfisher	04/01/97 -  MSGCTF
/    jpearson   03/04/97 -  fix bugs 459414 and 447629
/    jpearson   02/26/97 -  add message for nested table errors
/    wfisher	02/19/97 -  Extend MSGNFC for all four strings
/    jpearson   02/14/97 -  corrections, add MSGCDT, comments
/    wfisher	11/15/96 -  MSGNFC
/    wfisher    11/05/96 -  MSGTTE
/    jpearson   11/05/96 -  update object terminology
/    syeung     10/24/96 -  add message for enabling enforced constraints
/    syeung     09/25/96 -  add messages 68 & 69 for NCHAR
/    ysang      08/08/96 -  add lrm initialization failure message
/    ccchang    03/15/96 -  support for pti                                    
/    ixhu       02/08/96 -  tablespace point-in-time-recovery
/    bhimatsi   07/11/95 -  merge changes from branch 1.37.720.2
/    bhimatsi   07/11/95 -  merge changes from branch 1.37.720.2
/    bhimatsi   07/11/95 -  merge changes from branch 1.37.720.1
/    ixhu       03/09/95 -  direct path Export
/    vraghuna   09/12/94 -  bug 235724 - add message 50 - files different
/    vraghuna   08/02/94 -  add loadable NLS changes
/    vraghuna   06/16/94 -  add feedback feature
/    vraghuna   06/10/94 -  bug 220344 - TABLE --> TABLES for mesg 31
/    vraghuna   03/01/94 -  bug 187050 - put an action for IMP-16
/    vraghuna   02/08/94 -  bug 190437 - merge in unix volsize changes
/    vraghuna   05/07/93 -  bug 163384 - add imp 49 
/    jbellemo   03/26/93 -  MLSIMPMP: add new label mapping errors 
/    agupta     12/22/92 -  add out of memory message 
/    jcleland   11/04/92 -  change MLS message for RHILTNER 
/    jcleland   11/03/92 -  remove extra text 
/    jcleland   10/23/92 -  Ruth Hiltner msg change 
/    Dana       09-03-84 -  Add error 43, 44, 45 and modify 2 and 128
/    Dana       05-15-85 -  Add Miners error mesages 140-150 from exumtb.h
/    Dana       05-15-85 -  Add #46, modify 15,31,32,38,39,100,101,104,113
/    Miner      05-23-85 -  various import messages
/    Miner      05-24-85 -  various export messages
/    Dana       06-26-85 -  change banners, add progress reports
/    Bradbury   08/26/85 -  Make "impmsg.mtb" contain import msgs.
/    Miner      09/20/85 -  add array insert messages
/    Forrest    10/15/85 -  add operating system error
/    Derry      12/05/85 -  modify SQL-statement messages to not have string
/    Derry      04/09/86 -  107 change from %d to %lu
/    Aoki       05/02/86 -  100 change from "Import" to "Import - Production"
/    Hong       02/16/87 -  add error message (#154) for command line driver
/    Hong       02/16/87 -  add message (#155) when skipping rows
/    Hong       05/31/87 -  add trailing space to msg #104
/    Hong       06/04/87 -  add 'into <user>' to message #148
/    Hong       01/17/88 -  mod err msg 124
/    Kornet     03/21/88 -  Reformat for use by LMS
/    Hong       07/14/88 -  major rework/reorganize of error messages
/    Hong       08/11/88 -  add msgs 27 and 28
/    Porter     12/18/88 -  Fix "Emport" typo
/    Porter     05/28/89 -  Spell check
/
/
/ This file is converted to header/message files using lmsgen.c
/
/ The first column is the Import error number.
/ The second column is reserved and must be (for now) 00000
/ The remainder of the line is the error text
/
/ Adding an error for Import
/    Check out this file, add the error, and check it back in. Error numbers
/    should always be ordered.  The second column should always be 00000.
/
/
/ Range 000 - 099: actual Import errors
/ Range 100 - 199: informative messages
/ Range 200 - 299: prompt messages
/ Range 300 - 399: help messages
/ Range 400 - 499: actual Import errors (exhausted 000 - 099) 
/
/ Error messages
/
/
00000, 00000, "Import terminated unsuccessfully\n"
// *Cause:  Import encountered an Oracle error. 
// *Action: Look up the accompanying Oracle message in the ORA message 
//          chapters of this manual, and take appropriate action. 
00001, 00000, "respond with either %s, %s, RETURN or '.' to quit"
// *Cause:  An invalid response was entered. 
// *Action: Enter any of the responses shown in the message. 
00002, 00000, "failed to open %s for read"
// *Cause:  Import failed to open the export file for reading. This message is 
//          usually followed by a device message from the operating system. 
// *Action: Take appropriate action to restore the device. 
00003, 00000, "ORACLE error %lu encountered"
// *Cause:  Import encountered the referenced Oracle error. 
// *Action: Look up the Oracle message in the ORA message chapters of this 
//          manual, and take appropriate action.
00004, 00000, "invalid username or password\n"
// *Cause:  An invalid username or password was specified. 
// *Action: Retry with a valid username and password.
00005, 00000, "all allowable logon attempts failed"
// *Cause:  An attempt was repeatedly made to log on with an invalid 
//          username or password. 
// *Action: Retry with valid username and password. 
00006, 00000, "failed to allocate memory of size %lu"
// *Cause:  Import failed to allocate the necessary memory. 
// *Action: Decrease the import buffer size so that less memory is required, 
//          or increase the runtime memory size for Import. 
00007, 00000, "must be a DBA to import objects to another user's account"
// *Cause:  The privileges needed to import into another user's account do not 
//          exist. Only a database administrator can import into another 
//          user's account. 
// *Action: Ask the database administrator to do the import. 
00008, 00000, "unrecognized statement in the export file: \n  %s"
// *Cause:  Import did not recognize a statement in the export file. Either 
//          the export file was corrupted, or an Import internal error has 
//          occurred. 
// *Action: If the export file was corrupted, retry with a new export file. 
//          Otherwise, report this as an Import internal error and submit
//          the export file to customer support.
00009, 00000, "abnormal end of export file"
// *Cause:  The export file is probably from an aborted Export session. 
// *Action: If so, retry the export and import. Otherwise, report this as an 
//          Import bug and submit the export file that caused this error to 
//          customer support. 
00010, 00000, "not a valid export file, header failed verification"
// *Cause:  Either the file was not generated by Export or it was corrupted. 
// *Action: If the file was indeed generated by Export, report this an 
//          Import bug and submit the export file to customer support. 
00011, 00000, "formatted table data not currently supported"
// *Cause:  You tried to import an export file that contains formatted table 
//          data. Import only supports export files containing binary table 
//          data.  wher
// *Action: Retry using an export file that contains only binary table data. 
00012, 00000, "invalid export mode (%c) in header"
// *Cause:  The Export mode specified in the export file header is invalid. 
// *Action: Check the export file to see if it was corrupted. If it was not, 
//          report this as an Import bug and submit the export file to 
//          customer support. 
00013, 00000, "only a DBA can import a file exported by another DBA"
// *Cause:  The privileges needed to Import an export file generated by a 
//          database administrator do not exist. Only a database administrator 
//          can import such files. 
// *Action: Ask the database administrator to do the import. 
00014, 00000, "option \"%s\" is needed, but not present in database"
// *Cause:  The command entered requires the specified option.  Either that 
//	    option is not installed, or the row describing the option is
//	    missing from table V$OPTION
// *Action: Reinstall Oracle with the option specified by the message.
00015, 00000, "following statement failed because the object already exists:"
// *Cause:  Import failed to create an object because it already exists. 
// *Action: Specify IGNORE=Y to ignore such errors and import rows even when 
//          tables are not created because they already exist.
00016, 00000, "required character set conversion (type %lu to %lu) not supported"
// *Cause:  Import could not convert the character format of the export file 
//          into the native character format. 
// *Action: Change the user character set by setting the NLS_LANG 
//          environment variable to match the character set of the export file.
00017, 00000, "following statement failed with ORACLE error %lu:"
// *Cause:  Import failed to execute the statement from the export file 
//          because of an Oracle error. 
// *Action: Look up the accompanying Oracle message in the ORA message 
//          chapters of this manual and take appropriate action. 
00018, 00000, "partial import of previous table completed: %lu rows imported"
// *Cause:  A table was only partially imported because of an Oracle error. 
// *Action: Look up the accompanying Oracle message in the ORA message 
//          chapters of this manual and take appropriate action. 
00019, 00000, "row rejected due to ORACLE error %lu"
// *Cause:  Import encountered the referenced Oracle error while trying to 
//          import a row. 
// *Action: Look up the accompanying Oracle message in the ORA message 
//          chapters of this manual and take appropriate action. 
00020, 00000, "long column too large for column buffer size (%lu)"
// *Cause:  The column buffer is too small. This usually occurs when importing 
//          LONG data. 
// *Action: Increase the insert buffer size 10,000 bytes at a time (for 
//          example). Use this step-by-step approach 
//          because a buffer size that is too large may cause a similar 
//          problem.  
00021, 00000, "INCTYPE parameter is obsolete"
// *Cause:  Import encountered the INCTYPE parameter when parsing Import
//          options.  Incremental Imports are no longer supported. 
// *Action: Consult the Oracle Backup and Recovery guide.  
//          Import will attempt to continue.
00022, 00000, "failed to process parameters, type 'IMP HELP=Y' for help"
// *Cause:  Invalid command-line parameters were specified. 
// *Action: Check the online help screen for the set of valid parameters, then 
//          retry. 
00023, 00000, "Import views not installed, please notify your DBA"
// *Cause:  The necessary Import views were not installed. 
// *Action: Ask your database administrator to install the required Import 
//          views.
00024, 00000, "Only one mode (TABLES, FROMUSER, or FULL) can be specified"
// *Cause:  Parameters were specified that conflict with the import 
//          specification FULL=Y. 
// *Action: Retry, making sure not to specify FULL=Y. 
00025, 00000, "for DBA export files, FROMUSER must be specified with TOUSER option"
// *Cause:  When importing a database administrator export file, you specified 
//          the TOUSER parameter but not the FROMUSER parameter. 
// *Action: Specify the FROMUSER parameter so that Import knows which user's 
//          objects to import. 
00027, 00000, "failed to rollback partial import of previous table"
// *Cause: Import encountered an Oracle error while trying to roll back a 
//          partial import. 
// *Action: Look up the accompanying Oracle message in the ORA message 
//          chapters of this manual and take appropriate action. Then, log 
//          on to Oracle and check that the partial import was not committed.
00028, 00000, "partial import of previous table rolled back: %lu rows rolled back"
// *Cause:  Import encountered an Oracle error while trying to import a table. 
// *Action: Look up the accompanying Oracle message in the ORA message 
//          chapters of this manual and take appropriate action. Then, if 
//          necessary, re-import the table. 
//          
00029, 00000, "cannot qualify table name by owner (%s), use FROMUSER parameter"
// *Cause:  A table name was qualified with the name of its owner, as shown in 
//          the following example. This is not allowed.  
//            IMP SYSTEM/MANAGER TABLES=(SCOTT.EMP)
// *Action: Use the FROMUSER parameter to specify the table's owner, as 
//          shown in the following example:   
//            IMP SYSTEM/MANAGER FROMUSER=SCOTT TABLES=(EMP, DEPT)
//  
00030, 00000, "failed to create file %s for write"
// *Cause:  Import was unable to create the specified file with write enabled.
// *Action: Check the file name and file system for the source of the error.
//
//  
00031, 00000, "Must specify FULL=Y or provide FROMUSER/TOUSER or TABLES arguments"
// *Cause: The database administrator did not specify full or partial import.
// *Action: The database administrator must specify FROMUSER/TOUSER or table 
//          arguments if not a full import.
00032, 00000, "SQL statement exceeded buffer length"
// *Cause:  The buffer was too small for the SQL statement being read.
// *Action: Rerun with a larger buffer. This can also be an indication of a 
//          corruption in the import datafile. 
00033, 00000, "Warning: Table \"%s\" not found in export file"
// *Cause:  A table name was specified that does not exist in export file.
// *Action: Correct the table specification.
//
00034, 00000, "Warning: FromUser \"%s\" not found in export file"
// *Cause:  The user specified a FROMUSER name that does not exist in export 
//          file.
// *Action: Correct the FROMUSER specification.
00035, 00000, "input file %s must be on a disk"
// *Cause:  On some platforms, import can read files from tape.  This message
//	    is displayed if the first file in an export file set was on disk
//	    and you specified a tape device for a second or subsequent file.
// *Action: Verify that you have specified the correct file name for the import
//	    file.  Remember that all input files can be either on disk or all
//	    files can be on tape, but not mixed both tape and disk.
00036, 00000, "Could not find environment character set"
// *Cause:  An environment character set was specified that was not recognized 
//          by the Import utility.
// *Action: Ensure that the spelling of the character set specified in the 
//          command line parameter CHARSET (for Release 6 only)
//          or the environment variable NLS_LANG is correct.
00037, 00000, "Character set marker unknown"
// *Cause:  The export file is corrupted.
// *Action: Try to obtain an uncorrupted version of the export file.
//          If the export file is not corrupted, report this as an Import
//          internal error and submit the export file to customer support.
00038, 00000, "Could not convert to environment character set's handle"
// *Cause:  Internal error.
// *Action: Contact Worldwide Support.
#ifdef EXU_VOLSIZE 
00039, 00000, "VOLSIZE does not match the value used for export: %s" 
// *Cause:  The value specified for VOLSIZE does not match the value specified 
//        during the creation of the export file. 
// *Action: If you believe that the specified VOLSIZE value is correct, verify
//	  that you specified the correct file for import.  If you specified 
//        the correct file but are unsure about the correct value, 
//        re-execute the import command but specify VOLSIZE=0. 
#endif 
00040, 00000, "FILESIZE does not match the value used for export: %s" 
// *Cause:  The value specified for FILESIZE does not match the value specified
//        during the creation of the export file. 
// *Action: If you believe the specified FILESIZE value is correct, verify 
//	  that you specified the correct file for import.  If you specified 
//        the correct file but are unsure about the correct value, 
//        re-execute the import command but specify FILESIZE=0. 
00041, 00000, "Warning: object created with compilation warnings"
// *Cause:  The object in the SQL statement following this error was created 
//          with compilation errors. If this error occurred for a view, it 
//          is possible that the base table of the view was missing.
// *Action: This is a warning. The object may have to be recompiled before 
//          being used.
00042, 00000, "CHARSET used, but the export file has specific character set"
// *Cause:  The user requested that a specific character set be used to 
//          process an export file that has a specific embedded character 
//          set ID. The ID in the export file is accurate and should be used.
// *Action: Remove the CHARSET keyword from the command line.
00043, 00000, "export file character set inconsistent"
// *Cause:  The character set of the export file and the environment character 
//          set (or the character set specified with the CHARSET keyword) 
//          are inconsistent. One character set is ASCII-based while the other 
//          is EBCDIC based.
// *Action: Specify the correct character set with the CHARSET keyword.
00044, 00000, "unable to allocate enough memory for statement"
// *Cause:  Import was unable to allocate sufficient memory to read in the 
//	specified statement and execute it.
// *Action: Increase the allocation for database buffers, restart the 
//          instance, and reexecute the Import command.
#ifdef EXU_VOLSIZE 
00045, 00000, "using VOLSIZE value from export file of %s" 
// *Cause:  Either you did not specify the VOLSIZE parameter in your 
//          IMPORT command, or you specified VOLSIZE=0 and the export was 
//          created with a non-zero value for VOLSIZE. Import will use the
//	    value specified in the export file. 
// *Action: None required. 
#endif 
00046, 00000, "using FILESIZE value from export file of %s" 
// *Cause:  Either you did not specify the FILESIZE parameter in your 
//          IMPORT command, or you specified FILESIZE=0 and the export file
//	    was created with a non-zero value for FILESIZE. Import will use 
//	    the value specified in the export file. 
// *Action: None required. 
00047, 00000, "unexpected file sequence number; expected %u but found %u" 
// *Cause:  The header in the export file contains a sequence number that 
//        is used to track the order in which multiple export files 
//        are written.  The first export file is assigned sequence number  
//        one, the second file is assigned sequence number two and so on. 
//        This message is displayed when a number other than the expected  
//        sequence number is found in the file header 
// *Action: Execute the import command again, but specify the files in the  
//        order in which Export wrote them. 
00048, 00000, "mismatched file header" 
// *Cause:  During verification of the 2nd or subsequent file in a multi-file export,
//        Import found header fields in the file that did not match
//        values in the first file. 
// *Action: Check the names of the files created by Export and verify that 
//        you specified them correctly for the import operation. 
00049, 00000, "Unknown language specified in CHARSET"
// *Cause:  An unknown language was listed in the CHARSET option.  
// *Action: Use a known character set.
00050, 00000, "Dump file and log file cannot be identical"
// *Cause:  Identical names were given to the dump file and log file.
// *Action: Specify different names for the dump file and log file and retry 
//          the operation.
00051, 00000, "Direct path exported dump file contains illegal column length"
// *Cause:  An invalid column length was encountered while processing column 
//          pieces."
// *Action: Check to make sure the export file is not corrupted, or else
//          report this to Oracle Worldwide Support as an Import/Export 
//          internal bug and submit the
//          export file.
00052, 00000, "Warning: Unable to set event for freelist communication with server" 
// *Cause:  An event could not be set for current the session.
// *Action: If Import fails, give the Import user ALTER SESSION PRIV and retry 
//          the operation.
00053, 00000, "Import mode incompatible with Export dump file"
// *Cause:  The specified import option is incompatible with point-in-time-
//          recovery dump file.
// *Action: Generate a proper dump file or use point-in-time-recovery import 
//          mode.
00054, 00000, "must be connected 'AS SYSDBA' to do Point-in-time Recovery or Transportable Tablespace import"
// *Cause:  The user must log in 'as SYSDBA' to perform transportable
//          tablespace imports or Point-In-Time Recovery imports.
// *Action: Ask your database adminstrator to perform the Transportable 
//          Tablespace import or the Tablespace Point-in-time Recovery import.
00055, 00000, "Warning: partition or subpartition \"%s\":\"%s\" not found in export file"
// *Cause:  A partition or subpartition name was specified that does not exist in 
//          export file.
// *Action: Check to make sure the partition or subpartition name belongs to the table.
#ifdef EXU_VOLSIZE 
00056, 0000, "multiple devices specified for tape input"
// *Cause:  You specified multiple file names when doing an import from a tape
//	    device.  Import uses the same device for reading all tapes, 
//	    regardless of the number of tape volumes required.  For this 
//	    reason, export will accept only one value for the FILE parameter
//	    when writing to tape.
// *Action: Reenter the IMPORT command, but specify only one tape device in
//	    the FILE parameter.
#endif
00057, 00000, "Warning: Dump file may not contain data of all partitions of this table"
// *Cause:  The dump file used for this Table Import might not contain all 
//          of the data belonging to the exported table.
// *Action: Check to see if the export was done as intended, or try performing 
//          a Partition Import.
/ do NOT translate or document message 58 - it is never displayed
// NLS_DO_NOT_TRANSLATE [58,58]
00058, 00000, "placeholder for OCI error "
// *Document: NO
// *Cause:  filler
// *Action: filler
00059, 00000, "Failure to initialize parameter manager"
// *Cause:  Parameter manager failed in initialization.
// *Action: Report this to Oracle Worldwide Support as an Import internal bug.
00060, 00000, "Warning: Skipping table \"%s\".\"%s\" because object type \"%s\".\"%s\"  does not exist or has different identifier"
// *Cause:  An object type needed by the table, either does not exist on the 
// *        target system or, if it does exist, it has a different object 
//          identifier.
// *Action: Create the object type on the target system with a valid
// *        identifier.
00061, 00000, "Warning: Object type \"%s\".\"%s\" already exists with a different identifier"
// *Cause:  An object type cannot be created because it already exists on the 
// *        target system, but with a different identifier
// *Action: Drop the object type from the target system and retry the 
//          operation. 
00062, 00000, "Warning: The identifier on the dump file for object type \"%s\".\"%s\" is invalid"
// *Cause:  The character string representing the object type's identifier
// *        could not be converted to an object identifier.
// *Action: Internal error.
00063, 00000, "Warning: Skipping table \"%s\".\"%s\" because object type \"%s\".\"%s\" cannot be created or has different identifier"
// *Cause:  An error occurred creating an object type that is used by the
// *        table.
// *Action: Examine the import log to determine why the object type could not
// *        be created.  If the object type already existed, with a
// *        different object identifier, then drop the object type and
// *        retry the import.
00064, 00000, "Definition of LOB was truncated by export"
// *Cause:  While producing the dump file, Export was unable to write the
// *	    entire contents of a LOB.  Import is therefore unable to 
// *        reconstruct the contents of the LOB. The remainder of the
// *	    import of the current table will be skipped.
// *Action: Delete the offending row in the exported database and retry the
// *	    export.
00065, 00000, "Import is unable to recreate lobs within objects."
// *Cause:  An error occurred recreating a LOB within an imported object.
// *Action: Report this to Oracle Worldwide Support as an Import internal 
//          error.
00066, 00000, "Missing NLS_CHARACTERSET  in props$"
// *Cause:  No value for NLS_CHARACTERSET  in props$.
// *Action: Contact Worldwide support.
00067, 00000, "Could not convert to server character set's handle"
// *Cause:  Internal error.
// *Action: Contact Worldwide support.
00068, 00000, "Could not find environment national character set"
// *Cause:  An environment national character set was specified that was
//          not recognized by the Import utility.
// *Action: Ensure that the spelling of the national character set 
//          specified in the environment variable NLS_NCHAR is correct.
00069, 00000, "Could not convert to environment national character set's handle"
// *Cause:  Internal error..
// *Action: Contact Worldwide support.
00070, 00000, "Lob definitions in dump file are inconsistent with database."
// *Cause:  The number of LOBS per row in the dump file is different than the
// *	    number of LOBS per row in the table being populated.
// *Action: Modify the table being imported so that it matches the column
// *        attribute layout of the table that was exported.
00071, 00000, "Object identifier of imported table mismatches object identifier of existing table"
// *Cause:  An attempt was made to import data into a table that was recreated
//          under a different object identifier than the object identifier 
//          used for the exported object table.  
//          Under this situation, REF's to this table that are contained 
//          within the dump file will also be invalid.
// *Action: Drop the offending object table prior to import.
00072, 00000, "Warning: The object table's object identifier is invalid."
// *Cause:  The character string representing the table's object identifier
//          could not be converted to an internal object identifier.
// *Action: Internal error.
00073, 00000, "FILE locator \"%.*s\" \"%.*s\" is truncated to \"%.*s\" \"%.*s\" in server character set" 
// *Cause:  The conversion of the specified directory and name strings for
//	    a file attribute or column from the export server's 
//          character set into the import server's character set
//          exceeded the maximum string lengths allowed within
//          FILE descriptors. The strings will be truncated to
//          the maximum supported lengths.
// *Action: Rename the directory aliases and external filenames to match the
//          truncated names in the specified FILE column or attribute.
00074, 00000, "The constraints flagged by ALL_CONSTRAINTS.BAD will break in 2000 A.D."
// *Cause:  Constraints exist in the data base that specify date 
//          values without fully specifying the year.  These constraints
//          could break in the year 2000 A.D.
// *Action: Query ALL_CONSTRAINTS and correct those constraints marked as
//          bad.
00075, 00000, "Warning: The nested table may contain partial rows or duplicate rows"
// *Cause:  An error occurred inserting data into an outer or inner nested
//          table.  If the error occurred in the outer table, rows are 
//          still inserted into the inner tables.  If the error occurred in 
//          an inner table, data is still inserted into the outer table and
//          other inner tables.  This can result in duplicate inner table
//          rows or partial logical rows.
// *Action: Examine the data in the tables.  Delete the incorrect rows or
//          drop the entire table and perform the import again.
00076, 00000, "Missing NLS_NCHAR_CHARACTERSET  in props$"
// *Cause:  No value for NLS_NCHAR_CHARACTERSET  in props$.
// *Action: Contact Worldwide support.
00077, 00000, "Could not convert to server national character set's handle"
// *Cause:  Internal error.
// *Action: Contact Worldwide support.
00078, 00000, "Cannot translate FILE locator to \"%.*s\" \"%.*s\" in server character set"
// *Cause:  (1) The current export dump file was generated using Beta-2 of
//	    Oracle8.0  AND (2) there was a File that appeared as an
//	    an attribute of an ADT within a table's column AND (3) the
//	    character set of the export server's database was different than
//	    the character set of the import server's database AND (4) when the
//	    filename or the aliasname of the File increased in size when it
//	    was translated to the character set of the import server.
//
//	    When all of these conditions are true, translation of the strings
//	    could yield corruption of the data in the column.  Rather than
//	    proceeding with the translation, import will leave the character
//	    strings in the File in the old character set.
// *Action: After import completes, rename the directory aliases and external
//	    filenames to match the real names used for the target database.
00079, 00000, "Warning: National character set data in this table may be incorrect"
// *Cause:  Due to a problem in 8.0.2 Export, national character data in 
//          NCHAR and NVARCHAR2 columns was incorrectly assumed to be in
//          the export server's data base character set and was converted
//          to the export client's data base character set.  This conversion
//          would only be correct if the export server's data base character
//          set was the same as the export server's national character set
//          and the export client's data base character set was the same as
//          the export client's national character set.  All other combinations
//          would likely be incorrect.  This export dump file was generated
//          by 8.0.2 Export and the export client and server characater sets
//          did not fit that criteria.
// *Action: Examine the national character data. If incorrect, update the
//          data with correct data.
00080, 00000, "Error during character conversion of long column or long command"
// *Cause:  During piecewise character conversion of the data in a long
//          column or of a long command, a fatal conversion error 
//          occurred.  Either character truncation occurred or an invalid
//          character set handle was used.
// *Action: Retry the import with a different character set.
00081, 00000, "attempt to free unallocated memory"
// *Cause:  An attempt was made to free memory that was not allocated.
// *Action: Contact Oracle Worldwide Support
00082, 00000, "Error during conversion ROWID from string format to internal"
// *Cause:  An error occured while attempting to to convert a ROWID from an 
//          export dump file into an internal format.
// *Action: Report this to Oracle Worldwide Support as an Import internal 
//          error.
00083, 00000, "dump file does not contain an incremental export"
// *Cause:  An incremental import was requested and the dump file specified 
//          for the import command is either a user or table export.
// *Action: Reissue the command import command but specify the name of a dump
//          file containing an incremental export.
00084, 00000, "attempt to mix incremental import with user or table import"
// *Cause:  An incremental import was requested along with the FROMUSER,
//          TOUSER, or TABLE qualifier.  An incremental import cannot be 
//          done if any of these other qualifiers are also specified.
// *Action: Determine whether you want to do an incremental import, full 
//	    import, user import or table import and reissue the import command
//	    with the appropriate qualifiers.
00085, 0000, "multiple input files specified for unbounded export file"
// *Cause:  You specified multiple file names for the FILE parameter when
//	    doing an import, but the header in the export file indicates that
//	    that the export operation could create only one file.  Specifying
//	    multiple file names is valid for an import operation only if the
//	    export files were created by an export operation in which the user
//	    specified a non-zero value for the FILESIZE parameter.
// *Action: If you believe the export contains multiple files, verify that
//	    you have specified the correct files.  If you believe the export
//	    should be in only one file then try the import operation again,
//	    but specify only one value for the FILE parameter.
00086, 00000, "TOID \"%s\" not found in export file"
// *Cause:  Import did not find the type identification specified 
//          in the TOID_NOVALIDATE parameter. The specified type 
//          identification does not exist in export file.
// *Action: Correct or omit the TOID_NOVALIDATE parameter.
00087, 00000, "Problem with internal hash table of schema/table names"
// *Cause:  Most likely a problem with allocating memory for the hash
//          table entries.
// *Action: Contact Oracle Worldwide Support
00088, 00000, "Problem importing metadata for index %s. Index creation will be skipped"
// *Cause:  Domain indexes import private metadata via anonymous PL/SQL blocks
//	  prior to the CREATE INDEX statement. The execution of one of these
//        PL/SQL blocks failed. Because the metadata is considered an integral
//        part of the index, the subsequent CREATE INDEX statement was skipped.
// *Action: Contact the developer of the index's implementation type. If this
//	  is an Oracle-supplied index (perhaps via a data cartridge), contact
//	  Oracle Worldwide Support.
00089, 00000, "Fine grain policy \"%s\" not recreated on table/view \"%s\" "
// *Cause:  Import user fails to recreate fine grained policies of the
//	    table/view being imported. To recreate the policy, the user doing
//          the import needs execute privilege on the package DBMS_RLS for
//          access policies or DBMS_FGA for audit policies.
// *Action:  Ask the database administrator to perform the export/import of
//	     this table/view.
00090, 00000, "Unexpected DbmsJava error %d at step %u while creating %s"
// *Cause:  The error was returned from a call to a DbmsJava procedure.
// *Action: Record the accompanying messages and report this as an Import 
//          internal error to customer support. 
00091, 00000, "Above error occurred on the following function and object: %s. Remaining PL/SQL blocks for this object will be skipped."
// *Cause: An error occurred while executing a PL/SQL block that implements the
//	DDL for the named function and procedural object. A procedural object
//	is one whose DDL is implemented as stored procedures rather than as
//	standard SQL statements.
// *Action: Contact Oracle Worldwide Support so they may determine the
//	development group responsible for the package that failed. 
00092, 00000, "Java object \"%s\".\"%s\" already exists, cannot be created"
// *Cause:  Import failed to create the Java source, class or resource object
//          because it already exists. 
// *Action: Drop the object type from the target system and retry the 
//          operation. 
00093, 00000, "Inconsistency between dumpfile constraint definition for table %s with columns (%s)"
// *Cause: Import failed to locate a base table for a constraint that was
//	   defined in the dump file and statistics were not imported.
// *Action: Check to see if the table and constraint exist. If the table and
//	    constraint exist, then report this to Oracle Support Services as
//          an Import internal error.
00094, 00000, "Warning: The identifier on the dump file for object type \"%s\".\"%s\" is invalid"
// *Cause:  The character string representing the object type's identifier
// *        could not be converted.
// *Action: Contact Oracle Worldwide Support.
00095, 00000, "Resumable parameters ignored -- current session not resumable"
// *Cause: Current session is not resumable.
// *Action: Must specify RESUMABLE=Y to enable resumable session in order for
//          the RESUMABLE_NAME and RESUMABLE_TIMEOUT parameters to take effect.
00096, 00000, "Warning: Skipping table \"%s\".\"%s\" because type synonym \"%s\".\"%s\" cannot be created"
// *Cause:  An error occurred creating a synonym for a type that is used by the
// *        table.
// *Action: Examine the import log to determine why the type synonym could
// *        not be created. If the synonym already existed, but is not
// *        needed, then drop the synonym and retry the import. If the
// *        synonym is PUBLIC but the importer does not have the
// *        CREATE PUBLIC SYNONYM system privilege, then the import must
// *        be done by someone possessing that privilege, or the importer
// *        must be granted the privilege.
00097, 00000, "\nSTREAMS_CONFIGURATION=Y ignored, only valid with FULL=Y"
// *Cause: STREAMS_CONFIGURATION=Y can only be used 
// *       when FULL=Y is present on the command line
// *Action: Remove conflicting command arguments
00098, 00000, "INTERNAL ERROR: %s"
// *Cause:  An INTERNAL error occurred.
// *Action: Contact Oracle Worldwide Support.
00099, 00000, "Warning: The typeid in the dump file for object type \"%s\".\"%s\" is invalid"
// *Cause:  The character string representing the object type's identifier
// *        could not be converted.
// *Action: Contact Oracle Worldwide Support.
/
/ Informative messages
/
/   Do NOT translate message 100
// NLS_DO_NOT_TRANSLATE [100,100]
00100, 00000, "Import"
// UI[101,146]
00101, 00000, "\nConnected to: %s\n"
00102, 00000, "\n. . importing table%*.*s%*.*s"
00103, 00000, "%11lu rows imported"
00109, 00000, "\n\nWarning: the objects were exported by %s, not by you\n"
00110, 00000, "\nImport terminated successfully without warnings.\n"
00111, 00000, "\nColumn %lu %.*s"
00112, 00000, "\n. importing %s's objects into %s"
00113, 00000, "\nExport file created by %s"
00114, 00000, "\n. . skipping table %-35.*s"
00115, 00000, "\n. importing user %-35s"
00116, 00000, "\nSystem error message"
00117, 00000, "\nNote: table contains ROWID column, values may be obsolete"
00118, 00000, "\nImport terminated successfully with warnings.\n"
00119, 00000, "\nWriting all labels to %s\n"
00120, 00000, "\n%61lu rows imported"
00121, 00000, "\nExport file created by %s via conventional path"
00122, 00000, "\nExport file created by %s via direct path"
00123, 00000, "\nColumn : %.*s"
00124, 00000, "\nAbout to import Tablespace Point-in-time Recovery objects..."
00125, 00000, "\n. . importing partition%*.*s%*.*s"
00126, 00000, "\n. . skipping partition %-35.*s"
00127, 00000, "\nAbout to enable constraints..."
00128, 00000, "\nimport done in %s character set and %s NCHAR character set"
00129, 00000, "\nimport server uses %s character set (possible charset conversion)"
00130, 00000, "\nexport client uses %s character set (possible charset conversion)"
00131, 00000, "\nexport server uses %s NCHAR character set (possible ncharset conversion)"
00132, 00000, "first file in the multi-file export is %*s"
00133, 00000, "\n. . skipping TOID validation on type %s.%s"
00134, 00000, "\nAbout to import transportable tablespace(s) metadata..."
00135, 00000, "\n. . importing subpartition%*.*s%*.*s"
00136, 00000, "\n. . skipping subpartition %-35.*s"
/ Message 137 is unused. 
00138, 00000, "\nNote: RECORDLENGTH=%lu truncated to %lu\n"
/ The following messages are used by the undocumented METRICS facility.
00139, 00000, "\n\nTotals for tables"
00140, 00000, "\n\nTotals for database"
/ Messages 141 thru 144 should all be the same length and right aligned with respect to other messages in the log.
00141, 00000, "\n        Rows    = %10Ld Elapsed Time = %02ld:%02ld:%02ld:%02ld  CPU Time = %02ld:%02ld:%02ld:%02ld"
00142, 00000, "\n  Total Rows    = %10Ld Elapsed Time = %02ld:%02ld:%02ld:%02ld  CPU Time = %02ld:%02ld:%02ld:%02ld"
00143, 00000, "\n        Objects = %10Ld Elapsed Time = %02ld:%02ld:%02ld:%02ld  CPU Time = %02ld:%02ld:%02ld:%02ld"
00144, 00000, "\n  Total Objects = %10Ld Elapsed Time = %02ld:%02ld:%02ld:%02ld  CPU Time = %02ld:%02ld:%02ld:%02ld"
00145, 00000, "\n  %10Ld Buffer Reads of %10Ld bytes = %10.3f Kbytes read"
00146, 00000, "\n  Throughput = %10.3f Kbytes/sec"
/ end of METRICS messages
/
/ Prompt messages
/
// UI[200,215]
00200, 00000, "\n%s (%s/%s): %s > "
00201, 00000, "\nImport file: %s > "
00202, 00000, "List contents of import file only"
00203, 00000, "Import entire export file"
00204, 00000, "\nEnter table(T) or partition(T:P) names. Null list means all tables for user"
00205, 00000, "\nEnter table(T) or partition(T:P) name or . if done: "
00206, 00000, "\nEnter insert buffer size (minimum is %lu) %lu> "
00207, 00000, "Username: "
00208, 00000, "Password: "
00209, 00000, "Ignore create error due to object existence"
00210, 00000, "Import grants"
00211, 00000, "Import table data"
00212, 00000, "\nMLS Import mapping file (default is none) "
00213, 00000, "List mapping relations"
00214, 00000, "Abort Import"
00215, 00000, "\nEnter name of the next file in the export file set."
00216, 00000, "Import data only"
#ifdef EXU_VOLSIZE
/
/ prompt for volsize
/
// UI[298,299]
00298, 00000, "\nVolume size (<ret> for no restriction) > "
00299, 00000, "\nPlease mount the next volume, and hit <ret> when you are done\n"
#endif


/
/ HELP messages, range defined as HELPSTART and HELPEND in impdef.h
/
// UI[300,340]
00300, 00000, "\n\nYou can let Import prompt you for parameters by entering the IMP\n"
00301, 00000, "command followed by your username/password:\n"
00302, 00000, "\n"
00303, 00000, "     Example: IMP SCOTT/TIGER\n"
00304, 00000, "\n"
00305, 00000, "Or, you can control how Import runs by entering the IMP command followed\n"
00306, 00000, "by various arguments. To specify parameters, you use keywords:\n"
00307, 00000, "\n"
00308, 00000, "     Format:  IMP KEYWORD=value or KEYWORD=(value1,value2,...,valueN)\n"
00309, 00000, "     Example: IMP SCOTT/TIGER IGNORE=Y TABLES=(EMP,DEPT) FULL=N\n"
00310, 00000, "               or TABLES=(T1:P1,T1:P2), if T1 is partitioned table\n"
00311, 00000, "\n"
00312, 00000, "USERID must be the first parameter on the command line.\n"
00313, 00000, "\n"
00314, 00000, "Keyword  Description (Default)       Keyword      Description (Default)\n"
00315, 00000, "--------------------------------------------------------------------------\n"
00316, 00000, "USERID   username/password           FULL         import entire file (N)\n"
00317, 00000, "BUFFER   size of data buffer         FROMUSER     list of owner usernames\n"
00318, 00000, "FILE     input files (EXPDAT.DMP)    TOUSER       list of usernames\n"
00319, 00000, "SHOW     just list file contents (N) TABLES       list of table names\n"
00320, 00000, "IGNORE   ignore create errors (N)    RECORDLENGTH length of IO record\n"
00321, 00000, "GRANTS   import grants (Y)           INCTYPE      incremental import type\n"
00322, 00000, "INDEXES  import indexes (Y)          COMMIT       commit array insert (N)\n"
00323, 00000, "ROWS     import data rows (Y)        PARFILE      parameter filename\n"
00324, 00000, "LOG      log file of screen output   CONSTRAINTS  import constraints (Y)\n"
00325, 00000, "DESTROY                overwrite tablespace data file (N)\n"
00326, 00000, "INDEXFILE              write table/index info to specified file\n"
00327, 00000, "CHARSET                character set of export file (NLS_LANG)\n"
00328, 00000, "SKIP_UNUSABLE_INDEXES  skip maintenance of unusable indexes (N)\n"
00329, 00000, "FEEDBACK               display progress every x rows(0)\n"
00330, 00000, "TOID_NOVALIDATE        skip validation of specified type ids \n" 
00331, 00000, "FILESIZE               maximum size of each dump file\n"
00332, 00000, "STATISTICS             import precomputed statistics (always)\n"
00333, 00000, "RESUMABLE              suspend when a space related error is encountered(N)\n"
00334, 00000, "RESUMABLE_NAME         text string used to identify resumable statement\n"       
00335, 00000, "RESUMABLE_TIMEOUT      wait time for RESUMABLE \n"
00336, 00000, "COMPILE                compile procedures, packages, and functions (Y)\n"
00337, 00000, "STREAMS_CONFIGURATION  import streams general metadata (Y)\n"
00338, 00000, "STREAMS_INSTANTIATION  import streams instantiation metadata (N)\n"
00339, 00000, "DATA_ONLY              import only data (N)\n"
00340, 00000, "VOLSIZE                number of bytes in file on each volume of a file on tape\n"
// UI[360,364]
00360, 00000, "\nThe following keywords only apply to transportable tablespaces\n"
00361, 00000, "TRANSPORT_TABLESPACE import transportable tablespace metadata (N)\n"
00362, 00000, "TABLESPACES tablespaces to be transported into database\n"
00363, 00000, "DATAFILES datafiles to be transported into database\n"
00364, 00000, "TTS_OWNERS users that own data in the transportable tablespace set\n"
/
/ Error messages (continued from 000 - 099)
/
00400, 00000, "Warning: Object type \"%s\".\"%s\" already exists with a different typeid"
// *Cause:  An object type could not be created because it already existed on the 
// *        target system, but with a different typeid
// *Action: Drop the object type from the target system and retry the 
//          operation. 
00401, 00000, "dump file \"%s\" may be an Data Pump export dump file"
// *Cause:  A dump file was specified for an import operation which appears
//          to have been created using the Data Pump export utility. These
//          dump files cannot be processed by the original import utility.
// *Action: Try using the Data Pump import utility to process this dump file.
00402, 00000, "Invalid parameter \"%s\" with data_only mode"
// *Cause:  Parameter provided along data_only is invalid.
// *Action: Remove the invalid parameter from command line.
