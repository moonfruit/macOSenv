/* Copyright (c) 2002, 2009, Oracle and/or its affiliates.All rights reserved. */
/  
/*  
/   
/   NAME  
/     dgmus.msg - Oracle Data Guard broker command line utility DGMGRL's
/                 message file.
/   DESCRIPTION  
/     Contains error messages and informational messages displayed by DGMGRL.
/   
/------------------------------------------------------------------------------
/  
/ NOTES:  
/   Language      : American  
/   Character set : US7ASCII  
/  
/  
/  
/ MODIFIED       (MM/DD/YY)  
/ nkarkhan        02/19/09 - Update broker command description to match
/                            documentation.
/ jiluo           11/21/08 - Add support for displaying LAG values
/ jiluo           05/28/08 - Change redirect message
/ jiluo           04/07/08 - Change manual operation messages
/ jiluo           11/26/07 - Add more messages
/ jiluo           02/09/07 - Change help text for shutdown
/ nkarkhan        10/06/06 - Message cleanup
/ jiluo           08/30/06 - Change cases related to FSFO
/ sthlee          04/19/06 - Add help message to support the CONVERT DATABASE 
/                            command 
/ jiluo           09/27/05 - Add message for new siwtchover flow 
/ jiluo           01/11/05 - Add help for start/stop observer 
/ nkarkhan        11/29/04 - Continue message cleanup. 
/ nkarkhan        11/16/04 - Bug 4014462: clean up messages. 
/ mharvey         09/20/04 - clarify output to user - 16952
/ sthlee          06/24/04 - Fix up reinstate message 
/ jiluo           06/11/04 - Add more fast-start failover related messages 
/ jiluo           05/14/04 - More error messages for automatic failover
/ jiluo           03/25/04 - Add error messages to support automatic failover 
/ mharvey         04/07/03 - General update for 10i
/ jiluo           10/16/02 - Support connect redirection
/ jiluo           10/09/02 - Change error messages
/ jiluo           09/04/02 - Add REMOVE INSTANCE message
/ jiluo           08/21/02 - Add help for prepare command
/ jiluo           08/12/02 - Add/change error message
/ jiluo           07/17/02 - Add new messages
/ jiluo           05/23/02 - jiluo_mesg_dgm
/ jiluo           05/16/02 - Creation
/*/  

