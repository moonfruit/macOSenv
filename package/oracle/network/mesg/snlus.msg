/ Copyright (c) 1991 by the Oracle Corporation.  All rights reserved.
/
/ $Header: /netrcs/RCS/oracle/network/nl/RCS/snlus.msg,v 1.14 1993/07/22 21:34:46 eminer Exp $
/
/ NAME     
/   nplus.msg
/
/ FUNCTION 
/   Network Presentation Layer US error message file
/
/ NOTES
/       Message text should be limited to a maximum of 76 characters.
/	Messages containing embedded % directives should not overrun
/	the 76 character limit unless they signal unusual errors
/	which do not occur as part of user applications.  For example,
/	startup errors and system-dependent errors can probably get
/	away with longer message text.
/
/ OWNER
/   markl
/
/ MODIFIED
/    $Log: snlus.msg,v $
/Revision 1.14  1993/07/22  21:34:46  eminer
/add a message for 'mkdir' failure.
/
/Revision 1.13  1993/07/12  22:12:00  jgraham
/add password length error
/
/Revision 1.12  1993/07/12  21:47:13  eminer
/add messages for snlpspr() on vms.
/
/Revision 1.11  1993/07/01  01:29:42  jgraham
/add message 104
/
/Revision 1.10  1993/06/30  20:33:49  jgraham
/add password prompt errors
/
/Revision 1.9  1993/04/13  05:02:23  dmorriso
/Added message for snlfacc and snltmgcs
/
/    Markl    02/22/91     error messages for nodotf
/    Markl    02/19/91     RCS header
/
00000, 00000, "normal, successful completion"
/
/ UNIX OSD errors 0 - 499
/
00001, 00000, "snlftmp: file buffer size below minimum"
00002, 00000, "snlftmp: temporary file open for write failed"
00003, 00000, "snlfdel: file name exceeds maximum"
00004, 00000, "snlfdel: file delete failed"
00005, 00000, "snlfrnm: old file name exceeds maximum"
00006, 00000, "snlfrnm: new file name exceeds maximum"
00007, 00000, "snlfrnm: file rename failed"
00008, 00000, "snlfgpf: ORACLE_HOME undefined"
00009, 00000, "snlfgpf: file name exceeds maximum"
00010, 00000, "nodotf: file name exceeds maximum"
00011, 00000, "nodotf: trace file cannot be accessed"
00012, 00000, "nodotf: trace file cannot be created"
00013, 00000, "snlfohd: file name exceeds maximum"
00014, 00000, "snlfohd: null file handle"
00015, 00000, "snlfohd: at least one of WRITE and READ must be requested"
00016, 00000, "snlfohd: error opening file"
00017, 00000, "snlfoty: unknown TTY type"
00018, 00000, "snlfchd: uninitialized handle"
00019, 00000, "snlfchd: error closing file handle"
00020, 00000, "snlfgch: uninitialized handle"
00021, 00000, "snlfgch: end of file"
00022, 00000, "snlfgch: read error"
00023, 00000, "snlfuch: uninitialized handle"
00024, 00000, "snlfuch: pushback read error"
00025, 00000, "snlfprh: uninitialized handle"
00026, 00000, "snlfprh: write error"
00027, 00000, "snlfprt: write error"
00028, 00000, "snlfglh: uninitialized handle"
00029, 00000, "snlfglh: end of file"
00030, 00000, "snlfglh: read error"
00031, 00000, "snlfwrt: uninitialized handle"
00032, 00000, "snlfwrt: write error"
00033, 00000, "snlfrd: uninitialized handle"
00034, 00000, "snlfrd: read error"
00035, 00000, "snlffls: uninitialized handle"
00036, 00000, "snlffls: flush error"
00037, 00000, "snlftel: uninitialized handle"
00038, 00000, "snlftel: error finding file position"
00039, 00000, "snlfsek: uninitialized handle"
00040, 00000, "snlfsek: error setting file position"
00041, 00000, "snlfpre: uninitialized handle"
00042, 00000, "snlfvfp: uninitialized handle"
00043, 00000, "snlfvfp: write error"
00044, 00000, "snlfacc: file or path name does not exist"
00045, 00000, "snlfacc: file access denied"
00046, 00000, "snltmnsup: preemptive signals not supported on this platform"
00047, 00000, "snlflch: cannot stat"
00048, 00000, "snlfncwd: cannot change working directory"
00049, 00000, "snlfgenv: buffer length too small"
00050, 00000, "snlfncdir: buffer length too small"
00051, 00000, "snlfacc: not enough memory"
00052, 00000, "snltmgcs: gettimeofday error, unable to get wall clock."
// *Cause:  Gettimeofday system call returned an error. Possible OS error. 
// *Action: Check additional information returned in OS reference manual. 
//          Contact customer support. 
00053, 00000, "snlfnmkd: cannot create directory"
00100, 00000, "snlpcsp: executable not found"
00101, 00000, "snlpcsp: executable not started correctly"
00102, 00000, "snlpsprom: not a tty"
00103, 00000, "snlpsprom: ioctl failed on device"
00104, 00000, "snlpsprom: invalid prompt length"
00105, 00000, "snlpsprom: $TRNLOG  failure"
00106, 00000, "snlpsprom: $GETDVI  failure"
00107, 00000, "snlpsprom: $ASIGN  failure"
00108, 00000, "snlpsprom: $QIOW read failure"
00109, 00000, "snlpsprom: invalid password length: should be less than 30"

/
/ nlfncons messages
/
00820, 00000, "nlfncons: buffer length too small"
00821, 00000, "nlfncons: file does not exist"
