// Copyright (c) 2008, 2009, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCnMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     05/26/09 - fix messages
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     ccharits    04/02/09 - Added messages CHECK_PORT_AVAILABILITY_FAILURE
//                            and UNABLE_TO_RETRIEVE_LIST_OF_NODES
//     yizhang     04/02/09 - Add message SCAN_LSNR_TYPE
//     yizhang     12/19/08 - Fix message PORT_NOT_AVAILABLE
//                          - Add PORTS_NOT_AVAILABLE
//     yizhang     11/14/08 - Add MULTIPLE_VIPS_FOR_NAME
//     spavan      09/23/08 - fix bug6523972,bug7394870
//     spavan      09/16/08 - fix bug7330842
//     yizhang     09/10/08 - Add LSNR_CREATE_FAILED
//     spavan      04/11/08 - Fix cause/action field
//     spavan      04/08/08 - Fix cause/action field
//     yizhang     04/08/08 - Fix message NETWORK_CONFLICT_SUBNET
//     yizhang     03/21/08 - Defind INVALID_LSNR_PROTOCOLTYPE
//     sravindh    03/18/08 - Transfer cause and action strings from Java
//                            source file PrCnMsg.java
//     rxkumar     02/16/08 - add SET_PORT_FAILED
//     spavan      01/11/08 - Add message for network and ONS modify
//     rxkumar     12/12/07 - add GET_DHCP_SERVER_TYPE_FAILED
//     yizhang     09/10/07 - Add VIP_EXISTS, NETWORK_CONFLICT_NETNUM/SUBNET
//                            VIP_CONFLICT_VIPNAME/NETNUM_OR_NODE
//     yizhang     08/23/07 - Add NETMASK_NOT_EXIST
//     sowong      06/04/07 - add messages
//     rxkumar     06/06/07 - move Tier msgs to SCResMsg.
//     rxkumar     05/31/07 - add GET/SET_PROPS_FAILED msg
//     rxkumar     05/17/07 - add NOT_GOSSIPSERVER_DISC_METHOD
//     rxkumar     02/20/07 - add EONS messages
//     rxkumar     01/30/07 - add ORAHOME
//     rxkumar     01/08/07 - add GET_PORT_FAILED
//     rxkumar     12/19/06 - add NOT_PRIV_USER
//     rxkumar     12/05/06 - add PORT_NOT_AVAILABLE msg
//     rxkumar     12/04/06 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
// IMPORT=import oracle.ops.mgmt.nls.MessageKey;
2018, NOT_PRIV_USER, "Current user {0} is not a privileged user"
//  *Cause: Current user did not have sufficient privileges to perform this operation.
// *Action: Make sure that the user has root privileges on Linux/Unix's and Administrator on Windows.
/
2030, SUBNET_NOT_EXISTS, "Subnet does not exist for resource {0}"
//  *Cause: An attempt was made to query subnet for a network resource configured with Oracle clusterware and it was not found.
// *Action: Internal error. Contact Oracle Support.
/
2031, UNKNOWN_DHCP_SERVER, "Unknown DHCP server name {0} found for resource {1}"
//  *Cause: The DHCP server type obtained for the network resource is not a valid server type.
// *Action: Internal error. Contact Oracle Support.
/
2032, GET_DHCP_SERVER_TYPE_FAILED, "Failed to retrieve DHCP server type {0}"
//  *Cause: An attempt to query the DHCP server type for the network resource failed because its value could not be retrieved from the Oracle clusterware resource attributes.
// *Action: make sure Oracle clusterware is up and running. and also look at the help for the accompanying CRS error message. 
/
2033, SET_DHCP_SERVER_TYPE_FAILED, "Failed to update DHCP server type to {0} \n{1}"
//  *Cause: An attempt to update the DHCP server type for the network resource failed because its value could not be updated in the Oracle Clusterware resource attribute.
// *Action: Make sure that the Clusterware stack is up. Make sure that the user has enough permission to modify node applications. Examine the accompanying message for additional details.
/
2034, DEP_RES_NOT_FOUND, "Could not find dependent resource {0} for resource {1}: {2}"
//  *Cause: Could not get the resource associated with a given resource. Could not get the ASM resource associated with a given ASM disk group resource. 
// *Action: Make sure that clusterware stack is up. Make sure that the network resource associated with this resource has not been removed. Make sure that the user has permission to perform this operation.
/
2035, PORT_NOT_AVAILABLE, "Port {0} is not available on node(s) or virtual host(s): {1}"
//  *Cause: The port specified is already being used by some other applications on the nodes or virtual hosts given.
// *Action: Stop the applications that are using these ports or specify a different port and try the command again.
/
2036, GET_PORT_FAILED, "Failed to retrieve port number(s) for {0}"
//  *Cause: An attempt to retrieve the port number(s) for the cluster resource failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the resource you are querying has been configured. Also take a look at the help for the accompanying error message(s).
/
2037, GET_ORAHOME_FAILED, "Failed to retrieve Oracle home for {0}"
//  *Cause: An attempt to retrieve Oracle home value for the listener resource failed. 
// *Action: Make sure that the clusterware stack is up. Make sure that listener is configured. If node name is being specified in the command line make sure that the node name is a valid node name. Also look at help for the accompanying error message(s).
/
2038, SET_ORAHOME_FAILED, "Failed to update Oracle home {0} for listener {1}"
//  *Cause: An attempt to update the Oracle home value for the listener resource failed. 
// *Action: Make sure that the clusterware stack is up. Make sure that the listener is configured. If node name is being specified in the command line make sure that the node name is a valid node name. Make sure that user is a owner or has write permissions to modify the listener resource. Also look at the help for other errors listed in error stack.
/
2039, GET_PERX_ORAHOME_FAILED, "Failed to retrieve Oracle home for {0} on node {1}"
//  *Cause: An attempt to retrieve Oracle home value for the listener resource on a the specified node failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the listener is configured on the node. Make sure that the node name being passed in the command line is a valid node name. Also look at the help for the accompanying error message(s).
/
2040, SET_PERX_ORAHOME_FAILED, "Failed to update Oracle home {0} for {1} on node {2}"
//  *Cause: Attempt to update value of attribute Oracle home for listener resource on the specified node failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the listener is configured on the node. Make sure that the user has enough permission to modify the listener. Make sure that the node name being passed in the command line is a valid node name. Also look at the help for other errors listed in error stack.
.
/
2041, GET_PROPS_FAILED, "Failed to retrieve properties of {0}"
//  *Cause: Failed to retrieve properties of the given entity.
// *Action: Make sure that user has permission to read resource attribute.
/
2042, SET_PROPS_FAILED, "Failed to set properties {0} of {1}"
//  *Cause: Failed to update properties of the given entity.
// *Action: Make sure that user has permission to update resource attribute.
/
2043, MULTIPLE_NET_RES_EXIST, "Multiple network resources {0} exist on the cluster"
//  *Cause: More than one network resource has been configured and the one to be used for creating this resource has not been specified.
// *Action: Use command line option -k <net_num> argument to specify the network to be used and retry the command again.  
/
2044, LSNR_NOT_EXIST, "No listener exists"
//  *Cause: No listener has been configured.
// *Action: Use netca or srvctl to add/configure a listener.
/
2045, NETWORK_NOT_EXIST, "No network exists"
//  *Cause: No network has been configured.
// *Action: Use 'srvctl add nodeapps' to add/configure network resource.
/
2046, NETMASK_NOT_EXISTS, "Netmask does not exist for resource {0}"
//  *Cause: An attempt to retrieve the subnet information for the network resource resulted in not finding subnet mask.
// *Action: Internal error. Contact Oracle Support.
/
2047, VIP_EXISTS, "VIP {0} exists"
//  *Cause: The VIP with specified name has been registered in CRS.
// *Action: Remove the existing VIP before registering it again.
/
2048, NETWORK_CONFLICT_NETNUM, "The network attributes specified (network number: {0}, subnet: {1}, adapters: {2}) conflict with those already configured (subnet {3}, adapters: {4})."
//  *Cause: The network number is taken by a registered network resource.
// *Action: Use a different network number.
/
2049, NETWORK_CONFLICT_SUBNET, "The network attributes specified (network number: {0}, subnet: {1}, adapters: {2}) conflict with an already registered network (network number: {3}, subnet: {4}, adapters: {5})"
//  *Cause: The network resource is registered with different network number
// *Action: Use the registered network resource with the registered network number or provide different subnet or adapters.
/
2050, VIP_CONFLICT_VIPNAME, "The requested VIP (nodename: {0}, VIP name: {1}, network number: {2}) has the same VIP name but different network number or preferred node than the registered VIP (nodename: {3}, VIP name: {4}, network number: {5})."
//  *Cause: One VIP name (and IP address) can only be used by one VIP with the same network number on the same node.
// *Action: Use a different VIP name or IP address.
/
2051, VIP_CONFLICT_NETNUM_OR_NODE, "The requested VIP (nodename: {0}, VIP name: {1}, network number: {2}) has the same network number and the same preferred node but different VIP name with the registered VIP (nodename: {3}, VIP name: {4}, network number: {5})."
//  *Cause: One network resource on one preferred node can have only one cluster VIP.
// *Action: Use different network number or preferred node to register different VIP.
/
2052, MODIFY_NETWORK_FAILED, "Failed to modify Network resource (network number: {0}) to use (subnet: {1}, netmask {2} adapters: {3})."
//  *Cause: CRS was unable to modify the network resource to use new subnet/netmask/interface
// *Action: Make sure that clusterware stack is up. Make sure that the subnet, netmask and adapters value are correct. Make sure that the interface being referred to is running. Make sure that the user who is trying to modify network resource has root privileges. Examine the accompanying message for additional details.
/
2053, SET_LOCAL_PORT_FAILED, "Failed to modify ONS listening port for local client connections to {0}"
//  *Cause: CRS unable to modify the ONS listening port for local connections
// *Action: Make sure that clusterware stack is up. If the port is in use by another application, try using a different port.
/
2054, SET_REMOTE_PORT_FAILED, "Failed to modify ONS listening port for remote client connections to {0}"
//  *Cause: CRS unable to modify the ONS listening port for remote client connections
// *Action: Make sure that clusterware stack is up. If the port is in use by another application, try using a different port.
/
2055, SET_PORT_FAILED, "Failed to update port number(s) to {0} for {1}"
//  *Cause: An attempt to update the listener port failed for the nodes of the cluster.
// *Action: The port could be in use. Try using different port. If node name was specified in the command line make sure that the node name is a valid node name. Also look at the help for the accompanying error message(s).
/
2056, INVALID_LSNR_PROTOCOLTYPE, "Invalid listener protocol type {0}"
//  *Cause: The specified listener protocol type is invalid.
// *Action: Provide a valid listener protocol type. It can be TCP, TCPS, IPC, NMP, or SDP.
/
2057, INVALID_LSNR_PROTOCOLVALUE, "Invalid listener protocol value {0}"
//  *Cause: The specified listener protocol value is invalid.
// *Action: Provide a valid listener protocol value. It cannot contain special characters ':,/'
/
2058, INVALID_LSNR_ENDPOINTS, "Invalid listener protocol ENDPOINTS {0}. Delimiter is \"{1}\", invalid part is \"{2}\"."
//  *Cause: The specified listener ENDPOINTS are invalid.
// *Action: Provide valid listener protocol ENDPOINTS. It cannot contain invalid part.
/
2059, INVALID_LSNR_PORT, "Invalid listener port number {0}"
//  *Cause: The specified listener port number is invalid.
// *Action: Provide a valid listener port number.
/
2060, DUPLICATED_LSNR_PROTOCOLVALUE, "Duplicated listener protocol value {0}"
//  *Cause: The specified listener protocol value is a duplication of another one.
// *Action: Remove duplicated listener protocol value.
/
2061, LSNR_CREATE_FAILED, "Failed to add listener {0}"
//  *Cause: An attempt to add listener failed because endpoints were not specified correctly or other reasons. 
// *Action: Review the underlying error messages that provide the details of which resources failed to create. Check the cause and action for the individual resource creation failure. If the endpoints were not specified correctly, correct endpoints.
/
2062, UNKNOWN_HOST, "The specified hostname or address {0} cannot be resolved."
//  *Cause: An invalid IP address or unresolvable hostname was specified.
// *Action: If IP address is specified then make sure that it is of legal length. If a host name is specified than make sure that the host name resolves to an IP address.
/
2063, SET_OC4J_PORT_FAILED, "Failed to modify OC4J listening port to {0}"
//  *Cause: CRS unable to modify the OC4J instances listening port.
// *Action: Make sure that clusterware stack is up. If the port is in use by another application, try using a different port.
/
2064, MULTIPLE_VIPS_FOR_NAME, "Found {0} VIPs for {1}"
//  *Cause: A conflict was found in VIP resource definition: either more than one VIP is using the same name or address, or a VIP is using the same name or address as a real host.
// *Action: Ensure that each VIP is defined with a distinct name and address relative to other VIPs and hosts in the network.
/
2065, PORTS_NOT_AVAILABLE, "Port(s) {0} are not available on the nodes given"
//  *Cause: The ports specified are already being used by some other applications on the nodes given.
// *Action: Stop the applications that are using these ports or specify different ports and try the command again.
/
2066, SCAN_LSNR_TYPE, "Failed to retrieve cluster listener for {0} because it has the type of Single Client Access Name Listener"
//  *Cause: Failed to use cluster listener APIs or srvctl commands for specified listener.
// *Action: Use Single Client Access Name Listener (SCAN listener) APIs or srvctl commands (srvctl <verb> scan_listener) for specified listener name. 
/
2067, PORT_NOT_AVAILABLE_ACROSS_NODES, "Port {0} is not available across node(s) \"{1}\""
//  *Cause: The port specified is already being used by some other applications across the nodes given.
// *Action: Stop the application that is using this port or specify a different port and try the command again.
/
2068, CHECK_PORT_AVAILABILITY_FAILURE, "Failed to check the port availability"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
2069, UNABLE_TO_RETRIEVE_LIST_OF_NODES, "Unable to retrieve the list of nodes"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
