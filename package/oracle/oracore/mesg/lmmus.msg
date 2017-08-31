/ 
/ $Header: lmmus.msg 19-jun-2003.17:48:07 Exp $ 
/ 
/ Copyright (c) 1991, 2003, Oracle.  All rights reserved.
/   NAME
/     lmmus.msg - LMM US language error message file
/   DESCRIPTION
/     Contains the LMM error messages.
/   RETURNS
/
/   NOTES
/     
/ --------------------------------------------------------------------------
/ Generic errors for the memory manager, 0 - 59.
/ --------------------------------------------------------------------------
/
00000, 00000, "Normal, successful completion."
// *Cause:  Normal exit
// *Action: None
//
/00001, 00000, "Memory Manager Internal Error #%ld"
// *Cause:  An internal error occurred. 
// *Action: Contact the development organization.
//
00002, 00000, "Out of memory."
// *Cause:  The memory manager failed in trying to dynamically allocate 
//          memory.
// *Action: Perform whatever actions you wish to make more memory available
//          to the running program.
//
00003, 00000, "Internal exception code, arguments: [%s], [%s]"
// *Cause:  Unknown - indicated by parameters
// *Action: Report to the appropriate development group
//
00004, 00000, "Fatal exception occurred: unwise to proceed."
// *Cause:  Unknown
// *Action: Contact the appropriate development group immediately
//
00033, 00000, "Invalid argument passed to %s."
// *Cause:  Unknown -- likely to be client error.
// *Action: Examine arguments being passed to this program.
//
00034, 00000, "Request size in %s exceeds maximum allowable on this platform."
// *Cause:  The client requests memory bigger than allowable on this platform.
// *Action: Examine the size requested.
//
00035, 00000, "SLTS Initialize Context fail in %s."
// *Cause:  Thread services failure.
// *Action: Contact the development organization.
//
00036, 00000, "SLTS Terminate Context fail in %s."
// *Cause:  Thread services failure.
// *Action: Contact the development organization.
//
//****************************************************************************
//********The rest of these are not being used anymore, as they have**********
//********    all been classified as internal errors.*************************
// after talking with Bronwyn, we decided to uncomment the following stuff.
//
// (04/04/95 ysang):
//   According to the new LEM guidelines, these can be make internal errors.
//   So, they are now classified as internal errors, and I've commented them.
//   **** Do NOT erase the following though, because they will help in
//        debugging if internal exceptions do occur.
/
/ --------------------------------------------------------------------------
/ Errors recorded in lmmhpinit, 60 - 89.
/ --------------------------------------------------------------------------
/
//00060, 00000, "lmmhpinit failed because underlying free heap fcn failed."
// *Cause:  Underlying model-specific hpfree call failed.
// *Action: Likely to be either bad client arg or internal LMM problem.
//
//00061, 00000, "Unable to allocate memory in function lmmhpinit."
// *Cause:  A call to lmmmalloc within function lmmhpinit failed.
// *Action: Likely to be either bad client arg or internal LMM problem.
//
/00062, 00000, "Bad client model specified (parameter cl_fcns) in hpinit fcn."
// *Cause:  Client has not specified an acceptable value for cl_fcns.          
// *Action: Correct the argument passed in.
/
/ --------------------------------------------------------------------------
/ Errors recorded in lmmhpfree, 90 - 119.
/ --------------------------------------------------------------------------
/
//00090, 00000, "lmmhpfree failed because underlying free heap fcn failed."
// *Cause:  Underlying model-specific hpfree call failed.
// *Action: Likely to be either bad client arg or internal LMM problem.
//
//00091, 00000, "Unable to free memory in function lmmhpinit."
// *Cause:  A call to lmmfree within function lmmhpfree failed.
// *Action: Likely to be either bad client arg or internal LMM problem.
/
/ --------------------------------------------------------------------------
/ Errors recorded in lmmmalloc, 120 - 149.
/ --------------------------------------------------------------------------
/
//00120, 00000, "malloc failed."
// *Cause:  Underlying model-specific malloc call failed.
// *Action: Likely to be either bad client arg or internal LMM problem.
/
/ --------------------------------------------------------------------------
/ Errors recorded in lmmcalloc, 150 - 179.
/ --------------------------------------------------------------------------
/
//00150, 00000, "lmmcalloc failed."
// *Cause:  Underlying model-specific calloc call failed.
// *Action: Likely to be either bad client arg or internal LMM problem.
/
/ --------------------------------------------------------------------------
/ Errors recorded in lmmrealloc, 180 - 209.
/ --------------------------------------------------------------------------
/
//00180, 00000, "lmmrealloc failed."
// *Cause:  Underlying model-specific realloc call failed.
// *Action: Likely to be either bad client arg or internal LMM problem.
/
/ --------------------------------------------------------------------------
/ Errors recorded in lmmvalloc, 210 - 239.
/ --------------------------------------------------------------------------
/
//00210, 00000, "lmmvalloc failed."
// *Cause:  Underlying model-specific valloc call failed.
// *Action: Likely to be either bad client arg or internal LMM problem.
/
/ --------------------------------------------------------------------------
/ Errors recorded in lmmfree, 240 - 269.
/ --------------------------------------------------------------------------
/
//00240, 00000, "lmmfree failed."
// *Cause:  Underlying model-specific free call failed.
// *Action: Likely to be either bad client arg or internal LMM problem.
/
/ --------------------------------------------------------------------------
/ Errors recorded in lmmhpsz, 270 - 299.
/ --------------------------------------------------------------------------
/
// Currently none.
/
/ --------------------------------------------------------------------------
/ Errors recorded in lmmtophp, 300 - 329.
/ --------------------------------------------------------------------------
/
// Currently none.
/
/ --------------------------------------------------------------------------
/ Errors for Mutex, 330 - 339.
/ --------------------------------------------------------------------------
/
//00330, 00000, "Unable to initialize mutex"
// *Cause:  Initialization of mutex failed.
// *Action: Examine the sltsmxi() function (internal LMM problem).
//
//00331, 00000, "Unable to destroy lock"
// *Cause:  Destroy of mutex failed.
// *Action: Examine the sltsmxd() function (internal LMM problem).
/
/ --------------------------------------------------------------------------
/ Errors for slwmmgetmem and slwmmputmem, 340 - 349.
/ --------------------------------------------------------------------------
/
//00340, 00000, "Call to function slwmmgetmem failed."
// *Cause:  The SOSD call to get memory from the system failed.
// *Action: System specific.
//
//00341, 00000, "Call to function slwmmputmem failed."
// *Cause:  The SOSD call for freeing memory to the system failed.
// *Action: System specific.
/
/ --------------------------------------------------------------------------
/ Errors for Standard Model Functions, 350 - 599.
/ --------------------------------------------------------------------------
/
//00350, 00000, "In Std hpinit: cannot allocate context."
// *Cause:  Call to lmmgmalloc with parent pointer failed.
// *Action: Internal LMM problem.
//
//00355, 00000, "In Std hpfree: free fail w/ inuse vrtblk."
// *Cause:  Call to lmmgfree with parent pointer failed.
// *Action: Internal LMM problem.
//
//00356, 00000, "In Std hpfree: free fail w/ free vrtblk."
// *Cause:  Call to lmmgfree with parent pointer failed.
// *Action: Internal LMM problem.
//
//00357, 00000, "In Std hpfree: free standard context fail."
// *Cause:  Call to lmmgfree with parent pointer failed.
// *Action: Internal LMM problem.
//
//00360, 00000, "In Std malloc: Get small blk fail."
// *Cause:  Call to lmmstsml failed.
// *Action: Internal LMM problem.
//
//00361, 00000, "In Std malloc: Get large blk fail."
// *Cause:  Call to lmmstlrg failed.
// *Action: Internal LMM problem.
//
//00365, 00000, "In Std calloc: cannot allocate memptr."
// *Cause:  Call to lmmstmalloc failed.
// *Action: Internal LMM problem.
//
//00370, 00000, "Std realloc fail: bad hp pointer (Purify case)."
// *Cause:  Heap pointer for block to be freed is incorrect (Purify case).
// *Action: Internal LMM problem.
//
//00371, 00000, "Std realloc fail due to bad heap pointer."
// *Cause:  Heap pointer for block to be freed is incorrect.
// *Action: Internal LMM problem.
//
//00372, 00000, "In Std realloc: call valloc fail."
// *Cause:  Call to lmmstvalloc failed.
// *Action: Internal LMM problem.
//
//00373, 00000, "In Std realloc: merge large blocks fail."
// *Cause:  Call to lmmstmrg failed.
// *Action: Internal LMM problem.
//
//00374, 00000, "In Std realloc: cut large block fail."
// *Cause:  Call to lmmstcutlrg failed.
// *Action: Internal LMM problem.
//
//00375, 00000, "In Std realloc: std malloc fail."
// *Cause:  Call to lmmstmalloc failed.
// *Action: Internal LMM problem.
//
//00376, 00000, "In Std realloc: std free fail."
// *Cause:  Call to lmmstfree failed.
// *Action: Internal LMM problem.
//
//00377, 00000, "In Std realloc: call std merge w/ 2 next blks fail."
// *Cause:  Call to lmmstmrg failed.
// *Action: Internal LMM problem.
//
//00380, 00000, "In Std valloc: std malloc fail."
// *Cause:  Call to lmmstmalloc failed.
// *Action: Internal LMM problem.
//
//00381, 00000, "Std valloc fail due to unaligned Pure pointer."
// *Cause:  Call to sslwmmxmmarkp returned unaligned Pure pointer.
// *Action: Internal LMM problem.
//
//00385, 00000, "Std free fail due to bad hp ptr (large blk)."
// *Cause:  Heap pointer for block to be freed is incorrect (Purify case).
// *Action: Internal LMM problem.
//
//00386, 00000, "Std free fail due to bad hp ptr (small blk)."
// *Cause:  Heap pointer for block to be freed is incorrect (Purify case).
// *Action: Internal LMM problem.
//
//00387, 00000, "Std free fail due to call to sslwmmyfmarkp."
// *Cause:  Call to sslwmmyfmarkp fail.
// *Action: Internal LMM problem.
//
//00388, 00000, "In Std free: std merge with prev lrg blk fail."
// *Cause:  Call to lmmstmrg fail.
// *Action: Internal LMM problem.
//
//00389, 00000, "In Std free: std merge with next large blk fail."
// *Cause:  Call to lmmstmrg fail.
// *Action: Internal LMM problem.
//
//00390, 00000, "In Std free: std free vrt fail."
// *Cause:  Call to lmmstfvrt fail.
// *Action: Internal LMM problem.
//
//00391, 00000, "In Std free: std bit change fail."
// *Cause:  Call to lmmstbitcg fail.
// *Action: Internal LMM problem.
//
//00392, 00000, "In Std free: std free chunk fail."
// *Cause:  Call to lmmstfchnk fail.
// *Action: Internal LMM problem.
//
//00395, 00000, "In Std getchnk: remove large blk fail."
// *Cause:  Call to lmmstmlrg fail.
// *Action: Internal LMM problem.
//
//00396, 00000, "In Std getchnk: cut large blk fail."
// *Cause:  Call to lmmstcutlrg fail.
// *Action: Internal LMM problem.
//
//00397, 00000, "In Std getchnk: get virtual blk fail."
// *Cause:  Call to lmmstvrt fail.
// *Action: Internal LMM problem.
//
//00400, 00000, "In Std freechnk: std free fail."
// *Cause:  Call to lmmstfree fail.
// *Action: Internal LMM problem.
//
//00405, 00000, "In Std freevrt: generic free fail."
// *Cause:  Call to lmmgfree fail.
// *Action: Internal LMM problem.
//
//00410, 00000, "In Std getlrg: std remove large blk fail."
// *Cause:  Call to lmmstrmlrg fail.
// *Action: Internal LMM problem.
//
//00411, 00000, "In Std getlrg: std cut large blk fail."
// *Cause:  Call to lmmstcutlrg fail.
// *Action: Internal LMM problem.
//
//00412, 00000, "In Std getlrg: std get vrt blk fail."
// *Cause:  Call to lmmstvrt fail.
// *Action: Internal LMM problem.
//
//00415, 00000, "In Std merge:  std remove large blk fail w/ block."
// *Cause:  Call to lmmstrmlrg fail.
// *Action: Internal LMM problem.
//
//00416, 00000, "In Std merge: std remove large blk fail w/ neighbor blk."
// *Cause:  Call to lmmstrmlrg fail.
// *Action: Internal LMM problem.
//
//00420, 00000, "In Std rmlrg: std bit change fail."
// *Cause:  Call to lmmstbitcg fail.
// *Action: Internal LMM problem.
//
//00425, 00000, "In Std getsml: std get chunk fail."
// *Cause:  Call to lmmstchnk fail.
// *Action: Internal LMM problem.
//
//00430, 00000, "In Std getvrt: generic malloc fail." 
// *Cause:  Call to lmmgmalloc fail.
// *Action: Internal LMM problem.
//
//00435, 00000, "In Std cutlrg: std bit change fail."
// *Cause:  Call to lmmstbitcg fail.
// *Action: Internal LMM problem.
/
/ --------------------------------------------------------------------------
/ Errors for Fast Model Functions, 600 - 699.
/ --------------------------------------------------------------------------
/
//00600, 00000, "In Fast hpinit: generic malloc fail."
// *Cause:  Call to lmmgmalloc with parent pointer failed.
// *Action: Internal LMM problem.
//
//00601, 00000, "In Fast hpinit: fast get vrt blk fail."
// *Cause:  Call to lmmstvrt fail.
// *Action: Internal LMM problem.
//
//00605, 00000, "In Fast hpfree: generic free with vrt blk fail."
// *Cause:  Call to lmmgfree with parent pointer failed.
// *Action: Internal LMM problem.
//
//00606, 00000, "In Fast hpfree: generic free with realhp fail."
// *Cause:  Call to lmmgfree with parent pointer failed.
// *Action: Internal LMM problem.
//
//00610, 00000, "In Fast malloc: fast get vrt blk fail."
// *Cause:  Call to lmmfsvrt fail.
// *Action: Internal LMM problem.
//
//00615, 00000, "In Fast calloc: fast malloc fail."
// *Cause:  Call to lmmfsmalloc fail.
// *Action: Internal LMM problem.
//
//00620, 00000, "In Fast realloc: fast memalign fail."
// *Cause:  Call to lmmfsmemalign fail.
// *Action: Internal LMM problem.
//
//00621, 00000, "In Fast realloc: fast malloc fail."
// *Cause:  Call to lmmfsmalloc fail.
// *Action: Internal LMM problem.
//
//00625, 00000, "In Fast memalign: fast get vrt blk fail."
// *Cause:  Call to lmmfsvrt fail.
// *Action: Internal LMM problem.
//
//00630, 00000, "In Fast getvrt: generic malloc fail."
// *Cause:  Call to lmmgmalloc fail.
// *Action: Internal LMM problem.
// *Action: Internal LMM problem.
/
/ --------------------------------------------------------------------------
/ Errors for LMM Initialization Functions, 700 - 749.
/ --------------------------------------------------------------------------
/
//00700, 00000, "In lmmrist: Cannot init product descriptor."
// *Cause:  SOSD call to get memory from the system failed.
// *Action: System specific.
//
//00701, 00000, "In lmmrist: Cannot init lmm context."
// *Cause:  SOSD call to get memory from the system failed.
// *Action: System specific.
//
//00702, 00000, "In lmmrist: Cannot init private instance context."
// *Cause:  SOSD call to get memory from the system failed.
// *Action: System specific.
//
//00703, 00000, "In lmmrist: Cannot init primary context."
// *Cause:  SOSD call to get memory from the system failed.
// *Action: System specific.
//
//00704, 00000, "In lmmrist: Cannot init root top heap."
// *Cause:  SOSD call to get memory from the system failed.
// *Action: System specific.
//
//00705, 00000, "In lmmrist: Cannot init standard context."
// *Cause:  SOSD call to get memory from the system failed.
// *Action: System specific.
/
/ --------------------------------------------------------------------------
/ Errors for Block List Functions , 750 - 799
/ --------------------------------------------------------------------------
/
//00750, 00000, "lmmomallocblklist: Cannot create block structure."
// *Cause:  Call to slmmgetmem or lmmgmalloc fail.
// *Action: Internal LMM problem.
//
//00751, 00000, "lmmomallocblklist: Cannot allocate memory."
// *Cause:  Call to slmmgetmem fail.
// *Action: Internal LMM problem.
//
//00755, 00000, "lmmofreeblklist: Cannot free memory."
// *Cause:  Call to slmmpumem fail.
// *Action: Internal LMM problem.
//
//00756, 00000, "lmmofreeblklist: Cannot free block structure."
// *Cause:  Call to slmmputmem or lmmgfree fail.
// *Action: Internal LMM problem.
//
//00760, 00000, "lmmoreallocblklist: (2a) Allocate memory fail."
// *Cause:  Call to lmmoXblklist fail.
// *Action: Internal LMM problem.
//
//00761, 00000, "lmmoreallocblklist: (2a) Free memory fail."
// *Cause:  Call to Std/Fast free routine fail.
// *Action: Internal LMM problem.
//
//00762, 00000, "lmmoreallocblklist: (1a) Allcoate memory fail."
// *Cause:  Call to lmmoXblklist fail."
// *Action: Internal LMM problem.
//
//00763, 00000, "lmmoreallocblklist: (1a) Free memory fail."
// *Cause:  Call to lmmofreeblklist fail."
// *Action: Internal LMM problem.
//
//00764, 00000, "lmmoreallocblklist: (1b/c) Allocate memory fail."
// *Cause:  Call to Std/Fast malloc routine fail."
// *Action: Internal LMM problem.
//
//00765, 00000, "lmmoreallocblklist: (1b/c) Free memory fail."
// *Cause:  Call to lmmofreeblklist fail.
// *Action: Internal LMM problem.
//
//00770, 00000, "lmmohfreeblklist: Error while freeing memory blocks."
// *Cause:  Call to lmmofreeblklist fail.
// *Action: Internal LMM problem.
//
//00775, 00000, "lmmocallocblklist: Cannot allocate memory."
// *Cause:  Call to lmmomallocblklist fail.
// *Action: Internal LMM problem.
//
//00780, 00000, "lmmovallocblklist: Allocate memory fail."
// *Cause:  Call to lmmomallocblklist fail.
// *Action: Internal LMM problem.
