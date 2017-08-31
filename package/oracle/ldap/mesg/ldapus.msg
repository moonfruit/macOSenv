/  Standard SDK error codes and their Messages

0,1,    "Success"
1,1,    "Operations error"
2,1,    "Protocol error"
3,1,    "Timelimit exceeded"
4,1,    "Sizelimit exceeded"
5,1,    "Compare false"
6,1,    "Compare true"
7,1, 	"Strong authentication not supported"
8,1,  	"Strong authentication required"
9,1,    "Partial results and referral received"
10,1,   "LDAP Referral Error"
11,1,   "LDAP Adminstration Limit Error"
12,1, 	"Critical Extension is not supported"
16,1,   "No such attribute"
17,1,   "Undefined attribute type"
18,1,   "Inappropriate matching"
19,1,  	"Constraint violation"
20,1,  	"Type or value exists"
21,1,   "Invalid syntax"
32,1,	"No such object"
33,1,   "Alias problem"
34,1,   "Invalid DN syntax"
35,1,   "Object is a leaf"
36,1,   "Alias dereferencing problem"
48,1,   "Inappropriate authentication"
49,1,   "Invalid credentials"
50,1,   "Insufficient access"
51,1,   "DSA is busy"
52,1,   "DSA is unavailable"
53,1,  	"DSA is unwilling to perform"
54,1,   "Loop detected"
64,1,   "Naming violation"
65,1,   "Object class violation"
66,1,   "Operation not allowed on nonleaf"
67,1,   "Operation not allowed on RDN"
68,1,   "Already exists"
69,1,  	"Cannot modify object class"
70,1,   "Results too large"
71,1,	"Affects multiple DSAs"
80,1,   "Unknown error"
81,1,   "Can't contact LDAP server"
82,1,   "Local error"
83,1,   "Encoding error"
84,1,   "Decoding error"
85,1,   "Timed out"
86,1,   "Unknown authentication method"
87,1,   "Bad search filter"
88,1,   "User cancelled operation"
89,1,   "Bad parameter to an ldap routine"
90,1,   "Out of memory"
97,1,	"Referral hop limit exceeded"

/ Oracle specific SDK error codes and messages
500,1,   "specified information could not be discovered"
501,1,   "Error during looking up of specified information"
502,1,   "No DNS address found"
503,1,   "File not found"
504,1,   "Error during parsing of the file"

550,1,   "SSL initialization failed"
551,1,   "SSL context configuration failed"
552,1,   "Unable to open wallet"
553,1,   "SSL context creation failed"
554,1,   "SSL handshake failed"
555,1,   "Unable to get peer's SSL credential"
/  Genneral Errors

2101,1,"Internal Error"
2102,1,"Memory Allocation Error"
2103,1,"Decoding Error"
2104,1,"%s: Not an LDAP errno :%d\n"
2105,1,"%s: matched: %s\n"
2106,1,"%s: additional info: %s\n"
2107,1,"%s: matched an LDAP errno :%d\n"
2108,1,"Server is Configured to Deny Anonymous Binds"
2109,1,"Proxy Switch is not Allowed on Super User and Replication User"
2110,1,"User does not exist in directory for Proxy Switch"
2111,1,"Insufficient access to do Proxy Switch and Switching as Anonymous"
2112,1,"Insufficient access to do Proxy Switch"

/  Incomplete functionality Errors

2201,1,"Version Not Supported"
2202,1,"Currently Not Supported"
2203,1,"Function Not Implemented"

/   Connectivity Errors

2301,1,"Error Reading SSL credentials"
2302,1,"Reading Error"
2303,1,"Error in Control Info."
2304,1,"MaxConnReached"

/   Unexplained MEssages

2401,1,"gsleioHJBDBerAlloc"
2402,1,"sgsleenSBerPrintf entry end"

/   LDAP messages erros

2501,1,"Unknown search scope"
2502,1,"Bad Search Filter"
2503,1,"UnRecognized Modify operation"
2504,1,"No values given"
2505,1,"Attribute Uniqueness Constraint Violation\n"
2506,1,"Attribute Uniqueness Constraint Violation across object class\n"

/   Additional Information/messages returned by Server to client

3001,1,"Entry to be modified not found."
3002,1,"INVALID ACI is %s"
3003,1,"Attribute %s is not supported in schema."
3004,1,"Error encountered while adding %s to the entry"
3005,1,"Attribute %s is single valued."
3006,1,"Error replacing %s."
3007,1,"Attribute %s not present in the entry."
3008,1,"%s not found for attribute %s."
3009,1,"Modifying the Naming attribute for the entry without modifying the DN"
3010,1,"Operation not allowed on the DSE Entry."
3011,1,"error in Schema hash creation"
3012,1,"Bad attribute definition"
3013,1,"OID %s has syntax error." 
3014,1,"Attribute %s has syntax error."
3015,1,"matching rule, %s, not defined" 
3016,1,"Operation not allowed on the %s."
3017,1,"syntax, %s, not defined"
3018,1,"Attribute %s already in use."
3019,1,"Error in hashing %s attribute." 
3020,1,"Object ID %s already in use."
3021,1,"Super type undefined"
3022,1,"error in Schema hash creation" 
3023,1,"Objectclass  %s already in use." 
3024,1,"Error in hashing %s objectclass." 
3025,1,"Attempted to add a Class with oid %s taken by other class"
3026,1,"Super object %s is not defined in Admin Domain %s\n"
3027,1,"Manditory attribute %s is not defined in Admin Domain %s\n"
3028,1,"Optional attribute %s is not defined in Admin Domain %s\n"
3029,1,"%s attribute not found."
3030,1,"Objectclass attribute missing."
3031,1,"Admin domain does not contain schema information for objectclass %s."
3032,1," Mandatory Attribute missing."
3033,1,"Failed to find %s in mandatory or optional attribute list."
3034,1,"Entry to be deleted not found."
3035,1,"error while normalizing value for attribute %s."
3036,1,"Entry to be modified not found."
3037,1,"New Parent not found."
3038,1,"Attribute modification with member or Uniquemeber not supported."
3039,1,"Admin Domain restricts modification of Attribute: %s ."
3040,1,"Entry %s under an Alias entry is not supported." 
3041,1,"Problem in dereferencing the base of the search."
3042,1,"Server Plug-in OCI failure"
3043,1,"Server Plug-in related error"
3044,1,"NULL or Invalid value passed."
3045,1,"NULL value passed for Mandatory attribute %s."
3046,1,"ldapadd operation is not allowed on %s."
3047,1,"ldapdelete operation is not allowed on %s."
3048,1,"ldapmodify operation is not allowed on %s."
3049,1,"ldapmodrdn operation is not allowed on %s."
3050,1,"ldapcompare operation is not allowed on %s."
3051,1,"ldapsearch operation is not allowed on %s."
3052,1,"Super user name can not be the DN of an existing entry."
3053,1,"Cannot add nonbase schema outside cn=subschemasubentry."
// *Document: YES
// *Severity: error
// *Category: Compliance
// *Cause: A schema addition was attempted outside cn=subschemasubentry.
// *Action: Ensure schema additions are made to cn=subschemasubentry.

3054,1,"Cannot move non-base subschema-subentry."
3055,1,"New RDN is invalid."
3056,1,"Server Java Plug-in Error"
3057,1,"Dynamic group cache update failed."
3058,1,"Dynamic group member update failed."
3059,1,"Invalid dynamic group definition."
3060,1,"Attribute alias %s is already in use"
3061,1,"Attribute name %s exceeds maximum allowed length"
3062,1,"Cannot create alias to another alias entry"
3063,1,"Mandatory Attribute %s in the Objectclass %s is an RI enabled attribute"
3064,1,"Function Not Implemented, search filter attribute %s is not indexed/cataloged"
3067,1,"Attribute %s provided for orcluniqueattrname is not supported in schema."
3068,1,"Attribute %s provided for orcluniqueattrname is not indexed/cataloged."
3069,1,"Objectclass %s provided for orcluniqueobjectclass is not supported in schema."

5001,1,"Error in DN Normalization."
5002,1,"Super user addition not permitted."
5003,1,"Parent entry not found in the directory."
5004,1,"%s attribute has duplicate value. VALUE: %s"
5005,1,"The attribute or the value specified in the RDN does not exist in the entry"
5006,1,"Error encountered while encrypting an attribute value"
5007,1,"Object already exists"
5008,1,"First level entry to be added not in namingcontexts attribute of DSE"
5009,1,"%s attribute has duplicate value."
5010,1,"Referential integrity constraint violated for %s. Specified value does not exist in directory."
5011,1,"Referential integrity constraint violated for one of the specified attributes."
5012,1,"Of the two objectclasses, one with member and another with uniquemember attribute, an entry can have only one of them but not both."

/   SSL Errors . Needs to go away from this file.

6980,1,	"SSL Error: IO closed"
6981,1,	"SSL Error: Bad parameter"
6982,1,	"SSL Error: X509 data not found"
6983,1,	"SSL Error: X509 certificate chain incomplete"
6984,1,	"SSL Error: X509 names not equal"
6985,1,	"SSL Error: X509 certificate expired"
6986,1,	"SSL Error: X509 certificate chain invalid"
6987,1,	"SSL Error: ASN Integer too big"
6988,1,	"SSL Error: ASN bad encoding"
6989,1,	"SSL Error: Connection closed"
6990,1,	"SSL Error: Connection closed Gracefully"
6991,1,	"SSL Error: Session Not Found"
6992,1,	"SSL Error: IO Error"
6993,1,	"SSL Error: Would block"
6994,1,	"SSL Error: Fatal Alert"
6995,1,	"SSL Error: Negotiation Error"
6996,1,	"SSL Error: Protocol Error"
6997,1,	"SSL Error: Unknown Error"
6998,1,	"SSL Error: Overflow"
6999,1,	"SSL Error: Not Supported"
7000,1,	"SSL Error: Out of memory"

/   Datagen Messages

8001,1,"invalid format, line %d of entry: \"%s\"\n"
8002,1,"invalid format, attribute %s seen before DN specified.\n"
8003,1,"%s: skipping change record for entry: %s\n\t(LDAP host/port does not match replica: lines)\n"
8004,1,"%s:  unknown %s \"%s\" (line %d of entry: %s)\n"
8005,1,"%s: expecting \"%s:\" but saw \"%s:\" (line %d of entry %s)\n"
8006,1,"%s: expecting \"%s:\" but saw \"%s:\" (line %d of entry %s)\n"
8007,1,"%s: extra lines at end (line %d of entry %s)\n"
8008,1,"DN Error --- DN \"%s\", rc=%d.\n"
8009,1,"Schema Check failed with error=%d\n"
8010,1,"***** error : %s.\n"
8011,1,"Naming violation. RDN attribute values not found in the entry. DN: %s,Status: %d.\n"
8012,1,"%s: missing value on line %d (attr is %s)\n"
8013,1,"%s: no attributes to change or add (entry %s)\n"
/8014,1,"%s %s:\n"
/8015,1,"\tNOT ASCII (%ld bytes)\n"
/8016,1,"\t%s\n"
8017,1,"%sadding new entry %s\n"
8018,1,"%smodifying entry %s\n"
8019,1,"modify complete\n"
8020,1,"%sdeleting entry %s\n"
8021,1,"delete complete"
8022,1,"new RDN: %s (%skeep existing values)\n"
8023,1,"%smodifying rdn of entry %s\n"
8024,1,"modrdn completed\n"
8025,1,"usage: %s connect=<connect string> encode=<encoding> file=absolute path of LDIF file "
8026,1,"[debug=<debuglevel>] [dnfile=<absolute path of DN file>] [schemacheck=<TRUE | FALSE>] "
8027,1,"[operational=<true | false>] [entrybase=<starting entry id>] [creatordn=<creator's DN>] [numThread=<no of writer threads to be created>] \n"
8028,1,"Could not initialize NLS Context Exiting...\n"
8029,1,"Could not initialize SLTS Context. Result code = %ld\n"
8030,1,"Could not initialize oidldapd Server. Result code = %ld\n"
/8031,1,"Debug levels:\n"
/8032,1,"\tLDAP_DEBUG_TRACE\t%d\n"
/8033,1,"\tLDAP_DEBUG_PACKETS\t%d\n"
/8034,1,"\tLDAP_DEBUG_ARGS\t\t%d\n"
/8035,1,"\tLDAP_DEBUG_CONNS\t%d\n"
/8036,1,"\tLDAP_DEBUG_BER\t\t%d\n"
/8037,1,"\tLDAP_DEBUG_FILTER\t%d\n"
/8038,1,"\tLDAP_DEBUG_CONFIG\t%d\n"
/8039,1,"\tLDAP_DEBUG_ACL\t\t%d\n"
/8040,1,"\tLDAP_DEBUG_STATS\t\t%d\n"
/8041,1,"\tLDAP_DEBUG_STATS2\t\t%d\n"
/8042,1,"\tLDAP_DEBUG_SHELL\t\t%d\n"
/8043,1,"\tLDAP_DEBUG_PARSE\t\t%d\n"
/8044,1,"\tLDAP_DEBUG_ANY\t\t%d\n"
8045,1,"must compile with LDAP_DEBUG for debugging\n"
/8046,1,"holy smokes! i = %d, %d"
8047,1,"catalog hash table in backend structure is inconsistent.\n"
8048,1,"Error %d encountered processing DN:%s (eid:%d)\n"
8049,1,"Error %d encountered processing DN: %s\n"
8050,1,"DN: %s. No attributes specified.\n"
8051,1,"Reverse DN failed on %s\n"
8052,1,"ORACLE_HOME not set\n"
8053,1,"Error in parsing attribute value.\n"
8054,1,"Unable to get value from file %s.\n"
8055,1,"ObjectClass attribute missing\n"
8056,1,"Error in Exploding ObjectClass\n"
8057,1,"LDIF record Check failed\n"
8058,1,"authpassword already exists\n"
8059,1,"Password Syntax checking error\n"
8060,1,"Operation Not supported\n"
8061,1,"OCI Bind Error encountered during schema-check\n"
8062,1,"Database Error encountered during schema-check\n"
/   ldapbind  Messages

8100,1,"usage: %s [options]\nwhere:\n"
8101,1,"options:\n"
8102,1,"    -D binddn\tbind dn\n"
8103,1,"    -w passwd\tbind passwd (for simple authentication)\n"
8104,1,"    -k\t\tuse Kerberos instead of Simple Password authentication\n"
8105,1,"    -h host\tldap server\n"
8106,1,"    -p port\tport on ldap server\n"
8107,1,"    -W Wallet\tWallet location\n"
8108,1,"    -P Wpasswd\tWallet Password\n"
8109,1,"    -U SSLAuth\tSSL Authentication Mode\n"
8110,1,"Null Wallet or password given\n"
8111,1," Wrong SSL Authenication Mode Value\n"
/8112,1," %s\n"
8113,1,"bind successful\n"
8114,1,"    -H Prints all options\n"
8115,1,"    -E Encoding Character Set\n"
8116,1,"    -Z [enable native authentication]\n"
8117,1,"    -O SASL\tSecurity properties\n"
8118,1,"    -R SASL\tRealm\n"
8119,1,"    -Y SASL\tMechanism\n"
8120,1,"    -X SASL\tAuthorization identity\n"

8121,1,"Please enter bind password: "
8122,1,"Please enter SSL wallet password:"
8123,1,"Command-line passwords are disabled for LDAP commands.\nUse -q option instead of -w <password>. You will be prompted for the password.\n\n"
8124,1,"Command-line passwords are disabled for LDAP commands.\nUse -Q option instead of -P <password>. You will be prompted for the password.\n\n"

8125,1,"sasl bind successful\n"
8126,1,"%s - normalize dn failed\n"
8127,1,"%s - need mutual authentication\n"

/   BulkLoader  Messages

/8200,1,"%s: invalid format (line %d of entry: %s\n"
/8201,1,"%s: skipping change record for entry: %s\n\t(LDAP host/port does not match replica: lines)\n"
/8202,1,"%s:  unknown %s \"%s\" (line %d of entry: %s)\n"
/8203,1,"%s: expecting \"%s:\" but saw \"%s:\" (line %d of entry %s)\n"
/8204,1,"%s: expecting \"%s:\" but saw \"%s:\" (line %d of entry %s)\n"
/8205,1,"%s: extra lines at end (line %d of entry %s)\n"
/8206,1,"Schema Check failed on %s.\n"
/8207,1,"%s: missing value on line %d (attr is %s)\n"
/8208,1,"%s: no attributes to change or add (entry %s)\n"
/8209,1,"%s %s:\n"
/8210,1,"\tNOT ASCII (%ld bytes)\n"
/8211,1,"\t%s\n"
/8212,1,"%sadding new entry %s\n"
/8213,1,"%smodifying entry %s\n"
/8214,1,"modify complete\n"
/8215,1,"%sdeleting entry %s\n"
/8216,1,"delete complete"
/8217,1,"new RDN: %s (%skeep existing values)\n"
/8218,1,"%smodifying rdn of entry %s\n"
/8219,1,"modrdn completed\n"
/8220,1,"usage: %s [-d debuglevel] [-f datafile] [-s check].\n"
/8221,1,"Could not initialize NLS Context Exiting...\n"
/8222,1,"Could not initialize SLTS Context. Result code = %ld\n"
/8223,1,"Could not initialize oidldapd Server. Result code = %ld\n"
/8224,1,"MUst compile with LDAP_DEBUG for debugging\n"

/   ldap compare  Messages

8300,1,"Null Wallet or password given\n"
8301,1," Wrong SSL Authenication Mode Value\n"
/8302,1," %s\n"
8303,1,"The value %s is contained in the attribute %s in DN %s.\n"
8304,1,"The value %s is not contained in the attribute %s in DN %s.\n"
8305,1,"usage: %s [options] -b basedn -a attrname -v attrvalue\n"
8306,1,"where:\n"
8307,1,"    basedn      base dn for compare\n"
8308,1,"    attrname    assertion attribute\n"
8309,1,"    attrvalue   assertion value\n"
8310,1,"options:\n"
8311,1,"    -D binddn   bind DN\n"
8312,1,"    -w passwd   bind password (for simple authentication)\n"
8313,1,"    -h host     LDAP server\n"
8314,1,"    -p port     port on LDAP server\n"
8315,1,"    -W wurl     wallet location for SSL connection(one-way or two-way)\n"
8316,1,"    -P wpasswd  wallet password for SSL connection(one-way or two-way)\n"
8317,1,"    -U SSLAuth  SSL Authentication Mode (\"1\" no-auth,\"2\" one-way,\"3\" two-way)\n"
8318,1,"    -E charset  encoding character set\n"
8319,1,"    -M          send ManageDsaIT control to server\n"
8320,1,"    -V version  version of LDAP protocol\n"
8321,1,"    -q          prompt for simple bind password\n"
8322,1,"    -Q          prompt for SSL wallet password\n"


/   ldap delete  Messages

8400,1," Wrong SSL Authenication Mode Value\n"
8401,1,"%sdeleting entry %s\n"
8402,1,"entry removed\n"
8403,1,"compile with -DLDAP_DEBUG for debugging\n"
8404,1,"Null Wallet or password given\n"
8405,1,"usage: %s [options] dn | -f file\n"
8406,1,"where:\n"
8407,1,"    dn      list of DNs to delete\n"
8408,1,"    file    read DNs to be delete from `file'\n"
8409,1,"options:\n"
8410,1,"    -D binddn   bind DN\n"
8411,1,"    -w passwd   bind password (for simple authentication)\n"
8412,1,"    -h host     LDAP server\n"
8413,1,"    -p port     port on LDAP server\n"
8414,1,"    -W wurl     wallet location for SSL connection(one-way or two-way)\n"
8415,1,"    -P wpasswd  wallet password for SSL connection(one-way or two-way)\n"
8416,1,"    -U SSLAuth  SSL Authentication Mode (\"1\" no-auth,\"2\" one-way,\"3\" two-way)\n"
8417,1,"    -E charset  encoding character set\n"
8418,1,"    -M          send ManageDsaIT control to server\n"
8419,1,"    -k          use Kerberos instead of Simple Password authentication\n"
8420,1,"    -O refhop   set referral hop limit to `refhop'\n"
8421,1,"    -V version  version of LDAP protocol\n"
8422,1,"    -n          print the delete operations but don't actually delete\n"
8423,1,"    -d level    set LDAP debugging level to `level'\n"
8424,1,"    -v          trun in verbose mode (diagnostics to standard output)\n"
8425,1,"    -q          prompt for simple bind password\n"
8426,1,"    -Q          prompt for SSL wallet password\n"


/   ldap des  Messages

8500,1,"%s: internal error %d (%s)\n"
8501,1,"unable to create language handle"
8502,1,"error processing string"
/8503,1,"%s\n"

/   ldap Search  Messages

