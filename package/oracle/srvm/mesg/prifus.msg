/ Copyright (c) Oracle Corporation 1999, 2001.  All rights reserved.
/
/ NAME
/   prifus.msg
/ DESCRIPTION
/   Generic error messages for oifcfg
/ NOTES
/   Language      : American
/   Character set : US7ASCII
/   WARNING: A single message in this table should NOT exceed 75 characters
/            If it does the message will be TRUNCATED.
/
/ RANG
/   00001 - 000xx : 
/
/ OWNER
/
/ MODIFIED
/    yizhang    04/22/09 - fix bug 8298561
/    yizhang    08/11/08 - Fix the help message for oifcfg delif
/    yizhang    05/30/08 - Add messages for PRICFG_GPNP_*_ERROR
/    sowong     11/09/04 - add error messages for iflist 
/    sowong     11/03/04 - add warning message for bug3974268 
/    sowong     10/25/04 - put previously hardcoded messages into mesg file 
/    sowong     10/22/04 - add messages for validation 
/    rdasari    08/22/03 - rdasari_oifcfg_imp 
/    rdasari    07/18/03 - additional messages
/    rdasari    06/24/03 - add messages for oifcfg

/
/ Message headers
/
/
/
/////////////////////////////////////////////////////////
/ Error messages for oifcfg
/ Range 1 - 100
/////////////////////////////////////////////////////////
/
000001,0, "invalid format for network interface"
// *Cause: An invalid network interface was given.
// *Action: Supply a network interface of the form <if_name>/<subnet>:<if_type>.

000002,0, "invalid network interface type"
// *Cause: An invalid network interface type was given.
// *Action: Supply one of the valid interface types "public", "cluster_interconnect".

000003,0, "cannot find the input interface configured"
// *Cause: An attempt was made to access an interface that is not already configured.
// *Action: Check if the input interface is configured through the "getif" command option.

000004,0, "OCR error while deleting the configuration for the given interface"
// *Cause: OCR may have been configured incorrectly or an OCR API failed.
// *Action: Check if OCR is configured correctly by running ocrdump.

000005,0, "invalid syntax for the setif command option"
// *Cause: An invalid syntax was specified for the oifcfg setif command option.
// *Action: Make sure the syntax for setif is "oifcfg setif {-node <nodename> | -global} {<if_name>/<subnet>:<if_type>}..."

000006,0, "invalid syntax for the getif command option"
// *Cause: An invalid syntax was specified for the oifcfg getif command option.
// *Action: Make sure the syntax for getif is "oifcfg getif [-node <nodename> | -global] [ -if <if_name>[/<subnet>] [-type <if_type>] ]."

000007,0, "invalid syntax for the delif command option"
// *Cause: An invalid syntax was specified for the oifcfg delif command option.
// *Action: Make sure the syntax for delif is "oifcfg delif [{-node <nodename> | -global} [<if_name>[/<subnet>]]]."

000008,0, "failed to initialize the prifcg context"
// *Cause: There was a system error.
// *Action: Check the messages in the log file oifcfg.log.

000009,0, "incorrect usage" 
// *Cause: Invalid command line options specified for the oifcfg tool.
// *Action: Run "oifcfg -help" to check the usage for the oifcfg tool.

000010,0, "failed to initialize the cluster registry"
// *Cause: The cluster registry was not configured correctly.
// *Action: Run "ocrdump" to see if the cluster registry was configured properly.

000011,0, "cluster registry error"
// *Cause: There was an internal error while operating on the cluster registry.
// *Action: Check the messages in the log file oifcfg.log.

000012,0, "failed to initialize cluster support services"
// *Cause: The cluster support services module was not configured correctly.
// *Action: Check the messages in the log file oifcfg.log.

000013,0, "cluster support services error"
// *Cause: There was an internal error while accessing cluster support services.
// *Action: Check if Cluster Support Services is running properly.

000014,0, "invalid node name"
// *Cause: The node name does not match any of the configured nodes.
// *Action: Ensure that the supplied node name is one of the node names returned by 'olsnodes'.

000015,0, "invalid format for subnet"
// *Cause: An invalid subnet was given.
// *Action: Supply a subnet of the form a.b.c.d where a, b, c and d is a value between 0 and 255 (inclusive).

000016,0, "invalid syntax for the iflist command option"
// *Cause: An invalid syntax was specified for the oifcfg iflist command option.
// *Action: Make sure the syntax for iflist is "oifcfg iflist [-p [-n]]."

000017,0, "Error in getting the host names in a cluster"
// *Cause: There was an internal error while calling clsgpnp_crs_getcsshosts.
// *Action: Check the underlying errors shown with this.

