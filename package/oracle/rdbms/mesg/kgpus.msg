/KG Platform Error Message File
/    MODIFIED (MM/DD/YY)
/    klcheung  09/28/99 - adding parameter file error
/    mramache  07/06/99 - add kgmgr messages
/    mramache  05/05/99 - add code compatability error                         
/    mramache  04/15/99 -                                                      
/    mramache  04/14/99 - add slos related error codes                         
/    mramache  04/06/99 - add more messages                                    
/    mramache  04/30/99 - created
/
/ Errors 
/
/
/ 001 - 200 non-error messages for use by KGMGR utility
/
// KGP_ARGS
00004, 00000, "inst = \"%s\" app = \"%s\" home = \"%s\""
// KGP_BAD_ARGS
00005, 00000, "Error: invalid arguments to kgmgr" 
// KGP_USAGE
00006, 00000, "usage: KGMGR <inst name> <app name> <home name> [KEY=key] [IFILE=file name | command]"
// KGP_CONNECTED
00007, 00000, "Connected to instance"
// KGP_NO_PARAMS
00008, 00000, "Error: no parameter file specified"
// KGP_LRM_CTX_FAIL
00009, 00000, "Error: startup failed while getting LRM context"
// KGP_LRM_DESC_FAIL
00010, 00000, "Error: startup failed during get LRM descriptors"
// KGP_LRM_PROC_FAIL
00011, 00000, "Error: startup failed processing parameters"
// KGP_STARTED
00013, 00000, "Instance started"
// KGP_SHUT_USAGE
00014, 00000, "usage: SHUTDOWN [NORMAL | ABORT]"
// KGP_SHUT_ABORT
00015, 00000, "Instance shutdown with shutdown abort"
// KGP_SHUT_NORMAL
00016, 00000, "Instance shutdown normally"
// KGP_BAD_STAT
00018, 00000, "Invalid input to STAT"
// KGP_INVALID
00021, 00000, "Error: invalid command. 'help' for help"
// KGP_PROMPT
00022, 00000, "KGMGR> "
// KGP_CTRHEAD
00023, 00000, "CONNECTED THREAD STATISTICS"
// KGP_TSOADDR
00024, 00000, "TSO ADDR"
// KGP_ASOADDR
00025, 00000, "ASO ADDR"
// KGP_PID
00026, 00000, "PID"
// KGP_PWID
00027, 00000, "P/WID"
// KGP_TSOIDX
00028, 00000, "TSO IDX"
// KGP_VERSION
00029, 00000, "VER"
// KGP_FLAGS
00030, 00000, "FLAGS"
// KGP_MPRHEAD
00031, 00000, "MAPPED PROCESS STATISTICS"
// KGP_ASOIDX
00032, 00000, "ASO IDX"
// KGP_MODE
00033, 00000, "MODE"
// KGP_LADHEAD
00034, 00000, "LATCH DESCRIPTORS"
// KGP_LATCHNAME
00035, 00000, "LATCH NAME"
// KGP_ADDR
00036, 00000, "ADDR"
// KGP_LEVEL
00037, 00000, "LVL"
// KGP_LAOHEAD
00038, 00000, "LATCH OBJECTS"
// KGP_NUM
00039, 00000, "NUM"
// KGP_NOWAIT
00040, 00000, "GOT NOWAIT"
// KGP_WAIT
00041, 00000, "GOT WAIT"
// KGP_FAILNOWAIT
00042, 00000, "FAIL NOWAIT"
// KGP_FAILFIRST
00043, 00000, "FAIL FIRST TRY"
// KGP_WAKES
00044, 00000, "WAKES"
// KGP_SLEPTONFAIL
00045, 00000, "SLEPT ON FAIL"
// KGP_SLEPTWLATCH
00046, 00000, "SLEPT W/ LATCH"
// KGP_BUCKET1
00047, 00000, "BUCKET 1"
// KGP_BUCKET2
00048, 00000, "BUCKET 2"
// KGP_BUCKET3
00049, 00000, "BUCKET 3"
// KGP_BUCKET4
00050, 00000, "BUCKET 4"
// KGP_CHILDNUM
00051, 00000, "CHILD #"
//KGP_CTX
00052, 00000, "CTX"
// KGP_WHYHELD
00053, 00000, "WHY HELD"
// KGP_LAHHEAD
00054, 00000, "LATCH HOLDERS"
// KGP_EVDHEAD
00055, 00000, "EVENT DESCRIPTORS"
// KGP_EVENTNAME
00056, 00000, "EVENT NAME"
// KGP_PARAMETER1
00057, 00000, "PARAMETER 1"
// KGP_PARAMETER2
00058, 00000, "PARAMETER 2"
// KGP_PARAMETER3
00059, 00000, "PARAMETER 3"
// KGP_EVIHEAD
00060, 00000, "EVENT STATISTICS"
// KGP_MAXWAIT
00061, 00000, "MAX WAIT"
// KGP_NUMWAITS
00062, 00000, "# WAITS"
// KGP_NUMTIMEOUTS
00063, 00000, "# TIMEOUTS"
// KGP_TOTALWAIT
00064, 00000, "TOTAL WAIT"
// KGP_CCSHEAD
00065, 00000, "CURSOR CACHE STATISTICS"
// KGP_OPENS
00066, 00000, "OPENS"
// KGP_HITS
00067, 00000, "HITS"
// KGP_LCSHEAD
00068, 00000, "KGL CACHE STATISTICS"
// KGP_NAMESPACE
00069, 00000, "NAMESPACE"
// KGP_GETS
00070, 00000, "GETS"
// KGP_GETHITS
00071, 00000, "GET HITS"
// KGP_PINS
00072, 00000, "PINS"
// KGP_PINHITS
00073, 00000, "PIN HITS"
// KGP_RELOADS
00074, 00000, "RELOADS"
// KGP_INVALIDATIONS
00075, 00000, "INVALIDATIONS"
// KGP_VALUE
00076, 00000, "VALUE"
// KGP_PINADDR
00077, 00000, "PIN ADDR"
// KGP_SPAHEAD
00078, 00000, "SYSTEM PARAMETERS"
// KGP_PARAMNAME
00079, 00000, "PARAMETER NAME"
// KGP_LOBHEAD
00080, 00000, "LIBRARY CACHE OBJECTS"
// KGP_HANDLEADDR
00081, 00000, "HANDLE ADDR"
// KGP_PARENTHANDLE
00082, 00000, "PARENT HANDLE"
// KGP_OWNER
00083, 00000, "OWNER"
// KGP_DBLINK
00084, 00000, "DB LINK NAME"
// KGP_HASH
00085, 00000, "HASH"
// KGP_TIME
00086, 00000, "TIMESTAMP"
// KGP_PREVTIME
00087, 00000, "PREV TIME"
// KGP_LOCKMODE
00088, 00000, "LOCK MODE"
// KGP_PINMODE
00089, 00000, "PIN MODE"
// KGP_HANDLEFLAGS
00090, 00000, "HANDLE FLAGS"
// KGP_OBJADDR
00092, 00000, "OBJ ADDR"
// KGP_NUMLOADS
00093, 00000, "# LOADS"
// KGP_NUMEXECS
00094, 00000, "# EXECS"
// KGP_NUMLOCKS
00095, 00000, "# LOCKS"
// KGP_PINMASK
00096, 00000, "PIN MASK"
// KGP_LOADMASK
00097, 00000, "LOAD MASK"
// KGP_ALLOCATEMASK
00098, 00000, "ALLOCATE MASK"
// KGP_STATUS
00099, 00000, "STATUS"
// KGP_TYPE
00100, 00000, "TYPE"
// KGP_HEAPSPACE
00101, 00000, "HEAP SPACE"
// KGP_HEAPDESCADDR
00102, 00000, "HEAP DESC ADDR"
// KGP_LLKHEAD
00103, 00000, "LIBRARY CACHE LOCKS"
// KGP_LOCKADDR
00104, 00000, "LOCK ADDR"
// KGP_USERADDR
00105, 00000, "USER ADDR"
// KGP_SESSADDR
00106, 00000, "SESS ADDR"
// KGP_CALLPINADDR
00107, 00000, "CALL PIN ADDR"
// KGP_REFCOUNT
00108, 00000, "REF COUNT"
// KGP_MODEREQUEST
00109, 00000, "MODE REQUESTED"
// KGP_SAVEPOINT
00110, 00000, "SAVEPOINT"
// KGP_SESSPINADDR
00111, 00000, "SESS PIN ADDR"
// KGP_LPNHEAD
00112, 00000, "LIBRARY CACHE PINS"
// KGP_DATAMASK
00113, 00000, "DATA MASK"
// KGP_LDPHEAD
00114, 00000, "LIBRARY CACHE DEPENDENCIES"
// KGP_PARENTADDR
00115, 00000, "PARENT ADDR"
// KGP_DEPNUM
00116, 00000, "DEP NUM"
// KGP_DEPHANDLE
00117, 00000, "DEP HANDLE"
// KGP_DEPOBJ
00118, 00000, "DEP OBJ"
// KGP_REFPOS
00119, 00000, "POS OF REF"
// KGP_DEPHASH
00120, 00000, "DEPENDED ON HASH"
// KGP_SGAHEAD
00121, 00000, "SGA HEAP CLASSES"
// KGP_CLASSNAME
00122, 00000, "HEAP CLASS NAME"
// KGP_RECREATE
00123, 00000, "RECREATABLE"
// KGP_SIZE
00124, 00000, "SIZE"
// KGP_SGASTATS
00125, 00000, "FREE SHARED POOL: %.0d"
// KGP_RPC_CLIENT_FAIL
00126, 00000, "Error: RPC client failed to initialize"
// KGP_RPC_CONNECT_FAIL
00127, 00000, "Error: RPC client failed to connect"
// KGP_NOT_CONNECTED
00128, 00000, "Error: Not connected to instance"
// KGP_KGUPN_EMEM
00129, 00000, "RPC client error: out of memory"
// KGP_KGUPN_ESEND_PID
00130, 00000, "RPC client error: error sending pid"
// KGP_KGUPN_ESEND_INPUT
00131, 00000, "RPC client error: error sending input"
// KGP_KGUPN_ERC_OUTPUT
00132, 00000, "RPC client error: error receiving output"
// KGP_HELP0
00133, 00000, "Commands:"
// KGP_HELP1
00134, 00000, "  STARTUP PFILE=param file: Startup instance"
// KGP_HELP2
00135, 00000, "  CONNECT: Connect to instance"
// KGP_HELP3
00136, 00000, "  SHUTDOWN [NORMAL | ABORT]: Shutdown instance (default normal)"
// KGP_HELP4
00137, 00000, "  SET 'event name':  Set an event"
// KGP_HELP5
00138, 00000, "  STAT stat name [+str to include] [-str to exclude]: Print statistics"
// KGP_HELP7
00139, 00000, "  HELP STAT for list of statistics"
// KGP_STAT_HELP0
00140, 00000, "Statistics:"
// KGP_STAT_HELP1
00141, 00000, "  CC: cursor cache statistics"
// KGP_STAT_HELP2
00142, 00000, "  EVENT: event statistics"
// KGP_STAT_HELP3
00143, 00000, "  ASO: address space objects"
// KGP_STAT_HELP4
00144, 00000, "  THREAD: connected threads"
// KGP_STAT_HELP5
00145, 00000, "  LATCHDS: latch descriptors"
// KGP_STAT_HELP6
00146, 00000, "  LATCHOB: latch object statistics"
// KGP_STAT_HELP7
00147, 00000, "  LATCHHOLD: latch holders"
// KGP_STAT_HELP8
00148, 00000, "  EVENTDS: event descriptors"
// KGP_STAT_HELP9
00149, 00000, "  KGL: library cache statistics"
// KGP_STAT_HELP10
00150, 00000, "  SYSPARAM: system parameters"
// KGP_STAT_HELP11
00151, 00000, "  SGA : SGA usage"
// KGP_STAT_HELP12
00152, 00000, "  KGLOB: library cache objects"
// KGP_STAT_HELP13
00153, 00000, "  LOCK: library cache locks"
// KGP_STAT_HELP14
00154, 00000, "  PIN: library cache pins"
// KGP_STAT_HELP15
00155, 00000, "  DEP: library cache dependencies"
// KGP_ALREADY_STARTED
00156, 00000, "Instance already started"
// KGP_ALREADY_CONNECTED
00157, 00000, "Already connected to instance"
// KGP_EVENT_SET
00158, 00000, "Event set"
// KGP_IFILE_AND_CMD
00159, 00000, "Error: cannot process command file and command line arguments"
// KGP_IFILE_OPEN
00160, 00000, "Error: failed opening command file"
// KGP_IFILE_FAIL
00161, 00000, "Error: failed obtaining input"
// KGP_KILLED
00162, 00000, "Instance process killed"
// KGP_PDISCON_ERROR
00163, 00000, "Error while disconnecting process:"
// KGP_TDISCON_ERROR
00164, 00000, "Error while disconnecting thread:"
// KGP_HELP6
00165, 00000, "  KILL: kill the process running the instance (threaded model only)"
// KGP_PFILE_OPEN
00166, 00000, "Error: failed opening parameter file"
// KGP_PFILE_READ
00167, 00000, "Error: failed reading from parameter file"
// KGP_PSTRING_ALLOC
00168, 00000, "Error: could not allocate memory for parameter startup string"