8601,1,"usage: %s [options] filter [attributes...]\nwhere:\n"
8612,1,"    filter\tRFC-1558 compliant LDAP search filter\n"
8613,1,"    attributes\twhitespace-separated list of attributes to retrieve\n"
8614,1,"\t\t(if no attribute list is given, all are retrieved)\n"
8615,1,"options:\n"
8616,1,"    -n\t\tshow what would be done but don't actually search\n"
8617,1,"    -v\t\trun in verbose mode (diagnostics to standard output)\n"
8618,1,"    -t\t\twrite values to files in /tmp\n"
8619,1,"    -u\t\tinclude User Friendly entry names in the output\n"
8620,1,"    -A\t\tretrieve attribute names only (no values)\n"
8621,1,"    -B\t\tdo not suppress printing of non-ASCII values\n"
8622,1,"    -L\t\tprint entries in LDIF format (-B is implied)\n"
8623,1,"    -R\t\tdo not automatically follow referrals\n"
8624,1,"    -d level\tset LDAP debugging level to `level'\n"
8625,1,"    -F sep\tprint `sep' instead of `=' between attribute names and values\n"
8626,1,"    -S attr\tsort the results by attribute `attr'\n"
8627,1,"    -f file\tperform sequence of searches listed in `file'\n"
8628,1,"    -b basedn\tbase dn for search\n"
8629,1,"    -s scope\tone of base, one, or sub (search scope)\n"
8630,1,"    -a deref\tone of never, always, search, or find (alias dereferencing)\n"
8631,1,"    -l time lim\ttime limit (in seconds) for search\n"
8632,1,"    -z size lim\tsize limit (in entries) for search\n"
8633,1,"    -D binddn\tbind dn\n"
8634,1,"    -w passwd\tbind passwd (for simple authentication)\n"
8635,1,"    -k\t\tuse Kerberos instead of Simple Password authentication\n"
8636,1,"    -h host\tldap server\n"
8637,1,"    -p port\tport on ldap server\n"
8638,1,"    -W Wallet\tWallet location\n"
8639,1,"    -P Wpasswd\tWallet Password\n"
8640,1,"    -U SSLAuth\tSSL Authentication Mode\n"
8641,1,"    -E charset\tCharacter Set Encoding\n"
/8641,1,"Error "
8642,1,"compile with -DLDAP_DEBUG for debugging\n"
8643,1,"compile with -DLDAP_REFERRALS for referral support\n"
8644,1,"scope should be base, one, or sub\n"
8645,1,"alias deref should be never, search, find, or always\n"
/8646,1,"ldap_open( %s, %d )\n"
8647,1,"Null Wallet or password given\n"
8648,1," Wrong SSL Authenication Mode Value\n"
/8649,1," %s\n"
8650,1,"filter pattern: %s\nreturning: "
/8651,1,"ALL"
/8652,1,"%s "
8653,1,"filter is: (%s)\n"
8654,1,"%d matches\n"
/8655,1,"%s%s%s\n"
8656,1,"    -X\t\tprint entries in XML format \n"

/   ldap Monitor  Messages

8701,1,"Memory Allocation Failed.\n"
8702,1,"NLS_LANG not set in environment.\n"
8703,1,"Please set NLS_LANG to the appropriate AL32UTF8 character set.\n"
8704,1,"Terminating exisiting Monitor Process...\n"
8705,1,"Starting the Monitor process.\n\n"
8706,1,"Fork Failed\n"
8707,1,"Monitor Process Terminated\n\n"
8708,1,"No such Process!!\n"
8709,1,"The Monitor Process is not running.\n"
8710,1,"Could not Disconnect from the Database\n"
8711,1,"Could not free context\n"
8712,1,"No Memory!\n"
8713,1,"Disconnected from the Database\n"
8714,1,"OCI Error: Error code %d\n"
/8715,1,"Fork failed.\n"
8716,1,"usage: %s [connect=cc] [host=hostname] [sleep=nn] start | stop\n"
8717,1,"options:\n"
8718,1,"     connect=cc    The tnsname of the database to connect to for start/stop.\n"
8719,1,"                   If connect string is not provided, it set by default to the\n"
8720,1,"                   value of ORACLE_SID environment variable.\n\n"
8721,1,"     sleep=nn      The time interval in seconds at which the Monitor\n"
8722,1,"                   monitors OiD servers. If sleeptime is not provided,\n"
8723,1,"                   it is set by default to 10 seconds.\n\n"
8724,1,"     start | stop  Start or Stop the Monitor.\n"
8725,1,"ORACLE_SID not set in environment\n"
8726,1,"\n\n\n*****Please try Starting the server again.*****\n\n\n"
8727,1,"Please set NLS_LANG to AMERICAN_AMERICA.AL32UTF8 in system env setting and reboot\n"
8728,1,"     host=hostname  Name of the (logical) host.\n"
8729,1,"                    Defaults to hostname where oidmon is started.\n\n"
8730,1,"usage: %s [connect=cc] [host=hostname] [sleep=nn] username=user\n"
8731,1,"            password=password start | stop\n"
8732,1,"     username=user oidmon service run as this user instead of \n"
8733,1,"                   Local System Account(Default).\n\n"
8734,1,"     password=pswd Password of the user.\n\n"
8735,1,"oidmon is already running.\n"
8736,1,"oidmon is not running on the host %s you provided. Do you wish to continue<Y/N>? [N]"
8737,1,"yes"
8738,1,"oidctl: action aborted.\n"
8739,1,"Error accesssing ODS_GUARDIAN table rc = %d error=%s\n"
8740,1,"oidmon: OID is started by OPMN, please use OPMNCTL command to stop OID.\n\n"

/   ldap OiD Manager  Messages

8800,1,"usage: %s connect=cc server=ss instance=nn             \n        [name=IN] [componentname=CN] [host=hn] \n"
8801,1,"options:\n"
8802,1,"  connect=cc        The tnsname of the database to connect.\n\n"
8803,1,"  server=ss         The name of the OID server.\nserver name is a mandatory argument.\n"
8804,1,"                    Server name must be either oidldapd or oidrepld.\n\n"
8805,1,"  instance=nn       The numerical value of the instance.\n"
8806,1,"                    Instance value is mandatory argument.\n"
8807,1,"                    Instance value MUST be > 0 and <= 100.\n\n"
8808,1,"  name=in           Instance Name to be used(default is inst1)\n\n"
8809,1,"  componentname=cn  Component Name to be used(default is oid1)\n\n"
8810,1,"                    Configset value MUST be >= 0 and <= 1000.\n\n"
8811,1,"  flags=ff          The flags needed ONLY while starting the OID server.\n"
8812,1,"                    If the flags consist of UNIX-style keywords, then,\n"
8813,1,"                    those keyword-value pairs MUST be separted by spaces.\n"
8814,1,"                    Example: flags='-p <port> -debug <debuglevel>'\n\n"
8815,1,"     start | stop | status [-diag] Start or Stop  or Status of the OID server.\n-diag option should be used for status option.\n\n"
8816,1,"  host=hostname     Name of the (logical) host,\n"
8817,1,"                    where OID server to be started/stopped.\n\n"
8818,1,"        [flags=ff] <command>\n"
8819,1,"    Process oidmon is alive as PID = %d \n"
8820,1,"    Process oidmon is not running\n"
8821,1,"    Process oidldapd (dispatcher) is alive as PID = %d\n"
8822,1,"    Process oidldapd is not running\n"
8823,1,"    Process oidrepld is alive as PID = %d\n"
8824,1,"    Process oidrepld is not running\n"
8825,1,"    Process odisrv   is alive as PID = %d\n"
8826,1,"    Process odisrv   is not running\n"
8827,1,"oidctl:Waiting for oidmon to start %s (instance=%d)\n"
8828,1,"oidctl:oidmon is not running on host=%s, componentName=%s instanceName=%s\nWaiting for a few seconds... \n"
8829,1,"oidctl:oidmon is up and running on %s\n"
8830,1,"oidctl:Waiting for oidmon to stop %s (instance=%d) pid=%d\n"
8831,1,"oidctl:Started %s (instance=%d) with PID : %d successfully\n\n"
8832,1,"oidctl:Stopped %s (instance=%d) successfully\n\n"
8833,1,"\noidctl:Checking Oracle Internet Directory Processes ...\n\n"
8834,1,"            oidldapd (server)     is alive as PID = %d\n"
8835,1,"            oidldapd (server)     is not running\n"
8836,1,"\n    Checking %s instance %d  ...\n"
8837,1,"    Instance is shutdown\n"
8838,1,"    Instance is being stopped\n"
8839,1,"    Instance is starting\n"
8840,1,"    Instance is failed over to %s host\n"
8841,1,"\n     %s instance is not configured\n"
8842,1,"    Process oidldapd (dispatcher) is alive as PID = %d port=%d sslport=%d\n"
8843,1,"    Process oidldapd (dispatcher) is alive as PID = %d port=%d\n"
8844,1,"    Process oidldapd (dispatcher) is alive as PID = %d sslport=%d\n"
8845,1,"  name=IN           Name of the instance to be used(default is inst1).\n\n"
8846,1,"  componentname=CN  Name of the component to be used(default is oid1).\n\n"
8847,1,"    OIDMON instanceName=%s, componentName=%s (PID=%d) is running\n\n"
8848,1,"    Set environment variable INSTANCE_NAME=%s and COMPONENT_NAME=%s and retry\n\n"
8849,1,"    OIDMON for the instanceName=%s, componentName=%s is running.\n"
8850,1,"    OIDMON instanceName=%s, componentName=%s is NOT RUNNING.\n"
8851,1,"    command:\n"
8852,1,"      start :  Start the server=ss instance=nn [name=IN componentName=CN]\n"
8853,1,"      stop  :  Stop the server=ss instance=nn [name=IN componentName=CN]\n"
8854,1,"      add   :  Add configuration set entry and start the server instance. \n"
8855,1,"      delete:  Stop the server instance and delete a configuration entry\n"
8856,1,"      status [-diag]:  Status of the running server instances. \n             -diag can be used get the diagnostic information for the server instance(s).\n"


/   ldap Modify Messages

8900,1,"Null Wallet or password given\n"
8901,1," Wrong SSL Authenication Mode Value\n"
8902,1,"%s: invalid format (line %d of entry: %s\n"
8903,1,"%s: skipping change record for entry: %s\n\t(LDAP host/port does not match replica:lines)\n"
8904,1,"%s:  unknown %s \"%s\" (line %d of entry: %s)\n"
8905,1,"%s: expecting \"%s:\" but saw \"%s:\" (line %d of entry %s)\n"
8906,1,"%s: expecting \"%s:\" but saw \"%s:\" (line %d of entry %s)\n"
8907,1,"%s: extra lines at end (line %d of entry %s)\n"
8908,1,"%s: missing value on line %d (attr is %s)\n"
8909,1,"do modify ****\n"
8910,1,"%s: no attributes to change or add (entry %s)\n"
/8911,1,"\tNOT ASCII (%ld bytes)\n"
/8912,1,"\t%s\n"
8913,1,"%sadding new entry %s\n"
8914,1,"%smodifying entry %s\n"
8915,1,"modify complete\n"
8916,1,"%sdeleting entry %s\n"
8917,1,"delete complete"
8918,1,"new RDN: %s (%skeep existing values)\n"
8919,1,"%smodifying rdn of entry %s\n"
8920,1,"modrdn completed\n"
8921,1,"Error while parsing LDIF file\n"

8922,1,"usage: %s [options]\n"
8923,1,"    list of operations are read from stdin or\n"
8924,1,"    from the file with -f file option.\n"
8925,1,"options:\n"
8926,1,"    -D binddn   bind DN\n"
8927,1,"    -w passwd   bind password (for simple authentication)\n"
8928,1,"    -h host     LDAP server\n"
8929,1,"    -p port     port on LDAP server\n"
8930,1,"    -W wurl     wallet location for SSL connection(one-way or two-way)\n"
8931,1,"    -P wpasswd  wallet password for SSL connection(one-way or two-way)\n"
8932,1,"    -U SSLAuth  SSL Authentication Mode (\"1\" no-auth,\"2\" one-way,\"3\" two-way)\n"
8933,1,"    -f file     perform sequence of operations listed in `file'\n"
8934,1,"    -X dsmlfile perform sequence of operations from xml file `dslmfile'\n"
8935,1,"    -a          changetype is add if `changetype' is missing (default is modify)\n"
8936,1,"    -r          replace values (default is add)\n"
8937,1,"    -b          for binary attrs read values from file specified in attrval\n"
8938,1,"    -c          continous operation (do not stop on error)\n"
8939,1,"    -F          force all changes records to be used\n"
8940,1,"    -E charset  encoding character set\n"
8941,1,"    -M          send ManageDsaIT control to server\n"
8942,1,"    -k          use Kerberos instead of Simple Password authentication\n"
8943,1,"    -i          bind as current user for chasing Referrals\n"
8944,1,"    -O refhop   set referral hop limit to `refhop'\n"
8945,1,"    -V version  version of LDAP protocol\n"
8946,1,"    -n          print the operations but don't actually do them\n"
8947,1,"    -d level    set LDAP debugging level to `level'\n"
8948,1,"    -o logfile  log messages will be written to `logfile'\n"
8949,1,"    -v          trun in verbose mode (diagnostics to standard output)\n"


/   ldap Modify DN Messages

8950,1,"Part of the DN that matches an existing entry: %s\n"
8951,1,"%s renamed successfully.\n"
8952,1,"usage: %s [options]\nwhere:\n"
8953,1,"options:\n" 
8954,1,"    -D binddn\tbind dn\n"
8955,1,"    -w passwd\tbind passwd (for simple authentication)\n"
8956,1,"    -b basedn (dn of the entry to be moved)\n"
8957,1,"    -R newrdn (new rdn)\n"
8958,1,"    -N new parentDN (dn of the parent where this has to be moved)\n"
8959,1,"    -r delete old rdn (if specified removes old rdn )\n"
8960,1,"    -k\t\tuse Kerberos instead of Simple Password authentication\n"
8961,1,"    -h host\tldap server\n"
8962,1,"    -p port\tport on ldap server\n"
8963,1,"    -W Wallet\tWallet location\n"
8964,1,"    -P Wpasswd\tWallet Password\n"
8965,1,"    -U SSLAuth\tSSL Authentication Mode\n"
8966,1,"    -E character set encoding\n"
8967,1,"Cannot rename entry to super user."

/  ldap Modify messages
8980,1,"    -q          prompt for simple bind password\n"
8981,1,"    -Q          prompt for SSL wallet password\n"
8982,1,"XML Parser initialization failed\n"


/   s0gslsrv Messages

/ usage message consists of messages 9000, 9001, 9002
9000,1,"usage:\n oidldapd\t[connect=<connect descriptor>]\n\t\t[port=<port number>]\n\t\t[instance=<instance number>]\n"
9001,1,"\t\t[configset=<configset number>]\n\t\t[version]\n Unique abbreviations of any parameters are accepted.\n"
9002,1," Parameter names may be optionally preceeded with a dash (-)\n"


/   LDAP Server main function Messages

9050,1,"usage: %s connect=<connect String> flags=\"[-d debuglevel] [-p portnumber]\"\n"
9051,1,"Could not initialize NLS Context Exiting...\n"
9052,1,"Could not initialize SLTS Context. Result code = %ld\n"
9053,1,"Could not initialize OiD LDAP Server. Result code = %ld\n"
9054,1,"Failed to get Oracle core context. Program exiting.\n"
9055,1,"Failed to read replication configuration. Program exiting.\n"
9056,1,"No replication agreement to be processed. replication server exits.\n"
9057,1,"usage: %s flags=\"[options]\"\n"
9058,1,"options:\n"
9059,1,"    -h host\t\tldap server\n"
9060,1,"    -p port\t\tport on ldap server\n"
9061,1,"    -d level\t\tset LDAP debugging level to `level'\n"
9062,1,"    -m [true/false]\tset multi-master to true or false. Defaulted to true.\n"
9063,1,"Problem in opening the log file. Check $ORACLE_HOME/ldap/log. \n"
9064,1,"    -i instance\t\tinstance on ldap server\n"
9065,1,"usage: %s flags=\"[options]\"\n"
9066,1,"options:\n"
9067,1,"    -ihome ihome\t\tinstance home\n"
9068,1,"    -oidname oidname\t\tOID component name\n"
9069,1,"    -dbhost dbhost\t\tDB host name\n"
9070,1,"    -dbport dbport\t\tDB port\n"
9071,1,"    -dbsvcname dbsvcname\tDB service name\n"
9072,1,"    -oldpwd oidpwd\t\tOld DB Password\n"
9073,1,"    -newpwd newpwd\t\tNew DB Password\n"
9074,1,"    -mode [short/firstInst/secInst/upgrade]\n"
9075,1,"          install Mode: short term/first inst/second inst/upgrade\n"
9076,1,"    <-firstihome firstihome\tFirst Inst's instance home>\n"
/   s0service Messages

9100,1,"OracleDirectoryService Created \n"
9101,1,"Failed to Open OracleDirectoryService: (0x%02x)\n"
9102,1,"OracleDirectoryService removed \n"
9103,1,"Failed to remove OracleDirectoryService: (0x%02x)\n"
9104,1,"falied to install OracleDirectoryService: (0x%02x)\n"
9105,1,"Falied to access OracleDirectoryService:(0x%02x)\n"
9106,1,"OracleDirectoryService started \n"
9107,1,"Falied to start OracleDirectoryService: (0x%02x)\n"
9108,1,"Failed to run OracleDirectoryService\n"
9109,1,"Failure:OracleDirectoryService stopped\n"
9110,1,"Failed to access OracleDirectoryService: (0x%02x)\n"
9111,1,"Stopped OracleDirectoryService\n"
9112,1,"failed to stop OracleDirectoryService: (0x%02x)\n"
9113,1,"       instsrv connect=<connect string> sleep=<time in secs> start\n"
9114,1,"           to start oidmonitor\n"
9115,1,"       instsrv remove\n"
9116,1,"           to remove oidmonitor\n"
9117,1,"       instsrv stop\n"
9118,1,"           to stop oidmonitor\n"

/   Ldif Writer Messages

9201,1,"Could not connect to the Database.\n"
9202,1,"Invalid DN syntax for %s\n"
9203,1,"DN normalization failed\n"
9204,1,"Semaphore Initialize Operation Failed\n"
9205,1,"Semaphore Destroy Operation Failed\n"
9206,1,"Failed to spawn LDIF Reader Thread\n"
9207,1,"Failed to spawn LDIF Writer Thread\n"
9208,1,"Subtree Search failed.\n"
9209,1,"Base DN %s not found.\n"
9210,1,"Problem in opening the log file. Check %s.\n"
9211,1,"Mutex Acquire failed\n"
9212,1,"Mutex Release failed\n"
9213,1,"Semaphore Operation Failed\n"
9214,1,"Semaphore Post Operation Failed\n"
9215,1,"usage: %s -c <DB Connect String> -b <Base DN> -f <filename>\n"
9216,1,"options:\n"
9217,1,"          -c <DB Connect String>   The tnsname of the database to connect to.\n"
9218,1,"          -b <Base DN>             The base DN for subtree search.\n"
9219,1,"          -f <filename>            The name of the output LDIF file. Filename\n"
9220,1,"                                   is mandatory for LDIF file creation.\n"
9221,1,"                                   It is not required for Catalog creation.\n"
9222,1,"          -m <TRUE | FALSE>        The functional mode of LDIF writer.\n"
9223,1,"                                   TRUE = intermediate file generation mode\n"
9224,1,"                                   for Catalog Management.\n"
9225,1,"                                   FALSE = LDIF file generation mode for\n"
9226,1,"                                   adding a new node.\n"
9227,1,"          -a <attribute name>      The attribute type to be Cataloged.\n"
9228,1,"                                   This is to be specified if and only if\n"
9229,1,"                                   -m is TRUE. Do not specify attribute name\n"
9230,1,"                                   with -m FALSE option.\n" 
9231,1,"          -E <encoding>            The native character set encoding.\n"
9232,1,"This tool can only be executed if you know database user password for OID\nEnter OID Password ::"
9233,1,"Password required\n"
9234,1,"Unable to Connect to Database: Incorrect location for tnsnames.ora (derived from ORACLE_INSTANCE) or Incorrect TNS Connect string or Invalid Password\n"
9235,1,"ERROR: ORACLE_INSTANCE must be set\n"

/ Bulkmodify messages

9301,1,"usage: %s -c <DB Connect String> -b <Base DN> {-a|-r} <attr name> -v <attr value> -f <filter> [-s <size>]\n"
9302,1,"          -c <DB Connect String>  The tnsname of the database to connect to.\n"
9303,1,"          -b <Base DN>            The base DN for Bulkmodify.\n"
9304,1,"     {-a|-r} <attr name>          The attribute name to be added/replaced\n" 
9305,1,"          -v <attr value>         The attribute value to be used for add/replace\n"
9306,1,"          -f <filter>             The filter to be used for modify\n"
9307,1,"          -s <size>               Number of Entries to be committed as a part of one transaction. \n"
9308,1,"Cannot perform add  on %s Attribute since it is not MultiValued \n"
9309,1,"Cannot Perform BulkModify operation on %s  Attribute \n"
9310,1,"          -E <encoding>           NAtive Character set encoding.\n"

/ s0gslpwd messages