000018,0, "Error in deleting network information from GPnP profile"
// *Cause: There was an internal error while calling clsgpnpx_prfDelHostNetInfo.
// *Action: Check the underlying errors shown with this.

000019,0, "Error in getting the network attribute values from GPnP profile"
// *Cause: There was an internal error while calling clsgpnpx_prfGetNetAttrVal.
// *Action: Check the underlying errors shown with this.

000020,0, "Error in getting the lock for GPnP profile"
// *Cause: There was an internal error while calling clsgpnp_crs_cssLockUpdates.
// *Action: Check the underlying errors shown with this.

000021,0, "Error in getting the GPnP profile"
// *Cause:  There was an internal error while calling clsgpnp_getProfile.
// *Action: Check the underlying errors shown with this.

000022,0, "Error in cloning the GPnP profile"
// *Cause: There was an internal error while calling clsgpnp_getProfile.
// *Action: Check the underlying errors shown with this.

000023,0, "Error in getting network interface from GPnP profile"
// *Cause: There was an internal error while calling clsgpnpx_prfGetHostNetInfo
// *Action: Check the underlying errors shown with this.

000024,0, "Error in retrieving the network interface from GPnP profile"
// *Cause: Failed to retrieve the network interface information because of underlying errors.
// *Action: Check the underlying errors shown with this.

000025,0, "Error in setting network attribute value in GPnP profile"
// *Cause: There was an internal error while calling clsgpnpx_prfSetNetAttrVal.
// *Action: Check the underlying errors shown with this.

000026,0, "Error in update the profiles in the cluster"
// *Cause: There was an internal error while calling clsgpnp_crs_ensuredSignAndPush
// *Action: Check the underlying errors shown with this.

000027,0, "Error in releasing the in memory presentation of GPnP profile "
// *Cause: There was an internal error while calling clsgpnp_profileDestroy.
// *Action: Check the underlying errors shown with this.

000028,0, "Error in unlock the GPnP profile"
// *Cause:  There was an internal error while calling clsgpnp_crs_cssUnlockUpdates.
// *Action: Check the underlying errors shown with this.

000029,0, "Warning: wildcard in network parameters can cause mismatch among GPnP profile, OCR, and system"
// *Cause:  Wildcard syntax was detected in one or more network-related parameters.  Although this is allowed, be aware that network particulars (such as interface names and subnets) must be identical on all nodes of the cluster.  Using wildcard syntax in network parameters does not allow the network configuration to vary across nodes.
// *Action: If wild card causes the problem, provide interface name and subnet without wild card.

000030,0, "Network information in OCR profile needs to be synced with GPnP profile"
// *Cause: There was mismatched network information in OCR profile.
// *Action: Using oifcfg setif to sync the network information from GPnP profiles to OCR profile.

000050,0, "duplicate interface is given in the input"
// *Cause: Duplicate interface is given in the input.
// *Action: Warning: Supply a network interface of the form <if_name>/<subnet>:<if_type>. Make sure to provide unique combination for <if_name>/<subnet>:<if_type> if multiple inputs are provided in the same command line or if the entry already exists.

000051,0, "interface [%s] is set to both public and cluster_interconnect"
// *Cause: The interface is set to both public and cluster_interconnect.
// *Action: Warning: Make sure that the interface is not set to both public and cluster_interconnect.

000052,0, "Could not get an immediate lock for GPnP profile. Wait to get the lock ..."
// *Cause: The command was unable to take an exclusive CSS lock with the nowait option. 
// *Action:Ctrl-C if wait for too long. Check the setup of clusterware.

/////////////////////////////////////////////////////////
/ Command line options for oifcfg
/ Range 101 - 150
/////////////////////////////////////////////////////////
/
000101,0, "\nName:\n\toifcfg - Oracle Interface Configuration Tool.\n\n"
000102,0, "Usage:  oifcfg iflist [-p [-n]]\n"
000103,0, "\toifcfg setif {-node <nodename> | -global} {<if_name>/<subnet>:<if_type>}...\n"
000104,0, "\toifcfg getif [-node <nodename> | -global] [ -if <if_name>[/<subnet>] [-type <if_type>] ]\n"
000105,0, "\toifcfg delif [{-node <nodename> | -global} [<if_name>[/<subnet>]]]\n"
000106,0, "\toifcfg [-help]\n\n"
000107,0, "\t<nodename> - name of the host, as known to a communications network\n"
000108,0, "\t<if_name>  - name by which the interface is configured in the system\n"
000109,0, "\t<subnet>   - subnet address of the interface\n"
000110,0, "\t<if_type>  - type of the interface { cluster_interconnect | public }\n"
// *Document: NO
// *Cause: oifcfg was invoked with incorrect or missing options.
// *Action: Check the usage and invoke oifcfg with correct options.
