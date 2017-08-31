/
/ $Header: lhtus.msg 19-jun-2003.17:48:07 Exp $
/
/
/  Copyright (c) 1996, 2003, Oracle.  All rights reserved.
/        
/   NAME
/      lhtus.msg - LHT US language error message file
/   DESCRIPTION
/      Error message file for LHT package.
/   NOTES
/      None.
/
/
/ LHT Error Messages
/
/
// 00000, 00000, "Normal, successful completion."
// *Cause:  	Normal exit
//
// *Action: 	None
//
/
/
/ Generic errors 
/
/
00003, 00000, "Internal exception code. icode = [%s], [%s]."
// *Cause:  	Unknown - indicated by parameters. The first parameter gives
//	    	the internal exception code; the second is for any other
//	    	additional comments. 
//
// *Action: 	Report to the appropriate development group.
//
//
00006, 00000, "Invalid argument to an LHT function: %s"
// *Cause:	The function was called with an invalid argument.
//              The exception parameter gives the argument index.
//
// *Action: 	Check the function call and pass correct 
//		arguments to the LHT function.
//
//
00009, 00000, "Callback returned failure: %s."
// *Cause:  	The callback function returns an error. The parameter
//		is the failure value returned by the callback function.
//          
// *Action: 	Use failure value in the parameter to identify the nature
//              of the error that occurred in the callback.
//
//
00012, 00000, "Duplicate key %s."
// *Cause:  	The new key is equal to a key already in the table.
//              The parameter giving the exsting value associated with the
//              key is intended for code that handles the DUPKEY exception
//              and is unlikely to be useful in a message string.
//	    	
// *Action: 	Branch to code that handles the duplicate-key condition.
//
//	    	
00015, 00000, "Empty table, or previous call yielded last entry."
// *Cause:  	The table is empty or previous call yielded the last entry.
//          
// *Action: 	Proceed to code that is to be executed after iteration
//              completes.
//
//	    	
00018, 00000, "A read-only iteration is in progress."
// *Cause:  	An attempt to modify the table while read-only iteration is
//              in progress.
//          
// *Action: 	End iteration before attempting to modify the table.
//
//	    	
00021, 00000, "No iteration is in progress."
// *Cause:  	An attempt to yield an entry or end iteration when an
//              iteration is not in progress.
//          
// *Action: 	Begin an iteration before attempting to yield an entry or
//              end an iteration.
//
//	    	
00024, 00000, "Out of memory."
// *Cause:  	There is not enough memory available to perform a
//              table operation that requires additional memory.
//
// *Action: 	Perform whatever actions you wish to make more memory available
//		to the running program.
//
//
00027, 00000, "Key not found in hash table."
// *Cause:  	The key is not in the table.
//          
// *Action: 	Branch to code that handles the not-found condition.
//
//	    	
00030, 00000, "Error in mutex locking."
// *Cause:	Initialization or destruction of a mutex failed.
//
// *Action: 	Contact the appropriate development group.
//
/
/
/ LHT Internal errors
/
/
// 000001,	"The key in the table is not found in function %s"
// *Cause:  	LHT fails to find the index in the table of a key
//              which is in fact in the table.
//
// *Action: 	Contact the appropriate development organization.
//          