9400,1,"create secret store ?y/n"
9401,1,"current password: "
9402,1,"    new password: "
9403,1,"        password: "
9404,1,"confirm password: "
9405,1,"password set\n"
9406,1,"invalid password. permission denied\n"
9407,1,"cannot verify password.\n"
9408,1,"empty password not allowed.\n"
9409,1,"unable to contact database.\n"
9410,1,"passwords do not match.\n"
9411,1,"new password must be different from the current.\n"
9412,1,"Replication password file exists\n"
9413,1,"Usage: oidpasswd connect=<Net8 Connect Descriptor> [change_oiddb_pwd=true | create_wallet=true | unlock_su_acct=true| reset_su_password=true | manage_su_acl=true]\n"
9414,1,"lock password: "
9415,1,"unlock password: "
9416,1,"only [change_oiddb_pwd|create_wallet|unlock_su_acct|manage_su_acl|reset_su_password] choice at a time.\n"
9417,1,"OID DB user password: "
9418,1,"OID super user account unlocked successfully.\n"
9419,1,"Error in unlocking OID super user account.\n"
9420,1," connect: Database connect string\n"
9421,1," change_oiddb_pwd: Change OID database password\n"
9422,1," create_wallet: Create LDAP and Replication server wallets\n"
9423,1," unlock_su_acct: Unlock OID super user account\n"
9424,1,"OID super user password reset successfully.\n"
9425,1,"Error in resetting OID super user password.\n"
9426,1," reset_su_password: Reset OID super user password\n"
9427,1," manage_su_acl: Manage super user restriced ACL\n"
9428,1,"OID super user restriction reset successfully\n"
9429,1,"Error in resetting super user restricted ACLs\n"
9430,1,"Enter 'resetall' or the number(s) of the ACP to be reset separated by [,]\n"
9431,1,"No restricted ACP found\n"
9432,1,"ACP %s not found in the list\n"
9433,1,"resetall"
9434,1,"The super user restricted ACP list\n"
9435,1,"Please enter any key to continue...\n"
9999,1,"UnKnown Error Encountered\n"

/   Common Monitor & OiD mgr messages

10000,1,"Invalid username/password.\n"
10001,1,"TNS could not resolve service name.\n"
10002,1,"Database fetch error.\n"
10003,1,"Invalid Server Name.\n"
10004,1,"Database update error.\n"
10005,1,"*** Instance Number already in use. ***\n"
10006,1,"*** Please try a different Instance number. ***\n"
10007,1,"Database insert error.\n"
10008,1,"***Cannot Stop an Instance that is not running***\n"
10009,1,"***Cannot Restart Server Instances that are not running***\n"
10010,1,"Database delete error.\n"
10011,1,"Database open error.\n"
10012,1,"Database not installed with AL32UTF8 Character Set.\n"
10013,1,"Please reinstall the Database with AL32UTF8 Character Set.\n"
10014,1,"Could not Connect to the Database.\n"
10015,1,"Internal OCI error.\n"
10016,1,"Internal OiD Monitor Error.\n"
10017,1,"Problem in opening the log file. Check $ORACLE_HOME/ldap/log. \n"
10018,1,"Database commit error.\n"

/10100,1,"gsdospa: command line argument limit of 32 exceeded\n"
/10101,1,"gsdospa: failed to initialize message handler\n"
/10102,1,"gsdospa: oapapa returned unknown index %d\n"
/10103,1,"oapapa: Invalid type of argument!\n"

/   Replication Server messages

10200,1,"Failed to open %s. Program exiting.\n"
10201,1,"ldap_open/ldap_bind failed. Program exiting.\n"
10202,1,"Failed on memory allocation. Exiting.\n"
10203,1,"Failed on file I/O. Exiting.\n"

/ ldapaddmt messages
10300,1,"orclguid doesn't match.\n"
10301,1,"Invalid source entry: only 'orclguid' attribute found.\n"
10302,1,"usage: %s [options]\n"
10303,1,"    list of operations are read from stdin or\n"
10304,1,"    from the file with -f file option.\n"
10305,1,"options:\n"
10306,1,"    -D binddn   bind DN\n"
10307,1,"    -w passwd   bind password (for simple authentication)\n"
10308,1,"    -h host     LDAP server\n"
10309,1,"    -p port     port on LDAP server\n"
10310,1,"    -W wurl     wallet location for SSL connection(one-way or two-way)\n"
10311,1,"    -P wpasswd  wallet password for SSL connection(one-way or two-way)\n"
10312,1,"    -U SSLAuth  SSL Authentication Mode (\"1\" no-auth,\"2\" one-way,\"3\" two-way)\n"
10313,1,"    -T threads  Number of threads to start for processing\n"
10314,1,"    -f file     perform sequence of operations listed in `file'\n"
10315,1,"    -X dsmlfile perform sequence of operations from xml file `dslmfile'\n"
10316,1,"    -a          changetype is add if `changetype' is missing (default is modify)\n"
10317,1,"    -r          replace values (default is add)\n"
10318,1,"    -b          for binary attrs read values from file specified in attrval\n"
10319,1,"    -c          continous operation (do not stop on error)\n"
10320,1,"    -F          force all changes records to be used\n"
10321,1,"    -E charset  encoding character set\n"
10322,1,"    -M          send ManageDsaIT control to server\n"
10323,1,"    -k          use Kerberos instead of Simple Password authentication\n"
10324,1,"    -O refhop   set referral hop limit to `refhop'\n"
10325,1,"    -V version  version of LDAP protocol\n"
10326,1,"    -d level    set LDAP debugging level to `level'\n"
10327,1,"    -q          prompt for simple bind password\n"
10328,1,"    -Q          prompt for SSL wallet password\n"


/ NLS implementation Messages

10500,1,"Character set specified by -E argument (%s) doesn't match NLS_LANG character set (%s)\n"
10501,1,"Error initializing Input Charset handle(%s)\n"

/ Common perror messages

11000,1,"Cannot connect to the LDAP server\n"
11001,1,"Cannot get the name of the local host\n"
11002,1,"Temporary file creation failed.\n"
11003,1,"File open failure (%s).\n"
11004,1,"File read failure (%s).\n"
11005,1,"File write failure (%s).\n"

/Audit Log Messages
12000, 1, "Adding entry: %s"
12001, 1, "Adding: "
12002, 1, "Super user login: %s"
12003, 1, "Replication login: %s"
12004, 1, "Proxy user login: %s"
12005, 1, "Guest user login: %s"
12006, 1, "User login: %s"
12007, 1, "Deleting entry: %s"
12008, 1, "Deleting: " 
12009, 1, "Modifying DSE entry: "
12010, 1, "Modifying userpassword attribute. DN: %s" 
12011, 1, "Modifying %s"
12012, 1, "Modifying entry %s"
12013, 1, "Modify DN: %s   New RDN: %s   New Parent: %s"
12014, 1, "Modify DN:  New RDN: %s   New Parent: %s"
12015, 1, "Adding Objectclass %s"
12016, 1, "Replacing Objectclass %s"
12017, 1, "Adding Attributes %s"
12018, 1, "Replacing Attributes %s"

12019, 1, "Deleting Attribute "
12020, 1, "Deleting Objectclass "
12021, 1, "Deleting: %s does not match it's oid: %s"
12022, 1, "%s objectclass referred in Content Rule is not defined in Schema."
12023, 1, "%s attribute referred in the Content Rule is not defined in Schema."
12024, 1, "%s objectclass is not a structural class."
12025, 1, "Cannot delete Content rule. %s Content Rule does not exist in Schema."
12026, 1, "Modifying ACL. DN: %s"

/ oidreconcile Message

12100, 1, "usage: %s -h supplierhost -c consumerhost -b basedn -W supplierpasswd -w consumerpasswd [options]:\n"
12101, 1, "-h supplierhost\tConnects to supplier OID host. It can be a hostname or an IP address\n"
12102, 1, "-c consumerhost\tConnects to consumer OID host. It can be a hostname or an IP address\n"
12103, 1, "-b basedn\tBase dn for reconciliation\n"
12104, 1, "options:\n"
12105, 1, "-P supplierport\tConnects to the supplier OID port\n" 
12106, 1, "\t\tIf you do not specify this option, the tool uses the default port (389)\n"
12107, 1, "-p consumerport\tConnects to the consumer OID port\n"
12108, 1, "\t\tIf you do not specify this option, the tool uses the default port (389)\n"
12109, 1, "-s scope\tReconcile scope. The scope can be \"subtree\" or \"base\"\n"
12110, 1, "%s: dn: %s is not found in consumer and supplier directory\n"
12111, 1, "%s: dn: %s is not found in supplier node\n"
12112, 1, "%s: Do you want delete dn %s from consumer node? (Y/N)\n"
12113, 1, "%s: delete successfully\n"
12114, 1, "%s: reconcile suffessfully\n"
12115, 1, "%s: %s is the entry whose parent with common orclGUID\n"
12116, 1, "-T thread\tWorker Thread\n"
12117, 1, "%s: Worker thread can not be less than 1. Default single thread\n"
12118, 1, "%s: Reconcile successfully\n"
12119, 1, "%s: Cannot find parent with common orclGUID\n"
12120, 1, "%s: Deleting dn: %s on Consumer node ...\n"
12121, 1, "-w consumerpwd\tPassword of replication DN of Consumer node\n"
12122, 1, "%s: Please provide password of replication DN of Supplier/Consumer node\n"
12123, 1, "-W supplierpwd\tPassword of replication DN of Supplier node\n"

/ Password Policy and Verifier Framework messages

12500, 1, "Password Policy Error :%d: %s :Your Password has expired. Please contact the Administrator to change your password."
12501, 1, "Password Policy Error :%d: %s : Your account is locked. Contact your OID administrator."
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause: The configured maximum for consecutive bind failures allowed as the given user was exceeded.
// *Action: Set orclpwdaccountunlock on the user entry to 1. This action can be performed only by users with the appropriate privileges.
12502, 1, "Password Policy Error :%d: %s : Your Password will expire in %d seconds. Please change your password now.\n"
12503, 1, "Password Policy Error :%d: %s : Your Password has expired. You have %d Grace logins left.\n"
12504, 1, "Password Policy Error :%d: %s :Your Password must be at least %d characters long.\n"
12505, 1, "Password Policy Error :%d: %s :Your Password must contain at least %d numeric characters.\n"
12506, 1, "Password Policy Error :%d: %s : Your Password cannot be a Null Password.\n"
12507, 1, "Password Policy Error :%d: %s :Your New Password cannot be the same as your Old Password.\n"
12508, 1, "Password Policy Error :%d: %s : You must change your Password now.\n"
12509, 1, "Password Policy Error :%d: %s :You must provide your Old Password.\n"
12510, 1, "Password Policy Error :%d: %s :You have %d Grace logins left. Please change your password.\n"
12511, 1, "Password Policy Error :%d: %s :The value of orclpwdalphanumeric must be less than or equal to the value of pwdminlength.\n"
12512, 1, "Cannot Add Password Policy Entry without userbase set in the Common entry.\n"
12513, 1, "Password Policy Error :%d: %s :The password you typed is not acceptable because it is based on a common dictionary word. Please try a different password.\n"
12514, 1, "Password Policy Error :%d: %s :Your New Password cannot be the same as one your Old Passwords in history.\n"
12515, 1, "Password Policy Error :%d: %s :Your Password has been reset; You must change your password before performing other operations.\n"
12516, 1, "Password Policy Error :%d: %s :You cannot change your password for %d seconds.\n"
12517, 1, "Password Policy Error :%d: %s : Your account is locked from this IP address. Please try logging in from a different Host/IP address."
12518, 1, "Password Policy Error: Passwords in history cannot exceed 25\n" 
12520, 1, "Account Policy Error :%d: %s :Your Account has been disabled. Please contact the administrator.\n"
12521, 1, "You cannot add entries containing authpasswords.\n"
12522, 1, "You cannot modify authpasswords.\n"
12523, 1, "You cannot delete authpasswords without appID subtype.\n"
12524, 1, "You cannot compare authpasswords without appID as a subtype.\n"
12525, 1, "You cannot add cleartext orclpasswords.\n"
12526, 1, "You cannot modify orclpasswords using cleartext values .\n"
12527, 1, "You cannot delete orclpasswords.\n"
12528, 1, "You cannot compare orclpasswords.\n"
12529, 1, "You cannot compare orclpassword attribute.\n"
12530, 1, "You cannot compare authpassword attribute.\n"
12531, 1, "The orclpwdverifierparams attribute must be subtyped with authpassword or orclpasswordverifier.\n"
12532, 1, "You cannot modify or delete orclappid.\n"
12533, 1, "You cannot add orclpasswordverifier without appID as a subtype.\n"
12534, 1, "You cannot modify orclpasswordverifier without appID as a subtype.\n"
12535, 1, "You cannot delete orclpasswordverifier without appID as a subtype.\n"
12536, 1, "You cannot compare orclpasswordverifier without appID as a subtype.\n"
12537, 1, "You cannot compare orclpasswordverifier attribute.\n"
12540, 1, "Account Policy Error :%d: %s :Invalid value specified for orclpwdaccountunlock attribute. The only allowed value is 1.\n"
12541, 1, "An entry containing the orclpwdaccountunlock or orclaccountstatusevent attributes cannot be added.\n"
12542, 1, "Account Policy Error :%d: %s :Your account is not active.\n"
12543, 1, "Password Policy Error :%d: %s : Your Password Hint cannot be a Null Value.\n"
12544, 1, "Password Policy Error :%d: %s : Your Password Hint Answer cannot be a Null Value.\n"
12545, 1, "Password Policy Error :%d: %s : Error encountered during Password Hint Answer comparison.\n"
12546, 1, "Account Policy Error :%d: %s : Only Modify-add allowed on orclpwdaccountunlock and orclaccountstatusevent attributes. Modify-delete and Modify-replace are not allowed.\n"
12547, 1, "Active Start and End Dates must be in UTC format (YYYYMMDDHHMMSSz) without any dashes, hyphens and spaces.\n"
12548, 1, "Attribute %s can be searched only over a mutually authenticated SSL session.\n"
12549, 1, "Password Policy Error :%d: %s :Your Password must contain at least %d alphabetic characters.\n"
12550, 1, "Password Policy Error :%d: %s :Your Password must contain at least %d special characters.\n"
12551, 1, "Password Policy Error :%d: %s :Your Password must contain at least %d upper case characters.\n"
12552, 1, "Password Policy Error :%d: %s :Your Password must contain at least %d lower case characters.\n"
12553, 1, "Password Policy Error :%d: %s :Your Password can only contain %d repeated characters.\n"
12554, 1, "Password Policy Error :%d: %s: The pwdPolicySubentry provided is invalid.\n"
12555, 1, "Password Policy Error :%d: %s: The pwdPolicy entry you are deleting is currently in use.\n"
12556, 1, "Password Policy Error :%d: %s: The DN of a pwdPolicy entry may not be modified.\n"
12557, 1, "Password Policy Error :%d: %s :Your Password has to be at least %d seconds old before it can be changed.\n"
12558, 1, "Password Policy Error :%d: %s : Your Password has expired. You have %d seconds left for grace logins.\n"
12559, 1, "Password Policy Error :%d: %s : orclgracelogintimelimit and pwdgraceloginlimit are mutually exclusive. Both cannot be non-zero.\n"
12560, 1, "Password Policy Error :%d: %s : The pwdpolicysubentry attribute in the root DSE cannot be deleted.\n"
12561, 1, "Password Policy Error :%d: %s : Only password policies defined in the Root Oracle Context, are applicable in the Root DSE.\n"
12562, 1, "Two realms cannot reference the same DN in orclcommonusersearchbase.\n"
12563, 1, "Password Policy Error :%d: %s :Policy contains an element with negative value (where a positive value is expected).\n"
12564, 1, "Password Policy Error :%d: %s : The policy element %s expects 0(for false) and 1(for true).\n"

/regsrv message
12600, 1, "usage: %s -D <binddn> -w <bindpasswd> [-h <hostname>] [-p <port>] \n"
12601, 1, "[-U <SSL Authentication mode>] [-W <SSL Wallet Location>] [-P <SSL Wallet Password>] \n"

/ odisrv Messages

20001,1,"usage: %s [host=<host>] [port=<port>]\n"
20002,1,"          [instance=<#>] configset=<#> [debug=<>]\n"
20003,1,"          [sslauth=<> wloc=<> wpass=<>]\n"
20004,1,"    \n\n"
20005,1,"host: LDAP server host. Default: Current host.\n"
20006,1,"    port: LDAP server port. Default: 389.\n"
20007,1,"    instance: instance (0...1000). Mandatory \n"
20008,1,"    configset: Config set to execute. Mandatory.\n"
20009,1,"    debug: Trace Level.\n"
20010,1,"    sslauth: SSL Authentication Mode.\n"
20011,1,"    wloc: Wallet Location.\n"
20012,1,"    wpass: Wallet Password.\n"

/ HR Agent Messages

20101,1,"%s: <profileName> connect=[] login=[] pass=[] date=[]\n"
20102,1,"        login=[] pass=[] [outfile=[]] \\\n"
20103,1,"        [mapfile=[]] [filetype=[]] [tracefile=[]] \\\n"
20104,1,"        [debug=[]] [host=[]] [port=[]] \\\n"
20105,1,"        [binddn=[]] [bindpwd=[]] [dnrule=[]] [idrule=[]]\n"
20106,1,"        [sslauth=[] wloc=[] wpass=[]]\n"
20107,1,"mode : IMPORT (EXPORT not supported).\n"
20108,1,"sync : To Actually synchronize (true/false).\n"
20109,1,"connect : Database Connect String.\n"
20110,1,"login : Database login .\n"
20111,1,"pass : Database password .\n"
20112,1,"date : Changes since this Date.\n"
20113,1,"config : Configuration File.\n"
20114,1,"outfile : Output Data File for Import.\n"
20115,1,"mapfile : Mapping to Use .\n"
20116,1,"host : LDAP server host.\n"
20117,1,"port : LDAP server port.\n"
20118,1,"binddn : BindDN .\n"
20119,1,"bindpwd : Bind Password .\n"
20120,1,"dnrule : DN Naming Rule.\n"
20121,1,"idrule : target identifier rule.\n"
20122,1,"sslauth: SSL Authentication Mode.\n"
20123,1,"wloc: Wallet Location.\n"
20124,1,"wpass: Wallet Password.\n"

20201,1,"%s: mode=IMPORT/EXPORT sync=TRUE/FALSE mapfile=[] \\\n"
20202,1,"%s: infile=[] outfile=[] file_type=[] tracefile=[] \\\n"
20203,1,"     host=[] port=[] binddn=[] bindpwd=[] \\\n"
20204,1,"      domain=[] idrule=[] dnrule=[] minchgnum=[]\\\n"
20205,1,"       debug=[] \n"
20206,1,"mode:IMPORT or EXPORT.\n"
20207,1,"sync:To Synchronize or not.\n"
20208,1,"mapfile:Data Mapping Config file. \n"
20209,1,"infile:Input Data File for Import.\n"
20210,1,"outfile:Output Data File for Export.Not supported Currently.\n"
20211,1,"filetype:format of data in data files.TAGGED/LDIF\n"
20212,1,"tracefile:Tracing enabled.\n"
20213,1,"host:LDAP Host.\n"
20214,1,"port:LDAP port.\n"
20215,1,"binddn:LDAP binddn .\n"
20216,1,"bindpwd:LDAP bind passwod.\n"
20217,1,"domain:Sync Context.\n"
20218,1,"idrule:Entry Identification Rule.\n"
20219,1,"dnrule:DN naming Rule\n"
20220,1,"minchgnum: change number to apply from for EXPORT.\n"
20221,1,"maxchgnum: Max change number to apply to for EXPORT.\n"
20222,1,"sslauth: SSL Authentication Mode.\n"
20223,1,"wloc: Wallet Location.\n"
20224,1,"wpass: Wallet Password.\n"


/ OID LDAP server manageability messages

20225,1,"The value of orclstatsflag is not valid.  The valid values are 1 for enabling and 0 for disabling.\n"
20226,1,"The value of orclstatsperiodicity is not valid.  It should be a positive integer with valid value.\n"
20227,1,"The value of orclstatslevel is not valid.  It should be a positive integer with valid value.\n"
20228,1,"The value of orcleventlevel is not valid.  It should be a positive integer with valid value.\n"

/ REMTOOL Messages 21000 to 21999

