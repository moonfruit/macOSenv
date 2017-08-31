/ 
/ $Header: /core/tmp/new35CORE/./mesg/RCS/tlemus.msg,v 1.2 1994/10/13 14:48:45 bcchang Exp $ 
/ 
/ Copyright (c) 1991 by Oracle Corporation 
/   NAME
/     tlemus.msg - Test LEM US language error message file
/   DESCRIPTION
/     Error message file for LEM package tests
/   RETURNS
/
/   NOTES
/     <other useful comments, qualifications, etc.>
/   MODIFIED   (MM/DD/YY)
/    bcchang    10/13/94 -  Update header info 
/    bcchang    10/13/94 -  Creation 
/    echeng     01/03/94 -  fix message length 
/    echeng     11/09/93 -  add longer messages 
/    echeng     10/12/93 -  follow message guidelines
/    echeng     03/05/93 -  add message for unopenable file 
/    echeng     03/03/93 -  change parameter values 
/    echeng     02/04/93 -  Creation 
00000, 00000, "normal, successful completion"
// *Cause:  Normal exit
// *Action: None
00001, 00000, "out of memory"
// *Cause:  The exception manager failed in trying to dynamically allocate 
//          memory.
// *Action: Perform whatever actions you wish to make more memory available
//          to the running program.
00002, 00000, "no exception frame to pop to"
// *Cause:  Corrupted exception frame stack
// *Action: None
00003, 00000, "exception stack full, couldn't record exceptions %d and %d"
// *Cause:  Too many exceptions in stack
// *Action: Remove some exceptions from the stack
00004, 00000, "unable to find LMS file for product %s and facility %s"
// *Cause:  LMS error
// *Action: Generic error messages will be reported
00005, 00000, "unable to find message for error %s"
// *Cause:  No message for current exception number
// *Action: Generic error message will be reported
00006, 00000, "missing facility or product name"
00007, 00000, "a nuclear war can ruin your whole day"
// *Cause:  None
// *Action: None
00008, 00000, "it is impossible to travel faster than light, and certainly not\ndesirable, as one's hat keeps blowing off.\n-- Woody Allen"
// *Cause:  None
// *Action: None
00009, 00000, "a witty saying proves nothing -- Voltaire"
// *Cause:  None
// *Action: None
00010, 00000, "nondeterminism means never having to say you are wrong"
// *Cause:  None
// *Action: None
00011, 00000, "if I had any humility I would be perfect. -- Ted Turner"
// *Cause:  None
// *Action: None
00012, 00000, "it's not enough to be Hungarian; you must have talent too.\n\t-- Alexander Korda"
// *Cause:  None
// *Action: None
00013, 00000, "never put off till tomorrow what you can avoid all together"
// *Cause:  None
// *Action: None
00014, 00000, "cleanliness is next to impossible"
// *Cause:  None
// *Action: None
00015, 00000, "anything is good and useful if it's made of chocolate"
// *Cause:  None
// *Action: None
00016, 00000, "nostalgia isn't what it used to be"
// *Cause:  None
// *Action: None
00020, 00000, "exception manager test error number %d"
// *Cause:  Testing
// *Action: Normal exit
00021, 00000, "exception manager test parameters %(1)s, %(2)s"
// *Cause:  Testing
// *Action: Normal exit
00022, 00000, "exception manager test reverse parameters %(2)s, %(1)s"
// *Cause:  Testing
// *Action: Normal exit
00023, 00000, "could not open log file"
// *Cause:  File I/O failed
// *Action: None
00024,0,"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"
// *Cause:  message 1 byte shorter than max size (120)
// *Action: None
00025,0,"1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901"
// *Cause:  message equal to max size (121)
// *Action: None
00030,0,"This is an alternative message number"
// *Cause:  used in testing alternative message code
// *Action: None
00900, 00000, "internal exception code, arguments: [%s], [%s], [%s], [%s], [%s], [%s]"
// *Cause:  An internal error occurred. 
// *Action: Contact the development organization.
00901, 00000, "fatal exception occurred: unwise to proceed"
// *Cause:  Unknown
// *Action: Contact the appropriate development group immediately
