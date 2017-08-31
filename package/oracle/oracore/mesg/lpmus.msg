/ 
/ $Header: lpmus.msg 19-jun-2003.17:48:08 Exp $ 
/ 
/ Copyright (c) 1993, 2003, Oracle.  All rights reserved.
/   NAME
/     lpmus.msg - LPM US language error message file
/   DESCRIPTION
/     Error message file for the LPM package
/   RETURNS
/
/   NOTES
/
/   Classification of external exception codes
/
/   00000 - 00009	Generic Errors
/   00010 - 00019	lpmcall
/   00030 - 00039	lpmloadpkg
/   00060 - 00069	lpmdelete
/   00090 - 00100	lpmgetcompctx
/   00120 - 00129	lpmreturn
/   00150 - 00159	lpmsavecompctx
/   00160 - 00169	LPM List Routines' Errors
/   00170 - 00179	LPM Stack Routines' Errors
/   00180 - 00189	lpmfindshobj (??)
/   00210 - 00239	Instance creation
/   00240 - 00259	Shared Object Location
/   00270 - 00289	Dynamic Loading
/   00300 - 00329	Spawning Mechanism
/
/
00000, 00000, "Normal, successful completion."
// *Cause:  Normal exit
// *Action: None
00001, 00000, "Program Manager Internal Error #%ld"
// *Cause:  An internal error occurred. 
// *Action: Contact the development organization.
/
/ Generic errors for the program manager
/
00002, 00000, "Out of memory. %s"
// *Cause:      The program manager failed in trying to dynamically
//              allocate memory.   The '%s' is used for additional
//              comments like where, when and why there's such an error. 
//
// *Action:     Perform whatever actions you wish to make more memory
//              available to the running program. 
//
00003, 00000, "internal exception code. icode = [%s], [%s]"
// *Cause:      Unknown - indicated by parameters.  The first '%s'
//              gives the internal exception code; the second is for
//              any other additional comments.  
//
// *Action:     Report to the appropriate development group
//
00004, 00000, "fatal exception occurred: unwise to proceed."
// *Cause:  Unknown
// *Action: Contact the appropriate development group immediately
//
00005, 00000, "Free some memory failed in %s."
// *Cause:      A call to free some memory in function '%s' has failed.
//
// *Action:     Check the underlying errors for more information and
//              contact the appropriate development group immediately.
//
00006, 00000, "Invalid parameter to function %s"
// *Cause:      The function was called with an invalid parameter.
//
// *Action:     Check the function call to make sure that the correct 
//              parameters are being passed.
//
//  00007, 00000, "NLSRTL's call failed. %s"
// *Cause:      LX calls return failure
//
// *Action:     Check if our parameters are correct.  Contact the
//              appropriate group immediately if we parameters are valid.
//
00008, 00000, "SLTS's function failed for %s"
// *Cause:      SLTS's call return failure in function '%s'.
//
// *Action:     Contact the appropriate development group.
//
//
00009, 00000, "call to %s failed."
// *Cause:      A function call has failed.  This error is a generic
//              message to show that the exception has occurred in a
//              particular function '%s'.  This allows client to know
//              trace runtime calling sequence by examining the
//              exception stack. 
//
// *Action:     Check the underlying errors for more information.
//
/
/ Errors related to lpmcall
/
00010, 00000, "Unable to allocate a new program manager instance for a call."
// *Cause:  The program manager couldn't create a new instance for the called
//          program.
// *Action: Examine the underlying errors to see if it is something that can
//          be fixed.
00011, 00000, "Program %s not found."
// *Cause:  The program manager was asked to call a program, but it could not
//          figure out how to begin execution of this program.
// *Action: Make sure the product to be called has been properly installed.
00012, 00000, "Unable to free a program manager instance for a call."
// *Cause:  The program manager couldn't free an instance for the called
//          program.
// *Action: Examine the underlying errors to see if it is something that can
//          be fixed.
/
/ Erros related to lpmloadpkg
/
00030, 00000, "Unable to allocate a new program manager instance for a load."
// *Cause:  The program manager couldn't create a new instance for the package
//          to be loaded.
// *Action: Examine the underlying errors to see if it is something that can
//          be fixed.
00031, 00000, "Package %s not found."
// *Cause:  The program manager was asked to load a package, but it could not
//          locate this package.
// *Action: Make sure the package to be loaded has been properly installed.
00032, 00000, "Package %s did not create a primary context."
// *Cause:  When a package is loaded, it must create a primary context, and
//          when the specified package was loaded, it did not create such a
//          context.
// *Action: This is an error with the specified package.  It should use 
//          lpmalloc() to create a primary context.
00033, 00000, "Package %s did not describe its interface."
// *Cause:  When a package is loaded, it must describe its interface to the
//          program manager.  The specified package was loaded and did not
//          specify its interface.
// *Action: This is an error with the specified package.  It should use
//          lpmlistfuncs() or lpmarrfuncs() to describe its interface.
/
/ Errors related to lpmdelete
/
00060, 00000, "Package %s could not be deleted."
// *Cause:  lpmdelete() was called to delete a package that doesn't exist.
// *Action: Make sure lpmdelete() is called once and only once per each call
//          of lpmloadpkg().
/
/ Errors related to lpmgetcompctx()
/
00090, 00000, "Component context %s not found."
// *Cause:  A call to lpmgetcompctx() used a context name unknown to the 
//          program manager.
// *Action: Make sure that a context is stored with lpmsavecompctx() before
//          trying to fetch it with lpmgetcompctx().
00091, 00000, "Component name %s longer than maximum length of %d."
// *Cause:  Component context names are limited in length, and the passed
//          name exceeded this limit.
// *Action: Choose a shorter name for the component context.
/
/ Errors related to lpmexitprog()
/
00120, 00000, "Fatal error in lpmexitprog(): calling instance is missing."
// *Cause:  A product tried to do an lpmexitprog(), but we can find no record
//          of the calling instance.  At this point we do not know where to
//          resume execution.
// *Action: This is likely an internal error.
00121, 00000, "Fatal error in lpmexitprog(): call stack is corrupt."
// *Cause:  When lpmexitprog() tried to longjmp to the calling product, it 
//          found that either the call stack did not indicate the caller, or
//          there was no legitimate jump buffer for the parent.
// *Action: This is likely an internal error.
/
/ Errors related to lpmsavecompctx()
/
00150, 00000, "Component name %s longer than maximum length of %d."
// *Cause:  Component context names are limited in length, and the passed
//          name exceeded this limit.
// *Action: Choose a shorter name for the component context.
00151, 00000, "Attempt to overwrite saved component context %s."
// *Cause:  lpmsavecompctx() was called with a context name that had already
//          been used, and the replace flag was set to NOREPLACE.
// *Action: Either do not try to overwrite the context, or change the replace
//          flag to LPMCCREPLACE.
/
/ Errors related to lpmfindshobj()
/
00180, 00000, "Unable to allocate a new program manager instance for a load."
// *Cause:  The program manager couldn't allocate a new shared object 
//          identifier for the shared object to bind to.
// *Action: Examine the underlying errors to see if it is something that can
//          be fixed.
00181, 00000, "Shared object %s not found."
// *Cause:  lpmfindshobj() was called to find a shared object, but the Program
//          Manager could not find a shared object with the given name.
// *Action: Make sure the shared object has been properly installed and has
//          been named properly.
/
/ Errors related to instance creation
/
00210, 00000, "Could not create memory manager instance."
// *Cause:  The program manager created a new instance, but when it asked the
//          memory manager to initialize memory management for the instance,
//          it failed.
// *Action: Look at the underlying errors to see why the memory manager failed.
00211, 00000, "Could not create exception manager instance."
// *Cause:  The program manager created a new instance, but when it asked the
//          exception manager to initialize exception management for the 
//          instance, it failed.
// *Action: Look at the underlying errors to see why the exception manager 
//          failed.
00212, 00000, "Could not create file I/O instance."
// *Cause:  The program manager created a new instance, but when it asked the
//          file I/O package to initialize File I/O for the instance, it 
//          failed.
// *Action: Look at the underlying errors to see why the file I/O package 
//          failed.
/
/ Errors related to shared object location
/
00240, 00000, "Could not locate shared object with id %s."
// *Cause:  The program manager couldn't find a shared object in the 
//          environment with the given name.
// *Action: Make sure that the shared object has been installed in the OS
//          properly.
00241, 00000, "Could not read shared object with id %s."
// *Cause:  The program manager could locate a shared object with the given
//          name, but could not gather the needed information about it.
// *Action: It is likely that the shared object has protections which prohibit
//          the user from reading it.  Examine these protections.
/
/ Errors related to dynamic loading
/
00270, 00000, "Could not dynamically load code object named %s."
// *Cause:  The program manager was told to dynamically bind to a code 
//          object with the given name, but it could not do so for some
//          reason.
// *Action: Make the sure the code object exists, is installed properly, and
//          has proper protections.
00271, 00000, "Could not locate symbol %s in code object %s."
// *Cause:  The program manager could not find the named pseudo-main in the
//          named code object.
// *Action: Make sure the code object named is really the desired code object,
//          and make sure it was built as expected.
00272, 00000, "Could not detach from shared object %s."
// *Cause:  The program manager was informed that the client was done using
//          a shared object that was dynamically loaded, but it was unable to
//          properly pass this on to the operating system.
// *Action: Make sure the shared object is still installed properly.
00273, 00000, "Could not detach from code object %s."
// *Cause:  The program manager was informed that the client was done using a
//          a code object that was dynamically loaded, but it was unable to
//          properly pass this on to the operating system.
// *Action: Make sure the code object is still installed properly.
00274, 00000, "Could not translate symbol %s to find shared object."
// *Cause:  On SunOS, the given symbol was needed to find the location of
//          a shared library, but it couldn't be found in the operating 
//          system.
// *Action: Make sure this variable has been set up and exported properly.
00275, 00000, "Internal buffer overflow for library %s/%s."
// *Cause:  The program must build the filename for dynamic libraries in an
//          internal buffer.  However, the combined length of the path and 
//          the library overflowed this buffer.
// *Action: If at all possible shorten the name of either the path or the
//          library itself.  If not possible, contact CORE to get this limit
//          increased.
00276, 00000, "A compatible version of library %s could not be found."
// *Cause:  On SunOS, it was possible to find some version of the requested
//          library, but the major version numbers were not compatible.
// *Action: Make sure the correct version of the library is installed.
/
/ Errors related to the spawning mechanism
/
00300, 00000, "Could not pass arguments to spawned program %s."
// *Cause:  One program tried to call another using the spawning mechanism.
//          However, when it tried to pass the arguments over, something went
//          wrong.  This may mean the program to spawn could not be found.
// *Action: Make sure the spawned program can be located in the correct place.
/
/
/  LPM Internal errors
/
/
// 000001, 	""
// 
// *Cause:	
//
// *Action:
//
// 000010,	"Invalid call stack structure or stack element pointer"
// *Cause:  	A call to lpmcspu() had failed.
//              Invalid call stack structure or stack element pointer 
//		are passed into lpmcspu(). 
//		Check primary context.
// *Action: 	Contact development service
//
//
// 000011,	"Invalid call stack structure pointer"
// *Cause:  	A call to lpmcspo() had failed.
//              Invalid call stack structure is passed into lpmcspo(). 
//		Check primary context.
// *Action: 	Contact development service
//
//
// 000030,	"Invalid list structure pointer"
// *Cause:  	A call to lpmllne() had failed.
//              Invalid list structure pointers are passed into lpmllne(). 
//		Check primary context.
// *Action: 	Contact development service
//
//
// 000060,	"Invalid list structure pointer"
// *Cause:  	A call to lpmllne() had failed.
//              Invalid list structure pointers are passed into lpmllne(). 
//		Check primary context.
// *Action: 	Contact development service
//
// 000090,	"Invalid list structure pointer"
// *Cause:  	A call to lpmllne() had failed.
//              Invalid list structure pointers are passed into lpmllne(). 
//		Check primary context.
// *Action: 	Contact development service
//
// 000091,	"Invalid list structure or list element pointer"
// *Cause:  	A call to lpmllae() had failed.
//              Invalid list structure pointers are passed into lpmllae(). 
//		Check primary context.
// *Action: 	Contact development service
//
//
// 000092,	"Invalid list structure or list element pointer"
// *Cause:  	A call to lpmllre() had failed.
//              Invalid list structure pointers are passed into lpmllre(). 
//		Check primary context.
// *Action: 	Contact development service
//
//
// 000150,	"Invalid list structure pointer"
// *Cause:  	A call to lpmllne() had failed.
//              Invalid list structure pointers are passed into lpmllne(). 
//		Check primary context.
// *Action: 	Contact development service
//
// 000160,	"List element not found"
// *Cause:  	A call to lpmllmem() had failed.
//          
// *Action: 	Contact development service
//
//
// 000170,	"Stack element not found"
// *Cause:  	A call to lpmcsmem() had failed.
//          
// *Action: 	Contact development service
//