21000, 1, "internal error: memory allocation failed."
21001, 1, "internal error: invalid parameters specified."
21002, 1, "Invalid replication site."
21003, 1, "Invalid global name specified."
21004, 1, "internal error : %s is an unknown initialization parameter."
21005, 1, "internal error : Unknown replication role."
21006, 1, "Purge job has not been scheduled or is broken."
21007, 1, "Unknown replication object exists in repl group."
21008, 1, "Insufficient buffer length supplied."
21009, 1, "Context parameter already initialized."
21010, 1, "Initialization parameter %s' value is incorrect. Set %s' value to %s in INIT.ORA file and restart the database."
21011, 1, "SYSTEM user password is not provided."
21012, 1, "Internal error : NULL pointer supplied."
21013, 1, "Database link \"%s\" connects to incorrect destination."
21014, 1, "Scheduled link does not exist or is broken to destination \"%s\"."
21015, 1, "\"%s\" database link does not exist or has invalid details."
21016, 1, "Replication agreement entry is invalid."
21017, 1, "Replication support could not be generated  for %s %s.%s."
21018, 1, "User '%s' is not a valid replication administrator."
21019, 1, "internal error : buffer overflow"
21020, 1, "Initialization parameter %s' value has been altered to %s. Alter INIT.ORA file to reflect the above change."
21021, 1, "User \"%s\" does not have necessary privileges required for replication administrator."
21022, 1, "User \"%s\" has been granted privileges required for replication administration."
21023, 1, "User \"%s\" does not have propagator role."
21024, 1, "User \"%s\" has been granted propagator role."
21025, 1, "Purge job has been scheduled."
21026, 1, "\"%s\" database link that was not existing or had invalid details, has been created."
21027, 1, "Scheduled link to destination \"%s\" has been created as it was broken or not available."
21028, 1, "Replication agreement entry has invalid hostname \"%s\"."
21029, 1, "Replication agreement entry has duplicate hostname \"%s\"."
21030, 1, "\"%s\" hostname has been removed from replication agreement entry as it is not part of DRG or was repeated."
21031, 1, "\"%s\" hostname has been added to replication agreement entry."
21032, 1, "Replication support is not available for %s %s.%s."
21033, 1, "Replication support has been generated for %s %s.%s."
21034, 1, "%s.%s schema object required for OID replication does not exist."
21035, 1, "%s.%s schema object required for OID replication was not existing and has been created."
21036, 1, "%s"
21037, 1, "Master definition site cannot be dropped."
21038, 1, "Replication agreement entry conflicts with node %s."
21039, 1, "Replica ID has been changed to %s."
21040, 1, "Replication has been generated with invalid columns as primary key for %s %s.%s."
21041, 1, "TNS entry for site %s has invalid connection details (hostname/service name/sid name)."
21042, 1, "TNS entry for site %s is not available."
21043, 1, "Listener is not available for site %s or Listener is not listening at port specified in connection details of TNS entry."
21044, 1, "Database %s is not up and running."
21045, 1, "Connection to database %s is refused."
21046, 1, "Replication administrator account %s does not exist at site %s or has different password."
21047, 1, "Database %s at %s host is identified as two different nodes by %s and %s."
21048, 1, "Database %s at %s host has same global name as database %s at %s host."
21049, 1, "Global name of database \"%s\" at host \"%s\" has been changed to %s as it conflicts with database %s at %s host."
21050, 1, "%s replication group has been created at %s."
21051, 1, "%s replication group is not available at %s."
21052, 1, "Replication administrator %s has been altered / created at site %s."
21053, 1, "Replication administrator %s of %s site does not have basic roles necessary to do replication setup verification."
21054, 1, "%s replication site is not part of %s replication group at %s."
21055, 1, "%s replication site has been added to %s replication group at %s."
21056, 1, "Update resolution / column group is not available or is invalid for %s %s.%s."
21057, 1, "Global name of database \"%s\" at host \"%s\" has to be renamed to %s from %s."
21058, 1, "Global name of database \"%s\" at host \"%s\" has been changed to %s."
21059, 1, "User \"%s\" does not have receiver role."
21060, 1, "User \"%s\" has been granted receiver role."
21061, 1, "Replication support cannot be generated for %s %s.%s. now."
21062, 1, "Unable to bind to directory server."
21063, 1, "Failed to add entry %s."
21064, 1, "Failed to modify entry %s."
21065, 1, "Failed to delete entry %s."
21066, 1, "Failed to construct LDAPMod instance for entry %s."
21067, 1, "Failed to rename entry %s."
21068, 1, "LDAP search failed for base DN %s."
21069, 1, "This replica has a supplier already."
21070, 1, "Failed to read replication configuration information."
21071, 1, "Replicaid %s is not part of this drg."
21072, 1, "Replica %s is master replica and cannot be deleted."
21073, 1, "Invoke the remtool at host %s to change the password of ldap://%s:%d replica."
21074, 1, "Failed to change the wallet password."
21075, 1, "Replicaid %s (ldap://%s:%d) is already part of this drg."
21076, 1, "Replica %s has consumer(s) and cannot be deleted."
21077, 1, "This database (host name : %s, instance name : %s, replicaid : %s) is already part of a DRG."
21078, 1, "Replicaid is not initialized. Startup and shutdown ldap server to initialize replicaid."
21079, 1, "Global name \"%s\" is not part of this DRG."
21080, 1, "ldap://%s:%d: Unable to bind to directory server.\nInvalid credentials\n"
21081, 1, "ldap://%s:%d: Unable to bind to directory server.\n"
21082, 1, "Replica %s is primary replica in multimaster agreement and cannot be deleted."
21083, 1, "Change primary replica using remtool -pchgmaster -multimaster before deleting this replica."

/ REMTOOL When error occurred Messages 

21200, 1, "ASR SETUP ERROR/WARNING:"
21201, 1, "CORRECTED:"
21202, 1, "Error occurred while verifying initialization parameter."
21203, 1, "Error occurred while altering initialization parameter."
21204, 1, "Error occurred while verifying roles granted to replication administrator."
21205, 1, "Error occurred while granting replication administrator/receiver/propagator role."
21206, 1, "Error occurred while verifying purge job."
21207, 1, "Error occurred while scheduling purge job."
21208, 1, "Error occurred while verifying database link."
21209, 1, "Error occurred while creating database link."
21210, 1, "Error occurred while dropping database link."
21211, 1, "Error occurred while verifying scheduled link."
21212, 1, "Error occurred while creating scheduled link."
21213, 1, "Error occurred while verifying replication agreement entry."
21214, 1, "Error occurred while altering replication agreement entry."
21215, 1, "Error occurred while verifying replication group."
21216, 1, "Error occurred while creating schema objects that are required for OID replication."
21217, 1, "Error occurred while adding schema object to replication group."
21218, 1, "Error occurred while dropping schema object from replication group."
21219, 1, "Error occurred while altering replication status."
21220, 1, "Error occurred while generating replication support."
21221, 1, "Error occurred while getting administrative request errors."
21222, 1, "Error occurred while getting eferred transaction errors."
21223, 1, "Error occurred while initializing gslrem layer "
21224, 1, "Error occurred while cleaning up ASR setup."
21225, 1, "Error occurred while setting up ASR."
21226, 1, "Error occurred while creating replication administrator."
21227, 1, "Error occurred while adding replication site."
21228, 1, "Error occurred while doing deferred administrative request(s)."
21229, 1, "Error occurred while relocationg master definition site."
21230, 1, "Error occurred while changing replication administrator's password."
21231, 1, "Error occurred while adding replication agreement entry."
21232, 1, "Error occurred while changing replicaid."
21233, 1, "Error occurred while getting replicaid."
21234, 1, "Error occurred while verifying replication key columns."
21235, 1, "Error occurred while dropping replication administrator."
21236, 1, "Error occurred while altering global name."
21237, 1, "Error occurred while cleaning error queue."
21238, 1, "Error occurred while dropping scheduled link."
21239, 1, "Error occurred while getting queue statistics."
21240, 1, "Error occurred while verifying replication resolution method used."
21241, 1, "Error occurred while synchronizing GUIDs."
21242, 1, "Error occurred while cleaning entries."

/ REMTOOL log messages 

21300, 1, "Completed successfully..."
21301, 1, "Completed unsuccessfully..."
21302, 1, "Verifying initialization parameter..."
21303, 1, "Verifying replication administrator roles..."
21304, 1, "Verifying database links..."
21305, 1, "Verifying purge job..."
21306, 1, "Verifying scheduled links..."
21307, 1, "Verifying replication group..."
21308, 1, "Verifying replication agreement entry..."
21309, 1, "Verifying availability of replication objects..."
21310, 1, "Altering init param value of %s to %s..."
21311, 1, "Granting privileges or roles required for replication administrator to %s..."
21312, 1, "Creating purge job..."
21313, 1, "Scheduling push job to %s..."
21314, 1, "Unscheduling push job to %s..."
21315, 1, "Creating database link to %s..."
21316, 1, "Dropping database link made to %s..."
21317, 1, "Inserting replication agreement entry %s..."
21318, 1, "Deleting replication agreement entry %s..."
21319, 1, "Adding object %s %s.%s to replication group %s..."
21320, 1, "Generating replication support for %s %s.%s..."
21321, 1, "Quiescing replication activity..."
21322, 1, "Resuming replication activity..."
21323, 1, "Executing deferred administrative requests..."
21324, 1, "Dropping replication group %s..."
21325, 1, "Dropping replication site %s from replication group %s..."
21326, 1, "Creating replication administrator %s..."
21327, 1, "Creating replication group %s..."
21328, 1, "Adding replication site %s to replication group %s..."
21329, 1, "Dropping replication administrator %s..."
21330, 1, "Relocating master definition site to %s..."
21331, 1, "Changing password of replication administrator %s..."
21332, 1, "Setting replication id..."
21333, 1, "Verifying uniqueness of replication agreement entry..."
21334, 1, "%s is Master Definition Site (MDS). Connected to MDS."
21335, 1, "%s is Remote Master Site (RMS). Connected to RMS."
21336, 1, "%s is Remote Master Site (RMS). NOT CONNECTED to RMS."
21337, 1, "Renaming global name to %s (instance name : %s, hostname : %s)"
21338, 1, "Synchronizing GUID of entries of this site with %s"
21339, 1, "Adding entry %s..."
21340, 1, "Modifying entry %s..."
21341, 1, "Renaming entry %s..."
21342, 1, "Deleting entry %s..."
21343, 1, "Searching entry %s..."
21344, 1, "Adding replica ldap://%s:%d(%s) as consumer..."
21345, 1, "Deleting replica ldap://%s:%d(%s) as consumer..."
21346, 1, "Changing password..."
21347, 1, "Cleaning up..."
21348, 1, "Migrating ASR agreement to LDAP MM agreement..."

/REMTOOL Messages

21400, 1, "Make sure that the replication administrator database "
21401, 1, "account does not exist already in the new node to be "
21402, 1, "added to the DRG. If the account exists, that "
21403, 1, "account will be dropped and will be created newly."

21404, 1, "Enter global name of new node to be added          : "
21405, 1, "Enter SYSTEM user password of new node to be added : "
21406, 1, "Adding a new node..."
21407, 1, "ASR setup has been cleaned up."
21408, 1, "Enter global name of the node to be set as MDS : "
21409, 1, "Relocating master definition site..."
21410, 1, "%s has been set as Master Definition Site."
21411, 1, "Enter new password of the replication administrator   : "
21412, 1, "Reenter new password of the replication administrator : "
21413, 1, "Changing the password of all nodes..."
21414, 1, "Password has been changed."
21415, 1, "Enter globalname of node to be deleted : "
21416, 1, "Deleting an existing node..."
21417, 1, "Altering replication status..."
21418, 1, "Replication status has been altered successfully."
21419, 1, "Verify the details you had entered."
21420, 1, "Replication administrator's name   : %s"
21421, 1, "Remote Master Site #%3d            : %s"
21422, 1, "Master Definition Site             : %s"
21423, 1, "Are these details correct? [y/n/q] : "
21424, 1, "ASR setup has been configured successfully."

21425, 1, "WARNING:"
21426, 1, "Make sure that the replication administrator that you"
21427, 1, "enter below does not exist already in any of the nodes"
21428, 1, "that will be part of the DRG to be created now. If the"
21429, 1, "user exists, that user will be dropped and will be"
21430, 1, "created newly."

21431, 1, "Enter replication administrator's name       : "
21432, 1, "Enter replication administrator's password   : "
21433, 1, "Reenter replication administrator's password : "
21434, 1, "Enter Master Definition Site (MDS) details   : "
21435, 1, "Enter global name of MDS                     : "
21436, 1, "Enter SYSTEM user password of MDS            : "
21437, 1, "Enter Remote Master Site (RMS) details       : "
21438, 1, "Error : %s is already part of this DRG."
21439, 1, "Enter SYSTEM user password of RMS #%3d       : "
21440, 1, "Are there more Remote Master Sites in the group? [y/n/q] : "
21441, 1, "Passwords do not match."
21442, 1, "Rectifying ASR setup..."
21443, 1, "Verifying ASR setup..."
21444, 1, "No administrative request errors were found at %s"
21445, 1, "Following administrative request errors were found at %s"
21446, 1, "No deferred transaction errors were found at %s"
21447, 1, "Following deferred transaction errors were found at %s"
21448, 1, "Enter \"SYSTEM\" user password for \"%s\" database at \"%s\" host : "
21449, 1, "Error occurred while identifying nodes of DRG."
21450, 1, "Warning : This replication group has only one node."
21451, 1, "Do you want to continue? [y/n] : "
21452, 1, "internal error: %s failed."
21453, 1, "Invalid connect/bind string. Parsing failed."
21454, 1, "Enter superuser DN                           : "
21455, 1, "Enter superuser password                     : "
21456, 1, "ASR setup in progress..."
21457, 1, "ASR Setup for OID Replication"
21458, 1, "ASR setup has failed."
21459, 1, "Replica ldap://%s:%d(%s) has been cleaned up."
21460, 1, "Enter global name of RMS #%3d                : "
21461, 1, "Summary of findings:"
21462, 1, "Queue Statistics :"
21463, 1, "Node %s has been added to this DRG."
21464, 1, "Node %s has been deleted from this DRG."
21465, 1, "Failed to add node %s to this DRG."
21466, 1, "Failed to delete node %s from this DRG."
21467, 1, "Replication DN password of ldap://%s:%d (%s) associated with database '%s' will be changed."
21468, 1, "Replication DN password provided above of ldap://%s:%d (%s) associated with database '%s' will be set in wallet."
21469, 1, "Directory Replication Group (DRG) details : "
21470, 1, "Replication DN password of ldap://%s:%d (%s) associated with database '%s' will be reset."
21471, 1, "Set ORACLE_SID environment variable to SID of database with which ldap://%s:%d (%s) is associated."
21472, 1, "DRG identified by replica ldap://%s:%d (%s) will be cleaned up."
21473, 1, "Error occurred while getting replication configuration information."
21474, 1, "This tool will try to rectify the problem if super user DN and password are provided."
21475, 1, "Replica ldap://%s:%d (%s) can be made partial replica by specifying naming contexts to be replicated."
21476, 1, "List of available naming contexts in supplier replica ldap://%s:%d (%s) :"
21477, 1, "No naming context found in supplier replica ldap://%s:%d (%s)."
21478, 1, "Enter naming context [Enter \"e\" to end selection] : "
21480, 1, "\"%s\" : Invalid naming context."
21481, 1, "Following naming contexts will be included for replication:"
21482, 1, "Selected naming contexts have been included for replication."
21483, 1, "Legends :"
21484, 1, "  Chkd  - Checked. No errors."
21485, 1, "  Crtd  - ASR setup errors were found and corrected."
21486, 1, "  Err   - Error occurred while doing ASR setup verification."
21487, 1, "  NCrtd - ASR setup has errors, but not corrected."
21488, 1, "Unable to create log file %s."
21489, 1, "Enter supplier directory details:"
21490, 1, "Enter consumer directory details:"
21491, 1, "Enter hostname of host running OID server    : "
21492, 1, "Enter port on which OID server is listening  : "
21493, 1, "Enter replication dn password                : "
21494, 1, "Enter replicaid of the replica to be deleted : "
21495, 1, "Enter replicaid of the supplier              : "
21496, 1, "Enter new password of replication DN         : "
21497, 1, "Reenter new password of replication DN       : "
21498, 1, "Replica ldap://%s:%d(%s) has been added to this DRG."
21499, 1, "Replica ldap://%s:%d(%s) has been deleted from this DRG."
21500, 1, "Usage of remtool:"

21501, 1, "remtool <command> [<connection details>] [-v]"
21502, 1, " <command> :=  { -addnode    | -asrsetup   | -chgpwd     | -delnode    |"
21503, 1, "                 -asrcleanup | -asrverify  | -asrrectify | -asrdisplay |"
21504, 1, "                 -dispqstat  | -suspendasr | -resumeasr  | -asr2ldap   |"
21505, 1, "                 -dispasrerr | -paddnode   | -pdelnode   | -pcleanup   |"
21506, 1, " <connection details> := [-connect <repadmin>/<password>@<connect_id> |"
21507, 1, "                          -bind <host>:<port>/<repldnpassword>]"
21508, 1, "-addnode    : Configure ASR for adding a new node to an existing DRG."
21509, 1, "-asrsetup   : Configure ASR for a Directory Replication Group (DRG)."
21510, 1, "-chgpwd     : Change Replication Administrator database account"
21511, 1, "              password on all nodes of a DRG."
21512, 1, "-delnode    : Reconfigure ASR to delete a node from an existing DRG."
21513, 1, "-asrcleanup : Clean up ASR setup of a DRG."
21514, 1, "-asrrectify : Verify correctness of ASR setup for a DRG and rectify"
21515, 1, "              the problems, if any."
21516, 1, "-asrverify  : Verify correctness of ASR setup of a DRG. This option"
21517, 1, "              will just report problems but will not rectify."
21518, 1, "-dispasrerr : Display all deferred transcation errors and"
21519, 1, "              administrative request errors of a DRG."
21520, 1, "-dispqstat  : Display queue statistics for all ASR supplier"
21521, 1, "              consumer combinations."
21522, 1, "-suspendasr : Quiesce / Suspend replication activity of a DRG."
21523, 1, "-resumeasr  : Resume replication activity of a DRG."
21524, 1, "-paddnode   : Add a partial replica to a DRG."
21525, 1, "-pdelnode   : Delete a partial replica from a DRG."
21526, 1, "-pchgpwd    : Change password of replication dn of a replica."
21527, 1, "-pcleanup   : Cleanup partial replication setup of a DRG."
21528, 1, "-connect    : Connect string of MDS (only for ASR based replication)."
21529, 1, "-bind       : Bind details of directory server (only for LDAP-based replication)."
21530, 1, "-v          : verbose mode."
21531, 1, "                 -pchgpwd    | -pdisplay   | -pchgmaster [-multimaster]|"
21532, 1, "-presetpwd  : Reset password of replication dn of a replica."
21533, 1, "-pchgwalpwd : Change password of replication dn of a replica only in wallet."
21534, 1, "-pdispqstat : Display queue statistics for all supplier consumer combinations."
21535, 1, "-pchgmaster : Redirect the consumer replica from the failed supplier to another replica."
21536, 1, "-pverify    : Verify the replica's replication configuration."
21537, 1, "-asr2ldap   : Migrate from ASR to LDAP Multimaster replication"
21538, 1, "                 -pchgwalpwd | -pdispqstat | -pverify    | -presetpwd | }"

21575, 1, "Error occurred while adding partial replica ldap://%s:%d."
21576, 1, "Error occurred while deleting partial replica ldap://%s:%d(%s)."
21577, 1, "Error occurred while changing password of replica ldap://%s:%d(%s)."
21578, 1, "This node may not be part of any DRG."
21579, 1, "Do you want to create a new DRG consisting of this node? [y/n] : "
21580, 1, "Error: Illegal character '-' in global name."
21581, 1, "Do you want to remove %s from this DRG? [y/n] : "
21582, 1, "  New      : No. of new change logs"
21583, 1, "  Retry    : No. of change logs in retry queue"
21584, 1, "  Purge    : No. of change logs in purge queue"
21585, 1, "  HIQ      : No. of change logs in Human Intervention Queue (HIQ)"
21586, 1, "  Change # : Last applied change log no."
21587, 1, "Failed to read replication wallet. %s. Error code: %d."
21588, 1, "Warning: Replication DN of replica ldap://%s:%d (%s) does not match replication DN stored in wallet. It will be overwritten with replication DN of this replica."
21589, 1, "Please specify main master replica as the first replica. cn=subschemasubentry"
21590, 1, "and cn=catalogs entries of other master replicas will be synchronized with"
21591, 1, "that of main master replica."
21592, 1, "Provide LDAP server & replication DN password details of replica #%d."
21593, 1, "Replica ldap://%s:%d is already part of this DRG."
21594, 1, "LDAP based Multimaster Replication Configuration."
21595, 1, "Enter global name of sponsor node                  : "
21596, 1, "Enter replica type [1 - LDAP read-only replica; 2 - LDAP updateable replica; 3 - LDAP multimaster replica] : "
21597, 1, "%s : Invalid replica type. Valid values are 1, 2 and 3."

