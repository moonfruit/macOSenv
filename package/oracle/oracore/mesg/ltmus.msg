/
/ $Header: ltmus.msg 19-jun-2003.17:48:09 Exp $
/
/ Copyright (c) 1995, 2003, Oracle.  All rights reserved.
/   NAME
/     ltmus.msg - LTM US language error message file
/   DESCRIPTION
/     Error message file for LTM package
/   RETURNS
/
/   NOTES
/
/ LTM Error Messages
/
/
00000, 00000, "Normal, successful completion."
// *Cause:      Normal exit
//
// *Action:     None
//
00800, 00000, "Component not initialized"
// *Cause:      A timer manipulation or a pool manipulation function was 
//              called before the component initialization function (ltmini).
//
// *Action:     Check your code to make sure ltmini is called before any
//              other LTM function.
//
00801, 00000, "Attempt to use free timer"
// *Cause:      The program is trying to access a timer that has been freed
//              or has never been allocated.
//
// *Action:     Check your code to see that the timer used had been allocated
//              and has not been freed.
//
00802, 00000, "Out of memory"
// *Cause:      The LTM package failed in trying to dynamically allocate
//              memory.
//
// *Action:     Perform whatever actions you wish to make more memory available
//              to the running program.
//
00803, 00000, "Error in signal handling"
// *Cause:      Error in one of the shared signals routines.
//
// *Action:     Contact the development organization.
//
00804, 00000, "Invalid parameter"
// *Cause:      Error in one or more of the input parameters
//
// *Action:     Make sure input parameters are correct.
//
