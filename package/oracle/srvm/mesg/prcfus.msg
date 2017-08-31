// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCfMsg.msg
//
// DESCRIPTION
//    Message file for the File Transfer API (the "f" in the PrCfMsg.msg stands for File transfer).
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     05/31/09 - fix messages
//     ccharits    10/13/08 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
1001, DIR_NOT_EXISTS, "The directory \"{0}\" does not exist"
//  *Cause: A directory that did not exist was chosen for the top-level directory of the directory map.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1002, TOP_DIR_NOT_A_DIR, "\"{0}\" cannot be the top-level directory as it is not a directory"
//  *Cause: An existing file which was not a directory was provided as top-level directory.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1003, FILE_NOT_FOUND, "The file \"{0}\" does not exist" 
//  *Cause: The file was not found in the file system.
// *Action: Make sure that the file exists in the file system.
/
1004, LINK_DEST_NOT_FOUND, "The link destination \"{0}\" does not exist" 
//  *Cause: The link destination was not found in the file system.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1005, CONFLICT_WITH_EXCLUDE_LIST, "\"{0}\" conflicts with the exclude-list" 
//  *Cause: The pathname (directory, file or symbolic link pathname) to add to the directory map could not be added as it conflicted with the exclude list.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1006, DIR_EXISTS_IN_DIRECTORY_MAP, "The directory \"{0}\" exists already in the directory map" 
//  *Cause: The directory existed already in the directory map.
// *Action: No action. This is just to let the user know that no action is taken as the task is already complete.
/
1007, FILE_EXISTS_IN_DIRECTORY_MAP, "The file \"{0}\" exists already in the directory map" 
//  *Cause: The file existed already in the directory map.
// *Action: No action. This is just to let the user know that no action is taken as the task is already complete.
/
1008, LINK_EXISTS_IN_DIRECTORY_MAP, "The link \"{0}\" exists already in the directory map" 
//  *Cause: The link existed already in the directory map.
// *Action: No action. This is just to let the user know that no action is taken as the task is already complete.
/
1009, PARENT_DIR_NOT_EXISTS, "The parent of \"{0}\" does not exist" 
//  *Cause: The parent directory of the content (directory, file or symbolic link) that was being processed did not exist.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1010, NOT_A_DIR, "\"{0}\" is not a directory" 
//  *Cause: The indicated object was expected to be a directory, but it was not.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1011, REMOVE_CONTENT_IMPOSSIBLE, "Cannot remove \"{0}\" as the directory map does not contain it"
//  *Cause: The content (i.e., directory, file or symbolic link) could not be removed from the directory map as it did not exist there. 
// *Action: No action. This is just to let the user know that no action is taken as the task is already complete.
/
1012, BUILD_ADD_LIST_ERRORS, "The following contents (directories, files or symbolic links)  cannot be included to to the list of contents to add to the directory map: {0}"
//  *Cause: The contents that could not be included to the add-list were those which conflicted with the exclude-list (see the accompanying PRCF-1005 message).
// *Action: No action. This is just to let the user know about the conflicts with the exclude-list.
/
1013, NO_DIR_MAP_ENTRY, "The directory map has no entry"
//  *Cause: The user tried to acquire information about an empty directory map.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1014, CONTENT_ADDITION_IMPOSSIBLE_NO_DIR_MAP, "Cannot add \"{0}\" as there is no directory map"
//  *Cause: The user tried to add a content (i.e., directory, file or symbolic link) to an empty directory map. This operation is allowed only if there is a directory map.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1015, CONTENT_ADDITION_IMPOSSIBLE_CONTENT_NOT_FOUND, "Cannot add \"{0}\" to the directory map as \"{0}\" does not exist" 
//  *Cause: The content to add to the directory map was not found in the file system.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1016, CONTENT_REMOVAL_IMPOSSIBLE_NO_DIR_MAP, "Cannot remove \"{0}\" as there is no directory map"
//  *Cause: The user tried to remove a content (i.e., directory, file or symbolic link) from an empty directory map. This operation is allowed only if there is a directory map.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1017, CONTENT_REMOVAL_IMPOSSIBLE_CONTENT_NOT_FOUND, "Cannot remove \"{0}\" from the directory map as \"{0}\" does not exist" 
//  *Cause: The content to remove from the directory map was not found in the file system.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1018, EXCEPTION_DETAILS, "Exception encountered. Details: {0}" 
//  *Cause: An unexpected error condition was detected during reading the exclude-list or include-list file.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services. 
/
1019, UNIX_SUPPORT_ONLY, "The API supports only Unix OS" 
//  *Cause: The user was running on Windows OS.
// *Action: Make sure that the OS is Unix or Linux. 
/
1020, NOT_A_FILE, "\"{0}\" is not a file" 
//  *Cause: The content that was expected to be a file which turned out not to be a file.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1021, INVALID_PATHNAME, "\"{0}\" is not a valid pathname"
//  *Cause: The content that was expected to be a valid pathname which turned out to be an invalid one.  
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/