21601, 1, "Enter hostname of the source directory                     : "
21602, 1, "Enter port number of the source directory                  : "
21603, 1, "Enter replication DN password of the source directory      : "
21604, 1, "Enter hostname of the destination directory                : "
21605, 1, "Enter port number of the destination directory             : "
21606, 1, "Enter replication DN password of the destination directory : "
21607, 1, "  New      : No. of new change logs"
21608, 1, "  Retry    : No. of change logs in retry queue"
21609, 1, "  Purge    : No. of change logs in purge queue"
21610, 1, "  HIQ      : No. of change logs in Human Intervention Queue (HIQ)"
21611, 1, "  LA Chg # : Last applied change log no."
21612, 1, "  Logs TBP : Logs to be transported."
21613, 1, "  LT Chg # : Last transported change log no."
21614, 1, "Enter hostname of the new supplier                         : "
21615, 1, "Enter port number of the new supplier                      : "
21616, 1, "Enter replication DN password of the new supplier          : "
21617, 1, "Enter replica ID of the retiring supplier                  : "
21618, 1, "Error: %s is not a supplier of %s.\n" 
21619, 1, "* WARNING *: Unable to bind to retiring supplier.\nDo you want to ignore supplier status and continue? [y/n]: "
21620, 1, "* WARNING *: Moving %s to be consumer of %s might cause discrepancy in data.\nDo you want to continue? [y/n]: "
21621, 1, "Error: %s cannot be a new supplier of %s.\n"
21622, 1, "Failed to change %s's master to %s.\n"
21623, 1, "Changed master of %s to %s successfully.\n"
21624, 1, "Failed to change master for %s.\n"
21625, 1, "\nVerify replication configuration for %s successfully.\n"
21626, 1, "\nFailed to verify replication configuration for %s.\n"
21627, 1, "%d checks failed.\n"
21628, 1, "Refer to %s for details.\n"
21629, 1, "To verify LDAP based replication configuration.\n"
21630, 1, "remtool -pverify [-bind <host>:<port>/<repldnpassword>] [-v]"
21631 ,1, "                 [-hiqmax <hiqmax>] [-tbtmax <tbtmax>]"
21632, 1, "-hiqmax     : the max no. of HIQ, over which a warning would be generated."
21633, 1, "-tbtmax     : the max no. of logs to be transported, "
21634, 1, "              over which a warning would be generated."
21635, 1, "To cleanup partial replication setup of a DRG."
21636, 1, "remtool -pcleanup [-bind <host>:<port>/<repldnpassword>] [-v] [-agrmt]"
21637, 1, "-agrmt      : to clean up only specific agreements"
21638, 1, "It is recommended that you run -pverify option and fix the problem.\n\nIf you choose to continue, all entries under replication configuration container \"cn=replication configuration\" would be deleted."
21639,1, "Enter replica ID [Enter \"e\" to end selection] : "
21640,1, "Enter replica ID of replica(s) for which its(their) agreement(s) with replica ldap://%s:%d (%s) will be cleaned up."
21641,1, "There is no agreement between %s and %s."
21642,1, "Agreement(s) with the following replica(s) would be cleaned up:"
21643,1, "WARNING: No agreement would be cleaned up."
21644,1, "Replica %s has been selected already."
21645,1, "Failed to clean up agreement %s on %s."
21646,1, "Successfully cleaned up agreement between %s and %s."
21647,1, "Error occurred while adding Multimaster replica ldap://%s:%d."
21648,1, "Error occurred while deleting Multimaster replica ldap://%s:%d."
21649,1, "Replica ldap://%s:%d (%s) can be made multimaster replica by specifying naming contexts to be replicated."
21650,1, "Replica ldap://%s:%d (%s) has been made a multimaster replica with the already existing naming contexts to be replicated."
21651,1, "One of the nodes in the DRG has LDAP multimaster replication agreement with other node outside this DRG.  Delete that agreement and proceed with ASR to LDAP migration"
21652, 1, "To Redirect the consumer replica from the failed supplier to another replica."
21653, 1, "remtool -pchgmaster [-bind <host>:<port>/<repldnpassword>] [-v] [-multimaster]"
21654, 1, "-multimaster: to change the primary replica in multi-master agreement"
21655, 1, "Error: Replica ldap://%s:%d is not a multimaster replica."
21656, 1, "Error: New primary replica cannot be same as old primary replica, %s.\n"
21657, 1, "Error: Invalid replica, %s.\n"
21658, 1, "Error: Unable to bind to the replica, %s.\n"
21659, 1, "Enter new primary replica ID     : "
21660, 1, "Failed to change the primary replica.\n"
21661, 1, "Changed primary replica from %s to %s successfully.\n"
21662, 1, "%s: Invalid argument or no value specified for this argument.\n"
21663, 1, "* WARNING *: Primary replica is down. Do you want to ignore primary replica status and continue? [y/n]: "
21664, 1, "Error: Some of the replicas in the multimaster agreement are down.\n"
21665, 1, "Error: Invalid bind string."
21666, 1, "Error: Invalid port."
21667, 1, "ASR agreeement has been migrated to LDAP multimaster."
21668, 1, "Replication DN password of (%s) associated with database '%s' will be reset in all supplier nodes."
21669, 1, "Do you want to skip this supplier node? [y/n] : "
21670, 1, "Enter bind details for supplier, %s:%d :\n"
21671, 1, "Replication DN password is not reset in some of the suppliers."
21672, 1, "* WARNING *: Run the option -reconaver only if source & destination OID servers have the patch to support attribute version reconciliation.\n\n"
21673, 1, "-asrdisplay : Display DRG details for an ASR setup."
21674, 1, "-pdisplay   : Display DRG details for a partial replication setup."
21675, 1, "\n  Warning: There is only one node in DRG so it can not be deleted.\n"

/ Till 21700 Remtool Error Messages

/ldifwrite messages
/21701,1,"usage: ldifwrite [-connect <Connect String>] -basedn <Base DN> -ldiffile <filename> [-encode <encoding>] [-debug] [-filter <ldap filter>] [-thread <no. of threads>]"
/21702,1,"\n connect   = Connect String\n basedn    = BaseDN"
/21703,1,"\n ldiffile  = LDIF filename"
/21704,1,"\n encode    = Encoding scheme "
/21705,1,"\n debug     = Debug Mode (TRUE/FALSE)"
/21706,1,"\n filter    = The ldap filter to be used for write"
/21707,1,"\n thread    = Number of threads to be created\n"
21701,1,"usage: ldifwrite [option(s)] \n basedn     = Base DN or Replication Agreement DN"
21702,1,"\n ldiffile   = LDIF filename"
21703,1,"\n [encode    = Encoding scheme]"
21704,1,"\n [debug     = Debug (TRUE/FALSE)]"
21705,1,"\n connect   = Connect String"
21706,1,"\n [filter    = The ldap filter to be used for write]"
21707,1,"\n [threads   = Number of threads to be created (1 - 6*No. of CPUs)]"
21708,1,"\n [verbose   = Verbose Mode (TRUE/FALSE)]\nSome examples are:"
21709,1,"\nReading entries under BaseDN \"%s\"...\n"
21710,1,"\n%d Entries are written to \"%s\".\n"
21711,1,"\n%s: %d entries written..."
21712,1,"basedn not specified.\n"
21713,1,"ldif file not specified.\n"
21714,1,"\n  ldifwrite connect=\"conn_str\" basedn=\"base_dn\" ldiffile=\"ldif_filename\""
21715,1,"\n  ldifwrite basedn=\"base_dn\" ldiffile=\"ldif_filename\" threads=\"no_of_threads\""
21716,1,"\n  ldifwrite basedn=\"base_dn\" ldiffile=\"ldif_filename\" encode=\"encode_scheme\""
21717,1,"\n  ldifwrite basedn=\"base_dn\" ldiffile=\"ldif_filename\" filter=\"ldap_search_filter\"\n"
21718,1,"Error in writing ldif entry for dn: %s ...\n"
21719,1,"Error in writing ldif entry, For more details refer ldifwrite.log"
21720,1,"Class or attribute \"%s\" not supported in the schema.\n"
21721,1,"The following keywords are supported TRUE/true/T/t or FALSE/false/F/f as command values\n\n"

/catalog mgmt tools messages
/21801,1,"\nusage: catalog [-connect <Connect String>] [-add | -delete] [-attr <attribute name> | -file <filename>] [-debug]" 
/21802,1,"\n -connect <DB connect string>  specifies the Net8 connect descriptor"
/21803,1,"\n -add                           Add catalog Index."
/21804,1,"\n -delete                        Delete catalog Index."
/21805,1,"\n -attr <attribute name>         specifies attribute name."
/21806,1,"\n -file <filename>               Filename containing attributes"
/21807,1,"\n -debug                         Debug Mode\n"
21801,1,"\nusage: catalog [option(s)] \n connect   = Connect String" 
21802,1,"\n [add       = Add Option (TRUE/FALSE)]"
21803,1,"\n [delete    = Delete Option (TRUE/FALSE)]"
21804,1,"\n [attribute = Attribute Name]"
21805,1,"\n [file      = Filename]\n [logging   = Redo log generation (TRUE/FALSE)]"
21806,1,"\n [threads   = Number of threads to be created (1 - 6*No. of CPUs)]"
21807,1,"\n [debug     = Debug (TRUE/FALSE)]"
21808,1,"\n [verbose   = Verbose Mode (TRUE/FALSE)]"
21809,1,"\nSpecify either add or delete option"
21810,1,"\nSpecify either attribute or file option"
21811,1,"Creating catalog for \"%s\" ..."
21812,1,"Catalog created for \"%s\" ..."
21813,1,"Deleting catalog for \"%s\" ..."
21814,1,"Catalog deleted for \"%s\" ..."
21815,1,"Error in adding catalog for \"%s\" ..."
21816,1,"Error in deleting catalog for \"%s\" ..."
21817,1,"\nError in opening file \"%s\" ...\n"
21818,1,"\nAttribute \"%s\" is not indexed ...\n"
21819,1,"\nError in inserting data into catalog table for \"%s\" ...\n"
21820,1,"\nError in deleting attribute \"%s\" row from DS_ATTRSTORE table ..\n"
21821,1,"\nAttribute \"%s\" is already indexed ...\n"
21822,1,"\nError in getting alias for attribute \"%s\" from DS_ATTRSTORE table ..\n"
21823,1,"\nError in operation.For more details, check %s ..\n"
21824,1,"Adding data to catalog table(s) .."
21825,1,"Error in adding referral rows to catalog table %s"
21826,1,"Error in refreshing server metadata..\nAction: Restart the ldap server to reflect server metadata changes."
21827,1,"Error during index creation on catalog table %s.\n" 
21828,1,"Creating indexes on catalog table \"%s\" and collecting statistics..."
21829,1,"Catalog add or delete is not supported for \"%s\"."
21830,1,"Error \"%s\" does not have any matching rule.\nAction: Modify attribute definition to include matching rule."
21831,1,"Error in altering table %s for logging."
21832,1,"Attribute '%s' doesn't exist."
21833,1,"\n  catalog connect=\"conn_str\" add=true attribute=\"attribute\""
21834,1,"\n  catalog connect=\"conn_str\" delete=true attribute=\"attribute\""
21835,1,"\n  catalog connect=\"conn_str\" add=true file=\"filename\""
21836,1,"\n  catalog connect=\"conn_str\" delete=true file=\"filename\""
21837,1,"\n  catalog connect=\"conn_str\" add=true file=\"filename\" logging=true"
21838,1,"\n  catalog connect=\"conn_str\" add=true attribute=\"attribute\" threads=\"no_of_threads\"\n"
21839,1,"Error attribute \"%s\" can not be enabled / disabled for referential integrity as it is not a DN syntax attribute."  
21840,1,"\nError in deleting orclriattr attribute \"%s\" row from DS_ATTRSTORE table ..\n"
21841,1,"\nAttribute \"%s\" is already enabled for referential integrity...\n"
21842,1,"Since referential integrity is enabled for attribute \"%s\", hence delete operation is not allowed."
21843,1,"INFO: On enabling referential integrity for attribute \"%s\", all its values in DS_ATTRSTORE will be replaced with normalized value."
21844,1,"\n [rienable  = Referential integrity check(TRUE/FALSE)]"
21845,1,"\nSelect either add or delete option. By default both are set to FALSE.\nSome Examples are:"
21846,1,"\nDo you wish to continue?(y/n)[n]\n"
21847,1,"Enabling Referential Integrity constraints on catalog table for \"%s\"..."
21848,1,"Error: Failed to enable Referential Integrity constraints on catalog table for \"%s\"."
21849,1,"There is a violation of Referential Integrity for \"%s\". Run the OIDDIAG tool with diagnostic option to collect the Entries which have dangling DN attribute values and Fix the violation.\n"
21850,1,"Then re-run catalog tool with rienabled=TRUE option.\n"
21851,1,"Disabling referential integrity for \"%s\" ..."
21852,1,"Disabled referential integrity for \"%s\" ..."
21853,1,"Before enabling an attribute for referential integrity, enable referential integrity feature for DN syntax attributes in ldap server. Set orclrienable value to level 2."
21854,1,"The following keywords are supported TRUE/true/T/t or FALSE/false/F/f as command values\n\n"
21855,1,"Referential integrity is Not allowed for attribute \"%s\", as it is a Mandatory Attribute in one of the objectclasses\n"

/bulkmodify tools messages ...till 22000
21901,1,"usage: bulkmodify [option(s)] \n basedn     = Base DN" 
21902,1,"\n attribute  = Attribute Name"
21903,1,"\n value      = Attribute Value"
21904,1,"\n connect   = Connect String" 
21905,1,"\n [encode    = Encoding scheme]"
21906,1,"\n [add       = Add Option (TRUE/FALSE)]"
21907,1,"\n [replace   = Replace Option (TRUE/FALSE)]"
21908,1,"\n [filter    = ldap filter]"
21909,1,"\n [size      = Transaction Size]"
21910,1,"\n [threads   = Number of threads to be created (1 - 6*No. of CPUs)]"
21911,1,"\n [debug     = Debug (TRUE/FALSE)]"
21912,1,"\n [verbose   = Verbose Mode (TRUE/FALSE)]\nSelect either add or replace option. By default both are set to FALSE.\nSome valid examples are:"
21913,1,"\nSpecify either add or replace option"
21914,1,"Cannot perform add on '%s' Attribute since it is not MultiValued."
21915,1,"Cannot Perform BulkModify operation on '%s' Attribute."
21916,1,"Specified objectclass '%s' has mandatory attribute, therefore Bulkmodify operation cannot be performed."
21917,1,"Replace of OBJECTCLASS attribute is not allowed."
21918,1,"Specified objectclass is not defined in schema." 
21919,1,"\nTotal %d Entries are modified.\n"
21920,1,"\nThread %d: %d entries modified..."
21921,1,"Cannot perform add on '%s' attribute since it is not MultiValued"
21922,1,"\nCannot find associated objectclass for '%s'"
21923,1,"\nError in filter object creation"
21924,1,"\nOID server is in read-only mode on target node"
21925,1,"\nAction: Modify OID server mode to read-modify or read-write on target node.\n"
21926,1,"\nOID Processes running on target node and entry cache is enabled"
21927,1,"\nAction: Shutdown OID Processes on target node or disable entry cache.\n"
21928,1,"\nError in reading ldap server mode\n"
21929,1,"\nError in reading ldap server entry cache status\n"
21930,1,"\nError in reading ldap server process status\n"
21931,1,"Modifying entries under \"%s\" ..."
21932,1,"BulkModify is not supported for binary attribute \"%s\"."
21933,1,"Cannot Perform BulkModify operation on '%s'."
21934,1,"\n  bulkmodify basedn=\"base_dn\" attribute=\"attr_name\" value=\"new_value\" replace=true"
21935,1,"\n  bulkmodify connect=\"conn_str\" basedn=\"base_dn\" attribute=\"attr_name\" value=\"new_value\" add=true"
21936,1,"\n  bulkmodify basedn=\"base_dn\" attribute=\"attr_name\" value=\"new_value\" add=true threads=\"no_of_threads\""
21937,1,"\n  bulkmodify basedn=\"base_dn\" encode=\"encoding_scheme\" attribute=\"attr_name\" value=\"new_value\" add=true"
21938,1,"\n  bulkmodify basedn=\"base_dn\" attribute=\"attr_name\" value=\"new_value\" replace=true filter=\"ldap_search_filter\"\n"
21939,1,"Invalid operation: objectclass '%s' cannot be added."
21940,1,"The following keywords are supported TRUE/true/T/t or FALSE/false/F/f as command values\n\n"
21941,1,"\nThe running OID server instances are in read-write mode on target node.\n"
21942,1,"\nAction: Modify OID server mode to read or read-modify on target node.\n"

/bulkdelete messages  ...till 22100
22001,1,"usage: bulkdelete [option(s)] \n connect   = Connect String"
22002,1,"\n [basedn    = Base DN]"
22003,1,"\n [file      = filename, contains list of basedn's to be removed]"
22004,1,"\n [encode    = Encoding scheme]"
22005,1,"\n [debug     = Debug (TRUE/FALSE)]"
22006,1,"\n [cleandb   = Removes entry completely from Database (TRUE/FALSE)]"
22007,1,"\n [size      = Transaction size]"
22008,1,"\n [threads   = Number of threads to be created (1 - 6*No. of CPUs)]"
22009,1,"\n [verbose   = Verbose Mode (TRUE/FALSE)]\nSelect either basedn or file option.\nSome examples are:"
22010,1,"Reading entries under BaseDN \"%s\"..."
22011,1,"\n%d Entries have been deleted.\n"
22012,1,"\n%d entries deleted..."
22013,1,"\nSpecify either basedn or file option"
22014,1,"usage: bulkdelete [option(s)] \n [connect   = Connect String]"
22015,1,"\n [basedn    = Base DN]"
22016,1,"\n [file      = filename, contains list of basedn's to be removed]"
22017,1,"\n [encode    = Encoding scheme]"
22018,1,"\n [debug     = Debug (TRUE/FALSE)]"
22019,1,"\n [cleandb   = Removes entry completely from Database (TRUE/FALSE)]"
22020,1,"\n [size      = Transaction size]"
22021,1,"\n [threads   = Number of threads to be created (1 - 6*No. of CPUs)]"
22022,1,"\n [verbose   = Verbose Mode (TRUE/FALSE)]\nSelect either basedn or file option.\nSome examples are:"
22023,1,"\n  bulkdelete connect=\"conn_str\" basedn=\"base_dn\""
22024,1,"\n  bulkdelete file=\"filename\""
22025,1,"\n  bulkdelete basedn=\"base_dn\" encode=\"encoding_scheme\""
22026,1,"\n  bulkdelete basedn=\"base_dn\" threads=\"no_of_threads\""
22027,1,"\n  bulkdelete basedn=\"base_dn\" cleandb=false\n"
22028,1,"Error in deleting entries\n"
22029,1,"The following keywords are supported TRUE/true/T/t or FALSE/false/F/f as command values\n\n"

/Generic command line options:
22101,1,"    -h host\tLDAP server\n"
22102,1,"    -p port\tport on LDAP server\n"
22103,1,"    -D binddn\tbind DN\n"
22104,1,"    -w passwd\tbind password (for simple authentication)\n"
22105,1,"    -U SSLAuth\tSSL Authentication Mode (\"1\" no-auth,\"2\" one-way,\"3\" two-way)\n"
22106,1,"    -W wurl\twallet location for SSL connection(one-way or two-way)\n"
22107,1,"    -P wpasswd\twallet password for SSL connection(one-way or two-way)\n"
22108,1,"    -E charset\tencoding character set\n"
22109,1,"    -Y mech\tSASL mechanism\n"
22110,1,"    -R realm\tSASL realm\n"
22111,1,"    -O props\tSASL security properties\n"
22112,1,"    -X authzid\tSASL authorization identity (\"dn:<DN>\" or \"u:<user>\")\n"
22113,1,"    -V version\tversion of LDAP protocol\n"
22114,1,"    -n \t\tshow what would occur without actually performing the operation\n"
22115,1,"    -v \t\tverbose mode\n"
22116,1,"    -d level\tset LDAP debugging level to `level'\n"
22117,1,"    -l timelimit\twait for a maximum time of `timelimit' seconds for task to complete\n"
22118,1,"    -c \t\tproceed inspite of errors\n"
22119,1,"    -i \t\tbind as current user for chasing Referrals \n"
22120,1,"    -M \t\tsend ManageDsaIT control to server so that no referrals are returned\n"
22121,1,"    -q \t\tprompt for simple bind password\n"
22122,1,"    -Q \t\tprompt for SSL wallet password\n"


