// Copyright (c) 2008, Oracle. All rights reserved.
//
// NAME
//    PrCwMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file PrCwMsg.java
//     wanwu       11/09/07 - createion
//  */
//
// /**
//  *  @version $Header: PrCwMsg.msg 19-mar-2008.16:14:49 sravindh Exp $
//  *  @author  rxkumar
//  *  @since   1.0
//  */
//
// PACKAGE=package oracle.cluster.wallet.resources;
// MSGIDTYPE=interface
1001, NO_MEMORY, "Could not allocate new memory"
//  *Cause: Could not allocation any new memory.
// *Action: Retry after make more memory available.
/
1002, NZ_ERROR, "Network Security error code {0}"
//  *Cause: Failed to perform the network security operation.
// *Action: Look at the network security error for the appropriate action.
/
1003, CLSW_FAIL, "Failed to do the cluster wallet operation {0}"
//  *Cause: Failed to perform the cluster wallet operation.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1004, WALLET_OPEN_FAIL, "Could not open the wallet {0} due to error {1} : {2} "
//  *Cause: Failed to open the cluster wallet.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1005, WALLET_NOT_EXIST, "Wallet {1} did not exist due to error code {1}"
//  *Cause: The cluster wallet did not exist.
// *Action: Need to create the cluster wallet.
/
1006, ALIAS_NOT_EXIST, "Alias {0} in Wallet {1} did not exist"
//  *Cause: The alias within the cluster wallet did not exist.
// *Action: Need to create the alias within the cluster wallet.
/
1007, ALIAS_READ_ERROR, "Alias {0} in Wallet {1} could not be read due to error {2}"
//  *Cause: Could not read the alias within the cluster wallet.
// *Action: Look at the network security error for the appropriate action.
/
1008, ALIAS_WRITE_ERROR, "Alias {0} in Wallet {1} could not be written due to error code {2}"
//  *Cause: Could not write the secret of the alias to the cluster wallet.
// *Action: Look at the network security error for the appropriate action.
/
1009, WALLET_SAVE_ERROR, "Wallet {0} could not be saved due to error code {1}"
//  *Cause: Could not save the cluster wallet.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1010, WALLET_CREATE_ERROR, "Wallet {0} could not be created due to error {1}: {2} "
//  *Cause: Could not create the cluster wallet.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1011, WALLET_ACCESS_DENIED, "Wallet {0} could not be accessed due to error code {1}"
//  *Cause: Could not access the cluster wallet.
// *Action: Use the correct cluster wallet password.
/
1012, WALLET_DELETE_ERROR, "Wallet {0} could not be deleted due to error code {1}"
//  *Cause: Could not delete the cluster wallet.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1013, INIT_FAIL, "Failed to initialize cluster wallet context due to error code {0}"
//  *Cause: Could not initialize the cluster wallet context.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1014, TERMINATE_FAIL, "Failed to terminate cluster wallet context due to error code {0}"
//  *Cause: Could not terminate the cluster wallet context.
// *Action: Look at the cluster wallet error for the appropriate action.
/
