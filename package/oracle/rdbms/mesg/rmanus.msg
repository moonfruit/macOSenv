/ Copyright (c) 1995, 2008, Oracle Corporation.  All rights reserved.
/
/ $Header: rdbms/mesg/rmanus.txt /main/343 2009/06/16 17:39:35 molagapp Exp $
/
/ Recovery Manager Error Message File
/
/    MODIFIED (MM/DD/YY)
/    molagapp  06/03/09 - remove flash reference
/    fsanchez  02/24/09 - remove 5508, add 8592
//   molagapp  03/20/09 - use repository instead of recovery catalog
/    molagapp  03/17/09 - add 6810, 6811, 6812
/    molagapp  02/24/09 - add 8062
/    molagapp  02/05/09 - change 8137
/    raguzman  11/25/08 - Fix up message 05535
/    fsanchez  09/24/08 - Bug 7609598
/    swerthei  10/05/08 - bug 7119336 - parallelize backup backupset
/    molagapp  10/08/08 - add 6602, 6603
/    fsanchez  07/11/08 - add 6966
/    fsanchez  07/15/08 - Resumable duplicate
/    fsanchez  07/11/08 - add 6965
/    banand    08/08/08 - add 6787, bug-6459358
/    molagapp  07/03/08 - add 6959
/    fsanchez  06/25/08 - Modify 5537
/    banand    06/24/08 - add 6898, bug-6745130
/    fsanchez  05/25/08 - add 6809
/    fsanchez  05/19/08 - bug 1690875
/    fsanchez  05/02/08 - add 5053
/    mjstewar  04/04/08 - 6141459: Add flashback cf message
/    fsanchez  03/29/08 - add messages for YES and NO
/    molagapp  12/19/07 - add 6957
/    fsanchez  10/16/07 - project 2042
/    fsanchez  03/10/08 - add 2012
/    fsanchez  02/29/08 - bug 5554064 - messages for offlining datafiles
/    wfisher   02/11/08 - Create incompatible option message
/    jkrismer  11/13/07 - bug 5877659 add KRMR 5062
/    molagapp  09/13/07 - add 8107
/    fsanchez  02/10/07 - move keywords into krmi2.h
/    molagapp  03/02/07 - add 7221 and 7222
/    molagapp  01/12/07 - add skip readonly
/    molagapp  02/29/07 - rename remote archived log to foreign archived log
/    molagapp  12/01/06 - add skip readonly
/    banand    11/28/06 - bug 5620103
/    molagapp  12/22/06 - add 7262
/    raguzman  11/28/06 - fixup duplicate message text
/    molagapp  11/28/06 - New Remote Archivelog messages
/    banand    11/07/06 - correct 20108 message
/    raguzman  11/01/06 - New SRL messages
/    molagapp  09/29/06 - add 5533, 6956, 7530
/    raguzman  10/23/06 - auxiliary needs net service name
/    swerthei  06/26/06 - generalize 6596 
/    molagapp  10/22/06 - change 6169 to warning message
/    banand    09/10/06 - bug 5441981
/    raguzman  10/02/06 - No duplicate if mounted fuzzy
/    raguzman  08/09/06 - AUXILIARY FORMAT only with image copies
/    molagapp  09/12/06 - bug-5339923
/    fsanchez  08/29/06 - add 20038 and 20045
/    sdizdar   07/06/06 - bug-5377122: add syntax for configure compression 
/                         algorithm 
/    molagapp  08/23/06 - add new IDR messages
/    raguzman  08/07/06 - Correct list restore point dates
/    fsanchez  07/21/06 - bug 4720762 - message to indicate that header
/                         update will be performed
/    molagapp  07/31/06 - change 5055 and 5054, add 5060
/    molagapp  07/15/06 - add 6805
/    fsanchez  02/15/06 - project 2127 - undo optimization 
/    molagapp  05/12/06 - add 5054
/    molagapp  07/06/06 - add remote
/    molagapp  05/12/06 - IDR integration
/    raguzman  06/09/06 - Add LIST RESTORE POINT 
/    raguzman  05/23/06 - Change TOPAZ message base from 9000 to 60000 
/    raguzman  05/18/06 - Add GUARANTEE keyword 
/    raguzman  04/11/06 - Add error for RMAN variables and KRMPPVARLIST_
/    banand    06/11/06 - 17844_phase_3: add more msgs
/    amjoshi   06/06/06 - Add 6613 (db_unique_name connect identifier 
/                         missing). 
/    molagapp  05/25/06 - improve block corruption project
/    vpantele  05/23/06 - add flashback log search messages 
/    swerthei  10/11/05 - virtual private catalog
/    raguzman  05/23/06 - Change TOPAZ message base from 9000 to 60000 
/    raguzman  05/04/06 - Add no set until support for duplicate active db 
/    raguzman  04/18/06 - Add parameter_value_convert syntax 
/    raguzman  03/09/06 - Add ACTIVE token 
/    swerthei  04/18/06 - multi-section backups
/    banand    05/09/06 - 17844_phase_2: more msgs
/    molagapp  02/05/06 - add 20055
/    banand    04/18/06 - proj 17852 - log management in standby env, new msgs
/    molagapp  04/22/06 - add validate header messages
/    molagapp  04/12/06 - Project IDR
/    molagapp  04/24/06 - merge catalog project
/    banand    10/24/05 - add db_unique_name to relevant msgs
/    fsanchez  12/16/05 - add resync reasons
/    fsanchez  01/03/06 - improve message readability
/    molagapp  10/11/05 - add 5529
/    banand    09/30/05 - bug-4637849
/    fsanchez  06/04/04 - Duplicate Tablespace
/    molagapp  08/24/05 - fix 8612
/    molagapp  06/08/05 - add 8553 and 8554
/    fsanchez  07/06/05 - Add more restore failover messages
/    banand    05/10/05 - messages for RMAN encrypted backups
/    fsanchez  04/25/05 - add message for backup validation failure
/    fsanchez  04/23/05 - New message 1009 for syntax errors
/    molagapp  04/21/05 - add 8609
/    banand    04/14/05 - bug 4307379
/    raguzman  03/18/05 - Fix descriptions for 6157 & 6158 
/    molagapp  03/23/05 - add 6757, 6758, 6759, 6760, 6761, 7529
/    ssamaran  03/21/05 - bug-4031420 - add 8606
/    fsanchez  03/16/05 - Message for bug fixes
/    molagapp  02/16/05 - change controlfile to control file
/    molagapp  02/16/05 - change datafilecopy to datafile copy
/    wyang     02/02/05 - bug 4160600 
/    molagapp  02/03/05 - add 4017
/    banand    12/16/04 - define new message for cf record reusing 
/    molagapp  01/13/05 - add 8605
/    fsanchez  12/21/04 - bug 4011012
/    fsanchez  12/17/04 - bug 2316696 - add 5520
/    banand    12/11/04 - bug 3672710 
/    molagapp  11/06/04 - remove 5508, 5509
/    molagapp  11/09/04 - add 8603, 8604
/    raguzman  11/15/04 - Fix error text for 8137 
/    ssamaran  10/29/04 - bug-3569601: backup of SPFILE cancelled message 
/    banand    10/12/04 - bug-3941823
/    ssamaran  09/17/04 - bug-3349695
/    banand    09/30/04 - bug 3347839 
/    ssamaran  09/20/04 - change error 6533 
/    fsanchez  08/24/04 - bug 2794801
/    wyang     09/23/04 - fix transportable db error messages 
/    fsanchez  09/14/04 - bug 3879374
/    ssamaran  09/09/04 - checksyntax with a cmdfile 
/    molagapp  08/13/04 - add 20212
/    molagapp  08/01/04 - add 8552
/    molagapp  07/29/04 - add 8137
/    ssamaran  07/12/04 - bug-3552631
/    molagapp  07/09/04 - add 7523, 7524, 7525, 7526, 7527, 7528
/    molagapp  05/12/04 - add 6749, 6754, 6755, 6756
/    ssamaran  05/18/04 - change polling for grid support 
/    fsanchez  03/26/04 - bug-3114392 
/    htran     03/16/04 - clone tablespace messages
/    wyang     03/10/04 - transport db 
/    molagapp  04/21/04 - tempfile re-creation project
/    jeffyu    02/24/04 - bug 3072699 (removing 8024, 8055, 8098, 8107)
/    jeffyu    02/19/04 - bug 2149105
/    fsanchez  02/21/04 - bug-3408643 
/    fsanchez  02/10/04 - bug-3418211 
/    molagapp  02/18/04 - lock name space -> database unique name
/    molagapp  02/12/04 - bug 3310413 - change 6185 to display patch version
/    fsanchez  01/30/04 - bug-3144422 
/    fsanchez  01/29/04 - bug-3350037 
/    ssamaran  01/30/04 - bug-3349778 - alert.log is misspelled in rman-7519
/    fsanchez  09/18/03 - rem_sp_name_grammar 
/    sjeyakum  08/25/03 - add elapsed time to restore, bug 3072699
/    molagapp  08/25/03 - incorporate comments
/    molagapp  07/03/03 - change 6558, 6561, 6562
/    molagapp  07/08/03 - remove 6749
/    nsadaran  08/14/03 - bug-3079386 
/    fsanchez  05/09/03 - bug-2933117
/    molagapp  07/23/03 - add 6751: bug-3060853
/    sdizdar   07/19/03 - fix messages
/    banand    07/18/03 - bug 2108350 : clarify 6054 message
/    molagapp  07/17/03 - make 5017 as normal message
/    sdizdar   06/18/03 - bug-2966982
/    molagapp  06/04/03 - fix 6426 
/    sdizdar   05/30/03 - modify 7517
/    banand    05/15/03 - add 5021
/    fsanchez  05/27/03 - fix_messages
/    molagapp  05/28/03 - add 6750
/    nsadaran  05/28/03 - restore scheduling
/    molagapp  03/29/03 - add 7522
/    fsanchez  05/13/03 - bug-2941577
/    molagapp  04/28/03 - add 6578, change 5017, 5019 and remove 5021, 5022
/    jeffyu    03/12/03 - adding keywords for recover
/    fsanchez  12/19/02 - enhanced_scripts
/    banand    01/24/03 - add restore preview node
/    molagapp  04/21/03 - Change 6463, 6747, 6748. Add 6458, 6460, 6461  
/    banand    01/27/03 - add backup/copy throttle options, and messages
/    sdizdar   02/27/03 - modify 6902
/    sdizdar   01/23/03 - prj 2090 (backup compression): 
/                         - add COMPRESSED keyword,
/                         - change list messages
/                         - add msg 6901 and 6609 
/    molagapp  04/14/03 - add 5021, 5022, 8136
/    nsadaran  02/11/03 - datafilecopy duplicate handling
/    fsanchez  02/16/03 - bug-2800271
/    molagapp  02/28/03 - add 7521, modify 6426
/    sdizdar   03/05/03 - add 7520
/    banand    02/05/03 - remove 6152
/    sdizdar   12/12/02 - add START keyword
/    fsanchez  01/29/03 - bug-2774555
/    molagapp  01/06/03 - remove 6750
/    fsanchez  01/06/03 - bug-2624658
/    banand    01/08/03 - add 6899 for automatic resetdb
/    fsanchez  09/05/02 - automate_tspitr
/    fsanchez  11/26/02 - lrg_1125
/    molagapp  12/06/02 - add 6750
/    molagapp  11/20/02 - add 6749, 8591, configure archivelog deletion policy
/    fsanchez  11/20/02 - lrg_1108
/    swerthei  10/13/02 - spelling errors
/    fsanchez  09/27/02 - multiple_file_copy_2
/    banand    09/25/02 - channel failover messages
/    sdizdar   09/15/02 - add 8133, 8134, 6585-6587
/    sdizdar   09/30/02 - add 6900 and 6901, modify 10003 and 10004
/    molagapp  08/06/02 - recovery area project
/    jeffyu    10/02/02 - adding OPEN RESTRICTED option for DUPLICATE
/    fsanchez  10/03/02 - convert_phase2
/    banand    07/31/02 - recovery through resetlogs prj : add seq no to 
/                         msg 6054
/    nsadaran  10/08/02 - adding error code for conflicting backup operands
/    sdizdar   08/20/02 - add 465-469, 7500-7520, 8545-8550, 
/    fsanchez  09/09/02 - apareek_xplatform_transport_1
/    molagapp  05/23/02 - add 5017, 5018, 5019, 8131, 8546
/    sdizdar   05/22/02 - add 38, 171, and 408 keywords, add msgs 6732-6741
/    banand    04/02/02 - create datafile msg changes
/    molagapp  12/30/01 - add 5016, 8129, 8130
/    fsanchez  04/24/02 - multiple_file_copy
/    molagapp  08/19/02 - add 8545
/    molagapp  04/17/02 - remove 6417, add proxy archived log messages
/    molagapp  01/04/02 - add 6209, 8127, 8128
/    mjaeger   12/18/01 - bug 1885412: 6197, 6198: %13lu => %13s
/    swerthei  12/10/01 - add CHARSET
/    molagapp  12/10/01 - fix 6143
/    fsanchez  08/29/01 - bug-1958504
/    mjaeger   11/15/01 - bug 1843698: add 6565 for retry
/    molagapp  11/06/01 - add 8119
/    mjaeger   09/21/01 - bug 1819338: add 8118 for DELETE INPUT failure
/    banand    10/08/01 - remove 20038: server AUTOBACKUP uses maxpiecesize
/    sdizdar   10/17/01 - bug-2059184: add 395, 6536
/    sdizdar   10/08/01 - modify 6188
/    sdizdar   10/12/01 - add 6063
/    molagapp  09/26/01 - add 6060, 6061
/                         - warning messages in upper case
/                         - warning messages in severity 3
/    sdizdar   08/31/01 - SPFILE backup:
/                         - add 463, 5012, 6332, 6509, 6535, 6563, 6729, 6730,
/                           7000-7004, 8113-8116, 8541, 6062
/                         - modify 6488, 6490, 6493, 8534-8538
/    fsanchez  09/24/01 - fix_lrgs_0921
/    molagapp  07/29/01 - add 6729
/    banand    09/19/01 - suppress 10032 msg only
/    molagapp  09/18/01 - add 8099
/    banand    09/05/01 - bug-1967858
/    molagapp  07/02/01 - add 6726, 6727, 6728, 12017
/    sdizdar   07/20/01 - simple archivelog space management during recovery:
/                         - add MAXSIZE keyword
/                         - add 6557, 6558, 6559, 6560, 6561 & 6562
/    molagapp  08/13/01 - add Size to 6380, 6383
/    banand    08/14/01 - bug 1929070: add 5010, 5011 msgs
/    fsanchez  07/12/01 - bug-1874815
/    swerthei  07/24/01 - add 10040
/    molagapp  07/24/01 - bug 1900314
/    banand    07/12/01 - error stack cleanup
/    swerthei  07/16/01 - 9.0.2 factoring
/    molagapp  07/13/01 - add 6398
/    sdizdar   06/21/01 - bug-1757981: add 6555, 6556
/    fsanchez  05/29/01 - dup_exclude
/    banand    06/19/01 - fix 1777460, add 6141.
/    fsanchez  06/19/01 - bug-1455226
/    swerthei  04/18/01 - add 6554
/    molagapp  02/11/01 - add io
/    molagapp  03/03/01 - add 6725
/    banand    02/22/01 - Fix 1653661
/    fsanchez  02/08/01 - new_rman_msgs
/    molagapp  12/17/00 - remove 6505, 6461
/    molagapp  01/09/01 - add 5009
/    dbeusee   10/04/00 - bug-1417768
/    swerthei  08/03/00 - add cmdline help for pipe, timeout
/    fsanchez  05/05/00 - control file AUTOBACKUP
/    dbeusee   09/19/00 - list_msg_tweaks
/    banand    08/21/00 - nocatalog default, message 6172 no more needed
/    dbeusee   04/26/00 - rman82_maint_syntax_unification
/    fsanchez  07/28/00 - bug-1339583
/    molagapp  07/20/00 - add 6716
/    dbeusee   07/11/00 - rman82_messages
/    dbeusee   07/18/00 - rman82_debug_enhancements
/    fsanchez  08/04/00 - backup_flat_files
/    molagapp  08/18/00 - fix 6716 message
/    banand    08/16/00 - use target configuration for clone
/    fsanchez  08/16/00 - last_rman_msgs
/    fsanchez  08/04/00 - backup_flat_files
/    sdizdar   07/27/00 - show all and misc improvement:
/                         - add 6605, 6606
/                         - remove 6288, 6523, 6458
/                         - add unlimited keyword
/                         - change RECOVERABLE/UNRECOREVABLE to LOGS/NOLOGS
/    dbeusee   08/15/00 - rman82_mesgs_drop2: rman82_messages
/    dbeusee   08/15/00 - rman82_mesgs_drop2: rman82_debug_enhancements
/    dbeusee   08/15/00 - rman82_mesgs_drop2: rman82_maint_syntax_unification
/    molagapp  08/14/00 - add 6717
/    banand    08/10/00 - configure device type updates
/    molagapp  07/20/00 - add 6716
/    sdizdar   06/29/00 - Configure auxfilename & exclude tablespace:
/                         - add keyword for exclude and noexclude
/                         - removed error 6149
/                         - add messages for exclude tablespace
/    molagapp  07/17/00 - add configure optimization.
/    molagapp  06/21/00 - maxsetsize message
/    molagapp  06/08/00 - restartable backups
/    molagapp  05/31/00 - backup optimization
/    sdizdar   07/29/00 - fix difs introduced by RMAN retention policy
/    mjstewar  07/20/00 - OMF: set newname ... to new
/    sdizdar   05/11/00 - RMAN Retention Policy:
/                         - add keywords and errors for keep backup
/                         - changes to comply to Message Writing Guidelines
/    molagapp  07/11/00 - add 8111
/    fsanchez  07/19/00 - rman_messages_part2
/    swerthei  07/15/00 - add more pipe messages
/    banand    07/18/00 - add msgs for archivelog backup failover
/    banand    07/11/00 - add backup copies and rate
/    dbeusee   04/26/00 - rman82_maint_syntax_unification_msg
/    molagapp  06/23/00 - add 8110
/    sdizdar   07/13/00 - Plus archivelog:
/                         - add 6042
/                         - add PLUS keyword
/    molagapp  07/13/00 - backuppiece failover message - 8110
/    molagapp  07/13/00 - maxsetsize, restartable and backup 
/                         optimization mesg.
/    banand    06/24/00 - add maxpiecesize
/    banand    05/14/00 - configure commands for channels.
/    banand    04/10/00 - message updates for automatic channel allocation
/    dbeusee   04/20/00 - rman82_cf_status_unification
/    molagapp  04/18/00 - add bmr message
/    molagapp  04/18/00 - bmr grammar changes
/    fsanchez  03/29/00 - instantiate_standby
/    sdizdar   04/18/00 - RMAN configuration:
/                       - add keywords for retention policy configuration
/    fsanchez  05/02/00 - Add 3031 and 3032 for SET unification
/    molagapp  05/07/00 - backup backupset messages, remove 6049
/    sdizdar   02/29/00 - bug-1058508: add msg 6458 and keyword 445
/    banand    04/12/00 - remove 6042, 6141, 6022 message
/    swerthei  04/13/00 - add pipe messages
/    dbeusee   10/19/99 - xcheck_autolocate
/    swerthei  03/14/00 - add backup validate
/    molagapp  02/16/00 - bug 1186598: fix compatibility, remove 6455
/    fsanchez  Removed all comments prior to 2000 - 05/28/03
/
/
/
// NLS_DO_NOT_TRANSLATE [0000,0000]
/ blank line (see krmimsg - we don't actually fetch this msg)
0000, 1, ""

/
/ Answers to prompt messages, must be translated similar to how messages
/ 201-210 will be translated.
/
/ NLS - Message 100 is the complete answer for a positive response
0100, 1, "YES"
/ NLS - Message 101 is the shortest answer for a positive response
0101, 1, "Y"
/ NLS - Message 102 is the complete answer for a negative response
0102, 1, "NO"
/ NLS - Message 103 is the shortest answer for a negative response
0103, 1, "N"

/
/ Questions that require answer of YES or NO
/
201, 1, "Do you really want to execute the above repair (enter YES or NO)?"
// *Cause: This is a user prompt.
// *Action: Answer the question to proceed.
202, 1, "Do you want to open the database (enter YES or NO)?"
// *Cause: This is a user prompt.
// *Action: Answer the question to proceed.
203, 1, "Do you want to open resetlogs the database (enter YES or NO)?"
// *Cause: This is a user prompt.
// *Action: Answer the question to proceed.
204, 1, "Do you really want to delete the above objects (enter YES or NO)?"
// *Cause: This is a user prompt.
// *Action: Answer the question to proceed.
205, 1, "Do you really want to drop all backups and the database (enter YES or NO)?"
// *Cause:  This is a user prompt.
// *Action: Answer the question to proceed.
206, 1, "Do you really want to drop the database (enter YES or NO)?"
// *Cause: This is a user prompt.
// *Action: Answer the question to proceed.
207, 1, "Do you really want to unregister the database (enter YES or NO)?"
// *Cause:  This is a user prompt.
// *Action: Answer the question to proceed.
208, 1, "Want to unregister the database with target db_unique_name (enter YES or NO)?"
// *Cause:  This is a user prompt.
// *Action: Answer the question to proceed.
209, 1, "Do you really want to change the above failures (enter YES or NO)?"
// *Cause: This is a user prompt.
// *Action: Answer the question to proceed.
210, 1, "Do you really want to catalog the above files (enter YES or NO)?"
// *Cause: This is a user prompt.
// *Action: Answer the question to proceed.
211, 1, "Error occurred getting response - assuming NO response"
// *Cause: An error occurred reading user response.
// *Action: No action is required, this is an informational message only.
212, 1, "\"%s\" is an invalid response - please re-enter."
// *Cause: An incorrect response was entered.
// *Action: Enter a correct response.


/ Errors
/ NOTE NOTE NOTE !!! - messages with severity 3 are displayed with
/ RMAN-xxxx prefixes. For example, see 6060 message.
/
/ KRMM errors: 0550-0599
/
0550, 1, "parser package failed to load"
// *Cause:  lpmloadpkg() return an error indication.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
0551, 1, "initialization of parser package failed"
// *Cause:  The parser package initialization routine returned an error.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
0552, 1, "syntax error in command line arguments"
// *Cause:  The arguments supplied to RMAN could not be parsed, or no
//          arguments were supplied at all.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
0553, 1, "internal recovery manager package failed to load"
// *Cause:  lpmloadpkg() return an error indication.
// *Action: This message should be accompanied by other error message(s)
//         indicating the cause of the error.
0554, 1, "initialization of internal recovery manager package failed"
// *Cause:  The internal package initialization routine returned an error.
// *Action: This message should be accompanied by other error message(s)
//         indicating the cause of the error.
0555, 1, "target database connect string must be specified"
// *Cause:  The TARGET parameter was not specified.
// *Action: Supply the necessary parameter.
0556, 1, "could not open CMDFILE \"%s\""
// *Cause:  An error occurred when trying to open the file.
// *Action: Check that the file name was specified correctly and that the
//          file exists and that the user running RMAN has read permission
//          for the file.
0557, 1, "could not open MSGLOG \"%s\""
// *Cause:  An error occurred when trying to open the file.
// *Action: Check that the file name was specified correctly and that the
//          file exists and that the user running RMAN has write permission
//          for the file.
0558, 1, "error encountered while parsing input commands"
// *Cause:  The parser detected a syntax error.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
/
/ Message 559 is the prompt.  Message 560 is the termination message.
/
// UI [559]
/
0559, 1, "RMAN> "
0560, 1, "Recovery Manager complete."
/
/ Message 561 is the continuation prompt
/
// UI [561]
/
0561, 1, "%u> "
0562, 1, "username too long"
// *Cause:  The specified user name exceeds the maximum allowable username
//          length.
// *Action: Correct the username.
0563, 1, "password too long"
// *Cause:  The specified password exceeds the maximum allowable password
//          length.
// *Action: Correct the password.
0564, 1, "host data too long"
// *Cause:  The SQL*NET host connect string exceeds the maximum allowable 
//          length.
// *Action: Correct the host string.
0565, 1, "unable to read input file"
// *Cause:  An error occurred while trying to read from STDIN or from the
//          CMDFILE.
// *Action: Ensure that the cmdfile is readable.  The cmdfile must be
//          a text file with 1 line per record.
0566, 1, "could not open TRACE \"%s\""
// *Cause:  An error occurred when trying to open the file.
// *Action: Check that the file name was specified correctly and that the
//          user running RMAN has write permission for the file.
0567, 1, "Recovery Manager could not print some error messages\n"
// *Cause: An error occurred while trying to print the error message stack.
// *Action: If the associated error message indicates a condition that
//          can be corrected, do so, otherwise contact Oracle.
0568, 1, "user interrupt received"
// *Cause:  The user typed ^C or ATTN.
// *Action: No action is required.
0569, 1, "=============== ERROR MESSAGE STACK FOLLOWS ==============="
// *Cause:  This message precedes an error message stack.
// *Action: The errors are printed in last-in first-out order.  To interpret
//          them correctly, read from the bottom to the top.
0570, 1, "**end-of-file**"
// *Cause:  The end of an inline cmdfile was reached.  This is just
//          an informational message.
// *Action: No action is required.
0571, 1, "==========================================================="
// *Cause:  Displayed to highlight the error message stack.
// *Action: The errors are printed in last-in first-out order.  To interpret
//          them correctly, read from the bottom to the top.
0572, 1, "waiting for DBMS_PIPE input"
// *Cause:  This message is used only when the PIPE option was specified.
// *Action: enqueue some RMAN input into the pipe
0573, 1, "DBMS_PIPE.NEXT_ITEM_TIME returned unknown type code: %d"
// *Cause:  This is an internal error.
// *Action: contact Oracle Support Services.
0574, 1, "rman aborting due to errors reading/writing DBMS_PIPE"
// *Cause:  RMAN was run with input/output being sent to DBMS_PIPE.  An
//          error was encountered while reading from or writing to the pipe.
//          This error should be preceded by information describing 
//          the error.
// *Action: RMAN terminates.  Refer to the cause/action for the preceding
//          errors.
0575, 1, "timeout while trying to write to DBMS_PIPE"
// *Cause:  RMAN was running in DBMS_PIPE mode.  A timeout occurred while
//          calling DBMS_PIPE.SEND_MESSAGE.  This occurs when the pipe is full
//          and no process has dequeued any of the messages.  This is usually
//          caused by death of the process that was talking to rman.
// *Action: RMAN will abort.
0576, 1, "PIPE cannot be used with CMDFILE"
// *Cause:  The PIPE and CMDFILE options cannot be used together.  When
//          using the PIPE option, RMAN must obtain its input from the
//          input pipe.
// *Action: Remove either the PIPE or CMDFILE option.
0577, 1, "PIPE requires that TARGET be specified on the command line"
// *Cause:  The PIPE option obtains its input from, and writes its output to,
//          an Oracle database pipe in the target database.  Therefore, the
//          target database connection must be specified on the command line,
//          so that RMAN can connect to the target database to receive its
//          input from the pipe.
// *Action: Specify the TARGET option on the RMAN command line.
0578, 1, "pipe %s is not private and owned by SYS"
// *Cause:  The pipe that RMAN needs to use for its input or output is either
//          a public pipe or a private pipe that is not owned by SYS.  This is
//          a potential security problem, because it allows a non-SYS user to
//          issue commands to RMAN or to retrieve the RMAN output.
// *Action: If you are attempting to put data on the RMAN input pipe prior to
//          starting RMAN, so RMAN will process the data on the pipe as soon
//          as it starts, you must be connected as SYS and you must first
//          use the DBMS_PIPE.CREATE_PIPE function to explicitly create the
//          pipe as a private pipe.
0579, 1, "SCRIPT cannot be used with CMDFILE"
// *Cause:  The SCRIPT and CMDFILE options cannot be used together.  When
//          using the SCRIPT option, RMAN executes only the specified script.
// *Action: Remove either the SCRIPT or CMDFILE option.
/
/ Help messages
/
0580, 1, "Argument     Value          Description"
0581, 1, "-----------------------------------------------------------------------------"
0582, 1, "target       quoted-string  connect-string for target database"
0583, 1, "catalog      quoted-string  connect-string for recovery catalog"
0584, 1, "nocatalog    none           if specified, then no recovery catalog"
0585, 1, "cmdfile      quoted-string  name of input command file"
0586, 1, "log          quoted-string  name of output message log file"
0587, 1, "trace        quoted-string  name of output debugging message log file"
0588, 1, "append       none           if specified, log is opened in append mode"
0589, 1, "debug        optional-args  activate debugging"
0590, 1, "msgno        none           show RMAN-nnnn prefix for all messages"
0591, 1, "send         quoted-string  send a command to the media manager"
0592, 1, "pipe         string         building block for pipe names"
0593, 1, "timeout      integer        number of seconds to wait for pipe input"
0594, 1, "checksyntax  none           check the command file for syntax errors"
0597, 1, "-----------------------------------------------------------------------------"
0598, 1, "Both single and double quotes (' or \") are accepted for a quoted-string."
0599, 1, "Quotes are not required unless the string contains embedded white-space."
/ KRMM messages continued at 700
/
/ Internal Errors
/
// NLS_DO_NOT_TRANSLATE [600,601]
600,  4, "internal error, arguments [%s] [%s] [%s] [%s] [%s]"
// *Cause:  An internal error in recovery manager occurred.
// *Action: Contact Oracle Support Services.
601,  4, "fatal error in recovery manager"
// *Cause:  A fatal error has occurred.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
/
/ KRMM messages (continued): 700-750
/
0700, 1, "SCRIPT requires that TARGET be specified on the command line"
// *Cause:  A SCRIPT option was included on the RMAN command line
//          without a specified TARGET database.
// *Action: Specify the TARGET option on the RMAN command line.
0701, 1, "SCRIPT requires that CATALOG be specified on the command line"
// *Cause:  A SCRIPT option was included on the RMAN command line
//          without a specified CATALOG recovery catalog.
// *Action: Specify the CATALOG option on the RMAN command line.
0702, 1, "The command has no syntax errors"
// *Cause: This is an informational message only.
// *Action: No action is required.
0703, 1, "The cmdfile has no syntax errors"
// *Cause: This is an informational message only.
// *Action: No action is required.
/

/ KRMP errors: 1000-1099
/
/ 1000 is used to separate multiple errors when formatting the errors
/ for printing
1000, 1, ", "
/ 1005 is used to format an error message from the parser.  Do NOT change
/ this!
1005, 1, "%s"
1006, 1, "error signaled during parse"
// *Cause:  An error was signaled during parsing.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
1007, 1, "at line %d column %d file: %s"
// *Cause:  This is an informational message indicating the line
//          and column where a syntax error was detected.
// *Action: No action is required.
1008, 1, "the bad identifier was: %s"
// *Cause:  This is an informational message indicating the identifier token
//          that caused a syntax error.
// *Action: No action is required.
1009, 1, "syntax error: found \"%s\": expecting one of: \"%s\""
// *Cause:  A syntax error was signaled during parsing.
// *Action: Correct the input.
/
/ free block:  1100-1199
/
/ free block:  1200-1999
/
/ KRML errors: 2000-2999
/
2000, 1, "wrong message file version (msg %d not found)"
// *Cause:  The rmanxx.msb file is not the correct version.
// *Action: Check that the installation was done correctly.  The RMAN
//          binary (executable, load module, whatever it is called on your
//          O/S) and the rmanxx.msb file must be from the same version,
//          release, and patch level.
2001, 1, "unrecognized punctuation symbol \"%s\""
// *Cause:  An illegal punctuation character was encountered.
// *Action: Remove the illegal character.
2002, 1, "unexpected end of input file reached"
// *Cause:  This is probably caused by failure to supply the closing quote
//          for a quoted string.
// *Action: Correct the input.
2003, 1, "unrecognized character: %s"
// *Cause:  An input character that is neither an alpha, digit, or punctuation
//          was encountered.
// *Action: Remove the character.
2004, 1, "quoted string too big"
// *Cause:  A quoted string longer than 2000 bytes was encountered.
// *Action: This may be caused by a missing close quote.  If so, add the
//          missing quote, otherwise shorten the string.
2005, 1, "token too big"
// *Cause:  A token longer than 1000 bytes was encountered
// *Action: Tokens must be separated by whitespace or punctuation.
//          Either add the missing whitespace or punctuation, or shorten
//          the token.
2006, 1, "script line too long"
// *Cause: a line longer than 500 bytes was encountered
// *Action: break the line up into shorter lines
2007, 1, "Integer value overflow"
// *Cause:  Parser failed to convert input string to integer
// *Action: Acceptable values for integer are from 0 to 2147483648.
//          Retry command using valid integer value.
2008, 1, "no value exists for variable \"%s\""
// *Cause:  The RMAN variable specified was either undefined or null
// *Action: Verify that a proper value has been given to that variable.
2009, 1, "unexpected end of command file reached"
// *Cause:  This is probably caused by failure to supply the closing brace
//          for a stored script in a command file.
// *Action: Correct the input.
/
/ KRMI errors: 3000-3999
/
3000, 1, "recovery manager compiler component initialization failed"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
3001, 1, "recovery manager command sequencer component initialization failed"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
3002, 1, "failure of %s command at %s"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
3003, 1, "command not implemented yet: %s"
// *Cause:  The command is not implemented in the current release.
// *Action: Avoid using the command.
3004, 1, "fatal error during execution of command"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
3008, 1, "error while performing automatic resync of recovery catalog"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
3009, 1, "failure of %s command on %s channel at %s"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
3010, 1, "fatal error during library cache pre-loading"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
3011, 1, "Recovery Manager%s"
// *Cause:  This is the RMAN banner
// *Action: No action is required.
3012, 1, "fatal error during compilation of command"
// *Cause:  A fatal error occurred during compilation of a command.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
3013, 1, "Copyright (c) 1995, 2003, Oracle Corporation.  All rights reserved."
// *Cause:  This is the copyright banner
// *Action: No action is required.
3014, 1, "implicit resync of recovery catalog failed"
// *Cause:  This message is accompanied by other errors explaining the
//          cause of the failure.
// *Action: No action is required.
3015, 1, "error occurred in stored script %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
3017, 1, "recursion detected in stored script %s"
// *Cause: A stored script is calling itself or another script which calls
//         itself.
// *Action: Remove the recursion.
3018, 1, "asynchronous RPCs are working correctly"
// *Cause: This is an informational message only.
// *Action: No action is required.
3019, 1, "asynchronous RPCs are NOT working"
// *Cause: The RPCTEST command has determined that RPCs are not executing
//         asynchronously.  Instead, they are blocking.  This is caused
//         by using a SQL*NET driver that does not support non-blocking UPI.
// *Action: Try using a different SQL*NET driver.
3020, 1, "asynchronous RPC test will take 1 minute"
// *Cause: This is an informational message only.
// *Action: No action is required.
3023, 1, "executing command: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
3028, 1, "fatal error code for command %s : %d"
// *Cause: Informational message.  This precedes error 3012.
// *Action: No action is required.
3029, 1, "echo set on"
// *Cause: a SET ECHO ON command was issued
// *Action: No action is required.
3030, 1, "echo set off"
// *Cause: a SET ECHO OFF command was issued
// *Action: No action is required.
3031, 1, "this option of set command needs to be used inside a run block"
// *Cause:  The option used with the SET command is not valid outside a
//          run block.
// *Action: Change the SET command or place it inside a run block.
3032, 1, "this option of set command needs to be used outside of a run block"
// *Cause:  The option used with the SET command is not valid inside of a
//          run block.
// *Action: Change the SET command or place it outside a run block.
3033, 1, "current log archived"
// *Cause: "ALTER SYSTEM ARCHIVE LOG CURRENT" command completed successfully.
// *Action: None, this is an informational message.
3034, 1, "LEVEL %d is invalid.  LEVEL must be between %s and %s"
// *Cause:  An invalid DEBUG LEVEL was used.
// *Action: Change the DEBUG LEVEL argument.
3035, 1, "Debugging turned off"
// *Cause: a DEBUG OFF command was issued
// *Action: No action is required.
3036, 1, "Debugging set to level=%d, types=%s"
// *Cause: a DEBUG command was issued
// *Action: No action is required.
3037, 1, "Spooling started in log file: %s"
// *Cause: a SPOOL LOG TO ... command was issued
// *Action: No action is required.
3038, 1, "Spooling started in trace file: %s"
// *Cause: a SPOOL TRACE TO ... command was issued
// *Action: No action is required.
3039, 1, "Spooling for log turned off"
// *Cause: a SPOOL LOG OFF command was issued
// *Action: No action is required.
3040, 1, "Spooling for trace turned off"
// *Cause: a SPOOL TRACE TO ... command was issued
// *Action: No action is required.
3042, 1, "error while analyzing automatic repair options"
// *Cause: This message is accompanied by other errors explaining the
//         cause of the failure.
// *Action: No action is required.
/
3090, 1, "Starting %s at %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
3091, 1, "Finished %s at %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
/
3098, 1, "%-*sRMAN-%05.5d: %-*s%s"
// *Cause: This is the message prefix with a possible indentation.
// *Action: No action is required.
/
3099, 1, "job cancelled at user request"
// *Cause: The user interrupted the current job.
// *Action:  None.
/
3999, 1, "Oracle error occurred while while converting a date: ORA-%-05d: %s"
// *Cause: Internal error converting a date.
// *Action: Contact Oracle Support Services.
/
/ KRMS/General Errors: 4000-4999
/
4000, 1, "memory allocation failure"
// *Cause:  A memory allocation request could not be satisfied.
// *Action: Increase the amount of memory available to RMAN.
4001, 1, "heap initialization failure"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
4002, 1, "OCIPI failed, ORA-%s"
// *Cause:  OCI process level initialization failed.
// *Action: This error should not normally occur.
4003, 1, "OCIINIT failed"
// *Cause:  The call to OCIEnvInit failed.
// *Action: This error should not normally happen.  Contact Oracle
//          Customer Support.
4004, 1, "error from recovery catalog database: %s"
// *Cause: Oracle error signaled by catalog database.
//         This message should be accompanied by other error message(s)
//         indicating the cause of the error.
// *Action: Check the accompanying errors.
4005, 1, "error from target database: \n%s"
// *Cause:  Oracle error signaled by target database.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
4006, 1, "error from auxiliary database: %s"
// *Cause:  Oracle error signaled by auxiliary database.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
4007, 3, "WARNING from recovery catalog database: %s"
// *Cause: Non fatal Oracle error signaled by catalog database.
//         This message should be accompanied by other error message(s)
//         indicating the cause of the error.
// *Action: Check the accompanying errors.
4008, 3, "WARNING from target database: \n%s"
// *Cause:  Non fatal Oracle error signaled by target database.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
4009, 3, "WARNING from auxiliary database: %s"
// *Cause:  Non fatal Oracle error signaled by auxiliary database.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
4010, 1, "target database Password: "
// *Cause:  No password was provided for the target database.
// *Action: Provide target database password.
4011, 1, "recovery catalog database Password: "
// *Cause:  No password was provided for the recovery catalog database.
// *Action: Provide recovery catalog database password.
4012, 1, "auxiliary database Password: "
// *Cause:  No password was provided for the auxiliary database.
// *Action: Provide auxiliary database password.
4013, 1, "must connect before startup"
// *Cause:  A STARTUP command was attempted before connecting to the database.
// *Action: Connect to database before attempting STARTUP command.
4014, 1, "startup failed: %s"
// *Cause:  The database failed to startup.
// *Action: The cause of the failure is included in the error message.
//          Correct the cause of the failure and retry the startup command.
4015, 1, "error setting target database character set to %s"
// *Cause:  An error was received while setting the session character set
//          in the target database.
// *Action: This error should not normally happen.  Contact Oracle
//          Customer Support.
4016, 1, "could not get OCI error handle"
// *Cause:  An error was received while initializing the OCI layer.
// *Action: This error should not normally happen.  Contact Oracle
//          Customer Support.
4017, 1, "startup error description: %s"
// *Cause: This is an additional informational message that indicates the
//         cause of failure.
// *Action: See accompanying error messages indicating the cause of failure.
// *Action: No action is required.
4020, 1, "target database name \"%s\" does not match channel's name: \"%s\""
// *Cause: The CONNECT clause in the ALLOCATE command has resulted in
//         a connection to a database which is not the same as the one
//         used to connect to the target database.
// *Action: Verify that the CONNECT string connects to the same database
//          as the one specified in the TARGET connection for the CONNECT
//          command.
4021, 1, "target database DBID %s does not match channel's DBID %s"
// *Cause: The CONNECT clause in the ALLOCATE command has resulted in
//         a connection to a database which is not the same as the one
//         used to connect to the target database.
// *Action: Verify that the CONNECT string connects to the same database
//          as the one specified in the TARGET connection for the CONNECT
//          command.
4022, 1, "target database mount id %s does not match channel's mount id %s"
// *Cause: The CONNECT clause in the ALLOCATE command has resulted in
//         a connection to a database which is not the same as the one
//         used to connect to the target database.
// *Action: Verify that the CONNECT string connects to the same database
//          as the one specified in the TARGET connection for the CONNECT
//          command.
4024, 1, "starting Oracle instance without parameter file for retrieval of spfile"
// *Cause: The instance could not be started because no default parameter
//         file (either PFILE or SPFILE) could be found. The instance will
//         be started in restricted mode with default parameters.
// *Action: None - this is an informational message.
4025, 1, "unable to generate a temporary file"
// *Cause: Creation of a temporary file failed. If could be that the system
//         does not have enough resources (disk space, memory or similar).
// *Action: Verify and free some system resources memory and try again.
4026, 1, "unable to open a temporary file: \"%s\""
// *Cause: Opening of a temporary file failed. If could be that the system
//         does not have enough resources (disk space, memory or similar).
// *Action: Verify and free some system resources memory and try again.
4027, 1, "unable to write to a temporary file: \"%s\""
// *Cause: Writing to a temporary file failed. If could be that the system
//         does not have enough resources (disk space, memory or similar).
// *Action: Verify and free some system resources memory and try again.
4031, 1, "\ninitialization parameters used for automatic instance:\n%s\n"
// *Cause: This is an informational message only.
// *Action: No action is required.
4032, 1, "using contents of file %s"
// *Cause: The specified file was included as part of the auxiliary database
//         parameter file.  This is an informational message.
// *Action: No action is required.
4033, 1, "cannot open auxiliary parameter file %s"
// *Cause: An auxiliary parameter file was specified with 
//         SET AUXILIARY INSTANCE PARAMETER FILE command
//         but the specified file cannot be found.
// *Action: Set the parameter file to an existent file or retry the command 
//          without setting AUXILIARY INSTANCE PARAMETER FILE.
4034, 1, "source recovery catalog database Password: "
// *Cause:  A password was not provided for the source recovery catalog
//          database.
// *Action: Provide source recovery catalog database password.
4035, 1, "error from source recovery catalog database: %s"
// *Cause: Oracle error signaled by source recovery catalog database.
//         This message should be accompanied by other error message(s)
//         indicating the cause of the error.
// *Action: Check the accompanying errors.
4036, 3, "WARNING from source recovery catalog database: %s"
// *Cause: Nonfatal Oracle error signaled by source recovery catalog
//         database. This message should be accompanied by other
//         error message(s) indicating the cause of the error.
// *Action: Check the accompanying errors.
/
/ KRMR Errors: 5000-5500
/
5000, 1, "CONFIGURE AUXNAME required for datafile %s"
// *Cause: Either:
//         -) The control file mounted by the auxiliary database does not have
//         an entry for this datafile, therefore file name conversion is
//         not possible.
//
//         -) A COPY DATAFILE TO AUXNAME command was issued,
//         but no auxname was set for this datafile.
// *Action:  Use the CONFIGURE AUXNAME command to specify a file name that the
//           auxiliary database can use as a restore destination.
5001, 1, "auxiliary file name %s conflicts with a file used by the target database"
// *Cause: RMAN is attempting to use the specified file name as a restore
//         destination in the auxiliary database, but this name is already
//         in use by the target database.
// *Action: Use the CONFIGURE AUXNAME command to specify a name for the data
//          file that does not conflict with a file name in use by the 
//          target db.
5002, 1, "aborting Tablespace Point-in-Time Recovery"
// *Cause: Previously encountered error(s) were issued which require
//         corrective action.
// *Action: Resolve the error conditions, and then re-issue the RECOVER
//          command.
5003, 1, "Tablespace Point-in-Time Recovery is not allowed for tablespace %s"
// *Cause: The SYSTEM, SYSUAX or a tablespace containing rollback
//         segments is not allowed in Tablespace Point-in-Time Recovery.
// *Action: Remove the indicated tablespace from the recovery set and
//          retry the operation.
5004, 1, "target database log mode is NOARCHIVELOG"
// *Cause: An attempt was made to apply Tablespace Point-in-Time Recovery
//         to a database that is in NOARCHIVELOG mode.
// *Action: If all required archived log files are available for Tablespace
//          Point-in-Time Recovery, alter the target database log mode to 
//          ARCHIVELOG and retry the Tablespace Point-in-Time Recovery
//          operation. Otherwise, Tablespace Point-in-Time Recovery cannot
//          be applied to this database.
5005, 1, "Tablespace Point-in-Time Recovery is not allowed for re-created tablespace %s"
// *Cause: The requested tablespace has been re-created and
//         is not allowed in Point-in-Time Recovery.
// *Action: Remove the indicated tablespace from the recovery set and
//          retry the operation.
5006, 1, "cannot recover clone standby single tablespaces"
// *Cause: Standby recover can only be performed for the whole database.
// *Action: Change the tablespace list to a database specification.
5007, 1, "no channel allocated"
// *Cause:  A command was entered that requires a channel, and no
//          channel is allocated.
// *Action: Use ALLOCATE CHANNEL before using the command
5009, 1, "Block Media Recovery requires Enterprise Edition"
// *Cause: The RECOVER...BLOCK command was specified.
// *Action: Remove the RECOVER...BLOCK command.
5010, 1, "target database must be opened in READ WRITE mode for Tablespace Point-in-Time Recovery"
// *Cause: The target database was not opened in read write mode.
// *Action: Open the database in read write mode.
5011, 1, "auxiliary instance must be in NOMOUNT state for Tablespace Point-in-Time Recovery"
// *Cause: The Auxiliary instance was not in NOMOUNT state.
// *Action: Open the auxiliary instance in NOMOUNT state.
5013, 1, "auxiliary control file name %s conflicts with a file used by the target database"
// *Cause: RMAN is attempting to use the specified control file name for
//         Tablespace Point-in-Time Recovery as a restore destination in 
//         the auxiliary database, but this name is already in use by 
//         the target database.
// *Action: Set control_files parameter in the auxiliary instance
//          to a name that does not conflict with a file name in use by 
//          the target database.
5014, 1, "Tablespaces with undo segments were not found in recovery catalog"
// *Cause: The recovery catalog did not have information about tablespaces
//         with undo segments.
// *Action: Manually specify the tablespaces with undo segments in the
//          optional UNDO tablespaces clause of the RECOVER command.
5015, 3, "WARNING: not enough information in recovery catalog for specified point-in-time recovery"
// *Cause: The recovery catalog did not have information about 
//         the tablespaces with undo segments at the specified 
//         Point-in-Time. This happened because the current recovery 
//         catalog was not in use at the specified Point-in-Time. A
//         list of tablespaces with undo segments was supplied.
// *Action: RMAN assumes that the current set of tablespaces with undo
//          segments is the same set that was in use at the specified 
//          Point-in-Time. If the set of tablespaces with undo 
//          segments changes, the recovery fails. If recovery fails, 
//          use the optional UNDO TABLESPACE clause of the RECOVER
//          command to specify the correct set of tablespaces.
5016, 1, "failover to previous backup"
// *Cause: This is an informational message to indicate the RMAN could not
//         successfully restore the files using the specified backups.
//         An attempt was made to restore the datafile/archived logs/
//         control file/SPFILE using a previous existing backup.
// *Action: See accompanying additional error messages indicating the cause
//          of the failover.
5017, 1, "no copy of datafile %d found to recover"
// *Cause: A RECOVER COPY command was not able to proceed because no
//         copy of indicated file was found to recover.
//         Possible causes include the following:
//         1. no copy of indicated file exists on disk that satisfy the
//            criteria specified in the user's recover operands.
//         2. copy of indicated datafile exists on disk but no incremental
//            backup was found to apply to the datafile copy.
// *Action: One of the following:
//         1. Use or correct TAG specification to recover a different
//            datafile copy.
//         2. Use BACKUP FOR RECOVER OF COPY command to create necessary
//            incremental backup or copy.
5018, 1, "some datafile copies cannot be recovered, aborting the RECOVER command"
// *Cause: This error message can follow one or more RMAN-5017 or RMAN-5019
//         error messages.
// *Action: See RMAN-5017 or RMAN-5019 error messages documentation for
//          more information.
5019, 3, "WARNING: no channel of required type allocated to recover copy of datafile %d"
// *Cause: A RECOVER COPY command could not proceed because incremental backup
//         sets exist on a device type that has not been allocated.
// *Action: Use the LIST command to determine which device type is needed,
//          then allocate a channel of that type.
5020, 1, "cannot specify AUXILIARY DESTINATION option for normal recovery"
// *Cause: The AUXILIARY DESTINATION option was specified for a normal
//         recovery.  It is only allowed for Tablespace Point-in-Time
//         Recovery.
// *Action: Remove the AUXILIARY DESTINATION option and re-run the 
//          RECOVER command. 
5021, 1, "this configuration cannot be changed for a BACKUP or STANDBY control file"
// *Cause: The user attempted to modify the configuration which cannot be
//         changed for a BACKUP or STANDBY control file while the mounted
//         control file was either BACKUP or STANDBY. The following
//         configurations can be changed only when connected to primary
//         database instance that has CURRENT/CREATED control file
//         type mounted:
//           CONFIGURE RETENTION POLICY
//           CONFIGURE EXCLUDE
//           CONFIGURE ENCRYPTION
//           CONFIGURE DB_UNIQUE_NAME
// *Action: Connect to primary database instance and execute the command.
5022, 1, "TRANSPORT TABLESPACE may not be used with user-managed auxiliary instance"
// *Cause: A user-managed auxiliary instance was specified.
// *Action: Retry the operation with an RMAN-managed auxiliary instance.
5023, 1, "TABLESPACE DESTINATION required"
// *Cause: A required TABLESPACE DESTINATION was not specified.
// *Action: Specify a TABLESPACE DESTINATION and retry the operation.
5024, 1, "\nList of tablespaces presumed to have UNDO segments"
// *Cause: Accompanying message to 5015.
// *Action: See action of message 5015.
5025, 1, "Tablespace %s"
// *Cause: Accompanying message to 5015.
// *Action: See action of message 5015.
5026, 3, "WARNING: presuming following set of tablespaces applies to specified point-in-time"
// *Cause: RMAN assumes that the current set of tablespaces with 
//         undo segments is the same set that was in use at the 
//         specified Point-in-Time. If the set of tablespaces with 
//         undo segments changes, the recovery fails. If recovery
//         fails, use the optional UNDO TABLESPACE clause of the 
//         RECOVER command to specify the correct set of tablespaces.
// *Action: RMAN assumes that the current set of tablespaces with undo
//          segments is the same set that was in use at the specified 
//          Point-in-Time. If the set of tablespaces with undo segments 
//          changes, the recovery fails. If recovery fails, use the 
//          optional UNDO TABLESPACE clause of the RECOVER
//          command to specify the correct set of tablespaces.
5027, 1, "\nList of tablespaces expected to have UNDO segments"
// *Cause: Accompanying message to 5026.
// *Action: See action of message 5026.
5028, 1, "Tablespace %s"
// *Cause: Accompanying message to 5026.
// *Action: See action of message 5026.
5029, 1, "UNDO TABLESPACE clause is only valid for Tablespace Point-in-Time Recovery"
// *Cause: The UNDO TABLESPACE clause was specified for non-Tablespace
//         Point-in-Time Recovery.
// *Action: Remove the UNDO TABLESPACE clause.
5030, 1, "CLONE clause cannot be used with Tablespace Point-in-Time Recovery"
// *Cause: The CLONE clause was specified for a Tablespace Point-in-Time
//         Recovery.
// *Action: Remove the CLONE clause.
5031, 1, "cannot specify UNDO TABLESPACE clause for normal recovery"
// *Cause: The UNDO TABLESPACE clause was specified for a normal
//         recovery.  It is only allowed for Tablespace Point-in-Time
//         Recovery.
// *Action: Remove the UNDO TABLESPACE clause and re-run the 
//          RECOVER command. 
5032, 1, "datafile %s will be created automatically during restore operation"
// *Cause:  The specified datafile did not have an available backup.
// *Action: None. This is an informational message displayed for VALIDATE or
//          PREVIEW option of the RESTORE command. 
5033, 1, "Media recovery start SCN is %s"
// *Cause:  The above system change number (SCN) would be starting media
//          recovery SCN, if the specified files are restored.
// *Action: None. This is an informational message displayed for PREVIEW
//          option of the RESTORE command. 
5034, 1, "Recovery must be done beyond SCN %s to clear datafile fuzziness"
// *Cause:  The above system change number (SCN) identifies the minimum
//          SCN beyond which the media recovery must be performed on the
//          specific datafile to clear the media recovery fuzziness for
//          all datafile.
// *Action: None. This is an informational message displayed for PREVIEW
//          option of the RESTORE command. 
5035, 1, "archived logs generated after SCN %s not found in repository"
// *Cause:  The recovery catalog or target database control file
//          did not have a record of archived logs containing the redo
//          generated after the specified system change number (SCN).
// *Action: None. To avoid this message, perform a log switch if the database
//          is in open mode.
5036, 1, "FOR DB_UNIQUE_NAME option cannot be used for this configuration"
// *Cause: An attempt was made to set the configuration which cannot be
//         used with FOR DB_UNIQUE_NAME option.
// *Action: Remove FOR DB_UNIQUE_NAME option and execute the command.
5037, 1, "FOR DB_UNIQUE_NAME option cannot be used in nocatalog mode"
// *Cause: An attempt was made to set the remote configuration in nocatalog
//         mode.
// *Action: Connect to recovery catalog and execute the command.
5038, 1, "unable to determine UNTIL SCN for TRANSPORT"
// *Cause:  No archived logs were found in the control file.
// *Action: Add UNTIL clause to TRANSPORT command and retry.
5039, 1, "One or more auxiliary set datafiles could not be removed"
// *Cause: There was an error while performing Tablespace Point-in-Time
//         Recovery.  Some of the restored datafiles had OMF names and were
//         not deleted.
// *Action: Manually remove the auxiliary set datafiles that were not
//          removed.
5040, 1, "\n\nList of tablespaces that have been dropped from the target database:"
// *Cause: One or more tablespaces in the recovery set were not found
//         in the control file of the target database.
// *Action: None.  Informational message.
5041, 1, "Error during export of metadata"
// *Cause:  Export of metadata received an error from Data Pump.
// *Action: This message is accompanied by other error message(s)
//          indicating the cause of the error.
5042, 1, "Error during import of metadata"
// *Cause:  Import of metadata received an error from Data Pump.
// *Action: This message is accompanied by other error message(s)
//          indicating the cause of the error.
5043, 1, "Tablespace %s"
// *Cause: Accompanying message to 5040.
// *Action: See Action of message 5040.
5044, 1, "\nPerforming export of metadata..."
// *Cause: This is an informational message only.
// *Action: No action is required.
5045, 1, "\nPerforming import of metadata..."
// *Cause: This is an informational message only.
// *Action: No action is required.
5046, 1, "Export completed\n"
// *Cause: This is an informational message only.
// *Action: No action is required.
5047, 1, "Import completed\n"
// *Cause: This is an informational message only.
// *Action: No action is required.
5048, 1, "specified file name %s conflicts with a file used by the target database"
// *Cause: The specified file name was already in use by another datafile
//         in the database.
// *Action: Use SET NEWNAME command to specify a different name for the
//          datafile that does not conflict with a file name in use by the
//          target database.
5049, 1, "datafile %s is an Oracle Managed File, DB_CREATE_FILE_DEST not set at target"
// *Cause: A Tablespace Point-in-Time Recovery was attempted
//         but the datafile is an Oracle Managed File and DB_FILE_CREATE_DEST
//         is not currently set for the target database.
// *Action: Specify DB_FILE_CREATE_DEST for the target database or provide
//          a NEWNAME for the specified datafile.
5050, 1, "flashing back control file to SCN %s"
// *Cause: RESTORE command was issued with a SET UNTIL clause and Flashback
//         Database enabled.  The control file was flashed back to the SET
//         UNTIL time.
// *Action: This is an informational message only.
5051, 1, "analyzing automatic repair options; this may take some time"
// *Cause: This is an informational message only.
// *Action: No action is required.
5052, 1, "Repair %s is not compatible with this version of RMAN."
// *Cause: The specified repair was not compatible with this version of
//          Recovery Manager (RMAN).
// *Action: Use a newer version of the RMAN executable.
//
5053, 1, "AUXILIARY DESTINATION is only valid when using a RMAN-managed auxiliary instance"
// *Cause: AUXILIARY DESTINATION clause was specified while using an 
//         user-managed auxiliary instance.
// *Action: Do not specify AUXILIARY DESTINATION clause and retry the 
//          operation or use a RMAN-managed auxiliary instance.
5054, 1, "recover block operand %s cannot be used to recover datafile"
// *Cause:  The specified operand could not be used with RECOVER datafile
//          command.
// *Action: Delete the invalid operand and retry the command.
5055, 1, "recover datafile operand %s cannot be used to recover block"
// *Cause:  The specified operand could not be used with RECOVER block command.
// *Action: Delete the invalid operand and retry the command.
//
5060, 1, "block specifier must be specified to recover block"
// *Cause:  Block Specifier was not specified in the command.
// *Action: Specify block specifier and resubmit the command.
5061, 1, "analyzing automatic repair options complete"
// *Cause: This is an informational message only.
// *Action: No action is required.
5062, 1, "image copy needs no roll forward"
// *Cause: The image copy that would be rolled forward by the
//         RECOVER COPY command is already more recent than the
//         specified UNTIL time or system change number (SCN).
// *Action: Usually this is the result of a recent
//          OPEN RESETLOGS operation, and no action is needed,
//          because the daily backup strategy will start rolling
//          this copy forward after it becomes old enough to be
//          eligible for rolling forward. To force the copy to
//          be rolled forward, specify a more recent UNTIL time
//          or system change number (SCN).
5070, 1, "Running TRANSPORT_SET_CHECK on recovery set tablespaces"
// *Cause: This is an informational message only.
// *Action: No action is required.
5071, 1, "TRANSPORT_SET_CHECK completed successfully"
// *Cause: This is an informational message only.
// *Action: No action is required.
5072, 1, "TRANSPORT_SET_CHECK failed"
// *Cause:  SYS.TS_PITR_CHECK was not empty for recovery set tablespaces.
// *Action: Fix dependencies before attempting TSPITR again.
5073, 1, "Tablespace %s creation SCN %s is ahead of point-in-time SCN %s"
// *Cause: The tablespace was found in the control file but the creation
//         system change number (SCN) of the datafile(s) is after the
//         specified point-in-time. This can happen if a previous tablespace
//         point-in-time recovery was performed, for the tablespace.
// *Action: If a previous TSPITR has been performed drop the tablespace 
//          and retry the command.  Otherwise, verify the name of the
//          tablespace and/or the point-in-time and resubmit the command.
5074, 1, "Tablespace %s does not exist at specified point-in-time SCN %s"
// *Cause: The tablespace was found in the control file but the creation
//         system change number (SCN) of the datafile(s) is after the
//         specified point-in-time.
// *Action: Verify the name of the tablespace and/or the point-in-time and
//          resubmit the command.
/
/ KRMC Errors: 5500-5999
/
5500, 1, "the auxiliary database must be not mounted when issuing a DUPLICATE command"
// *Cause: A DUPLICATE command was issued, but the auxiliary database is
//         mounted.
// *Action: Dismount the auxiliary database.
5501, 1, "aborting duplication of target database"
// *Cause: Previously encountered errors require corrective action.
// *Action: Resolve the error conditions, and reissue the DUPLICATE 
//          command.
5502, 1, "the target database must be mounted when issuing a DUPLICATE command"
// *Cause: A DUPLICATE command was issued, but the target database control
//         file is not mounted.
// *Action: Mount the target database control file by issuing
//          ALTER DATABASE MOUNT via Enterprise Manager or Server Manager.
5503, 1, "at least one auxiliary channel must be allocated to execute this command"
// *Cause:  No auxiliary channels were allocated.
// *Action: Allocate an auxiliary channel.
5504, 1, "at least two redo log files or groups must be specified for this command"
// *Cause:  Only one redo log file or group was specified
// *Action: Specify at least one more redo log file or group
5505, 1, "auxiliary file name conversion of '%s' exceeds maximum length of %s"
// *Cause:  When the given file name is converted to the name used for the
//          auxiliary database, the converted name is larger than the maximum
//          allowed file name.
// *Action: Change initialization parameter DB_FILE_NAME_CONVERT
//          to convert to a valid file name.
5506, 1, "error during recursive execution"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
5507, 1, "standby control file checkpoint (%s) is more recent than duplication point-in-time (%s)"
// *Cause: A DUPLICATE FOR STANDBY command was issued, but the checkpoint of
//         the control file is more recent than the last archived log or the
//         specified point-in-time.
// *Action: If an explicit point-in-time was specified, change it to be at
//          least the control file checkpoint; otherwise archive (and 
//          backup/copy) the current log.
5510, 1, "Duplicate finished"
// *Cause: This is an informational message only.
// *Action: No action is required.
5511, 1, "Datafile %s skipped by request"
// *Cause: This is an informational message only.
// *Action: No action is required.
5512, 1, "Tablespace %s cannot be skipped from duplication"
// *Cause: The SYSTEM and SYSAUX tablespaces were not included in the
//         DUPLICATE DATABASE. They must be present.
// *Action: Remove the SYSTEM and/or SYSAUX tablespace from the SKIP list and
//          retry the operation.
5513, 1, "cannot duplicate, control file is not current or standby"
// *Cause: Target database did not have a current or standby control
//         file. DUPLICATE requires the target database to have a current 
//         or standby control file.
// *Action: Open database to make control file current or connect to a different
//          database before retrying the command.
5514, 1, "Tablespace %s has undo information, cannot skip"
// *Cause: All tablespaces that have undo information must be included
//         in the duplication.
// *Action: Remove the specified tablespace from the SKIP list and
//          retry the operation.
5515, 1, "Duplicate for standby does not allow the use of SET UNTIL"
// *Cause: A SET UNTIL clause was specified for the command.
// *Action: Remove the SET UNTIL clause and try again.
5516, 1, "duplicate operand specified: %s"
// *Cause:  The specified operand appears more than once in the same
//          DUPLICATE option list
// *Action: Delete the duplicated operand.
5517, 1, "tempfile %s conflicts with file used by target database"
// *Cause: RMAN attempted to use the specified tempfile as a restore
//         destination in the auxiliary database, but this name was already
//         in use by the target database.
// *Action: Use the SET NEWNAME FOR TEMPFILE command to specify a name for
//          the indicated tempfile, making sure that the new name
//          does not conflict with a file name in use by target database.
//          Alternatively, use DB_FILE_NAME_CONVERT and retry the command.
5518, 1, "Automatically adding tablespace %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
5519, 3, "WARNING: tablespace %s is always included when duplicating"
// *Cause: The SYSTEM and SYSAUX tablespaces were included in the 
//         DUPLICATE TABLESPACE command. They were automatically included 
//         by the command and did  not need to be explicitly named. 
// *Action: To avoid this warning,, remove the SYSTEM and/or 
//          SYSAUX tablespace from the tablespaces list and retry 
//          the operation.
5520, 1, "database name mismatch, auxiliary instance has %s, command specified %s"
// *Cause:  The database name specified in the initialization parameter was
//          not the same as the database name provided in the DUPLICATE
//          command.
// *Action: Correct the database name in the command or adjust the database
//          name of the auxiliary instance.
5521, 1, "DUPLICATE without CATALOG and TARGET not open requires that UNDO TABLESPACE is specified"
// *Cause: A DUPLICATE was attempted when target database was not open 
//         without connection to a recovery catalog.  It is necessary that the
//         list of tablespaces with undo segments is provided with the UNDO
//         TABLESPACE clause.
// *Action: Retry the command specifying the list of tablespaces with undo
//          segments using the UNDO TABLESPACE clause.
5522, 1, "Skipping tablespace %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
5523, 1, "Tablespace %s is read only and SKIP READONLY was specified"
// *Cause: Conflicting parameters were provided.
// *Action: Remove SKIP READONLY or remove read-only tablespace from list
//          of tablespaces to duplicate.
5524, 1, "Tablespace %s is offline"
// *Cause: It was not possible to duplicate offline tablespaces.
// *Action: Remove offline tablespace from list or online tablespace
//          to duplicate it.
5525, 1, "SKIP TABLESPACE cannot be used when using DUPLICATE TABLESPACE"
// *Cause: A SKIP TABLESPACE clause was specified for the command.
// *Action: Remove the SKIP TABLESPACE clause and try again.
5526, 1, "datafile %d not processed because file is OFFLINE IMMEDIATE"
// *Cause: A DUPLICATE command omitted processing the indicated datafile 
//         because it is offline immediate.  The tablespace to which this
//         datafile belongs will also not be included.  See message 5528.
// *Action: None, informational message only.
5527, 1, "Tablespace %s has one or more OFFLINE IMMEDIATE datafiles"
// *Cause: It was not possible to duplicate a tablespace who had
//         offline immediate tablespaces.
// *Action: Remove offending tablespace from list or recover datafile
//          which are offline immediate in the tablespace before attempting
//          the command again.
5528, 1, "datafile %d not processed because file belongs to tablespace with one or more offline immediate datafile (%s)"
// *Cause: A DUPLICATE command omitted processing the indicated datafile 
//         because it is part of a tablespace that has offline immediate
//         datafile.  See message 5526.
// *Action: No action is required. This is an informational message only.
5529, 3, "WARNING: DB_FILE_NAME_CONVERT resulted in invalid ASM names; names changed to disk group only."
// *Cause: It was not possible to convert ASM Oracle Managed Files names using
//         DB_FILE_NAME_CONVERT parameter. RMAN changed these invalid
//         names to the converted disk group name instead.
// *Action: No action is required. This is an informational message only. 
//          If the automatic change is incorrect, use one of the following
//          options instead of using DB_FILE_NAME_CONVERT for ASM
//          Oracle Managed Files:
//          1) use RMAN command SET NEWNAME for each Oracle Managed File.
//          2) set DB_CREATE_FILE_DEST initialization parameter in
//             auxiliary instance and not specify DB_FILE_NAME_CONVERT.
5530, 1, "an UNTIL TIME or SCN cannot be specified with FROM ACTIVE DATABASE"
// *Cause: A DUPLICATE with FROM ACTIVE DATABASE was specified along with 
//         either a SET UNTIL statment or UNTIL clause on the command.
//         This is not supported.  A DUPLICATE FROM ACTIVE DATABASE always
//         creates a copy as of the current time.
// *Action: Check the statement and remove the use of UNTIL.
5531, 1, "a mounted database cannot be duplicated while datafiles are fuzzy"
// *Cause: A DUPLICATE with FROM ACTIVE DATABASE command was specified while
//         the database was mounted or open read-only.  Unless the database
//         is open read/write, the datafiles cannot be fuzzy.
// *Action: Open the database read/write, then shutdown cleanly before 
//          mounting.
5532, 1, "PASSWORD FILE specified without FROM ACTIVE DATABASE"
// *Cause: The PASSWORD FILE clause of the DUPLICATE command was specified
//         but the FROM ACTIVE DATABASE clause was not.  A password
//         file can only be duplicated if the FROM ACTIVE DATABSE
//         clause has been used.
// *Action: Remove the PASSWORD FILE clause from the command, or
//          perform an online duplicate of the database by specifying
//          the FROM ACTIVE DATABASE clause.
5533, 1, "%s is not supported on %s database"
// *Cause: The specified command is not supported on this type of database.
//         The type of database can be STANDBY, CLONE, or RAC.
// *Action: Do not use the specified command against this database.
5534, 3, "WARNING: LOG_FILE_NAME_CONVERT resulted in invalid ASM names; names changed to disk group only."
// *Cause: It was not possible to convert ASM Oracle Managed Files names using
//         LOG_FILE_NAME_CONVERT parameter. RMAN changed these invalid
//         names to the converted disk group name instead.
// *Action: If the automatic change is incorrect, use one of the following
//          options instead of using LOG_FILE_NAME_CONVERT for ASM
//          Oracle Managed Files:
//          1) Use the LOGFILE clause for online log files.
//          2) After DUPLICATE completes, create standby log files
//             using the SQL ALTER DATABASE ADD STANDBY LOGFILE command.
5535, 3, "WARNING: All redo log files were not defined properly."
// *Cause: It was not possible to define all the redo log files.  This
//         can occur when LOG_FILE_NAME_CONVERT initialization parameter is
//         defined but fails to match all the names or causes names to be
//         created that are not in valid directories.
// *Action: Query the V$LOGFILE view to see what redo log files are defined
//          after DUPLICATE has completed.  Use the
//          ALTER DATABASE RENAME FILE SQL command to correctly
//          name the existing redo log files.
5536, 3, "auxiliary logfile name %s conflicts with a file used by the target database"
// *Cause: RMAN attempted to use the specified logfile name as a standby
//         redo log file in the auxiliary database, but this name was already
//         in use by the target database.
// *Action: Use or alter LOG_FILE_NAME_CONVERT so that unique logfile
//          names can be generated.  Or wait for the command to
//          complete and create standby logfiles using the 
//          SQL ALTER DATABASE ADD STANDBY LOGFILE command.
5537, 1, "DUPLICATE without TARGET connection when auxiliary instance is started with spfile cannot use SPFILE clause"
// *Cause: A DUPLICATE was attempted when the auxiliary database was started
//         with a server parameter file and the SPFILE sub-clause was
//         specified.  RMAN cannot restore the server parameter file
//         if the auxiliary database is already started with a server
//         parameter file.
// *Action: Start the auxiliary database with a client parameter file or do
//          not specify SPFILE sub-clause and retry.
5538, 3, "WARNING: implicitly using DB_FILE_NAME_CONVERT"
// *Cause: The duplicated SPFILE had DB_FILE_NAME_CONVERT set and it
//         has been used to produce datafile names for the new database.
// *Action: No action is required. This is an informational message only. 
//          If this behavior was not intended, then do not duplicate the
//          server parameter file, or explicitly set DB_FILE_NAME_CONVERT
//          in the DUPLICATE command and retry the operation.
5539, 1, "DUPLICATE TARGET DATABASE cannot be used without connecting to the TARGET"
// *Cause: A DUPLICATE TARGET DATABASE was attempted and no connection to
//         the TARGET database was established.
// *Action: Connect to TARGET or use DATABASE <db_name> clause.
5540, 1, "no archived logs found in repository for database %s"
// *Cause:  Recovery catalog did not have archived log records for the
//          specified database.  If database is running in NOARCHIVELOG mode,
//          then specify NOREDO.
// *Action: Specify NOREDO for NOARCHIVELOG databases.  Cannot duplicate
//          an ARCHIVELOG database unless the recovery catalog or target
//          database control file has archived redo log information about it.
5541, 1, "no archived logs found in target database"
// *Cause:  Target database was running in archived log mode, but 
//          control file did not have any archived log records.
// *Action: Archive current log before retrying command.
5542, 1, "Only UNTIL TIME can be used with DUPLICATE without TARGET and CATALOG connections"
// *Cause: A DUPLICATE without TARGET and CATALOG connections was 
//         attempted specifying an UNTIL clause that was not TIME based.
// *Action: Retry the command with an UNTIL TIME clause or without an UNTIL 
//          clause.
5543, 1, "DUPLICATE without TARGET connection requires that DATABASE is specified"
// *Cause: A DUPLICATE without TARGET connection was attempted without
//         specifying the database to duplicate.
// *Action: Retry the command specifying the DATABASE to duplicate.
5544, 1, "Cannot specify ACTIVE DATABASE when not connected to target database" 
// *Cause: DUPLICATE from ACTIVE DATABASE required a connection to the target
//         database.
// *Action: Connect to target database or remove from ACTIVE DATABASE and 
//          retry the command.
5545, 3, "WARNING: Until SCN %s is ahead of SCN of last full resync of recovery catalog: %s"
// *Cause: The specified point-in-time for duplication without a target
//         connection was ahead of the last time that the datafile information
//         was resynced to the recovery catalog.  Information about
//         offline and read-only datafiles might be incorrect.
// *Action: If duplication fails due to incorrectly identified offline and/or
//          read-only datafiles, specify a point-in-time before the last 
//          resync of the recovery catalog and retry the command.  Or perform
//          full resync of the target database and retry the command.
5546, 1, "DUPLICATE without TARGET and CATALOG connections requires that BACKUP LOCATION is specified"
// *Cause: A DUPLICATE without TARGET and CATALOG connections was 
//         attempted without specifying BACKUP LOCATION.
// *Action: Retry the command specifying a BACKUP LOCATION.
5547, 1, "Checking that duplicated tablespaces are self-contained"
// *Cause: This is an informational message only.
// *Action: No action is required.
5548, 1, "The set of duplicated tablespaces is not self-contained"
// *Cause: A DUPLICATE TABLESPACE has specified a set of tablespaces that
//         cannot function independently.
// *Action: Retry the command without incomplete tablespaces or add other
//          tablespaces to make the set self-contained.
5549, 1, "The following SYS objects were found in skipped tablespaces"
// *Cause: This is an informational message only.
// *Action: No action required.
5550, 1, "TARGET database not open, cannot verify that set of tablespaces being duplicated does not have SYS objects"
// *Cause: This is an informational message only.
// *Action: No action is required.
5551, 1, "Not connected to TARGET, cannot verify that set of tablespaces being duplicated does not have SYS objects"
// *Cause: This is an informational message only.
// *Action: No action is required.
5552, 1, "Object %s on tablespace %s"
// *Cause: A SYS object was found in one of the skipped tablespaces.
// *Action: Remove object if possible or include tablespace in duplicated
//          tablespaces.
5553, 1, "SYS objects in skipped tablespaces prevent duplication"
// *Cause: Objects owned by SYS were found in the tablespaces that would
//         not be duplicated.
// *Action: If using SKIP TABLESPACE, do not skip tablespaces that contain 
//          SYS objects.  If using DUPLICATE TABLESPACE, make sure to
//          specify all tablespaces containing SYS objects.
5554, 1, "cannot specify INCARNATION when duplicating without TARGET and CATALOG connections"
// *Cause: A DUPLICATE without TARGET and CATALOG connections was 
//         attempted when INCARNATION was also specified.
// *Action: Retry the command without specifying INCARNATION.
5555, 1, "Not connected to TARGET or TARGET not open, cannot verify that subset of tablespaces is self-contained"
// *Cause: This is an informational message only.
// *Action: No action is required.
5556, 1, "not all datafiles have backups that can be recovered to SCN %s"
// *Cause: One or more datafiles being duplicated could not be restored
//         as no available backups were found.
// *Action: Change the system change number (SCN) or make backups available
//          for the specified datafiles and retry the command.
5557, 1, "Target instance not started with server parameter file"
// *Cause: SPFILE clause was used but target instance was not
//         started with a server parameter file.
// *Action: Do not specify SPFILE clause, or restart target instance with
//          server parameter file.
5558, 1, "Must specify DB_UNIQUE_NAME with FOR STANDBY clause"
// *Cause: A DUPLICATE FOR STANDBY ... SPFILE command was issued but
//         DB_UNIQUE_NAME was not provided for the standby database.
// *Action: Specify a DB_UNIQUE_NAME in the SPFILE clause for the standby
//          database.
5559, 1, "error converting parameter %s, string larger than %d"
// *Cause: While attempting to apply a PARAMETER_VALUE_CONVERT to the
//         specified parameter value, the resulting string exceeded
//         the maximum length for a value.
// *Action: Change the PARAMETER_VALUE_CONVERT so that, when converting the
//          parameter, the maximum lenght is not reached.
5560, 1, "Using previous duplicated file %s for datafile %d with checkpoint SCN of %s"
// *Cause: A datafile copy from a previous duplicate attempt matching 
//         the duplicate name requested was found for the specified
//         datafile and will be used instead of restoring the datafile
//         from a backup.
// *Action: No action needed unless this behavior is not desire. In that
//          case, either use a different name for the datafile or
//          use NORESUME to avoid using previous datafile copies for all
//          the datafiles.
5561, 1, "CATALOG did not return information about tablespaces with undo segments"
// *Cause: A DUPLICATE with no target connection was attempted, but the 
//         recovery catalog did not have information about the tablespaces
//         with undo segments at the specified point in time.  
//         It is necessary that the list of tablespaces with undo segments 
//         is provided with the UNDO TABLESPACE clause.
// *Action: Retry the command specifying the list of tablespaces with undo
//          segments using the UNDO TABLESPACE clause.
5562, 1, "SPFILE backup not found for database %s with DBID %d created before %s in %s"
// *Cause: RMAN could not locate a backup of the SPFILE in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5563, 1, "SPFILE backup not found for database with DBID %d created before %s in %s"
// *Cause: RMAN could not locate a backup of the SPFILE in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5564, 1, "SPFILE backup not found for database %s created before %s in %s"
// *Cause: RMAN could not locate a backup of the SPFILE in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5565, 1, "SPFILE backup created before %s not found in %s"
// *Cause: RMAN could not locate a backup of the SPFILE in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5566, 1, "SPFILE backup not found for database %s with DBID %d in %s"
// *Cause: RMAN could not locate a backup of the SPFILE in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5567, 1, "SPFILE backup not found for database with DBID %d in %s"
// *Cause: RMAN could not locate a backup of the SPFILE in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5568, 1, "SPFILE backup not found for database %s in %s"
// *Cause: RMAN could not locate a backup of the SPFILE in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5569, 1, "SPFILE backup not found in %s"
// *Cause: RMAN could not locate a backup of the SPFILE in the specified
//         location.
// *Action: Provide a different location and retry the command.
5570, 1, "Duplicate for standby does not allow the use of LOGFILE"
// *Cause: A LOGFILE clause was specified for the command.
// *Action: Remove the LOGFILE clause and try again.
5571, 1, "DORECOVER specified for non standby duplication"
// *Cause: A DORECOVER clause was specified and the duplicate did not specify
//         FOR STANDBY.
// *Action: Remove the DORECOVER clause or add FOR STANDBY and try again.
5572, 1, "Controlfile backup not found for database %s with DBID %d created before %s in %s"
// *Cause: RMAN could not locate a backup of the control file in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5573, 1, "CONTROLFILE backup not found for database with DBID %d created before %s in %s"
// *Cause: RMAN could not locate a backup of the control file in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5574, 1, "CONTROLFILE backup not found for database %s created before %s in %s"
// *Cause: RMAN could not locate a backup of the control file in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5575, 1, "CONTROLFILE backup created before %s not found in %s"
// *Cause: RMAN could not locate a backup of the control file in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5576, 1, "CONTROLFILE backup not found for database %s with DBID %d in %s"
// *Cause: RMAN could not locate a backup of the control file in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5577, 1, "CONTROLFILE backup not found for database with DBID %d in %s"
// *Cause: RMAN could not locate a backup of the control file in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5578, 1, "CONTROLFILE backup not found for database %s in %s"
// *Cause: RMAN could not locate a backup of the control file in the specified
//         location that satisfied the specified parameters.
// *Action: Change the parameters, or provide a different location and retry
//          the command.
5579, 1, "CONTROLFILE backup not found in %s"
// *Cause: RMAN could not locate a backup of the control file in the specified
//         location.
// *Action: Provide a different location and retry the command.
5580, 1, "Duplicate for standby does not allow the use of SKIP READONLY"
// *Cause: A SKIP READONLY clause was specified for the command.
// *Action: Remove the SKIP READONLY clause and try again.
5581, 1, "Duplicate for standby does not allow the use of SKIP TABLESPACE"
// *Cause: A SKIP TABLESPACE clause was specified for the command.
// *Action: Remove the SKIP TABLESPACE clause and try again.
5582, 1, "Duplicate for standby does not allow the use of OPEN RESTRICTED"
// *Cause: An OPEN RESTRICTED clause was specified for the command.
// *Action: Remove the OPEN RESTRICTED clause and try again.
5583, 1, "Duplicate for standby does not allow the use of TABLESPACE"
// *Cause: A TABLESPACE clause was specified for the command.
// *Action: Remove the TABLESPACE clause and try again.
5584, 1, "Duplicate for standby does not allow the use of NOREDO"
// *Cause: A NOREDO clause was specified for the command.
// *Action: Remove the NOREDO clause and try again.
5585, 1, "Duplicate for standby does not allow the use of UNDO TABLESPACE"
// *Cause: A UNDO TABLESPACE clause was specified for the command.
// *Action: Remove the UNDO TABLESPACE clause and try again.
5586, 1, "The following materialized objects were found in skipped tablespaces"
// *Cause: This is an informational message only.
// *Action: No action required.
5587, 1, "Materialized table %s on tablespace %s"
// *Cause: A materialized table was found in one of the skipped tablespaces.
// *Action: Remove object if possible or include tablespace in duplicated
//          tablespaces.
5588, 1, "Materialized index %s on tablespace %s"
// *Cause: A materialized index was found in one of the skipped tablespaces.
// *Action: Remove object if possible or include tablespace in duplicated
//          tablespaces.
5589, 1, "Materialized objects in skipped tablespaces prevent duplication"
// *Cause: Materialized objects found in the tablespaces that would
//         not be duplicated.
// *Action: If using SKIP TABLESPACE, do not skip tablespaces that contain 
//          materialized objects.  If using DUPLICATE TABLESPACE, make
//          sure to specify all tablespaces containing SYS objects.
/
/ KRMK Errors: 6000-6999
/
6000, 1, "could not open recovery manager library file: %s"
// *Cause:  The "recover.bsq" file could not be opened.
// *Action: Check that the file was installed correctly and that the user
//          running RMAN has authority to read the file.
6001, 1, "error parsing job step library"
// *Cause:  A syntax error was encountered while parsing "recover.bsq".
// *Action: Ensure that the correct version of the file is installed and
//          that it has not been modified in any way.
6002, 1, "command not allowed when not connected to a recovery catalog"
// *Cause:  A command that is allowed only when a recovery catalog connect
//          string was supplied was attempted.
// *Action: Avoid using the command, or restart RMAN and supply a recovery
//          catalog connect string via the CATALOG parameter.
6003, 1, "ORACLE error from target database: \n%s"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
6004, 1, "ORACLE error from recovery catalog database: %s"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
6005, 1, "connected to target database: %s (DBID=%s)"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6006, 1, "connected to target database: %s (not mounted)"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6007, 1, "target database not mounted and db_name not set in init.ora"
// *Cause:  The target database has not mounted the control file, and
//          its "init.ora" file does not specify the DB_NAME parameter.
// *Action: MOUNT the target database, or add the DB_NAME parameter to
//          its "init.ora" and restart the instance.
6008, 1, "connected to recovery catalog database"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6009, 1, "using target database control file instead of recovery catalog"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6010, 1, "error while looking up datafile: %s"
// *Cause:  An error occurred while looking up the specified datafile in
//          the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.  Ensure that the file name is entered correctly.
//          If the datafile was added recently, then a RESYNC CATALOG must
//          be done to update the recovery catalog.
6011, 1, "invalid level specified: %d"
// *Cause:  An invalid incremental backup level was specified.
// *Action: Incremental backup level must be between 0 and 4.
6012, 1, "channel: %s not allocated"
// *Cause:  A RELEASE command was found for a channel identifier
//          that was not yet allocated.
// *Action: Correct the channel identifier, or add an ALLOCATE CHANNEL 
//          command.
6013, 1, "duplicate channel identifier found: %s"
// *Cause:  A channel identifier was reused without first releasing the
//          channel.
// *Action: Add a RELEASE CHANNEL command.
6014, 1, "command not implemented yet: %s"
// *Cause:  Not all commands are implemented for the beta release.
// *Action: Avoid using the command.
6015, 1, "error while looking up datafile copy name: %s"
// *Cause:  An error occurred while looking up the specified datafile copy
//          name in the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.  Ensure that the file name is entered correctly.
//          If the datafile copy was created when the recovery catalog was
//          not available, then a RESYNC CATALOG must be done to update the 
//          recovery catalog.
6016, 1, "duplicate backup operand specified: %s"
// *Cause:  The specified operand appears more than once in the same
//          backup specifier or backup command.
// *Action: Delete the duplicated operand.
6017, 1, "initialization of parser failed"
// *Cause:  The parser package initialization routine returned an error.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
6018, 1, "duplicate operand specified in backup specification: %s"
// *Cause:  A backup specification operand appears more than once in a backup
//          specification.
// *Action: Delete the duplicate operand.
6019, 1, "could not translate tablespace name \"%s\""
// *Cause:  An error occurred while looking up the specified tablespace name
//          in the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.  Ensure that the tablespace is entered correctly.
//          If the tablespace was added recently, then a RESYNC CATALOG must
//          be done to update the recovery catalog.
6020, 1, "connected to auxiliary database (not started)"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6021, 1, "FROM DATAFILECOPY/BACKUPSET may not be specified with archived logs"
// *Cause:  The FROM DATAFILECOPY/BACKUPSET option applies only to
//          datafile and control file restores.
// *Action: Use this option only for datafile and control file restores.
6022, 1, "invalid level specified for image copy: %d"
// *Cause:  An invalid incremental backup level was specified for an image
//          copy.
// *Action: Incremental backup level must be 0 for image copies.
6023, 1, "no backup or copy of datafile %d found to restore"
// *Cause:  A datafile, tablespace, or database restore could not proceed
//          because no backup or copy of the indicated file was found.
//          It may be the case that a backup or copy of this file exists but
//          does not satisfy the criteria specified in the user's restore
//          operands.
// *Action: None - this is an informational message.  See message 6026 for
//          further details.
6024, 1, "no backup or copy of the control file found to restore"
// *Cause:  A control file restore could not proceed
//          because no backup or copy of the control file was found.
//          It may be the case that a backup or copy of this file exists but
//          does not satisfy the criteria specified in the user's restore
//          operands.
// *Action: None - this is an informational message.  See message 6026 for
//          further details.
6025, 1, "no backup of archived log for thread %d with sequence %d and starting SCN of %s found to restore"
// *Cause:  An archived log restore restore could not proceed because
//          no backup of the indicated archived log was found.
//          It may be the case that a backup of this file exists but
//          does not satisfy the criteria specified in the user's restore
//          operands.
// *Action: None - this is an informational message.  See message 6026 for
//          further details.
6026, 1, "some targets not found - aborting restore"
// *Cause:  Some of the files specified for restore could not be found.
//          Message 6023, 6024, or 6025 is also issued to indicate which
//          files could not be found.  Some common reasons why a file
//          can not be restored are that there is no backup
//          or copy of the file that is known to recovery manager, or
//          there are no backups or copies that fall within the criteria
//          specified on the RESTORE command, or some datafile copies have
//          been made but not cataloged.
// *Action: The Recovery Manager LIST command can be used to display the
//          backups and copies that Recovery Manager
//          knows about.  Select the files to be restored from that list.
6027, 1, "no archived logs found that match specification"
// *Cause:  An archived log record specifier did not match any archived logs
//          in the recovery catalog or target database control file.
// *Action: Resubmit the command with a different archived log record
//          specifier.  The Recovery Manager (RMAN) LIST command can be
//          used to display all archived logs that RMAN knows about.
6028, 1, "duplicate operand specified in restore specification: %s"
// *Cause:  The CHANNEL, TAG, FROM, PARMS, VALIDATE, DEVICE TYPE,
//          CHECK READONLY or DB_UNIQUE_NAME option was specified
//          more than once in the restore command or in one of the restore
//          specifications.
// *Action: Correct and resubmit the command.
6029, 1, "the control file may be included only in a datafile backup set"
// *Cause:  The "include current/standby control file" option was specified
//          for an archived log backup set.
// *Action: Use this option only for datafile backup sets.
6030, 1, "the DELETE [ALL] INPUT option may not be used with a datafile backup set"
// *Cause:  The DELETE [ALL] INPUT option was specified for a backup that
//          contains the current control file or datafile.
// *Action: Remove the option and resubmit the command.
6031, 1, "could not translate database keyword"
// *Cause:  An error was received when calling DBMS_RCVMAN
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
6032, 1, "at least 1 channel of TYPE DISK must be allocated to execute a COPY command"
// *Cause:  No channel of TYPE DISK was allocated.
// *Action: Allocate a channel of TYPE DISK and re-issue the command.
6033, 1, "channel %s not allocated"
// *Cause:  An rman command requests a specific channel, but
//          the requested channel has not been allocated.
// *Action: ALLOCATE the channel, or correct the channel identifier.
6034, 1, "at least 1 channel must be allocated to execute this command"
// *Cause:  No channels were allocated.
// *Action: ALLOCATE a channel.
6035, 1, "wrong version of recover.bsq, expecting %s, found %s"
// *Cause:  The "recover.bsq" file is incompatible with the RMAN executable.
// *Action: Install the correct version of recover.bsq.
6036, 1, "datafile %d is already restored to file %s"
// *Cause:  A SET NEWNAME command was issued to restore a datafile to a
//          location other than the original datafile, and Recovery Manager
//          determined that the best candidate for restoring the file is the
//          datafile copy with the same name, therefore the file is already
//          restored and no action need be taken.
// *Action: None - this is an informational message.
6037, 1, "incremental backups feature not implemented"
6038, 1, "recovery catalog package detected an error"
// *Cause:  A call to DBMS_RCVMAN returned an error.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
6039, 1, "SET NEWNAME command has not been issued for datafile %s"
// *Cause:  A SWITCH command was specified for a datafile, but no destination
//          was specified and no SET NEWNAME command has been previously
//          issued for that file.  An explicit file to switch to must be 
//          specified if no SET NEWNAME command has been issued.
// *Action: Correct and resubmit the SWITCH command.
6040, 1, "control file is already restored to file %s"
// *Cause:  The best candidate control file for restoration is the one that
//          is named in the RESTORE CONTROLFILE command, hence no action
//          need be taken.
// *Action: None - this is an informational message.
6041, 1, "cannot switch file %d to copy of file %d"
// *Cause:  An attempt was made to switch a datafile to a copy of a different
//          datafile.
// *Action: Correct and resubmit the SWITCH command.
6042, 1, "PLUS ARCHIVELOG option is not supported with non-datafile backups"
// *Cause: The PLUS ARCHIVELOG option was supplied but does not apply
//         to this type of backup.
// *Action: Remove the PLUS ARCHIVELOG operand and re-enter the command.
6043, 1, "TAG option not supported for archived log copies"
// *Cause: The tag option was supplied but does not apply to this type
//         of copy.
// *Action: Remove the TAG operand and re-enter the command
6044, 1, "duplicate operand specified in copy specification: %s"
6045, 1, "LEVEL option not supported for archived log or current/standby control file copies"
// *Cause:  The LEVEL option was supplied but does not apply to this type
//          of copy.
// *Action: Remove the LEVEL operand and re-enter the command.
6046, 1, "archived log name: %s"
// *Cause:  An error occurred while translating an archived log name to its
//          recovery catalog RECID/time stamp.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
6047, 1, "duplicate datafile %d specified for restoration from copy"
// *Cause:  The indicated datafile was specified more than once in the
//          same restore command.
// *Action: Correct and resubmit the RESTORE command.
6048, 1, "duplicate control file specified for restoration from copy"
// *Cause:  The control file was specified more than once in the same
//          RESTORE command.
// *Action: Correct and resubmit the RESTORE command.
6049, 1, "CHECK LOGICAL option not supported for archived log or current/standby control file copies"
// *Cause: The check logical option was supplied but does not apply to
//         this type of copy.
// *Action: Remove the CHECK LOGICAL operand and re-enter the command
6050, 1, "archived log for thread %d with sequence %d is already on disk as file %s"
// *Cause:  An archived log which was requested to be restored (either
//          explicitly or via a range specification) does not need to
//          be restored because it already exists on disk.
// *Action: None - this is an informational message
6051, 1, "DELETE INPUT option not implemented yet"
// *Cause: This option was specified in a backup specification.
// *Action: Remove the DELETE INPUT option.
6052, 1, "no parent backup or copy of datafile %d found"
// *Cause:  An incremental backup at level 1 or higher could not find
//          any parent backup or copy of the indicated datafile.
//          A level 0 backup of the datafile will be taken automatically.
// *Action: This is an informational message only.
6053, 1, "unable to perform media recovery because of missing log"
// *Cause: This message is accompanied with another message identifying
//         the missing log.  The log would be needed to perform the media
//         recovery, but the log is not on disk and no backup set containing
//         the log is available.
// *Action: Determine if a backup set containing the log can be made
//          available.  If so, then use the CHANGE command to make the 
//          backup set available and retry the command.  If not, then a 
//          point-in-time recovery up to the missing log is the only 
//          alternative.
6054, 1, "media recovery requesting unknown archived log for thread %s with sequence %s and starting SCN of %s"
// *Cause: Media recovery is requesting a log whose existence is not
//         recorded in the recovery catalog or target database control file.
// *Action: If a copy of the log is available, then add it to the recovery
//          catalog and/or control file via a CATALOG command and then
//          retry the RECOVER command.  If not, then a point-in-time recovery
//          up to the missing log is the only alternative and database can
//          be opened using ALTER DATABASE OPEN RESETLOGS command.
6055, 1, "could not find archived log with sequence %s for thread %s"
// *Cause: A log which was on disk at the start of media recovery or which
//         should have been restored from a backup set could not be found.
// *Action: Check the Recovery Manager message log to see if the log was
//          restored by a previous job step.  If so, then check the
//          V$ARCHIVED_LOG view to see if the log is listed in the
//          control file. If so, then validate that the log exists on disk
//          and is readable.  If the log was not restored, or was restored
//          but no record of the log exists in V$ARCHIVED_LOG, then contact
//          Oracle Support Services.
6056, 1, "could not access datafile %d"
// *Cause:  A backup or copy could not proceed
//          because the datafile header could not be read or the header
//          was not valid.
// *Action: Make the datafile accessible or skip it.
6057, 1, "a standby control file cannot be included along with a current control file"
// *Cause:  "current control file" was specified along with
//          "standby control file".
// *Action: Remove "current control file" or "standby control file" from
//          backup specification.
6058, 1, "a current control file cannot be included along with a standby control file"
// *Cause:  "standby control file" was specified along with
//          "current control file".
// *Action: Remove "standby control file" or "current control file" from
//          backup specification.
6059, 1, "expected archived log not found, loss of archived log compromises recoverability"
// *Cause:  The archived log was not found. The recovery catalog or target
//          database control file thinks it does exist. If the archived log
//          has in fact been lost and there is no backup, then the database
//          is no longer recoverable across the point-in-time covered by the
//          archived log. This may occur because the archived log was removed
//          by an outside utility without updating the recovery catalog or
//          target database control file.
// *Action: If the archived log has been removed with an outside utility
//          and the archived log has already been backed up, then you can
//          synchronize the recovery catalog or target database control file
//          by running CROSSCHECK ARCHIVELOG ALL. If the archived log has
//          not been previously backed up, then you should take a full
//          backup of the database and archived logs to preserve
//          recoverability. Previous backups are not fully recoverable.
6060, 3, "WARNING: skipping datafile compromises tablespace %s recoverability"
// *Cause:  SKIP INACCESSIBLE or SKIP OFFLINE option resulted in skipping
//          datafile during BACKUP. If the datafile has in fact been lost
//          and there is no backup, then the tablespace is no longer
//          recoverable without ALL archived logs since datafile creation.
//          This may occur because the datafile was deleted by an outside
//          utility or the datafile is made OFFLINE [DROP].
// *Action: If there is no backup of skipped datafile and the tablespace has
//          to be recoverable without ALL archived logs since datafile
//          creation, then you should make these datafile available for 
//          backup.
6061, 3, "WARNING: skipping archived log compromises recoverability"
// *Cause:  SKIP INACCESSIBLE option resulted in skipping archived logs during
//          BACKUP. If the archived log has in fact been lost and there is
//          no backup, then the database is no longer recoverable across
//          the point-in-time covered by the archived log. This may occur
//          because archived log was removed by an outside utility without
//          updating the recovery catalog or target database control file.
// *Action: If the archived log has been removed with an outside utility
//          and the archived log has already been backed up, then you can
//          synchronize the recovery catalog or target database control file
//          by running CROSSCHECK ARCHIVELOG ALL.
//          If the archived log has not been previously backed up, then you
//          should take a full backup of the database and archived logs to
//          preserve recoverability. Previous backups are not fully
//          recoverable.
6062, 1, "can not backup SPFILE because the instance was not started with SPFILE"
// *Cause:  A backup command requested a backup of the SPFILE, but no SPFILE
//          was used to startup the instance.
// *Action: Create an SPFILE and re-start the instance using the SPFILE or
//          modify the command.
6063, 1, "DBID is not found in the recovery catalog"
// *Cause:  DBID is not found in the recovery catalog.
// *Action: Verify that the DBID is correct and restart the command.
6064, 1, "creating datafile file number=%s name=%s"
// *Cause: RESTORE/RECOVER command was issued and there were no backup 
//         available for the datafile.
// *Action: This is an informational message only.
6065, 1, "The backup operand [%s] conflicts with another specified operand."
// *Cause:  The user attempted to use two (or more) conflicting operands
//          within the same statement.
// *Action: Remove one or both of the conflicting operands. 
6066, 1, "the target database must be mounted when issuing a RECOVER command"
// *Cause: A RECOVER command was issued, but the target database control file
//         is not mounted.
// *Action: Mount the target database control file by issuing
//          ALTER DATABASE MOUNT via Enterprise Manager or Server Manager.
6067, 1, "RECOVER DATABASE required with a backup or created control file"
// *Cause: The control file has been restored from a backup or was created
//         via ALTER DATABASE CREATE CONTROLFILE.
// *Action: Use the RECOVER DATABASE command to perform the recovery.
6068, 1, "recovery aborted because of missing datafiles"
// *Cause: This error should be accompanied by one or more instances of
//         message ORA-06094.
// *Action: Refer to message ORA-06094.
6069, 1, "the file name for datafile %s is missing in the control file"
// *Cause: Media recovery of a backup control file added this datafile to
//         the control file, but it does not set the file name because that
//         is unsafe.
// *Action: If the datafile is on disk, then issue ALTER DATABASE RENAME
//          to correct the control file.  Otherwise, RESTORE the datafile,
//          and then use SWITCH to make it known to the control file.
//          If the tablespace containing this datafile will be dropped,
//          then reissue the RECOVER command with a SKIP clause to skip
//          recovery of this tablespace.
6070, 1, "DBWR could not identify datafile %s"
// *Cause: DBWR could not find the specified datafile.
// *Action: Ensure that the datafile exists and is accessible.
6071, 1, "could not open datafile %s"
// *Cause: An error was encountered when trying to open the specified
//         datafile.
// *Action: Ensure that the datafile exists and is accessible.
6073, 1, "file header is corrupt for datafile %s"
// *Cause: ORACLE detected a corruption in the file header.  A media failure
//         has probably occurred.
// *Action: RESTORE the datafile to a new location, then do a SWITCH,
//          and then retry the RECOVER command.
6074, 1, "file %s is not an ORACLE datafile"
// *Cause: The file header indicates that this file is not a datafile.
//         The file may have been overlaid or corrupted.
// *Action: RESTORE the datafile to a new location, then do a SWITCH,
//          and then retry the RECOVER command.
6075, 1, "datafile %s does not belong to this database"
// *Cause: The file header indicates that this file belongs to some
//         other ORACLE database.
// *Action: RESTORE the datafile to a new location, then do a SWITCH,
//          and then retry the RECOVER command.
6076, 1, "datafile %s contains wrong datafile"
// *Cause: The datafile header indicates the file contains a different
//         datafile number.
// *Action: RESTORE the datafile, and then retry the RECOVER command.
6077, 1, "datafile %s is a different version than contained in the control file"
// *Cause: The control file entry for this datafile specifies a different
//         version of this datafile.  Different versions of a datafile can
//         exist when a tablespace is dropped, and a new tablespace is
//         created which reuses the same datafile numbers.
// *Action: If the datafile is correct, the fix the control file by using
//          the SWITCH command.  Otherwise, RESTORE the correct version of
//          this datafile and retry the RECOVER command.
6078, 1, "the control file is older than datafile %s"
// *Cause: The control file appears to be older than the specified datafile,
//         but it is not marked as a backup control file.  This indicates that
//         the control file has been replaced with an older version.  This
//         error does not occur when a backup control file which was created 
//         via Recovery Manager or the ALTER DATABASE BACKUP CONTROLFILE
//         command is restored because such control files are marked as
//         backups.
// *Action: RESTORE a control file and perform RECOVER DATABASE.
6079, 1, "database must be mounted to perform recovery"
// *Cause: A RECOVER command was issued, but the target database is
//         not mounted.
// *Action: Issue ALTER DATABASE MOUNT.
6080, 1, "SWITCH required for datafile %s"
// *Cause: The control file record for this datafile is for an older
//         incarnation of the datafile.  A SWITCH command must be issued to
//         updated the control file before doing RECOVER.
// *Action: Issue SWITCH command then retry RECOVER.
6081, 1, "error reading datafile header for datafile %s, code %s"
// *Cause: X$KCVFH returned the specified code in the HXERR column when
//         it was queried for the specified datafile.
// *Action: Ensure the datafile exists and is readable.  Using a newer
//          release of Recovery Manager may return a more meaningful error
//          message.  If you have no newer version of Recovery Manager,
//          contact Oracle Support Services.
6082, 1, "datafile copy tag %s is ambiguous"
// *Cause: The specified tag refers to multiple datafile copies belonging
//         to different datafiles.
// *Action: Specify the datafile copy by file name rather than by tag.
6083, 1, "error when loading stored script %s"
// *Cause: The recovery catalog database returned an error.  This error
//         explains the cause of the problem.
// *Action: Correct the problem and retry.
6084, 1, "the target database may not be mounted when issuing REPLICATE"
// *Cause: A REPLICATE command was issued, but the target database
//         is already mounted.
// *Action: dismount the target database control file by issuing
//          ALTER DATABASE CLOSE and ALTER DATABASE DISMOUNT
//          via Enterprise Manager or Server Manager.
6085, 1, "must use SET NEWNAME command to restore datafile %s"
// *Cause: A RESTORE command for the specified datafile could not find a
//         destination name for the specified datafile.
// *Action: Add a SET NEWNAME command prior to the RESTORE command to specify
//          the restore destination for this file.
6086, 1, "offline files may only be skipped in a datafile backup set"
// *Cause:  The SKIP OFFLINE option was specified for an archived log
//          backup set.
// *Action: Use this option only for datafile backup sets.
6087, 1, "read-only files may only be skipped in a datafile backup set"
// *Cause:  The SKIP READONLY option was specified for an archived log
//          backup set.
// *Action: Use this option only for datafile backup sets.
6088, 1, "datafile copy %s not found or out of sync with catalog"
// *Cause:  The indicated file is not found, or is found but is not the same
//          file that the recovery catalog
//          thinks it is.  It is likely that some operation outside of
//          Recovery Manager has altered the file, or that Recovery Manager
//          has not resynced with the target database.
// *Action: Re-catalog the file and retry the operation.
6089, 1, "archived log %s not found or out of sync with catalog"
// *Cause:  The indicated file is not found, or is found but is not the same
//          file that the recovery catalog
//          thinks it is.  It is likely that some operation outside of
//          Recovery Manager has altered the file, or that Recovery Manager 
//          has not resynced with the target database.
// *Action: Re-catalog the file and retry the operation.
6090, 1, "error while looking up control file copy: %s"
// *Cause:  An error occurred while looking up the specified control file copy
//          in the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.  Ensure that the file name is entered correctly.
//          If the control file copy was created when the recovery catalog
//          was not available, then a RESYNC CATALOG must
//          be done to update the recovery catalog.
6091, 1, "no channel allocated for maintenance (of an appropriate type)"
// *Cause:  A command was entered that requires a maintenance channel, and no
//          maintenance channel is allocated, or none of the appropriate type.
// *Action: Use ALLOCATE CHANNEL FOR MAINTENANCE before deleting backup
//          pieces, or using the CROSSCHECK or DELETE EXPIRED commands.
//          Proxy copies require a non-DISK channel.
6092, 1, "error while looking up backup piece"
// *Cause:  An error occurred while looking up the specified backup
//          piece in the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.  Ensure that the name or key is entered
//          correctly.  If the backup piece was created when the recovery
//          catalog was not available, then a RESYNC CATALOG must
//          be done to update the recovery catalog.
6093, 1, "recovery catalog contains obsolete version of datafile %s"
// *Cause: The specified datafile number was dropped and then reused.
//         The control file mounted by the target database contains the
//         newer version of the datafile, but the recovery catalog contains
//         information about only the older version.
// *Action: Issue a RESYNC command to update the recovery catalog, then
//          reissue the failing command.  If the error persists, contact
//          Oracle Support Services.
6094, 1, "datafile %s must be restored"
// *Cause: A RECOVER command was issued, and the recovery catalog indicates
//         the specified datafile should be part of the recovery, but
//         this datafile is not listed in the control file, and cannot be
//         found on disk.
// *Action: Issue a RESTORE command for this datafile, using the same
//          UNTIL clause specified to the RECOVER command (if any), then
//          reissue the RECOVER.
6095, 1, "a backup control file must be restored to recover datafile %s"
// *Cause: The control file currently mounted by the target database 
//         contains a newer incarnation of the datafile than the recovery 
//         catalog indicates is appropriate for the Point-in-Time being 
//         recovered to.
// *Action: Restore the control file, using the same UNTIL clause specified
//          on the failing RECOVER command, then reissue the
//          command.  If no control file can be restored, then you should
//          issue a CREATE CONTROLFILE command.
6096, 1, "SWITCH required for newname of datafile %s to take effect"
// *Cause: A SET NEWNAME was issued for this datafile, but no SWITCH
//         command was issued before the RECOVER command.
// *Action: Issue a SWITCH command to make the newname take effect before
//          doing RECOVER.
6097, 1, "text of failing SQL statement: %s"
// *Cause:
// *Action: This is an informational message to accompany message 6003 or 
//          message 6004.
6098, 1, "the target database must be mounted when issuing a BACKUP command"
// *Cause: A BACKUP command was issued, but the target database control file
//         is not mounted.
// *Action: Mount the target database control file by issuing
//          ALTER DATABASE MOUNT via Enterprise Manager or Server Manager.
6099, 1, "error occurred in source file: %s, line: %d"
// *Cause: See accompanying error.
// *Action: See accompanying error.
6100, 1, "no channel to restore a backup or copy of datafile %d"
// *Cause:  A datafile, tablespace, or database restore could not proceed
//          because the backup of the indicated file exists on a device type
//          that was not allocated for restore.
// *Action: None - this is an informational message.  See message 6026 for
//          further details.
6101, 1, "no channel to restore a backup or copy of the control file"
// *Cause:  A control file restore could not proceed
//          because the backup of the indicated file exists on a device type
//          that was not allocated for restore.
// *Action: None - this is an informational message.  See message 6026 for
//          further details.
6102, 1, "no channel to restore a backup or copy of archived log for thread %d with sequence %d and starting SCN of %s"
// *Cause:  An archived log restore restore could not proceed
//          because the backup of the indicated file exists on a device type
//          that was not allocated for restore.
// *Action: None - this is an informational message.  See message 6026 for
//          further details.
6103, 1, "duplicate qualifier found in REPORT command: %s"
// *Cause: The indicated qualifier appears more than once in a REPORT
//         qualifier list.
// *Action: delete the duplicate qualifier
6105, 1, "duplicate qualifier found in LIST command: %s"
// *Cause: The indicated qualifier appears more than once in a LIST qualifier
//         list.
// *Action: delete the duplicate qualifier
6106, 1, "this command requires that target database be mounted"
// *Cause: A command was issued that requires the target database to be
//         mounted, but the target database is not mounted.
// *Action: Mount the target database control file by issuing
//          ALTER DATABASE MOUNT via Enterprise Manager or Server Manager.
6107, 3, "WARNING: control file is not current for REPORT NEED BACKUP DAYS"
// *Cause: The REPORT NEED BACKUP DAYS command may report some files as
//         requiring backups when they really do not, because the most current
//         online status of the file is not known unless a current
//         control file is mounted.
// *Action: No action is required, however, a current control file should be
//          mounted, if possible, to get the most accurate REPORT output.
6108, 1, "changed datafile copy unavailable"
// *Cause: This is an informational message only.
// *Action: No action is required.
6109, 1, "changed archived log unavailable"
// *Cause: This is an informational message only.
// *Action: No action is required.
6110, 1, "changed control file copy unavailable"
// *Cause: This is an informational message only.
// *Action: No action is required.
6111, 1, "changed backup piece unavailable"
// *Cause: This is an informational message only.
// *Action: No action is required.
6112, 1, "changed datafile copy available"
// *Cause: This is an informational message only.
// *Action: No action is required.
6113, 1, "changed archived log available"
// *Cause: This is an informational message only.
// *Action: No action is required.
6114, 1, "changed control file copy available"
// *Cause: This is an informational message only.
// *Action: No action is required.
6115, 1, "changed backup piece available"
// *Cause: This is an informational message only.
// *Action: No action is required.
6116, 1, "cannot crosscheck unavailable object"
// *Cause: An attempt was made to crosscheck an object which is unavailable.
// *Action: Make object available and try again or don't crosscheck object.
6117, 1, "cannot do DELETE EXPIRED on an object which is not expired"
// *Cause: An attempt was made to DELETE EXPIRED an object which is not 
//         expired.
// *Action: Remove EXPIRED keyword, crosscheck object, or don't delete object.
6118, 1, "a backup control file older than SCN %s must be used for this recovery"
// *Cause: An attempt was made to recover the database, but some files had no
//         backup, and were not present in the control file at the beginning
//         of the restore.  This happens when the control file used during the
//         recovery is a backup control file taken before the creation of some
//         of the files that had no backup.  In this situation, the control 
//         file that is used must be taken before the creation of all files 
//         that have no backup.  This will enable RMAN to automatically 
//         re-create all of the files that had no backup.
// *Action: Restore a control file that was backed up before the specified
//          system change number (SCN).
//          The following RMAN commands can be used to do this:
//            SET UNTIL SCN <x>; (where <x> is the SCN displayed in the 
//                                message)
//            RESTORE CONTROLFILE;
6119, 1, "uncataloged datafile copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
6120, 1, "uncataloged archived log"
// *Cause: This is an informational message only.
// *Action: No action is required.
6121, 1, "uncataloged control file copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
6122, 1, "CHANGE .. UNCATALOG not supported for BACKUPSET"
// *Cause: The CHANGE BACKUPSET .. UNCATALOG command was entered.
//         The UNCATALOG operation is not supported with backup set.
// *Action: Use CHANGE BACKUPSET .. DELETE instead.
6123, 1, "operation not supported without the recovery catalog or mounted control file"
// *Cause: A command was used which requires a connection to a recovery
//         catalog database or the target database to be mounted.  The command
//         cannot be used when no backup repository is available.
// *Action: If a recovery catalog database is available, then connect to the
//          recovery catalog and retry the command, otherwise enter a
//          different command.
6124, 1, "error while looking up datafile copy key: %d"
// *Cause:  An error occurred while looking up the specified datafile copy
//          key in the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.
6125, 1, "error while looking up archived log key: %d"
// *Cause:  An error occurred while looking up the specified archived log key
//          in the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.
6126, 1, "skipping offline file %s"
// *Cause:  The indicated file will not be included in the backup set because
//          it is offline and the SKIP OFFLINE option was specified.
// *Action: No action is required.
6127, 1, "skipping read-only file %s"
// *Cause:  The indicated file will not be included in the backup set because
//          it is read only and the SKIP READONLY option was specified.
// *Action: No action is required.
6128, 1, "skipping inaccessible file %s"
// *Cause:  The indicated file will not be included in the backup set because
//          it could not be read, and the SKIP INACCESSIBLE option was
//          specified.
// *Action: No action is required.
6129, 1, "invalid reserved channel ID: %s"
// *Cause:  The specified channel id is invalid.  DELETE and DEFAULT are
//          reserved channel names and may not be specified by users.
// *Action: Specify a different channel ID.
6130, 1, "snapshot control file name set to: %s"
6131, 1, "SKIP OFFLINE/READONLY only allowed with current control file"
// *Cause:  The SKIP OFFLINE and SKIP READONLY options are only permitted
//          when the target database control file is current.  When the
//          target control file is not current, it is not possible to obtain
//          a datafile's offline/read only status.
// *Action: Remove the skip option or mount a current control file on the
//          target database.
6132, 1, "cannot backup datafile %s because it is not in the control file"
// *Cause: A backup command was issued that includes the specified datafile,
//         but the datafile is not listed in the control file.  The
//         control file is not current (it is a backup or a created
//         control file).
// *Action: Recover the control file to make it current, then retry the
//          backup command.
6133, 1, "recovery catalog may have obsolete data for datafile %s"
// *Cause: A RESTORE UNTIL was issued, and the recovery catalog choose
//         an older incarnation of the datafile than is listed in the
//         control file.
// *Action: If the recovery catalog has correct data for the datafile,
//          then restore a backup control file using the same UNTIL clause,
//          then retry the datafile restore.  Otherwise, restore a backup
//          of the incarnation of the datafile listed in the control file.
6134, 1, "host command complete"
// *Cause: An operating system command has completed.
// *Action: None - this is an informational message.
6135, 1, "error executing host command: %s"
// *Cause: A host command returned a non-zero return code.
// *Action: Correct the offending command.
6136, 1, "ORACLE error from auxiliary database: %s"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
6137, 1, "must have recovery catalog for REPORT SCHEMA AT TIME"
// *Cause: A 'REPORT SCHEMA at_clause' command was issued, but there is no
//         recovery catalog database.
// *Action: If you are not using a recovery catalog, then you may only issue
//          the 'REPORT SCHEMA' command with no at_clause.
6138, 1, "control file not mounted - must specify AT clause with REPORT command"
// *Cause: A 'REPORT SCHEMA' with no at_clause was issued, and there is no
//         recovery catalog, and there is also no control file mounted at the
//         target database, so there is no place to get the information about
//         the current list of files comprising the database.
// *Action: Use a recovery catalog or mount a control file at the target
//          database.
6139, 3, "WARNING: control file is not current for REPORT SCHEMA"
// *Cause: A 'REPORT SCHEMA' with no at_clause was issued, and there is no
//         recovery catalog, and the control file mounted by the target
//         instance is not current, so the information about the current list
//         of datafiles may not be current.
// *Action: Use a recovery catalog or mount a current control file.
6140, 1, "cannot specify TAG option with LIST INCARNATION"
// *Cause: The TAG option was specified with LIST INCARNATION.  This is not
//         permitted because there is no TAG associated with a database
//         incarnation.
// *Action: Remove the TAG option and re-run the LIST command. 
6141, 1, "cannot specify ARCHIVELOG LIKE option with RESTORE"
// *Cause: The ARCHIVELOG LIKE option was specified with RESTORE.  This is not
//         permitted because recovery catalog contains only those records
//         that are not deleted from disk.
// *Action: Remove the ARCHIVELOG LIKE option and re-run the command.
6142, 1, "DEVICE TYPE cannot be specified with this command"
// *Cause: The DEVICE TYPE option was specified with a command that does
//         not support it.
// *Action: Remove the DEVICE TYPE option and re-run the command.
6143, 1, "LIKE may only be specified with COPY"
// *Cause: The LIKE option was specified with a RMAN command. This is
//         not permitted because only copies of datafiles, control files or
//         archived logs have file names that may be tested with a LIKE 
//         operand.
// *Action: Remove the LIKE option and re-run the RMAN command.
6144, 1, "FROM or UNTIL may not be specified with LIST INCARNATION"
// *Cause: The FROM or UNTIL option was specified with LIST INCARNATION.
//         This is not
//         permitted because there is no time associated with
//         a database incarnation.
// *Action: Remove the FROM or UNTIL option and re-run the LIST command.
6145, 1, "control file is not current - obsolete file list may be incomplete"
// *Cause: A CHANGE or REPORT command needs to compute the list of backups
//         that are redundant and may be deleted.  If the mounted control file
//         is not current, it may not be possible to determine if a
//         satisfactory backup exists for files which have been offline since
//         the last OPEN RESETLOGS.
// *Action: No action need be taken - this is an informational message only.
//          To ensure a complete report of obsolete backups, mount a current
//          control file.
6146, 1, "changes found for file %d beyond offline SCN"
// *Cause: A CHANGE or REPORT command needs to compute the list of backups 
//         that are redundant and may be deleted.  A backup was found for a
//         file which is shown as offline in the target database control file,
//         but the backup contains changes beyond the system change number(SCN)
//         when the file went offline.  This is most likely because the
//         target database control file is not really current, but is a
//         restored copy of an older control file.
// *Action: Mount a current control file or a backup control file.
6147, 1, "no obsolete backups found"
// *Cause: A CHANGE or REPORT command could find no files that meet the
//         specified criteria for obsoleteness.
// *Action: None - this is an informational message.
6148, 1, "redundancy count must be greater than zero"
// *Cause: The REDUNDANCY operand specified for a CHANGE or REPORT OBSOLETE
//         command was zero.
// *Action: Specify a REDUNDANCY operand of 1 or greater.
6150, 1, "auxiliary name for datafile %d set to: %s"
// *Cause: This message is issued in response to a CONFIGURE AUXNAME command.
// *Action: None - this is an informational message.
6151, 1, "datafile %s creation SCN %s"
// *Cause: This is an informational message.  It should be accompanied
//         by other messages.
// *Action:  none
6153, 1, "validation failed for datafile copy"
// *Cause: The CHANGE DATAFILECOPY VALIDATE command discovered that the
//         datafile copy could not be found or no longer contains the
//         same data, so its record was deleted from the recovery catalog
//         or target database control file.
// *Action: None - this is an informational message.
6154, 1, "validation succeeded for datafile copy"
// *Cause: The CHANGE DATAFILECOPY VALIDATE command discovered that the 
//         datafile copy still matches its data in the recovery catalog or
//         target database control file.
// *Action: None - this is an informational message.
6155, 1, "validation failed for control file copy"
// *Cause: The CHANGE CONTROLFILECOPY VALIDATE command discovered that the
//         control file copy could not be found or no longer contains the same
//         data, so its record was deleted from the recovery catalog or target
//         database control file.
// *Action: None - this is an informational message.
6156, 1, "validation succeeded for control file copy"
// *Cause: The CHANGE CONTROLFILECOPY VALIDATE command discovered that the
//         control file copy still matches its data in the recovery catalog
//         or target database control file.
// *Action: None - this is an informational message.
6157, 1, "validation failed for archived log"
// *Cause: The CROSSCHECK ARCHIVELOG command determined that the archived log
//         could not be found or no longer contained the same data, so its
//         record was marked expired.
// *Action: None - this is an informational message.
6158, 1, "validation succeeded for archived log"
// *Cause: The CROSSCHECK ARCHIVELOG command or VALIDATE HEADER option
//         determined that the archived log still matches its data.
// *Action: None - this is an informational message.
6159, 1, "error while looking up backup set"
// *Cause:  An error occurred while looking up the specified backup set
//          in the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.  Ensure that the key is entered correctly.
//          If the backup set was created when the recovery catalog
//          was not available, then a RESYNC CATALOG must
//          be done to update the recovery catalog.
6160, 1, "no backup pieces found for backup set key: %d"
// *Cause:  No backup pieces for the requested backup set were found in the
//          recovery catalog, or the target database control file.
// *Action: Specify an existing backup set.
6161, 1, "error when inspecting auxiliary file name: %s"
// *Cause: This error is accompanied by other errors explaining the cause.
// *Action: Correct the auxiliary file name if it is wrong via the
//          CONFIGURE AUXNAME command.
6162, 1, "sql statement: %s"
// *Cause:  This is the sql statement about to be executed for a SQL command.
// *Action: None, informational message only.
6163, 1, "some datafiles cannot be recovered, aborting the RECOVER command"
// *Cause: This message should be followed by one or more 6162 or
//         6164 messages.
// *Action: Check the accompanying errors.
6164, 3, "WARNING: no channel of required type allocated to recover datafile %d"
// *Cause: A RECOVER command could not proceed because incremental backup sets
//         or archived log backup sets exist on a device type that has not
//         been allocated.
// *Action: Use the LIST command to determine which device type is needed,
//          then allocate a channel of that type.
6165, 1, "datafile %s is too old to recover, restore a more recent copy"
// *Cause: The archived logs and/or incremental backup sets required to
//         recover the datafile do not exist, but a more recent backup
//         of the datafile exists which can be recovered.
// *Action: Issue a RESTORE for the datafile, then reissue the RECOVER
//          command.
6166, 1, "datafile %s cannot be recovered"
// *Cause: Incremental backups or archived redo logs needed to recover the
//         datafile cannot be found, and no recoverable full backup or
//         datafile copy exists.
// *Action: Use the LIST command to see if there is a backup set or datafile
//          copy that can be made AVAILABLE.  If not, then the datafile
//          is unrecoverable.  If a full or datafile copy exists, then
//          a Point-in-Time Recovery may be possible.
6167, 1, "already connected"
// *Cause: a CONNECT command was issued, but RMAN is already connected
//         to the specified database.
// *Action: RMAN has no DISCONNECT command, so to connect to a different
//          instance, exit RMAN and start it again.
6168, 1, "no backup pieces with this tag found: %s"
// *Cause: A tag was used to specify a list of backup pieces, but no
//         backup pieces with this tag could be found.
// *Action: Make sure the tag is specified correctly.
6169, 3, "could not read file header for datafile %s error reason %s"
// *Cause: The specified datafile could not be accessed.  The reason
//         codes are:
//         1  - file name is MISSINGxx in the control file
//         2  - file is offline
//         3  - file is not verified
//         4  - DBWR could not find the file
//         5  - unable to open file
//         6  - I/O error during read
//         7  - file header is corrupt
//         8  - file is not a datafile
//         9  - file does not belong to this database
//         10 - file number is incorrect
//         12 - wrong file version
//         15 - control file is not current
// *Action: If the error can be corrected, do so and retry the operation.
//          The SKIP option can be used to ignore this error during a backup.
6170, 1, "no control file copy found with offline range RECID %s STAMP %s datafile %s"
// *Cause: This offline range is needed for recovering the specified data
//         file, but the offline range record has aged out of the current
//         control file and no control file copy with the record could be
//         accessed.  At least 1 control file copy containing the offline
//         range was found in the recovery catalog and was in AVAILABLE
//         status.
// *Action: Query the RC_CONTROLFILE_COPY view for the names of all
//          control file copies, then issue a
//          CHANGE CONTROLFILECOPY ... VALIDATE; command for them.
//          Then reissue the RECOVER command.
6171, 1, "not connected to target database"
// *Cause: A command was issued but no connection to the target database
//         has been established.
// *Action: Issue a CONNECT TARGET command to connect to the target database.
6172, 1, "no AUTOBACKUP found or specified handle is not a valid copy or piece"
// *Cause:  A restore could not proceed because no AUTOBACKUP was found or
//          specified handle is not a valid copy or backup piece.
//          In case of restore from AUTOBACKUP, it may be the case that a
//          backup exists, but it does not satisfy the criteria specified in
//          the user's restore operands.
//          In case of restore from handle, it may be the handle is not a 
//          backup piece or control file copy. In may be that it does not 
//          exist.
// *Action: Modify AUTOBACKUP search criteria or verify the handle.
6173, 1, "SET NEWNAME command has not been issued for datafile %s when restore auxiliary"
// *Cause:  Auxiliary type was specified for the control file, but no
//          SET NEWNAME command has been previously issued for a datafile.
// *Action: Issue SET NEWNAME command for every datafile in the recovery set.
6174, 1, "not connected to auxiliary database"
// *Cause: An auxiliary command was issued but no connection to a
//         auxiliary database has been established.
// *Action: Issue a CONNECT AUXILIARY command to
//          connect to the auxiliary database.
6175, 1, "deleted script: %s"
// *Cause: A DELETE SCRIPT command was executed.
// *Action: None, informational message only.
6176, 1, "no recovery required; all files are read only or offline"
// *Cause: A RECOVER DATABASE command does not need to
//         recover any files because all of the files to be recovered are
//         offline or read only.  This can only occur when the SKIP clause
//         includes the SYSTEM tablespace.
// *Action: None, informational message only
6177, 1, "restore not done; all files read only, offline, or already restored"
// *Cause: A RESTORE command does not need to restore any files,
//         because all of the files to be restored are offline, read-only, or
//         are already restored to their correct destinations.
// *Action: None, informational message only
6178, 1, "datafile %d not processed because file is offline"
// *Cause: A RESTORE DATABASE or RECOVER DATABASE command omitted processing
//         the indicated datafile because it is offline clean at the desired
//         point-in-time.
// *Action: None, informational message only
6179, 1, "datafile %d not processed because file is read-only"
// *Cause: A RESTORE DATABASE or RECOVER DATABASE command omitted processing
//         the indicated datafile because it is part of a read-only
//         tablespace at the desired point-in-time.
// *Action: None, informational message only
//
6180, 1, "incremental backups require Enterprise Edition"
// *Cause: A BACKUP command with INCREMENTAL LEVEL > 0 was specified.
// *Action: Use FULL, or INCREMENTAL LEVEL 0.
6181, 1, "multiple channels require Enterprise Edition"
// *Cause: Attempt to allocate more than 1 channel in a job.
// *Action: Remove all except one ALLOCATE CHANNEL command.
6182, 1, "archived log %s of thread %s with sequence %s larger than MAXSETSIZE"
// *Cause: A BACKUP ARCHIVELOG command specified the MAXSETSIZE operand too
//         low.  The specified archived log is larger than MAXSETSIZE will 
//         allow.
// *Action: Increase MAXSETSIZE limit.
6183, 1, "datafile or datafile copy %s (file number %s) larger than MAXSETSIZE"
// *Cause: A BACKUP DATAFILE(copy) command specified the MAXSETSIZE operand
//         too low.  The specified datafile is larger than MAXSETSIZE will
//         allow.
// *Action: Increase MAXSETSIZE limit.
6184, 1, "duplicate object in backup specifier: %s %s"
// *Cause: A backup command specifies the same datafile or copy of a data
//         file multiple times.
// *Action: Eliminate the duplicates.
6185, 1, "Recovery Manager incompatible with %s database: RMAN %d.%d.%d.%d to %d.%d.%d.%d required"
// *Cause: This version of recovery manager was incompatible with the
//         indicated database or the DBMS_BACKUP_RESTORE package
//         installed in the indicated database.
// *Action: If the database has been upgraded from an earlier version, ensure
//          that the catxxxx.sql script has been run successfully.
//          Re-install dbmsbkrs.sql and prvtbkrs.plb if necessary.
//          Otherwise, use a version of RMAN within the range specified
//          in the error message.
6186, 1, "PL/SQL package %s.%s version %s in %s database is too old"
// *Cause: The specified PL/SQL package is a version that is too old to work
//         with this version of the Recovery Manager (RMAN).
// *Action: If the database indicated is CATALOG, then you can use the
//          UPGRADE CATALOG command to upgrade the recovery catalog to the
//          most current version.  If the database is TARGET or AUXILIARY,
//          then you must either upgrade the specified database or use
//          an older version of RMAN.
6187, 1, "control file copy %s not found or out of sync with catalog"
// *Cause:  The indicated file is not found, or is found but is not the same
//          file that the recovery catalog
//          thinks it is.  It is likely that some operation outside of
//          Recovery Manager has altered the file, or that Recovery Manager
//          has not resynced with the target database.
// *Action: Re-catalog the file and retry the operation.
6188, 1, "cannot use command when connected to a mounted target database"
// *Cause:  An attempt was made to issue a command that can be used only when
//          there is no connection to the target database or when the
//          target database is not mounted.
// *Action: Dismount the database or restart RMAN and use the command
//          before connecting to the target database.
6189, 1, "current DBID %u does not match target mounted database (%u)"
// *Cause: SET DBID was used to set a DBID that does not match the DBID
//         of the database to which RMAN is connected.
// *Action: If the current operation is a restore to copy the database,
//          do not mount the database. Otherwise, avoid using the SET DBID
//          command, or restart RMAN.
6190, 1, "PL/SQL package %s.%s version %s in %s database is not current"
// *Cause:  RMAN detected an old version of the specified package.
//          RMAN will execute in backwards-compatible mode.
// *Action: No action is required, but certain features and bug-fixes may not
//          be available when RMAN runs in backwards-compatible mode.
//          If the database is CATALOG, then you can use the
//          UPGRADE CATALOG command to upgrade the recovery catalog to the
//          most current version.
//          If the database is TARGET or AUXILIARY, then you must
//          either upgrade the specified database or use an older version of
//          RMAN.  The files that must be run to upgrade the target
//          or auxiliary database are dbmsrman.sql and prvtrman.plb.
6191, 1, "PL/SQL package %s.%s version %s in %s database is too new"
// *Cause:  RMAN detected an incompatible version of the specified package.
// *Action: Use a newer version of recovery manager.  Message 6439 indicates
//          the minimum required version of recovery manager.
6192, 1, "maximum value for MAXPIECESIZE or MAXSETSIZE must be between 1 Kb and 2048 Gb"
// *Cause:  Input size for MAXPIECESIZE or MAXSETSIZE was out of range.
// *Action: Specify a valid size and retry the command.
6193, 1, "connected to target database (not started)"
// *Cause:  This is an informational message only.
// *Action: The database must be started before any other RMAN commands
//          are issued.
6194, 1, "target database instance not started"
// *Cause:  A command was issued that requires the target database instance
//          be started.
// *Action: Issue a STARTUP command to start the instance.
6195, 1, "auxiliary database not started"
// *Cause: A command was issued that requires the auxiliary database instance
//         be started.
// *Action: Issue a STARTUP AUXILIARY command.
6196, 1, "Oracle instance started"
// *Cause: A STARTUP command completed successfully.
// *Action: None, this is an informational message.
6197, 1, "Total System Global Area %13s bytes"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6198, 1, "%-24s %13s bytes"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6199, 1, "database mounted"
// *Cause:  This is an informational message only.
// *Action: No action is required.
/
/ LIST/REPORT command messages occupy two sub-ranges of the krmk
/ messages.
/ The ranges are 6200-6399 and 7000-7500. Within these ranges, 10 contiguous
/ message numbers are reserved for each type of report.
/
6200, 1, "Changed %s objects to AVAILABLE status"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6201, 1, "Deleted %s objects"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6202, 1, "Deleted %s EXPIRED objects"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6203, 1, "Changed KEEP options for %s objects"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6204, 1, "Changed %s objects to UNAVAILABLE status"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6205, 1, "Uncataloged %s objects"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6206, 1, "Crosschecked %s objects"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6207, 3, "WARNING: %s objects could not be deleted for %s channel(s) due"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6208, 3, "         to mismatched status.  Use CROSSCHECK command to fix status"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6209, 3, "List of failed objects"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6210, 3, "List of Mismatched objects"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6211, 3, "=========================="
// *Cause:  This is an informational message only.
// *Action: No action is required.
6212, 3, "  Object Type   Filename/Handle"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6213, 3, "--------------- ---------------------------------------------------"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6214, 3, "%-15s %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6215, 3, "List of objects that must perform same operation at other database"
// *Cause:  This is an informational message only.
// *Action: The specified list of objects were not accessible at connected
//         target database. Re-run the CROSSCHECK command after connecting 
//         to database that has DB_UNIQUE_NAME displayed in output for
//         the specified object. 
6216, 3, "WARNING: db_unique_name mismatch - %s objects could not be updated"
// *Cause:  This is an informational message only.
// *Action: Run CROSSCHECK command after connecting to a primary or
//          physical standby database that can access the specified
//          objects.
6217, 1, "not connected to auxiliary database with a net service name"
// *Cause: A command that moves files from the target instance to the
//         auxiliary instance was requested.  Such a command requires a
//         net service name be present in the connect string used to
//         connect to the auxiliary instance.
// *Action: Issue a CONNECT AUXILIARY command and include a net serice name
//          in the connect string.  That service name must be valid on
//          the target instance.
6218, 3, "List of objects requiring same operation on database with db_unique_name %s"
// *Cause:  This is an informational message only.
// *Action: The specified list of objects were not accessible by the
//          target database. Re-run the same command after connecting
//          to database that has DB_UNIQUE_NAME displayed in output for
//          the specified object.
6219, 3, "List of objects not associated with all known db_unique_names"
// *Cause:  This is an informational message only.
// *Action: The specified list of objects were not accessible by the
//          target database. Re-run the same command after connecting
//          to primary database or physical standby database that can
//          access the specified objects.
6220, 1, "\nCreating automatic instance, with SID='%s'"
// *Cause: No connection to the auxiliary instance was provided, but the 
//         command requires an auxiliary instance.
// *Action: No action is required unless you want to create a permanent
//          database, in which case you should stop the command and re-run
//          it, providing an auxiliary instance connection.
6221, 1, "\nRemoving automatic instance"
// *Cause: RMAN is removing the automatic auxiliary instance that was 
//         created for this command.
// *Action: No action is required.
6223, 1, "starting up automatic instance %s\n"
// *Cause: This is an informational message only.
// *Action: No action is required.
6224, 1, "Automatic instance created"
// *Cause: This is an informational message only.
// *Action: No action is required.
6225, 1, "shutting down automatic instance %s\n"
// *Cause: This is an informational message only.
// *Action: No action is required.
6226, 1, "Automatic instance removed"
// *Cause: This is an informational message only.
// *Action: No action is required.
6230, 1, "List of Stored Scripts in Recovery Catalog"
// *Cause: This message is issued in response to a LIST SCRIPT NAMES
//         command.  The following fields are shown for each script that is
//         stored in the recovery catalog:
//         Header indicating to what database the script belongs.
//         Script Name: name of the script.
//         Description: comment associated with this script.
// *Action: No action is required.
6231, 1, "\n\n    Global Scripts\n"
6232, 1, "\n\n    Scripts of Target Database %s"
6233, 1, "\n       Script Name"
6234, 1, "       Description"
6235, 1, "       -----------------------------------------------------------------------"
6236, 1, "\n       %s"
6237, 1, "       %s"
6238, 1, "List of Databases"
// *Cause: This message is issued in response to a LIST DB_UNIQUE_NAME
//         command.  The following fields are shown for each database that is
//         known to the recovery catalog:
//         DB Key: This is the unique key which identifies this database in
//           the recovery catalog.
//         DB Name: The name of the database.
//         DB ID: The database ID.  This is a number which remains the same for
//           the life of the database, even if the database name is changed.
//         DB_UNIQUE_NAME: db_unique_name value for the database.
// *Action: No action is required.
6239, 1, "DB Key  DB Name  DB ID            Database Role    Db_unique_name"
6240, 1, "------- ------- ----------------- ---------------  ------------------"
6241, 1, "%-7s %-8s %-16s %-16s %-20s"

6246, 1, "List of Database Incarnations"
// *Cause: This message is issued in response to a LIST INCARNATION OF
//         DATABASE command.  The following fields are shown for each database
//         that is registered with the recovery catalog:
//         DB Key: This is the unique key which identifies this database in
//           the recovery catalog.
//         Inc Key: This is the unique key which identifies this incarnation
//           of the database in the recovery catalog.
//         DB Name: The name of the database.
//         DB ID: The database ID.  This is a number which remains the same
//           for the life of the database, even if the database name is 
//           changed.
//         Status: 'YES' if this is the current incarnation of this database,
//           otherwise 'NO'.
//         Reset SCN: system change number (SCN) of the most recent
//           RESETLOGS operation.
//         Reset Time: Time of the most recent RESETLOGS operation.
// *Action: No action is required.
6247, 1, "DB Key  Inc Key DB Name  DB ID            STATUS  Reset SCN  Reset Time"
6248, 1, "------- ------- -------- ---------------- --- ---------- ----------"
6249, 1, "%-7s %-7s %-8s %-16s %-7s %-10s %s"
6250, 1, "Report of files that need backup due to unrecoverable operations"
// *Cause: An unlogged change (such as 'create table unrecoverable') has been
//         made to this file, and the most recent backup of the file does not
//         contain those changes.
// *Action: Take a backup of this file.  If this file is lost before a backup
//          is taken, then the unlogged modifications will be lost.  The
//          message indicates whether a full backup is required or whether a
//          incremental backup will suffice.
/
6251, 1, "File Type of Backup Required Name"
6252, 1, "---- ----------------------- -----------------------------------"
6253, 1, "%-4s %-23s %s"
6260, 1, "Report of files that need more than %d incrementals during recovery"
6261, 1, "File Incrementals Name"
6262, 1, "---- ------------ ----------------------------------------------"
6263, 1, "%-4s %-12s %s"
// *Cause: This message is issued in response to the REPORT NEED BACKUP
//         INCREMENTAL command, for those files which would use more than
//         the specified number of incrementals during recovery.
// *Action: To reduce the number of incremental backups which would be used
//          during recovery of this datafile, take a new full backup of this
//          file now.
6270, 1, "Report of files whose recovery needs more than %d days of archived logs"
// *Cause: This message is issued in response to the REPORT NEED BACKUP DAYS
//         command for those files which need more than the specified number
//         of days' archived logs for recovery.
// *Action: To reduce the number of log files needed for recovery of this
//          datafile, take a new full or incremental backup now.
/
6271, 1, "File Days  Name"
6272, 1, "---- ----- -----------------------------------------------------"
6273, 1, "%-4s %-5s %s"
6274, 1, "Report of files that must be backed up to satisfy %d days recovery window"
// *Cause: This message is issued in response to the REPORT NEED RECOVERY
//         WINDOW OF n DAYS command for those files that must be backed up to
//         satisfy specified retention policy.
// *Action: To satisfy specified recovery window for this datafile, take a
//          new full or incremental backup now.
6275, 1, "invalid number of days specified for report : %s days"
// *Cause: This message is issued in response to the REPORT NEED RECOVERY
//         WINDOW OF n DAYS  or REPORT NEED BACKUP DAYS n command when an 
//         invalid number of days was specified in input command.
// *Action: The number of days specified in REPORT command must be greater
//          than zero.
6280, 1, "Report of obsolete backups and copies"
// *Cause: This message is issued in response to the REPORT OBSOLETE
//         command.  Each of the files listed is obsolete because it
//         is more redundant than the level of redundancy specified in the
//         REPORT command.
// *Action: Depending on your needs, you might need to take new backups.
6281, 1, "Type                 Key    Completion Time    Filename/Handle"
6282, 1, "-------------------- ------ ------------------ --------------------"
6283, 1, "Datafile Copy        %-6s %-18s %s"
6284, 1, "Backup Set           %-6s %-18s"
6285, 1, "  Backup Piece       %-6s %-18s %s"
6286, 1, "Proxy Copy           %-6s %-18s %s"
6287, 1, "Deleting the following obsolete backups and copies:"
// 6288, 1, "unused"
6289, 1, "Archive Log          %-6s %-18s %s"
6290, 1, "Report of database schema for database with db_unique_name %s"
// *Cause: This message is issued in response to the REPORT SCHEMA command.
//         The report shows the physical schema of the database at the
//         indicated time.  The following fields are shown for each datafile
//         and tempfile:
//           File: The file number.
//           Size(MB): The size of the file in mega bytes.
//           Tablespace: The name of the tablespace which contains this file.
//           RB segs: YES if this file is part of a tablespace containing
//             rollback segments, otherwise NO.
//           Datafile/Tempfile Name: The file name.
//           Maxsize(MB): Maximum file size to which file can be extended
// *Action: No action is required.
6291, 1, "File Size(MB) Tablespace           RB segs Datafile Name"
6292, 1, "---- -------- -------------------- ------- ------------------------"
6293, 1, "%-4s %-8s %-20s %-7s %s"
6295, 1, "File length  Filename"
6296, 1, "-----------  ------------------------------------------------------"
6297, 1, "%-11s  %s"
6300, 1, "Report of files with less than %d redundant backups"
// *Cause: This message is issued when the REPORT NEED BACKUP REDUNDANCY
//         command is used for those files which have less than the specified
//         number of backups which can be used for recovery.
// *Action: Take another backup of the datafiles listed.
6301, 1, "File #bkps Name"
6302, 1, "---- ----- -----------------------------------------------------"
6303, 1, "%-4s %-5s %s"
6305, 1, "List of Proxy Copies"
6306, 1, "===================="
// *Cause: This message is issued in response to a LIST BACKUP
//         DATABASE/TABLESPACE/DATAFILE command when some backups were taken
//         with the PROXY option.  If a recovery catalog is in use, then
//         the information comes from the recovery catalog, otherwise
//         it comes from the target database control file.  The following
//         fields are shown for each proxy datafile backup.
//           Key: This is the unique key which identifies this proxy backup in
//             the recovery catalog.  This value can be used in a CHANGE
//             command to change its status.  If the target
//             database control file is being used as the recovery catalog,
//             then this field uniquely identifies this copy in the
//             control file.
//           File: The file number that this file was copied from.
//           Status: This is the status of the file.  Possible values are:
//                A - Available
//                U - Unavailable
//                D - Deleted
//                X - Expired
//             Status 'U' will not be used if the target database control file
//             is being used as the recovery catalog.
//           Completion time: This is the date and time when the backup
//             was created.
//             This column will be printed in the default Oracle
//             date format, unless overridden with a NLS_DATE_FORMAT
//             environment variable.
//           Ckp SCN: This is the checkpoint system change number (SCN)
//             of the backup. The file contains all changes made at or
//             before this SCN.
//           Ckp time: This is the time that the file was last checkpointed.
//           Handle: This is the media manager handle of the proxy backup.
//
// *Action: No action is required.
6307, 1, "PC Key  File Status      %-*s Ckp SCN    %-*s"
6308, 1, "------- ---- ----------- %-.*s ---------- %-.*s"
6309, 1, "%-7s %-4s %-11s %-*s %-10s %s"
6310, 1, "PC Key  Thrd Seq     Status      %-*s"
6311, 1, "------- ---- ------- ----------- %-.*s"
6312, 1, "%-7s %-4s %-7s %-11s %-*s"
/ LIST BACKUP ... BY FILE output
6314, 1, "List of Datafile Backups"
6315, 1, "========================"
/
6316, 1, "File Key     TY LV S Ckp SCN    %-*s #Pieces #Copies Compressed Tag"
6317, 1, "---- ------- -  -- - ---------- %-.*s ------- ------- ---------- ---"
6318, 1, "%-4s %-7s %-2s %-2s %c %-10s %-*s %-7s %-7s %-10s %s"
/
6319, 1, "List of Control File Backups"
6320, 1, "============================"
/
6321, 1, "CF Ckp SCN %-*s BS Key  S #Pieces #Copies Compressed Tag"
6322, 1, "---------- %-.*s ------- - ------- ------- ---------- ---"
6323, 1, "%-10s %-*s %-7s %c %-7s %-7s %-10s %s"
/
6324, 1, "List of Archived Log Backups"
6325, 1, "============================"
/
6326, 1, "Thrd Seq     Low SCN    %-*s BS Key  S #Pieces #Copies Compressed Tag"
6327, 1, "---- ------- ---------- %-.*s ------- - ------- ------- ---------- ---"
6328, 1, "%-4s %-7s %-10s %-*s %-7s %c %-7s %-7s %-10s %s"
/
6329, 1, "Low Time"
6330, 1, "Ckp Time"
6331, 1, "Completion Time"
6332, 1, "Modification Time"
6333, 1, "Time Detected"
6334, 1, "Failure ID"
/
/
6335, 1, "List of Datafiles in backup set %s"
6336, 1, "File LV Type Ckp SCN    %-*s Name"
6337, 1, "---- -- ---- ---------- %-.*s ----"
6338, 1, "%-4s %-2s %-4s %-10s %-*s %s"
/
6339, 1, "Control File Included: Ckp SCN: %-10s   Ckp time: %s"
/
6340, 1, "Backup Set Copy #%d of backup set %d"
6341, 1, "Device Type Elapsed Time %-*s Compressed Tag"
6342, 1, "----------- ------------ %-.*s ---------- ---"
6343, 1, "%-11s %-12s %-*s %-10s %s"
/
6345, 1, "List of Backups"
6346, 1, "==============="
/
6347, 1, "Key     TY LV S Device Type %-*s #Pieces #Copies Compressed Tag"
6348, 1, "------- -- -- - ----------- %-.*s ------- ------- ---------- ---"
6349, 1, "%-7s %c  %-2s %c %-11s %-*s %-7s %-7s %-10s %s"
/ list backup piece ..
6350, 1, "List of Backup Pieces"
6351, 1, "BP Key  BS Key  Pc# Cp# Status      Device Type Piece Name"
6352, 1, "------- ------- --- --- ----------- ----------- ----------"
6353, 1, "%-7s %-7s %-3s %-3s %-11s %-11s %s"
6354, 1, "        Datafile name: %s"
6355, 1, "        Handle: %s   Media: %s"
6356, 1, "        Tag: %s"
/
6357, 1, "Standby Control File Included: Ckp SCN: %-10s   Ckp time: %s"
/ format for LIST BY BACKUP for non-disk pieces, used with 6398,6399
6358, 1, "%-7s %-3s %-11s %-23s %s"
/
/
/ This range, 6360-6397 replaces range 6200-6237
/
/
6360, 1, "List of Archived Log Copies for database with db_unique_name %s"
6361, 1, "====================================================================="
6362, 1, "Key     Thrd Seq     S %-*s"
6363, 1, "------- ---- ------- - %-.*s"
6364, 1, "%-7s %-4s %-7s %1s %-*s"
6365, 1, "        Name: %s (TERMINAL)"
/
6366, 1, "List of Datafile Copies"
6367, 1, "======================="
6368, 1, "Key     File S %-*s Ckp SCN    %-*s"
6369, 1, "------- ---- - %-.*s ---------- %-.*s"
6370, 1, "%-7s %-4s %1s %-*s %-10s %-*s"
6371, 1, "        Name: %s"
/
6372, 1, "        Keep: %-13s      Until: %-15s"
6373, 1, "Control File Copy     %-6s %-18s %s"
/
6374, 1, "List of Archived Logs in backup set %s"
6375, 1, "Thrd Seq     Low SCN    %-*s Next SCN   Next Time"
6376, 1, "---- ------- ---------- %-.*s ---------- ---------"
6377, 1, "%-4s %-7s %-10s %-*s %-10s %s"
/
6378, 1, "List of Backup Sets"
// *Cause: This message is issued in response to a LIST BACKUP command.
// *Action: No action is required.
/
6379, 1, "==================="
/ for archived log backup sets with multiple copies
6380, 1, "BS Key  Size"
6381, 1, "------- ----------"
6382, 1, "%-7s %s"
/ for archived log backup sets with one copy
6383, 1, "BS Key  Size       Device Type Elapsed Time %-*s"
6384, 1, "------- ---------- ----------- ------------ %-.*s"
6385, 1, "%-7s %-10s %-11s %-12s %-*s"
/ for datafile/control file backup sets with multiple copies
6386, 1, "BS Key  Type LV Size"
6387, 1, "------- ---- -- ----------"
6388, 1, "%-7s %-4s %-2s %s"
/ for datafile/control file backup sets with one copy
6389, 1, "BS Key  Type LV Size       Device Type Elapsed Time %-*s"
6390, 1, "------- ---- -- ---------- ----------- ------------ %-.*s"
6391, 1, "%-7s %-4s %-2s %-10s %-11s %-12s %-*s"
/
/ one piece/copy format
6392, 1, "        BP Key: %s   Status: %s  Compressed: %s  Tag: %s"
6393, 1, "        Piece Name: %s"
/ multiple pieces/copies format
6394, 1, "List of Backup Pieces for backup set %s Copy #%s"
6395, 1, "BP Key  Pc# Status      Piece Name"
6396, 1, "------- --- ----------- ----------"
6397, 1, "%-7s %-3s %-11s %s"
6398, 1, "BP Key  Pc# Status      Media                   Piece Name"
6399, 1, "------- --- ----------- ----------------------- ----------"
/

/ End of LIST message section (6200-6399).
/
/ Continuation of KRMK messages: 6400-6999
/
6400, 1, "database opened"
// *Cause: This is an informational message only.
// *Action: No action is required.
6401, 1, "database is already started"
// *Cause: A STARTUP command without the FORCE option was issued, but the
//         target database is already started.
// *Action: Use the FORCE option if you want to restart the database.
6402, 1, "Oracle instance shut down"
// *Cause: This is an informational message only.
// *Action: No action is required.
6403, 1, "could not obtain a fully authorized session"
// *Cause: The most likely cause of this error is that one of the databases
//         to which RMAN had previously connected is not started or has
//         has been shutdown.  Other error messages should identify
//         exactly which database is the problem.
// *Action: Startup the database causing the problem.
6404, 1, "database dismounted"
// *Cause: This is an informational message only.
// *Action: No action is required.
6405, 1, "database closed"
// *Cause: This is an informational message only.
// *Action: No action is required.
6406, 1, "deleted archived log"
// *Cause: This is an informational message only.
// *Action: No action is required.
6407, 1, "auxiliary instance file %s deleted"
// *Cause: This is an informational message only.
// *Action: No action is required.
6408, 1, "recovery catalog upgraded to version %s"
// *Cause:  This is an informational message issued by the UPGRADE CATALOG
//          command.  It indicates the version of the recovery catalog schema
//          to which the recovery catalog was just upgraded.  Note that this
//          version number may not reflect the version number of your rman
//          executable or target database, because the recovery catalog
//          schema is not changed with each Oracle release.
// *Action: No action is required.
6409, 1, "LIKE clause in LIST BACKUP OF ARCHIVELOG is not supported"
// *Cause:  LIST BACKUP OF ARCHIVELOG LIKE was used, which is not supported.
// *Action: Remove LIKE clause from command.
6410, 1, "cannot use command when channels are allocated"
// *Cause:  An attempt was made to issue a command that can be used only
//          when there are no allocated channels.
// *Action: Do not use the command, or de-allocate channels and use the
//          command when no channels are allocated.
6411, 1, "backup copies setting out of range (1-4): %d"
// *Cause:  An attempt was made to set backup copies to an invalid value.
// *Action: Use a value in the specified range.
6412, 1, "no proxy copy channel found"
// *Cause:  A proxy copy was started, but no allocated channel supports
//          proxy copy.  This could be because the media management software
//          used by the target database does not support proxy copy, or
//          because all of the allocated channels are of type DISK, which
//          never support proxy copy.
// *Action: If this is a backup, then either allocate a non-disk channel, or
//          do not use the PROXY option.  If this is a restore, then a channel
//          of the same type which created the proxy backup was allocated, but
//          now does not support proxy copy.  If proxy copy is no longer
//          supported by the media management software at the target database,
//          the CROSSCHECK or CHANGE commands should be used so that those
//          backups will not be considered for further restores.
6413, 1, "channel %s does not support proxy copy"
// *Cause:  The channel which was specified for this backup or restore does
//          not support proxy copy.  This could be because the media 
//          management software used by the target database does not support 
//          proxy copy, or because the channel is of type DISK, which never 
//          supports proxy copy.
// *Action: If this is a backup, then either allocate a non-disk channel, or
//          do not use the PROXY option.  If this is a restore, then a channel
//          of the same type which created the proxy backup was allocated, but
//          now does not support proxy copy.  If proxy copy is no longer
//          supported by the media management software at the target database,
//          the CROSSCHECK command should be used so that those
//          backups will not be considered for further restores.
6414, 1, "target database COMPATIBLE option does not support proxy copy"
// *Cause:  PROXY was specified, and the target database uses a media manager
//          that supports proxy copy, but the COMPATIBLE initialization
//          parameter of the target database must be 8.1.0 or greater to
//          create proxy backups.  If the database is downgraded to the 
//          earlier release that is specified in the COMPATIBLE parameter, 
//          then it will no longer be able to restore proxy backups.
// *Action: Either take a non-proxy backup or change the target database
//          COMPATIBLE parameter.
6415, 1, "file %s cannot be proxy backed up"
// *Cause:  The PROXY option was specified, but the media management software
//          used by the target database cannot back up the specified file
//          using proxy copy.  If PROXY ONLY was specified, then the backup
//          is terminated.  If PROXY was specified, then this file will be
//          placed into a non-proxy backup set.
// *Action: Remove the ONLY option to place the files into
//          a regular backup set, or contact the media management vendor if
//          you believe that the media management software should support
//          proxy copy of this file.
6416, 1, "PROXY ONLY was specified and some files could not be proxy copied"
// *Cause:  PROXY ONLY was specified, and some of the files to be backed up
//          could not be backed up by the media management software used by
//          the target database.  Message 6415 is issued for each file that 
//          cannot be proxy copied.
// *Action: Remove the ONLY option to place the files into
//          a regular backup set, or contact the media management vendor if
//          you believe that the media management software should support
//          proxy copy of these files.
6417, 1, "command not allowed when connected to a virtual private catalog"
// *Cause:  The command that was entered cannot be used while connected to
//          a virtual private catalog.
// *Action: Connect to the base catalog and re-execute the command.
6418, 1, "proxy incremental backups with level > 0 not supported"
// *Cause:  PROXY was specified for a non-level-zero incremental backup.
//          Proxy backups may only be full or level 0 backups.
// *Action: Remove one of the conflicting options.
6419, 1, "file %s cannot be proxy restored from handle %s"
// *Cause:  The media management software used by the target database
//          indicated that it cannot restore the specified file from the 
//          specified backup handle. 
// *Action: Consult the media management software documentation to find out
//          why this restriction exists or contact the media management 
//          vendor.
6420, 1, "some files could not be proxy restored - aborting restore"
// *Cause:  Some of the files to be restored could not be restored by the
//          media management software used by the target database.  Message
//          6419 is issued for each file that cannot be restored.
// *Action: Contact the media management vendor if you believe that the
//          media management software should support proxy copy of these
//          files.  The CROSSCHECK or CHANGE commands can be used to remove
//          these proxy copies from the catalog to prevent the RESTORE 
//          command from trying to restore from them.
6421, 1, "sent command to channel: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
6422, 1, "no channels found for SEND command"
// *Cause:  No channels with the specified names or device types were found.
//          If no channel qualifiers were specified, then no channels were
//          allocated.
// *Action: Specify a different channel type or allocate a channel of the
//          desired type.
6423, 1, "requested limit of %d exceeds vendor limit of %d"
// *Cause:  A command was used to set the backup piece size limit,
//          but the media management software used by the target
//          database cannot create backup pieces that large.
// *Action: Specify a smaller backup piece limit.
6424, 1, "error while looking up proxy copy"
// *Cause:  An error occurred while looking up the specified proxy
//          copy in the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.  Ensure that the name or key is entered
//          correctly.  If the proxy copy was created when the recovery
//          catalog was not available, then a RESYNC CATALOG must be done
//          to update the recovery catalog.
6425, 1, "<datafile pathname not available>"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6426, 1, "RECOVERY_CATALOG_OWNER role must be granted to user %s"
// *Cause:  The CREATE CATALOG or UPGRADE CATALOG command was used, but the
//          USERID that was supplied in the CATALOG connect string does not
//          have the RECOVERY_CATALOG_OWNER role granted as a DEFAULT role.
// *Action: Grant the RECOVERY_CATALOG_OWNER role to the recovery catalog
//          owner.
6427, 1, "recovery catalog already exists"
// *Cause:  The CREATE CATALOG command cannot be used when the recovery
//          catalog already exists.
// *Action: Use the UPGRADE CATALOG command to upgrade your recovery catalog
//          to the most current release without losing any existing backup
//          data.  Use the DROP CATALOG command to remove an existing recovery
//          catalog.
6428, 1, "recovery catalog is not installed"
// *Cause:  A recovery catalog database connection has been made, but the
//          recovery catalog tables and views have not been installed.
// *Action: If you mis-typed the recovery catalog owner USERID, then correct
//          the USERID and reconnect to the recovery catalog.
//          If this is the first time that you have signed on to Recovery
//          Manager with this recovery catalog owner USERID, then use the
//          CREATE CATALOG command to create the recovery catalog schema.
//          Alternatively, exit RMAN and connect without specifying a recovery
//          catalog connection.
6429, 1, "%s database is not compatible with this version of RMAN"
// *Cause:  The indicated database is not compatible with this version of
//          the Recovery Manager (RMAN).  Other messages have also
//          been issued which detail the cause of the error.
// *Action: See the other messages.  If the database is CATALOG, then you may
//          be able to use the CREATE CATALOG or UPGRADE CATALOG commands
//          to correct the problem.  If the database is TARGET or AUXILIARY,
//          then you must either upgrade the target database or use a
//          newer version of the RMAN executable.
6430, 1, "recovery catalog USERID cannot be SYS"
// *Cause:  A recovery catalog connection was made to USERID SYS.  The
//          recovery catalog must be created in a USERID other than SYS.
// *Action: Specify a different USERID in the CATALOG connect string.
6431, 1, "recovery catalog created"
// *Cause:  This is an informational message issued by the CREATE CATALOG
//          command.
// *Action: No action is required.
6432, 1, "recovery catalog dropped"
// *Cause:  This is an informational message issued by the DROP CATALOG
//          command.
// *Action: No action is required.
6433, 1, "error installing recovery catalog"
// *Cause:  An error was received from the recovery catalog database while
//          it was being installed.  Another error message shows the error
//          message from the server.
// *Action: The most common reasons for failure to install the recovery
//          catalog are:
//          - Lack of space in the recovery catalog database: allocate more
//          space, use the DROP CATALOG command to remove any partially
//          installed recovery catalog, and retry the command.
//          - Object already exists: This is caused by a partial recovery
//          catalog installation.  Use the DROP CATALOG command to remove the
//          partially installed recovery catalog and retry the command.
6434, 1, "some errors occurred while removing recovery catalog"
// *Cause:  Some errors were received from the recovery catalog database while
//          removing the recovery catalog.
// *Action: Correct the error(s) and retry the command.  Note that
//          Recovery Manager intercepts and ignores common errors, such 
//          as 'object not found', which can happen while removing a 
//          partially installed recovery catalog.  Only serious errors 
//          will be displayed while removing the recovery catalog.
6435, 1, "recovery catalog owner is %s"
// *Cause:  This is an informational message issued by the UPGRADE CATALOG
//          and DROP CATALOG commands.
// *Action: No action is required.
6436, 1, "enter DROP CATALOG command again to confirm catalog removal"
// *Cause:  The DROP CATALOG command deletes the recovery catalog, rendering
//          all database backups unusable, and should be used with care.
//          The command must be entered twice to ensure that this is really
//          what you want to do.
// *Action: If you really want to remove the recovery catalog, then enter
//          the DROP CATALOG command again.
6437, 1, "cannot drop catalog - catalog is newer than this RMAN"
// *Cause:  The DROP CATALOG command was entered, but the recovery catalog was
//          created by a newer version of the Recovery Manager (RMAN).  This
//          version of RMAN  may not be able to drop the entire recovery
//          catalog.
// *Action: Use the version of RMAN which most recently created or upgraded
//          the recovery catalog.
6438, 1, "error executing package DBMS_RCVMAN in %s database"
// *Cause:  Recovery Manager requires the DBMS_RCVMAN package in the SYS
//          schema of the indicated database.  Normally this package is
//          installed during database creation.  To re-create the package,
//          run the files dbmsrman.sql and prvtrmns.plb.
// *Action: re-create the DBMS_RCVMAN package in the SYS schema.
6439, 1, "RMAN must be upgraded to version %s to work with this package"
// *Cause:  This message indicates the minimum version of recovery manager
//          required to use the package which was specified in message 6191.
// *Action: A newer version of RMAN must be used with this package.
6440, 1, "virtual catalog dropped"
// *Cause:  This is an informational message issued by the DROP CATALOG
//          command, when connected to a virtual private catalog.  Note that
//          dropping a virtual private catalog does not delete any data,
//          because the catalog data is owned by the base catalog.
// *Action: No action is required.
6441, 1, "cannot upgrade catalog - catalog is already newer than this RMAN"
// *Cause:  The recovery catalog is already at a version level that is greater
//          than this version of the Recovery Manager.  The UPGRADE CATALOG
//          command is not needed.
// *Action: Either upgrade to a more recent Recovery Manager, or continue to
//          use the current version.  Message 6191 will be issued if the
//          recovery catalog is too new to work with this version of Recovery
//          Manager.
6442, 1, "enter UPGRADE CATALOG command again to confirm catalog upgrade"
// *Cause:  The UPGRADE CATALOG command alters the recovery catalog schema.
//          Although the recovery catalog is designed to be compatible with
//          older versions of the Recovery Manager (RMAN), it is possible that
//          an upgrade will remove support for older versions of RMAN.
// *Action: If you really want to upgrade the recovery catalog, then enter
//          the UPGRADE CATALOG command again.
//          If you are not going to use an older version of RMAN with this
//          recovery catalog, then compatibility is not an issue.
//          If you plan to also continue using an older
//          version of RMAN with this recovery catalog then, before upgrading,
//          consult the Migration Guide for the current Oracle release to
//          determine if upgrading to the current version of the recovery
//          catalog will remove support for older versions of RMAN.
6443, 1, "error upgrading recovery catalog"
// *Cause:  An error was received from the recovery catalog database while
//          upgrading the recovery catalog.
// *Action: Correct the error and retry the command.  Note that the Recovery
//          Manager intercepts and ignores common errors, such as 'column
//          already exists,' which can happen if the recovery catalog has
//          already been partially upgraded.
//          Only serious errors will be displayed while
//          upgrading the recovery catalog.
6444, 1, "error creating %s"
// *Cause:  During the CREATE CATALOG or UPGRADE CATALOG command, the indicated
//          object could not be created due to errors.
// *Action: Make sure that the RECOVER.BSQ file has not been modified or
//          damaged, and then if this error persists, contact Oracle support.
//          If the error refers to one of the RMAN PL/SQL packages,
//          connect to the recovery catalog owner and query the USER_ERRORS
//          view to find out the details of the compilation errors.
6445, 1, "cannot connect to recovery catalog after NOCATALOG has been used"
// *Cause:  The CONNECT CATALOG command was used after the user had already
//          specified the NOCATALOG option.
// *Action: Re-start rman if you wish to use a recovery catalog.
6446, 1, "changed proxy copy unavailable"
// *Cause: This is an informational message only.
// *Action: No action is required.
6447, 1, "changed proxy copy available"
// *Cause: This is an informational message only.
// *Action: No action is required.
6448, 1, "uncataloged proxy copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
6449, 1, "deleted proxy copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
6450, 1, "crosschecked proxy copy: found to be '%s'"
// *Cause: This is an informational message only.
// *Action: No action is required.
6451, 1, "proxy copy handle=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
6452, 1, "%s package upgraded to version %s"
// *Cause:  This is an informational message issued by the UPGRADE CATALOG
//          command.  It indicates the version to which the indicated package
//          was just upgraded.  Note that this
//          version number may not reflect the version number of your rman
//          executable or target database, because the recovery catalog
//          packages are not changed with each Oracle release.
// *Action: No action is required.
6453, 1, "RECOVERABLE may only be used with datafile objects"
// *Cause:  An attempt was made to use LIST ... RECOVERABLE .. with
//          OF CONTROLFILE or OF ARCHIVELOG.
// *Action: Remove the RECOVERABLE keyword and try again.
6454, 1, "duplexed backups require Enterprise Edition"
// *Cause: The SET COPIES or CONFIGURE BACKUP COPIES command was used to
//         create more than one copy of each backup piece, but Enterprise
//         Edition is not installed.
// *Action: Do not attempt to create more than one copy of each backup piece.
6455, 1, "Tablespace Point-in-Time Recovery requires Enterprise Edition"
// *Cause: Tablespace Point-in-Time Recovery was attempted, but Enterprise
//         Edition is not installed.
// *Action: Do not attempt Tablespace Point-in-Time Recovery.
6456, 1, "command is obsolete"
// *Cause: This is an informational message only.
// *Action: No action is required.
6457, 1, "UNTIL SCN (%s) is ahead of last SCN in archived logs (%s)"
// *Cause: UNTIL SCN cannot be more than the last system change number (SCN)
//         of the last archived log
// *Action: Check the UNTIL SCN.
6458, 1, "AS COPY option cannot be used with RECOVERY FILES, RECOVERY AREA or DB_RECOVERY_FILE_DEST"
// *Cause: The RECOVERY FILES, RECOVERY AREA or DB_RECOVERY_FILE_DEST was
//         specified with AS COPY.
// *Action: Remove the AS COPY option and resubmit the command.
6459, 1, "BACKUP <VALIDATE|DURATION> is not supported with PROXY"
// *Cause: BACKUP <VALIDATE|DURATION> and PROXY were specified in the same 
//         backup command.
// *Action: Remove the incompatible option.
6460, 1, "control file copy %s cannot be backed up by proxy."
// *Cause: The PROXY option was specified, but proxy copy of control file
//         is not supported. This file will be placed into a non-proxy
//         backup set.
// *Action: No action required, this is an informational message.
6461, 1, "current control file cannot be backed up by proxy."
// *Cause:  The PROXY option was specified, but proxy copy of control file
//          is not supported. This file will be placed into a non-proxy
//          backup set.
// *Action: No action required, this is an informational message.
6462, 1, "no backup sets found on device DISK that match specification"
// *Cause:  A backup set record specifier did not match an backup set on 
//          device DISK in the recovery catalog.
// *Action: Resubmit the command with a different backup set record
//          specifier.  The Recovery Manager (RMAN) LIST command can be
//          used to display all backup sets that RMAN knows about.
6463, 1, "Backup set key %s cannot be backed up by proxy."
// *Cause:  The PROXY option was specified, but proxy copy of backup set
//          is not supported. This file will be placed into a non-proxy
//          backup set.
// *Action: No action required, this is an informational message.
6464, 1, "BACKUP BACKUPSET is not supported with VALIDATE option"
// *Cause: BACKUP BACKUPSET and VALIDATE were specified in the same
//         backup command.
// *Action: To VALIDATE BACKUPSET use 'validate' or 'restore validate' 
//          command.
6465, 1, "configuration not implemented: %s"
// *Cause:  The configuration is not implemented in the current release.
// *Action: Avoid using the command.
6466, 1, "error parsing configuration string (%s)"
// *Cause:  Unsupported configuration string is stored in
//          recovery catalog or target database control file.
// *Action: Check compatibility matrix rman executable and target database
//          and recover catalog.
//          Use DBMS_BACKUP_RESTORE.DELETECONFIG to remove problematic
//          configuration.
6467, 1, "could not translate DBA: %d"
// *Cause:  An error was received when calling DBMS_RCVMAN
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
6468, 1, "Invalid Data Block Address: %d"
// *Cause:  The DBA specified doesn't belong to the mentioned tablespace
// *Action: Check the DBA
6469, 1, "could not translate corruption list"
// *Cause:  An error was received when calling DBMS_RCVMAN
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
6470, 1, "DEVICE TYPE is supported only when automatic channels are used"
// *Cause: The DEVICE TYPE option was specified with a BACKUP, RESTORE,
//         RECOVER, DUPLICATE, CHANGE, VALIDATE, CROSSCHECK, or DELETE
//         EXPIRED command.  This option is allowed only when automatically
//         allocated channels are used.
// *Action: Remove the DEVICE TYPE option and re-run the command. Or Remove
//          all ALLOCATE commands and re-run the script so that channels are
//          automatically allocated.
6471, 1, "no configuration found to allocate channels for %s"
// *Cause:  Device type configuration was not found in recovery catalog
// *Action: Setup device type configuration using configure command for
//          required device type
6472, 1, "channel id %s is automatically allocated"
// *Cause:  Channel id was used on ALLOCATE/RELEASE command.
// *Action: Use other channel id that does not belong to reserved
//          channel id's name space
6473, 1, "SET DATABASE can only be used in case of DUPLICATE without TARGET connection"
// *Cause:  A SET DATABASE command was specified when connected to target 
//          database or not connected to an auxiliary instance.
// *Action: Specify the command only when not connected to a target database
//          and when connected to an auxiliary instance in preparation to 
//          DUPLICATE without TARGET connection.
6474, 1, "maintenance channels are not allocated"
// *Cause: RELEASE CHANNEL was used without allocating any maintenance 
//         channels.
// *Action: Allocate maintenance channel before executing this command.
6475, 1, "parallelism setting out of range (1-254): %d"
// *Cause: Parallelism for the device type in CONFIGURE PARALLELISM command is
//         out of range
// *Action: Enter value of parallelism that are within the allowed range.
6476, 1, "channel number out of range (1-254): %d"
// *Cause: Channel number entered in CONFIGURE CHANNEL command is out of 
//         range.
// *Action: Enter channel number within allowed range and retry the command.
//          for this device and retry the command
6477, 1, "configuration value length exceeds 1024"
// *Cause: CONFIGURE CHANNEL command entered has configuration value greater
//         than 1024 bytes.
// *Action: Reduce the length of CONFIGURE CHANNEL command options
6478, 3, "WARNING: datafile copy '%s' cannot be found on disk"
// *Cause: The CHANGE DATAFILECOPY AVAILABLE command was used, but the
//         datafile copy cannot be found on disk.
// *Action: If the storage containing the datafile copy has been removed from
//          the host, restore it and retry the command.  If the datafile copy
//          is permanently gone, then issue the CHANGE DATAFILECOPY DELETE
//          command for this datafile.
6479, 3, "WARNING: control file copy '%s' cannot be found on disk"
// *Cause: The CHANGE CONTROLFILECOPY AVAILABLE command was used, but the
//         control file copy cannot be found on disk.
// *Action: If the storage containing the control file copy has been removed
//          from the host, restore it and retry the command.  If the
//          control file copy is permanently gone, then issue the CHANGE
//          CONTROLFILECOPY DELETE command for this control file.
6480, 3, "WARNING: archived log '%s' cannot be found on disk"
// *Cause: The CHANGE ARCHIVELOG AVAILABLE command was used, but the
//         archived log cannot be found on disk.
// *Action: If the storage containing the archived log has been removed from
//          the host, restore it and retry the command.  If the archived log
//          is permanently gone, then issue the CHANGE ARCHIVELOG DELETE
//          command for this archived log.
6481, 3, "WARNING: backup piece '%s' cannot be found on the storage medium"
// *Cause: The CHANGE BACKUPPIECE AVAILABLE command was used, but the
//         backup piece cannot be found on the storage medium.
// *Action: If the storage containing the backup piece has been removed from
//          the host, restore it and retry the command.  If the backup piece
//          is permanently gone, then issue the CHANGE BACKUPPIECE DELETE
//          command for this backup piece.
6482, 3, "WARNING: proxy copy '%s' cannot be found on the storage medium"
// *Cause: The CHANGE PROXY AVAILABLE command was used, but the
//         proxy copy cannot be found on disk.
// *Action: If the storage containing the proxy copy has been removed from
//          the host, restore it and retry the command.  If the proxy copy
//          is permanently gone, then issue the CHANGE PROXY DELETE
//          command for this proxy copy.
6483, 1, "changed datafile copy expired"
// *Cause: This is an informational message only.
// *Action: No action is required.
6484, 1, "changed control file copy expired"
// *Cause: This is an informational message only.
// *Action: No action is required.
6485, 1, "changed archived log expired"
// *Cause: This is an informational message only.
// *Action: No action is required.
6486, 1, "changed backup piece expired"
// *Cause: This is an informational message only.
// *Action: No action is required.
6487, 1, "changed proxy copy expired"
// *Cause: This is an informational message only.
// *Action: No action is required.
6488, 1, "restore from AUTOBACKUP does not allow any other modifiers"
// *Cause: A control file or SPFILE restore from AUTOBACKUP was attempted and
//         other restore options were used.
// *Action: Do not specify any other options for the control file AUTOBACKUP
//          restore.
6489, 1, "no configuration found to allocate clone channel %d for device type %s"
// *Cause:  Target channel configuration could not be used for clone channel
//          as it contains CONNECT option.
// *Action: Setup clone channel configuration using CONFIGURE CLONE command
//          for required number and type of channels.
6490, 3, "WARNING: limit of AUTOBACKUPS for the day has been reached"
// *Cause: No more control file AUTOBACKUPS are possible in this day.
// *Action: This is a warning message, no action is required.
6491, 1, "control file AUTOBACKUP format \"%s\" contains more than one \"%s\" format specifier"
// *Cause: A CONTROLFILE AUTOBACKUP FORMAT cannot have more than one
//         reserved format specifier.
// *Action: Specify only one reserved format specifier or use an
//          alternative format.
6492, 1, "control file AUTOBACKUP format \"%s\" must specify a \"%s\" format specifier"
// *Cause: A reserved format specifier was not specified for the CONTROLFILE
//         AUTOBACKUP FORMAT
// *Action: Add a specifier to the CONTROLFILE AUTOBACKUP FORMAT
6493, 1, "only UNTIL TIME clause is allowed when performing a restore from AUTOBACKUP, found: %s"
// *Cause: For restoring a control file AUTOBACKUP only SET UNTIL TIME can be
//         used. It is not possible to translate the others to a precise
//         day.
// *Action: Specify SET UNTIL TIME to indicate the day to start the
//          restore of a control file AUTOBACKUP.
6494, 1, "%s = %s is out of range (%s-%s)"
// *Cause: The specified parameter for restoring a control file AUTOBACKUP
//         is out of the valid range.
// *Action: Change the parameter value to a valid number or do not specify it.
6495, 1, "must explicitly specify DBID with SET DBID command"
// *Cause: Restore of a control file AUTOBACKUP or ADVISE FAILURE was
//         attempted when the database is not mounted.
// *Action: Specify the DBID of the database using SET DBID or mount the
//          database.
6496, 1, "must use the TO clause when the database is mounted or open"
// *Cause: A control file restore was attempted when the database
//         is mounted or open and no alternate destination was specified.
// *Action: Specify an alternate destination with the TO clause or dismount
//          the database.
6497, 3, "WARNING: control file is not current, control file AUTOBACKUP skipped"
// *Cause: Control file AUTOBACKUP is not possible without a current
//         control file.
// *Action: This is a warning message, no action is required.
6498, 1, "skipping datafile %s; already backed up %s time(s)"
// *Cause:  The indicated datafile will not be included in the backup set.
//          It is already backed up on the device requested and file is
//          offline/read-only datafile. Use the FORCE option to override
//          backup optimization.
// *Action: No action is required.
6499, 1, "skipping archived log file %s; already backed up %s time(s)"
// *Cause:  The indicated log file will not be included in the backup set
//          because it is already backed up on the device requested. Use FORCE
//          option to override backup optimization.
// *Action: No action is required.
6500, 1, "skipping backup set key %s; already backed up %s time(s)"
// *Cause:  The indicated backup set will not be copied because it is 
//          already backed up on the device requested. Use FORCE option 
//          to override backup optimization.
// *Action: No action is required.
6501, 1, "skipping datafile %s; already backed up on %s"
// *Cause:  The indicated datafile will not be included in the backup set.
//          It is already been backed up once, or before the since time
//          specified.
// *Action: No action is required.
6502, 1, "skipping archived log file %s; already backed on %s"
// *Cause:  The indicated log file will not be included in the backup set.
//          It is already been backed up once, or before the since time
//          specified.
// *Action: No action is required.
6503, 1, "skipping backup set key %s; already backed up on %s"
// *Cause:  The indicated backup set will not be backed up. It has already
//          been backed up on the device once, or before the since
//          time specified.
// *Action: No action is required.
6504, 1, "PROXY option with multiple backup copies is not supported"
// *Cause: Multiple backup copies and PROXY option were specified in
//         BACKUP command.
// *Action: Resolve the conflict.
6505, 1, "specified DATABASE: %s does not match previous DATABASE: %s"
// *Cause: SET DBID was used to set a DBID that translated into a database
//         name that does not match newly specified database name or a
//         previous SET DATABASE set a different database name.
// *Action: Verify that the correct DBID was specified or avoid using the
//          SET DATABASE command.
6506, 1, "the MAXSETSIZE option cannot be used with a backup backup set"
// *Cause:  The MAXSETSIZE option was specified for a backup backup set 
//          command.
// *Action: Remove the option and resubmit the command.
6507, 1, "trying alternate file for archived log of thread %d with sequence %d"
// *Cause: This is an informational message, appearing when an archived log
//         was found out of sync with catalog database.
// *Action: No action is required.
6508, 1, "MAXSETSIZE %s KBYTES should be greater than block size %s bytes"
// *Cause: MAXSETSIZE configured or specified in backup command should
//         be greater than database block size.
// *Action: Specify a larger MAXSETSIZE limit.
6509, 1, "only SPFILE or control file can be restored from AUTOBACKUP"
// *Cause:  A datafile or archived log restore from AUTOBACKUP was attempted.
// *Action: Do not specify DATAFILE or ARCHIVELOG for restore from AUTOBACKUP.
/
/
/ RETENTION POLICY RELATED MESSAGES BEGIN (6510 - 6539)
/
6510, 1, "RMAN retention policy is set to recovery window of %d days"
// *Cause: This is an informational message only.
// *Action: No action is required.
6511, 1, "RMAN retention policy is set to redundancy %d"
// *Cause: This is an informational message only.
// *Action: No action is required.
6512, 1, "copy will be obsolete on date %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
6513, 1, "copy will never be obsolete"
// *Cause: This is an informational message only.
// *Action: No action is required.
6514, 1, "archived logs required to recover from this copy will not be kept"
// *Cause: This is an informational message only.
// *Action: No action is required.
6515, 1, "archived logs required to recover from this copy will expire when this copy expires"
// *Cause: This is an informational message only.
// *Action: No action is required.
6516, 1, "time specified in KEEP UNTIL clause must be be after today"
// *Cause:  KEEP UNTIL support only a future time.
// *Action: Correct the time and retry the command.
6517, 1, "KEEP option is not supported for archived log backups"
// *Cause:  The KEEP option is not supported for archived logs.
// *Action: Either remove KEEP option and retry the command or
//          don't specify archived logs for this backup.
6518, 1, "backup will be obsolete on date %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
6519, 1, "backup will never be obsolete"
// *Cause: This is an informational message only.
// *Action: No action is required.
6520, 1, "archived logs will not be kept or backed up"
// *Cause: This is an informational message only.
// *Action: No action is required.
6521, 1, "archived logs required to recover from this backup will expire when this backup expires"
// *Cause: This is an informational message only.
// *Action: No action is required.
6522, 1, "KEEP FOREVER option is not supported without the recovery catalog"
// *Cause:  The KEEP FOREVER option was used, but it requires a connection
//          to a recovery catalog database. The KEEP FOREVER option cannot 
//          be used when the backup repository is the target database control 
//          file.  This is because information about this backup cannot be
//          permanently stored.
//          (If information is stored just in the control file it will be
//          aged out depending on CONTROL_FILE_RECORD_KEEP_TIME initialization
//          parameter.)
// *Action: If a recovery catalog database is available, then connect to the
//          recovery catalog and retry the command, otherwise use a different
//          KEEP option.
// 6523, 1, "unused"
6524, 1, "RMAN retention policy will be applied to the command"
// *Cause: This is an informational message only.
// *Action: No action is required.
6525, 1, "RMAN retention policy is set to none"
// *Cause:  Command DELETE OBSOLETE and REPORT OBSOLETE requires that either:
//          * RMAN retention policy is not NONE or,
//          * RMAN retention policy is specified with REPORT/DELETE command.
// *Action: Either configure RMAN retention policy with CONFIGURE command or
//          specify it at the end of DELETE/REPORT command.
6526, 1, "KEEP option cannot be used with incremental backup"
// *Cause: The KEEP option was specified for a incremental backup.
// *Action: Remove the option and resubmit the command.
6527, 1, "KEEP option is not supported for backup of backup sets"
// *Cause:  The KEEP option is not supported for backup of backup sets.
// *Action: Either remove KEEP option and retry the command or
//          don't specify backup sets for this backup.
6528, 1, "CHANGE ... KEEP not supported for BACKUPPIECE"
// *Cause: The CHANGE BACKUPPIECE ... KEEP command was entered.
//         KEEP attributes cannot be specified for backup pieces.
// *Action: Use CHANGE BACKUPSET ... KEEP instead.
6529, 1, "CHANGE ... KEEP not supported for ARCHIVELOG"
// *Cause: The CHANGE ARCHIVELOG ... KEEP command was entered.
//         KEEP attributes cannot be specified for archived logs.
// *Action: Use CHANGE BACKUPSET ... KEEP instead.
6530, 1, "CHANGE ... KEEP LOGS not supported for backup set which contains archived logs"
// *Cause: The CHANGE BACKUPSET ... KEEP command was entered, but the
//         BACKUPSET contains archived logs. Backup sets with archived 
//         logs cannot have KEEP attributes.
// *Action: Do not specify backup set with archived logs for the
//          CHANGE BACKUPSET ... KEEP command.
6531, 1, "CHANGE ... KEEP not supported for incremental BACKUPSET"
// *Cause: The CHANGE BACKUPSET ... KEEP command was entered, but the
//         BACKUPSET is an incremental backup set. Incremental backup 
//         sets cannot have KEEP attributes.
// *Action: Do not specify a backup set with archived logs for the
//          CHANGE BACKUPSET ... KEEP command.
6532, 1, "redundancy count must be greater than zero"
// *Cause: The REDUNDANCY operand specified for the retention policy
//         was zero.
// *Action: Specify a REDUNDANCY operand of 1 or greater.
6533, 1, "KEEP ... NOLOGS option cannot be used when datafiles are fuzzy"
// *Cause: The KEEP ... NOLOGS option was specified for a backup or copy
//         of files in a fuzzy state. This kind of backup requires archived
//         logs for recovery, so archived logs must be kept.
// *Action: Remove the KEEP ... NOLOGS option or make sure the files are
//          not in a fuzzy state and resubmit the command.
6534, 1, "archived logs required to recover from this backup will be backed up"
// *Cause: This is an informational message only.  An archivelog backup will
//         be created and kept so the specified backup can be recovered to 
//         a consistent state.
// *Action: No action is required.
6535, 1, "LIST COPY OF SPFILE is not supported"
// *Cause:  LIST COPY OF SPFILE was used, which is not supported because
//          SPFILE cannot have a copy.
// *Action: Remove SPFILE from the command.
6536, 1, "BACKED UP ... TIMES option is supported only for archived logs"
// *Cause:  The BACKUP UP ... TIMES option was used as a qualifier. This
//          option is supported only for archived logs.
// *Action: Remove the option and resubmit the command.
6537, 1, "CHANGE ... KEEP not supported for BACKUP"
// *Cause: The CHANGE BACKUP... KEEP command was entered.
//         KEEP attributes cannot be specified for copies and backup pieces in
//         a single command.
// *Action: Use CHANGE BACKUPSET ... KEEP instead.
/
/ RETENTION POLICY RELATED MESSAGES END (6520 - 6539)
/
/
6540, 1, "Tablespace %s will be excluded from future whole database backups"
// *Cause: This is an informational message only.
// *Action: No action is required.
6541, 1, "Tablespace %s will be included in future whole database backups"
// *Cause: This is an informational message only.
// *Action: No action is required.
6542, 1, "file %s is excluded from whole database backup"
// *Cause:  The indicated file will not be included in the backup set because
//          its tablespace is configured as excluded from backup.
// *Action: No action is required.
6543, 1, "duplicate or conflicting LIST options: %s and %s"
// *Cause: The indicated options conflict with each other or appear more than
//         once in a LIST command.
// *Action: remove the duplicate/conflicting option from the command.
//
6547, 1, "SYSTEM tablespace cannot be excluded from whole database backup"
// *Cause: The SYSTEM tablespace must be included in whole database backup.
// *Action: Remove the SYSTEM tablespace from the CONFIGURE ... EXCLUDE and
//          retry the operation.
6548, 1, "connected to auxiliary database: %s (DBID=%s)"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6549, 1, "connected to auxiliary database: %s (not mounted)"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6550, 1, "clone database not mounted and db_name not set in init.ora"
// *Cause:  The clone database "init.ora" file does not specify the
//          DB_NAME parameter.
// *Action: Add the DB_NAME parameter to the clone database "init.ora"
//          and restart the instance.
6551, 1, "error while looking up datafile copy for file number: %s"
// *Cause:  An error occurred while looking up the specified datafile copy
//          in the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure.  If the datafile copy was created during a
//          RESTORE with a new name, ensure that the RESTORE completed
//          successfully.
6552, 1, "newname for datafile %d was set to NEW, but file was not restored"
// *Cause:  A SWITCH command was specified for a datafile, but the newname
//          was set to NEW and the file was not restored.  If newname is set
//          to NEW, the file must be restored before issuing a SWITCH command.
// *Action: Correct and resubmit the SWITCH command.
6553, 1, "DB_CREATE_FILE_DEST must be set for SET NEWNAME ... TO NEW"
// *Cause: The SET NEWNAME ... TO NEW option was specified but the OMF
//         destination init parameter DB_CREATE_FILE_DEST is not set.
// *Action: Supply a full name to the SET NEWNAME command or set
//          DB_CREATE_FILE_DEST at the target database.
6554, 3, "WARNING: file %s is in backup mode"
// *Cause:  A file which is being backed up or copied is in backup mode.
//          RMAN will back up the file anyway, but files do not need to be put
//          into backup mode before backing them up with RMAN.
// *Action: Use the ALTER TABLESPACE ... END BACKUP statement, at the target
//          database server, to take the files out of backup mode.
6555, 1, "datafile %s must be restored from backup created before %s"
// *Cause:  An incomplete recovery session was started, but the
//          file is in newer than the UNTIL TIME clause.
// *Action: Check the UNTIL TIME clause or restore the file from a sufficient
//          old backup.
6556, 1, "datafile %s must be restored from backup older than SCN %s"
// *Cause:  An incomplete recovery session was started, but the
//          file is newer than the UNTIL clause.
// *Action: Check the UNTIL clause or restore the file from a sufficient
//          old backup.
6557, 1, "unable to restore archived log of thread %d with sequence %d"
// *Cause: Restore of the specified archived log failed because the
//         size of the archived log is larger than available disk space.
// *Action: One of the following:
//          1) Increase the MAXSIZE parameter and retry the command.
//          2) Free up disk space in the recovery area.
6558, 1, "archived log size of %d kb is bigger than available space of %d kb"
// *Cause: This message should be followed by one or more 6557 messages.
// *Action: Check the accompanying errors.
6559, 1, "MAXSIZE must be larger than 1 kb"
// *Cause:  The MAXSIZE parameter is out of range.
// *Action: Specify a valid size and retry the command.
6560, 3, "WARNING: backup set with key %d will be read %d times"
// *Cause:  This message should be followed by one or more 6562 messages.
// *Action: Check the accompanying messages.
6561, 1, "available space must be larger than %d kb"
// *Cause:  The recovery failed because it requires more disk space.
//          One of the following could have caused this error:
//          1) The MAXSIZE option is used but is not large enough to restore
//             files.
//          2) Files should be restored to recovery area, but available disk
//             space is not large enough to restore files.
// *Action: One of the following:
//          1) Increase the MAXSIZE parameter and retry the command.
//          2) Free up disk space in the recovery area.
6562, 1, "available space of %d kb needed to avoid reading the backup set multiple times"
// *Cause:  A backup set is read more than once. Multiple reads of a backup
//          set can slow restore performance.
//          One of the following could have caused this:
//          1) The MAXSIZE option is used but is not large enough to restore
//             files.
//          2) Files should be restored to a recovery area, but the available
//             disk space is not large enough to restore files.
// *Action: One of the following:
//          1) Increase the MAXSIZE parameter and retry the command.
//          2) Free up disk space in the recovery area.
6563, 1, "control file or SPFILE must be restored using FROM AUTOBACKUP"
// *Cause:  RESTORE CONTROLFILE or RESTORE SPFILE was specified without the
//          FROM AUTOBACKUP option when RMAN is not connected to the recovery
//          catalog.
// *Action: If the recovery catalog is available, connect to the recovery
//          catalog and retry the restore.
//          If the recovery catalog in not available, following is the
//          procedure to restore control file or SPFILE:
//          1. Specify the DBID of the database with the SET DBID command.
//          2. If the AUTOBACKUP was created with non-default AUTOBACKUP
//             format, then specify the AUTOBACKUP format using the SET
//             CONTROLFILE AUTOBACKUP FORMAT command.
//          3. If the backup was created with SBT device, then allocate an SBT
//             channel using the ALLOCATE CHANNEL command.
//          4. Restore control file or SPFILE by starting the
//             RESTORE ... FROM AUTOBACKUP command.
6564, 1,  "must use the TO clause when the instance is started with SPFILE"
// *Cause: A restore of the SPFILE from AUTOBACKUP was attempted when the
//         instance is started with SPFILE and no alternate destination was
//         specified.
// *Action: Specify an alternate destination with the TO clause.
6565, 3, "WARNING: %s: sqlcode %d was caught, automatic retry #%d"
// *Cause: The RMAN client caught a transient error
//         and will automatically retry several times.
// *Action: No action required, this is an informational message.
6566, 1, "target database incarnation not found in control file"
// *Cause: RESETLOGS CHANGE# and/or time of the target database doesn't match
//         any database incarnation in the control file.
// *Action: One of the following actions can be taken to resolve this error
//          1) Restore the control file from the incarnation.
//          2) To populate the new incarnation, inspect or restore an archived
//             log/datafile/datafile copy/backup set from the target
//             incarnation
6567, 1, "connected to auxiliary database: %s (DBID=%s, not open)"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6568, 1, "connected to target database: %s (DBID=%s, not open)"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6569, 1, "DATABASE: %s does not match previous DATABASE: %s"
// *Cause: SET DBID or SET DATABASE was used to specify the target database
//         name which does not match specified database name in DUPLICATE
//         command.
// *Action: Verify that the correct DBID or the correct DATABASE was specified 
//          or avoid specifying DATABASE in DUPLICATE command.
6570, 1, "datafile %d switched to datafile copy \"%s\""
// *Cause: This message was issued in response to a SWITCH command.
// *Action: No action is required, this is an informational message.
6571, 1, "datafile %d does not have recoverable copy"
// *Cause: The SWITCH command with the option TO COPY was specified but
//         the datafile has no valid copy to switch to.
// *Action: Verify whether the datafile has a valid datafile copy.
6572, 1, "database is open and datafile %d is not offline"
// *Cause: The SWITCH command with the option TO COPY was specified, but
//         datafile is not offline and database is open.
// *Action: Either make sure the datafile is offline or the database must be
//          mounted but not opened.
6573, 1, "specified DBID: %s does not match previous DBID: %s"
// *Cause: The DBID in the DUPLICATE command did not match the previously
//         specified DBID in the SET DBID command.
// *Action: Verify that the correct DBID was specified or avoid using 
//          DBID in the DUPLICATE command.
6575, 1, "platform id %d found in datafile %s header is not a valid platform id"
// *Cause: The platform id found in the datafile header was not recognized.
// *Action: Verify that this is a valid datafile.
6576, 1, "platform '%s' (%d) found in header of datafile %s does not match specified platform name '%s' (%d)"
// *Cause: The platform specified in the command did not match the
//         platform found in the datafile header.
// *Action: Specify the correct platform name and retry the command.
6577, 1, "FROM TAG option may only be used with datafile copies"
// *Cause:  The FROM TAG option was specified for datafiles.
// *Action: Remove the option and resubmit the command.
6578, 1, "INCREMENTAL LEVEL > 0 must be specified with FOR RECOVER OF"
// *Cause:  The FOR RECOVER OF option was specified without specifying
//          INCREMENTAL LEVEL > 0.
// *Action: Specify INCREMENTAL LEVEL > 0 and resubmit the command.
6580, 1, "the %s option cannot be used with AS COPY"
// *Cause:  The specified option was specified for a backup as copy command.
// *Action: Remove the option and resubmit the command.
6581, 1, "option %s not supported"
// *Cause: This option was specified and it is not supported.
// *Action: Remove the specified option.
6582, 1, "AS COPY option cannot be used when backing up backup sets"
// *Cause: The backup set was specified with AS COPY.
// *Action: Remove the AS COPY option or remove the backup sets.
6583, 1, "at least 1 channel of TYPE DISK must be allocated to use AS COPY option"
// *Cause:  No channel of TYPE DISK was allocated.
// *Action: Allocate a channel of TYPE DISK and re-issue the command
//          or remove AS COPY.
6584, 3, "WARNING: AS BACKUPSET option added due to allocation of multiple channel types"
// *Cause: DISK and non DISK channels were allocated for a backup command.
//         Configuration indicates to produce image copies to DISK,
//         however due to the mixed channel types BACKUPSETS will be 
//         created on DISK. 
// *Action: Do not allocate non DISK channels to produce image copies 
//          to DISK or allocate only non DISK channels to produce 
//          BACKUPSETS only.
6585, 1, "no copy of datafile %d found"
// *Cause: An available datafile copy for the specified
//         datafile could not be found.
// *Action: make sure that all specified datafiles have a copy available.
6586, 1, "no copy of datafile %d with tag %s found"
// *Cause: An available datafile copy for the specified
//         datafile could not be found.
// *Action: make sure that all specified datafiles have a copy available.
6587, 1, "one or more datafile copies were not found"
// *Cause: This error message was accompanied by an additional error message
//         or messages indicating the cause of the error.
// *Action: Follow the recommended actions of the additional error message
//          or messages.
6588, 1, "number of patterns (%d) to DB_FILE_NAME_CONVERT should be even"
// *Cause: An uneven number of patterns was specified.
// *Action: Specify one more or one less pattern.
6589, 1, "cannot specify DB_FILE_NAME_CONVERT option without AS COPY"
// *Cause: The DB_FILE_NAME_CONVERT option was specified without AS COPY.  
//         This is not permitted for backup set backups where multiple files
//         are combined into a set.
// *Action: Remove the DB_FILE_NAME_CONVERT option and re-run the 
//          BACKUP command. 
6590, 1, "Tablespace %s cannot be converted"
// *Cause: The system tablespaces could not be transported to other platforms.
// *Action: Remove the specified tablespace from the CONVERT command and
//          retry the operation.
6593, 1, "platform name '%s' specified in FROM PLATFORM is not valid"
// *Cause: The platform name was not recognized.
// *Action: Specify a valid platform name.
6594, 1, "platform name '%s' specified in TO PLATFORM is not valid"
// *Cause: The platform name was not recognized.
// *Action: Specify a valid platform name.
6595, 1, "platform name '%s' does not match database platform name '%s'"
// *Cause: The platform name specified did not match
//         the name of the database performing the conversion.
// *Action: Specify the correct platform name.
6596, 1, "%s requires target database compatibility %s, currently set to %s"
// *Cause: A command or option was used that requires a higher database 
//         compatibility than is currently set at the target database.
// *Action: Raise the compatibility of the database before attempting the
//          command again.
6597, 1, "conversion between platforms '%s' and '%s' is not implemented"
// *Cause: Conversion of Oracle datafiles between the specified platforms
//         was not supported.
// *Action: Do not do the conversion.
6599, 1, "Tablespace %s is not read-only"
// *Cause: A conversion was attempted on a tablespace which is not read-only.
// *Action: Change the tablespace to read-only and retry the operation.
/
/ SHOW/CONFIGURE messages 6600-6700
/
6600, 1, "old RMAN configuration parameters:"
// *Cause: This message is issued in response to a CONFIGURE command.
// *Action: No action is required, this is an informational message only.
6601, 1, "new RMAN configuration parameters:"
// *Cause: This message is issued in response to a CONFIGURE command.
// *Action: No action is required, this is an informational message only.
6602, 1, "TO DESTINATION option can be used only for disk device"
// *Cause:  The TO DESTINATION option was specified for non-disk device.
// *Action: Remove the TO DESTINATION option and resubmit the command.
6603, 1, "TO DESTINATION option must be specified with RECOVERY AREA, RECOVERY FILES or DB_RECOVERY_FILE_DEST on disk device"
// *Cause:  RECOVERY FILES, RECOVERY AREA or DB_RECOVERY_FILE_DEST option was
//          specified in BACKUP command on disk device without specifying
//          TO DESTINATION option.
// *Action: Specify TO DESTINATION option and retry the command.
6604, 1, "new RMAN configuration parameters are successfully stored"
// *Cause: This message is issued in response to a CONFIGURE command.
// *Action: No action is required, this is an informational message only.
6605, 1, "old RMAN configuration parameters are successfully deleted"
// *Cause: This message is issued in response to a CONFIGURE command.
// *Action: No action is required, this is an informational message only.
6606, 1, "RMAN configuration parameters are successfully reset to default value"
// *Cause: This message is issued in response to a CONFIGURE command.
// *Action: No action is required, this is an informational message only.
6607, 1, "RMAN configuration parameters for database with db_unique_name %s are:"
// *Cause: This message is issued in response to a SHOW command.
// *Action: No action is required, this is an informational message only.
6608, 1, "RMAN configuration has no stored or default parameters"
// *Cause: This message is issued in response to a SHOW command.
// *Action: No action is required, this is an informational message only.
6609, 1, "AS COPY can be configured only for disk device"
// *Cause:  The AS COPY option was specified for non-disk device.
// *Action: Remove the AS COPY option and resubmit the command.
6610, 1, "For record type %s RECIDS from %u to %u are re-used before resync"
// *Cause:  This messages is issued when the control file records were
//          re-used before resyncing to catalog database.
// *Action: Increase control_file_keep_record_time setting or issue BACKUP
//          command that it will generate fewer control file records, e.g.,
//          backup few tablespaces instead of the complete database in one
//          BACKUP command.
6611, 1, "Following RMAN configuration applied before deleting logs:"
// *Cause: This message is issued in response to a DELETE command.
// *Action: No action is required, this is an informational message only.
6612, 1, "Incompatible options were specified for archivelog deletion policy"
// *Cause: Incompabitle options were specified on CONFIGURE ARCHIVELOG
//         DELETION POLICY command. 
// *Action: Remove incompabitle options and retry the command. BACKED UP
//          option can be used individually or combined with SHIPPED or
//          APPLIED option. 
//          Following are invalid combination of options:
//            a) TO NONE cannot be used with other options
//            b) SHIPPED ON STANDBY and SHIPPED ON ALL STANDBY cannot be
//            used together.
//            c) APPLIED ON STANDBY and APPLIED ON ALL STANDBY cannot be
//            used together.
//            d) SHIPPED and APPLIED cannot be used together.
6613, 1, "Connect identifier for DB_UNIQUE_NAME %s not configured"
// *Cause:  The connect identifier for the specified DB_UNIQUE_NAME 
//          initialization parameter was not configured.
// *Action: Configure the appropriate connect identifier for the 
//          DB_UNIQUE_NAME initialization parameter and re-run the command.
6614, 1, "DB_UNIQUE_NAME string is too long"
// *Cause:  The DB_UNIQUE_NAME initialization parameter string was too long.
// *Action: Configure the appropriate DB_UNIQUE_NAME initialization parameter
//          string and re-run the command. 
6615, 1, "resyncing from database with DB_UNIQUE_NAME %s"
// *Cause:  Resync was performed remotely for the specified DB_UNIQUE_NAME
//          initialization parameter without connecting to it as target 
//          database. This type of remote resync has limitations. For example,
//          RMAN output cannot be resynced. Please refer to RMAN documentation
//          for a complete set of limitations.
// *Action: This is an informational message.
6616, 1, "RMAN output not resynced for database with DB_UNIQUE_NAME %s"
// *Cause:  V$RMAN_OUTPUT contents were not rescyned when the
//          RESYNC CATALOG FROM DB_UNIQUE_NAME command was executed."
// *Action: This is an informational message.
6617, 1, "UNTIL TIME (%s) is ahead of last NEXT TIME in archived logs (%s)"
// *Cause: UNTIL TIME was more than the last NEXT TIME of the last archived log.
// *Action: Check the UNTIL SCN.

/
/ End of SHOW messages 6600-6700
/
/
/ Messages for enhanced scripts 
/
6700, 1, "error parsing text script in file %s"
// *Cause:  Incorrect syntax or invalid commands were found.
// *Action: Fix text script and retry the command.
6701, 1, "could not construct path for file: \"%s\""
// *Cause: An error was encountered when trying to construct the full pathname
//         for the specified file.
// *Action: Ensure that the path is correct.
6702, 1, "could not initialize for input file: \"%s\""
// *Cause: An error was encountered when trying to initialize the specified
//         file for input.
// *Action: Ensure that the file exists.
6703, 1, "could not open file: \"%s\" (reason=%s)"
// *Cause: An error was encountered when trying to open the specified file.
// *Action: Ensure that the file has correct permissions.
6705, 1, "text script line is too long (>1024)"
// *Cause: A text script contained a line longer than the permitted 
//         maximum length.
// *Action: Split the line in smaller lines an retry the operation.
6706, 1, "could not close file: \"%s\" (reason=%s)"
// *Cause: An error was encountered when trying to close the specified file.
// *Action: Ensure that the file has correct permissions and still exists.
6707, 1, "could not initialize for output file: \"%s\""
// *Cause: An error was encountered when trying to initialize the specified
//         file for output.
// *Action: Ensure that the file exists.
6708, 1, "short write while writing file \"%s\". Wrote %s bytes instead of %s bytes"
// *Cause: An attempt was made to write to a file system that was full.
// *Action: Ensure that the file system has room for the file. Check
//          system logs.
6709, 1, "\n        No scripts in recovery catalog"
// *Cause:  An attempt was made to list the scripts in the catalog, 
//          but no scripts could be found in the specified recovery catalog.
// *Action: No action required, this is an informational message only.
6710, 1, "script %s not found in catalog"
// *Cause:  An attempt was made to call a script that could not be
//          found in the target database or as a global script in 
//          the specified catalog.
// *Action: Verify the script name and retry the command.
6711, 1, "global scripts require a TARGET connection"
// *Cause:  Connection to a TARGET database was not specified.
// *Action: Provide a TARGET connection and retry the command.
6716, 1, "skipping datafile %d; already restored to file %s"
// *Cause:  Recovery Manager determined that this file is already restored.
//          Use FORCE option to override this optimization.
// *Action: No action required, this is an informational message only.
6717, 1, "Could not delete auxiliary instance file %s"
// *Cause:  Auxiliary instance file was not deleted.  This message should 
//          be accompanied by other error message(s) indicating the cause 
//          of the error.
// *Action: Check the accompanying errors.
6724, 1, "backup not done; all files already backed up"
// *Cause: A BACKUP command does not need to backup any files,
//         because all of the files to backup are already backed up.
// *Action: No action required, this is an informational message only.
6725, 1, "database not open: sort area size too small"
// *Cause:  sort area size too small to execute RMAN commands.
// *Action: open the database or increase sort_area_size.
6726, 1, "could not locate archived log %s"
// *Cause:  The specified archived log could not be found on any
//          allocated channel.
// *Action: Allocate additional channels on other nodes of the cluster or,
//          if the archived logs has been deleted, use the CROSSCHECK
//          ARCHIVELOG command to correct the recovery catalog or target
//          database control file entries.
6727, 1, "could not locate datafile copy %s"
// *Cause:  The specified datafile copy could not be found on any
//          allocated channel.
// *Action: Allocate additional channels on other nodes of the cluster or
//          if the datafile copy has been deleted, use the CROSSCHECK
//          DATAFILECOPY command to correct the recovery catalog or target
//          database control file entries.
6728, 1, "could not locate control file copy %s"
// *Cause:  The specified control file copy could not be found on any
//          allocated channel.
// *Action: Allocate additional channels on other nodes of the cluster or
//          if the control file copy has been deleted, use the CROSSCHECK
//          CONTROLFILECOPY command to correct the recovery catalog or target
//          database control file entries.
6729, 1, "no backup of the SPFILE found to restore"
// *Cause:  A SPFILE restore could not proceed because no backup of the
//          SPFILE was found. It may be the case that a backup of this file
//          exists but does not satisfy the criteria specified in the user's
//          restore operands.
// *Action: Modify options for the SPFILE restore.
6730, 1, "no channel to restore a backup of the SPFILE"
// *Cause:  A SPFILE restore could not proceed because the backup on a
//          device type that was not allocated for restore.
// *Action: No action required, this is an informational message only.
//          See message 6026 for further details.
6731, 1, "command %s:%s%% complete, time left %02d:%02d:%02d"
// *Cause: This is an informational message only.
// *Action: No action is required.
6732, 1, "database dropped"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6733, 1, "database unregistered from the recovery catalog"
// *Cause:  This is an informational message only.
// *Action: No action is required.
//
6737, 1, "database name \"%s\" does not match target database name \"%s\""
// *Cause:  The UNREGISTER DATABASE command was used with a database name
//          that does not match the name of the database to which RMAN is 
//          connected.
// *Action: Specify the correct database name or avoid specifying the database
//          name when connected to the target database.
6738, 1, "database name \"%s\" is not unique in the recovery catalog"
// *Cause:  The UNREGISTER DATABASE command was used with a database name that
//          is ambiguous.
// *Action: Use the SET DBID command to specify the database id and resolve 
//          the ambiguity.
6739, 1, "database \"%s\" is not found in the recovery catalog"
// *Cause:  The UNREGISTER DATABASE command was used with a database name
//          that was not found in the recovery catalog.
// *Action: Make sure the database name specified in the DROP DATABASE command
//          syntax is correct.
6740, 1, "database name is not specified"
// *Cause: The command failed because of the following:
//         o RMAN is not connected to the target database
//         o The database name is not specified in the command
//         o DBID is not set with the SET DBID command
// *Action: Any one of the following actions will fix the problem:
//          o Connect to the target database
//          o Specify database name
//          o Set DBID with SET DBID command
6741, 1, "database name is \"%s\" and DBID is %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
6742, 1, "platform name '%s' longer than %d"
// *Cause:  The specified platform name exceeds the maximum allowable 
//          platform name.
// *Action: Correct the platform name.
6743, 1, "specification does not match any backup set in the repository"
// *Cause: The specified backup sets were not found in the recovery catalog or
//         target database control file.
// *Action: Verify backup set existence and retry the command.
6744, 1, "specification does not match any datafile copy in the repository"
// *Cause: The specified datafile copies were not found in the recovery catalog
//         or target database control file.
// *Action: Verify datafile copy existence and retry the command.
6745, 1, "skipping datafile copy %s; already backed up %s time(s)"
// *Cause:  The indicated datafile copy was not included in the backup set
//          because it was already backed up on the device requested.
// *Action: Use FORCE option to override backup optimization.
6746, 1, "backup cancelled because there are no files to backup"
// *Cause:  There were no files or all files were skipped for this backup set,
//          therefore no backup set was created.
// *Action: This message is informational only.
6747, 1, "at least 1 channel of tertiary storage must be allocated to execute this command"
// *Cause:  The executed command requires a SBT channel, but no channels of
//          type SBT were configured or allocated.
// *Action: ALLOCATE or CONFIGURE a SBT channel.
6748, 1, "more than one channel types were allocated"
// *Cause:  RECOVERY FILES, RECOVERY AREA or DB_RECOVERY_FILE_DEST option was
//          specified in BACKUP command, but more than one channel
//          types was used and no DEVICE TYPE or CHANNEL option was
//          specified.
// *Action: Specify CHANNEL or DEVICE TYPE option and retry the command.
6749, 1, "restore point %s does not exist."
// *Cause: The specified restore point does not exists in v$restore_point
//         table of the target database.
// *Action: Check the name of restore point and retry the command.
6750, 1, "SPFILE cannot be backed up by proxy."
// *Cause: The PROXY option was specified, but proxy copy of SPFILE
//         is not supported. This file will be placed into a non-proxy
//         backup set.
// *Action: No action required, this is an informational message only.
6751, 1, "ASM file %s cannot be proxy backed up."
// *Cause:  The PROXY option was specified, but proxy copy of ASM file
//          is not supported. This file will be placed into a non-proxy
//          backup set.
// *Action: No action required, this is an informational message only.
6752, 1, "error while looking up tempfile: %s"
// *Cause:  An error occurred while looking up the specified tempfile in
//          the recovery catalog or target database control file.
// *Action: This error is accompanied by other errors describing the reason
//          for the failure; see those error messages for further information.
//          One possible problem is that the tempfile name was not
//          entered correctly.
6753, 1, "tempfile not found in the repository"
// *Cause:  The specified tempfile is not found in the control file or
//          recovery catalog. 
// *Action: Make sure that the tempfile name is correct and retry
6754, 1, "INCREMENTAL FROM SCN option is not supported with [%s]"
// *Cause: The INCREMENTAL FROM SCN option was supplied but does not apply
//         to this type of backup.
// *Action: Remove the INCREMENTAL FROM SCN operand and re-enter the command.
6755, 3, "WARNING: datafile %s: incremental-start SCN is too recent; using checkpoint SCN %s instead"
// *Cause:  The incremental-start sysetm change number (SCN) which was
//          specified when starting an incremental datafile backup is
//          greater than the datafile checkpoint SCN, which could cause
//          some blocks to be missed.
// *Action: Specify a smaller incremental-start system change number (SCN).
6756, 1, "cannot flashback database to non-guaranteed restore point %s when flashback is off"
// *Cause: The indicated restore point was not guaranteed and flashback was
//         disabled. When flashback is disabled, Oracle can flashback only
//         to guaranteed restore point.
// *Action: Specify a guaranteed restore point or turn on flashback and
//          retry the command.
//          the command.
6757, 1, "DB_UNIQUE_NAME \"%s\" does not match target database (\"%s\")"
// *Cause:  The value specified in the FOR DB_UNIQUE_NAME option did not
//          match the DB_UNIQUE_NAME parameter setting of the target
//          database.
// *Action: Use the RMAN STARTUP command, with no parameter file option,
//          to start the target database without a parameter file, then
//          run the RESTORE SPFILE command again.
6758, 1, "DB_UNIQUE_NAME is not unique in the recovery catalog"
// *Cause:  RMAN could not identify which SPFILE to restore for this
//          target database, because the recovery catalog contained two
//          or more different instances of this database, each with
//          different DB_UNIQUE_NAME values.
// *Action: Use the FOR DB_UNIQUE_NAME option to specify the name of
//          the instance whose parameter file you want to restore.
6759, 1, "skipping datafile copies that are already backed up"
// *Cause:  Some datafile copies were not be backed up because
//          they were already backed up on the device requested.
// *Action: No action is required.  You can use the FORCE option
//          to override backup optimization and force these files to be
//          backed up.
6760, 1, "skipping archived logs that are already backed up"
// *Cause:  Some archived logs were not be backed up because
//          they were already backed up on the device requested.
// *Action: No action is required.  You can use the FORCE option
//          to override backup optimization and force these files to be
//          backed up.
6761, 1, "skipping backup sets that are already backed up"
// *Cause:  Some backup sets were not be backed up because
//          they were already backed up on the device requested.
// *Action: No action is required.  You can use the FORCE option
//          to override backup optimization and force these files to be
//          backed up.
6762, 1, "ignoring encryption for proxy or image copies"
// *Cause: This information message is displayed when the RMAN client is
//         generating proxy or image copies and encryption was enabled for
//         the input files.
// *Action: This is an informational message only.
6763, 1, "specified encryption algorithm not supported"
// *Cause: An encryption algorithm not supported by the database is specified 
//         during backup.
// *Action: Refer to contents of v$rman_encryption_algorithms view for the 
//          list of supported encryption algorithm. Specify a valid encryption
//          algorithm and retry the command.
6764, 1, "%s"
// *Cause:  An error occurred when processing user request.
// *Action:
6765, 1, "Tablespace %s will be encrypted in future backup sets"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6766, 1, "Tablespace %s will not be encrypted in future backup sets"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6767, 1, "Tablespace %s will default to database encryption configuration"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6768, 1, "duplicate or conflicting options are specified: %s and %s"
// *Cause:  An error occurred when processing the command because user
//          specified two duplicate options or the two options are not 
//          allowed to be used together.
// *Action: Remove one of the above options and retry the command.
6769, 1, "length of password must be greater than zero"
// *Cause:  Zero length password was specified for encrypted backups.
// *Action: Retry the command using a password with non-zero length.
6770, 1, "backup encryption requires Enterprise Edition"
// *Cause: The backup command tried to create encrypted backups, but 
//         Enterprise Edition is not installed.
// *Action: Do not create encrypted backups.
6771, 1, "cannot do IMPORT CATALOG after NOCATALOG has been used"
// *Cause: The IMPORT CATALOG command was used after the NOCATALOG option was
//         already specified.
// *Action: Restart RMAN and connect to recovery catalog if you wish to
//          IMPORT CATALOG.
6772, 1, "cannot do IMPORT CATALOG before connecting to recovery catalog"
// *Cause: The IMPORT CATALOG command was used before connecting to the
//         recovery catalog.
// *Action: Connect to recovery catalog using CONNECT CATALOG command if
//          you wish to IMPORT CATALOG.
6773, 1, "connected to source recovery catalog database"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6774, 1, "must specify a TNS service name for source recovery catalog database"
// *Cause:  The connect string does not contain TNS service name. IMPORT
//          CATALOG without TNS service name is not supported.
// *Action: Specify a service name and resubmit the command.
6775, 1, "not connected to source recovery catalog database"
// *Cause: IMPORT CATALOG command was issued but no connection to the
//         source recovery catalog database has been established.
// *Action: Resubmit IMPORT CATALOG command with correct connect string.
6776, 1, "source recovery catalog database not started"
// *Cause: IMPORT CATALOG command was issued which requires the source 
//         recovery catalog to be open.
// *Action: Open the source recovery catalog database and re-submit the
//          command. 
6777, 1, "ORACLE error from source recovery catalog database: %s"
// *Cause:  This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
6778, 3, "WARNING: %s: sqlcode %d was caught, automatic retry #%s"
// *Cause: The RMAN client caught a transient error during temporary resource
//         allocate for IMPORT CATALOG command and will automatically
//         retry several times.
// *Action: No action required, this is an informational message.
6779, 1, "import validation complete"
// *Cause: This is an informational message only.
// *Action: No action required.
6780, 1, "database unregistered from the source recovery catalog"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6781, 1, "%s package version %s in source database is not of version %s"
// *Cause: The catalog schema version of the source recovery catalog is
//         not the same as the target recovery catalog.  The two catalog
/          schemas must be the same version. 
// *Action: UPGRADE source recovery catalog schema and recovery catalog
//          schema to same version and retry the command.
6782, 1, "Datafile headers of locally managed datafiles need to be updated."
// *Cause:  This is an informational message only.
// *Action: No action is required.
6783, 1, "Update of datafile headers of locally managed datafiles finished."
// *Cause:  This is an informational message only.
// *Action: No action is required.
6784, 1, "One or more datafile headers of locally managed datafiles were not updated."
// *Cause:  Errors prevented the update of one or more datafile headers.
// *Action: See trace file for details of the problem.
6785, 1, "This operation might take some time."
// *Cause:  This is an informational message only.
// *Action: No action is required.
6786, 1, "could not read file header for datafile %s to do FLASHBACK."
// *Cause:  The indicated datafile header could not be read to do 
//          FLASHBACK DATABASE.
// *Action: If the database must be taken back in time then a restore and
//          incomplete recovery must be performed.
6787, 3, "WARNING:  TAG %s option is ignored; backups will be tagged with %s"
// *Cause:  WITH TAG option and TAG option were used together. When WITH TAG
//          option is used, all the backups created by the command will have
//          tag specified with WITH TAG option.
// *Action: The TAG option can be removed to not display the message.
6791, 1, "changed the DB_UNIQUE_NAME value from %s to %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
6792, 1, "database db_unique_name is \"%s\", db_name is \"%s\" and DBID is %s"
// *Cause: UNREGISTER DB_UNIQUE_NAME or CHANGE DB_UNIQUE_NAME command was 
//         executed, hence RMAN displayed the database information for which 
//         DB_UNIQUE_NAME the metadata will be removed/renamed in the
//          recovery catalog.
// *Action: No action required, this is an informational message only.
6793, 1, "database with db_unique_name %s unregistered from the recovery catalog"
// *Cause: UNREGISTER DB_UNIQUE_NAME command was executed.
// *Action: No action required, this is an informational message only.
//
6795, 1, "Flashback database logging is not on."
// *Cause:  A FLASHBACK DATABASE command was tried but flashback database
//          logging has not been enabled.
// *Action: Flashback database logging must be enabled via the ALTER
//          DATABASE FLASHBACK ON command before a FLASHBACK DATABASE command
//          can be tried.  If the database must be taken back in time then
//          a restore and incomplete recovery must be performed.
6796, 1, "Not enough flashback database log data to do FLASHBACK."
// *Cause:  There was not enough flashback database log data to do the
//          FLASHBACK DATABASE.
// *Action: If the database must be taken back in time then a restore and
//          incomplete recovery must be performed.
6797, 1, "Grant succeeded."
// *Cause: This is an informational message issued in response to a GRANT
//         command.
// *Action: No action required.
6798, 1, "Revoke succeeded."
// *Cause: This is an informational message issued in response to a REVOKE
//         command.
// *Action: No action required.
6799, 1, "found eligible base catalog owned by %s"
// *Cause: When creating a virtual private catalog, an 11g base catalog was
//         found, owned by the specified user, and the currently connected
//         catalog user has been granted privileges on this catalog, and can
//         therefore create a virtual private catalog using this base catalog.
//         This is an informational message issued in response to a
//         CREATE VIRTUAL CATALOG command.
// *Action: No action required.
6800, 1, "found ineligible base catalog owned by %s"
// *Cause: When creating a virtual private catalog, an 11g base catalog was
//         found, owned by the specified user, and the currently connected
//         catalog user has not been granted any privileges on this catalog.
//         This is an informational message issued in response to a
//         CREATE VIRTUAL CATALOG command.
// *Action: No action required.
6801, 1, "no base catalog found"
// *Cause: When trying to create a virtual catalog, either no base catalog
//         was found, or this user has no privilege to create a virtual
//         catalog against any existing base catalog.
// *Action: Establish the correct privileges and re-create the virtual catalog.
6802, 1, "too many eligible base catalogs found"
// *Cause: When trying to create a virtual catalog, more than one base
//         catalog was found that is eligible to be the base catalog for
//         this virtual catalog.
// *Action: Revoke privileges so that the current catalog user has privileges
//          on only one base catalog, then re-issue the CREATE VIRTUAL CATALOG
//          command.
6803, 1, "created virtual catalog against base catalog owned by %s"
// *Cause: A virtual private catalog was created, where the base catalog
//         data is owned by the specified user.
//         This is an informational message issued in response to a
//         CREATE VIRTUAL CATALOG command.
// *Action: No action required.
6804, 1, "Enter value for %s:"
// *Cause:  This is a user prompt.
// *Action: Enter a substitution value to proceed.
6805, 1, "SET NEWNAME command has not been issued for tempfile %s"
// *Cause:  A SWITCH command was specified for a tempfile, but no destination
//          was specified and no SET NEWNAME command has been previously
//          issued for that file.  An explicit file to switch to must be 
//          specified if no SET NEWNAME command has been issued.
// *Action: Correct and resubmit the SWITCH command.
6806, 1, "compression algorithm '%s' of release %s not found"
// *Cause: An unsupported compression algorithm was specified for the backup.
// *Action: Query the V$RMAN_COMPRESSION_ALGORITHM view for the
//          list of suppmrted compression algorithms. Specify a valid 
//          compression algorithm and retry the command.
6807, 1, "compression algorithm '%s' of release %s cannot be used because database compatibility is less than %s"
// *Cause: The compression algorithm is not supported because the current
//         compatibility level of the database is too low.
// *Action: Query the V$RMAN_COMPRESSION_ALGORITHM view for the
//          list of supported compression algorithms. Specify a valid compression
//          algorithm and retry the command.
6808, 1, "SECTION SIZE cannot be used when piece limit is in effect"
// *Cause:  The SECTION SIZE backup option was used together with the
//          MAXPIECESIZE channel limit.
//          These options are mutually exclusive, because they are independant
//          methods of creating multiple backup pieces with one backup command.
// *Action: Use one option or the other, but not both.
6809, 1, "compression algorithm '%s' of release %s requires advanced compression option"
// *Cause: The compression algorithm was not supported because it requires
//         advanced compression option to be enabled.
// *Action: Enable advanced compression option by setting
//          advanced_compression_option_usable=true or specify a different
//          compression algorithm.
6810, 1, "specification does not match any datafile copy in the repository"
// *Cause:  No datafile copies were found that match specification in the
//          recovery catalog or target database control file.
// *Action: Check the specifier.
6811, 1, "specification does not match any control file copy in the repository"
// *Cause:  No control file copies were found that match specification in the
//          recovery catalog or target database control file.
// *Action: Check the specifier.
6812, 1, "specification does not match any backup in the repository"
// *Cause:  No backups were found that match specification in the
//          recovery catalog or target database control file.
// *Action: Check the specifier.
//
// ADD NEW KRMK ERROR MESSAGES HERE
//
/
6898, 1, "recovery catalog is partially upgraded to %s"
// *Cause: The recovery catalog database was not completely upgraded to the
//         specified version. Either there were some errors during execution
//         of UPGRADE CATALOG or UPGRADE CATALOG was cancelled before
//         completion.
// *Action: Execute UPGRADE CATALOG again.
6899, 1, "updating recovery catalog with new database incarnation"
// *Cause: The target database has a new incarnation that has not already
//         been seen by the recovery catalog.  This usually happens because
//         a Point-in-Time Recovery was done.  RMAN has made the necessary
//         updates to the recovery catalog.
// *Action: This is an informational message only.
6900, 3, "WARNING: unable to generate V$RMAN_STATUS or V$RMAN_OUTPUT row"
// *Cause:  The routine createRmanStatusRow() or createRmanOutputRow()
//          could add new row into V$RMAN_STATUS or V$RMAN_OUTPUT.
// *Action: Check the associated error messages. If the associated error 
//          message indicates a condition that can be corrected, do so, 
//          otherwise contact Oracle.
6901, 3, "WARNING: disabling update of the V$RMAN_STATUS and V$RMAN_OUTPUT rows"
// *Cause: Informational message only.
// *Action: No action required.
6902, 1, "AS COMPRESSED BACKUPSET option cannot be used when backing up backup sets"
// *Cause: The backup set was specified with AS COMPRESSED BACKUPSET.
// *Action: Remove the AS COMPRESSED BACKUPSET option.
6903, 1, "backup of datafile %s was cancelled"
// *Cause:  This is an informational message displayed when PARTIAL option of
//          DURATION option was specified on the BACKUP command and backup
//          could not be completed within the given duration time.
// *Action: Run the BACKUP command to backup cancelled files, or let the next
//          backup window backup the cancelled files. It should be noted that 
//          the files that were skipped in the current job will be given 
//          preference to other files for next the BACKUP command with
//          DURATION option.
6904, 1, "backup of archived log for thread %d with sequence %d and starting SCN of %s was cancelled"
// *Cause:  This is an informational message displayed when PARTIAL option of
//          DURATION option was specified on the BACKUP command and backup
//          could not be completed within the given duration time.
// *Action: Run BACKUP command to backup cancelled files, or let the next
//          backup window backup the cancelled files. It should be noted that 
//          the files that were skipped in the current job will be given 
//          preference to other files for next the BACKUP command with
//          DURATION option.
6905, 1, "backup of backup set key %d was cancelled"
// *Cause:  This is an informational message displayed when PARTIAL option of
//          DURATION option was specified on the BACKUP command and backup
//          could not be completed within the given duration time.
// *Action: Run BACKUP command to backup cancelled files, or let the next
//          backup window backup the cancelled files. It should be noted that 
//          the files that were skipped in the current job will be given 
//          preference to other files for next the BACKUP command with
//          DURATION option.
6906, 1, "backup of control file was cancelled"
// *Cause:  This is an informational message displayed when PARTIAL option of
//          DURATION option was specified on the BACKUP command and backup
//          could not be completed within the given duration time.
// *Action: Run BACKUP command to backup cancelled files, or let the next
//          backup window backup the cancelled files. It should be noted that 
//          the files that were skipped in the current job will be given 
//          preference to other files for next the BACKUP command with 
//          DURATION option. 
/
6907, 1, "MINIMIZE LOAD option not allowed for the specified input files"
// *Cause:  This option was specified in a backup command specification for
//          BACKUP BACKUPSET or BACKUP CURRENT CONTROLFILE command.
// *Action: Remove the MINIMIZE LOAD option and retry the command.
/
6908, 3, "WARNING: operation will not run in parallel on the allocated channels"
// *Cause: RMAN allocated more than one channel for a job, but the job
//         will not run in parallel on these channels because parallelism
//         require Enterprise Edition. 
// *Action: None
6909, 3, "WARNING: parallelism require Enterprise Edition"
// *Cause: RMAN allocated more than one channel for a job, but the job
//         will not run in parallel on these channels because parallelism
//         require Enterprise Edition. 
// *Action: None
/
6910, 3, "can not invoke parallel recovery for test recovery"
// *Cause:  Recover database was called with TEST and PARALLEL option
// *Action: Call recover database with either just the TEST or PARALLEL option
6911, 3, "only one PARALLEL or NOPARALLEL clause may be specified"
// *Cause:  Recover database was called with PARALLEL and NOPARALLEL option
// *Action: Call recover database with either just the PARALLEL or NOPARALLEL
//          option.
/
6912, 1, "backup of spfile was cancelled"
// *Cause:  This is an informational message displayed when PARTIAL option of
//          DURATION option was specified on the BACKUP command and backup
//          could not be completed within the given duration time.
// *Action: Run BACKUP command to backup cancelled files, or let the next
//          backup window backup the cancelled files. It should be noted that 
//          the files that were skipped in the current job will be given 
//          preference to other files for next the BACKUP command with 
//          DURATION option.
6913, 1, "validate cancelled because there are no files to validate"
// *Cause: All files for this validate command were skipped, therefore no
//         files to validate.
// *Action: This message is informational only.
6914, 1, "BLOCK %s must be greater or equal to BLOCK %s"
// *Cause: The value of TO block number was less than the value of from
//         block number.
// *Action: Increase the value of TO BLOCK past the value of from BLOCK
//          and retry the command.
/
/
6915, 1, "restore point %s already exists"
// *Cause:  The specified restore point already exists on this database.
// *Action: Use LIST RESTORE POINT to see existing names and retry the command
//          with a unique restore point name.
/
/ Transport DB: 6920 -  6940 
/
/ Cannot transport database errors:  6920 - 6940 
6920, 1, "database %s is not open read-only"
// *Cause:  CONVERT DATABASE attempted on a database that was not open 
//          read-only.
// *Action: Open the database in read-only mode and retry the operation.
6921, 1, "Convert database check failed"
// *Cause:  This database could not be transported because DBMS_TDB.CHECK_DB
//          returned FALSE.
// *Action: None
6922, 1, "External table %s.%s found in the database"
// *Cause:  An external table was found in the database.
// *Action: Redefine the table in the transported database.
6923, 1, "Directory %s.%s found in the database"
// *Cause:  A directory object was found in the database.
// *Action: Redefine the directory in the transported database.
6924, 1, "BFILE %s.%s found in the database"
// *Cause:  A BFILE was found in the database.
// *Action: Redefine the BFILE in the transported database.
6925, 1, "BFILEs are used in the system, please redefine them in the transported database"
// *Cause:  BFILEs may or may not exist in the database. Automatically
//          performed BFILE check failed because database was open 
//          read-only and could not allocate temporary space.  This does 
//          not affect CONVERT DATABASE operation.
// *Action: Use DBMS_TDB.CHECK_EXTERNAL to perform BFILE check when the
//          database is open in read/write mode.
6926, 1, "User %s with %s privilege found in password file"
// *Cause:  Password file was used.
// *Action: Re-create the password file on the target platform using ORAPWD
//          for the transported database.
6927, 1, "Cannot specify NEW DATABASE clause more than once"
// *Cause:  NEW DATABASE clause specified more than once
// *Action: Remove redundant NEW DATABASE clause and retry the operation.
6928, 1, "Cannot specify ON TARGET PLATFORM clause more than once"
// *Cause:  ON TARGET PLATFORM clause specified more than once
// *Action: Remove redundant ON TARGET PLATFORM clause and retry the 
//          operation.
6929, 1, "Cannot specify TRANSPORT SCRIPT clause more than once"
// *Cause:  TRANSPORT SCRIPT clause specified more than once
// *Action: Remove redundant ON TARGET PLATFORM clause and retry the 
//          operation.
6930, 1, "Cannot specify SKIP clause more than once"
// *Cause:  SKIP clause specified more than once
// *Action: Remove redundant SKIP clause and retry the operation.
6931, 1, "Cannot specify FROM PLATFORM clause"
// *Cause:  CONVERT DATABASE command cannot use FROM PLATFORM clause.
// *Action: Change FROM PLATFORM clause and retry.
6932, 1, "Database name '%s' longer than %d"
// *Cause:  The specified database name exceeded the maximum allowable
//          database name length.
// *Action: Correct the database name.
6933, 1, "Transport script name too long"
// *Cause:  The specified transport script name exceeded the maximum allowable
//          script name length.
// *Action: Correct the script name.
6934, 1, "Format string too long"
// *Cause:  The specified format string exceeded the maximum allowable format 
//          string length.
// *Action: Correct the format string.
6935, 1, "Convert script name too long"
// *Cause:  The specified convert script name exceeded the maximum allowable
//          script name length.
// *Action: Correct the script name.
/
/ Continuation of KRMK messages: 6941-6999
/
6941, 1, "Database must be closed and mounted EXCLUSIVE and RESTRICTED."
// *Cause:  DROP DATABASE was attempted while the database was open or
//          not mounted EXCLUSIVE and RESTRICTED.
// *Action: Change the database state to mounted EXCLUSIVE and RESTRICTED.
6942, 1, "OPTION %d is invalid; OPTION must be between %s and %s"
// *Cause:  An invalid OPTION was used.
// *Action: Change the OPTION argument.
6943, 1, "no automatic repair OPTION %d was listed in ADVISE FAILURE"
// *Cause:  The OPTION specified was not one of the automatic repair options
//          listed by ADVISE FAILURE or there were no options listed by the
//          ADVISE FAILURE command.
// *Action: Change the OPTION argument or resubmit ADVISE FAILURE with
//          a different set of failures.
6944, 1, "contents of repair script:"
// *Cause: This is an informational message only.
// *Action: No action is required.
6945, 1, "no repair script present for REPAIRID %s"
// *Cause: REPAIRID option specified in the command was invalid or
//         the repair script had been purged from Automated Diagnostic
//         Repository.
// *Action: Retry REPAIR FAILURE command with a different OPTION number.
6946, 1, "executing repair script"
// *Cause: This is an informational message only.
// *Action: No action is required.
6947, 1, "searching flashback logs for block images until SCN %s"
// *Cause:  Starting the flashback log search for RECOVER...BLOCK command.
//          The log is searched until the indicated system change number (SCN).
// *Action: None. This is an informational message displayed for
//          RECOVER...BLOCK command. 
6948, 1, "searching flashback logs for block images"
// *Cause:  Starting the flashback log search for RECOVER...BLOCK command.
//          The log is searched until the end of the log.
// *Action: None. This is an informational message displayed for
//          RECOVER...BLOCK command. 
6949, 1, "finished flashback log search, restored %s blocks"
// *Cause:  Flashback log search finished for RECOVER...BLOCK command.
// *Action: None. This is an informational message displayed for
//          RECOVER...BLOCK command. 
6950, 1, "invalid validate option specified: %s"
// *Cause:  The specified object was invalid with VALIDATE command.
// *Action: Delete the invalid operand.
6951, 1, "repair failure complete"
// *Cause: This is an informational message only.
// *Action: No action is required.
6952, 00000, "database needs to be restarted"
// *Cause:  The target database control file was missing.
// *Action: Restart the instance and repair the database.
6953, 00000, "no automatic repairs were listed by ADVISE FAILURE"
// *Cause: There were no automatic repairs listed by the ADVISE FAILURE
//         command.
// *Action: Choose a different failure, submit ADVISE FAILURE command, and
//          then submit REPAIR FAILURE command.
6954, 00000, "REPAIR command must be preceded by ADVISE command in same session"
// *Cause: The ADVISE command was not issued in the same session as the REPAIR
//         command.
// *Action: Submit ADVISE command and then submit the REPAIR command in
//          same session.
6955, 1, "Network copies are only supported for image copies."
// *Cause: An attempt was made to specify BACKUP AUXILIARY FORMAT without
//         specifying the AS COPY clause.  A network copy is only supported
//         with an image copy.
// *Action: Seek an alternate method of copying the desired files.
6956, 1, "create datafile failed; retry after removing %s from OS"
// *Cause: An attempt was made to re-create a database file.
//         This attempt failed.
// *Action: If the indicated file already exists, remove the file from
//          operating system and retry the RMAN command.
6957, 1, "finished standby search, restored %s blocks"
// *Cause:  Standby search finished for RECOVER...BLOCK command.
// *Action: None. This is an informational message displayed for
//          RECOVER...BLOCK command.
6958, 1, "Executing: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
/ Messages for tspitr actions in krmk files
6959, 3, "WARNING: repair completed but could not verify that failures were fixed by it"
// *Cause:  RMAN repair command successfully completed but could not check if
//          the failures were fixed.
// *Action: Use LIST FAILURE command to verify repair results.
6960, 1, "   EXPDP> %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
6961, 1, "   IMPDP> %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
6962, 1, "Error received during export of metadata"
// *Cause: Data Pump could not perform export of tablespace metadata.
// *Action: See accompanying datapump messages indicating the cause
//          of the error.
6963, 1, "Error received during import of metadata"
// *Cause: Data Pump could not perform import of tablespace metadata.
// *Action: See accompanying datapump messages indicating the cause
//          of the error.
6964, 1, "option %s cannot be used with %s"
// *Cause: Incompatible options were specified that caused the command to fail.
// *Action: Remove one of the options from the command and retry.
6965, 1, "Datapump job has stopped"
// *Cause: A Data Pump error has caused the job to stop.
// *Action: See accompanying datapump messages or look for a Data Pump trace
//          file for the cause of the error.
6966, 1, "Invalid release number %s"
// *Cause: An incorrectly formatted release number was specified.
// *Action: Specify a valid release number in n.n.n.n.n format. 
/
/ Message for power setnewname
/
6970, 1, "NEWNAME '%s' for database must include %%f or %%U format"
// *Cause: The newname in SET NEWNAME FOR DATABASE did not include a format
//         specifier to produce different newnames for the datafiles.
// *Action: Include %f or %U in the newname or use SET NEWNAME FOR DATABASE
//          TO NEW to ensure datafiles get different datafile names.
6971, 1, "NEWNAME '%s' for tablespace must include %%f or %%U format"
// *Cause: The newname in SET NEWNAME FOR TABLESPACE did not include a format
//         specifier to produce different newnames for the datafiles.
// *Action: Include %f or %U in the newname or use SET NEWNAME FOR TABLESPACE
//          ... TO NEW to ensure datafiles get different datafile names.
6980, 1, "The following errors need to be fixed before peforming this command"
// *Cause: The tablespaces failed validation by DBMS_TTS.TRANSPORT_SET_CHECK.
// *Action: Fix accompanying violations before attempting the command again.
6981, 1, "     Violation: %s"
// *Cause: This message was issued to show a violation obtained from the 
//         DBMS_TTS.TRANSPORT_SET_CHECK.
// *Action: Fix violation before attempting the command again.
/
/ LIST/REPORT command messages occupy two sub-ranges of the krmk
/ messages.
/ The ranges are 6200-6399 and 7000-7500.
/
7000, 1, "List of SPFILE Backups"
// *Cause: This message is issued in response to a LIST BACKUP OF SPFILE 
//         command.
// *Action: No action is required.
/
7001, 1, "======================"
7002, 1, "%-*s BS Key  S #Pieces #Copies Compressed Tag"
7003, 1, "%-.*s ------- - ------- ------- ---------- ---"
7004, 1, "%-*s %-7s %c %-7s %-7s %-10s %s"
7005, 1, "SPFILE Included: Modification time: %s"
7006, 1, "List of Permanent Datafiles"
7007, 1, "==========================="
7008, 1, "List of Temporary Files"
7009, 1, "======================="
7010, 1, "File Size(MB) Tablespace           Maxsize(MB) Tempfile Name"
7011, 1, "---- -------- -------------------- ----------- --------------------"
7012, 1, "%-4s %-8s %-20s %-11s %s"
7013, 1, "SPFILE db_unique_name: %s"
/
7014, 1, "List of Control File Copies"
7015, 1, "==========================="
7016, 1, "Key     S %-*s Ckp SCN    %-*s"
7017, 1, "------- - %-.*s ---------- %-.*s"
7018, 1, "%-7s %1s %-*s %-10s %-*s"
/
/ list of archived logs in backup set
7019, 1, "%-4s %-7s %-10s %-*s %-10s %s (TERMINAL)"
/
7020, 1, "List of Foreign Archived Log Copies for database with db_unique_name %s"
7021, 1, "============================================================================"
7022, 1, "Key     Dbid       Thrd Seq     S %-*s"
7023, 1, "------- ---------- ---- ------- - %-.*s"
7024, 1, "%-7s %-10s %-4s %-7s %1s %-*s"
7025, 1, "%s is not supported for foreign archived log"
// *Cause:  The specified option was not supported for foreign archived log.
// *Action: Do not use the specified command for foreign archived log.
7200, 1, "no failures found that match specification"
// *Cause:  A failure specifier did not match any failures in the
//          Automated Diagnostic Repository.
// *Action: Resubmit the command with a different failure specifier. You
//          can use the LIST FAILURE ALL command in Recovery Manager to
//          display all failures known to RMAN.
//
7203, 1, "%-*s Priority Status    %-*s Summary"
7204, 1, "%-.*s -------- --------- %-.*s -------"
7205, 1, "%-*s %-8s %-9s %-*s %s"
7206, 1, "Impact: %s"
7207, 1, "changed %s failures to HIGH priority"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7208, 1, "changed %s failures to LOW priority"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7209, 1, "closed %s failures"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7210, 1, "new failures after most recent LIST FAILURE command"
// *Cause:  New failures were found since last LIST FAILURE command in this
//          RMAN session.
// *Action: No action is required. This is an informational message only.
7211, 1, "failure option not specified"
// *Cause:  ALL, CRITICAL, HIGH, LOW, or list of failure numbers was not
//          specified.
// *Action: Specify a failure option and resubmit the command.
7212, 1, "skipping failure %s because it was CLOSED"
// *Cause: The specified failure has been already closed, so
//         ADVISE FAILURE or CHANGE FAILURE cannot be executed on this
//         failure.
// *Action: This is an informational message only. No action is required.
7213, 1, "Mandatory Manual Actions"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7214, 1, "%s. %s"
7215, 1, "Automated Repair Options"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7216, 1, "Strategy: %s"
7217, 1, "Option Repair Description"
7218, 1, "------ ------------------"
7219, 1, "%-6s %s%s%s%s%s%s"
7220, 1, "no manual actions available"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7221, 1, "Optional Manual Actions"
7222, 1, "======================="
// *Cause:  This is an informational message only.
// *Action: No action is required.
7224, 1, "-------------------------------------------------------------------"
7225, 1, "List of Datafiles"
7226, 1, "================="
7227, 1, "File Status Marked Corrupt Empty Blocks Blocks Examined High SCN"
7228, 1, "---- ------ -------------- ------------ --------------- ----------"
7229, 1, "%-4s FAILED %-14s %-12s %-15s %-10s"
7230, 1, "Block Type Blocks Failing Blocks Processed"
7231, 1, "---------- -------------- ----------------"
7232, 1, "Data       %-14s %-16s"
7233, 1, "Index      %-14s %-16s"
7234, 1, "Other      %-14s %-16s"
7235, 1, "======================="
7236, 1, "List of Archived Logs"
7237, 1, "====================="
7238, 1, "Thrd Seq     Status Blocks Failing Blocks Examined Name"
7239, 1, "---- ------- ------ -------------- --------------- ---------------" 
7240, 1, "%-4s %-7s %-6s %-14s %-15s %s"
7241, 1, "List of Control File and SPFILE" 
7242, 1, "==============================="
7243, 1, "File Type    Status Blocks Failing Blocks Examined"
7244, 1, "------------ ------ -------------- ---------------" 
7245, 1, "Control File %-6s %-14s %-16s"
7246, 1, "SPFILE       %-6s %-14s %-16s"
7247, 1, "%-4s OK     %-14s %-12s %-15s %-10s"
7248, 1, "SCN              %-*s Type       %-*s Name"
7249, 1, "---------------- %-.*s ---------- %-.*s ----"
7250, 1, "%-16s %-*s %-10s %-*s %s"
7251, 1, "Repair script: %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7252, 1, "========================"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7253, 1, "========================"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7254, 1, "List of child failures for parent failure ID %s"
7255, 1, "priority change for failure %s failed"
// *Cause : An attempt was made to change the priority of a child failure.
// *Action: Specify the parent failure ID to change the child failure.
7256, 1, "cannot change priority of child failure"
// *Cause : An attempt was made to change the priority of child failure.
// *Action: This message should be followed by one or more 7255 messages.
7257, 1, "RSP Time"
7258, 1, "Time"
7259, 1, "%s critical failures exist; cannot exclude from ADVISE FAILURE"
// *Cause: ADVISE FAILURE was executed for HIGH or LOW priority failures when
// CRITICAL failures existed.
// *Action: Execute ADVISE FAILURE with the CRITICAL or ALL options.
7260, 1, "List of Database Failures" 
7261, 1, "=========================" 
7262, 1, "no automatic repair options available"
// *Cause:  This is an informational message only.
// *Action: No action is required.
/
/ CATALOG command messages
/
7500, 1, "searching for all files that match the pattern %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7501, 1, "searching for all files in the recovery area"
// *Cause:  This is an informational message only.
// *Action: No action is required.

7502, 1, "List of Files Unknown to the Database"
// *Cause: This message is issued in response to a CATALOG command.
// *Action: No action is required.
7503, 1, "====================================="
7504, 1, "File Name: %s"

7505, 2, "no files found to be unknown to the database"
// *Cause: This is an informational message displayed by the CATALOG command.
//         The command either found no files, or all files that matched
//         the specified search pattern were already present in the target
//         database control file.
// *Action: No action is required.
//
7507, 1, "cataloging files..."
// *Cause:  This is an informational message only.
// *Action: No action is required.
7508, 1, "cataloging done"
// *Cause:  This is an informational message only.
// *Action: No action is required.

7509, 1, "List of Cataloged Files"
// *Cause: This message is issued in response to a CATALOG command.
// *Action: No action is required.
7510, 1, "======================="
7511, 1, "File Name: %s"
7512, 2, "no files cataloged"

7513, 1, "List of Files Which Where Not Cataloged"
// *Cause: This message is issued in response to a CATALOG command.
// *Action: No action is required.
7514, 1, "======================================="
// *Cause:  This is an informational message only.
// *Action: No action is required.
7515, 1, "File Name: %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7516, 3, "Reason: Error reading"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7517, 3, "Reason: The file header is corrupted"
// *Cause: Either the file is not an Oracle file or the file header is
//         corrupted.
// *Action: Delete the file using OS utility.
7518, 3, "Reason: Foreign database file DBID: %s  Database Name: %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7519, 3, "Reason: Error while cataloging. See alert.log."
// *Cause:  This is an informational message only.
// *Action: No action is required.
7520, 3, "Reason: Data pump dump file"
// *Cause:  This is an informational message only.
// *Action: No action is required.
7521, 1, "cannot create recovery catalog in database version %s; version %s required"
// *Cause:  An attempt was made to use a version of the recovery catalog
//          schema that was incompatible with the version of the database.
// *Action: Upgrade the catalog database to at least the required version or
//          install the catalog schema in a different database which is of at
//          least the required version.
7522, 1, "CREATE TYPE privilege must be granted to user %s"
// *Cause:  The CREATE CATALOG or UPGRADE CATALOG command was used, but the
//          USERID that was supplied in the CATALOG connect string does not
//          have the CREATE TYPE privilege granted.
// *Action: Grant CREATE TYPE privilege to the recovery catalog owner.
7523, 1, "List of files in Recovery Area not managed by the database"
// *Cause: This message was issued in response to a CATALOG RECOVERY AREA
//         command.
// *Action: No action is required.
7524, 1, "=========================================================="
// *Cause:  This is an informational message only.
// *Action: No action is required.
7525, 3, "Reason: File is not a supported file type in Recovery Area"
// *Cause:  This message should be accompanied by other message(s)
//          indicating the name of file that was not supported in
//          recovery area. Any file other than current control file,
//          online log, archived log, RMAN backups and flashback log is
//          not supported in recovery area. This is an informational
//          message only.
// *Action: No action is required.
7526, 3, "Reason: File is not an Oracle Managed File"
// *Cause:  This message should be accompanied by other message(s)
//          indicating the name of file that was not a oracle managed file.
//          This is an informational message only.
// *Action: No action is required.
7527, 3, "Reason: File was not created using DB_RECOVERY_FILE_DEST initialization parameter"
// *Cause:  This message should be accompanied by other message(s)
//          indicating the name of file that was not created using
//          DB_RECOVERY_FILE_DEST initialization parameter.
//
//          One of the following scenarios caused this error:
//          1) This is an archived log file and was created when the
//          LOG_ARCHIVE_DEST_n initialization parameter was set
//          explicitly to recovery area location. For example,
//          LOG_ARCHIVE_DEST_1='location=+FRA' where '+FRA' was also 
//          your DB_RECOVERY_FILE_DEST value.
//          2) This is an RMAN backup file and was created in a
//          recovery area using the FORMAT option of the BACKUP command.
//          3) This is an online log file or current control file and was
//          created prior to setting the recovery area.
//          4) This file fits none of the above scenarios and is not
//          supported by the recovery area.
// *Action: All of following actions will resolve future occurrences of
//          this error:
//          1) To create archived logs in recovery area, set 
//          the LOG_ARCHIVE_DEST_n initialization parameter to
//          'location=USE_DB_RECOVERY_FILE_DEST'. Do not explicitly set the
//          LOG_ARCHIVE_DEST_n initialization parameter to a recovery area
//          location.
//          2) To create RMAN backups in recovery area, do not 
//          use the FORMAT option of the BACKUP command.
//          
//          All of following actions will resolve current problem:
//          1) If this is an archived log file or an RMAN backup file, use the
//          CATALOG command to re-catalog the files.
//          2) If this is an online log file or a current control file to be
//          managed by the recovery area, re-create the file using
//          the DB_RECOVERY_FILE_DEST initialization parameter.
7528, 1, "number of files not managed by recovery area is %s, totaling %s"
// *Cause:  This message should be accompanied by other message(s)
//          indicating the list of files. Either the files listed are
//          not known to the database or not managed by recovery area.
//          The number and size of the files are shown. This is an
//          informational message only.
// *Action: No action is required.
7529, 3, "Reason: catalog is not supported for this file type"
// *Cause: The CATALOG command encountered one or more files of types
//         that cannot be cataloged.  These file types include online
//         redo logs, flashback logs, block change tracking files,
//         and data pump files.  This message will be accompanied by
//         other messages indicating the names of the file's that could
//         not be cataloged.
// *Action: No action is required.
7530, 3, "Reason: This file type is not requested for cataloging"
// *Cause:  This is an informational message only.
// *Action: No action is required.
/
/ recover.bsq Errors: 8000-8999
/
8000, 1, "channel %s: copied datafile %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
8001, 1, "restore not complete"
// *Cause:  All of the backup pieces have been successfully applied, but
//          DBMS_BACKUP_RESTORE package indicates that the restore
//          conversation is not complete.  This usually means that the backup 
//          set contained corrupt data.
// *Action: Restore the files from a different backup set, if possible.  The
//          Recovery Manager CHANGE BACKUPPIECE UNAVAILABLE can be used to
//          prevent Recovery Manager from attempting to restore from the
//          corrupt backup piece(s).
8002, 1, "starting full resync of recovery catalog"
// *Cause: This is an informational message only.
// *Action: No action is required.
8003, 1, "channel %s: reading from backup piece %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8004, 1, "full resync complete"
// *Cause: This is an informational message only.
// *Action: No action is required.
8005, 1, "new incarnation of database registered in recovery catalog"
// *Cause: This is an informational message only.
// *Action: No action is required.
8006, 1, "database registered in recovery catalog"
// *Cause: This is an informational message only.
// *Action: No action is required.
8007, 1, "channel %s: copied datafile copy of datafile %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8008, 1, "channel %s: starting full datafile backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8009, 1, "channel %s: starting archived log backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8010, 1, "channel %s: specifying datafile(s) in backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8011, 1, "including current control file in backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8012, 1, "including control file copy in backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8013, 1, "channel %s: backup piece %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8014, 1, "channel %s: specifying archived log(s) in backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8015, 1, "datafile %s switched to datafile copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
8016, 1, "channel %s: starting datafile backup set restore"
// *Cause: This is an informational message only.
// *Action: No action is required.
8017, 1, "channel %s: starting archived log restore to default destination"
// *Cause: This is an informational message only.
// *Action: No action is required.
8018, 1, "channel %s: starting archived log restore to user-specified destination"
// *Cause: This is an informational message only.
// *Action: No action is required.
8019, 1, "channel %s: restoring datafile %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8020, 1, "including standby control file in backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8021, 1, "channel %s: restoring control file"
// *Cause: This is an informational message only.
// *Action: No action is required.
8022, 1, "channel %s: restoring archived log"
// *Cause: This is an informational message only.
// *Action: No action is required.
8023, 1, "channel %s: restored backup piece %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8025, 1, "channel %s: copied control file copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
8026, 1, "channel %s: copied archived log"
// *Cause: This is an informational message only.
// *Action: No action is required.
8027, 1, "channel %s: copied current control file"
// *Cause: This is an informational message only.
// *Action: No action is required.
8028, 1, "channel %s: copy current control file failed"
// *Cause: This is an informational message only.
// *Action: No action is required.
8029, 1, "snapshot control file name set to default value: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8030, 1, "allocated channel: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8031, 1, "released channel: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8032, 1, "channel %s: RECID %s STAMP %s does not match recovery catalog"
// *Cause:  The record that identifies the source file for a copy or backup
//          database does not contain the same data as is stored in the
//          recovery catalog.
// *Action: Perform a full resync and retry the operation.  If the problem
//          persists, then contact Oracle.
8033, 1, "channel %s: including datafile copy of datafile %s in backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8034, 1, "full resync skipped, target database not mounted"
// *Cause: This is an informational message only.
// *Action: No action is required.
8035, 1, "partial resync skipped, target database not mounted"
// *Cause: This is an informational message only.
// *Action: No action is required.
8036, 1, "channel %s: could not create control file record for %s %s"
// *Cause:  The record identifying the named file was no longer present in the
//          target database control file, and repeated attempts to inspect the
//          file were unsuccessful in creating the record.  This could be
//          because the circular-reuse section of the control file which
//          holds information about the specified type of file is too small
//          and there is other database activity which is causing the record
//          to be overwritten before it can be used.
// *Action: Try increasing either the size of the control file circular-reuse
//          section for this file type (datafile copy or archived log, as
//          indicated in the error message, or the
//          CONTROL_FILE_RECORD_KEEP_TIME initialization parameter.  If
//          neither of those remedies works then contact Oracle.
8037, 1, "channel %s: unexpected validation return code %s"
// *Cause:  This is an internal error that should never be issued.
// *Action: Contact Oracle Support.
8038, 1, "channel %s: starting piece %s at %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8039, 1, "channel %s: starting incremental datafile backup set restore"
// *Cause: This is an informational message only.
// *Action: No action is required.
8040, 1, "full resync skipped, control file is not current or backup"
// *Cause: This is an informational message only.
// *Action: No action is required.
8041, 1, "partial resync skipped, control file is not current or backup"
// *Cause: This is an informational message only.
// *Action: No action is required.
8042, 1, "channel %s: copied standby control file"
// *Cause: This is an informational message only.
// *Action: No action is required.
8043, 1, "channel %s: copy standby control file failed"
// *Cause: This is an informational message only.
// *Action: No action is required.
8044, 1, "channel %s: finished piece %s at %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8045, 1, "channel %s: finished piece %s at %s with %s copies"
// *Cause: This is an informational message only.
// *Action: No action is required.
8046, 1, "channel %s: starting compressed full datafile backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8047, 1, "channel %s: starting compressed incremental level %s datafile backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8048, 1, "channel %s: starting incremental level %s datafile backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8049, 1, "channel %s: starting compressed archived log backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8050, 1, "cataloged datafile copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
8051, 1, "cataloged archived log"
// *Cause: This is an informational message only.
// *Action: No action is required.
8052, 1, "cataloged control file copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
8053, 1, "channel %s: finished piece %s at %s with %s copies and tag %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8054, 1, "starting media recovery"
// *Cause: This is an informational message only.
// *Action: No action is required.
8056, 1, "skipping datafile %s because it has not changed"
// *Cause: The specified datafile has not had its checkpoint advanced since
//         the previous backup, therefore it does not need a new incremental
//         backup.
// *Action: This is an informational message only.
8057, 1, "channel %s: backup cancelled because all files were skipped"
// *Cause: All datafiles for this backup were skipped, therefore no backup
//         is created.
// *Action: This is an informational message only.
8058, 1, "replicating control file"
// *Cause: This is an informational message only.
// *Action: No action is required.
8059, 1, "media recovery failed"
// *Cause: This is an informational message only.
// *Action: No action is required.
8060, 1, "unable to find archived log"
// *Cause: This is an informational message only.
// *Action: No action is required.
8061, 3, "WARNING: change failure ID %s failed due to error ORA-%s"
// *Cause:  CHANGE FAILURE for the indicated failure ID encountered an
//          error.
// *Action: See the indicated ORA error message for the cause of the error.
8062, 3, "WARNING: cannot change priority of a critical failure %s"
// *Cause:  An attempt was made to change priority of a failure with
//          CRITICAL priority. 
// *Action: No action is required.
8066, 1, "database reset to incarnation %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8070, 1, "deleted datafile copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
8071, 1, "channel %s: deleting archived log(s)"
// *Cause: This is an informational message only.
// *Action: No action is required.
8072, 1, "deleted control file copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
8073, 1, "deleted backup piece"
// *Cause: This is an informational message only.
// *Action: No action is required.
8074, 1, "crosschecked backup piece: found to be '%s'"
// *Cause: This is an informational message only.
// *Action: No action is required.
8085, 1, "created script %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8086, 1, "replaced script %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8087, 1, "channel %s: started backup set validation"
// *Cause: This is an informational message only.
// *Action: No action is required.
8088, 1, "applied offline range to datafile %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8089, 1, "channel %s: specifying datafile(s) to restore from backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8090, 1, "channel %s: starting proxy restore"
// *Cause: This is an informational message only.
// *Action: No action is required.
8091, 1, "channel %s: specifying datafile(s) for proxy backup"
// *Cause: This is an informational message only.
// *Action: No action is required.
8092, 1, "channel %s: specifying datafile copy of datafile %s for proxy backup"
// *Cause: This is an informational message only.
// *Action: No action is required.
8093, 1, "specifying current control file for proxy backup"
// *Cause: This is an informational message only.
// *Action: No action is required.
8094, 1, "channel %s: specifying datafile(s) for proxy restore"
// *Cause: This is an informational message only.
// *Action: No action is required.
8096, 1, "channel %s: starting validation of datafile backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8097, 1, "channel %s: starting validation of archived log backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8099, 1, "specifying standby control file for proxy backup"
// *Cause: This is an informational message only.
// *Action: No action is required.
8100, 1, "channel %s: starting proxy validation"
// *Cause: This is an informational message only.
// *Action: No action is required.
8101, 1, "channel %s: proxy validation complete"
// *Cause: This is an informational message only.
// *Action: No action is required.
8102, 1, "channel %s: located backup piece: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8103, 1, "channel %s: could not locate backup piece: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8104, 1, "channel %s: input backup set: count=%s, stamp=%s, piece=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8105, 1, "channel %s: backup cancelled because no pieces were found"
// *Cause: All backup sets specified has no pieces. Therefore,
//         no backup set is created.
// *Action: This is an informational message only.
8106, 1, "channel %s: restoring block(s)"
// *Cause: This is an informational message only.
// *Action: No action is required.
8107, 1, "skipping inaccessible backup set count=%s STAMP=%s"
// *Cause:  The indicated backup set will not be backed up because
//          one or more pieces of the backup set could not be read,
//          and the SKIP INACCESSIBLE option was specified.
// *Action: No action is required.
8108, 1, "channel %s: specifying block(s) to restore from backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8109, 1, "channel %s: restored block(s) from backup piece %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8110, 1, "failover to next copy of backup piece"
// *Cause: This is an informational message only.
// *Action: No action is required.
8111, 1, "some blocks not recovered: See trace file for details"
// *Cause: Some blocks not recovered due to errors.
// *Action: See trace file for details of the problem.
8112, 1, "archived log failover was done on %s, check alert log for more info"
// *Cause: This is an informational message to indicate the server found a
//      corrupted block in an archived log and had to switch to another
//      copy of the same archived log in an alternate archived log 
//      destination to get corresponding un-corrupted block.
// *Action: If backup is done with delete input option, nothing needs to be
//      done. Otherwise delete the archived log that has corrupted block(s) as
//      recovery on applying this log would fail. Alert log contains
//      name of the log that has corrupted block(s).

/ RETENTION POLICY RELATED MESSAGES IN RECOVER.BSQ (8121-8120)
8113, 1, "including current SPFILE in backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8114, 1, "channel %s: restoring SPFILE to PFILE"
// *Cause: This is an informational message only.
// *Action: No action is required.
8115, 1, "channel %s: restoring SPFILE"
// *Cause: This is an informational message only.
// *Action: No action is required.
8116, 1, "output file name is original SPFILE location"
// *Cause: This is an informational message only.
// *Action: No action is required.
8117, 1, "channel %s: the AUTOBACKUP does not contain an SPFILE"
// *Cause:  The requested AUTOBACKUP does not contain a SPFILE. This is
//          because the instance was not started with a SPFILE when the 
//          AUTOBACKUP was created.
// *Action: No action is required. RMAN will try three older AUTOBACKUPS
//          before signaling ORA-19687.
8118, 3, "WARNING: could not delete the following archived redo log"
// *Cause: The routine deleteArchivedLog() could not delete
//      an archived redo log on the target instance.
// *Action: Check the accompanying file specification
//      and the associated error messages.
//      The file specification indicates what archived redo log
//      on the target instance RMAN was trying to delete
//      and the error messages indicate why RMAN was unable to delete it.
//      Resolve the problem by first confirming that
//      the archived redo log in question has been backed up,
//      do the deletion manually, and then do a crosscheck
//      so that RMAN is aware of the deletion.
8119, 1, "skipping backup piece handle %s; already exists"
// *Cause:  A BACKUP command does not need to backup control file AUTOBACKUP
//          pieces, because they already exists.
// *Action: This is an informational message, no action is required.
8120, 3, "WARNING: archived log not deleted, not yet applied by standby"
// *Cause: This is an informational message to alert the user that an
//         archived log that should have been deleted was not as it has not
//         been applied to the standby database.  The next message identifies
//         the archived log
// *Action: Archivelog can be deleted after it has been applied to
//          standby database.
/
/ RETENTION POLICY RELATED MESSAGES IN RECOVER.BSQ (8121-8120)
/ NOTE: see other retention policy related messages (6490 - 6520)
/
8121, 1, "keep attributes for the backup are deleted"
// *Cause: This is an informational message only.
// *Action: No action is required.
8122, 1, "keep attributes for the backup are changed"
// *Cause: This is an informational message only.
// *Action: No action is required.
8123, 1, "keep attributes for the datafile/control file copy are deleted"
// *Cause: This is an informational message only.
// *Action: No action is required.
8124, 1, "keep attributes for the datafile/control file copy are changed"
// *Cause: This is an informational message only.
// *Action: No action is required.
8125, 1, "keep attributes for the proxy copy are deleted"
// *Cause: This is an informational message only.
// *Action: No action is required.
8126, 1, "keep attributes for the proxy copy are changed"
// *Cause: This is an informational message only.
// *Action: No action is required.
8127, 1, "cataloged backup piece"
// *Cause: This is an informational message only.
// *Action: No action is required.
8128, 1, "uncataloged backup piece"
// *Cause: This is an informational message only.
// *Action: No action is required.
8129, 1, "failover to piece handle=%s tag=%s"
// *Cause: This is an informational message to indicate the server found a 
//         corrupted block in a piece and had to switch to another copy of
//         piece to get corresponding un-corrupted block.
// *Action: See alert log for information on corruption block(s) and the
//          name of the piece that has the corrupted block(s).
8130, 1, "failover to copy on device type %s"
// *Cause: This is an informational message to indicate the RMAN could not
//         successfully restore the database using the specified backups.
//         An attempt was made to restore the datafiles/archived logs/
//         control file/SPFILE using the same backup set on a different
//         device type.
// *Action: See accompanying additional error messages indicating the cause
//          of the failover.
8131, 1, "channel %s: specifying datafile copies to recover"
// *Cause: This is an informational message only.
// *Action: No action is required.
8132, 3, "WARNING: cannot update recovery area reclaimable file list"
// *Cause:  This error should be accompanied by other errors giving
//          the cause of failure to update reclaimable file list.
// *Action: Check the accompanying error.
8133, 1, "channel %s: the AUTOBACKUP does not contain a standby control file."
// *Cause:  The requested AUTOBACKUP did not contain a standby control file.
// *Action: No action is required, RMAN will try three older AUTOBACKUPS
//          before signaling ORA-19687.
8134, 1, "channel %s: trying older AUTOBACKUP..."
8135, 1, "some corrupt blocks found during conversion of file %s"
// *Cause: While converting the specified file from one platform to another,
//         some corrupt blocks were discovered in the specified file.
//         Details about the corruption have been written to a server trace
//         file.
// *Action: If these corrupt blocks are unexpected, you may be able to use
//          Block Media Recovery at the source database to fix the problem,
//          then re-convert the files.
8136, 1, "channel %s: deleting incremental backup(s)"
// *Cause: This is an informational message only.
// *Action: No Action Required.
8137, 3, "WARNING: archived log not deleted, needed for standby or upstream capture process"
// *Cause: An archived log that should have been deleted was not as it was
//         required by upstream capture process or Data Guard.
//         The next message identifies the archived log.
// *Action: This is an informational message. The archived log can be
//          deleted after it is no longer needed.  See the
//          documentation for Data Guard to alter the set of active
//          Data Guard destinations.  See the documentation for
//          Streams to alter the set of active streams.
8138, 3, "WARNING: archived log not deleted - must create more backups"
// *Cause: An archived log that should have been deleted was not as it 
//         it did not meet the user specified archive log deletion policy
//         of number of backups required before deleting the logs.
// *Action: This is an informational message. The archived log can be
//          deleted after more backups are created to satify archivelog
//          deletion policy.
8139, 3, "WARNING: archived redo log not deleted, needed for guaranteed restore point"
// *Cause: An archived log that should have been deleted was not because
//         it is required for guaranteed restore point.
// *Action: This is an informational message. The archived redo log can be
//          deleted after backups are created or after deleting the guaranteed
//          restore point that requires the log.
8140, 1, "channel %s: starting validation of datafile"
// *Cause: This is an informational message only.
// *Action: No action is required.
8141, 1, "channel %s: specifying datafile(s) for validation"
// *Cause: This is an informational message only.
// *Action: No action is required.
8142, 1, "including standby control file for validation"
// *Cause: This is an informational message only.
// *Action: No action is required.
8143, 1, "including current control file for validation"
// *Cause: This is an informational message only.
// *Action: No action is required.
8144, 1, "channel %s: validation complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8145, 1, "channel %s: starting validation of archived log"
// *Cause: This is an informational message only.
// *Action: No action is required.
8146, 1, "channel %s: specifying archived log(s) for validation"
// *Cause: This is an informational message only.
// *Action: No action is required.
8150, 1, "created global script %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8151, 1, "replaced global script %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8152, 1, "global script %s written to file %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8153, 1, "deleted global script: %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
8154, 1, "deleted script: %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.
8155, 1, "printing stored global script: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8156, 1, "printing stored script: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8157, 1, "script %s written to file %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8158, 1, "executing script: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8159, 1, "executing global script: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8160, 1, "script commands will be loaded from file %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8161, 1, "contents of Memory Script:"
// *Cause: This is an informational message only.
// *Action: No action is required.
8162, 1, "executing Memory Script"
// *Cause: This is an informational message only.
// *Action: No action is required.
8163, 1, "validation succeeded for backup piece"
// *Cause: The VALIDATE HEADER option determined that the backup piece still
//         matches its data.
// *Action: None - this is an informational message.
8164, 1, "validation succeeded for proxy copy"
// *Cause: The VALIDATE HEADER option determined that the proxy copy still
//         matches its data.
// *Action: None - this is an informational message.
8165, 1, "could not locate proxy copy %s"
// *Cause:  The specified proxy copy could not be found on proxy channel.
// *Action: If the proxy copy has been deleted, use the CROSSCHECK
//          BACKUP command to correct the recovery catalog or target database
//          control file entries.
8166, 1, "validation succeeded for datafile copy and control file copy"
// *Cause: The VALIDATE HEADER option discovered that the datafile copy and
//         control file copy still matches its data in the recovery catalog or
//         target database control file. 
// *Action: None - this is an informational message.
8180, 1, "channel %s: restore complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8181, 1, "media recovery complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8182, 1, "channel %s: validation complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8183, 1, "channel %s: block restore complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8184, 1, "added tempfile %s to tablespace %s in control file"
// *Cause: This is an informational message only.
// *Action: No action is required.
8185, 1, "renamed tempfile %s to %s in control file"
// *Cause: This is an informational message only.
// *Action: No action is required.
8186, 1, "tempfile %s size altered in control file"
// *Cause: One of tempfile size attributes AUTOEXTEND, MAXSIZE, NEXTSIZE
//         was altered. This is an informational message only.
// *Action: No action is required.
8187, 3, "WARNING: media recovery until SCN %s complete"
// *Cause: Media recovery was completed until the indicated
//         system change number (SCN) because the database was in
//         NOARCHIVELOG mode.
// *Action: This is an informational message only. No action is required.
8190, 1, "validate found one or more corrupt blocks"
// *Cause: Backup validate found that one or more blocks were corrupt in
//         the specified datafiles. This message should be followed by 8191
//         message.
// *Action: Repair them at your earliest convenience.
8191, 1, "See trace file %s for details"
// *Cause: This is an informational message only.
// *Action: No action is required.
/
/ Full resync messages, they need to be kept grouped and the sequence of
/ of the messages is important also, as they are accessed by relative
/ ofsets from the 'base message'
/
8200, 1, "tablespace changes, starting full resync of recovery catalog"
8201, 1, "1 tablespace"
8202, 1, "%d tablespaces"
8203, 1, "one or more tablespaces created and dropped between resync operations"
8205, 1, "datafile changes, starting full resync of recovery catalog"
8206, 1, "1 datafile"
8207, 1, "%d datafiles"
8208, 1, "one or more datafiles created and dropped between resync operations"
8210, 1, "tempfile changes, starting full resync of recovery catalog"
8211, 1, "1 tempfile"
8212, 1, "%d tempfiles"
8213, 1, "one or more tempfiles created and dropped between resync operations"
8215, 1, "redo thread changes, starting full resync of recovery catalog"
8216, 1, "1 redo thread"
8217, 1, "%d redo threads"
8218, 1, "one or more redo threads created and dropped between resync operations"
8220, 1, "online redo log changes, starting full resync of recovery catalog"
8221, 1, "1 online redo log"
8222, 1, "%d online redo logs"
8223, 1, "one or more online redo logs created and dropped between resync operations"
8224, 1, "reset database, starting full resync of recovery catalog"
8225, 1, "configuration changes, starting full resync of recovery catalog"
8226, 1, "open resetlogs, starting full resync of recovery catalog"
8227, 1, "new controlfile mounted, starting full resync of recovery catalog"
8228, 1, "new incarnation, starting full resync of recovery catalog"
8229, 1, "changes detected, starting full resync of recovery catalog"
8230, 1, "created"
8231, 1, "removed"
8232, 1, "changed"
8233, 1, "recreated"
8234, 1, "renamed"
8235, 1, "resized"
8236, 1, "   %s"
/
/
/ Transport DB: 8300 - 8350 
/
/ Messages from recover.txt
8300, 1, "Run SQL script %s on the target platform to create database"
// *Cause:  This is an informational message only.
// *Action: No action is required.
8301, 1, "Edit init.ora file %s. This PFILE will be used to create the database on the target platform"
// *Cause:  This is an informational message only.
// *Action: No action is required.
8302, 1, "Run RMAN script %s on target platform to convert datafiles"
// *Cause:  This is an informational message only.
// *Action: No action is required.
8303, 1, "To recompile all PL/SQL modules, run utlirp.sql and utlrp.sql on the target platform"
// *Cause:  This is an informational message only.
// *Action: Transport script invokes utlirp.sql and utlrp.sql.
8304, 1, "To change the internal database identifier, use DBNEWID Utility"
// *Cause:  This is an informational message only.
// *Action: Transport script does not invoke DBNEWID Utility automatically.
8305, 1, "channel %s: starting to check datafiles"
// *Cause:  This is an informational message only.
// *Action: No action is required.
8306, 1, "channel %s: datafile checking complete, elapsed time: %s"
// *Cause:  This is an informational message only.
// *Action: No action is required.

/
/ MASKable Information messages: 8500
/
8500, 1, "channel %s: SID=%s device type=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8501, 1, "output file name=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8503, 1, "piece handle=%s comment=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8504, 1, "input archived log thread=%s sequence=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8505, 1, "output file name=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8506, 1, "input file name=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8507, 1, "input datafile copy RECID=%s STAMP=%s file name=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8508, 1, "archived log destination=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8509, 1, "destination for restore of datafile %s: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8510, 1, "archived log thread=%s sequence=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8511, 1, "piece handle=%s tag=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8512, 1, "waiting for snapshot control file enqueue"
// *Cause: This is an informational message only.
// *Action: No action is required.
8513, 1, "datafile copy file name=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8514, 1, "archived log file name=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8515, 1, "archived log file name=%s thread=%s sequence=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8516, 1, "control file copy file name=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8517, 1, "backup piece handle=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8518, 1, "channel %s: scanning control file copy %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8519, 1, "channel %s: scanning datafile copy %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8520, 1, "channel %s: scanning archived log %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8521, 1, "offline range RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8522, 1, "input datafile file number=%s name=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8523, 1, "restoring datafile %s to %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8524, 1, "input control file copy name=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8525, 1, "backing up blocks %s through %s"
// *Cause: This is an informational message only
// *Action: No action is required.
8526, 1, "channel %s: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8527, 1, "channel %s: starting %s proxy datafile backup at %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8528, 1, "channel %s: proxy copy complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8529, 1, "proxy file handle=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8530, 1, "piece handle=%s tag=%s comment=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8531, 1, "channel %s: proxy copy %s is %s in media management catalog"
// *Cause: This is an informational message only.
// *Action: No action is required.
8532, 1, "channel %s: restoring block(s) from datafile copy %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8533, 1, "restoring blocks of datafile %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8534, 1, "channel %s: control file restore from AUTOBACKUP complete"
// *Cause: This is an informational message only.
// *Action: No action is required.
8535, 1, "channel %s: looking for AUTOBACKUP on day: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8536, 1, "channel %s: AUTOBACKUP found: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8537, 1, "channel %s: skipped, AUTOBACKUP already found"
// *Cause: This is an informational message only.
// *Action: No action is required.
8538, 1, "channel %s: no AUTOBACKUP in %s days found"
// *Cause: This is an informational message only.
// *Action: No action is required.
8539, 1, "backup set key=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8540, 1, "channel %s: backup set complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8541, 1, "channel %s: SPFILE restore from AUTOBACKUP complete"
// *Cause: This is an informational message only.
// *Action: No action is required.
8542, 1, "channel %s: starting proxy archived log backup at %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8543, 1, "channel %s: specifying archived log(s) for proxy backup"
// *Cause: This is an informational message only.
// *Action: No action is required.
8544, 1, "channel %s: specifying archived log(s) for proxy restore"
// *Cause: This is an informational message only.
// *Action: No action is required.
8545, 1, "flashback command failed: See trace file for details"
// *Cause: An attempt was made to issue a flashback command which failed
//         due to errors. See trace file for details.
// *Action: See trace file for details of the problem.
8546, 1, "channel %s: AUTOBACKUP %s found in the recovery area"
// *Cause: This is an informational message only.
// *Action: No action is required.
8547, 2, "channel %s: no AUTOBACKUPS found in the recovery area" 
// *Cause: The recovery area does not have desired AUTOBACKUP.
// *Action: Check the option UNTIL TIME in case an existing AUTOBACKUP does
//          satisfy the criteria specified in the restore command.
//          Otherwise, verify the init.ora parameters DB_RECOVERY_FILE_DEST
//          and DB_UNIQUE_NAME to verify whether the recovery area location
//          is set correctly. Note that the parameters can be specified as
//          options to the restore command.
8548, 1, "recovery area destination: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8549, 1, "database name (or database unique name) used for search: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8550, 1, "AUTOBACKUP search with format \"%s\" not attempted because DBID was not set"
// *Cause: Restore of a control file AUTOBACKUP was attempted without DBID
//         being set.
// *Action: If you want to search for AUTOBACKUP with the indicated format,
//          then specify the DBID of the database using SET DBID and retry
//          the command.
8551, 1, "recovering datafile copy file number=%s name=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8552, 1, "backup and output file names are identical: %s"
// *Cause:  The backup file name chosen was identical to output file name
//          specified for a restore operation.
// *Action: This is an informational message only. RMAN will failover to
//          next available backup.
8553, 1, "channel %s: restoring control file from AUTOBACKUP %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8554, 1, "channel %s: restoring spfile from AUTOBACKUP %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8555, 1, "channel %s: restoring section %s of %s"
// *Cause: This is an informational message only
// *Action: No action is required.
8556, 1, "channel %s: backup piece complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8580, 1, "channel %s: starting datafile copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
8581, 1, "channel %s: datafile copy complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8582, 1, "channel %s: starting archived log copy"
// *Cause: This is an informational message only.
// *Action: No action is required.
8583, 1, "channel %s: archived log copy complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8584, 1, "copying current control file"
// *Cause: This is an informational message only.
// *Action: No action is required.
8585, 1, "copying standby control file"
// *Cause: This is an informational message only.
// *Action: No action is required.
8586, 1, "output file name=%s tag=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8587, 1, "input is copy of datafile %s: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8588, 1, "converted datafile=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8589, 1, "channel %s: starting datafile conversion"
// *Cause: This is an informational message only.
// *Action: No action is required.
8590, 1, "channel %s: datafile conversion complete, elapsed time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8591, 3, "WARNING: invalid archived log deletion policy"
// *Cause: An invalid ARCHIVELOG DELETION POLICY was supplied. The archived
//         log deletion policy was APPLIED but there was no mandatory
//         archived log destinations.
// *Action: One of the following:
//          1) Change archived log deletion policy using CONFIGURE command
//          2) Make one or more of standby destination as MANDATORY.
8592, 1, "output file name=%s tag=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8599, 1, "channel %s: throttle time: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8600, 1, "ASM disk group to search: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8601, 1, "channel %s: AUTOBACKUP %s found in ASM disk group %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8602, 2, "channel %s: no AUTOBACKUPS found in ASM disk group %s" 
// *Cause: The specified ASM area does not have desired AUTOBACKUP.
// *Action: Check the option UNTIL TIME in case an existing AUTOBACKUP does
//          satisfy the criteria specified in the restore command.
//          Otherwise, verify the values used for the format of the 
//          CONFIGURE CONTROLFILE AUTOBACKUP FORMAT command
//          and DB_UNIQUE_NAME to verify whether the ASM area location is
//          set correctly. Note that the DB_UNIQUE_NAME can be specified as
//          option to the restore command.
8603, 1, "skipping %s; file in use by another process"
// *Cause:  The indicated file was not included in the backup
//          because it is part of another restore or delete operation.
// *Action: No action is required. Wait for the other operation to
//          complete, then retry.
8604, 1, "skipping %s; file deleted from recovery area to reclaim disk space"
// *Cause:  The indicated file was not included in the backup because
//          it was deleted from the recovery area to reclaim
//          disk space for other operations.
// *Action: No action is required.
8605, 1, "channel %s: SID=%s instance=%s device type=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8606, 3, "WARNING: The change tracking file is invalid."
// *Cause: Backup found changed blocks that were not marked in the change
//         tracking file. See alert log for more information. 
// *Action: Do not use any of the incremental backups taken since the
//          last full backup. 
8607, 1, "List of remote backup files"
// *Cause:  RESTORE command detected that one or more remote backup files
//          were required to perform restore operation.
// *Action: Recall the media from remote site that contains the specified 
//          backup files before actual restore operation. The message should
//          be accompanied with the list of remote backup files.
8608, 1, "Initiated recall for the following list of remote backup files"
// *Cause:  This is an informational message displayed when the specified
//          RECALL option of the RESTORE command detected that one or more 
//          remote backup files were required to perform the restore
//          operation.  The message indicated that RMAN had initiated 
//          the request on SBT channel to recall the remote backup files.
// *Action: No action required.
8609, 1, "channel %s: starting incremental datafile backup set"
// *Cause: This is an informational message only.
// *Action: No action is required.
8610, 1, "channel %s: restoring datafile %s to %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8611, 1, "channel %s: piece handle=%s tag=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8612, 1, "channel %s: failover to duplicate backup on device %s"
// *Cause: This is an informational message to indicate the RMAN could not
//         successfully restore the files using the specified backups.
//         An attempt was made to restore the datafiles/archived logs/
//         control file/SPFILE using a previous existing backup.
// *Action: See accompanying additional error messages indicating the cause
//          of the failover.
8613, 1, "channel %s: failover to piece handle=%s tag=%s"
// *Cause: This is an informational message to indicate the server found a
//         corrupted block in a backup piece and had to switch to 
//         another copy of the piece to get the same block.
// *Action: See alert log for information on corruption block(s) and the
//          name of the backup piece that has the corrupted block(s).
8614, 1, "channel %s: errors found reading piece handle=%s"
// *Cause: This is an informational message to indicate the server found a
//         corrupted block in a backup piece.  Accompanying error will 
//         describe the action taken.
// *Action: See alert log for more information.
8615, 1, "channel %s"
// *Cause: This is an informational message to indicate the server could not
//         perform the restore due to the included errors. A least recent
//         backup set will be used to perform the restore.
// *Action: See alert log for information on corruption block(s) and the
//          name of the backup piece that has the corrupted block(s).
8616, 1, "validating blocks %s through %s"
// *Cause: This is an informational message only
// *Action: No action is required.
8617, 1, "validation failed for foreign archived log"
// *Cause: The CROSSCHECK FOREIGN ARCHIVELOG command determined that the
//         foreign archived log could not be found or no longer contained the
//         same data, so its record was marked expired.
// *Action: None - this is an informational message.
8618, 1, "validation succeeded for foreign archived log"
// *Cause: The CROSSCHECK FOREIGN ARCHIVELOG command determined that the
//         foreign archived log still matches its data.
// *Action: None - this is an informational message.
8619, 1, "foreign archived log file name=%s RECID=%s STAMP=%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
8620, 1, "uncataloged foreign archived log"
// *Cause: This is an informational message only.
// *Action: No action is required.
8621, 1, "deleted foreign archived log"
// *Cause: This is an informational message only.
// *Action: No action is required.
/
/
/ KRMX Errors: 10000-10999
/
10000, 1, "error parsing target database connect string \"%s\""
// *Cause:  An invalid target connect string was supplied.
// *Action: Specify a valid connect string and re-run the job.
10001, 1, "error parsing recovery catalog connect string \"%s\""
// *Cause:  An invalid recovery catalog connect string was supplied.
// *Action: Specify a valid connect string and re-run the job.
10002, 1, "ORACLE error: %s"
// *Cause: The specified Oracle error was received.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
10003, 1, "unable to connect to target database"
// *Cause:  Recovery manager was unable to connect to the target database.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Ensure that that the target database is started, and that the
//          connect string is valid.
10004, 1, "unable to connect to recovery catalog"
// *Cause: Recovery manager was unable to connect to the recovery catalog
// *Action:  Ensure that that the recovery catalog is started, and that the
//           connect string is valid.
//           This message should be accompanied by other error message(s)
//           indicating the cause of the error.
10005, 1, "error opening cursor"
// *Cause:  An error was received while trying to open a cursor.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: If the associated Oracle error message indicates a condition that
//          can be corrected, do so, otherwise contact Oracle.
10006, 1, "error running SQL statement: %s"
// *Cause:  An error message was received while running the SQL statement
//          shown.
// *Action: If the associated Oracle error message indicates a condition that
//          can be corrected, do so, otherwise contact Oracle.
10007, 1, "error closing cursor"
// *Cause:  An error was received while trying to close a cursor.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: If the associated Oracle error message indicates a condition that
//          can be corrected, do so, otherwise contact Oracle.
10008, 1, "could not create channel context"
// *Cause:  An error was received while trying create a channel context.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: If the associated Oracle error message indicates a condition that
//          can be corrected, do so, otherwise contact Oracle.
10009, 1, "error logging off of Oracle"
// *Cause:  An error was received while disconnecting from Oracle.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: This is an informational message only.
10010, 1, "error while checking for RPC completion"
// *Cause:  Recovery Manager's channel context had an error while checking to
//          see if a remote procedure call had completed.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: If other error messages indicate a condition that can be
//          corrected, do so, otherwise contact Oracle.
10011, 1, "synchronization error while polling for rpc %d, action=%s"
// *Cause:  Recovery Manager could not synchronize properly with a remote
//          procedure call.
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10012, 1, "KGU error: %s"
// *Cause:  An error occurred while initializing the KGU subsystem
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10013, 1, "error initializing PL/SQL"
// *Cause:  An error occurred while initializing the PL/SQL subsystem.
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10014, 1, "PL/SQL error %d on line %d column %d: %s"
// *Cause:  PL/SQL error
// *Action: The text of this message will be issued by the PL/SQL subsystem.
//          See the PL/SQL error message manual.
10015, 1, "error compiling PL/SQL program"
// *Cause:  An error occurred while compiling a PL/SQL program.
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10016, 1, "error creating PL/SQL runtime context"
// *Cause:
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10018, 1, "error cleaning up channel context"
// *Cause:  An error was received during inter-step cleanup of a channel
//          context.
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10020, 1,  "error initializing Recovery Manager execution layer"
// *Cause:  An error was received while initializing the Recovery Manager
//          execution layer in preparation for running a job.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: If other error messages indicate a condition that can be
//          corrected, do so, otherwise contact Oracle.
10022, 1, "error in system-dependent sleep routine"
// *Cause:  An error was received while waiting for a remote RPC to complete.
//          The error occurred in the system-dependent sleep routine.
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10023, 1, "RPC attempted to unrecognized package"
// *Cause:  The Recovery Manager internal RPC router received a package name
//          that it could not understand.
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10024, 1, "error setting up for rpc polling"
// *Cause:  The Recovery Manager could not create the RPC polling context
//          which is required to test for RPC completion.
//          This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: If other error messages indicate a condition that can be
//          corrected, do so, otherwise contact Oracle.
10025, 1, "connection is already registered for events"
// *Cause:  The Recovery Manager could not enable the target database
//          connection to test for RPC completion.
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10026, 1, "network error %d-%d occurred registering connection"
// *Cause:  An network error occurred while attempting to register the target
//          database connection to test for RPC completion.
// *Action: This is an internal error that should not be issued.
//          The message numbers are issued by the Sql*Net layer.
//          Contact Oracle Support.
10027, 1, "could not locate network layer context"
// *Cause:  Recovery Manager could not locate a necessary context area while
//          attempting to register the target database connection to test for
//          RPC completion.
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10028, 1, "network error %d-%d occurred during remote RPC"
// *Cause:  An network error occurred while waiting for a remote RPC to
//          complete.
// *Action: This is an internal error that should not be issued.
//          The message numbers are issued by the Sql*Net layer.
//          Contact Oracle Support.
10029, 1, "unexpected return code %d from PL/SQL execution"
// *Cause:  PL/SQL returned an unexpected return code while executing one
//          channel program.
// *Action: This is an internal error that should not be issued.
//          Contact Oracle Support.
10030, 1, "RPC call appears to have failed to start on channel %s"
// *Cause:  An RPC to a target database instance was issued, but was not
//          observed to start within 5 timeouts.
// *Action: This error is probably accompanied by other error messages
//          giving the precise cause of the failure.
10031, 1, "RPC Error: ORA-%05d  occurred during call to %s.%s"
// *Cause:  An RPC to the target database or recovery catalog database
//          encountered an error.
// *Action: This error is accompanied with the error message from the
//          server where the error occurred.
10032, 1, "unhandled exception during execution of job step %d: \n%s"
// *Cause:  An unhandled PL/SQL exception occurred during a job step.
// *Action: This error is accompanied by the error messages describing
//          the exception.
10033, 1, "error during compilation of job step %d: %s"
// *Cause:  PL/SQL detected a problem during the compilation of a job step
// *Action: This error message is accompanied by the error messages describing
10034, 1, "unhandled exception during execution of job step %d, error unknown"
// *Cause:  PL/SQL detected an unhandled exception during execution of a job
//          step, but no further information available
// *Action:
10035, 1, "exception raised in RPC: \n%s"
// *Cause:  A call to a remote package resulted in an exception.
// *Action: The exception should indicate what went wrong.
10036, 1, "RPC call OK on channel %s"
// *Cause:  This is just an informational message.  It should be preceded
//          by message 10030.
// *Action: No action is required.
10037, 1, "RPC anomaly detected on channel %s, UPINBLT=%d"
// *Cause:  This is an debugging message and can be ignored.
// *Action: No action is required.
10038, 1, "database session for channel %s terminated unexpectedly"
// *Cause:  The database connection for the specified channel no longer 
//          exists.
//          Either the session was terminated by some external means or
//          the channel terminated because of an internal error.
// *Action: Check for an oracle trace file for detailed information on why
//          the session terminated.
10039, 1, "error encountered while polling for RPC completion on channel %s"
// *Cause:  This error should be accompanied by other errors giving
//          the cause of the polling error.
// *Action: Check the accompanying errors.
10040, 1, "asynchronous support not detected, RMAN will run synchronously"
// *Cause:  The database connection does not support asynchronous operation,
//          so RMAN will not multi-task work among multiple channels.
//          Multiple channels can still be allocated, but they will not 
//          run work concurrently.
// *Action: Use a connection type that supports asynchronous operations.
10041, 1, "Could not re-create polling channel context following failure. "
// *Cause:  The RPC polling context, which is required to test for RPC 
//          completion, failed and Recovery Manager could not re-create this
//	    channel.
//          This message should be accompanied by other error messages
//          indicating the cause of the error.
// *Action: If other error messages indicate a condition that can be
//          corrected, do so, otherwise contact Oracle.
/
/ 11000-11999: KRMZ
/
11000, 1, "message number %d not found in recovery manager message file"
// *Cause:  Recovery manager message file is out of date.
// *Action: Make sure that the recovery manager error message file is current
//          and installed in the correct location.
11001, 1, "Oracle Error: \n%s"
// *Cause: This is an informational message only.
// *Action: No action is required.
11002, 1, "could not open a cursor to the target database"
// *Cause: This is an informational message only.
// *Action: No action is required.
11003, 1, "failure during parse/execution of SQL statement: %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
11004, 1, "format requires %%c when duplexing"
// *Cause:  SET_DUPLEX=ON was specified, but %c was not part of the format.
// *Action: Include %c in format, or use %U.
11005, 1, "conflicting media information for piece \"%s\""
// *Cause:  While restoring the specified backup piece, RMAN received
//          conflicting information about the physical location of the piece
//          from the Media Management software.  This can cause poor restore
//          performance.
// *Action: If RMAN does not parallelize the restore from all of the
//          available channels, then you should contact the Media Management
//          vendor.
11006, 3, "WARNING: test recovery results: \n%s"
// *Cause: User called recover database with the test option
// *Action: None required
/
/ KRMQ Errors: 12000-12999
/
12000, 1, "execution layer initialization failed"
// *Cause: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
// *Action: Check the accompanying errors.
12001, 1, "could not open channel %s"
// *Cause:  An ALLOCATE CHANNEL command could not be processed.
// *Action: This message should be accompanied by other error message(s)
//          indicating the cause of the error.
12005, 1, "error during channel cleanup"
// *Cause: This message should be accompanied by other error message(s)
//         indicating the cause of the error.
// *Action: Check the accompanying errors.
12007, 1, "cannot allocate more than %d channels"
// *Cause:  The maximum number of RMAN channels has been exceeded.  Note that
//          one channel is reserved for RMAN.
// *Action: Allocate fewer channels.  Contact Oracle if you have a need for
//          more channels in a single job.
12008, 1, "could not locate backup piece %s"
// *Cause:  There was at least 1 backup set that could not be accessed by
//          any of the allocated channels.
// *Action: Allocate additional channels on other nodes of the cluster
12009, 1, "command aborted because some backup pieces could not be located"
// *Cause:  Same as 7008.
// *Action: Refer to 7008.
12010, 1, "automatic channel allocation initialization failed"
// *Cause: This message should be accompanied by other error message(s)
//         indicating the cause of the error.
// *Action: Check the accompanying errors.
12011, 1, "multiple records for default device type found in repository"
// *Cause: Configuration for default device type was not consistent.
// *Action: Re-run CONFIGURE DEFAULT DEVICE TYPE command to set device type.
12012, 1, "multiple records for %s parallelism found in repository"
// *Cause: Configuration for device parallelism was not consistent.
// *Action: Re-run CONFIGURE PARALLELISM command for device to set 
//          parallelism.
12013, 1, "multiple records for %s channel %d found in repository"
// *Cause: Configuration for the channel was not consistent.
// *Action: Re-run CONFIGURE CHANNEL command to configure this channel.
12014, 1, "multiple records for default channel configuration for %s found in repository"
// *Cause: Configuration for the channel was not consistent.
// *Action: Re-run CONFIGURE CHANNEL command to configure the channel.
12015, 1, "configuration for %s channel %d is ignored"
// *Cause: This is an informational message only.
//         Parallelism for the device is less than associated channel number.
// *Action: To use this configuration increase parallelism for this device.
//          To clear this configuration use CONFIGURE CHANNEL... CLEAR 
//          command.
12016, 1, "using channel %s"
// *Cause: This is an informational message only.
// *Action: No action is required.
12017, 1, "could not locate pieces of backup set key %s"
// *Cause:  Copies of the specified backup set key could not be accessed on
//          any of the allocated channels.
// *Action: Allocate additional channels on other nodes of the cluster or,
//          if the backup pieces has been deleted, use the CROSSCHECK BACKUP
//          command to correct the recovery catalog or target database control
//          file entries.
12018, 1, "channel %s disabled, job failed on it will be run on another channel"
// *Cause:  This is an informational message displayed whenever a retryable
//          error occurs for the job and there are channels available to run
//          this step.
// *Action: No action is required.
12019, 1, "continuing other job steps, job failed will not be re-run"
// *Cause:  This is an informational message displayed whenever there is a
//          non-retryable error occurred for the job.
// *Action: No action is required.
12020, 1, "error on step filtered for normal output \n%s"
// *Cause:  This message is added when stacking errors for failed jobs after
//          channel failover was performed. It will be filtered from normal
//          output.
// *Action: No action is required.
/
/ 20000-20999: DBMS_RCVCAT and DBMS_RCVMAN
/
20000, 1, "abnormal termination of job step"
// *Cause:  A job step encountered an error and could not recover.
//          This error should be followed by other errors indicating
//          the cause of the problem.
//
// *Action: Check the accompanying error.
20001, 1, "target database not found in recovery catalog"
// *Cause: target database is not found in the recovery catalog
// *Action: make sure that the target database is registered in the recovery
//         recovery catalog
//
20002, 1, "target database already registered in recovery catalog"
// *Cause: target database is already registered in the recovery catalog
// *Action: if the target database is really registered, there is no need to
//         register it again. Note that the recovery catalog enforces that
//         all databases have a unique DBID. If the new database was created
//         by copying files from an existing database, it will have the
//         same DBID as the original database and cannot be registered in
//         the same recovery catalog.
//
20003, 1, "target database incarnation not found in recovery catalog"
// *Cause: RESETLOGS CHANGE# and/or time of the target database doesn't match
//         any database incarnation in the recovery catalog.
// *Action: if target database was opened with RESETLOGS option then use
//         'reset database' to register the new incarnation.
//
20004, 1, "target database name does not match name in recovery catalog"
// *Cause: name of the target database doesn't match the one stored in
//        the recovery catalog
// *Action: This is an internal error.
//
20005, 1, "target database name is ambiguous"
// *Cause: two or more databases in the recovery catalog match this name
// *Action:
//
20006, 1, "target database name is missing"
// *Cause: target database instance is not started or
//        db_name initialization parameter is not set
// *Action: startup the instance and make sure that db_name parameter is set
//
20007, 1, "target database id is missing"
// *Cause:
// *Action: This an internal error.
//
20008, 1, "incarnation key must be specified in NOCATALOG mode"
// *Cause:
// *Action: specify a valid database incarnation key
//
20009, 1, "database incarnation already registered"
// *Cause: this incarnation is already registered in the recovery catalog
// *Action: No action is required.
//
20010, 1, "database incarnation not found"
// *Cause: database incarnation does not match any database incarnation in
//         the recovery catalog
// *Action: specify a valid database incarnation key
//
20011, 1, "target database incarnation is not current in recovery catalog"
// *Cause: the database incarnation that matches the RESETLOGS CHANGE# and
//         time of the mounted target database control file is not the 
//         current incarnation of the database
// *Action: If 'reset database to incarnation <key>' was used to make an
//          old incarnation current then restore the target database
//          from a backup that matches the incarnation and mount it.
//          You will need to do 'STARTUP NOMOUNT' before you can restore
//          the control file using RMAN.
//          Otherwise use 'reset database to incarnation <key>' make the
//          intended incarnation current in the recovery catalog.
20012, 1, "not authorized to register new database"
// *Cause: You attempted to register a new database with this recovery catalog,
//         but you are using a virtual private catalog, and you have not been
//         granted permission by the catalog administrator to register
//         this database with this recovery catalog
// *Action: Ask the catalog administrator to grant permission for you to
//          register this database.
20013, 1, "error upgrading virtual private catalog"
// *Cause: An error occurred while automatically upgrading a virtual private
//         catalog.
// *Action: Ensure that the virtual private catalog userid has all of the
//          required privileges, such as being granted the
//          RECOVERY_CATALOG_OWNER role.
20014, 1, "virtual private catalog owner must be granted RECOVERY_CATALOG_OWNER role"
// *Cause: An attempt was made to establish a virtual private RMAN catalog in
//         a schema that is not granted the RECOVERY_CATALOG_OWNER role.
// *Action: Grant RECOVERY_CATALOG_OWNER to the virtual private catalog owner.
20015, 1, "not authorized to share this catalog"
// *Cause: You attempted to share a recovery catalog but were not authorized
//         to do this by the catalog administrator.
// *Action: Ask the catalog administrator to grant permission for you to
//          share this catalog.
20016, 1, "virtual private catalog user cannot modify global scripts"
// *Cause: A virtual private catalog user attempted to create, delete,
//         or modify a global script.  Virtual private catalog users cannot
//         modify global scripts.
// *Action: Connect to the catalog owner userid and retry the global script
//          operation.
20017, 1, "illegal script update operation"
// *Cause: An illegal script operation was performed.
// *Action: None
20018, 1, "database not found in recovery catalog"
// *Cause: An attempt was made to grant or revoke catalog access to a
//         database whose name was not registered in the recovery catalog.
// *Action: Correct the database name and re-issue the GRANT or REVOKE command.
//          If this is an attempt to grant or revoke access to a database that
//          is not yet registered, then re-issue the command using the
//          database ID of the desired database.
20019, 1, "database name not unique in recovery catalog"
// *Cause: An attempt was made to grant or revoke catalog access to a database
//         whose name is not unique in the recovery catalog.
// *Action: Re-issue the command specifying the database ID of the desired
//          database.
20020, 1, "database incarnation not set"
// *Cause:
// *Action: This is an internal error.
//
20021, 1, "database not set"
// *Cause:
// *Action: This is an internal error.
20029, 1, "cannot make a snapshot control file"
// *Cause: another operation that needs the snapshot control file is in
//         progress
// *Action: try again later if necessary
//
20030, 1, "resync in progress"
// *Cause: this procedure cannot be called while a resync is in progress
// *Action: This is an internal error.
//
20031, 1, "resync not started"
// *Cause: this procedure can only be called in a resync
// *Action: This is an internal error.
//
20032, 1, "checkpoint CHANGE# too low"
// *Cause: the checkpoint change# is less than the one of the previous
//         resync or the checkpoint change# is null
// *Action: make sure that the right control file is used
//
20033, 1, "control file SEQUENCE# too low"
// *Cause: the control file sequence is less than the one of the previous
//         resync
// *Action: make sure that the right control file is used
//
20034, 1, "resync not needed"
// *Cause: the control file has not changed since the previous resync
// *Action: nothing since the recovery catalog is in sync
//
20035, 1, "invalid high RECID"
// *Cause:
// *Action: This is an internal error.
//
20036, 1, "invalid record order"
// *Cause:
// *Action: This is an internal error.
//
20037, 1, "invalid last RECID"
// *Cause:
// *Action: This is an internal error.
//
20038, 1, "must specify FORMAT for CONVERT command"
// *Cause: No FORMAT was specified when using CONVERT command.
// *Action: Resubmit the command using FORMAT clause.
20039, 1, "format requires %c when duplexing"
// *Cause:  SET_DUPLEX=ON was specified, but %c was not part of the format.
// *Action: Include %c in format, or use %U.
20040, 1, "tablespace resync not started"
// *Cause:
// *Action: This is an internal error.
//
20041, 1, "tablespace resync not completed"
// *Cause:
// *Action: This is an internal error.
//
20042, 1, "invalid tablespace creation change#"
// *Cause:
// *Action: This is an internal error.
//
20043, 1, "invalid tablespace create time"
// *Cause:
// *Action: This is an internal error.
//
20044, 1, "invalid tablespace name"
// *Cause:
// *Action: This is an internal error.
//
20045, 1, "must specify FORMAT for BACKUP INCREMENTAL FROM SCN command"
// *Cause: No FORMAT was specified when using BACKUP INCREMENTAL FROM SCN 
//         command.
// *Action: Resubmit the command using FORMAT clause.
20050, 1, "datafile resync not started"
// *Cause:
// *Action: This is an internal error.
//
20051, 1, "datafile resync not completed"
// *Cause:
// *Action: This is an internal error.
//
20052, 1, "invalid datafile create SCN"
// *Cause:
// *Action: This is an internal error.
//
20053, 1, "invalid datafile create time"
// *Cause:
// *Action: This is an internal error.
//
20054, 1, "invalid datafile TS#"
// *Cause:
// *Action: This is an internal error.
//
20055, 1, "invalid datafile plugin SCN"
// *Cause:
// *Action: This is an internal error.
//   
20061, 1, "thread resync not started"
// *Cause:
// *Action: This is an internal error.
//
20070, 1, "invalid log history SEQUENCE#"
// *Cause:
// *Action: This is an internal error.
//
20071, 1, "invalid log history low SCN"
// *Cause:
// *Action: This is an internal error.
//
20079, 1, "full resync from primary database is not done"
// *Cause:  Resync from standby detected that a full resync from primary
//          database is required. One of the following events on primary
//          database may have caused this error:
//             1) one or more tablespaces or datafiles were added
//             2) one or more tablespaces or datafiles were dropped
//             3) one or more datafiles status changed
// *Action: Perform full resync after connecting to primary database.
20080, 1, "invalid archived log name"
// *Cause:
// *Action: This is an internal error.
//
20081, 1, "change stamp for the record"
// *Cause:  A record with same recid and stamp is already known to catalog.
// *Action: None. This error is automatically handled by RMAN client by
//          changing the stamp in control file during resync.
20082, 1, "translation site key not found"
// *Cause:
// *Action: This is an internal error.
//
20083, 1, "unknown unique index in OFFR"
// *Cause:
// *Action: This is an internal error.
//
20084, 1, "invalid offline CF_CREATE_TIME"
// *Cause:
// *Action: This is an internal error.
//
20085, 1, "invalid offline range FILE#"
// *Cause:
// *Action: This is an internal error.
//
20086, 1, "invalid offline range OFFLINE_SCN"
// *Cause:
// *Action: This is an internal error.
//
20087, 1, "invalid offline range ONLINE_SCN"
// *Cause:
// *Action: This is an internal error.
//
20088, 1, "invalid offline range CREATION_SCN"
// *Cause:
// *Action: This is an internal error.
//
20089, 1, "invalid offline range ONLINE_TIME"
// *Cause:
// *Action: This is an internal error.
//
20090, 1, "invalid backup set type"
// *Cause:
// *Action: This is an internal error.
//
20091, 1, "invalid backup set level"
// *Cause:
// *Action: This is an internal error.
//
20092, 1, "invalid backup set completion time"
// *Cause:
// *Action: This is an internal error.
//
20093, 1, "invalid backup piece number"
// *Cause:
// *Action: This is an internal error.
//
20094, 1, "missing backup set"
// *Cause:
// *Action: This is an internal error.
//
20095, 1, "invalid backup/copy control file checkpoint SCN"
// *Cause:
// *Action: This is an internal error.
//
20096, 1, "invalid backup/copy datafile FILE#"
// *Cause:
// *Action: This is an internal error.
//
20097, 1, "invalid backup/copy datafile create SCN"
// *Cause:
// *Action: This is an internal error.
//
20098, 1, "invalid backup redo log low SCN"
// *Cause:
// *Action: This is an internal error.
//
20100, 1, "invalid status"
// *Cause:
// *Action: This is an internal error.
//
20101, 1, "datafile copy missing"
// *Cause:
// *Action: This is an internal error.
//
20102, 1, "archived log missing"
// *Cause:
// *Action: This is an internal error.
//
20103, 1, "control file copy missing"
// *Cause:
// *Action: This is an internal error.
//
20104, 1, "backup piece missing"
// *Cause:
// *Action: This is an internal error.
//
20105, 1, "datafile missing"
// *Cause:
// *Action: This is an internal error.
//
20106, 1, "proxy copy missing"
// *Cause:
// *Action: This is an internal error.
//
20107, 1, "invalid backup set key counter"
// *Cause:
// *Action: This is an internal error.
//
20108, 1, "control file for remote database cannot be updated"
// *Cause:  RESYNC CATALOG FROM DB_UNIQUE_NAME command was attempted, but
//          the control file at the database with DB_UNIQUE_NAME needs 
//          to be resynced directly instead of through the current target.
// *Action: Directly connect as target to the remote database with the specified 
//          DB_UNIQUE_NAME and resync.
20109, 1, "remote database has different database ID"
// *Cause:  Command RESYNC CATALOG FROM DB_UNIQUE_NAME was executed and the
//          database ID of the remote database was different than the connected
//          target database.
// *Action: The remote database should have the same database ID as the database
//          connected as the target database. Fix the connect identifier for the
//          remote database and retry the command.
20200, 1, "invalid restore source"
// *Cause:
// *Action: This is an internal error.
//
20201, 1, "datafile not found in the recovery catalog"
// *Cause:  The specified datafile is not found in the recovery catalog
// *Action: make sure that the datafile name is correct and
//         that the recovery catalog is up-to-date
//
20202, 1, "Tablespace not found in the recovery catalog"
// *Cause:  the specified tablespace is not found in the recovery catalog
// *Action: make sure that the tablespace name is correct and
//         that the recovery catalog is up-to-date
//
20203, 1, "translation in progress"
// *Cause: this procedure can not be called when name translation is in
//         progress
// *Action: This is an internal error.
//
20204, 1, "translation not started"
// *Cause: GETDATAFILE procedure was called before TRANSLATETABLESPACE
// *Action: This is an internal error.
//
20205, 1, "incomplete UNTIL clause"
// *Cause: The sequence# was NULL
// *Action: This is an internal error.
//
20206, 1, "log sequence not found in the repository"
// *Cause: The specified log sequence does not exists in log history
//        of the current database incarnation
// *Action: check the thread# and sequence#
//
20207, 1, "UNTIL TIME or RECOVERY WINDOW is before RESETLOGS time"
// *Cause: UNTIL TIME and RECOVERY WINDOW cannot be less than the database
//         creation time or RESETLOGS time.
// *Action: Check the UNTIL TIME or RECOVERY WINDOW. If the database
//          needs to be restored to an old incarnation, use the
//          RESET DATABASE TO INCARNATION command.
//
20208, 1, "UNTIL CHANGE is before RESETLOGS change"
// *Cause: UNTIL CHANGE cannot be less than the database RESETLOGS change.
// *Action: Check the UNTIL CHANGE. If the database needs to be restored to
//          an old incarnation, use the RESET DATABASE TO INCARNATION command.
//
20209, 1, "duplicate datafile name"
// *Cause: Two datafiles have the same name
// *Action: This is an internal error.
//
20210, 1, "invalid archived log range, thread number is null"
// *Cause:
// *Action: This is an internal error.
//
20211, 1, "FROM TIME is before RESETLOGS time"
// *Cause: FROM TIME cannot be less than the database creation time or
//         RESETLOGS time.
// *Action: Check the FROM TIME. If the database needs to be restored to
//          an old incarnation, use the RESET DATABASE TO INCARNATION command.
//
20212, 1, "UNTIL CHANGE is an orphan incarnation"
// *Cause: Specified UNTIL CHANGE was an orphan incarnation.
// *Action: Check the UNTIL CHANGE or UNTIL RESTORE POINT. If the database
//          needs to be restored or flashed back to an orphan incarnation,
//          use the RESET DATABASE TO INCARNATION command.
//
20215, 1, "backup set not found"
// *Cause: The specified backup set key was not found in the recovery catalog
//         or target database control file.
// *Action: Specify a different backup set key.
//
20216, 1, "backup piece is missing"
// *Cause:
// *Action: This is an internal error.
//
20217, 1, "datafile not part of the database"
// *Cause: the datafile does not exists or did not exist at until time/scn
// *Action: check the datafile name or number. This is an internal error.
//         for restore database or tablespace.
//
20218, 1, "datafile not found in repository"
// *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
20220, 1, "control file copy not found in the repository"
// *Cause:  The specified control file was not in the recovery catalog or
//          target database control file or it was marked deleted.
// *Action: check the file name
//
20221, 1, "ambiguous control file copy name"
// *Cause: more than one control file copy in the recovery catalog match the
//         specified name.
// *Action:
//
20222, 1, "datafile name not found in recovery catalog or is ambiguous"
// *Cause:  The specified datafile name is not the name of a datafile that
//          is currently part of the target database, or an UNTIL clause has
//          been specified and the file name was for a different datafile
//          at the time specified by the UNTIL clause than it is now.
// *Action: Use a datafile number to specify the datafile you want to 
//          RESTORE or RECOVER.
//
20230, 1, "datafile copy not found in the repository"
// *Cause:  The specified datafile was not in the recovery catalog or target
//          database control file or it was marked deleted.
// *Action: check the datafile copy name or key
//
20231, 1, "ambiguous datafile copy name"
// *Cause: more than one control file copy in the recovery catalog match the
//        specified name.
// *Action: use the datafile copy key to uniquely specify the datafile copy
//
20232, 1, "tag does not match any datafile copy in the recovery catalog"
// *Cause:
// *Action: check the tag
//
20240, 1, "archived log not found in the repository"
// *Cause:  The specified archived log was not found in the recovery catalog
//          or target database control file or it was marked deleted.
// *Action: check the archived log name or key
//
20241, 1, "ambiguous archived log name"
// *Cause: more than one archived log in the recovery catalog match the
//        specified name
// *Action: use the archived log key to uniquely specify the archived log
//
20242, 1, "specification does not match any archived log in the repository"
// *Cause:  No archived logs found that match specification in the recovery
//          catalog or target database control file.
// *Action: check the archived log specifier
//
20243, 1, "database db_unique_name is not known to the recovery catalog"
// *Cause: the user specified DB_UNIQUE_NAME not known to the recovery catalog.
// *Action: change the database DB_UNIQUE_NAME to a known database value.
//          To display list of known db_unique_names execute
//             LIST DB_UNIQUE_NAME OF DATABASE
//
20244, 1, "can not change currently connected database db_unique_name"
// *Cause: the user specified currently connected DB_UNIQUE_NAME value to 
//         unregister.
// *Action: use the DB_UNIQUE_NAME other than connected target database's 
//          DB_UNIQUE_NAME value.
//
20245, 1, "can not specify db_unique_name option in nocatalog mode"
// *Cause: the user specified DB_UNIQUE_NAME in nocatalog mode.
// *Action: remove the DB_UNIQUE_NAME option from the command.
//
20246, 1, "new db_unique_name is already known to the recovery catalog"
// *Cause: the user specified known DB_UNIQUE_NAME value when renaming a
//         DB_UNIQUE_NAME in the recovery catalog.
// *Action: change the database DB_UNIQUE_NAME to an known DB_UNIQUE_NAME 
//          value; or unregister the new DB_UNIQUE_NAME before renaming an old 
//          DB_UNIQUE_NAME value for a database.
//          To display the list of all DB_UNIQUE_NAME for the databases
//          LIST DB_UNIQUE_NAME OF DATABASE command can be executed.
20247, 1, "specification does not match any foreign archived log in the repository"
// *Cause:  No foreign archived logs found that match specification in the
//          recovery catalog or target database control file.
// *Action: check the foreign archived log specifier
20250, 1, "offline range not found in the repository"
// *Cause: The specified offline was not found in the recovery catalog or
//         target database control file.
// *Action: check that recovery catalog is current
//
20260, 1, "backup piece not found in the repository"
// *Cause: The specified backup piece was not in the recovery catalog or target
//         database control file or it was marked deleted.
// *Action: check the backup piece handle or key
//
20261, 1, "ambiguous backup piece handle"
// *Cause: more than one backup piece in the recovery catalog match the
//        specified handle
// *Action: use the backup piece key to uniquely specify the backup piece
//
20270, 1, "invalid incremental backup level"
// *Cause:
// *Action:
//
20271, 1, "invalid incremental cumulative option"
// *Cause:
// *Action:
//
20272, 1, "no parent backup found for the incremental backup"
// *Cause: no available backup or copy that could be used as the parent of
//         the incremental backup was found in the recovery catalog.
// *Action: take a level 0 backup or copy of the datafile first
//
20280, 1, "too many device types"
// *Cause: more than 8 device types were allocated
// *Action: make sure that the job allocates at most 8 different device types
//
20298, 1, "DBMS_RCVCAT package not compatible with the recovery catalog"
// *Cause:  The version of the recovery catalog tables does not work with this
//          version of the DBMS_RCVCAT package.
// *Action: Check that the recovery catalog packages and schema are installed
//          correctly.  The UPGRADE CATALOG command can be used to upgrade
//          the recovery catalog tables and packages to the most current
//          version.
//
20299, 1, "DBMS_RCVMAN package not compatible with the recovery catalog"
// *Cause:  The version of the recovery catalog tables does not work with this
//          version of the DBMS_RCVMAN package.
// *Action: Check that the recovery catalog packages and schema are installed
//          correctly.  The UPGRADE CATALOG command can be used to upgrade
//          the recovery catalog tables and packages to the most current
//          version.
//
20300, 1, "operation not supported without the recovery catalog"
// *Cause:
// *Action:
//
20310, 1, "proxy copy not found in the repository"
// *Cause:  The specified proxy copy was not in the recovery catalog or target
//          database control file or it was marked deleted.
// *Action: check the proxy copy handle or key
//
20311, 1, "ambiguous proxy copy handle"
// *Cause: more than one proxy copy in the recovery catalog matches the
//        specified handle
// *Action: use the proxy copy key to uniquely specify the proxy copy
//
20312, 1, "ambiguous proxy copy RECID"
// *Cause:
// *Action: This is an internal error.
20400, 1, "stored script not found"
20401, 1, "script already exists"
// *Cause: a CREATE SCRIPT was issued, but a script with the specified
//         name already exists.
// *Action: use a different name or use REPLACE SCRIPT.
20500, 1, "media recovery aborted"
20501, 1, "redo logs from parent database incarnation cannot be applied"
// *Cause: A RESTORE or RECOVER of a datafile was requested, but recovery
//         of the datafile would require applying redo logs that were
//         generated before the most recent OPEN RESETLOGS.
// *Action: If a full backup or datafile copy from the current database
//          incarnation exists, ensure that it is marked AVAILABLE, and
//          that a channel of the correct device type is allocated.  It may
//          also be necessary to remove the FROM BACKUPSET or
//          FROM DATAFILECOPY or FROM TAG operands if these have been
//          specified.
20502, 1, "DELETE EXPIRED cannot delete objects that exist - run CROSSCHECK"
// *Cause: A DELETE EXPIRED command was run, but the object was actually
//         found to exist.  This means the recovery catalog or target database
//         control file is out of sync with reality.
// *Action: Run CROSSCHECK.
20503, 1, "DELETE cannot delete expired objects - run CROSSCHECK or DELETE EXPIRED"
// *Cause: A DELETE command was run without EXPIRED option, but the object
//         doesn't exist.  This means the recovery catalog or target database
//         control file is out of sync with reality.
// *Action: Run CROSSCHECK.
20504, 1, "corruption list not found in recovery catalog"
// *Cause:  corruption list is empty
// *Action: make sure that one or more blocks are marked corrupted in
//          v$copy_corruption and v$backup_corruption and recovery catalog is
//          up-to-date.
20505, 1, "create datafile during recovery"
// *Cause:  applying of archived log caused a create datafile redo-entry to
//          to terminate recovery.
// *Action: none. This message is never displayed. RMAN automatically detects
//          this case and creates the datafile.
20506, 1, "no backup of archived log found"
// *Cause:  during the recover process, no backup was found from which
//          the archived logs could be restored.
// *Action: this message should be followed by a list of missing
//          archived logs.  Please make the necessary archived log
//          backups available and try again.
20507, 1, "some targets are remote - aborting restore"
// *Cause:  during the restore process, one or more backup files were 
//          unavailable locally for the restore operation.
// *Action: This message should be accompanied with the list of remote backup 
//          files. Recall these backups from remote location and retry the
//          RESTORE command.
20508, 1, "temporary resource already in use"
// *Cause: Temporary resource that was allocated for IMPORT CATALOG command
//         was already in use.
// *Action: Retry IMPORT CATALOG command.
20509, 1, "temporary resource not found"
// *Cause: Temporary resource that was allocated for IMPORT CATALOG command
//         was not found.
// *Action: Retry IMPORT CATALOG command.
20510, 1, "database not found in source recovery catalog database"
// *Cause: Database that was specified in IMPORT CATALOG command was not found
//         in the source recovery catalog database.
// *Action: Make sure that the database is registered in the source recovery
//          catalog database.
20511, 1, "database name is ambiguous in source recovery catalog database"
// *Cause: Two or more databases in the source recovery catalog database
//         match this name.
// *Action: Use DBID option in IMPORT CATALOG command to specify the source
//          database.
20512, 1, "source database already registered in recovery catalog"
// *Cause: Source database was already registered in the recovery catalog.
// *Action: If the source database is really registered, there is no need to
//          register it again. Note that the recovery catalog enforces that
//          all databases have a unique DBID. If the new database was created
//          by copying files from an existing database, it will have the
//          same DBID as the original database and cannot be registered in
//          the same recovery catalog.
//
20999, 1, "internal error"
/
/
/ KRMP errors: 60000-62000
/ (As of 03/27/2007)
/