/bulkload tools messages till 22400
22201,1,"usage: bulkload [option(s)] \n [connect   = Connect String]" 
22202,1,"\n [check     = Schema Check (TRUE/FALSE)]"
22203,1,"\n [generate  = Generation of Intermediate Files (TRUE/FALSE)]"
22204,1,"\n [load      = Loading of Intermediate Files (TRUE/FALSE)]" 
22205,1,"\n [append    = Lets ldap server up and running (TRUE/FALSE)]"
22206,1,"\n [restore   = Retains operational attributes as per LDIF file (TRUE/FALSE)]"
22207,1,"\n [index     = Recreates indexes (TRUE/FALSE)]"
22208,1,"\n [recover   = Recovers directory data (TRUE/FALSE)]"
22209,1,"\n [file      = LDIF file]"
22210,1,"\n [encode    = Encoding scheme]"
22211,1,"\n [threads   = Number of threads to be created (1 - 6*No. of CPUs)]"
22212,1,"\n [debug     = Debug (TRUE/FALSE)]"
22213,1,"\n [verbose   = Verbose Mode (TRUE/FALSE)]\n\n"
22214,1,"Specify any of the following operations like check, generate, load, index or recover\n"
22215,1,"\n'recover' can not be specified with any other operation"
22216,1,"\n'index' can not be specified with following operations like generate, load and recover\n"
22217,1,"\nInvalid option specified or Mandatory parameter missing\n"
22218,1,"\n%s directory does not exist or doesn't have access permission"
22219,1,"Checking data for bulk loading for valid structure..."
22220,1,"Checking and Generating Internet Directory data for bulk loading"
22221,1,"Generating Internet Directory data for bulk loading"
22222,1,"Loading data on \"%s\""
22223,1,"*Error in loading data for \"%s\"\nFor more details, refer bulkload.log*\n\n"
22224,1,"*Error at line:%ld, \"%s\"\n"
22225,1,"As indicated above, there were errors during the load of data. This will leave the OID directory content in inconsistent state. \n"
22227,1,"Do you want to continue with recover option?(y/n)[y]\n"
22228,1,"Recovering directory to it's pre bulkload state"
22229,1,"Creating indexes ..."
22230,1,"Info: Setting input language to  %s\n"
22231,1,"*Error: Unable to set input language to  %s\n"
22232,1,"Verifying indexes ..."
22233,1,"Following tables do not have all indexes"
22234,1,"*Error in opening %s file"
22235,1,"Data %s successfully"
22236,1,"Found Duplicate DN's, all duplicate DN's are logged in %s"
22237,1,"Found Schema-Check errors, bad entries are logged in %s"
22238,1,"For more details, see %s"
22239,1,"%s : No such attribute exist in schema\n"
22240,1,"attr merge failed for attr=%s\n"
22241,1,"SASL verifier generation failed with error=%d\n"
22242,1,"Authpassword generation failed with error=%d\n"
22243,1,"O3logon verfier generation failed with error=%d\n"
22244,1,"orclrevpwd generation failed with error=%d\n"
22245,1,"Userpassword copy into Authpassword failed with error=%d\n"
22246,1,"Failed to insert operational attribute %s.\n"
22247,1,"Failed to add hint answer.\n"
22248,1,"warning : Password Policy Entry loading failed \n"
22249,1,"warning : Password Verifier Profile loading failed\n"
22250,1,"warning : Subscriber Info loading failed in gslfcfLoadDSE \n"
22251,1,"*Error in creating %s\n"
22252,1,"*Error in creating table %s\n"
22253,1,"*Error in getting entryid \n"
22254,1,"*Error in %s enqueue \n"
22255,1,"*Error in creating reader and writer threads\n"
22256,1,"*Error in creating loader threads\n"
22257,1,"*Error while loading data for %s\n"
22258,1,"*Error %ld: %s\n"
22259,1,"For more details see bsl_%s.log\n"
22260,1,"*Error in recovering directory data, recover failed\n"
22261,1,"*Error in verifying indexes\n"
22262,1,"*Error in setting entryid \n"
22263,1,"*Error in collecting statistics.\n"
22264,1,"*Error in resetting server mode to %s.\n"
22265,1,"    %s...\n"
22266,1,"Dropping all existing indexes"
22267,1,"OID server is in read-write mode on target node\n"
22268,1,"OID Processes are running on \"%s\"...\n"
22269,1,"Shutdown OID Process on \"%s\" for bulkload\n"
22270,1,"...Setting OID server mode to read-modify on \"%s\" node...\n"
22271,1,"...Setting OID server mode to read-write on \"%s\" node...\n"
22272,1,"File %s does not exist\n"
22273,1,"[%s]: *Error in getting attribute syntax %s.\n"
22274,1,"[%s]: *Error in writing to catalog File\n"
22275,1,"[%s]: *Error in writing to hrch_query.dat File\n"
22276,1,"[%s]: gslScmIsAttrBinary failed for %s\n"
22277,1,"[%s]: *Error in writing to attr_storeXXX.dat File\n"
22278,1,"[%s]: Failed to retrieve certificate info (%ld)\n"
22279,1,"[%s]: Failed to convert certificate serial number from binary to base 64 encoded string (%d)\n"
22280,1,"*Error in writing to %s File\n"
22281,1,"[%s]: Hash search failed\n"
22282,1,"\nfile not specified\n"
22283,1,"Invalid value for %s\n"
22284,1,"Generating Database Statistics ..."
22285,1,"OID Directory content has been successfully restored to the pre-bulkload state. Fix the errors reported during load and retry the load option." 
22286,1,"As indicated above, there were errors during the load of data. This will leave the OID directory content in inconsistent state. \n"
22287,1,"Hence, it is highly recommended that you use the bulkload -recover option to restore the OID directory content to the pre-bulkload state.\n"
22288,1,"If you choose not to use the recover option of bulkload now, then you must restore the OID Database from a backup taken prior to this bulkload invocation so that the Directory content is restored to the pre-bulkload state.\n"
22289,1,"The following prompt will help you to recover the OID Directory content to pre-bulkload state:\n"
22290,1,"Do you want to continue with recover option?(y/n)[y]\n"
22291,1,"*Error in recovering data\n"
22292,1,"usage: bulkload [option(s)] \n connect   = Connect String" 
22293,1,"\n [check     = Schema Check (TRUE/FALSE)]"
22294,1,"\n [generate  = Generation of Intermediate Files (TRUE/FALSE)]"
22295,1,"\n [load      = Loading of Intermediate Files (TRUE/FALSE)]" 
22296,1,"\n [append    = Lets ldap server up and running (TRUE/FALSE)]"
22297,1,"\n [restore   = Retains operational attributes as per LDIF file (TRUE/FALSE)]"
22298,1,"\n [index     = Recreates indexes (TRUE/FALSE)]\n [missing   = Specifies only to create Missing indexes (TRUE/FALSE)]"
22299,1,"\n [recover   = Recovers directory data (TRUE/FALSE)]"
22300,1,"\n [file      = LDIF file]"
22301,1,"\n [encode    = Encoding scheme]"
22302,1,"\n [threads   = Number of threads to be created (1 - 6*No. of CPUs)]"
22303,1,"\n [debug     = Debug (TRUE/FALSE)]"
22304,1,"\n [verbose   = Verbose Mode (TRUE/FALSE)]\nSome usage examples are:"
22305,1,"\n  bulkload connect=\"conn_str\" check=true file=\"ldif_filename\""
22306,1,"\n  bulkload generate=true file=\"ldif_filename\""
22307,1,"\n  bulkload check=true generate=true file=\"ldif_filename\""
22308,1,"\n  bulkload check=true generate=true encode=\"encoding_scheme\" file=\"ldif_filename\""
22309,1,"\n  bulkload generate=true restore=true file=\"ldif_filename\""
22310,1,"\n  bulkload check=true generate=true file=\"ldif_filename\""
22311,1,"\n  bulkload load=true"
22312,1,"\n  bulkload load=true append=true"
22313,1,"\n  bulkload index=true\n  bulkload index=true missing=true"
22314,1,"\n  bulkload check=true index=true"
22315,1,"\n  bulkload recover=true\n"
22316,1,"\"%s\"..."
22317,1,"With multiple connect strings, only generate option is valid"
/bulkload msgs continue....

/search messages
22318,1,"    -M \t\tsend ManageDsaIT control to server\n"
22319,1,"    -G \t\tsend RequiredAttribute control to server\n"
22320,1,"    -C \t\tsend connectBy control to server\n"
22321,1,"    -T [-]sort_attr\tsend serverSort control to server\n"
22322,1,"    -j page_size\tsend Paging control to server\n"

/Sort attr msgs
22323,1,"sending serverSort control to sort by '%s' attribute\n"
22324,1,"serverSort control response status: 0 - success\n"
22325,1,"serverSort control response status: 1 - server internal failure\n"
22326,1,"serverSort control response status: 3 - timelimit reached\n"
22327,1,"serverSort control response status: 8 - refused to return results, insecure protocol\n"
22328,1,"serverSort control response status: 11 - too many matching entries to sort\n"
22329,1,"serverSort control response status: 16 - unrecognized attribute type\n"
22330,1,"serverSort control response status: 18 - unrecognized/inappropriate matching rule\n"
22331,1,"serverSort control response status: 50 - refused to return sorted results, insufficient priviliges\n"
22332,1,"serverSort control response status: 51 - server busy\n"
22333,1,"serverSort control response status: 53 - unable to sort\n"
22334,1,"serverSort control response status: 80 - other\n"
22335,1,"serverSort control response status: unknown\n"
22336,1,"serverSort control response: entries are sorted by '%s' attribute\n"
22337,1,"sending serverSort control to sort in reverse order by '%s' attribute\n"
22338,1,"No serverSort control response received from server\n"
22339,1,"%s: No entry count control response received from server\n"

/ bulkload messages continue.... till 22400
22340,1,"Invalid ACL: %s in ORCLACI\n"
22341,1,"Invalid ACL: %s in ORCLENTRYACI\n"
22342,1,"Error in getting Password Policy Context\n"
22343,1,"It is recommended to use check option before generating/loading data"
22344,1,"Do you want to continue?(y/n)[n]\n"
22345,1,"\nThere are no intermediate files existing, so first use generate or check generate options to generate intermediate files, then load data.\n\n"
22346,1,"There are some dynamic group entries in specified ldif file. bulkload does not load these entries. These entries are logged in %s. It is advised to load these entries using ldapadd tool." 
22347,1,"Error in altering indexes\n"
22348,1,"Altering indexes..."
22349,1,"There is a violation of Referential Integrity and hence it is Disabled now. Run the OIDDIAG tool with diagnostic option to collect the Entries which have dangling DN attribute values and Fix the violation.\n"
22350,1,"The following keywords are supported TRUE/true/T/t or FALSE/false/F/f as command values\n\n"
22351,1,"0 Rows not loaded due to data errors."
22352,1,"0 Rows not loaded because all WHEN clauses were failed."
22353,1,"0 Rows not loaded because all fields were null."
22354,1,"Creating Missing Indexes ..."
22355,1,"Error in getting alias for attribute \"%s\" from the schema."
22356,1,"Error in getting syntax for attribute \"%s\" from the schema."

/Remtool -verify report msgs
22400,1,"Corruption"
22401,1,"Authentication"
22402,1,"Replicationdn"
22403,1,"Format"
22404,1,"Match agreement type"
22405,1,"Validity"
22406,1,"Availability"
22407,1,"Consistency"
22408,1,"Format (Primary)"
22409,1,"Format (Secondary)"
22410,1,"Display state"
22412,1,"Format (transport)"
22413,1,"Logs TBP"
22414,1,"Format (apply)"
22415,1,"HIQ"
22417,1,"Configuration"

22430,1,"Check whether the wallet DN and password are corrupted"
22431,1,"Check whether the wallet DN and password are correctly authenticated" 
22432,1,"Check whether the wallet DN is referring to the local node" 
22433,1,"Check the format of agreement DN"
22434,1,"Check whether the number of replicas specified in replicadn match the agreement type"
22435,1,"Check whether the replicas specified in orclreplicadn also exist under the cn=replication configuration container"
22436,1,"Check whether the orclreplicationid is available under the agreement"
22437,1,"Check whether the protocol is available under the agreement"
22438,1,"Check whether the supplier is not the same replica as the consumer"
22439,1,"Check whether the same agreement exist on both the supplier and consumer"
22440,1,"Check the format of the Primary URL"
22441,1,"Check the format of the Secondary URL"
22442,1,"Display the replica state"
22443,1,"Check whether the local replica can bind to another replica in the agreement"
22444,1,"Check whether the last applied change number with transport subtype has the correct format"
22445,1,"Check whether there are too many change logs to be transported"
22446,1,"Check whether the last applied change number with apply subtype has the correct format"
22447,1,"Check whether there are too many HIQ"
22448,1,"Check whether the included/excluded naming contexts are in the correct format"
22449,1,"Display the included/excluded naming contexts"

22460,1,"Run -pchgwalpwd option to fix the wallet / No access to wallet because running verification remotely"
22464,1,"Use -pcleanup to clean up the agreement and reconfigure the replication"
22465,1,"Use compare reconcile tool to copy the \"DN\" subtree from the source replica"
22469,1,"Check Connection test. If it fails, this test would also fail. If not, use compare reconcile tool to copy the agreement DN"
22473,1,"DN of local replica is not correctly provided to another replica"
22475,1,"Replication is behind. Fix all the errors reported"
22478,1,"Refer to remtool.log for the errors causing the test failure"
22479,1,"WARNING: No included naming context is configured"

22490,1,"Node ID: %s\n"
22491,1,"  Test Category: %s\n"
22492,1,"    Test Against: %s\n"
22493,1,"      Test: %s\n"
22494,1,"## Target Directory Host             : %s\n"
22495,1,"## Target Directory Port             : %d\n"
22496,1,"## This file lists all the tests and results that were processed by this tool\n"

22500,1,"Connection"
22501,1,"Wallet"
22502,1,"Replica State"
22503,1,"Agreements"
22504,1,"Replica Pair"
22505,1,"Replication Protocol"
22506,1,"Filtering"

/Paging msgs
22531,1,"sending Paging control for page size: '%d'\n"
22532,1,"Paging control response: Total entries to be returned: '%d'\n"
22533,1,"Paging control response: server Cookie: '%s'\n"
22534,1,"Search result entries in first page:\n"
22535,1,"Search result entries in next page:\n"
22536,1,"No Paging control response received from server\n"

/SASL options
22550,1,"    -u authcid\tSASL authentication identity\n"
22551,1,"    -sasl_mech mech\tSASL mechanism\n"
22552,1,"    -sasl_realm realm\tSASL realm\n"
22553,1,"    -sasl_props props\tSASL security properties\n"
22554,1,"    -sasl_authz authzid\tSASL authorization identity (\"dn:<DN>\" or \"u:<user>\")\n"
22555,1,"    -sasl_authc authcid\tSASL authentication identity \n"

/SASL/SSL Errors
22565,1,"SASL authentication failed.\n"
22566,1,"Unable to establish secure SASL connection.\n"
22567,1,"SASL Error no : '%s'\n"
22568,1,"SASL Error : NO MEMORY\n"
22569,1,"SASL Error : BAD STATE\n"
22570,1,"SASL Error : BAD TOKEN\n"
22571,1,"SASL Error : NO AUTHENTICATE\n"
22572,1,"SASL Error : NO AUTHORIZE\n"
22573,1,"SASL Error : TOO LONG\n"
22574,1,"SASL Error : BAD PARAMETER\n"
22575,1,"SASL Error : BAD CHALLENGE\n"
22576,1,"SASL Error : NO CIPHER MATCH\n"
22577,1,"SASL Error : MISSING DATA\n"
22578,1,"SASL Error : BAD RESPONSE\n"
22579,1,"SASL Error : INSUFFICIENT QOP\n"
22580,1,"SASL Error : BAD SSF SETUP\n"
22581,1,"SASL Error : BAD INT\n"
22582,1,"SASL Error : CRYPTO ERROR\n"
22583,1,"SASL Error : SSPI ERROR\n"


/OID Fatal Errors
23001,1,"OID is unable to come up using the configured port.\n"
// *Document: YES                                                      
// *Severity: error 
// *Category: Ports
// *Cause: The port configured for use by OID was not available.
// *Action: Ensure that the port numbers used for OID are available.
23002,1,"Creating a new DB connection failed with ORA-%d.\n"
// *Document: YES
// *Severity: error 
// *Category: Network 
// *Cause: OID server was unable to log in to the database. 
// *Action: Verify the 'PROCESS' database parameter in the init.ora file. 

23003,1,"FATAL * gslirrdLoadDSE * Subschema subentry loading failed\n"


/OIDREPL Error and Warning messages
23004,1,"In %s, unable to read replication configuration information\n"
// *Document: YES
// *Severity: error
// *Category: Configuration
// *Cause: This error occurred because the replication server was unable to connect to OID, was unable to get the replication DN and password, or the replication system configuration was not present.
// *Action: The error message will be followed by other log messages indicating action to be taken.

23005,1,"%s: No replication agreement to process\n"
// *Document: YES
// *Severity: error
// *Category: Configuration
// *Cause:  Replication agreements were not set up with other node(s).
// *Action: Setup the replication agreement with other node(s) before starting the replication server.

23006,1,"In %s, failure to enqueue %s into queue=%s\n"
// *Document: YES
// *Severity: warning
// *Category: Session
// *Cause: The replication enqueue routine failed.
// *Action: This is an internal error. Use the oidcmprec tool to compare and reconcile this entry from the supplier to the consumer. For further help contact Oracle Support Services.

23007,1,"In %s, failing to bind with the supplier on server=%s\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause:  Either the OID server was down or the replication password was incorrect.
// *Action: Ensure that the OID server on the supplier is running. If the password has changed restart the replication server.

23008,1,"In %s, failing to read attribute values from change log entry, agreement=%s, operation=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause:  Change log entries may be corrupted or certain attributes in the change log entry were not found.
// *Action: Check the associated error messages and look for the entry that failed. Using oidcmprec tool, compare and reconcile this entry from supplier to consumer.

23009,1,"In %s, error moving successfully applied change log items to purge queue, error=%s, changeNo=%d.\n"
// *Document: YES
// *Severity: warning
// *Category: Data
// *Cause:  Failed to update the change log entry status.
// *Action: Resolve the associated errors logged in the Replication server log and the OID server log. For further help contact Oracle Support Services.

23010,1,"Memory allocation failure in %s for %d bytes.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: The replication server was unable to allocate the required memory space.
// *Action: Contact Oracle Support Services.

23011,1,"In %s, failure connecting to server, %s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: Either the OID server is down or the replication password is incorrect.
// *Action: Ensure that the OID server is running. If the replication password has changed restart the replication server.

23012,1,"In %s, cannot bind to the consumer, server=%s\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: Either the OID server is down or the replication password is incorrect.
// *Action: Ensure that the OID server on the consumer is running. If the replication password has changed restart the replication server.

23013,1,"In %s, failure reading replica state of supplier from server=%s, DN=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: The replica entry was either corrupt or not found.
// *Action: Using remtool, clean up the replication and set up the replication again.

23014,1,"In %s, failure updating replica status to %s at server=%s, DN=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: Could not update the replication configuration entry for the replica.
// *Action: Look at the OID server log and resolve the corresponding errors reported in the log.

23015,1,"In %s, failure initializing last changenumber for bootstrapping, agreement=%s, supplierChangeNo=%d, consChangeNo=%d, errorCode=%d.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Could not get the last change number from the replica or could not update the replication configuration entry with the change number.
// *Action: Look at the OID server log and resolve the corresponding errors reported in the log.

23016,1,"In %s, failure begining hash iteration for included namecontext. Server=%s, agreement=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Configuration
// *Cause: No naming context was included for the replication agreement.
// *Action: Add the naming context for the replication agreement. If this does not resolve the problem contact Oracle Support Services.

23017,1,"In %s, failure when bootstrapping %d out of %d naming context(s) from the supplier, %s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: Indicated in the following associated error messages in the log file.
// *Action: More specific messages will accompany this message. Refer to those messages for the appropriate action.

23018,1,"In %s, failing in subtree delete on DN=%s, server=%s, error=%s.\n"
// *Document: YES
// *Severity: internal error
// *Category: Session
// *Cause: The ldap_delete operation failed.
// *Action: Check the OID server log and resolve the corresponding errors reported in the log. Contact Oracle Support Services for additional assistance.

23019,1,"In %s, failure enqueueing %s into queue=%s.\n"
// *Document: YES
// *Severity: internal error
// *Category: Session
// *Cause: An internal error caused the enqueue routine to fail.
// *Action: Contact Oracle Support Services.

23020,1,"In %s, ldap_search failure against server=%s where basedn=%s, scope=%d, filter=%s, attrs=%s, error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: Either the entry did not exist or this was an internal error where ldap_search failed.
// *Action: Examine the OID server logs and resolve the corresponding errors reported.

23021,1,"In %s, ldap_result failure against server=%s where basedn=%s, scope=%s, filter=%s, attrs=%s, error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred where ldap_result could not process the records.
// *Action: Contact Oracle Support Services.

23022,1,"In %s, failure parsing paging control response on server=%s, basedn=%s, scope=%s, filter=%s, attrs=%s, error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred where the paging control parsing failed.
// *Action: Contact Oracle Support Services.

23023,1,"In %s, DIT synchronization failure for namingContext=%s where supplier=%s and consumer=%s.\n"
// *Document: NO
// *Severity: error
// *Category: Session
// *Cause: See the following associated error messages for the actual cause
// *Action: More specific messages will accompany this message. Refer to the other messages for the appropriate action.

23024,1,"In %s, NULL LDAPMod structure returned for DN=%s, agreement=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An internal error occurred where the LDAPMod build routine returned NULL.
// *Action: Contact Oracle Support Services.

23025,1,"In %s, during bootstrapping operation, synchronization of entry DN=%s failing as this entry does not exist at supplier. Supplier=%s, consumer=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: The entry might have been deleted at the supplier during the bootstrap process.
// *Action: Restart the bootstrap process.

23026,1,"In %s, ldap_add failure for DN=%s where supplier=%s and consumer=%s with error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: The target DN may have been added by some other process on the consumer node during the bootstrap process.
// *Action: Restart the bootstrap process.

23027,1,"In %s, ldap_modify failure for DN=%s where supplier=%s and consumer=%s ith error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: The target DN may have been deleted by some other process on the consumer node during the bootstrap process.
// *Action: Restart the bootstrap process.

23028,1,"In %s, failure running DBMS_STATS.gather_schema_stats on server=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Process
// *Cause: Gathering of the schema statistics has failed.
// *Action: Manually run the job to gather the schema statistics.

23029,1,"In %s, failure creating Hashtable. %s.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: An internal error occurred where the Hashtable routine failed.
// *Action: Contact Oracle Support Services.

23030,1,"In %s, Hash Insert failure. %s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An internal error occurred where the HashTable routine failed.
// *Action: Contact Oracle Support Services.