/
05000, 00000, "Configuration Status:"
// *Document: NO
// *Cause:
// *Action:
/
05001, 00000, "ERROR"
// *Document: NO
// *Cause:
// *Action:
/
05002, 00000, "Primary database"
// *Document: NO
// *Cause:
// *Action:
/
05003, 00000, "Physical standby database"
// *Document: NO
// *Cause:
// *Action:
/
05004, 00000, "Logical standby database"
// *Document: NO
// *Cause:
// *Action:
/
05005, 00000, "Snapshot standby database"
// *Document: NO
// *Cause:
// *Action:
/
05006, 00000, "Physical standby database (disabled)"
// *Document: NO
// *Cause:
// *Action:
/
05007, 00000, "Logical standby database (disabled)"
// *Document: NO
// *Cause:
// *Action:
/
05008, 00000, "Snapshot standby database (disabled)"
// *Document: NO
// *Cause:
// *Action:
/
05009, 00000, "Fast-Start Failover target"
// *Document: NO
// *Cause:
// *Action:
/
05010, 00000, "Database Status:"
// *Document: NO
// *Cause:
// *Action:
/
05011, 00000, "Database Error(s):"
// *Document: NO
// *Cause:
// *Action:
/
05012, 00000, "Database Warning(s):"
// *Document: NO
// *Cause:
// *Action:
/
05013, 00000, "Instance Status:"
// *Document: NO
// *Cause:
// *Action:
/
05014, 00000, "Instance Error(s):"
// *Document: NO
// *Cause:
// *Action:
/
05015, 00000, "Instance Warning(s):"
// *Document: NO
// *Cause:
// *Action:
/
05016, 00000, "Transport Lag:"
// *Document: NO
// *Cause:
// *Action:
/
05017, 00000, "Apply Lag:"
// *Document: NO
// *Cause:
// *Action:
/
05018, 00000, "day(s)"
// *Document: NO
// *Cause:
// *Action:
/
05019, 00000, "hour(s)"
// *Document: NO
// *Cause:
// *Action:
/
05020, 00000, "minute"
// *Document: NO
// *Cause:
// *Action:
/
05021, 00000, "second"
// *Document: NO
// *Cause:
// *Action:
/
05022, 00000, "seconds"
// *Document: NO
// *Cause:
// *Action:
/
05023, 00000, "Role:"
// *Document: NO
// *Cause:
// *Action:
/
05024, 00000, "Intended State:"
// *Document: NO
// *Cause:
// *Action:
/
05025, 00000, "Real Time Query:"
// *Document: NO
// *Cause:
// *Action:
/
05026, 00000, "Instance(s):"
// *Document: NO
// *Cause:
// *Action:
/
05027, 00000, "Database - %s"
// *Document: NO
// *Cause:
// *Action:
/
05028, 00000, "Enterprise Manager Name:"
// *Document: NO
// *Cause:
// *Action:
/
05029, 00000, "Host Name:"
// *Document: NO
// *Cause:
// *Action:
/
05030, 00000, "(apply instance)"
// *Document: NO
// *Cause:
// *Action:
/
05031, 00000, "Instance '%s' of database '%s'"
// *Document: NO
// *Cause:
// *Action:
/
05032, 00000, "Properties:"
// *Document: NO
// *Cause:
// *Action:
/
05033, 00000, "Configuration - %s"
// *Document: NO
// *Cause:
// *Action:
/
05034, 00000, "Protection Mode:"
// *Document: NO
// *Cause:
// *Action:
/
05035, 00000, "Databases:"
// *Document: NO
// *Cause:
// *Action:
/
05036, 00000, "Fast-Start Failover:"
// *Document: NO
// *Cause:
// *Action:
/
05037, 00000, "Threshold:"
// *Document: NO
// *Cause:
// *Action:
/
05038, 00000, "(unknown)"
// *Document: NO
// *Cause:
// *Action:
/
05039, 00000, "Target:"
// *Document: NO
// *Cause:
// *Action:
/
05040, 00000, "(none)"
// *Document: NO
// *Cause:
// *Action:
/
05041, 00000, "Observer:"
// *Document: NO
// *Cause:
// *Action:
/
05042, 00000, "Lag Limit:"
// *Document: NO
// *Cause:
// *Action:
/
05043, 00000, " (not in use)"
// *Document: NO
// *Cause:
// *Action:
/
05044, 00000, "Shutdown Primary:"
// *Document: NO
// *Cause:
// *Action:
/
05045, 00000, "Auto-reinstate:"
// *Document: NO
// *Cause:
// *Action:
/
05046, 00000, "Health Conditions:"
// *Document: NO
// *Cause:
// *Action:
/
05047, 00000, "Oracle Error Conditions:"
// *Document: NO
// *Cause:
// *Action:
/
05048, 00000, "Configurable Failover Conditions"
// *Document: NO
// *Cause:
// *Action:
/
05049, 00000, "minutes"
// *Document: NO
// *Cause:
// *Action:
/
05050, 00000, "hours"
// *Document: NO
// *Cause:
// *Action:
/
05051, 00000, "days"
// *Document: NO
// *Cause:
// *Action:
/