2001, CONNECTION_REFUSED, "Connection to host/IP address: {0} -- port: {1} refused"
//  *Cause: Could not establish connection to the provided host/IP address using the port number reported.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2002, CONNECTION_LOST, "Connection to node \"{0}\" is lost"
//  *Cause: The connection to the remote node with the specific node ID was lost.
// *Action: Verify that the remote node (which acts as server) is still up and running. Then do the same for the local node (which acts as client). 
/
2003, REPLY_MISMATCH, "Expected \"{0}\" but received \"{1}\""
//  *Cause: The command was not executed successfully. The local node received a reply from the remote node that was different from the expected one. 
// *Action: No action. The program should take care of it (i.e., catch the exception and handle it). 
/
2004, FILESAVE_DIR_LISTING_PROBLEM, "Problem encountered while saving the directory listing to file \"{0}\". Details : {1}"
//  *Cause: While trying to save the directory listing to a file, the operation could not be completed successfully.
// *Action: If you can correct the problem indicated in the accompanying details, do so and then retry the request.  Otherwise, contact Oracle Support Services.
/
2005, MISSMATCH_NODE_NAMES_AND_PORTS, "File transfer cannot proceed because the remote node names do not match the remote node ports"
//  *Cause: An internal error caused a a mismatch between the number of remote nodes and the number of remote node ports.  
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2006, EMPTY_LIST_OF_REMOTE_NODES, "File transfer cannot proceed because the list of remote nodes is empty"
//  *Cause: An empty list of remote nodes was passed as argument.  
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2007, PORT_NOT_INTEGER_NUMBER, "Invalid selection for the remote node port. \"{0}\" is not an integer number as expected."
//  *Cause: The port number for the remote node was either not a number at all or not an integer number.   
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2008, PORT_NUMBER_OUT_OF_EXPECTED_RANGE, "The remote node port number \"{0}\" is out of the expected range [1, 65535]"
//  *Cause: The port number for the remote node was indeed an integer number but either less than 1 or greater than 65535.   
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2009, NO_REMOTE_NODE, "Cannot proceed with the file transfer. There has to be at least one remote node to send the installer files!"
//  *Cause: The user either provided an empty list of remote nodes or each remote node of the list had invalid format.
// *Action: Make sure that the list of remote nodes is not empty and the remote nodes have valid format.
/
2010, NO_REMOTE_NODE_LEFT_AFTER_CONNECTION_ATTEMPTS, "All connections to the remote nodes got refused. Cannot proceed with the file transfer. There has to be at least one remote node to send the installer files!"
//  *Cause: All the attempts to connect to the remote nodes that had valid format failed. 
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2011, CANNOT_READ_FILE, "The file \"{0}\" cannot be read successfully"
//  *Cause: The file existed in the file system but could not be read successfully.
// *Action: Make sure that the file is not corrupted. To verify that try to open the file manually and read its contents.
/
2012, TOP_DIR_NOT_FOUND, "The top-level directory \"{0}\" does not exist"
//  *Cause: The top-level directory was not found in the file system.
// *Action: Make sure that the top-level directory exists in the file system.
/
2013, CRS_HOME_NOT_FOUND,"Cannot find the CRS Home"
//  *Cause: The CRS Home did not exist or 'oui' was not a directory under the CRS Home.
// *Action: Make sure that 'oui' is a directory under the CRS Home. Refer to your platform-specific documentation for information about locating the Oracle software inventory.
/
2014, COMMAND_EXECUTION_ERROR,"Executing command \"{0}\" on \"{1}\" failed on node \"{2}\".\n{3}"
//  *Cause: The command ('mkdir', 'mkfile', 'mklink' or 'wrfile') failed while executing on the remote node.
// *Action: Try to fix the problem based on the error message. If the problem still exists, contact Oracle Support Services.
/
2015, COMMAND_ERROR_NOTIFICATION, "One or more commands were not executed successfully on one or more nodes"
//  *Cause: At least one of the commands 'mkdir', 'mkfile', 'mklink' or 'wrfile' failed while executing on one or more remote nodes.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2016, BINARY_NOT_FOUND, "Required binary file \"{0}\" not found"
//  *Cause: The binary file was not found under the expected location.
// *Action: Contact Oracle Support Services.
/
2017, UNSUCCESSFUL_BINARY_EXECUTION_PORT_ERROR, "Node \"{0}\": The transfer binary was not executed successfully as it returned a wrong port number"
//  *Cause: Misbehavior of the transfer binary on the provided node.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2018, UNSUCCESSFUL_BINARY_EXECUTION, "Node \"{0}\": The transfer binary was not executed successfully"
//  *Cause: Unsuccessful execution of the transfer binary.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2019, UNSUCCESSFUL_LOCAL_NODE_NAME_RETRIEVAL, "Cannot retrieve the name for the local node"
//  *Cause: No IP address for the local host could be found.
// *Action: Use the ping command manually to check whether you get a reply from the host or not.
/
2020, UNKNOWN_HOST, "Cannot retrieve the host for node \"{0}\""
//  *Cause: No IP address for the node host could be found.
// *Action: Use the ping command manually to check whether you get a reply from the host or not.
/
2021, NODE_NAME_DEST_DIR_MISMATCH, "There is a mismatch between the number of node names ({0}) and the number of node destination directories ({1})"
//  *Cause: An internal error caused a a mismatch between the number of remote nodes and the number of remote destination directories.  
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2022, FILE_SHRINKING_WITH_TIME, "The file \"{0}\" became smaller while being transferred"
//  *Cause: The file became smaller while being transferred.
// *Action: None.
/
2023, NON_READABLE_CONTENTS, "The following contents are not transferred as they are non-readable. \nDirectories:\n   {0} \nFiles:\n   {1}"
//  *Cause: The file permissions of the listed contents did not allow the requested operation.
// *Action: None.
/
2024, NON_READABLE_DIR, "The directory \"{0}\" is not transferred as it is non-readable"
//  *Cause: The file permissions of the listed directory did not allow the requested operation.
// *Action: None.
/
2025, UNEXPECTED_INTERNAL_ERROR, "Internal error: {0}"
//  *Cause: An internal error occurred. The included value is an internal identifier.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/