23031,1,"In %s, ldap_search failed for ASR agreement on server=%s where basedn=%s, scope=%s, filter=%s, attrs=%s, error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: For ASR replication, either the agreement DN was corrupt or not found.
// *Action: Using remtool, clean up the replication (asrcleanup) and set up the replication (asrsetup) again.

23032,1,"In %s, failure inserting agreement for GroupDSA. Agreement=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: See the associated error messages for the actual cause.
// *Action: More specific messages will accompany this message. Refer to the other messages for the appropriate action.

23033,1,"In %s, failure reading GroupDSA of Agreement: %s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred where insert to DnList failed.
// *Action: Contact Oracle Support Services.

23034,1,"In %s, failure reading attribute=%s from ASR replication agreement DN, %s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: ASR agreement DN was either corrupt or not set up properly.
// *Action: Using remtool, clean up the replication (asrcleanup) and set up the replication (asrsetup) again.

23035,1,"In %s, unknown agreement protocol=%s under replication agreement DN, %s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Wrong protocol attribute value under the agreement.
// *Action: Using remtool, clean up the replication and set up the replication again.

23036,1,"In %s, failure getting current time. %s\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: An internal error occurred where the CurrentTime routine failed.
// *Action: Contact Oracle Support Services.

23037,1,"In %s, failure initializing mutex for agreement DN=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: An internal error occurred where the mutex routine failed.
// *Action: Contact Oracle Support Services.

23038,1,"In %s, local replica context is NULL on server=%s, agreement=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An internal error occurred where the local replica's context was not loaded.
// *Action: Contact Oracle Support Services.

23039,1,"In %s, failure reading replication configuration on server=%s with basedn=%s, scope=%s, filter=%s, attrs=%s, error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: The replication configuration entry (cn=Replication Configuration) was either corrupt or not found for the replica.
// *Action: Look at the OID server log and resolve the corresponding errors reported in the log. For further help contact Oracle Support Services.

23040,1,"In %s, failure reading attribute=%s from LDAP replication agreement DN=%s on Server=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: LDAP agreement DN was either corrupt or not set up properly.
// *Action: Using remtool, delete the node and add the node with the right configuration.

23041,1,"In %s, failure to get replica context,%s, from agreement,%s, on server=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred where the replica context was not found in the list for an agreement.
// *Action: Contact Oracle Support Services.

23042,1,"In %s, failure to load the LDAP agreement=%s for replica context=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: See the associated error messages for the actual cause
// *Action: More specific messages will accompany this message. Refer to the other messages for the appropriate action.

23043,1,"In %s, failure initialiating LDAP name context for agreement, %s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: See the associated error messages for the actual cause
// *Action: More specific messages will accompany this message. Refer to the other messages for the appropriate action.

23044,1,"In %s, failure duplicating hash table. %s\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: An internal error occurred where the HashTable routine failed.
// *Action: Contact Oracle Support Services.

23045,1,"In %s, failure to get replication DN and password from the wallet where consumer=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: See the associated error messages for the actual cause
// *Action: More specific messages will accompany this message. Refer to the other messages for the appropriate action.

23046,1,"In %s, failure getting the replication system configuration. Server=%s, Error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: The entry "configset0" for replication does not exist
// *Action: Contact Oracle Support Services.

23047,1,"In %s, failure to normalize naming context, %s. Server=%s, ErrorCode=%d.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An internal error occurred where the ldap routine failed.
// *Action: Contact Oracle Support Services.

23048,1,"In %s, invalid replica DN entry under the replication configuration on server=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Replication configuration subentry was either corrupt or not configured properly.
// *Action: Using remtool, clean up the replication and set up the replication again.

23049,1,"In %s, failure to read attribute=%s from replicaDN=%s on server=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Replica DN was either corrupt or not set up properly.
// *Action: Update this attribute with the correct value by using either ODSM or the command line. If this does not resolve the issue, use remtool to clean up replication, then set up replication again.

23050,1,"In %s, failure to parse the URI value in replicaDN. %s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Replica DN was either corrupt or not set up properly.
// *Action: Update this URI with the correct value by using either ODSM or the command line. If this does not resolve the issue, use remtool to clean up replication, then set up replication again.

23051,1,"In %s, failure spawning thread. %s.\n"
// *Document: YES
// *Severity: error
// *Category: Threads
// *Cause: An internal error occurred where the spawing of a thread failed.
// *Action: Contact Oracle Support Services.

23052,1,"In %s, failure reading the replica id from replica DN=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An internal error occurred where the DN parsing routine failed.
// *Action: Contact Oracle Support Services.

23053,1,"In %s, failure creating the queue, %s. %s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred where the Queue routine failed.
// *Action: Contact Oracle Support Services.

23054,1,"In %s, failure getting the attribute=%s from the changeStatusEntry. Server=%s, agreement=%s, operation=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: Invalid changestatusentry DN.
// *Action: Contact Oracle Support Services.

23055,1,"In %s, failure getting the attribute=%s from the root DSE. Server=%s, error=%d.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Either this attribute was corrupt or an internal error occurred in ldap_search.
// *Action: Look at the OID server log and resolve the corresponding errors reported in the log. For further help contact Oracle Support Services.

23056,1,"In %s, Replica, %s is in offline mode.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: Was unable to start the replication as the replica was in offline mode.
// *Action: Update the replica state to ONLINE and restart the replication server.

23057,1,"In %s, failure begining hash iteration for excluded namecontext. Server=%s, agreement=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Either the agreement DN was corrupt or an internal error where the routine failed to get excluded namecontext.
// *Action: Using remtool, clean up the replication and set up the replication again. For further help contact Oracle Support Services.

23058,1,"In %s, failure loading schema. Server=%s, error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An internal error occurred causing schema load to fail.
// *Action: Contact Oracle Support Services.

23059,1,"In %s, failure finding %s in the schema. Server=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An internal error occurred causing scheme load to fail.
// *Action: Contact Oracle Support Services.

23060,1,"In %s, error while loading %s from the schema. Server=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An internal error occurred causing scheme load to fail.
// *Action: Contact Oracle Support Services.

23061,1,"In %s, failure binding to server. Server=%s, port=%d.\n"
// *Document: YES
// *Severity: error
// *Category: Network
// *Cause: Either OID server was down or the replication password was incorrect.
// *Action: Ensure that the OID server is running. If the replication password has changed, restart the replication server.

23062,1,"In %s, failure to init %s naming context checking rules. Server=%s, agreement=%s, error=%d.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred where initialization of the naming context checking rules failed.
// *Action: Contact Oracle Support Services.

23063,1,"In %s, failure to initialize excluded attribute checking rules. Server=%s, agreement=%s, error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred where initialization of the excluded attribute checking rules failed.
// *Action: Contact Oracle Support Services.

23064,1,"In %s, failure getting CORE context.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: An internal error occurred where getCOREcontext failed.
// *Action: Contact Oracle Support Services.

23065,1,"In %s, failure begining hash iteration. Server=%s, Error=%d.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: An internal error occurred where the hash routine failed.
// *Action: Contact Oracle Support Services.

23066,1,"In %s, failure getting the error change log count.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: See the associated error messages for the actual cause
// *Action: More specific messages will accompany this message. Refer to the other messages for the appropriate action.

23067,1,"In %s, failure in comparing and reconciling schema of supplier, %s, and consumer, %s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Compare and reconcile of attributes and objectclasses in the schema failed.
// *Action: Look at the replication server log and resolve the associated errors reported in the log. For futher help contact Oracle Support Services. 

23068,1,"In %s, failure to update changestatusEntry. Consumer=%s, supplier=%s, agreement=%s, changeno=%d.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: See the associated error messages for the actual cause
// *Action: More specific messages will accompany this message. Refer to the other messages for the appropriate action.

23069,1,"In %s, failure parsing count control response. Server=%s, agreement=%s, error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred where parse control failed.
// *Action: Contact Oracle Support Services.

23070,1,"In %s, failure binding to server. Server=%s, port=%d.\n"
// *Document: YES
// *Severity: Error
// *Category: Network
// *Cause: Either OID server was down or the replication password was incorrect.
// *Action: Ensure that the OID server is running. If the replication password has changed restart the replication server.

23071,1,"In %s, finding only one replica, %s, for the agreeement, %s. Consumer=%s.\n"
// *Document: YES
// *Severity: warning
// *Category: Data
// *Cause: LDAP agreement was either corrupt or not set up properly.
// *Action: Using remtool, clean up the replication and set up the replication again.

23072,1,"In %s, bootstrapping against non-leaf replica is not allowed. %s\n"
// *Document: YES
// *Severity: Error
// *Category: Data
// *Cause: Status of the replica was set to BOOTSTRAP, which is not allowed for non-leaf replica.
// *Action: Set the status to ONLINE for the replication to start, for this replica.

23073,1,"In %s, bootstrap against master replica is not allowed. %s\n"
// *Document: YES
// *Severity: Error
// *Category: Configuration
// *Cause: Status of the replica was set to BOOTSTRAP, which is not allowed for master replica.
// *Action: Set the status to ONLINE for the replication to start, for this replica.


23075,1,"In gslsbaAddEntry, orclpassword must not be in cleartext if the userpassword attribute is not present in the entry.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An attempt was made to add or modify the orclpassword attribute with a cleartext value while the userpassword attribute was not present in the entry.
// *Action: Ensure that the orclpassword attribute value is in a hash format.

23076,1,"Trying to register more than the maximum number of plug-ins allowed.\n"
// *Document: YES
// *Severity: error
// *Category: Configuration
// *Cause: There were 128 plug-ins configured in the OID. No more are allowed.
// *Action: Please check the existing plug-ins and make sure the total number of plug-ins is within the maximum limitation.

23077,1,"In gslsbaUniqueCheck, objectclass is missing in the entry with DN %s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: The given entry was missing values for the objectclass attribute.
// *Action: Provide objectclass attributes with values in the entry being added.

23078,1,"In gslsbpmCGetSubscriberpwdPolicy, unable to find root password policy.\n"
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause: The pwdpolicysubentry attribute in the root DSE was not populated, or the DN described in the pwdpolicysubentry attribute value in did not exist.
// *Action: Ensure that the pwdpolicysubentry attribue is populated with the DN of a valid password policy entry.

23079,1,"%s is not in UTC format. Unable to determine account validity for %s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: The orclactiveenddate or orclactivestartdate attribute in the entry associated with this message was not in UTC format.
// *Action: Ensure that orclactiveenddate and orclactivestartstate are always in UTC format.

23080,1,"In gslbpvGenO3LogonVerifier, username is NULL.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: When generating O3LogonVerifier, OID was unable to locate or construct a username(DN) by internal search or by user input.
// *Action: Ensure that the username (DN) is available.

23082,1,"Encountering unsupported plug-in configuration."
// *Document: YES
// *Severity: error
// *Category: Configuration
// *Cause: An invalid plug-in configuration was found in OID.
// *Action: Examine all existing plug-in configurations and ensure all the plug-in conditions are specified correctly.

23083,1,"Server with Process ID = %d is running but not responding.\n"
// *Document: YES
// *Severity: error
// *Category: Process
// *Cause: The state of the server process with the specified PID was unstable and therefore the server did not respond.
// *Action: After the dispatcher process has retried checking status 1000 times, if the the server is still unresponsive, the dispatcher starts a new server process. Alternately, terminate the server process, which will result in a new server being launched automatically.

23084,1,"ServerDispatcher: The new maximum instance specific concurrent connections setting is not immediately effective.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: The new instance specific maximum concurrent connections limit was less than the total number of already established connections.
// *Action: The setting will automatically become effective when the number of established connections falls below the new limit. Alternatively, restart the instance for the new setting to be effective immediately.

23085,1,"An invalid change log entry is being added to the shadow change log.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An internal error occurred.
// *Action: Contact Oracle Suppert Services.

23086,1,"In gsldbb_AddAttrBVal, size of binary attribute to be added exceeds the max suported size."
// *Document: YES
// *Severity: error
// *Category: Compliance
// *Cause: Size of this binary attribute value exceeds max limit (4MB).
// *Action: Ensure that the binary attribute value's size is within max size limit and retry the operation.

23087,1,"In gsldbb_AddAttrBVal, no value to add for binary attribute name."
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: The binary attribute value was empty.
// *Action: Ensure that the binary attribute value is not empty and then retry the operation.

23088,1,"Detecting Illegal change log search condition %d.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.

23089,1,"In gsldma_Modify, invalid value for attribute orclrefreshdgrmems.\n"
// *Document: YES
// *Severity: error
// *Category: Compliance
// *Cause: Invalid value provided for dynamic group membership refresh attribute.
// *Action: Ensure that value of dynamic group membership refresh attribute - orclrefreshdgrmems - is either 0 or 1.

23090,1,"In gslfadADoAdd, no value(s) provided for attribute %s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: No value(s) was given for this attribute in the ldapadd operation.
// *Action: Provide value(s) for the attribute and retry the ldapadd operation.

23091,1,"In gslfbigciGetControlInfo, illegal format of control info.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: The format of the control sent was invalid.
// *Action: Ensure that the format of the control sent is valid and retry the operation.

23092,1,"In gslfbigciGetControlInfo, illegal format of control Object ID.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: The format of the sent control's OID is invalid.
// *Action: Ensure that the format of the sent control's OID is valid and retry the operation.

23093,1,"In gslfbirbiReadBindInfo, unsupported LDAP version %d.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: Version of the client protocol used in the operation was not supported by the OID server.
// *Action: Ensure that client protocol version is supported.

23094,1,"In gslfbiSetAuthFromSSL, the certificate DN %s matches more than one entry in OID.\n"
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause: The client certificate does not uniquely identify an user entry in OID.
// *Action: Ensure that the certificate to DN mapping is n to 1 and retry the operation.

23095,1,"In gslfblsafsSetAuthFromSSL, selected credential does not support client authentication.\n"
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause: The client did not send the client certificate credential required by the server.
// *Action: Check the client SSL crendential.

23096,1,"In gslfblsafsSetAuthFromSSL, the certificate DN %s does not exist.\n"
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause: The client certificate contains a user DN ithat does not exist in the directory.
// *Action: Verify that the client certificate has a valid user DN in the directory and retry the operation.

23097,1,"In gslfblsafsSetAuthFromSSL, illegal DN %s in the certificate.\n"
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause: The subject DN in the client certificate was invalid.
// *Action: Ensure that the subject DN in the client certificate is valid and retry the operation.

23098,1,"In gslfdeADoDelete, Ldap v2 clients need to bind first.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: Client was using protocol with LDAP version 2 and did not perform a ldapbind operation before issuing this LDAP operation.
// *Action: Ensure that if the client is using LDAP version 2, an ldapbind performed before any other LDAP operation.

23099,1,"In gslfseADoSearch, Ldap v2 clients need to bind first.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: Client was using LDAP version 2 and did not perform a ldapbind operation before issuing this LDAP operation.
// *Action: Ensure that if the client is using LDAP version 2, an ldapbind performed before any other LDAP operation.

23100,1,"In gslfseADoSearch, filter is invalid.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: The search filter in the ldapsearch operation was not valid. 
// *Action: Ensure that the search filter in the ldapsearch operation is valid. 

23101,1,"In gslfseADoSearch, filter must be single AVA for user certificate binary for exact match.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: In an exact match certificate search, the filter supplied was not a single attribute value assertion.
// *Action: Ensure that for the exact match certificate search, the filter supplied is a single attribute value assertion.

23102,1,"Unknown filter choice %d.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: The filter choice in the ldapsearch operation was not valid.
// *Action: Ensure that the filter choice in the ldapsearch operation is valid.

23103,1,"In gsldbb_AddAttrBVal, failure retrieving certificate information from certificate (%d).\n"
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause: The certificate was not valid.
// *Action: Ensure the validity of the certificate.

23104,1,"In gsldbb_AddAttrBVal, failure converting certificate serial number from binary to base 64-encoded string (%d).\n"
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause: Invalid certificate serial number.
// *Action: Check the serial number in the certificate.

23105,1,"Line %d: missing < = > in (or value after) < %s > in to clause.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Attribute list was not provided in ACI directive clause governing attributes.
// *Action: Examine ACI syntax documentation and provide attribute list in required format.

23106,1,"Line %d: erroneous attribute list < %s > in to clause.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: The attribute list was incorrectly formatted.
// *Action: Examine ACI syntax documentation and reformat the ACI clause to adhere to the expected format.

23107,1,"Attribute %s not defined in schema (entrydn=%s).\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An attribute not defined in the directory schema was part of the ACI clause.
// *Action: Remove all attributes not defined in the directory schema from ACI directives.

23108,1,"gslecLRU: Entry cache is full, could not free up size %u.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: Entry Cache is FULL.
// *Action: Increase the Entry Cache size.

23109,1,"oidctl: instance parameter is missing.\n"
// *Document: YES
// *Severity: error
// *Category: Process
// *Cause: Instance name is missing.
// *Action: Provide the instance name and retry.

23110,1,"oidctl: Config set entry cn=configset%u,%s does not exist.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: An attempt was made to bring up an instance with a non existent configset entry.
// *Action: Ensure that the configset entry exists and retry.


23111,1,"oidctl: Invalid parameters passed in flags.\n"
// *Document: YES
// *Severity: error
// *Category: Process
// *Cause: Parameters passed in flags were invalid.
// *Action: Ensure that parameters in flags are valid and retry.

23112,1,"Key %s already in use.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Multiple realms may be pointing to the same usersearchbase.
// *Action: Ensure that usersearchbase definitions in realms do not collide.

23113,1,"In %s, failure cleaning up the change logs from supplier, %s to consumer, %s.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: See the associated error messages for the actual cause.
// *Action: More specific messages will accompany this message. Refer to the other messages for the appropriate action.

23114,1,"Waiting for worker threads to finish change logs queued in memory from the supplier, %s...\n"
//*Severity: Warning

23115,1,"Finished processing change logs queued in memory from all the suppliers.\n"
//*Severity: Warning

23116,1,"%s : Memory allocation failed for %s.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23117,1,"DispatcherController : OS : Error creating thread management queue.\n"
// *Document: YES
// *Severity: error
// *Category: Threads
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23118,1,"DispatcherController : OS : Error creating thread sync mutex.\n"
// *Document: YES
// *Severity: error
// *Category: Threads
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23119,1,"DispatcherController : Error in creating dispatcher process server queue.\n"
// *Document: YES
// *Severity: error
// *Category: Process
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.


23120,1, "OS %d : Failed to enqueue in %s.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23121,1,"Unable to register %s.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23122,1,"Polling port failed with error %d."
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23123,1,"DispatcherController : OS %d : Opening of communication control port failed.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23124,1,"The server with Process ID = %d is not running.\n"
// *Document: YES
// *Severity: error
// *Category: Process
// *Cause: The server process failed.
// *Action: Check the core dump or the stack trace and contact Oracle Support Services.

23125,1,"The server with Process ID=%d is not responsive; restarting the server.\n"
// *Document: YES
// *Severity: error
// *Category: Process
// *Cause: Server process is not responding because the system might be busy.
// *Action: The original unresponsive process will be killed.


23127,1,"OS Error -(%d) :Error in polling.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23128,1,"In gslsflAcceptConnAndSend, OS %d : unable to accept new TCP connection.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23130,1,"%s : OS %d : Setting up/attaching of shared memory failed.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.


23132,1,"ServerController : OS : Error creating internal queues.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.


23135,1,"ServerController : OS : error initializing SM thread condition variable's mutex.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.


23137,1,"ServerController: hash table creation for user operations failed.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23138,1,"ServerController: error initializing r/w lock for user operations hash.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.


23141,1,"Signalling dispatcher thread failed.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23142,1,"No free connection available; dropping the connId = %d.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.


23144,1,"Exceeding maximum number of connections allowed. Num Conns = %d, Max Conns = %d, Closing the connection.\n"
// *Document: YES
// *Severity: error
// *Category: Programmatic
// *Cause: The number of LDAP connections to OID server exceeded the maximum limit.
// *Action: Check for applications or users with leaked or improperly prolonged LDAP connections and perform the appropriate corrective actions. In addition, if deemed necessary, relaunch the OID server instance with with more server processes in order to achieve adequate connection handling capacity.

23145,1,"Socket fd=%d greater than system max=%d numconns=%d.\n Closing the connection.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: The number of sockets or file descriptors to OID server have reached system maximum limit.
// *Action: Check for system maximum number of file decriptors. Check for applications with leaked or improperly prolonged LDAP connections and perform the appropriate corrective actions. In addition, if deemed necessary, relaunch the OID server instance with more server processes in order to achieve adequate connection handling capacity.

23147,1,"ServerListener : OS %d : unable to contact dispatcher.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: Either the dispatcher failed or the administrator is initiating a shutdown.
// *Action: Check the core dump or stack trace. For further assistance contact Oracle Support Services.

23148,1,"ServerListener : Lost contact with dispatcher.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23155,1,"In gslsfliInitnzoscontext, nzos initialization failed with NZ %d.\n"
// *Document: YES
// *Severity: error
// *Cause: System Resource constraint.
// *Category: Operating System
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.


23157,1,"In gslsfliInitnzoscontext, creation of nzos context failed.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23158,1,"In gslsfliInitnzoscontext, failure initializing the DML context.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23159,1,"In gslsfliInitnzoscontext, failure with NZ %d when opening wallet %s.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.