16900, 00000, "Unable to initialize client"
// *Cause:  The client could not be initialized.
// *Action: This is an internal error. Contact Oracle Support Services.
/
16901, 00000, "Unable to initialize environment"
// *Cause:  The database environment could not be allocated and initialized.
// *Action: This is an internal error. Contact Oracle Support Services.
/
16902, 00000, "Unable to allocate handle"
// *Cause:  The database handle could not be allocated.
// *Action: This is an internal error. Contact Oracle Support Services.
/
16903, 00000, "Unable to connect to database"
// *Cause:  The specified database was unreachable because it did not
//          exist or was not started. 
// *Action: Start the database or validate network connections and try again.
/
16904, 00000, "Unable to set attribute"
// *Cause:  The server attributes could not be set.
// *Action: Check additional error messages.
/
16905, 00000, "Failed."
// *Cause:  The command failed to execute.
// *Action: Check additional error messages.
/
16906, 00000, "Unable to accept commands: no memory"
// *Cause:  No memory was available for the attempted operation.
// *Action: Check your system and retry the command.
/
16907, 00000, "Operation requires shutdown of instance \"%s\" on database \"%s\""
// *Document: NO
// *Cause:  
// *Action: 
/
16908, 00000, "Operation requires startup of instance \"%s\" on database \"%s\""
// *Document: NO
// *Cause:  
// *Action: 
/
16909, 00000, "Fatal error - quitting..."
// *Cause:  A fatal error was encountered.
// *Action: See additional error messages and/or contact Oracle Support
//          Services.
/
16910, 00000, "Unable to issue command to server"
// *Cause:  Command could not be issued to the server.
// *Action: See additional error messages and/or contact Oracle Support
//          Services.
/
16911, 00000, "WARNING"
// *Document: NO
// *Cause:
// *Action:
/
16912, 00000, "Unrecognized command \"%s\", try \"help\""
// *Cause:  An unrecognized command was issued.
// *Action: Try again using a valid command.
/
16913, 00000, "The following commands are available:"
// *Document: NO
// *Cause:  
// *Action: 
/
16914, 00000, "Shutting down instance \"%s\"..."
// *Document: NO
// *Cause:  
// *Action: 
/
16915, 00000, "Connected."
// *Document: NO
// *Cause:  
// *Action: 
/
16916, 00000, "Missing site name, try \"help\""
// *Cause:  The site name is missing from the command.
// *Action: Try the command again using correct syntax.
/
16917, 00000, "Please complete the following steps to finish the operation:"
// *Document: NO
// *Cause:  
// *Action: 
/
16918, 00000, "Unknown document type"
// *Document: NO
// *Cause:  An unknown document type was sent to the server.
// *Action: Contact Oracle Support Services.
/
16919, 00000, "Missing document"
// *Document: NO
// *Cause:  No response was received from the server.
// *Action: Contact Oracle Support Services.
/
16920, 00000, "Corrupted document"
// *Document: NO
// *Cause:  A corrupted XML document was returned by the server.
// *Action: Contact Oracle Support Services.
/
16921, 00000, "Succeeded."
// *Document: NO
// *Cause:  The command completed successfully.
// *Action: No action is required.
/
16922, 00000, "Warning: %s"
// *Document: NO
// *Cause:  
// *Action: 
/
16923, 00000, "Error: %s"
// *Document: NO
// *Cause:  
// *Action: 
/
16925, 00000, "Exits the program"
// *Document: NO
// *Cause:  
// *Action: 
/
16926, 00000, "Displays information about a configuration, database, or instance"
// *Document: NO
// *Cause:  
// *Action: 
/
16927, 00000, "Enables a configuration, a database, or fast-start failover"
// *Document: NO
// *Cause:  
// *Action: 
/
16928, 00000, "Disables a configuration, a database, or fast-start failover"
// *Document: NO
// *Cause:  
// *Action: 
/
16929, 00000, "Displays description and syntax for a command"
// *Document: NO
// *Cause:  
// *Action: 
/
16930, 00000, "Adds a standby database to the broker configuration"
// *Document: NO
// *Cause:  
// *Action: 
/
16931, 00000, "Starts an Oracle database instance"
// *Document: NO
// *Cause:  
// *Action: 
/
16932, 00000, "Starting instance \"%s\"..."
// *Document: NO
// *Cause:  
// *Action: 
/
16933, 00000, "Please complete the following steps to finish the convert command:"
// *Document: NO
// *Cause:  
// *Action: 
/
16934, 00000, "\tstart up instance \"%s\" of database \"%s\""
// *Cause:  The operation completed successfully and requires a restart
//          of the specified instance. DGMGRL attempted to restart the
//          instance but was unable to.
// *Action: Start the specified instance manually.
/
16935, 00000, "Switches roles between a primary and standby database"
// *Document: NO
// *Cause:  
// *Action: 
/
16936, 00000, "Changes a standby database to be the primary database"
// *Document: NO
// *Cause:  
// *Action: 
/
16937, 00000, "Connects to an Oracle database instance"
// *Document: NO
// *Cause:  
// *Action: 
/
16938, 00000, "Shuts down a currently running Oracle database instance"
// *Document: NO
// *Cause:  
// *Action: 
/
16939, 00000, "Operation requires a connection to instance \"%s\" on database \"%s\""
// *Document: NO
// *Cause:    The operation required DGMGRL to connect to a specific instance
//            to complete.
// *Action:   Connect to the specified instance and issue the command again.
/
16940, 00000, "Connecting to instance \"%s\"..."
// *Document: NO
// *Cause:
// *Action:
/
16941, 00000, "Switchover succeeded, new primary is \"%s\""
// *Document: NO
// *Cause:  The switchover command completed successfully.
// *Action: No action is required.
/
16943, 00000, "\tconnect to instance \"%s\" of database \"%s\""
// *Cause:  The operation required DGMGRL to connect to a specific instance
//          to complete, but DGMGRL could not automatically connect to the
//          given instance.
// *Action: Connect to the specified instance and issue the command again.
/
16944, 00000, "Failover succeeded, new primary is \"%s\""
// *Cause:  The failover command completed successfully."
// *Action: No action is required.
/
16945, 00000, "Syntax error before or at \"%s\""
// *Cause:  The command could not be processed because of a syntax
//          error in the named token. 
// *Action: Try the command again using valid syntax.
/
16946, 00000, "Site \"%s\" was not found"
// *Cause:  The named site could not be found.
// *Action: Try the command again using a valid site name.
/
16947, 00000, "Performing switchover NOW, please wait..."
// *Document: NO
// *Cause:  
// *Action:
/
16948, 00000, "Unable to switchover, primary database is still \"%s\""
// *Cause:  The switchover operation could not be executed due to the errors
//          reported with this error message. The primary role has not been
//          changed.
// *Action: Correct the errors and try the SWITCHOVER command again.
/
16949, 00000, "Object \"%s\" was not found"
// *Cause:  The named object was not found. 
// *Action: Try the command again using a valid database name.
/
16950, 00000, "Performing failover NOW, please wait..."
// *Document: NO
// *Cause:
// *Action:
/
16951, 00000, "Unable to failover"
// *Cause:  The failover operation could not be executed due to the errors
//          reported with this error message.
// *Action: Correct the errors and try the FAILOVER command again.
/
16952, 00000, "Configuration details cannot be determined by DGMGRL"
// *Cause:  The broker configuration could not be found.
// *Action: 1) The Data Guard broker process (DMON) could not be contacted.
//             Verify that the DMON process is running.
//          2) No broker configuration currently exists. You must create one.
//          3) You are connected to a standby database in the broker
//             configuration that has either been disabled or deleted. While
//             the standby is in this state, the details of the broker
//             configuration are not available on the standby database.
//             Connect to the primary database and reissue the command.
//          4) You are connected to a database in the broker configuration
//             that must be reinstated or reinstantiated. While in this state,
//             details of the broker configuration are not available. Either
//             reinstate or reinstantiate the database and reissue the
//             command, or connect to the primary database and reissue the
//             command.
/
16953, 00000, "XML document is too long"
// *Cause:  The length of the XML document exceeded the internal limit. 
// *Action: This is an internal error. Contact Oracle Support Services.
/
16954, 00000, "Unable to open and lock the Observer configuration file"
// *Cause:  The Observer configuration file cannot be opened or cannot be
//          locked for exclusive access.
// *Action: Make sure the Observer has the correct operating system privileges
//          to write the file and there is no other Observer that is using 
//          the same file. Try the command again.
/
16955, 00000, "SUCCESS"
// *Document: NO
// *Cause:  
// *Action: 
/
16956, 00000, "Done."
// *Document: NO
// *Cause:  
// *Action: 
/
16957, 00000, "SHUTDOWN"
// *Document: NO
// *Cause:  
// *Action: 
/
16958, 00000, "DISABLED"
// *Document: NO
// *Cause:  
// *Action: 
/
16959, 00000, "No response from broker server process"
// *Cause:  No response was received from the broker server process (DMON).
// *Action: The Data Guard broker process (DMON) is not available. Verify
//          that the DMON process is running and retry the command.
/
16960, 00000, "Status not available"
// *Cause:  The status could not be retrieved.
// *Action: The Data Guard broker process (DMON) is not available. Verify
//          that the DMON process is running and retry the command.
/
16961, 00000, "Creates a broker configuration"
// *Document: NO
// *Cause:  
// *Action: 
/
16962, 00000, "Edits a configuration, database, or instance"
// *Document: NO
// *Cause:  
// *Action: 
/
16963, 00000, "Removes a configuration, database, or instance"
// *Document: NO
// *Cause:  
// *Action: 
/
16964, 00000, "Observer started"
// *Document: NO
// *Cause:  
// *Action: 
/
16965, 00000, "Observer stopped"
// *Document: NO
// *Cause:  
// *Action: 
/
16966, 00000, "No properties"
// *Document: NO
// *Cause:  
// *Action: 
/
16968, 00000, "Current status for \"%s\":"
// *Document: NO
// *Cause:  
// *Action: 
/
16969, 00000, "Configuration \"%s\" added with primary site \"%s\""
// *Document: NO
// *Cause:  
// *Action: 
/
16970, 00000,"Changes a database marked for reinstatement into a viable standby"
// *Document: NO
// *Cause:  
// *Action: 
/
16971, 00000, "Initiating Fast-Start Failover to database \"%s\"..."
// *Document: NO
// *Cause:  
// *Action: 
/
16972, 00000, "Database resource \"%s\" added"
// *Document: NO
// *Cause:  
// *Action: 
/
16973, 00000,"Initiating reinstatement for database \"%s\"..."
// *Document: NO
// *Cause:  
// *Action: 
/
16974, 00000, "Disabled."
// *Document: NO
// *Cause:  
// *Action: 
/
16975, 00000, "Enabled."
// *Document: NO
// *Cause:  
// *Action: 
/
16976, 00000, "Property \"%s\" updated"
// *Document: NO
// *Cause:  
// *Action: 
/
16977, 00000, "Removed configuration"
// *Document: NO
// *Cause:  
// *Action: 
/
16978, 00000, "Removed site \"%s\" from configuration"
// *Document: NO
// *Cause:  
// *Action: 
/
16979, 00000,"Unable to log on to the primary or standby database as SYSDBA"
// *Cause:  The username/password used by the observer to log on to the primary
//          database and Fast-Start Failover target standby database does not
//          have valid SYSDBA credentials.
// *Action: Make sure the primary database and Fast-start failover target
//          database are using a remote login password file. Make sure the
//          SYSDBA password is the same at both databases and that the
//          SYSDBA password is used in the CONNECT command. Start the
//          observer again.
/
16980, 00000, "Reinstating database \"%s\", please wait..."
// *Document: NO
// *Cause:  
// *Action: 
/
16981, 00000, "Continuing to reinstate database \"%s\" ..."
// *Document: NO
// *Cause:  
// *Action: 
/
16982, 00000, "Site \"%s\" added to configuration"
// *Document: NO
// *Cause:  
// *Action: 
/
16983, 00000, "Started."
// *Document: NO
// *Cause:  
// *Action: 
/
16984, 00000, "Reinstatement of database \"%s\" succeeded"
// *Document: NO
// *Cause:  
// *Action: 
/
16985, 00000, "There are %s templates:"
// *Document: NO
// *Cause:  
// *Action: 
/
16986, 00000, "Reinstatement of database \"%s\" failed"
// *Document: NO
// *Cause:  
// *Action: 
/
16987, 00000, "There is one template:"
// *Document: NO
// *Cause:  
// *Action: 
/
16988, 00000, "Starts the fast-start failover observer"
// *Document: NO
// *Cause:  
// *Action: 
/
16989, 00000, "Valid states are:"
// *Document: NO
// *Cause:  
// *Action: 
/
16990, 00000, "Site \"%s\" updated"
// *Document: NO
// *Cause:  
// *Action: 
/
16991, 00000, "Two or more resources have the name \"%s\""
// *Cause:  The named resource exists on more than one site.
// *Action: Use the ON SITE clause and reissue the command.
/
16992, 00000, "\tshut down instance \"%s\" of database \"%s\""
// *Document: NO
// *Cause:  
// *Action: 
/
16993, 00000, "Comment to be ignored by DGMGRL"
// *Document: NO
// *Cause:
// *Action:
/
16994, 00000, "Use \"help <command>\" to see syntax for individual commands"
// *Document: NO
// *Cause:
// *Action:
/
16995, 00000, "Database \"%s\" added"
// *Document: NO
// *Cause:
// *Action:
/
16996, 00000, "Configuration \"%s\" created with primary database \"%s\""
// *Document: NO
// *Cause:
// *Action:
/
16997, 00000, "Syntax:"
// *Document: NO
// *Cause:
// *Action:
/
16998, 00000, "Welcome to %s, type \"help\" for information."
// *Document: NO
// *Cause:
// *Action:
/
16999, 00000, "Instance \"%s\" was not found"
// *Cause:  The named instance could not be found.
// *Action: Try the command again using a valid instance name.
/
17000, 00000, "Two or more instances have the name \"%s\""
// *Cause:  The named instance exists on more than one database.
// *Action: Use the ON DATABASE clause and reissue the command.
/
17001, 00000, "Please check specific instance for the property value"
// *Document: NO
// *Cause:
// *Action:
/
17002, 00000, "Primary database cannot be removed"
// *Cause:  The named database to be removed is the primary database.
// *Action: Remove the broker configuration instead.
/
17003, 00000, "Removed database \"%s\" from the configuration"
// *Document: NO
// *Cause:
// *Action:
/
17004, 00000, "Instance \"%s\" updated"
// *Document: NO
// *Cause:
// *Action:
/
17005, 00000, "Prepare for a future switchover operation"
// *Document: NO
// *Cause:
// *Action:
/
17006, 00000, "Removed instance \"%s\" from database \"%s\""
// *Document: NO
// *Cause:
// *Action:
/
17007, 00000, "Unsupported platform, observer cannot start"
// *Cause:  The Observer was started on an operating system that does not
//          support multi-threading.
// *Action: Start the Observer on an operating system that supports
//          multi-threading.
/
17008, 00000, "Stops the fast-start failover observer"
// *Document: NO
// *Cause:  
// *Action: 
/
17009, 00000, "New primary database \"%s\" is opening..."
// *Cause:  The Data Guard broker is opening the specified new primary
//          database. The new primary database is ready to accept transactions
//          once it is open.
// *Action: None.
/
17010, 00000, "Converts a database from one type to another"
// *Document: NO
// *Cause:
// *Action:
/
17011, 00000, "Converting database \"%s\" to a Snapshot Standby database, please wait..."
// *Document: NO
// *Cause:  
// *Action: 
/
17012, 00000, "Continuing to convert database \"%s\" ..."
// *Document: NO
// *Cause:  
// *Action: 
/
17013, 00000, "Database \"%s\" converted successfully"
// *Document: NO
// *Cause:  
// *Action: 
/
17014, 00000, "Failed to convert database \"%s\""
// *Document: NO
// *Cause:  
// *Action: 
/
17015, 00000, "Converting database \"%s\" to a Physical Standby database, please wait..."
// *Document: NO
// *Cause:  
// *Action: 
/
17016, 00000, "failed to retrieve status for database \"%s\""
// *Cause:  DGMGRL could not retrieve the StatusReport property from the given
//          database and thus could not report the database status.
// *Action: See accompanying messages for details.
/
17017, 00000, "unable to determine configuration status"
// *Cause:  The Data Guard broker could not execute a health check at
//          the moment, so the configuration status could not be determined.
// *Action: See accompanying messages for details.
/
17018, 00000, "Please complete the following steps to finish switchover:"
// *Document: NO
// *Cause:  
// *Action: 
/
17019, 00000, "\tstart up and mount instance \"%s\" of database \"%s\""
// *Document: NO
// *Cause:  
// *Action: 
/
17020, 00000, "Please complete the following steps and reissue the %s command:"
// *Document: NO
// *Cause:  
// *Action: 
/