/
/
/  Error messages for KG Platform components
/
/ 201 - 250 Thread related errors (kgupt)
/ 
00201, 00000, "Too many threads connected"
// *Cause:  The limit for threads connected from a single process has
//          been exceeded.
// *Action: Adjust the THREADS initialization parameter.
00202, 00000, "Process has been aborted"
// *Cause:  An internal error has occured and put the process into
//          an inconsistent state.
// *Action: Restart the process.
00203, 00000, "Process is aborted"
// *Cause:  The process is in an inconsistent state.
// *Action: Restart the process.
00204, 00000, "Failed to connect thread: thread already connected"
// *Cause:  An attempt was made to connect a connected thread.
// *Action: None. 
00205, 00000, "Failed to disconnect thread: thread already disconnected"
// *Cause:  An attempt was made to disconnect a disconnected thread.
// *Action: None. 
00206, 00000, "Threads still connected"
// *Cause:  An attempt was made to disconnect a process while threads
//          were still connected to the instance.
// *Action: None. 
00208, 00000, "User interrupt"
// *Cause:  The current operation was interrupted by the user.
// *Action: None. 
00209, 00000, "Incorrect process group"
// *Cause:  An internal error occurred.
// *Action: None.
00211, 00000, "Invalid connection context"
// *Cause:  The thread connection context is in an inconsistent state.
// *Action: This is an internal failure. 
00212, 00000, "Failed to clean thread during disconnect"
// *Cause:  The state associated with a thread wasn't cleaned up properly 
//          during a thread disconnect operation.
// *Action: This is an internal failure.
/
/ 251 - 300 Process related errors (kgupa)
/
00251, 00000, "Process not initialized"
// *Cause:  The current process is not properly initialized.
// *Action: This is an internal failure.
00252, 00000, "Process not connected"
// *Cause:  Current operation cannot be performed unless the process is
//          connected to a server instance.
// *Action: Set the parameter before starting the server.
00253, 00000, "Failed to attach to SGA"
// *Cause:  A failure occurred while attaching to the SGA.
// *Action: See next error on error stack.
00254, 00000, "Too many processes"
// *Cause:  The value set for PROCESSES has been exceeded.
// *Action: Set the parameter and restart the instance.
00255, 00000, "Shutdown in Progress"
// *Cause:  The instance is currently being shut down.
// *Action: Try to connect after the instance has been restarted.
00256, 00000, "Failed to detach SGA"
// *Cause:  A failure occurred while detaching SGA.
// *Action: See next error on error stack.
00257, 00000, "Process moved to aborted state"
// *Cause:  Process is in an inconsistent state and cannot be recovered.
// *Action: Exit process and restart a new one.
00258, 00000, "Failed to connect process : process already connected"
// *Cause:  Attempt to connect a process that is already connected.
// *Action: None.
00259, 00000, "Failed to disconnect process : process already disconnected"
// *Cause:  Attempt to disconnect a process that is already disconnected.
// *Action: None.
00260, 00000, "Failed to initialize process : process already initialized"
// *Cause:  Attempt to initialize a process that is already initialized.
// *Action: None.
00261, 00000, "Failed to spawn cleanup process"
// *Cause:  The global cleanup process didn't properly start.
// *Action: See next error on error stack.
00262, 00000, "Startup in progress"
// *Cause:  The instance is currently being started.
// *Action: Try to connect later. 
00263, 00000, "Process is in an aborted state"
// *Cause:  Process is in an inconsistent state and cannot be recovered.
// *Action: Exit process and restart a new one.
00264, 00000, "Process initialize failed : another process initialize in progress"
// *Cause:  Another call to initialize the process is currently active.
// *Action: None. 
/
/ 301 - 350  LGA related errors  (kgupg)
/
00301, 00000, "internal error: SKGM initialization failed"
// *Cause:  An internal failure due to failed memory initialization.
// *Action: Restart the process. 
00302, 00000, "internal error: LMON thread failed to configure itself"
// *Cause:  The local cleanup thread failed to initialize itself.
// *Action: Restart the process. 
00303, 00000, "internal error: timed out spawning LMON thread"
// *Cause:  The local cleanup thread has taken too long to initialize itself.
// *Action: Restart the process. 
00304, 00000, "internal error: LMON failed to startup"
// *Cause:  The local cleanup process failed to spawn.
// *Action: Restart the process. 
00305, 00000, "internal error: LGA corrupted"
// *Cause:  An internal failure due to corrupted process memory.
// *Action: Restart the process. 
/
/ 351 - 450  Event parser errors (kgupd)
/
00351, 00000, "event specification syntax error %s (minor error %s) near '%s'"
// *Cause: There is a syntax error in an event specification.
// *Action:  Fix the error.
/
/ 451 - 500  Detached thread/process related errors (kgupb)
/
00451, 00000, "Background (%s) did not start"
// *Cause:  A background thread or process failed to start.
// *Action: See following errors on error stack.
00452, 00000, "Background (%s) failed during startup"
// *Cause:  A background thread or process failed to properly start.
// *Action: See following errors on error stack.
00453, 00000, "Background (%s) timed out after %d seconds"
// *Cause:  A background thread or process took too long to initialize.
// *Action: This is an internal error.
00454, 00000, "Unexpected startup of a background"
// *Cause:  A background thread or process was started improperly.
// *Action: This is an internal error.
00455, 00000, "Background terminated normally"
// *Cause:  A background thread or process has ended.
// *Action: None.
00456, 00000, "Too many backgrounds"
// *Cause:  Too many background threads or processes have been started.
// *Action: None.
00457, 00000, "Bad background executable (%s)"
// *Cause:  The name given for the background executable has failed.
// *Action: See following errors on error stack.
/
/ 501 - 550  Memory related errors (kgupm)
/
00501, 00000, "OSD memory services not initialized (error code %s)"
// *Cause:  Look for preceeding errors.
// *Action: This is an internal failure.
00502, 00000, "SGA not mapped"
// *Cause:  The System Global memory is not mapped to the process.
// *Action: This is an internal failure.
00503, 00000, "Failed to create the SGA"
// *Cause:  Look for preceeding errors.
// *Action: Resolve preceeding errors.
00504, 00000, "Failed to find start address of SGA"
// *Cause:  Look for preceeding errors.
// *Action: This is an internal failure.
00505, 00000, "Failed to attach to SGA"
// *Cause:  Look for preceeding errors.
// *Action: Resolve preceeding errors.
00506, 00000, "Failed to initialize OSD memory services"
// *Cause:  Look for preceeding errors.
// *Action: This is an internal failure.
00507, 00000, "Failed to detach from SGA"
// *Cause:  Look for preceeding errors.
// *Action: This is an internal failure.
00508, 00000, "Failed to remove SGA"
// *Cause:  Look for preceeding errors.
// *Action: This is an internal failure.
00509, 00000, "Startup failed : Instance already started"
// *Cause:  An attempt was made to startup an already running instance.
// *Action: None.
00510, 00000, "Failed to allocate SGA"
// *Cause:  Look for preceeding errors.
// *Action: Resolve preceeding errors.
/
/ 551 - 559  Initialization parameter errors (kgupp)
/
00551, 00000, "Non-existent initialization parameter (%s)"
// *Cause:  A invalid initialization parameter name was used to start
//          the instance.
// *Action: Remove the reference to the invalid parameter.
00552, 00000, "Invalid initialization parameter value type (%s)"
// *Cause:  The wrong data type was used for a parameter value.
// *Action: Specify the parameter using the correct datatype.
00553, 00000, "Initialization parameter value out of range (%s)"
// *Cause:  The value specified for a parameter is not within the required
//          range.
// *Action: Change the parameter to an appropriate value.
00554, 00000, "Parse error for Parameter value (%s)"
// *Cause:  A values specified for a string valued parameter has
//          incorrect syntax.
// *Action: Correct the value of the parameter.
00555, 00000, "Mandatory initialization parameter (%s) not specified"
// *Cause:  The specified parameter must be set before starting the instance.
// *Action: Give a value for the parameter.
/
/ 600 - 625  Special error codes
/
00600, 00000, "internal error code, arguments: [%s], [%s], [%s], [%s], [%s], [%s], [%s], [%s]"
// *Cause:  This is the generic internal error number for program
//	   exceptions.	This indicates that a process has encountered an
//	   exceptional condition.
// *Action: Report as a bug - the first argument is the internal error number
00603, 00000, "Server session terminated by fatal error"
// *Cause:  An server session is in an unrecoverable state.
// *Action: Login to the server again so a new server session will be created
//          automatically.  Examine the session trace file for more
//          information.
/
/ 625 - 650  Iterator errors (kgupq)
/
/
/ 651 - 700  General Platform errors (kgup)
/
00651, 00000, "Startup failed"
// *Cause:  An attempt to start the server instance failed.
// *Action: See following errors on error stack.
00652, 00000, "Bad service function vector"
// *Cause:  Product passed a bad initialization structure to KG Platform.
// *Action: This is an internal error.
00653, 00000, "Invalid configuration mode"
// *Cause:  Server started using an invalid configuration option.
// *Action: This is an internal error.
00654, 00000, "Process initialization failed"
// *Cause:  An error occurred during the process init call.
// *Action: See following errors on error stack.
00655, 00000, "Initialization of startup context failed"
// *Cause:  An error occurred during the startup init call.
// *Action: See following errors on error stack.
00656, 00000, "Failed to build initialization parameter descriptor (LRM)"
// *Cause:  An error occurred during the LRM descriptor get call.
// *Action: See following errors on error stack.
00657, 00000, "Invalid startup context"
// *Cause:  The startup context was not properly initialized. 
// *Action: This is an internal error.
00658, 00000, "Failed to process initialization parameters"
// *Cause:  Initialization parameter processing failed. 
// *Action: See following errors on error stack. 
00659, 00000, "Failed to set initialization parameter"
// *Cause:  Initialization parameter processing failed. 
// *Action: See following errors on error stack. 
00660, 00000, "Failed to cleanup startup context"
// *Cause:  Freeing state associated with instance startup failed.
// *Action: See following errors on error stack.
00661, 00000, "Failed to connect process"
// *Cause:  The thread/process failed to connect to the instance.
// *Action: See following errors on error stack.
00662, 00000, "Failed to connect thread"
// *Cause:  The thread/process failed to connect to the instance.
// *Action: See following errors on error stack.
00663, 00000, "Thread not connected"
// *Cause:  The thread/process is not connected to the instance.
// *Action: Try operation again when properly connected.
00664, 00000, "Thread disconnect failed"
// *Cause:  The thread/process failed to disconnect from the instance.
// *Action: See following errors on error stack.
00665, 00000, "Process disconnect failed"
// *Cause:  The thread/process failed to disconnect from the instance.
// *Action: See following errors on error stack.
00666, 00000, "Shutdown failed"
// *Cause:  An attempt to shutdown the server instance failed.
// *Action: See following errors on error stack.
00667, 00000, "NULL instance name not supported"
// *Cause:  All components of the instance name provided were null. 
// *Action: Reattempt operation with a valid instance name.
00668, 00000, "Code version mismatch with running instance"
// *Cause:  The executable attaching to the instance has a different
//          code version than the executable that started the instance.
// *Action: Stop and restart the instance with a compatable executable, or
//          relink the attaching executable.
00669, 00000, "internal error: timed out spawning KGMGR listener thread"
// *Cause:  The KGMGR listener thread has taken too long to initialize itself.
// *Action: Restart the process.
00670, 00000, "internal error: KGMGR listener thread failed to startup"
// *Cause:  The KGMGR listener thread failed to spawn.
// *Action: Restart the process.
/
/ 701 - 750  Error management errors (kgupe)
/
00701, 00000, "Following error occurred while process not initialized KGP-%d"
// *Cause:  The noted error occured while the error management system
//          was not initialized.
// *Action: Look in the error manual for the error message text.
/
/ The errors for SKGM and SKGP were copied from oraus.msg.  These are generic
/  OSDs with fixed error codes.
/ 27100 - 27139 keep for SKGM
/
27100, 00000, "shared memory realm already exists"
// *Cause: Tried to start duplicate instances, or tried to restart an
//         instance that had not been properly shutdown
// *Action: Use a different instance name, or cleanup the failed instance's
//          SGA
27101, 00000, "shared memory realm does not exist"
// *Cause: Unable to locate shared memory realm
// *Action: Verify that the realm is accessible
27102, 00000, "out of memory"
// *Cause: Out of memory
// *Action: Consult the trace file for details
27103, 00000, "internal error"
// *Cause: internal error
// *Action: contact Oracle support
27120, 00000, "unable to removed shared memory segment"
// *Cause: shmctl() call failed
// *Action: check permissions on segment, contact Oracle support
27121, 00000, "unable to determine size of shared memory segment"
// *Cause: shmctl() call failed
// *Action: check permissions on segment, contact Oracle support
27122, 00000, "unable to protect memory"
// *Cause: mprotect() call failed
// *Action: contact Oracle support
27123, 00000, "unable to attach to shared memory segment"
// *Cause: shmat() call failed
// *Action: check permissions on segment, contact Oracle support
27124, 00000, "unable to detach from shared memory segment"
// *Cause: shmdt() call failed
// *Action: contact Oracle support
27125, 00000, "unable to create shared memory segment"
// *Cause: shmget() call failed
// *Action: contact Oracle support
27126, 00000, "unable to lock shared memory segment in core"
// *Cause: insufficient privileges to lock shared memory segment in core
// *Action: make sure process is running with necessary privileges.
27127, 00000, "unable to unlock shared memory segment"
// *Cause: insufficient privileges to unlock shared memory segment
// *Action: make sure process is running with necessary privileges.
27128, 00000, "unable to determine pagesize"
// *Cause: sysconf() call failed
// *Action: contact Oracle support
/
/ 27140-27189 RESERVED FOR SKGP
/
/ 27140 available
27141, 0000, "invalid process ID"
// *Cause:  process operation attempted using invalid process ID
// *Action: contact Oracle Support
27142, 0000, "could not create new process"
// *Cause:  OS system call
// *Action: check errno and if possible increase the number of processes
27143, 0000, "OS system call failure"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle support
27144, 0000, "attempt to kill process failed"
// *Cause:  OS system call error
// *Action: check errno and contact Oracle Support
27145, 0000, "insufficient resources for requested number of processes"
// *Cause:  OS system call error
// *Action: check errno and contact Oracle Support
27146, 0000, "post/wait initialization failed"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27147, 0000, "post/wait reset failed"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27148, 0000, "spawn wait error"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27149, 0000, "assignment out of range"
// *Cause:  internal error, requested conversion too large for type
// *Action: contact Oracle Support
27150, 0000, "attempt to notify process of pending oradebug call failed"
// *Cause:  OS system call
// *Action: check errno contact Oracle Support
27151, 0000, "buffer not large enough to hold process ID string"
// *Cause:  internal error
// *Action: contact Oracle Support
27152, 0000, "attempt to post process failed"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27153, 0000, "wait operation failed"
// *Cause:  OS system called failed
// *Action: check errno contact Oracle Support
27154, 0000, "post/wait create failed"
// *Cause:  internal error, multiple post/wait creates attempted simultaneously
// *Action: check errno and contact Oracle Support
27155, 0000, "could not execute file"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27156, 0000, "request for process information failed"
// *Cause:  internal error
// *Action: contact Oracle Support
/ 
/
/ These errors are owned by the Generic Error manager for signalling
/  slos errors.
/    27300 - 27350 reserved for slos Error Reporting
/
27300, 00000, "OS system dependent operation:%s failed with status: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
/
27301, 00000, "OS failure message: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
//
27302, 00000, "failure occurred at: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
//
27303, 00000, "additional information: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
/