23160,1,"In gslsfliInitnzoscontext, failure setting credentials in nzos context.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23161,1,"In gslsfliInitnzoscontext, failure  setting cipher choice in nzos context.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23162,1,"ServerWorker : OS : gslesioIBerAlloc failed.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23163,1,"Database connection is unavailable. Shutting down.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23164,1,"ServerWorker : OS : BER allocation failed.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23165,1,"ServerWorker : Received unknown operation tag.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23166,1,"In gslarswWorker, memory allocation of maxFiltSize = %d failed.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23167,1,"Too many unique constraints: > %d.\n"
// *Document: YES
// *Severity: error
// *Category: Configuration
// *Cause: The number of unique constraints was larger than the maximum allowed.
// *Action: Reduce the number of unique constraints.

23168,1,"Database error in gslsbaAddEntry [gsldpoOperationComplete]."
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Commit or rollback failed.
// *Action: Check the database log and apply appropriate corrective measures.

23169,1,"In gslsbaAddEntry, entry cache update failed after commit to database.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: System Resource constraint.
// *Action: Check the database log and apply appropriate corrective measures.

23170,1,"In gslsbaAddEntry, failure re-allocating memory to modify subschema_subentries attribute in backend struct.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply corrective measures.

23171,1,"In gslbDeleteEntry, failure to remove subschemasubentry DN from Root DSE because memory allocation failed.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23172,1,"In gslsbmModify, schema hash search failed for attr %s.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23173,1,"In gslsbmdModifyDN, update of dynamic group memberships failed.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23174,1,"In gslsbmdModifyDN, update of dynamic group DNs in cache failed.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23175,1,"In gslsbmdModifyDN, reload of password policy failed.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23176,1,"In gslsbmdModifyDN, error in deleting component subschema-subentry DN from root DSE entry.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23177,1,"In gslsbmdModifyDN, error in adding component subschema-subentry DN to root DSE entry.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23178,1,"In gslsbmdModifyDN, database error [gsldpoOperationComplete]."
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Commit or roll back failed
// *Action: Check the database log  and apply appropriate corrective measures.

23180,1,"In gslsbmdModifyDN, error in orclacpgroup cache reload.\n"
// *Document: YES
// *Severity: error
// *category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23183,1,"In gsldazb_InsertAttrib, certificate hash generation failed (%d).\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23184,1,"In gsldasaDbInsUserStats, hash table pointer for user %s operation is NULL.\n\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23185,1,"In gsldasaDbInsUserStats, Op: %s lcvb2werr() returned invalid base error for Eid string %s. Setting dummy value %d for Eid.\n\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23186,1,"In gsldasaDbInsUserStats, Op: %s * lcvb2werr() returned overflow error for Eid string %s. Setting dummy value %d for Eid.\n\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23187,1,"In gsldasaDbInsUserStats, lcvb2werr() returned invalid input for Eid string %s. Setting dummy value %d for Eid.\n\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23188,1,"In gsldasaDbInsUserStats, OpName: %s beginning of read-only iteration of 2nd level (comp obj) hash table has failed.\n\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23189,1,"In gsldasaDbInsUserStats, ORA-%d occurred while inserting compare (detail) SM stats.\n\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Database error occured.
// *Action: Check the database log and apply appropriate corrective measures.

23190,1,"In gsldasaDbInsUserStats, ORA-%d while inserting user stats.\n\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Database error occured.
// *Action: Check the database log and apply appropriate corrective measures.

23191,1,"In gsldasaDbInsUserStats, ORA-%d while inserting user stats. Error = %s.\n\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Database error occured.
// *Action: Check the database log and apply appropriate corrective measures.

23192,1,"In gsldbdDelAttrBVal, size of binary attribute to be deleted exceeds the max supported size."
// *Document: YES
// *Severity: error
// *Category: Compliance
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23193,1,"In gsldbdDelAttrBVal, no value to delete for binary data."
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23194,1,"In gsldbc_DelAttrBVal, failure retrieving certificate information (%d).\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23195,1,"In gsldbc_DelAttrBVal, failure converting certificate serial number from binary to base 64 encoded string (%d).\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23196,1,"In gsldmf_BVal2StrCertHashList, error generating certificate hash.\n"
// *Document: YES
// *Severity: error
// *Category: Memory 
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23197,1,"In gsldusaGetCtxNmSpcParVal, ORA-%d:%s encountered.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Database error occured.
// *Action: Check the database log and apply appropriate corrective measures.

23198,1,"In gslesrdBerGetNext, memory allocation failed len %d ber->ber_len %d.\n"
// *Document: YES
// *Severity: error
// *Category: Memory
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23199,1,"In gsleswrrwRawWrite %d, writing to network failed due to hard or unknown error.\n"
// *Document: YES
// *Severity: error
// *Category: Network
// *Cause: Client is not responding after sending the operation request.
// *Action: Contact Oracle Support Services.

/OID Install mesg
23200,1,"oidpic completed successfully.\n"

23201,1,"OS %d : error spawning dispatcher thread.\n"
// *Document: YES
// *Severity: error 
// *Category: Operating System
// *Cause: System Resource constraint. 
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23202,1,"In gslffiCGetSubstringFilter, substring filter is not supported for usercertificate binary attribute.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: Unsupported substring filter was provided for usercertificate attribute search.
// *Action: Provide valid filter for usercertificate attribute search.

23203,1,"In gslffiGBldBinFltrSrchParam, either the separator is missing or the certificate match value in filter string %s is incomplete.\n"
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: Filter provided for certificate match value for usercertificate attribute search was invalid.
// *Action: Provide valid certificate match value for filter in usercertificate attribute search.

23204,1,"Unsupported filter choice.\n" 
// *Document: YES
// *Severity: error
// *Category: Requests/Responses
// *Cause: Filter provided for the search operation was not supported or was unknown.
// *Action: Provide valid filter for the search operation and retry.

23205,1,"In gslarswWorker, received HA down event. Requesting new DB connection.\n"
// *Document: YES
// *Severity: error
// *Category: High Availability
// *Cause: The database has gone down.
// *Action: No user action needed, OID will handle database connection failover automatically.

23206,1,"In gslarutbDequeueDBConnection, connection dequeued received HA down event. Creating new DB connection.\n"
// *Document: YES
// *Severity: error
// *Category: High Availability
// *Cause: Database has gone down.
// *Action: No user action needed, OID will handle database connection failover automatically.

23207,1,"In gsldhacHACallback, HA Callback Event\n Thread Id: %d\n Event type: %d\n HA Source: %s\n Host name: %s\n Database name: %s\n Instance name: %s\n Timestamp: %s\n Service name: %s\n HA status: %s\n"
// *Document: YES
// *Severity: error
// *Category: High Availability
// *Cause: Database has come up or gone down.
// *Action: No user action needed, OID will handle database connection failover automatically.

23208,1,"In gsluirsclLoadSchema, error in %s %s line %d in gsluirsclLoadSchema.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: Incorrect definition in schema.
// *Action: Correct the definition in schema.

23209,1,"In gslsfliInitnzoscontext, failure setting orclsslinteropmode flag in nzos context.\n"
// *Document: YES
// *Severity: error
// *Category: Operating System
// *Cause: System Resource constraint.
// *Action: Check the system resource utilization on the machine and apply appropriate corrective measures.

23210,1,"One or more of the required indexes (rp_dn, st_orclnormdn, ei_attrstore) are missing. Server will operate in READ-MODIFY mode.\n"
// *Document: YES
// *Severity: error
// *Category: Data
// *Cause: bulkload index=true was not run.
// *Action: Run bulkload index=true to recreate the indexes.

23211,1,"In %s, failure to parse entry count control response. Server=%s, basedn=%s, scope=%s, filter=%s, attrs=%s, error=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause:  An internal error occurred where the entry count control parsing failed.
// *Action: Contact Oracle Support Services.

23212,1,"Failure accessing Oracle database (oracle errcode=%d)."
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: A database connection was terminated.
// *Action: Check if the database was shutdown or check the database alert log for further details.

/COMMENT1: Message Id before 23500 is reserved for oidldapd new messages.

/COMMENT2: When writing the comments please start with "single slash" instead of double, for the sake that parsing from msg to xml requires it.




/23500-23700 used in OID Install/Deconfig, plz use 23701+ onwards


/Replication Messages
23701,1,"************ Conflict Resolution Message ************\n"
23702,1,"Conflict reason: %s.\n"
23703,1,"Change number: %d.\n"
23704,1,"Supplier: %s.\n"
23705,1,"Change type: %s.\n"
23706,1,"Target DN: %s.\n"
23707,1,"Result: %s.\n"
23708,1,"Change moved to low priority queue after failing on %dth retry"
23709,1,"Attempted to add an existing entry"
23710,1,"Parent entry does not exist"
23711,1,"Internal Error occurred"
23712,1,"Deleted duplicated target entry which was created later than the change entry. Apply the change entry again"
23713,1,"Dropped a newer change entry"
23714,1,"Dropped change entry since its guid is greater than target entry guid"
23715,1,"Dropped change entry since its guid is same as target entry i.e change and target entry are identical"
23716,1,"Deleted duplicated target entry which has greater guid than the change entry"
23717,1,"System error encountered: %s"
23718,1,"Attempted to modify a non-existent entry"
23719,1,"Attempted to delete a non-existent entry"
23720,1,"Attempted to delete a non leaf entry"
23721,1,"Attempted to move a non-existent entry"
23722,1,"Attempted to move to an existent entry"
23723,1,"Attempted to move to an existent entry which is newer than the source entry"
23724,1,"Deleted existent entry which was created later than the entry trying to move. Move of entry will be tried again"
23725,1,"Attempted to move to an existent entry which is older than the entry trying to move"
23726,1,"Deleted Source entry and dropped the change"
23727,1,"Attempted to move to an existing entry which was created at the same time and had the same guid"
23728,1,"Attempted to move to an existing entry which has greater guid than the entry trying to move"
23729,1,"Deleted duplicated target entry and re-applied the change"
23730,1,"Attempted to move to an existing entry which has lower guid then entry trying to move"
23731,1,"Unknown change type"
23732,1,"Excluded attributes list has some of the mandatory attributes of this entry"
23733,1,"Mandatory attributes of this entry are not excluded in the target"
23734,1,"In %s, failure initializing synchronization lock, %s.\n"
// *Document: YES
// *Severity: error
// *Category: Session
// *Cause: An internal error occurred where the lock routine failed.
// *Action: Contact Oracle Support Services.
23735,1,"Synchronization of moddn for another non-existent entry is going on"
23736,1,"Replication DN password expired. Replication DN=%s and server=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause: The replication user's account has expired.
// *Action: Reset the replication DN password.

23737,1,"Replication DN account is locked. Replication DN=%s, Server=%s.\n"
// *Document: YES
// *Severity: error
// *Category: Security
// *Cause:  The configured maximum consecutive bind failures allowed for Replication DN was exceeded.
// *Action: Unlock the replication DN account.

23738,1,"Reset Replication DN password using ASCTL, \"asctl oidReplicationManagement -operation resetPassword\"\n"
23739,1,"Unlock the replication DN account using ASCTL, \"asctl setOIDReplication -unlock true\"\n"
23740,1,"Dropped change entry since the target entry with same guid was alredy deleted\n"
23741,1,"%s: Failed to read replica state of consumer from server=%s, DN=%s\n"

/23800-23900 used in OID Install/Deconfig, plz use 23901+ onwards

/oidcmprec Tool Messages

23901,1,"\n -------------------------------------------------------------------------\n oidcmprec - directory comparison & reconciliation tool syntax:  \n -------------------------------------------------------------------------"
23902,1,"\n oidcmprec operation=< compare | reconcile | merge | mergedryrun |\n                       userdefinedcr> " 
23903,1,"           source=<host>:<port>"
23904,1,"           destination=<host>:<port>"
23905,1,"           base='(\"dn1\" \"dn2\" \"dn3\" ...)'" 
23906,1,"           [dns2exclude='(\"excldn1\" \"excldn2\" \"excldn3\" ...)']"
23907,1,"           [scope=<base | sub | onelevel>]"
23908,1,"           [filter=<filter>]" 
23909,1,"           [threads=<number_of_worker_threads>]"
23910,1,"           [dnthreads=<number_of_dn_threads>]"
23911,1,"           [exclattr=<space_separated_list_of_attributes_to_exclude>|\n            inclattr=<space_separated_list_of_attributes_to_include>]"
23912,1,"           [compareby=<remtool | ldapserver>]"
23913,1,"           [filename=<file_name_without_extension_to_store_report>]"
23914,1,"           [genchglog=<t[rue] | f[alse] | d[efault]>]"
23915,1,"           [reconaver=<t[rue] | f[alse]>]"
23916,1,"           [verbose=<t[rue] | f[alse]>]"
23917,1,"           [force=<t[rue] | f[alse]>]"
23918,1,"           [contonerr=<t[rue] | f[alse]>]"
23919,1,"           [help=<t[rue] | f[alse]>]"
23920,1,"\n For operation=userdefinedcr option, following options can be specified:"
23921,1,"\n           [entos=<ignore | add | log2add | del  | log2del | log>]"
23922,1,"           [entod=<ignore | add | log2add | del | log2del | log>]"
23923,1,"           [atros=<ignore | add | log2add | del | log2del | usenewer |"
23924,1,"                   log2usenewer | useolder | log2useolder | usesmallguid |" 
23925,1,"                   log2us | esmallguid | usebigguid | log2usebigguid | log>]"
23926,1,"           [atrod=<ignore | add | log2add | del | log2del  | usenewer |"
23927,1,"                   log2usenewer | useolder | log2useolder | usesmallguid |"
23928,1,"                   log2usesmallguid | usebigguid | log2usebigguid | log>]"
23929,1,"           [svatrdif=<ignore | usesrc | log2usesrc | usedest | log2usedest |"
23930,1,"                      usenewer | log2usenewer | useolder | usesmallguid |"
23931,1,"                      log2usesmallguid | usebigguid |log2usebigguid | log>]"
23932,1,"           [mvatrdif=<ignore | usesrc | log2usesrc | usedest | log2usedest |"
23933,1,"                      usenewer | log2usenewer | useolder | log2useolder |"
23934,1,"                      usesmallguid | log2usesmallguid | usebigguid |"
23935,1,"                      log2usebigguid | merge | log2merge | log>]"
23936,1,"           [dndif=<ignore | usesrc | log2usesrc | usedest | log2usedest |"
23937,1,"                   log>]"
23938,1,"           [adefos=<ignore | add | log2add | del  | log2del | log>]"
23939,1,"           [adefod=<ignore | add | log2add | del  | log2del | log>]"
23940,1,"           [adefdif=<ignore | usesrc | log2usesrc | usedest | log2usedest |"
23941,1,"                     log>]"
23942,1,"           [odefos=<ignore | add | log2add | del  | log2del | log>]"
23943,1,"           [odefod=<ignore | add | log2add | del  | log2del | log>]"
23944,1,"           [odefdif=<ignore | usesrc | log2usesrc | usedest | log2usedest |"
23945,1,"                     merge | log2merge | log>]"
23946,1,"or \n oidcmprec paramfile=<filename_that_contains_the_above parameters>" 
23947,1,"or \n oidcmprec xmlparamfile=<XML_filename_that_ contains_the_above_parameters>"

/ 5 message space from 23948 to 23952 has been left for future options


23953,1,"Error:\nInternal error. gslusTrim() failed."
23954,1,"Failed to bind to source directory.\n"
23955,1,"Error:\nFailed to open report/LDIF files for writing.\n"
23956,1,"Error:\nFailed to load the schema of source directory.\n"
23957,1,"Error:\nFailed to load the schema of destination directory.\n" 
23958,1,"Error:\nThe mandatory argument \"operation\" is missing."
23959,1,"Error:\nFailed to read repl config info of source directory.\n"
23960,1,"Failed to load schema.\n"
23961,1,"Error:\nFailed to bind to directory"
23962,1,"Failed to bind to destination directory.\n"
23963,1,"Error:\nSchema compare and reconcile operation failed.\n"
23964,1,"Failed to initialize queues.\n"
23965,1,"Failed to spawn threads.\n"
23966,1,"\n\nThis tool encountered a CRITICAL error.\n"
23967,1,"\n\nThis tool encountered an error.\n"
23968,1,"Failed to spawn worker thread.\n"
23969,1,"Failed to spawn DN thread.\n"
23970,1,"Failed to spawn Log writer thread.\n"
23971,1,"Error:\nSearch against source directory has failed.\n"
23972,1,"Failed to locate datamig.xsd file.\n"
23973,1,"Error:\nFailed to initalize lrm context structure.\n"
23974,1,"Error:\nThe mandatory argument \"base\" is missing.\n" 
23975,1,"Failed to load schema document. Error code %u.\n"
23976,1,"Failed to parse XML file %s. Error code %u.\n"
23977,1,"Validation of file %s failed. Error code %u.\n"
23978,1,"Failed to initalize XSD context structure. Error code %u.\n"
23979,1,"Error:\nFailed to initalize XML context structure. Error code %u.\n"
23980,1,"Error:\n\"%s\" : Invalid value for argument \"operation\".\n"
23981,1,"Error:\n\"%s\" : Invalid value for argument \"scope\"\n"
23982,1,"Error:\n\"%s\" : Failed to parse.\n"
23983,1,"Error:\nFailed to get replication DN of source directory ldap://%s:%d.\n"
23984,1,"Error:\nFailed to get replica id of source directory ldap://%s:%d.\n"
23985,1,"Error:\nFailed to get replication DN of destination directory ldap://%s:%d.\n"
23986,1,"Error:\nFailed to get replica id of destination directory ldap://%s:%d.\n"
23987,1,"Error:\nlsfp() failed.\n"
23988,1,"Warning:\nScope is specified as base. Hence only one worker thread and DN thread will be spawned.\n"
23989,1,"Warning:\nMaximum number of worker threads and DN threads allowed in this host : %d.\nthreads=%d and dnthreads=%d are ignored.\n"
23990,1,"Error:\nFailed to parse parameter file %s.\n"
23991,1,"Error:\n\"%s\": Invalid DN.\n"
23992,1,"Warning:\nExcluded attribute \"%s\" is invalid. Ignored\n"
23993,1,"Error:\nInternal error. gslusTrim() failed."
23994,1,"Warning:\nIncluded attribute \"%s\" is invalid. Ignored\n"
23995,1,"Error:\n\"%s\" : Invalid value for argument \"entos\".\n"
23996,1,"WARNING:\n\"entos\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
23997,1,"Error:\n\"%s\" : Invalid value for argument \"entod\".\n"
23998,1,"WARNING:\n\"entod\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
23999,1,"Error:\n\"%s\" : Invalid value for argument \"dndif\".\n"
24000,1,"WARNING:\n\"dndif\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24001,1,"Error:\n\"%s\" : Invalid value for argument \"atros\".\n"
24002,1,"WARNING:\n\"atros\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24003,1,"Error:\n\"%s\" : Invalid value for argument \"atrod\".\n"
24004,1,"WARNING:\n\"atrod\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24005,1,"Error:\n\"%s\" : Invalid value for argument \"svatrdif\".\n"
24006,1,"WARNING:\n\"svatrdif\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24007,1,"Error:\n\"%s\" : Invalid value for argument \"mvatrdif\".\n"
24008,1,"WARNING:\n\"mvatrdif\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24009,1,"Error:\n\"%s\" : Invalid value for argument \"compareby\".\n"
24010,1,"Error:\n\"%s\" : Invalid value for argument \"genchglog\".\n"
24011,1,"Error:\n\"%s\" : Invalid value for argument \"odefos\".\n"
24012,1,"WARNING:\n\"odefos\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24013,1,"Error:\n\"%s\" : Invalid value for argument \"odefod\".\n"
24014,1,"WARNING:\n\"odefod\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24015,1,"Error:\n\"%s\" : Invalid value for argument \"odefdif\".\n"
24016,1,"WARNING:\n\"odefdif\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24017,1,"Error:\n\"%s\" : Invalid value for argument \"adefos\".\n"
24018,1,"WARNING:\n\"adefos\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24019,1,"Error:\n\"%s\":Invalid value for argument \"adefod\".\n"
24020,1,"WARNING:\n\"adefod\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24021,1,"Error:\n\"%s\" : Invalid value for argument \"adefdif\".\n"
24022,1,"WARNING:\n\"adefdif\" is assigned the default value of \"ignore\" for \"userdefinedcr\" operation.\n"
24023,1,"Warning:\n%s \"%s\" is duplicate. Ignored.\n"
24024,1,"\n\nExecute following command to get oidcmprec tool syntax:\noidcmprec help=true\n"
24025,1,"Error:\nFailed to initalize context structure.\n"
24026,1,"\nError:\nSpecify either included attributes or excluded attributes but not both.\n"
24027,1,"\nError:\n Specify \"userpassword\", \"authpassword\" and \"authpassword;*\" attributes in the excluded  attributes list\n"
24028,1,"Error:\nMutex initialization has failed.\n"
24029,1, "Enter superuser DN of source directory        : "
24030,1, "Enter superuser password of source            : "
24031,1, "Enter superuser DN of destination directory   : "
24032,1, "Enter superuser password of destination       : "







/END of ldapus.msg
