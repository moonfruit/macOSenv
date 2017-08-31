/Copyright (c) 1987, 2000, Oracle Corporation.  All rights reserved.
/ 
/ NAME
/   pcmus.msg : Message File
/ FUNCTION
/
/ NOTES
/   Segmentation of error messages  (change as appropriate)
/     1..50      Client
/     101..200   PH1 messages
/     201..750   PH2 messages
/     751..899   other messages
/     900..949   library manager
/     950..999   other messages (970..979) SQLJ Types
/    1000..1099  FIPS flags from ANSI section 1
/    1100..1199  FIPS flags from ANSI section 2
/    1200..1299  FIPS flags from ANSI section 3
/    1300..1399  FIPS flags from ANSI section 4
/    1400..1499  FIPS flags from ANSI section 5
/    1500..1599  FIPS flags from ANSI section 6
/    1600..1699  FIPS flags from ANSI section 7
/    1700..1799  FIPS flags from ANSI section 8
/    1800..1899  FIPS flags from ANSI section 9
/

/
/ MODIFIED
/    wxli       03/24/09 - bug8232108: diana-style wrap files
/    achoi      01/14/09 - bug 7336509
/    ajadams    12/10/08 - error 132, make cause text more generic
/    sagrawal   07/24/08 - bug 7035487: No null identifier names
/    astocks    10/02/07 - Add 756 - PL/SQL fence violation
/    wxli       09/11/07 - error for illegal calls to internal standard
/                          functions such as " SYS$STANDARD_TRIM"
/    rdecker    10/28/06 - Add SYSAUX offline error for plscope
/    gviswana   09/05/06 - Editions: NV to V dependency error
/    sagrawal   10/16/06 - fix 204
/    jmuller    09/22/06 - Fix bug 5395797: don't initialize one field with
/                          another
/    jmuller    08/15/06 - Fix bug 5242317 (sort of): tweak 710 error message
/    sagrawal   06/07/06 - change message 675 
/    kmuthukk   04/14/06 - shared function result cache 
/    sagrawal   04/21/06 - Compound Triggers 
/    jmuller    05/18/06 - Fix bug 5218593: PLS-166 should include intervals
/    astocks    04/18/06 - Pragma SUPPLEMENTAL_LOG_DATA
/    rdecker    01/06/06 - Add DOTNET error messages
/    jmuller    12/07/05 - Fix bug 4742474: flag Q_BULKs used in expressions 
/                          in dynamic FORALL SQL stmt binds 
/    gviswana   07/08/05 - Simplify PLS-488 
/    sagrawal   06/15/05 - Generalized Invocation 
/    jmuller    03/16/05 - Fix bug 4185606: flag ref cursor parameters in 
/                          client-side forwarded RPC case 
/    mxyang     01/17/05 - add PLS-106
/    mxyang     01/17/05 - remove PLS-175: "unknown inquiry directive '%s'"
/    dapte      11/04/04 - 739-remote bulk collect 
/    jmuller    08/25/04 - Fix up PLS-960 to cover b3711726 testcase 
/    jmuller    07/22/04 - Fix bug 3680399: clarify PLS-371 for labels 
/    astocks    07/22/04 - Real native
/    mxyang     06/23/04 - fix tense in conditional compilation messages
/    gviswana   06/03/04 - Add wrap corruption error message 
/    gviswana   06/04/04 - Add submessage for PLS-123 
/    gviswana   06/01/04 - 3639712: Synonym chain error message 
/    jmuller    05/28/04 - Fix bug 3647002: generalize 710 
/    mxyang     03/22/04 - Add preprocessor error messages
/    mkandarp   10/03/03 - [3132506] Add new message that table function is 
/                          in inconsistent state
/    sagrawal   08/19/03 - move warning messages to plwus.msg file
/    sagrawal   06/26/03 - return missing from function warning
/    gviswana   05/05/03 - Add error message for dependent change
/    ciyer      08/11/03 - mark messages not needing translation
/    jmuller    06/09/03 - Fix bug 2355548: throw warning on decl of identifier
/                          also in STANDARD 
/    sagrawal   04/11/03 - add new conversion warning
/    dbronnik   05/09/03 - Unreachable code warnings
/    mvemulap   02/05/03 - remove 921 and 922
/    sagrawal   03/13/03 - add warning for duplicate parameter
/    jmuller    01/15/03 - Fix bug 2717037: expressions not allowed as 
/                          PARTITION BY columns
/    ciyer      03/10/03 - add performance warning for omitted NOCOPY
/    jmuller    01/15/03 - Fix bug 2717037: expressions not allowed as
/                          PARTITION BY columns
/    sagrawal   12/16/02 - bug 2708835
/    sylin      01/13/03 - 2711796: Remove error message 723 and 724
/    jmuller    11/22/02 - Fix bug 2658638: disallow user-defined operators
/    jmuller    12/02/02 - Fix bug 2651030: add warning for multiple decls
/    sursrini   12/13/02 - 2642203: Added 737
/    sagrawal   12/02/02 - clneanup
/    rdecker    11/13/02 - modify vararg semantic error messages
/    jmuller    11/13/02 - Fix bug 2654905: warning on NOCOPY mismatch
/    sagrawal   11/20/02 - Add comments.
/    sagrawal   11/12/02 - Warning when conversion is away from column type
/    sagrawal   10/09/02 - PL/SQL warning code clean up
/    cbarclay   09/17/02 - alternative quote delimiter
/    rdecker    10/01/02 - vararg enhancements
/    sagrawal   08/30/02 - semantic checks for sparse collection
/    cbarclay   07/15/02 - add alter collection messages
/    prakumar   06/18/02 - Add 172 err msg.
/    jmuller    05/30/02 - Update 665 err msg w/ feedback from errors_us
/    prakumar   05/08/02 - Bug 2216447 : Modified 630
/    jmuller    05/10/02 - Fix bug 2313241: flag streaming clause w/o partition
/                          clause 
/    astocks    03/04/02 - Native - unable to open C file
/    sagrawal   03/04/02 - Add warning messages for test warning framework
/    sagrawal   12/13/01 - fixing and adding message for table functions
/    cbarclay   12/12/01 - add 1912/3 : runtime type mismatch
/    cbarclay   12/12/01 - add 663 : NEW must be followed by constructor
/                          method call
/    mvemulap   11/27/01 - enhance 923
/    sursrini   10/09/01 - 2009071: Modified 662.
/    sursrini   10/08/01 - 2009071: Added 662 error message.
/    ciyer      08/16/01 - user defined constructor support
/    cbarclay   09/12/01 - treat
/    dbronnik   08/02/01 - add value_error sub codes for associative arrays
/    dbronnik   08/01/01 - PLS-315: associative arrays allow more index types
/    gviswana   06/28/01 - Remove PLS-451
/    gviswana   07/03/01 - 1853735: Add error msg for invalid EXTRACT field
/    sagrawal   06/29/01 - bug 1851302
/    mvemulap   03/08/01 - change 923
/    ciyer      03/07/01 - add sub error for bad narrowing
/    sagrawal   02/25/01 - add 650, 651 and 652
/    cbarclay   02/05/01 - add 649
/    mvemulap   01/30/01 - error message for ncomp not supported
/    mvemulap   01/04/01 - spec and body should both be compiled to same target
/    sagrawal   02/02/01 - error message for table functions 
/    rdani      12/04/00 - Fix 1498432 Add 647
/    ciyer      10/23/00 - error if MAP/ORDER not defined at root type
/    mmorsi     10/16/00 - Add 607, 608, and 609 for sqlj types.
/    rdani      10/09/00 - Fix 1367020 Issue error if super-sub authid differ
/    rdani      10/03/00 - Fix 716
/    rdani      08/14/00 - Bug fix 1371683
/    cbarclay   08/10/00 - add under priv check error
/    mxyang     08/15/00 - Add 644, 645
/    gviswana   08/14/00 - Common FE: New error msgs.
/    mmorsi     07/19/00 - SQLJ Type messages
/    mvemulap   07/19/00 - native compiler messages
/    rdani      07/17/00 - Add space after %s in 951
/    asethi     06/30/00 - Dedicated and transactional agent/extproc
/    asethi     06/28/00 - Disallow invoking pipelined functions from PL/SQL
/    rdani      06/27/00 - Review for 720
/    rdani      06/22/00 - Add type evolved error mesg ALTER TYPE 8.2.0
/    wxli       06/10/00 - Error Message for NCHAR with byte length
/    cbarclay   06/06/00 - add overriding and vtable messages
/    asethi     06/06/00 - More parallel/pipelined error messages
/    rdani      06/02/00  - Modify attribute. Errors ,etc.
/    ciyer      05/12/00 - more inheritance errors
/    mxyang     05/30/00  - fix error msgs for CASE stmt/expr
/    asethi     06/01/00 - Parallel and pipelined table function support
/    gviswana   04/10/00  - Add error msgs for range constraints
/    ciyer      05/01/00 - cleanup inheritance error messages
/    gviswana   04/03/00 - Common SQL front-end support
/    mxyang     04/28/00  - support PL/SQL NULLIF and COALESCE expressions
/    sagrawal   04/05/00 - spell fix msg 614
/    sokrishn   02/13/00 -  inheritance related error messages
/    mxyang     03/08/00  - support PL/SQL CASE stmt/expr
/    sagrawal   11/09/99 -  INSERT/UPDATE using records
/    mxyang     01/07/00  - enable client side lob locator rpc
/    nle        11/09/99  - dynamic bulk sql support
/    cbarclay   10/06/99  - interval literals
/    gviswana   09/01/99  - Add error message for bad datetime literal format  
/    rdani      08/31/99 -  TRIM/CAST capture.Fix 967837.
/    dalpern    08/11/99 -  trap cases phdred didn't resolve
/    pbejjala   07/21/99 -  887665: Error 605 for Q_BINARY in CAST stmt
/    ciyer      08/02/99 -  bug 881365: error on incorrect use of CUBE/ROLLUP
/    wawu       06/29/99 -  Add limit clause to bulk fetch
/    mxyang     07/21/99 -  add NLS DNT tag for 800, make 998, 999 visible
/                           to user (was INTERNAL USE ONLY), remove 501, 502
/    dbronnik   07/06/99 -
/    dbronnik   06/30/99 -  bug 902001: add message 436, 437
/    wawu       07/13/99 -  Update error message 307
/    nle        06/29/99  - dynamic returning clause                           
/    wawu       05/27/99 -  bug 883694
/    nle        05/27/99 -  bug 881494
/    ciyer      06/11/99  - bug 881430: support subpartition extended table nam
/    nle        05/26/99  - bug 881499                                         
/    wawu       05/18/99 -  bug 868717:bulk binds not supported in client-side
/    mxyang     05/24/99 -  bug 881427: add support for sample clause
/    cbarclay   04/21/99 -  add datetime constraint message
/    mxyang     03/18/99 -  bug 812223
/    pbejjala   02/23/99 -  bug.748806: PLS-429 CAUSE change
/    pbejjala   03/02/99 -
/    wawu       01/28/99 -  Add a new error msg for weak ref cursor with 
/                            bulk binds. 
/    sagrawal   11/03/98 -  change error 593
/    sagrawal   07/07/98 -  add error 593: default parameter compare
/    sagrawal   10/15/98 -  TABLE operator in SELECT
/    mvemulap   10/12/98 -  merge 571574 and 638951
/    nle        10/05/98  - Bug 626923: modify message 493
/    gviswana   10/02/98 -  713674: Better 305 error message                   
/    gviswana   08/10/98 -  Fix up invoker-rights messages                     
/    sagrawal   08/13/98 -  Self as OUT param
/    rdecker    08/17/98 -  add 6502 sub messages
/    cwethere   07/22/98 -  CALL statement error.
/    nle        07/20/98 -  add message for deterministic and paralellable
/    sagrawal   05/22/98 -  bug 490618
/    plsint     06/01/98 -
/    cbarclay   05/29/98 -  add 434 datetime record field error
/    sagrawal   05/29/98 -  Messages for cursor subquery and table of non
/                           Object types.
/    dalpern    05/21/98 -  fix various calling-to-java issues
/    dalpern    05/20/98 -  opaque types and static methods
/    sagrawal   05/18/98 -  bug 671858
/    nle        05/13/98 -  REPEATABLE support
/    nle        05/08/98 -  spell out 'purity' for package name
/    nle        05/04/98 -  change atx syntax
/    rhari      04/27/98  - Add message 258, 259 for ILMS
/    dbronnik   04/27/98 -  Add 589
/    nle        04/27/98 -  add message # 751
/    nle        04/16/98 -  Add 163
/    bburshte   04/13/98 -  fix operators
/    asethi     04/08/98 -  Bulk binds project; added new error messages
/    dalpern    04/06/98 -  opaque object ddl and static methods
/    edarnell   03/02/98 -  Add 571, no constrained anchored types
/    bburshte   03/30/98 -  create operator spec
/    plsint     03/31/98 - fix bad merge
/    nle        03/30/98 -  add error messages for autonomous transaction
/    gviswana   03/10/98 -  INVOKER -> CURRENT_USER
/    sagrawal   03/25/98 -  Error if calling remote method from client
/    rhari      03/23/98 -  Add message 257
/    mvemulap   03/19/98 -  add PH1 error message 161
/    asethi     03/13/98 -  Bug 569586; error msg for incorrect cast/multiset
/    smkrishn   02/13/98 -  Add error msgs for overflow/underflow
/    rhari      02/19/98 -  New messages for ILMS CALL-Specification
/    gviswana   01/18/98 -  Invoker's Rights syntax
/    dalpern    01/13/98 -  inheritance, part 1
/    nle        01/13/98 -  dynamic sql error messages 254, 455, 456, 457
/    sagrawal   01/09/98 -  Removed merged conflicts
/    mvemulap   12/11/97 -  add mesg for 253: no matching parameter for a forma
/    sagrawal   11/05/97 -  New message for invalid argument to table expressio
/    gviswana   09/23/97 -  436158: Fixup 907 message
/    gviswana   09/05/97 -  436158: Update 907
/    gviswana   08/13/97 -  439012: Change 361, disable 426 & 365
/                           Add 567
/    cbarclay   08/05/97 -  add message for returning into
/    edarnell   07/17/97 -  add 566, no constrained lob types
/    edarnell   05/15/97 -  add no RPC on top-level type message
/    rhari      06/04/97 -  #497088, more comments for msg 250
/    dalpern    04/24/97 -  further note on pls-252
/    dalpern    04/22/97 -  tweak wording on pls-252 commentary
/    lgammo     04/22/97 -  Add pls709
/    usundara   04/19/97 -  fix comments for 225; update 327, 389, 417;
/                           add 332, 333, 334, 336, 337, 338, 339.
/    cbarclay   04/18/97 - add message for returning into -- like ora-28815
/    dalpern    04/16/97 - PLS-252
/    plsint     04/03/97 -
/    cbarclay   02/28/97 -  new message for remote object types
/    rhari      02/21/97 -  More comments for error 250
/    usundara   01/03/97 -  bug 421338: fix 329;
/                           bug 383454: add 331
/    dalpern    01/02/97 -  nchar: CSCONVERT() is now called TRANSLATE(USING)
/    usundara   12/31/96 -  incomplete and mutually-dependent types:
/                             add 565; fix 206, 532; split 311 into 311,317,318
/    dalpern    12/04/96 -  msg 561 tweaked for more general use
/    zwalcott   11/26/96 -  more error messages: 156, and 542.
/    jnewman    11/26/96 -  editing Cause and Action statements
/    zwalcott   11/24/96 -  message 540
/    dalpern    11/22/96 -  msg 542
/    cbarclay   11/21/96 -  add pragma message and lob rpc message
/    zwalcott   11/21/96 -  new messages 540, 541
/    dnizhego   11/08/96 -  add error for CAST
/    plsint     11/07/96 -  ADT => object type; rvasired
/    dalpern    11/06/96 -  nchar: bind var, empty_clob(), chr()/translate()
/    zwalcott   11/06/96 -  bug 403052 - error message for no ref SELF paramete
/    cbarclay   10/31/96 -  ADT spec and body must match
/    dalpern    11/01/96 -  q_bad_type, ref cursor in records v7->v8
/    edarnell   10/31/96 -  Add Varray(0) illegal message
/    zwalcott   10/30/96 -  msg  536
/    dalpern    09/18/96 -  diana v7<->v8 compatibility
/    cbarclay   10/18/96 -  merge 135 change
/    jmuller    09/09/96 -  Update
/    jmuller    07/18/96 -  Fix bug 358219: a better error message?
/    cbarclay   09/04/96 -  fix pragma interface messages
/    usundara   10/03/96 -  incomplete types and mutually-referring types
/                           [add message 329]
/    rhari      09/27/96 -  NCHAR support in external procedures
/    zwalcott   09/24/96 -  message 562.
/    cbarclay   09/17/96 -  error 410 modification
/    dalpern    09/05/96 -  nchar expression typechecking
/    zwalcott   08/29/96 -  update message 534, and 535.
/    zwalcott   08/15/96 -  update message 534, 535.
/    dalpern    07/12/96 -  nchar
/    zwalcott   08/12/96 -  error mesgs for (nested) collection types.
/    rhari      08/11/96 -  Fix messages 236, 240
/    zwalcott   08/07/96 -  update mesg 531 to include table types.
/    rhari      07/25/96 -  Add messge 249
/    rhari      07/30/96 -  Callout Composite Datatype Support
/    zwalcott   07/13/96 -  error message 530: illegal attribute type name in a
/    zwalcott   06/14/96 -  pragma_rr in adts - map/order methods must have pra
/    zwalcott   06/02/96 -  map/order methods.
/    rhari      06/01/96 -  Message 248
/    dnizhego   05/31/96 -  update insert error msgs
/    jmuller    04/24/96 -  Fix bug 348638: Add 'unable to find library unit' m
/    rhari      05/20/96 -  Library extensions
/    zwalcott   05/23/96 -  map/order methods.
/    zwalcott   05/08/96 -  signed/unsigned binary integer.
/    rhari      05/13/96 -  Backout insert statement changes
/    dnizhego   04/16/96 -  V8.0 features for INSERT statemet: ADTs, REF INTO
/    edarnell   04/04/96 - Add codes for ph2 "bulk" coercion errors
/    rhari      04/02/96 - Bug fixes
/    rhari      02/29/96 - add errors 244, 245
/    edarnell   02/27/96 - Add error message for bad fclose in psxini.c
/    jmuller    02/02/96 -
/    jmuller    01/27/96 -  Add 492
/    rhari      01/12/96 -  Merge new FCD stuff for callouts(dunietis, rhari)
/    dunietis   12/01/95 -  foreign function support
/    zwalcott   01/09/96 -  Merge 73/4. Add message 512. references remote pack
/    cbarclay   12/11/95 -  merge 73/2
/    cbarclay   11/13/95 -  change 425 text
/    usundara   07/28/95 -  support pragma INTERFACE - magic number
/    cbarclay   04/28/95 -  Add to 426
/    usundara   03/28/95 -  PDP-NDE
/    usundara   03/28/95 -  bug 184182 - pragma INTERFACE - merge 1.57.720.11
/    cbarclay   03/14/95 -  err 426
/    usundara   03/09/95 -  PDP-NDE
/    usundara   03/09/95 -  bugfix 268464,264919: pragmas - add err 133
/    usundara   03/06/95 -  bugfix 268464 - pragmas
/    gclossma   03/06/95 - lost errmsg 327
/    gclossma   03/02/95 -
/    usundara   02/17/95 -  PDP-NDE 
/    cbarclay   02/17/95 -  adding 327 for bug200230 -- merge branch 1.57.720.8
/    usundara   02/17/95 -  bugfix 261448 - merge forward from rev 1.57.720.9
/    usundara   02/08/95 -  bug 261430 - add error 362 + fix error 310 msg
/                           merge from rev 1.57.720.7
/    cbarclay   01/27/95 -  merge 424 change foward
/    usundara   01/18/95 -  bugfix 255455 - merge forward from rev 1.57.720.6
/    usundara   01/17/95 -  bug 230507 - err 201 text - merge rev 1.57.720.5
/    gclossma   12/31/94 -  merge changes from branch 1.57.720.4
/    usundara   12/01/94 -  bug 237743 - modify error 403 (merge 1.57.720.2)
/    gclossma   09/02/94 -  merge changes from branch 1.51.710.5
/    usundara   08/09/94 -  merge from rev 1.51.710.4 (for gclossma & cbarclay)
/    cbarclay   07/28/94 -  add implementation restrictions - index tables of c
/    cbarclay   06/29/94 -  new messages for ref cursor
/    usundara   06/09/94 -  merge 1.51.710.2 (Boris's new err 906)
/                           merge 1.51.710.3 (my change to err 700)
/    cbarclay   03/30/94 -  merge changes from branch 1.51.710.1
/    usundara   10/22/93 -  bug 184814; add error #510: float cannot have scale
/    usundara   06/14/93 -  error#706;bug#150061; excp-name not valid as prefix
/    usundara   06/09/93 -  modify error# 330 to include subtype name
/    bburshte   06/03/93 -  bug 143509
/    cbarclay   05/20/93 -  add error 428 
/    cbarclay   04/01/93 -  add 452 
/    kjensen    03/18/93 -  add local table SQL restrictions message - 950
/    gclossma   02/22/93 -  bug 151719: add err msg 424 
/    pclare     12/11/92 -  Fix 76085 - select union select order by decode 
/    bburshte   12/10/92 - #(n142769) invalid use of remote table 
/    cbarclay   12/05/92 -  fix 323 
/    pclare     12/04/92 -  Fix 141625: identifier too long. 
/    gclossma   11/29/92 -  msg for unknown bindtype 
/    cbarclay   11/18/92 -  add 509 
/    bburshte   11/17/92 -  new ph1 error mess 
/    gclossma   11/16/92 -  disallow remote refs to routines in STANDARD 
/    gclossma   11/15/92 -  disallow ref to remote cursor attribute 
/    gclossma   11/12/92 -  BugNo:126863 
/    bburshte   11/10/92 -  bug 134197 - treat same names of pkg and tbl gracef
/    bburshte   11/10/92 -  Prevent ...INTO typename... 
/    gclossma   10/30/92 -  bug 136182 
/    cbarclay   10/28/92 -  fix merge 
/    cbarclay   10/26/92 -  Add 508 
/    gclossma   10/26/92 -  add 'illegal statement' 
/    cbarclay   09/09/92 -  change 505 message and 372, and add 507/6
/    cbarclay   09/02/92 -  adding 505 
/    dmorein    08/05/92 -  adding error 233
/    dmorein    08/03/92 -  adding error 232 
/    gclossma   08/02/92 -  504: can't mention Q_* types outside of STANDARD 
/    gclossma   07/30/92 -  add 503: require RETURN stmt in functions 
/    dmorein    07/17/92 -  adding error #124 
/    cbarclay   07/16/92 -  add 416 
/    dmorein    07/04/92 -  adding error msg for attempt to take type of except
/    cbarclay   06/15/92 -  adding 1713/4 
/    cbarclay   06/09/92 -  change 204,add 231 
/    gclossma   06/08/92 -  disallow default exprsns on OUT parms 
/    cbarclay   05/19/92 -  adding error 328 
/    cbarclay   04/23/92 -  changing 203 message 
/    mbparker   04/10/92 -  make attribute expressions within SQL signal an err
/    llao       02/27/92 -  disable remote types 
/    kjensen    01/27/92 -  add errors for FROM list lookup 
/    kjensen    01/06/92 -  change 364 text 
/    kjensen    12/19/91 -  remove 903 - no longer used 
/    cbarclay   12/16/91 -  changing message 213 
/    kjensen    11/22/91 -  add error message for reading OUT parameters 
/    pdufour    11/19/91 -  Add more 
/    cbarclay   11/15/91 -  changing text for 357 
/    pdufour    11/12/91 -  some FIPS flags too long 
/    cbarclay   11/05/91 -  changing flag 1408 message 
/    scheng     10/31/91 -  Creation 
/  scheng     09/19/91 -  remover scmmtb.h and convert to lmsgen 
/  cbarclay   09/05/91 -  fixing error messages 309/310 for bug 77350 
/  cbarclay   07/03/91 -         changing message for 215 
/  pdufour    05/14/91 -         more 
/  jmuller    03/26/91 -         Add no priv err 
/  Muller     03/15/91 - Linting
/  Jensen     03/04/91 - add na018 error message, array error messages
/  Muller     02/25/91 - Linting
/  Barclay    01/15/91 - changing FIPS message format
/  Dufour     01/04/91 - more
/  Clare      01/02/91 - subprogram 'in' formal not yet denotable
/  Barclay    12/19/90 - adding new flag for indicator variables
/  Barclay    12/13/90 - Removing obselete flags
/  Barclay    11/21/90 - adding new fips flags for DDL
/  Barclay    11/15/90 - Adding new err (1469) that flags records
/  Barclay    11/12/90 - Commenting out obselete err 1469
/  Hughes     10/21/90 - v6 changes - error 123
/  Hughes     09/17/90 - merge v6 changes
/  Dufour     09/12/90 - Fussing with messages
/  Olkin      08/23/90 - add new errors for set functions
/  Lao        08/22/90 - more English
/  Dufour     07/13/90 - Add English part of FIPS flags
/  Bhargav    07/06/90 - Named parameter support
/  Jensen     05/24/90 - v6 - new err 414
/  Jensen     05/16/90 - 305 error v6
/  Lao        04/27/90 - FIXUP
/  Weisser    04/23/90 - add error 110
/  Clossma    04/04/90 - remove err msgs 414
/  Weisser    03/20/90 - add error 488
/  Weisser    03/14/90 - add errors 486 and 487
/  Clossma    03/13/90 - err msg #414
/  Clossma    03/05/90 - fix err msg 321: replace 'right' by 'left'
/  Weisser    02/28/90 - change message text for 387
/  Weisser    01/24/90 - raise error if CURRENT OF <not-cursor-name>
/  Dufour     01/15/90 - remove nested comment
/  Lao        12/18/89 - fips flagger
/  Lao        11/08/89 - fips flagger
/  Weisser    11/08/89 - add error 351
/  Lao        10/20/89 - fips flagger
/  Lao        10/13/89 - more fips flagger
/  Lao        10/02/89 - fips flagger (Sect. 5.4)
/  Lao        09/27/89 - more fips
/  Dufour     09/25/89 - more
/  Dufour     09/19/89 - more
/  Jensen     09/19/89 - add OUT BIND error(s)
/  Dufour     09/13/89 - more
/  Dufour     09/13/89 - more
/  Dufour     08/29/89 - change 356's message
/  Dufour     07/25/89 - more
/  Dufour     07/20/89 - more
/  Jensen     07/18/89 - add into clause must be non-db object msg
/  Jensen     06/08/89 - add out of memory error message
/  Jensen     04/28/89 - add READ-ONLY bind variable assignment error
/  Hughes     04/20/89 - add doc for FIPS flag 1407
/  Jensen     04/14/89 - add PRIVATE TYPE message
/  Clossma    04/13/89 - add 'bad column type' message for sqlforms
/  Jensen     04/13/89 - freeze
/  Clossma    04/05/89 - ph2ips ph2lagger
/  Hughes     04/03/89 - fips flag 1406
/  Hughes     03/29/89 - more fips flags
/  Hughes     03/28/89 - fix compile error - nested comment
/  Hughes     03/28/89 - new fips flags for section 5
/  Hughes     03/28/89 - KR suggests change to error message #374
/  Clossma    03/27/89 - FIPSification
/  Clossma    03/25/89 - wording mod for portfolio on #376
/  Hughes     03/21/89 - add error # 376
/  Dufour     03/21/89 - Updating format for message 1400
/  Dufour     03/10/89 - Adding the first FIPS flag!
/  Dufour     03/02/89 - more
/  Clossma    03/01/89 - msg for PRAGMA(...proc...) for nonexistent proc
/  Jensen     02/17/89 - change error 341 message
/  Jensen     02/01/89 - add e.* error
/  Jensen     01/24/89 - packages used as variables - semantic error
/  Dufour     01/24/89 - more
/  Dufour     01/20/89 - more
/  Jensen     01/19/89 - label error messages
/  Clossma    11/17/88 - Propagate Pgas Thru Arg PGAP
/  Jensen     11/04/88 - add error message for attribute on RHS of assignment
/  Dufour     10/28/88 - Change string of number 377.
/  Portfol    10/19/88 - edit of message texts finished
/  Clossma    10/18/88 - let mktg merge CAUSE and ACTION changes
/  Jensen     10/12/88 - add error for bad %type application
/  Clossma    10/07/88 - mktg changes to err msgs
/  Dufour     09/02/88 - more
/  Dufour     08/31/88 - more
/  Clossma    08/24/88 - merge mktgs mods to msgs
/  Dufour     08/23/88 - more
/  Jensen     08/22/88 - more
/  Clossma    08/12/88 - change occurrences of %d to %s in format strings
/  Clossma    08/04/88 - tweaks
/  Dufour     07/22/88 - more.
/  Clossma    07/21/88 - exception_init and exception-handler msgs
/  Dufour     07/19/88 - more.
/  Clossma    07/12/88 - fix arg to errmsg #701
/  Clossma    07/08/88 - fill-in remaining CAUSEs
/  Dufour     07/07/88 - more
/  Hughes     07/07/88 - remove error msgs from ph2onc() - obsolete
/  Clossma    07/07/88 - fix err msg 324
/  Clossma    07/06/88 - whaddayathink
/  Hughes     07/06/88 - fix error messages
/  Dufour     07/04/88 - more
/  Dufour     07/04/88 - more
/  Dufour     07/01/88 - more
/  Jensen     07/01/88 - more
/  Clossma    06/30/88 - check over error messages for ph2nre.c
/  Jensen     06/30/88 - more
/  Clossma    06/30/88 - checking over ph2ima error messages
/  Clossma    06/29/88 - merge changes from KRUDIN's proofreading
/  Clossma    06/24/88 - freeze til errmsg rewrites are complete
/  Dufour     05/26/88 - SQL type checking.
/  Dufour     05/17/88 - new prunes.
/  Jensen     05/12/88 - more
/  Dufour     05/10/88 - new messages.
/  Jensen     05/09/88 - change prune message
/  Jensen     05/06/88 - more
/  Dufour     05/02/88 - Adding prunes.
/  Jensen     04/20/88 - check for NOT NULL initialization
/  Dufour     04/18/88 - Adding error for converting bad num to int
/  Clossma    04/13/88 - add BLOCKS TOO DEEPLY NESTED for RELSBLK instructn
/  Clossma    04/12/88 - error messages for case stmt
/  Clossma    04/06/88 - add msg for too-big integer literal
/  Dufour     03/30/88 - More stuff...
/  Dufour     03/25/88 - fixing string associated with error 363.
/  Dufour     03/25/88 - Adding new PH1 error.
/  Jensen     03/23/88 - error on current-of if no for-update clause
/  Jensen     03/15/88 - more
/  Clossma    03/10/88 - add unconstrained char var err
/  Clossma    03/07/88 - add bad-goto message
/  Clossma    03/04/88 - add message for exit from non-containing loop
/  Dufour     03/04/88 - Adding error 323
/  Clossma    03/03/88 - add errmsg for EXIT <label> of non-loop <label>
/  Dufour     02/23/88 - Changing meaning of PH2 error 363 (again!).
/  Dufour     02/19/88 - Adding new error for constant decls without init
/		         value.
/  Dufour     02/18/88 - Changing meaning of PH2 error 363 
/  Jensen     01/21/88 - CONST_PTR_DATA
/  Jensen     01/12/88 - more
/  Jensen     01/06/88 - change extern name mtbtab
/  Jensen     12/08/87 - more
/  Jensen     12/01/87 - more
/  Jensen     11/04/87 - more
/  Jensen     11/03/87 - no alias in select expression error message
/  Jensen     10/16/87 - add reduced syntax error
/  Jensen     10/14/87 - add unhandled exception erro
/  Jensen     09/22/87 - more
/  Jensen     08/24/87 - more
/  Jensen     08/14/87 - add invalid exception number
/  Jensen     08/13/87 - more
/  Jensen     08/11/87 - more
/  Jensen     08/10/87 - add errors
/  Jensen     08/03/87 - more
/  Jensen     07/19/87 - overloading msgs
/  Jensen     07/14/87 - more
/  Jensen     06/30/87 - more
/  Jensen     06/23/87 - more
/  Jensen     06/23/87 - more
/  Jensen     06/23/87 - add 
/  Jensen     04/20/87 - CREATION
/
/
/ List of PL/SQL errors
/
/ This file is converted to header/message files using lmsgen.c.
/
/ The first col is the PL/SQL error number.
/ The second column is reserved and must (for now) be x00000
/ The remainder of the line is the error text
/
/ Adding an error for V7:
/    Check out this file, add the error, and check it back in.	Error numbers
/    should always be ordered.	The second column should always be x00000.
/
/
/ 1-50 are being used in PLS standalone environment
/
/
/ =G=> Messages 1-50 were copied from PCC.  If they are to be changed, 
/	they should be changed in pcc files and propagated to pl/sql.
/	I suppose that means we should leave error numbers 1-50 as are, too.
/
1, 0, "%s"
// MANUAL: <error-message>.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
22, 0,"out of memory"
// MANUAL: out of memory.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
27, 0, "redeclared SQL Identifier '%s' at line %u in file %s"
// MANUAL: redeclared SQL Identifier '<MI>identifier<D>' at line <MI>num<D> in file <filename>.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
28, 0, "option '%s' not legal as EXEC ORACLE OPTION"
// MANUAL: option '<MI>option<D>' not legal as EXEC ORACLE OPTION.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
29, 0, "ambiguous option '%s'"
// MANUAL: ambiguous option '%s'.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
30, 0, "invalid label range specified"
// MANUAL: invalid label range specified.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
31, 0, "invalid operand '%s' for option '%s'"
// MANUAL: invalid operand '%s' for option '%s'.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
32, 0, "invalid option '%s'"
// MANUAL: invalid option '%s'.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
33, 0, "missing operand for option '%s'"
// MANUAL: missing operand for option '%s'.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
35, 0, "no host language specified"
// MANUAL: no host language specified.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
36, 0, "no input file name specified"
// MANUAL: no input file name specified.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
37, 0, "?? unable to log on to ORACLE with '%s'"
// MANUAL: ?? unable to log on to ORACLE with '%s'.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
38, 0, "?? unable to open a cursor"
// MANUAL: ?? unable to open a cursor.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
39, 0, "unable to open input file '%s'"
// MANUAL: unable to open input file '%s'.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
40, 0, "unable to open listing file '%s'"
// MANUAL: unable to open listing file '%s'.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
41, 0, "unable to open output file '%s'"
// MANUAL: unable to open output file '%s'.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
//
42, 0, "unable to close output file '%s'"
// MANUAL: unable to close output file '%s'.
// INDEX: 
// RELEASE: 
// CAUSE: 
// ACTION:
//
//
49, 0, "bad bind variable '%s'"
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: The client (caller) of PL/SQL has parsed a bind variable that it
//        has informed to be 'bad'.
// ACTION:
//
/
/
/ PHASE 1 ERRORS 
/
101, 0, "reserved for future use"
// MANUAL: reserved for future use
// INDEX: 
// RELEASE: 
// CAUSE: This error message is not used yet. (Heh, heh, that's a joke, son.)
// ACTION:
//
102, 0, "parser stack overflow because nesting is too deep"
// MANUAL: parser stack overflow because nesting is too deep
// INDEX:	
// RELEASE: 
// CAUSE: The parser, which checks the syntax of PL/SQL statements, 
//  uses a data structure called a stack; the number of levels of nesting 
//  in the PL/SQL block exceeded the stack capacity.
// ACTION: Reorganize the block structure to avoid nesting at too deep 
//  a level. For example, move the lowest-level sub-block to a higher level.
//
103, 0, "%s"
// 103, 0, "found '%s' but expected one of the following: '%s'"},
// MANUAL: found '<MI>str<D>' but expected one of the following: '<MI>str<D>'
// INDEX:
// RELEASE: 
// CAUSE: 	This error message is from the parser. It found a token
//   (language element) that is inappropriate in this context.
// ACTION:  Check previous tokens as well as the one given in the 
//  error message. The line and column numbers given in the error 
//  message refer to the end of the faulty language construct.
//
104, 0, "empty argument list in call of procedure '%s' must be omitted"
// MANUAL: empty argument list in call of procedure '<MI>name<D>' must be omitted
// INDEX:     
// RELEASE: 
// CAUSE: In a subprogram call, the name of the subprogram was followed 
//  by an empty parameter list. For example, procedure P was called as 
//  P(). This is not allowed.
// ACTION:	Remove the empty parameter list. In the example, 
//  change the procedure call to P.
//
105, 0, "at most one forward declaration of type '%s' is permitted"
// MANUAL: at most one forward declaration of type '<MI>name<D>' is permitted
// INDEX:	"forward declaration"
// RELEASE: Not release 1.0 (no user-defined types yet)
// CAUSE: More than one forward declaration of a type is redundant.
// ACTION: Remove all but one forward declaration.
//
106, 0, "double quote disallowed in a quoted identifier"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:
// ACTION: Do not use double quote within a quoted identifier.
//
108, 0, "declarative units must be a single variable declaration"
// MANUAL:
// INDEX: "compilation-unit"
// RELEASE:
// CAUSE: While checking a declarative unit (a top-level declare block 
//  without the BEGIN...END), PL/SQL found that there was more than one 
//  item declared or that the item was not a variable declaration. A 
//  table is a common variable declaration at the unit level. To define 
//  a TABLE, compile a DECLARE compilation unit, but only one at a time 
//  is allowed.
// ACTION: Declare variables in separate declarative units.
//
109, 0, "unknown exception name '%s' in PRAGMA EXCEPTION_INIT"
// MANUAL: unknown exception-name '<MI>name<D>' in PRAGMA EXCEPTION_INIT
// INDEX:	"pragma"
// RELEASE: 
// CAUSE: No declaration for the exception name referenced in an
//   EXCEPTION_INIT pragma was found within the scope of the pragma.
// ACTION: Make sure the pragma follows the exception declaration and 
//  is within the same scope.
//
110, 0, "bind variable '%s' not allowed in this context"
// MANUAL: bind variable '<MI>name<D>' not allowed in this context
// INDEX:  "bind"
// RELEASE:
// CAUSE: A bind variable, that is, an identifier prefixed with a colon, 
//  was found in an inappropriate context.
// ACTION: Remove the colon or replace the bind variable with 
//  the appropriate object.
//
111, 0, "end-of-file in comment"
// MANUAL: end-of-file in comment
// INDEX:	
// RELEASE: 
// CAUSE: A Comment had a comment initiator (/*), but before the 
//  Comment terminator (*/) was found, an end-of-file marker was encountered.
// ACTION: Remove the Comment initiator or add a comment terminator. 
//  The line and column numbers accompanying the error message refer to 
//  the beginning of the last legal token before the Comment initiator.
//
112, 0, "end-of-line in quoted identifier"
// MANUAL: end-of-line in quoted identifier
// INDEX:	
// RELEASE: 
// CAUSE: A quoted identifier had a beginning quote ("), but before the 
//  ending quote (") was found, an end-of-line marker was encountered.
// ACTION: Remove the beginning quote or add the ending quote. The line 
//  and column numbers accompanying the error message refer to the 
//  beginning of the quoted identifier.
//
113, 0, "END identifier '%s' must match '%s' at line %s, column %s"
// MANUAL: END identifier '<MI>name1<D>' must match '<MI>name2<D>' at line <MI>num<D>, column <MI>num<D>
// INDEX:
// RELEASE: 
// CAUSE: Following the keyword END, which terminates some language 
//  constructs (such as loops, blocks, functions, and procedures), you 
//  can optionally place the name of that construct. For example, at 
//  the end of the definition of loop L you might write END L. 
//    
//  This error occurs when the optional name does not match the name 
//  given to the language construct. It is usually caused by a 
//  misspelled identifier or by faulty block structure.
// ACTION:Make sure the spelling of the END identifier matches the 
//  name given to the language construct and that the block structure 
//  is correct.
//
114, 0, "identifier '%s' too long"
// MANUAL: identifier '<MI>name<D>' too long
// INDEX:
// RELEASE: 
// CAUSE: The name of a PL/SQL variable is longer than 30 characters. 
//  Legal identifiers (including quoted identifiers) have a maximum 
//  length of 30 characters. A string literal might have been mistakenly
//   enclosed in double quotes instead of single quotes, in which case 
//  PL/SQL considers it a quoted identifier.
// ACTION: Shorten the identifier. 
//
115, 0, "this PRAGMA must follow the declaration of '%s'"
// MANUAL: this PRAGMA must follow the declaration of '<MI>name<D>'
// INDEX: pragma
// RELEASE:
// CAUSE: The pragma refers to a PL/SQL object that was not declared 
//  or is not within the scope of the reference. Identifiers must 
//  be declared before they are used in a pragma; forward references 
//  are not allowed.
// ACTION: Check the spelling and declaration of the identifier. Also confirm that the declaration is placed correctly in the block structure.
//
116, 0, "Duplicate where-clause in table expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: Two or more WHERE clauses were found in a DELETE, SELECT, or
//  UPDATE statement. The WHERE clause specifies a condition under which
//   rows in a table are processed. The condition can contain several
//   logical expressions connected by AND or OR, but a statement can 
//  contain only one WHERE clause.
// ACTION: Remove one of the WHERE clauses and, if necessary, connect
//   logical expressions by AND or OR
//
117, 0, "Duplicate connect-by clause in table expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: Two or more CONNECT BY clauses were found in a SELECT statement. 
//  The CONNECT BY clause defines a relationship used to return rows in 
//  a hierarchical order. The relationship can contain two expressions
//   separated by a relational operator (such as = or !=), but a statement 
//  can contain only one CONNECT BY clause.
// ACTION: Remove one of the CONNECT BY clauses and, if necessary, 
//  separate expressions by a relational operator.
//
118, 0, "Duplicate group-by clause in table expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: Two or more GROUP BY clauses were found in a SELECT statement. 
//  The GROUP BY clause lists column expressions used to form a summary 
//  row for each group of selected rows. The list can contain several 
//  column expressions separated by commas, but a statement can contain 
//  only one GROUP BY clause.
// ACTION: Remove one of the GROUP BY clauses and, if necessary, 
// separate column expressions by commas.
//
119, 0, "Duplicate having-clause in table expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: Two or more HAVING clauses were found in a SELECT statement. 
//  The HAVING clause specifies a condition under which groups of rows 
//  (formed by the GROUP BY clause) are included in the result. The
//   condition can include several logical expressions connected by AND 
//  or OR, but a statement can contain only one HAVING clause.
// ACTION: Remove one of the HAVING clauses and, if necessary, connect 
//  logical expressions by AND or OR.
//
120, 0, "inappropriate argument in OPEN statement"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The cursor_name parameter in an OPEN statement is misspelled or 
//  does not refer to a legally declared cursor.
// ACTION: Check the spelling of the cursor_name parameter. Make sure 
//  the cursor was declared properly.
//
/
/
/ YOU'LL HAVE TO CHANGE THIS ERROR NUMBER IF YOU WANT TO UNCOMMENT IT.
/ ERROR NUMBER 120 IS BEING USED BY V6PLS (SEE ABOVE).
/
// 120,0,"'%s' is not a legal SQL set function"
// MANUAL: '<MI>name<D>' is not a legal SQL set function
// INDEX:
// RELEASE:
// CAUSE: A function was used in the select-list which is not a legal group
//        function.
// ACTION: Change function to one of the valid group functions.
//
// 121, 0, "only the set function COUNT may take * as an argument"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The asterisk (*) option was used in the argument list of a SQL 
//  group function other than COUNT. For example, the code might look like     
//  SELECT SUM(*) INTO emp_count FROM emp;  -- should be COUNT(*)     
//  Only COUNT permits the use of the asterisk option, which returns 
//  the number of rows in a table.
// ACTION: Remove the asterisk option from the argument list and replace 
//  it with an expression that refers to one or more database columns.
//
122, 0, "%s as separator is allowed only with specific built-in functions"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: A few built-in functions use keywords (instead of commas)
//        as argument separators:
//        Built-in function        Argument separators
//        ---------------------------------------------
//          CHR, TRANSLATE           USING
//          CAST                       AS
//          TRIM                  TRAILING, LEADING, BOTH, FROM
//        A function different from one of these built-in functions
//        is using a keyword as an argument separator.
// ACTION: Correct the argument list or change the function name.
//
123, 0, "program too large (%s)"
// MANUAL: program too large
// INDEX:
// RELEASE:
// CAUSE: PL/SQL was designed primarily for robust transaction processing. 
//  One consequence of the special-purpose design is that the PL/SQL
//   compiler imposes a limit on block size. The limit depends on the mix 
//  of statements in the PL/SQL block. Blocks that exceed the limit cause 
//  this error.
// ACTION: The best solution is to modularize the program by defining
//   subprograms, which can be stored in an Oracle database. Another
//   solution is to break the program into two sub-blocks. Have the 
//  first block INSERT any data the second block needs into a temporary
//   database table. Then, have the second block SELECT the data from 
//  the table.
//
124, 0, "name of exception expected for first arg in exception_init pragma"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  The first argument passed to the EXCEPTION_INIT pragma was
//   something other than an exception name. The first argument must be 
//  the name of a legally declared exception.
// ACTION: Replace the first argument with the name of a legally declared
//   exception.
125, 0, "type name expected"
// MANUAL: type name expected
// INDEX:
// RELEASE:
// CAUSE: When a constant or variable was declared, its datatype was not
//   specified. For example, the code might look like     
//  pi  CONSTANT := 3.14159;  -- should be CONSTANT REAL := 3.14159     
//  Every constant and variable must have a datatype, which specifies 
//  a storage format, constraints, and valid range of values.
// ACTION: Supply the type name
126, 0, "selector ALL is not allowed"
// MANUAL: selector ALL is not allowed
// INDEX:
// RELEASE:
// CAUSE: The ALL shortcut for specifying system privileges or statement
//   options was used in a SQL statement. PL/SQL does not support the ALL
//   shortcut.
// ACTION: Remove the ALL shortcut from the SQL statement.
127, 0, "Pragma %s is not a supported pragma"
// MANUAL: this PRAGMA is not supported
// INDEX: pragma
// RELEASE:
// CAUSE: The named pragma (compiler directive) is not among those 
//  supported by PL/SQL. The pragma name might be misspelled, or the 
//  pragma syntax might be faulty.
// ACTION: Check the spelling of the pragma name, and make sure the 
//  proper syntax was used.
128, 0, "Illegal number of arguments for pragma %s"
// MANUAL: this PRAGMA was passed an illegal number of arguments.
// INDEX: pragma
// RELEASE:
// CAUSE: The number of arguments (actual parameters) passed to the named
// pragma (compiler directive) is incorrect. A required argument was 
//  omitted from the argument list, or the pragma syntax is faulty 
//  (for example, a comma might be missing between two parameters).
// ACTION: Supply the missing argument, or correct the faulty syntax.
129, 0, "Pragma INTERFACE only supports C as its first argument"
// MANUAL: Pragma INTERFACE only supports C as its first argument.
// INDEX: pragma
// CAUSE: The first parameter passed to pragma INTERFACE specified a host
//  language other than C. Currently, C is the only host language 
//  supported. The parameter might be misspelled, or the pragma syntax 
//  might be faulty (for example, a comma might be missing between two
//   parameters).
// ACTION: Check the spelling of the first parameter, which should be C, 
//  and make sure the proper syntax was used.
130, 0, "Pragma %s expects 1st argument to be a procedure/function/package/cursor"
// MANUAL:
// INDEX: pragma
// CAUSE:The first argument (actual parameter) passed to the named pragma
//  (compiler directive) was not the name of a subprogram, package, or 
//  cursor, as required. The parameter might be misspelled, or the pragma
//  syntax might be faulty (for example, a comma might be missing between
//  two parameters).
// ACTION:Check the spelling of the first parameter, and make sure the
//  proper syntax was used.
131, 0, "Pragma %s expects 2nd argument to be a procedure/function"
// MANUAL:
// INDEX: pragma
// CAUSE:The second argument (actual parameter) passed to the named 
//  pragma (compiler directive) was not the name of a procedure or function, 
//  as required. The parameter cannot be a non-static method. The parameter
//  might be misspelled or the pragma syntax might be faulty (for example,
//  a comma might be missing between two parameters).
// ACTION:Check the spelling of the second parameter and make sure the 
//  proper syntax was used.
132, 0, "Pragma %s does not support %s"
// MANUAL:
// INDEX: pragma
// CAUSE: One of the parameters passed to this pragma was
//  not among the list of allowed values. The parameter
//  might be misspelled, or the pragma syntax might be faulty
//  (for example, a comma might be missing between two parameters).
// ACTION: Check the spelling of all the parameters and make sure 
//  the proper syntax was used.
133, 0, "Pragma %s expects 1st argument to be an identifier or string-literal"
// MANUAL:
// INDEX: pragma
// CAUSE: The first argument (actual parameter) passed to the named pragma
// (compiler directive) was not an identifier or string literal, as
// required. The parameter might be misspelled, or the pragma syntax might
//  be faulty (for example, a comma might be missing between two parameters).
// ACTION: Check the spelling of the first parameter, and make sure the 
//  proper syntax was used.
134, 0, "Pragma %s expects 2nd argument to be an identifier or string-literal"
// MANUAL:
// INDEX: pragma
// CAUSE: The second argument (actual parameter) passed to the named 
//  pragma (compiler directive) was not an identifier or string literal, 
//  as required. The parameter might be misspelled, or the pragma syntax 
//  might be faulty (for example, a comma might be missing between two 
//  parameters).
// ACTION: Check the spelling of the second parameter, and make sure 
//  the proper syntax was used.
135, 0, "Pragma %s expects 3rd argument to be an identifier, string or numeric literal"
// MANUAL:
// INDEX: pragma
// CAUSE: The third argument (actual parameter) passed to the named pragma
// (compiler directive) was not an identifier or string literal, as
//  required. The parameter might be misspelled, or the pragma syntax might 
// be faulty (for example, a comma might be missing between two parameters).
// ACTION: Check the spelling of the third parameter, and make sure the 
//  proper syntax was used.
/ comment out these
/  136, 0, "Pragma %s expects 3rd argument to be an empty-string"
// MANUAL:
// INDEX: pragma
// CAUSE: The third argument (actual parameter) passed to the named pragma
// (compiler directive) was not an empty string, as required. The parameter
//  might be miscoded, or the pragma syntax might be faulty (for example, 
//  a comma might be missing between two parameters).
// ACTION: Check the coding of the third parameter, and make sure the 
//  proper syntax was used.
/  137, 0, "Pragma %s expects 4th argument to be a numeric-literal"
// MANUAL:
// INDEX: pragma
// CAUSE: The fourth argument (actual parameter) passed to the named 
//  pragma (compiler directive) was not a numeric literal, as required. 
//  The parameter might be miscoded, or the pragma syntax might be faulty 
//  (for example, a comma might be missing between two parameters).
// ACTION: Check the coding of the fourth parameter, and make sure 
//  the proper syntax was used.
138, 0, "Precision for a binary type must be one of 8, 16, or 32"
// MANUAL:
// INDEX:
// CAUSE: Invalid precision was specified for a signed or unsigned binary
//  type.
// ACTION: Specify precision as one of 8, 16, or 32.
139, 0, "duplicate external NAME specification in subprogram expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two external NAME specifications.
// ACTION: Remove one of the external NAME specifications.
140, 0, "duplicate external LIBRARY specification in subprogram expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two external LIBRARY
//   specifications.
// ACTION: Remove one of the external LIBRARY specifications.
141, 0, "duplicate external PARAMETER STYLE specification in subprogram expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two external PARAMETER 
//  STYLE specifications.
// ACTION: Remove one of the external PARAMETER STYLE specifications.
142, 0, "duplicate external PARAMETER list specification in subprogram expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two external PARAMETER STYLE
//   specifications.
// ACTION: Remove one of the external PARAMETER STYLE
//   specifications.
143, 0, "duplicate external LANGUAGE specification in subprogram expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two external LANGUAGE
//   specifications.
// ACTION: Remove one of the external LANGUAGE
//   specifications.
144, 0, "duplicate external CALLING STANDARD specification in subprogram expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two external CALLING STANDARD
//  specifications.
// ACTION: Remove one of the external CALLING STANDARD
//  specifications.
/
145, 0, "duplicate external WITH CONTEXT specification in subprogram expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two external WITH CONTEXT
//   specifications.
// ACTION: Remove one of the external WITH CONTEXT
//   specifications.
146, 0, "duplicate external TRUSTED/UNTRUSTED specification in subprogram expression"
//
// CAUSE: The subprogram was found to have two external TRUSTED/UNTRUSTED 
//   specifications.
// ACTION: Remove one of the external external TRUSTED/UNTRUSTED 
//   specifications.
147, 0, "LIBRARY or ASSEMBLY file specification string is empty"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: A zero-length string was found for the LIBRARY or ASSEMBLY file specification.
// ACTION: Specify a non-zero length string for the LIBRARY or ASSEMBLY file
//  specification.
/
148, 0, "Only 1 pragma of this type is allowed per subprogram"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two PRAGMA RESTRICT_REFERENCES. 
// ACTION: Remove one of the PRAGMA RESTRICT_REFERENCES.
/
/ PHASE 2 ERRORS 
/
150, 0, "found: %s but expected : INTEGER"
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE: This error happens in the creation of a pl/sql external  type:
//         [SIGNED | UNSIGNED] BINARY INTEGER (<precision>). It may be 
//         referenced only in a create type statement. Such types are
//         non-queryable. 
// 
//         Something other than 'INTEGER' was supplied.
//
151, 0, "Expression or Variable is an illegal type to PLS/QL: %s"
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE: A type was used which does not belong PL/SQL. This type can only  
//        be referenced in CREATE TYPE statements, and is a non-queryable 
//        data type.
//       
152, 0, "POINTER type may only reference an object type."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE: A POINTER type which does not belong to PL/SQL can only refer to
//        an object type. This type can only be referenced in CREATE TYPE
//        statements, and is a non-queryable data type.
//       
153, 0, "A %s type may only be used as an object type attribute."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE: A POINTER or [SIGNED/UNSIGNED] BINARY INTEGER can only  be used 
//       as attributes of object types. These types can only be referenced
//       in CREATE TYPE statements, and are non-queryable data types. One 
//       of these external PL/SQL types outside of an object type.
154, 0, "An object type may have only 1 MAP or 1 ORDER method."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:  More than one map or order function was declared. An object
//         type can have only one map function or one order function, but
//         not both.
155, 0, "Only a function may be a MAP, ORDER or CONSTRUCTOR method."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:  A procedure was declared as a MAP, ORDER or CONSTRUCTOR method.
//         Only functions can be MAP, ORDER or CONSTRUCTOR methods.
156,0,"Null constraints not supported for object attributes."
// MANUAL:
// INDEX: "object type body", "object type specification"
// RELEASE: 8.0
// CAUSE:  A null constraint was specified for an attribute in an object.
//         This is not supported.
// ACTION: Remove the constraint.
//
157,0,"AUTHID only allowed on schema-level programs"
// MANUAL:
// INDEX: "AUTHID", "Invoker's Rights"
// RELEASE: 8.1
// CAUSE:  An AUTHID clause was specified for a subprogram inside a package
//         or type. These clauses are only supported for top-level stored
//         procedures, packages, and types.
// ACTION: Remove the clause
//
160,0,"AUTHID must specify CURRENT_USER or DEFINER"
// MANUAL:
// INDEX: "AUTHID", "Invoker's Rights"
// RELEASE: 8.1
// CAUSE:  The only two allowed options for AUTHID
//         are CURRENT_USER and DEFINER.
// ACTION: Fix the AUTHID clause to specify CURRENT_USER or DEFINER 
//
161, 0, "Pragma %s expects 3rd argument to be an identifier or a string literal"
// MANUAL:
// INDEX: pragma
// CAUSE: The third argument (actual parameter) passed to the named 
//  pragma (compiler directive) was not an identifier or a string literal 
//  when there is a fourth argument to the pragma. The parameter might be 
//  misspelled, or the pragma syntax might be faulty (for example, a comma might 
//  be missing between two parameters).
// ACTION: Check the spelling of the third parameter, and make sure 
//  the proper syntax was used.
162, 0, "Pragma %s expects 4th argument to be a positive integer literal"
// MANUAL:
// INDEX: pragma
// CAUSE: The fourth argument (actual parameter) passed to the named 
//  pragma (compiler directive) was not a numeric literal, 
//  as required. The parameter might be misspelled, or the pragma syntax 
//  might be faulty (for example, a comma might be missing between two 
//  parameters).
// ACTION: Check the spelling of the fourth parameter, and make sure 
//  the proper syntax was used.
164, 0, "cursor subqueries are not supported in this release"
// MANUAL:
// INDEX:
// CAUSE: This feature is not yet implemented.
//
165, 0, "call statement is not supported in PL/SQL"
// MANUAL:
// INDEX: "call statement"
// RELEASE: 8.1
// CAUSE: A CALL statement was found in PL/SQL source.
// ACTION:
//  Use an ordinary PL/SQL function or procedure call.
166, 0, "bad format for date, time, timestamp or interval literal"
// MANUAL:
// INDEX: "DATE", "TIME", "TIMESTAMP", "INTERVAL", "literal"
// RELEASE: 8.1
// CAUSE: The contents of the date, time, timestamp or interval literal did not
//        match the expected format.
// ACTION: Correct the format for the date, datetime, or interval literal.
167, 0, "keyword BULK is used in a wrong context"
// MANUAL:
// INDEX:
// RELEASE: 8.2
// CAUSE: keyword BULK is used illegally.  For example, BULK is used without
//        INTO clause
// ACTION: remove the keyword BULK.
168, 0, "duplicate modifier specification '%s'"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 8.2
// CAUSE: A method or object type modifier was specified more than once.
// ACTION: Remove all but one occurence of the  duplicate modifier.
169, 0, "modifier '%s' conflicts with prior '%s' specification"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 8.2
// CAUSE: The method or object type modifier specified conflicts with
// an earlier modifier. For example, a FINAL modifier cannot be combined
// with a NOT FINAL modifier.
// ACTION: Remove one of the conflicting modifiers.
//
170, 0, "the SQL statement in an OPEN statement or FOR loop must be a SELECT"
// MANUAL:
// INDEX: "SQL", "OPEN statement", "Cursor FOR loop"
// RELEASE: 8.2
// CAUSE: An OPEN cursor statement or cursor FOR loop can only invoke
//        a SELECT statement, not an UPDATE, INSERT or DELETE.
// ACTION: Use only SELECT statements in OPEN or cursor FOR loops
171, 0, "duplicate dedicated AGENT specification in subprogram expression"
// MANUAL: Duplicate dedicated AGENT specification in subprogram expression.
// INDEX: "External routines"
// RELEASE: 8.2
// CAUSE: The subprogram was found to have two dedicated AGENT
//   specifications.
// ACTION: Remove one of the dedicated AGENT specifications.
172, 0, "string literal too long"
// MANUAL: 
// INDEX: 
// RELEASE: 10i
// CAUSE: The string literal was longer than 32767 bytes.
// ACTION: Use a string literal of at most 32767 bytes.  
173, 0, "SPACE, TAB or RETURN are disallowed as alternative quote delimiters"
// MANUAL: SPACE, TAB or RETURN are disallowed as alternative quote delimiters.
// INDEX: "Alternative Quote Delimiter"
// RELEASE: 10.0
// CAUSE: SPACE, TAB or RETURN was used as alternative quote delimiter.
// ACTION: Use a character other than SPACE, TAB or RETURN as the
//         alternative quote delimiter.
174, 0, "a static boolean expression must be used"
// MANUAL:
// INDEX: "Conditional Compilation"
// CAUSE: The expression contained a syntax or semantic error, or it
//        did not have a boolean type or its evaluation raised an
//        exception.
// ACTION: Write correct static boolean expression.
176, 0, "unexpected preprocessor token '$%s'"
// MANUAL:
// INDEX: "Conditional Compilation"
// CAUSE: A preprocessor token was used inappropriately.
// ACTION: Remove the preprocessor token that is inappropriately used.
177, 0, "'$%s' preprocessor directive does not end properly"
// MANUAL:
// INDEX: "Conditional Compilation"
// CAUSE: A preprocessor directive was not ended properly.
// ACTION: Use $end to end the preprocessor directive properly.
178, 0, "a static character expression must be used"
// MANUAL:
// INDEX: "Conditional Compilation"
// CAUSE: The expression contained a syntax or semantic error, or it
//        did not have a character type or its evaluation raised an
//        exception.
// ACTION: Write correct static character expression.
179, 0, "$ERROR: %s"
// MANUAL:
// INDEX: "Conditional Compilation"
// CAUSE: $ERROR directive was used. This is an expected error message.
// ACTION: NA
180, 0, "preprocessor directives are not supported in this context"
// MANUAL:
// INDEX: "Conditional Compilation"
// CAUSE: A preprocessor directive was used in a compilation unit for which
//        conditional compilation is not supported.
// ACTION: Do not use any preprocessor directives in this compilation unit.
181, 0, "unsupported preprocessor directive '%s'"
// MANUAL:
// INDEX: "Conditional Compilation"
// CAUSE: An unsupported preprocessor directive was used.
// ACTION: Use a supported preprocessor directive.
182, 0, "Identifier cannot be an empty string"
// MANUAL: invalid identifier name
// INDEX:
// RELEASE:
// CAUSE: Identifier was declared using an empty string,
// ACTION: rename the identifier to a non empty string.


201, 0, "identifier '%s' must be declared"
// MANUAL: illegal reference to undeclared name : '<MI>name<D>'
// INDEX:
// RELEASE: 
// CAUSE:  You tried to reference either
//            an undeclared variable, exception, procedure, or other item,
//         or an item to which no privilege was granted
//         or an item to which privilege was granted only through a role.
// ACTION: 1) Check your spelling and declaration of the referenced name.
//         2) Verify that the declaration for the referenced item is placed
//            correctly in the block structure.
//         3) If the referenced item is indeed declared but you don't have
//            privileges to refer to that item, for security reasons, you will
//            be notified only that the item is not declared.
//         4) If the referenced item is indeed declared and you believe that
//            you have privileges to refer to that item, check the privileges;
//            if the privileges were granted only via a role, then this is
//            expected and documented behavior.  Stored objects (packages,
//            procedures, functions, triggers, views) run in the security
//            domain of the object owner with no roles enabled except PUBLIC.
//            Again, you will be notified only that the item was not declared.
//
202, 0, "type '%s' must be declared"
// MANUAL: type '<MI>name<D>' must be declared
// INDEX:
// RELEASE: Not in this release, because no user-defined types yet.
// CAUSE: An attempt was made to reference an undefined type. Either the
//   type specifier was not declared or it is not within the scope of the
//  reference.
// ACTION:Check the spelling and declaration of the type specifier. Also confirm that the declaration is placed correctly in the block structure.
//
203, 0, "function DECODE must be called with at least 3 non-boolean arguments"
// MANUAL: function DECODE must be called with at least non-boolean 3 arguments
// INDEX:
// RELEASE:
// CAUSE: Less than three arguments were passed to the built-in function
//   DECODE. Though DECODE takes a variable number of (non-Boolean) 
//  arguments, at least three arguments must be passed.
// ACTION: Call DECODE with three or more arguments
//
204, 0, "function or pseudo-column '%s' may be used inside a SQL statement only"
// MANUAL: function '<MI>name<D>' may be used inside a SQL statement only
// INDEX:
// CAUSE: A pseudocolumn or proscribed function was used in a procedural
//   statement. The SQL pseudocolumns (LEVEL, ROWID,
//   ROWNUM) can be used only in SQL statements. Likewise, certain functions
//   such as DECODE, DUMP, and VSIZE and the SQL group functions (AVG, MIN,
//   MAX, COUNT, SUM, STDDEV, VARIANCE) can be used only in SQL statements.
// ACTION: Remove the pseudocolumn reference or function call from the
//   procedural statement. Or, replace the procedural statement with 
//  a SELECT INTO statement; for example, replace     
//      bonus := DECODE(rating, 1, 5000, 2, 2500, ...);     
//  with the following statement:     
//     SELECT DECODE(rating, 1, 5000, 2, 2500, ...) INTO bonus FROM dual;
//
205, 0, "Aggregate not allowed here"
// MANUAL: 
// INDEX:
// CAUSE: An aggregate, that is, a parenthesized list of values such as 
//  (7788, 'SCOTT', 20), was found in an inappropriate context.
// ACTION: Remove or relocate the aggregate.
//
206, 0, "%%TYPE must be applied to a variable, column, field or attribute, not to \"%s\"" 
// MANUAL: %%TYPE must be applied to a variable or column, not '<MI>name<D>'
// INDEX:
// CAUSE: The program object declared using the %TYPE datatype attribute 
//  is not of the appropriate class. It must be a variable, column, record
//   component, subprogram formal parameter, or other object to which 
//   values can be assigned.
// ACTION: Declare an object of the appropriate class or define the 
//  datatype in another way (for example, use %ROWTYPE).
//
207, 0, "identifier '%s', applied to implicit cursor SQL, is not a legal cursor attribute"
// MANUAL:
// INDEX:
// RELEASE: 
// CAUSE:  An identifier that is not a cursor attribute was applied to the
//   identifier SQL. For example, this error occurs if the cursor attribute
//   is misspelled.
// ACTION:Check the spelling of the cursor attribute name. Make sure the
//  attribute is one of these: %NOTFOUND, %FOUND, %ROWCOUNT, %ISOPEN.
//
208, 0, "identifier '%s' is not a legal cursor attribute"
// MANUAL: identifier '<MI>name<D>' is not a legal cursor attribute
// INDEX:
// RELEASE: 
// CAUSE: An identifier not declared as a cursor attribute was applied to 
//  an identifier declared as a cursor. For example, this error occurs 
//  if the cursor attribute is misspelled.
// ACTION:Check the spelling of the cursor attribute name. Make sure the
//   attribute is one of these: %NOTFOUND, %FOUND, %ROWCOUNT, %ISOPEN.
//
209, 0, "table '%s' is not in FROM clause"
// MANUAL:
// INDEX:
// RELEASE: 
// CAUSE: In a query, a table referenced by the select list is not named 
//  in the FROM clause.
// ACTION:Check the spelling of the table names, make sure each column 
//  in the select list refers to a table in the FROM clause, then 
//  re-execute the query.
//
210, 0, "an OTHERS clause is required in this CASE statement"
// MANUAL: an OTHERS clause is required in this CASE statement
// INDEX:
// RELEASE: CASE statement not supported in release 1.0.
// CAUSE:  Unless the clauses of a CASE statement mention all values of the 
//         type of the selecting expression, an OTHERS clause must be provided
//         as the last clause of the CASE statement.  It is impossible to cover
//         all values of type INTEGER (or NUMBER), so an OTHERS clause is 
//         always required when the expression following the keyword CASE is 
//         of type INTEGER (or NUMBER).
// ACTION:
//
211, 0, "CASE labels or ranges must not be duplicated in different WHEN clauses"
// MANUAL: CASE labels or ranges must not be duplicated in different WHEN clauses
// INDEX:	"range"
// RELEASE: CASE statement not supported in release 1.0.
// CAUSE: In this CASE statement, a value appears in more than one WHEN clause.
//        A value may appear in at most one WHEN clause of a CASE statement.
// ACTION:
//
212, 0, "could not obtain enough memory to compile CASE statement"
// MANUAL: could not obtain enough memory to compile CASE statement
// INDEX:
// RELEASE: CASE statement not supported in release 1.0.
// CAUSE: The CASE statement is too big.  The compiler did not have enough
//        storage to process it.
// ACTION:  
//
213, 0, "package STANDARD not accessible"
// MANUAL: could not lock lib unit standard so can't access package STANDARD
// INDEX:
// RELEASE: 
// CAUSE: The PL/SQL compiler could not find package STANDARD in the 
//  current Oracle database. To compile a program, PL/SQL needs package
//   STANDARD.
// ACTION:  Make sure that package STANDARD is available in the 
//  current Oracle database, then retry the operation.
//
214, 0, "BEGIN...END block nesting is too deep"
// MANUAL: BEGIN...END block nesting is too deep
// INDEX:
// RELEASE: 
// CAUSE: The number of levels of nesting in the PL/SQL block is too large.
//  Blocks can be nested up to 255 levels deep, depending on the
//   availability of system resources such as memory. 
// ACTION:  Reorganize the block structure to avoid nesting at too deep 
//  a level. For example, move the lowest-level sub-block to a higher level.
//
215, 0, "String length constraints must be in range (1 .. 32767)"
// MANUAL: String length constraints must be in range (1 .. 32767)
// INDEX:
// RELEASE:
// CAUSE: When a character variable was declared, a length outside the legal
//   range was specified. For example, the following declarations are 
//  illegal:
//      flag  CHAR(0);        -- illegal; zero length     
//      name  VARCHAR2(-10);  -- illegal; negative length
// ACTION:Change the length constraint, making sure that it lies in 
//  the range 1 .. 32767.
//
216, 0, "NUMBER precision constraint must be in range (1 .. 38)"
// MANUAL: NUMBER precision constraint must be in range (1 .. 38)
// INDEX:
// RELEASE: 
// CAUSE: A NUMBER variable was declared with a precision that is outside
//   the legal range. Declarations such as N NUMBER(800) or N NUMBER(123,10)
//   are not supported.
// ACTION:Change the illegal NUMBER precision constraint, making sure that
//   it lies in the range 1 .. 38.
//
217, 0, "NUMBER scale constraint must be in range (-84 .. 127)"
// MANUAL: NUMBER scale constraint must be in range (-84 .. 127)
// INDEX:	"precision", "scale"
// RELEASE: 
// CAUSE: A NUMBER variable was declared with a scale that is outside the
//   legal range. Declarations such as N NUMBER(10,345) or N NUMBER(10,-100)
//   are not supported.
// ACTION:Change the illegal NUMBER scale constraint, making sure that it 
//  lies in the range -84 .. 127.
//
218, 0, "a variable declared NOT NULL must have an initialization assignment"
// MANUAL: a variable declared NOT NULL must have an initialization assignment
// INDEX:
// RELEASE: 
// CAUSE: In general, variables that have no initialization clause in their
//        declaration are automatically initialized to NULL.  This is
//        illogical for NOT NULL variables; therefore, an initialization
//        clause is required.
// ACTION: Add an initialization clause to the variable declaration.
//         If the initilization is too 
//         complicated for the syntax, one can add a function call 
//         (in a later release).
//
219, 0, "label '%s' reference is out of scope"
// MANUAL: new 19Jan89
// INDEX:	
// RELEASE: 
// CAUSE: A block or loop label was used to qualify a variable (as in
//   outer_block.date) that was not declared or is not within the scope of 
//  the label. The variable name might be misspelled, its declaration might 
//  be faulty, or the declaration might be placed incorrectly in the block
//   structure.
// ACTION: Check the spelling and declaration of the variable name. Also
//   confirm that the declaration is placed correctly in the block structure.
//
220, 0, "simple name required in this context"
// MANUAL: simple name required in this context
// INDEX:	"simple name", "qualified name"
// RELEASE: 
// =G=>	I wasn't able to determine how this error message can occur.
//      I didn't figure out how to write any QA for it.
// CAUSE: A qualified name  such as A.B or A.B.C is not permitted here.
// ACTION: Use a simple name such as A instead.
//
221, 0, "'%s' is not a procedure or is undefined"
// MANUAL: '<MI>name<D>' is not a procedure or is undefined
// INDEX:
// RELEASE: 
// CAUSE: An identifier being referenced as a procedure was not declared or
//   actually represents another object (for example, it might have been
//   declared as a function).
// ACTION: Check the spelling and declaration of the identifier. Also
//   confirm that the declaration is placed correctly in the block structure.
//
222, 0, "no function with name '%s' exists in this scope"
// MANUAL: no function with name '<MI>name<D>' exists in this scope
// INDEX:
// RELEASE: 
// CAUSE: An identifier being referenced as a function was not declared or
//   actually represents another object (for example, it might have been
//   declared as a procedure).
// ACTION: Check the spelling and declaration of the identifier. Also
//   confirm that the declaration is placed correctly in the block structure.
//
223, 0, "paramaterless procedure '%s' used as function"
// MANUAL: paramaterless procedure '<MI>name<D>' used as function
// INDEX:
// RELEASE: 
// CAUSE: An identifier being referenced as a parameterless function
//   actually represents a procedure.
// ACTION: Check the spelling and declaration of the identifier. Also
//   confirm that the declaration is placed correctly in the block
//   structure. If necessary, change the declaration of the identifier 
//  or change the reference so that it does not require a return value.
//
224, 0, "object '%s' must be of type function or array to be used this way"
// MANUAL: object '<MI>name<D>' must be of type function or array to be used this way
// INDEX:
// RELEASE: 
// CAUSE: An identifier being referenced as a function or an array actually
//   represents an object (a number or date, for example) that cannot be
//   referenced in this way.
// ACTION: Check the spelling and declaration of the identifier. Also
//   confirm that the declaration is placed correctly in the block structure.
//
225, 0, "subprogram or cursor '%s' reference is out of scope"
// MANUAL: subprogram or cursor <name> reference is out of scope
// INDEX:
// RELEASE:
// CAUSE:
//   The prefix in a qualified name was a subprogram or cursor which was not
//   in an enclosing scope; i.e., a subprogram or cursor name is being used
//   as a scope qualifier for a reference to an entity (within that subprogram
//   or cursor) that is not in scope.
//     Example:
//       declare
//         x number;
//         type t1 is record (a number);
//         function f return t1 is
//           a number;
//         begin
//           x := f.a;   -- legal use of function "f" as a scope qualifier;
//                       -- resolves to local variable "a" in function "f".
//           x := f().a; -- legal reference to component "a" of returned record
//         end;
//       begin
//         x := f.a;   -- illegal use of function "f" as a scope qualifier
//         x := f().a; -- legal reference to component "a" of returned record
//       end;
// ACTION:
//   a) if the intention was to refer to a local variable of a
//      non-enclosing function, this is not allowed; remove the reference
//   b) if this is a parameterless function, and the the intention was
//      to access a field of the result of a call to this function, then 
//      use empty parentheses in the call.
//
226, 0, "package '%s' used as variable reference"
// MANUAL: ??
// INDEX:
// RELEASE: 
// CAUSE: A package was referenced in an expression as if it were a variable
//   or function. Either the name of the variable or function is misspelled 
//  or the reference is not fully qualified. For example, to call the 
//  function my_function, which is stored in package my_package, dot
//   notation must be used, as follows:    
//      ... my_package.my_function ...
// ACTION: Correct the spelling of the variable or function name or use 
//  dot notation to reference the packaged variable or function.
//
227, 0, "subprogram 'in' formal %s is not yet denotable"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: When the formal parameters of a subprogram were declared, one
//   parameter was used to initialize another, as in     
//  PROCEDURE my_proc (j NUMBER, k NUMBER := j) IS ...     
//  The first parameter has no value until run time, so it cannot be used 
//  to initialize another parameter.
// ACTION: Remove the illegal formal parameter reference.
//
228, 0, "Illegal declaration of variable of type LONG"
// MANUAL: Illegal declaration of variable of type LONG
// INDEX:
// RELEASE:
// CAUSE: An attempt was made to declare a variables to be of type LONG.  
//  Only columns can  be of type LONG.
// CAUSE: The identifier is a formal parameter which is being used in the 
//        context of a default expression value for a formal parameter in 
//        the same formal parameter list. E.g.: procedure p(j number, k 
//        number := j).
// ACTION: Remove the offending variable definition
//
229, 0, "Attribute expression within SQL expression"
// MANUAL: 
// INDEX:	
// RELEASE: 
// CAUSE: An attribute expression, such as SQL%NOTFOUND, was used in a 
//  SQL statement, but attribute expressions are allowed only in 
//  procedural statements.
// ACTION: To workaround this limitation, assign the value of the 
//  attribute expression to a variable, then use the variable in the SQL
//  statement. For example, replace the statement     
//      INSERT INTO audits VALUES (c1%ROWCOUNT, ...);    
//  with the following statements:     
//      row_count := c1%ROWCOUNT;     
//      INSERT INTO audits VALUES (row_count, ...);
230, 0, "OUT and IN OUT formal parameters may not have default expressions"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: When the formal parameters of a procedure were declared, an OUT 
//  or IN OUT parameter was initialized to a default value, as in     
//      PROCEDURE calc_bonus (bonus OUT REAL := 0, ...) IS ...     
//  However, only IN parameters can be initialized to default values.
// ACTION:Remove the illegal default expression.
231, 0, "function '%s' may not be used in SQL"
// MANUAL: function '<MI>name<D>' may not be used in SQL
// INDEX:
// CAUSE: A proscribed function was used in a SQL statement. Certain 
//  functions such as SQLCODE and SQLERRM can be used only in procedural
//   statements.
// ACTION: Remove the function call from the SQL statement. Or, replace 
//  the function call with a local variable. For example, the following
//  statement is illegal:     
//      INSERT INTO errors VALUES (SQLCODE, SQLERRM);     
//  However, you can assign the values of SQLCODE and SQLERRM to 
//  local variables, then use the variables in the SQL statement, as follows:
//      err_num := SQLCODE;     
//      err_msg := SQLERRM;     
//      INSERT INTO errors VALUES (err_num, err_msg);
//
232, 0, "nested packages not permitted"
// MANUAL: 
// INDEX:
// CAUSE: A package was declared inside another package, but package
//   declarations are allowed only at the top level. In other words,
//   packages cannot be nested.
// ACTION: Move the package declaration outside the enclosing package.
233, 0, "function name used as an exception name in when clause"
// MANUAL: 
// INDEX:
// CAUSE: The WHEN clause in an exception handler contains a function 
//  call instead of an exception name. A valid exception handler consists 
//  of a WHEN clause, which must specify an exception, followed by a
//   sequence of statements to be executed when that exception is raised.
// ACTION: Check the spelling of the identifier in the WHEN clause, 
//  then replace the function call with an exception name. 
234, 0, "PARAMETER STYLE SQL may not be specified with a PARAMATERS list"
// MANUAL: 
// INDEX:
// CAUSE: A subprogram cannot specify both PARAMETER STYLE SQL and an explicit 
//         PARAMETERS list.  Use PARAMETER STYLE GENERAL to supply default 
//         PARAMETERS list types.
//   
// ACTION: Change the subprogram specification.
235, 0, "the external type is not appropriate for the parameter"
// MANUAL: 
// INDEX:
// CAUSE: An unsuccessful attempt was made to convert a parameter to the 
//  specified external parameter type. 
// ACTION: Specify a different external type or parameter type.
//	   
236, 0, "Invalid external type specification for %s."
// MANUAL: 
// INDEX:
// CAUSE: The external type specified is not valid for one of the following: 
//         INDICATOR, LENGTH, MAXLEN, TDO, DURATION, CHARSETID, or 
//         CHARSETFORM.
//   
// ACTION: Check the manual and specify an appropriate external type.
//	   
237, 0, "invalid BY VALUE indicator or length specification"
// MANUAL: 
// INDEX:
// CAUSE: BY VALUE was specified with an indicator or length parameter that
//        is being passed in OUT or IN OUT mode. Only IN mode parameters may
//        be passed by value.
//   
// ACTION: Remove the BY VALUE specification or change it to IN mode.
//	   
238, 0, "external parameter name %s not found in formal parameter list"
// MANUAL: 
// INDEX:
// CAUSE: An external parameter name was specified that does not match one
//        in the formal parameter list. 
//   
// ACTION: Correct the external parameter name.
239, 0, "invalid external type specification for SQLCODE"
// MANUAL: 
// INDEX:
// CAUSE: An inappropriate external parameter type was specified for the 
//        SQLCODE parameter.
//   
// ACTION: Correct the SQLCODE parameter specification.
240, 0, "Invalid type specification for RETURN indicator, length, tdo, duration"
// MANUAL: 
// INDEX:
// CAUSE: An inappropriate external parameter type was specified for the 
//        RETURN indicator, LENGTH, TDO, or DURATION. 
//   
// ACTION: Correct the RETURN parameter specification.
241, 0, "invalid external type specification for SQLSTATE"
// MANUAL: 
// INDEX:
// CAUSE: An inappropriate external parameter type was specified for the 
//        SQLSTATE parameter.
//   
// ACTION: Correct the SQLSTATE parameter specification.
242, 0, "invalid external type specification for CONTEXT"
// MANUAL: 
// INDEX:
// CAUSE: An inappropriate external parameter type was specified for the 
//        CONTEXT parameter.
//   
// ACTION: Correct the CONTEXT parameter specification.
243, 0, "invalid external type specification for SQLNAME"
// MANUAL: 
// INDEX:
// CAUSE: An inappropriate external parameter type was specified for the 
//        SQLNAME parameter.
//   
// ACTION: Correct the SQLNAME parameter specification.
//	   
244, 0, "Multiple declarations in foreign function formal parameter list"
// MANUAL: 
// INDEX:
// CAUSE: There are multiple declarations of at least one the following
//        FORMAL, INDICATOR, LENGTH, MAXLENGTH, or CONTEXT. PL/SQL allows 
//        only one
//        declaration of the above for each formal parameter in the PARAMETERS 
//        clause.
//   
// ACTION: Correct the PARAMETERS clause.
//	   
245, 0, "Formals used in the 'parameters' clause must appear exactly once"
// MANUAL: 
// INDEX:
// CAUSE: There are multiple declarations of the formal parameter in the
//        PARAMETERS
//        clause. PL/SQL allows only one declaration of the formal
//        parameter in the PARAMETERS clause.
//   
// ACTION: Correct the PARAMETERS clause.
//	   
246, 0, "PARAMETER STYLE is unsupported"
// MANUAL:
// INDEX:
// CAUSE: A PARAMETER STYLE clause was placed in the external subprogram body.
// ACTION: Remove the PARAMETER STYLE clause.
//
//
247, 0, "LIBRARY or ASSEMBLY name must be specified"
// MANUAL:
// INDEX:
// CAUSE: The LIBRARY or ASSEMBLY name is missing from the external subprogram 
//        body.
// ACTION: The LIBRARY or ASSEMBLY name was not specified in the external 
//         subprogram body.
//
248, 0, "Invalid Library Syntax"
// MANUAL:
// INDEX:
// CAUSE: The LIBRARY syntax was entered incorrectly.
// ACTION: Correct the LIBRARY syntax and recompile.
//
249, 0, "Invalid WITH CONTEXT Syntax"
// MANUAL:
// INDEX:
// CAUSE: CONTEXT was used in a WITH CONTEXT or a PARAMETERS clause. This is 
//         invalid.
// ACTION: Check if WITH CONTEXT is used without specifying CONTEXT in the 
//         PARAMETERS
//         clause or vice versa. The PARAMETERS clause must be complete. 
//         Thus if WITH CONTEXT is specified, then CONTEXT must be 
//         referenced in the PARAMETERS clause (if there is one).
//
250, 0, "Incorrect Usage of %s in parameters clause."
// MANUAL:
// INDEX:
// CAUSE: The usage of Keywords such as MAXLEN, LENGTH, CHARSETID, CHARSETFORM
//        RETURN in the parameters clause was incorrect
/
// ACTION: This error occurs if keywords like MAXLEN, LENGTH,
//         TDO, DURATION, CHARSETID, or CHARSETFORM cannot be used with PL/SQL
//         formal parameters or the mode of the formal parameter. For example,
//         MAXLEN can only be declared for a CHAR or VARCHAR2 PL/SQL variable 
//         and its use is allowed only for OUT or INOUT PL/SQL variables.
//         Also, RETURN was specified in the parameters clause for a PL/SQL
//         PROCEDURE. E.g.
//           CREATE PROCEDURE proc IS EXTERNAL
//             NAME ... LIBRARY ...
//             PARAMETERS(RETURN INDICATOR SHORT, RETURN);
//
251, 0, "RETURN, for actual function return, must be last in the parameters clause"
// CAUSE: RETURN specification for the actual function return, 
//        used within the parameters clause must hold the very last 
//        position.
//
//        Example : The following will give this error since the RETURN
//                  specification for the actual function return in the
//                  parameters clause is not the last.
//           FUNCTION myexternalfunc (var1 BINARY_INTEGER, 
//                                    var2 BINARY_INTEGER) 
//                                    RETURN BINARY_INTEGER IS EXTERNAL
//                    NAME "myexternalfunc"
//                    LIBRARY somelib
//                    PARAMETERS (var1 LONG, var2 SHORT, 
//                                RETURN INT, RETURN INDICATOR SHORT);
//
//                  The correct syntax is the following. Note that
//                  RETURN for actual function return is the last specification
//                  in the parameters clause.
//           FUNCTION myexternalfunc (var1 BINARY_INTEGER, 
//                                    var2 BINARY_INTEGER) 
//                                    RETURN BINARY_INTEGER IS EXTERNAL
//                    NAME "myexternalfunc"
//                    LIBRARY somelib
//                    PARAMETERS (var1 LONG, var2 SHORT, 
//                                RETURN INDICATOR SHORT, RETURN INT);
//
// ACTION: Correct the syntax of the RETURN specification in the parameters
//         clause
//
//
252, 0, "reference to the wrong copy of package STANDARD"
// MANUAL:
// INDEX:
// CAUSE: A reference is made to the fixed package version of STANDARD when
//        the database is open, or to the on-disk version when the database
//        is closed.  Explicit use of a SYS.X$ package name can lead to this.
//        One might also see this from a compilation that begins while the
//        db is closed but has the bad luck to have another session open the
//        db before compilation is complete.  Another possible cause is having
//        'set serveroutput on' through svrmgrl when doing an
//        'alter database close'.
// ACTION: Make use of on-disk versions of packages when the database is open
//         and fixed (preloaded) versions when the database is closed.  Do
//         not attempt to use the wrong set.  It should be quite hard
//         to reference the wrong set, except by using SYS.X$ package names
//         explicitly.  Also, be sure to 'set serveroutput off' before doing
//         an 'alter database close'.
//
253, 0, "Formal parameter %s  missing in the parameters clause"
// MANUAL: 
// INDEX:
// CAUSE: The parameter clause does not have a matching parameter for a parameter
//        specified in the formal parameter list. 
//   
// ACTION: Provide a matching parameter in parameters clause for every formal
//         parameter.
254, 0, "OUT and IN/OUT modes cannot be used in this context"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE: actual parameter mode (OUT, or IN/OUT) is not used properly
//	  in USING clause.  For USING clause in an OPEN statement, only IN
//        mode is allowed.
// ACTION: change the parameter mode in the USING clause to an appropriate
//	   mode.
//
255, 0, "CALL Specification parameters cannot have default values"
// MANUAL:
// INDEX:
// CAUSE: CALL Specification formal parameters default values are disallowed.
// ACTION: Remove the default values in the formal parameter list 
//         (spec or body) and compile again.
//
//
256, 0, "%s is not a valid external library or assembly"
// MANUAL: 
// INDEX:
// CAUSE: The supplied external library or assembly name in the external 
//        clause is not a valid alias library or assembly.
// ACTION: Provide the name of a valid alias library or assembly which is 
//         previously declared.
//
257, 0, "illegal use of EXTERNAL clause in a TYPE or PACKAGE specification"
// MANUAL:
// INDEX:
// CAUSE: An EXTERNAL Clause was detected in a TYPE Specification or
//        a PACKAGE specification.
// ACTION: Remove the EXTERNAL Clause and use the new CALL Specification
//         syntax.
//
//
258, 0, "constrained datatypes disallowed in CALL Specifications"
// MANUAL:
// INDEX:
// CAUSE: A call specification for C or Java cannot have constraints on
//        the PL/SQL formal parameter types. PL/SQL types which have
//        have constraints are
//
//        NATURAL, NATURALN, POSITIVE, POSITIVEN, SIGNTYPE, 
//        INTEGER, INT, SMALLINT, DECIMAL, NUMERIC, DEC
//
//        This includes NOT NULL constraints from POSITIVEN, NATURALN
//
// ACTION: Use the unconstrained type for that PL/SQL formal declaration
//         i.e NUMBER, BINARY_INTEGER or PLS_INTEGER
//
//
259, 0, "rights model (AUTHID) must be specified"
// MANUAL:
// INDEX:
// CAUSE: It is mandatory to specify the rights model if a PL/SQL
//        PROCEDURE, FUNCTION, PACKAGE OR TYPE HAS CALL-Specifications
// ACTION: Add the AUTHID clause indicating the rights model.
//
260, 0, "Datetime/Interval constraints must be in range (0 .. 9)"
// MANUAL: Datetime/Interval constraints must be in range (0 .. 9)
// INDEX:	
// RELEASE: 
// CAUSE: A Datetime/Interval variable or attribute was declared with a constraint
//   outside the legal range. 
// ACTION:Change the illegal constraint.
//
261, 0, "Java CALL Specification not yet allowed as a method in an object type"
// MANUAL:
// INDEX:
// CAUSE: A call specification declaring that an implementation is in Java
//        has been found for a method of an object or opaque type.  This
//        usage is not yet supported.
// ACTION: Implement the method using a language other than Java.  A PL/SQL
//        method implementation is permitted to call to Java through a call
//        specification provided as a schema-level procedure or in a package;
//        such a call specification can only target a static Java method,
//        however.
//
//
//
// ****** errors until 300 are reserved for External Procedures **********
// ****** PH2 errors                                            **********
//
//
//
//
//
302, 0, "component '%s' must be declared"
// MANUAL: component '<MI>name<D>' must be declared
// INDEX:	"component"
// RELEASE: 
// CAUSE: In a reference to a component (for example, in the name "A.B",
//  "B" is a component of "A"), the component has not been declared.
//  The component might be misspelled, its declaration might be
//  faulty, or the declaration might be placed incorrectly in the
//  block structure.
// ACTION:Check the spelling and declaration of the component. Also confirm
//   that the declaration is placed correctly in the block structure.
//
303, 0, "qualifier '%s' must be declared"
// MANUAL: qualifier '<MI>name<D>' must be declared
// INDEX:	"qualifier"
// RELEASE: 
// CAUSE: In a name such as "A.B", "A" is the qualifier, and "B" is a
//  component of the qualifier.  This error occurs when no declaration
//  for the qualifier is found.The qualifier might be misspelled, its
//  declaration might be faulty, or the declaration might be placed
//  incorrectly in the block structure.
// ACTION:	Check the spelling and declaration of the qualifier. 
//        Also confirm that the declaration is placed 
//        correctly in the block structure.
//
304, 0, "cannot compile body of '%s' without its specification"
// MANUAL: cannot compile body of '<MI>name<D>' without its specification
// INDEX:	"package", "package body", "package specification"
// RELEASE: Not in pcc release -- maybe required for sqlforms?
// CAUSE: The compiled package specification required to compile a 
//  package body could not be found. Some possible causes follow:
//  --the package name is misspelled 
//  --the package specification was never compiled 
//  --the compiled package specification is not accessible   
//  The package specification must be compiled before compiling the 
//  package body, and the compiler must have access to the compiled
//  specification.
// ACTION:Check the spelling of the package name. Compile the package
//   specification before compiling the package body. Also, make sure the
//   compiler has access to the compiled specification.
//
305, 0, "previous use of '%s' (at line %s) conflicts with this use"
// MANUAL: 
// INDEX:	
// RELEASE: 
// CAUSE: While looking for prior declarations of a cursor, procedure,
//   function, or package, the compiler found another object with the same
//   name in the same scope. Or, the headers of subprogram in a package
//   specification and body do not match word for word.
// ACTION:Check the spelling of the cursor, procedure, function, or package
//   name. Also check the names of all constants, variables, parameters, and
//   exceptions declared in the same scope. Then, remove or rename the
//   object with the duplicate name. Or, change the headers of the packaged
//   subprogram so that they match word for word.
//
306, 0, "wrong number or types of arguments in call to '%s'"
// MANUAL: wrong number or types of arguments in call to '<MI>name<D>'
// INDEX:      "name-analysis" -- we are using the term "name-analysis" instead
//		of "overloading".
// RELEASE: 
// CAUSE: This error occurs when the named subprogram call cannot be matched
//   to any declaration for that subprogram name. The subprogram name might be
//   misspelled, a parameter might have the wrong datatype, the declaration
//   might be faulty, or the declaration might be placed incorrectly in the
//   block structure. For example, this error occurs if the built-in square
//   root function SQRT is called with a misspelled name or with a parameter
//   of the wrong datatype.
// ACTION:Check the spelling and declaration of the subprogram name. Also
//   confirm that its call is correct, its parameters are of the right
//   datatype, and, if it is not a built-in function, that its declaration
//   is placed correctly in the block structure.
//
307, 0, "too many declarations of '%s' match this call"
// MANUAL: too many declarations of '<MI>name<D>' match this call
// INDEX:
// RELEASE: 
// CAUSE: The declaration of a subprogram or cursor name is ambiguous because 
//   there was no exact match between the declaration and the call and more 
//   than one declaration matched the call when implicit conversions of the 
//   parameter datatypes were used. The subprogram or cursor name might be 
//   misspelled, its declaration might be faulty, or the declaration might be
//   placed incorrectly in the block structure.
// ACTION:Check the spelling and declaration of the subprogram or cursor name.
//   Also confirm that its call is correct, its parameters are of the right
//   datatype, and, if it is not a built-in function, that its declaration
//   is placed correctly in the block structure.
//
308, 0, "this construct is not allowed as the origin of an assignment"
// MANUAL: 
// INDEX:	
// RELEASE: 
// CAUSE: The construct or expression does not designate a value that can 
//  be assigned to a variable. For example, the datatype name NUMBER cannot
//  appear on the right hand side of an assignment statement as in X :=
//  NUMBER.
// ACTION:Correct the illegal assignment statement.
//
309, 0, "with %%LAST attribute, '%s' must be a variable of an enumerated type"
// MANUAL: with %LAST attribute, '<MI>name<D>' must be a variable of an enumerated type
// INDEX:	"enumerated", "subtype"
// RELEASE: 
// CAUSE: The "%LAST" attribute must be applied to an identifier that has
//        been declared as a variable of an enumerated type (or subtype of
//	  an enumerated type).  This error occurs when "%LAST" follows
//	  some identifier that has not been so declared.
// ACTION:
//
310, 0, "with %%ROWTYPE attribute, '%s' must name a table, cursor or cursor-variable"
// MANUAL: with %ROWTYPE attribute, '<MI>name<D>' must name a table, cursor or
//         cursor-variable.
// INDEX:
// RELEASE: 
// CAUSE: The %ROWTYPE attribute must be applied to an identifier declared
//   as a cursor, cursor variable, or database table. This error occurs when
//   %ROWTYPE follows some identifier that has not been so declared.
// ACTION:Change the declaration or do not apply the %ROWTYPE attribute to 
//  the identifier.
//
311, 0, "the declaration of \"%s\" is incomplete or malformed"
// MANUAL: the declaration of the type of '<MI>name<D>' is incomplete or malformed
// INDEX:
// RELEASE: Not in release 1.0 because no user-defined types yet.
// CAUSE: This occurrence of the identifier cannot be compiled because its
//        type has not been properly defined.
// ACTION:Correct the faulty datatype declaration.
//
312, 0, "a positional parameter association may not follow a named association"
// MANUAL: a positional parameter association may not follow a named association
// INDEX:	"positional argument", "association"
// RELEASE: Not in release 1.0.
// CAUSE: When a list of parameters is passed to a subprogram or cursor, 
//  if both positional and named associations are used, all positional
//  associations must be placed in their declared order and before all 
//  named associations, which can be in any order.
// ACTION:Reorder the parameter list to meet the requirements or use 
//  named association only.
//
313, 0, "'%s' not declared in this scope"
// MANUAL: '<MI>name<D>' not declared in this scope
// INDEX:
// RELEASE: 
// CAUSE:There is no declaration for the given identifier within the 
//  scope of reference. The identifier might be misspelled, its declaration
//  might be faulty, or the declaration might be placed incorrectly in 
//  the block structure.
// ACTION:Check the spelling and declaration of the identifier. Also 
//  confirm that the declaration is placed correctly in the block structure.
//
314, 0, "TABLE declarations are not allowed as PL/SQL local variables"
// MANUAL:
// INDEX:
// RELEASE: 
// CAUSE: In a precompiled program, the DECLARE TABLE statement was mistakenly 
//  used inside an embedded PL/SQL block. If an embedded PL/SQL block refers 
//  to a database table that does not yet exist, use the DECLARE TABLE 
//  statement to tell the precompiler what the table will look like. 
//  However, DECLARE TABLE statements are allowed only in the host program.
// ACTION: Move the DECLARE TABLE statement outside the embedded PL/SQL 
//  block. If you want a variable that can store an entire row of data 
//  selected from a database table or fetched from a cursor or cursor 
//  variable, use the %ROWTYPE attribute.
//
315, 0, "Implementation restriction: unsupported table index type"
// MANUAL:
// INDEX:
// RELEASE: 
// CAUSE: In the INDEX BY clause of a PL/SQL table declaration, a datatype
//  other than BINARY_INTEGER, PLS_INTEGER, or VARCHAR2 was specified. 
//  PL/SQL tables can have one column and a primary key. The column can 
//  have any scalar type, but the primary key must be either a binary integer
//  type or VARCHAR2.
// ACTION:Use one of the supported key types in the INDEX BY clause.
//
316, 0, "PL/SQL TABLEs must use a single index"
// MANUAL:
// INDEX:
// RELEASE: 
// CAUSE: In the INDEX BY clause of a PL/SQL table declaration, a composite
//  primary key was specified. PL/SQL tables must have a simple, unnamed
//  primary key of a binary integer or VARCHAR2 type.
// ACTION:Use one of the supported key types in the INDEX BY clause.
//
317, 0, "incomplete type \"%s\" was not completed in its declarative region"
// MANUAL: incomplete type <type-name> was not completed in the declarative
//         region where it was declared.
// INDEX:
// RELEASE:
// CAUSE: An incomplete type declaration was not completed in the declarative
//        region where it was declared.
// ACTION: Complete the type appropriately, then retry the operation.
//
318, 0, "type \"%s\" is malformed because it is a non-REF mutually recursive type"
// MANUAL: type <type-name> is malformed because it participates in a
//         a mutually recursive non-REF relationship with itself and possibly
//         other types.
// INDEX:
// RELEASE:
// CAUSE: A type-declaration such as:
//                   -- a non-REF recursive type, for example:
//                   type t is record (a t);
//             or
//                   -- non-REF mutually dependent types, for example:
//                   type t1;
//                   type t2 is record (a t1);
//                   type t1 is record (a t2);
//        was performed. In these examples, the type is malformed because it
//        participates in a mutually recursive non-REF relationship with 
//        itself and possibly other types.
// ACTION: Use another type to remove the recursion.
319, 0, "subquery in an IN or NOT IN clause must contain exactly one column"
// MANUAL: subquery in an IN or NOT IN clause must contain exactly one column
// INDEX:	
// RELEASE: 
// CAUSE: An invalid expression such as 
//                     X IN (SELECT A,B ...)
//    was used. When a [NOT]IN clause is used with a subquery, it does not 
//    test for set membership. The number of expressions in the [NOT]IN clause 
//    and the subquery select list must match. So, in the example above, the 
//    subquery must specify at most one column.
// ACTION:Change the subquery to select only one column.
//
320, 0, "the declaration of the type of this expression is incomplete or malformed"
// MANUAL: the declaration of the type of this expression is incomplete or malformed
// INDEX:
// RELEASE: Not in release 1.0 because no user-defined types yet.
// CAUSE: In a declaration, the name of a variable or cursor is misspelled
//   or the declaration makes a forward reference. Forward references are
//   not allowed in PL/SQL. A variable or cursor must be declared before 
//   it is referenced it in other statements, including other declarative
//   statements. For example, the following declaration of dept_rec raises
//   this exception because it refers to a cursor not yet declared:     
//   DECLARE
//          dept_rec  dept_cur%ROWTYPE;
//          CURSOR dept_cur IS SELECT ... 
//             ...
// ACTION:Check the spelling of all identifiers in the declaration. 
//  If necessary, move the declaration so that it makes no forward references.
//
321, 0, "expression '%s' is inappropriate as the left hand side of an assignment statement"
// MANUAL: "expression '<MI>name<D>' is inappropriate as the left hand side of an assignment statement
// INDEX:
// RELEASE: 
// CAUSE: The expression does not designate a variable that can have a 
//  value assigned to it.  For example, the function SYSDATE cannot 
//  appear on the left hand side of an assignment statement such as     
//       SYSDATE := '01-JAN-1990';
// ACTION:Correct the illegal assignment statement.
//
322, 0, "declaration of a constant '%s' must contain an initialization assignment"
// MANUAL: declaration of a constant '<MI>name<D>' must contain an initialization assignment
// INDEX:
// RELEASE: 
// CAUSE: A constant declaration lacks the assignment of an initial value. 
//  For example, in the following declaration" := 3.14159" is the
//  initialization clause:  
//      "pi constant number := 3.14159;"
// ACTION:Correct the constant declaration by supplying the missing
//   initialization assignment.
//
323, 0, "subprogram or cursor '%s' is declared in a package specification and must be defined in the package body"
// MANUAL: subprogram '<MI>name<D>' is declared in a package specification and must be defined in the package body
// INDEX: "Package Specification", "Package Body"
// RELEASE: Not in release 1.0
// CAUSE: A subprogram specification was placed in a package specification,
//   but the corresponding subprogram body was not placed in the package body.
//   The package body implements the package specification. So, the package
//   body must contain the definition of every subprogram declared in the
//   package specification.
// ACTION: Check the spelling of the subprogram name. If necessary, add 
//   the missing subprogram body to the package body.    
//
324, 0, "cursor attribute may not be applied to non-cursor '%s'"
// MANUAL: cursor attribute may not be applied to non-cursor '<MI>name<D>'
// INDEX:
// RELEASE: 
// CAUSE: This error occurs when a cursor-attribute ("%FOUND", "%NOTFOUND", 
//        "%ROWS", "%IS_OPEN", etc.) appears following an identifier that
//	  is not declared as a cursor or cursor variable.  It occurs,
//        for example, if the variable name my_cur in my_cur%FOUND was not
//        properly declared as a cursor or if the variable declaration was
//        placed incorrectly in the block structure.
// ACTION:Check the spelling and declaration of the identifier. Also 
//        confirm that the declaration is placed correctly in the block
//        structure.
//
325, 0, "non-integral numeric literal %s is inappropriate in this context"
// MANUAL: non-integral numeric literal <MI>num<D> is inappropriate in this context
// INDEX: "Literal", "Numeric Literal"(?)
// CAUSE: A non-integral numeric literal was used in a context that 
//        requires an integer (a number with no digits to the right of its
//        decimal point).
// ACTION: Replace the inappropriate literal with an integer literal.
//
326, 0, "IN clause must contain same number of expressions as subquery"
// MANUAL: IN clause must contain same number of expressions as subquery
// INDEX: membership, IN clause, subquery
// CAUSE: The number of expressions in an IN clause did not equal the 
//  number of expressions in a corresponding subquery select list. For
//  example, the following statement is invalid because the IN clause 
//  contains two expressions, but the subquery select list contains just 
//  one: 
//        ... WHERE (ename, sal) IN (SELECT sal FROM emp);
// ACTION: Check the number of expressions in each set, then revise 
//  the statement to make the numbers equal.
//
327, 0, "\"%s\" is not in SQL scope here"
// MANUAL: Reference to table out of scope
// INDEX: 
// CAUSE: In a SQL statement, a reference was made to an out-of-scope 
//  database object. The referenced object might be misspelled, or the
//  reference might be mixed, as in the following example:     
//    CURSOR c1 IS SELECT dept.dname FROM emp;
// ACTION: Check the spelling of all database objects in the SQL 
//  statement, and make sure all references are to objects within the
//  current scope.
//
328, 0, "A subprogram body must be defined for the forward declaration of %s." 
// MANUAL:  "A subprogram body must be defined for a forward declaration 
// INDEX:
// RELEASE: 
// CAUSE: A subprogram specification was declared, but the corresponding
//   subprogram body was not defined. Write the subprogram specification and
//   body as a unit. An alternative solution is to separate the
//   specification from its body, which is necessary when you want to 
//   define mutually recursive subprograms or you want to group subprograms 
//   in a package.
// ACTION: Check the spelling of the subprogram name. If necessary, supply 
//   the missing subprogram body.
//
329, 0, "schema-level type has illegal reference to %s"
// MANUAL: This schema-level type has an illegal reference to <name>
// INDEX:
// RELEASE:
// CAUSE: An attempt was made to make a reference from a schema-level type to
// something other than a schema-level type. 
// ACTION: Replace the illegal reference and retry the operation.
330, 0, "invalid use of type name or subtype name"
// MANUAL: invalid use of type name or subtype name
// INDEX:
// RELEASE:
// CAUSE: A datatype or subtype specifier was mistakenly used in place of a
//   constant, variable, or expression. For example, the code might look 
//   like  
//  IF emp_count > number THEN ... -- illegal; NUMBER is a datatype specifier
// ACTION: Replace the datatype or subtype specifier with a valid 
//  constant, variable, or expression.
//
331, 0, "illegal reference to %s"
// MANUAL: Illegal reference to a remote object type or some object in SYS.
// INDEX:
// RELEASE: 8.0
// CAUSE: You had an EITHER
//        1. an illegal reference to some object in user SYS.
//        to use one of them in an illegal way OR 
//        2. an illegal reference to a remote object type.
// ACTION:  Remove the reference.
//
332, 0, "\"%s\" is not a valid prefix for a qualified name"
// MANUAL:  <name> is not a valid prefix for a qualified name.
// INDEX:   
// RELEASE: 
// CAUSE:   You have a malformed qualified name because the prefix is not
//          valid.
// ACTION:  Remove or change the reference.
//
333, 0, "\"%s\" must match an object-table alias in this context"
// MANUAL:  <name> must match an object-table alias in this context
// INDEX:   
// RELEASE: 8.0
// CAUSE:   The name, appearing in the context of a REF or VALUE, did not
//          resolve to an object-table alias.
// ACTION:  1) If there is no object table in the scope, then remove
//             the REF or VALUE; or provide the missing object table reference.
//          2) If there is an object table in the scope, but you're not
//             referring to it, add the reference.
//
334, 0, "\"%s\" matches table or view without an alias"
// MANUAL:  <name> matches table or view without an alias
// INDEX:   
// RELEASE: 8.0
// CAUSE:   You have a reference to a table or view name without an alias.
// ACTION:  Replace the reference with a reference to an object-table alias.
//
335, 0, "a package name conflicts with an existing object" 
// MANUAL: a package name conflicts with the name of an existing object
// INDEX:
// RELEASE:
// CAUSE: In a CREATE PACKAGE statement, a package (which is a database 
//  object that groups logically related PL/SQL types, objects, and
//   subprograms) was given the same name as an existing database object.
// ACTION: Give the package a unique name. 
//
336, 0, "non-object-table \"%s\" illegal in this context"
// MANUAL:  non-object-table <name> illegal in this context
// INDEX:   
// RELEASE: 8.0
// CAUSE:   You have a REF or VALUE modifier for a non-object-table
// ACTION:  Replace the reference with a reference to an object-table alias.
//
337, 0, "\"%s\" matches too many object table aliases"
// MANUAL:  <name> matches too many table table aliases
// INDEX:   
// RELEASE: 8.0
// CAUSE:   You have an ambiguous reference to an object-table alias;
//          there are at least two object-table aliases in the same scope.
// ACTION:  Remove all but one of the references or change the alias names
//          of the remaining.
//
338, 0, "unable to resolve \"%s\" as a column or row expression"
// MANUAL:  unable to resolve <name> as a column or row expression
// INDEX:   
// RELEASE: 8.0
// CAUSE:   You have a reference to a name that could not be resolved as
//          a column or row expression.  This occurred in an
//          update or insert statement involving an object-table.
// ACTION:  If this is an update statement and you intended to code this
//          as a column reference, fix it as such.  If you intended to
//          code this as a row expression, change this to refer to an
//          alias of an object-table.
//
339, 0, "\"%s\" matches object-table without a REF or VALUE modifier"
// MANUAL:  <name> matches object-table without a REF or VALUE modifier
// INDEX:   
// RELEASE: 8.0
// CAUSE:   You have an object-table name appearing without a REF or VALUE
//          modifier.
// ACTION:  If you intended to code this with a REF or VALUE modifier,
//          add the modifier; if you intended to code this as a column
//          reference, change the reference appropriately; otherwise,
//          remove the reference.
//
341, 0, "declaration of cursor '%s' is incomplete or malformed"
// MANUAL: declaration of cursor '<MI>name<D>' is incomplete or malformed
// INDEX:
// RELEASE: 
// =G=> I wasn't able to produce this error or to write QA for it.  Called in
//      ph2imn.c.     
// =K=> I made it come back again.
// CAUSE: A cursor declaration is improper or an identifier referenced in
//   the cursor declaration was not properly declared. A return type that does 
//   not refer to an existing database table or a previously declared cursor 
//   or cursor variable might have been specified. For example, the 
//   following cursor declaration is illegal because c1 is not yet fully 
//   defined:     
//   CURSOR c1 RETURN c1%ROWTYPE IS SELECT ...  -- illegal     
//   In this case, a return type does not have to be specified because it is 
//   implicit.
// ACTION: Check the spelling and declaration of the cursor name and any 
//   identifiers referenced in the cursor declaration. Also confirm that the 
//   declaration is placed correctly in the block structure. If a return 
//   type was specified, make sure that it refers to an existing database 
//   table or a previously declared cursor or cursor variable.
//
351, 0, "Not logged onto database '%s'"
// MANUAL: Not logged onto database '<NAME>'
// INDEX:
// RELEASE:
// CAUSE: An attempt was made to access an Oracle database without being 
//  logged on. Probably, an invalid username or password was entered.
// ACTION: Log on to Oracle with a correctly spelled username and password 
//  before trying to access the database.
//
352, 0, "Unable to access another database '%s'"
// MANUAL: Unable to access another database '<NAME>'
// INDEX:
// RELEASE: 
// CAUSE: An attempt was made to reference an object in a database other
//   than the current local or remote Oracle database.
// ACTION: Correct the reference and make sure the object is in the 
//  current Oracle database.
//
353, 0, "'%s' must name a user in the database"
// MANUAL: '<MI>name<D>' must name a user in the database
//
// =KMR=>	If schema is the same as 'user', why use 'schema'?  Change 
//      the word 'schema' to the word 'user'.  If they two are not identical, 
//      then state the difference.
// =G=> "schema" is the word that ANSI uses.
// INDEX:
// RELEASE: 
// CAUSE: This error occurs when the username was misspelled or when the
//   user does not exist in the database. 
// ACTION:Check the spelling of the username and make sure the user exists.
//
354, 0, "username must be a simple identifier"
// MANUAL: username must be a simple identifier
// INDEX:  qualified name
// RELEASE: 
// CAUSE: A qualified username such as scott.accts is not permitted in 
//  this context.
// ACTION:Specify a simple username such as scott instead.
//
355, 0, "use of pl/sql table not allowed in this context"
// MANUAL: use of pl/sql table not allowed in this context"
// INDEX:
// RELEASE:
// CAUSE: A PL/SQL table was referenced in the wrong context 
//  (for example, with a remote link).
// ACTION:Remove the PL/SQL table reference or change the context.
356, 0, "'%s' must name a table to which the user has access"
// MANUAL: '<MI>name<D>' must name a table to which the user has access
// INDEX:
// RELEASE: 
// CAUSE: The named table is not accessible to the user. This error occurs
//        when the table name or username was misspelled, the table and/or
//        user does not exist in the database, the user was not granted the
//        necessary privileges, or the table name duplicates the name of a
//        local variable or loop counter.
// ACTION: Check the spelling of the table name and username. Also confirm
//        that the table and user exist, the user has the necessary
//        privileges, and the table name does not duplicate the name of a
//        local variable or loop counter.
//
357, 0, "Table,View Or Sequence reference '%s' not allowed in this context"
// MANUAL: Table,View Or Sequence reference '<NAME>' not allowed in this
//         context
// INDEX:
// RELEASE: 
// CAUSE: A reference to database table, view, or sequence was found in an 
//  inappropriate context. Such references can appear only in SQL statements
//  or (excluding sequences) in %TYPE and %ROWTYPE declarations. Some valid
//  examples follow:    
//  SELECT ename, emp.deptno, dname INTO my_ename, my_deptno, my_dept
//      .FROM emp, dept WHERE emp.deptno = dept.deptno;  
//  DECLARE
//        last_name  emp.ename%TYPE;
//         dept_rec   dept%ROWTYPE;
// ACTION: Remove or relocate the illegal reference.
//
358, 0, "column '%s' exists in more than one table; use qualifier"
// MANUAL: column '<MI>name<D>' exists in more than one table; use qualifier
// INDEX:	"qualifier"
// RELEASE: 
// CAUSE: The statement is ambiguous because it specifies two or more tables
//  having the same column name. For example, the following statement is 
//  ambiguous because deptno is a column in both tables:     
//  SELECT deptno, loc INTO my_deptno, my_loc FROM emp, dept;
// ACTION: Precede the column name with the table name (as in emp.deptno) so 
//  that the column reference is unambiguous.
//
359, 0, "assignment target in '%s' must have components"
// MANUAL: assignment target in '<MI>str<D>' must have components
// INDEX:
// RELEASE: 
// =G=> I couldn't produce this bug in a test file.  It seems to have
// been subsumed by other bugs (385 and 394).
// CAUSE: An assignment target was declared that lacks the components needed 
//  to store the assigned values. For example, this error occurs if you try to 
//  assign a row of column values to a variable instead of a record, as 
//  follows:     
//  DECLARE
//          dept_rec  dept%ROWTYPE;
//          my_deptno dept.deptno%TYPE;
//          ...     
//  BEGIN
//          SELECT deptno, dname, loc INTO my_deptno  -- invalid
//             FROM dept WHERE ...
// ACTION:Check the spelling of the names of the assignment target and all 
//  its components. Make sure the assignment target is declared with the 
//  required components and that the declaration is placed correctly in the 
//  block structure.
//
360, 0, "cursor declaration without body needs return type"
// MANUAL: cursor declaration without body needs return type
// INDEX:
// RELEASE: 
// =KMR=>	Not sure what this means, tho' I can guess.  Anyway, seems
//  	like it ain't in release 1.0.
// =PJ=> This one is included.  See "cause" below.  See jem$:sqls_expr_021.pls
//      if you want to see a file which generates this error.
// CAUSE: A cursor declaration lacks either a body (SELECT statement) or a 
//  return type. If you want to separate a cursor specification from its body,
//  a return type must be supplied, as in     
//  CURSOR c1 RETURN emp%ROWTYPE;
// ACTION: Add a SELECT statement or return type to the cursor declaration.
//
361, 0, "IN cursor '%s' cannot be OPEN'ed"
// MANUAL: an IN cursor cannot be OPEN'ed
// INDEX:
// RELEASE: 
// CAUSE: A cursor parameter with mode IN cannot be modified, and
//        therefore cannot be opened. 
// ACTION: Change the cursor parameter to be IN OUT or OUT
//
362, 0, "invalid cursor return type; '%s' must be a record type"
// MANUAL: The return type of a cursor or ref-cursor-type must be a record
//         type.
// INDEX: "cursor return type"
// RELEASE:
// CAUSE: In a cursor specification or REF CURSOR type definition, a non-
//  record type such as NUMBER or TABLE was specified as the return type. This 
//  is not allowed. Only the following return types are allowed:      
//  <record_type_name>     
//  <record_name>%TYPE     
//  <table_name>%ROWTYPE     
//  <cursor_name>%ROWTYPE     
//  <cursor_variable_name>%ROWTYTPE
// ACTION:Revise the cursor specification or REF CURSOR type definition so 
//  that it specifies one of the above return types.
//
363, 10, "expression '%s' cannot be used as an assignment target"
// MANUAL: expression '<MI>str<D>' cannot be used as an assignment target
// INDEX:	"assignment target"
// RELEASE: 
// CAUSE: A literal, constant, IN parameter, loop counter, or function call
//   was mistakenly used as the target of an assignment. For example, the
//   following statement is illegal because the assignment target, 30, is a
//   literal:     
//     SELECT deptno INTO 30 FROM dept WHERE ...  -- illegal
// ACTION:Correct the statement by using a valid assignment target.
//
364, 0, "loop index variable '%s' use is invalid"
// MANUAL: loop index variable '<MI>name<D>' usage is invalid
// INDEX:  "range"
// RELEASE: 
// CAUSE: A reference to a loop counter was found in an inappropriate context. 
//  For example, the following statement is illegal because the loop counter  
// is used as the terminal value in its own range expression: 
// FOR j IN 1 .. j LOOP ...  -- illegal
//
// ACTION: Change the loop range expression so that it does not reference  
// the loop counter. If you want to refer in the range expression to another  
// variable with the same name as the loop counter, change either name or  
// qualify  
// the variable name with a label.
//
/ OUT parameters are now readable
/ 365, 0, "'%s' is an OUT parameter and cannot be read"
/ MANUAL: expression '<MI>str<D>' cannot be used for reading 
/ INDEX:	"OUT parameters"
/ RELEASE: 
/ CAUSE: An attempt was made to assign the value of an OUT parameter to 
/  another parameter or variable. Inside a procedure, an OUT parameter acts 
/  like an uninitialized variable; therefore, its value cannot be read. For 
/  example, the following assignments are illegal:     
/  PROCEDURE calc_bonus (bonus OUT REAL, ...) IS        
/         rating  REAL; 
/         wages   REAL;    
/   BEGIN 
/         ... 
/         IF rating > 90 THEN
/             bonus := bonus * 2;  -- illegal 
/             SELECT sal + bonus INTO wages FROM emp ...  -- illegal
/             ...
/          END IF;
/          ...     
/  END calc_bonus;
/  
/ ACTION:Use an IN OUT parameter instead of the OUT parameter. Inside a 
/  procedure, an IN OUT parameter acts like an initialized variable; 
/  therefore, its value can be read.
/
366, 0, "subtype of a NOT NULL type must also be NOT NULL"
// MANUAL: subtype of a NOT NULL type must also be NOT NULL
// INDEX:
// RELEASE: Not in release 1.0.
// CAUSE: After a subtype was defined as NOT NULL, it was used as the base
//   type for another subtype defined as NULL. That is not allowed. For 
//   example, the code might look like     
//   DECLARE
//           SUBTYPE Weekday IS INTEGER NOT NULL;
//            SUBTYPE Weekend IS Weekday NULL;  -- illegal     
//   instead of    
//   DECLARE
//           SUBTYPE Weekday IS INTEGER NOT NULL;
//            SUBTYPE Weekend IS Weekday;
// ACTION: Revise the subtype definitions to eliminate the conflict.
//
367, 0, "a RAISE statement with no exception name must be inside an exception handler"
// MANUAL: a RAISE statement with no exception name must be inside an
//  exception handler
// INDEX:
// RELEASE: 
// CAUSE: A RAISE statement not followed by an exception name was 
//  found outside an exception handler
// ACTION:Delete the RAISE statement, relocate it to an exception handler,
//  or supply the missing exception name.
//
368, 0, "in RAISE statement, '%s' must be an exception name"
// MANUAL: "in RAISE statement, '<MI>name<D>' must be an exception name
// INDEX:
// RELEASE: 
// CAUSE: The identifier in a RAISE statement is not a valid exception name.
// ACTION: Make sure the identifier in the RAISE statement was declared as
//   an exception and is correctly placed in the block structure. If you are 
//   using the name of a PL/SQL predefined exception, check its spelling.
//
369, 0, "no choices may appear with choice OTHERS in an exception handler"
// MANUAL: no choices may appear with choice OTHERS in an exception handler
// INDEX:  "OTHERS"
// RELEASE: 
// CAUSE: A construct of the form     
//       WHEN excep1 OR OTHERS =>    
//   was encountered in the definition of an exception handler. The OTHERS 
//   handler must appear by itself as the last exception handler in a block.
// ACTION:  Remove the identifier that appears with OTHERS or write a separate 
//   exception handler for that identifier.  
//
370, 0, "OTHERS handler must be last among the exception handlers of a block"
// MANUAL: OTHERS handler must be last among the exception handlers of a block
// INDEX:
// RELEASE: 
// CAUSE: One or more exception handlers appear after an OTHERS handler. 
// However, the OTHERS handler must be the last handler in a block or 
// subprogram because it acts as the handler for all exceptions not named 
// specifically.
// ACTION: Move the OTHERS handler so that it follows all specific exception 
// handlers.  
//
371, 0, "at most one declaration for '%s' is permitted"
// MANUAL: at most one declaration for '<MI>name<D>' is permitted
// INDEX:
// RELEASE: 
// CAUSE: A reference to an identifier was ambiguous because there were 
// multiple declarations for the identifier.  At most one local variable with a
// given identifier is permitted in the declarative part of a block, procedure,
// or function.  At most one label with a given identifier may appear in a
// block.  
// ACTION: Check the spelling of the identifier. If necessary, remove all 
// but one declaration of the identifier.
//
372, 0, "In a procedure, RETURN statement cannot contain an expression"
// MANUAL: In a procedure, RETURN statement cannot contain an expression
// INDEX:
// =KMR=>	The RETURN statement isn't documented.  Not in release 1.0
// RELEASE: 
// CAUSE: In a procedure, a RETURN statement contains an expression, which 
// is not allowed. In functions, a RETURN statement must contain an expression 
// because its value is assigned to the function identifier. However, in 
// procedures, a RETURN statement simply lets you exit before the normal end 
// of the procedure is reached.
// ACTION: Remove the expression from the RETURN statement, or redefine the 
// procedure as a function.
//
373, 0, "EXIT/CONTINUE label '%s' must label a LOOP statement"
// MANUAL: EXIT/CONTINUE label '<MI>name<D>' must label a LOOP statement
// INDEX:
// RELEASE: 
// CAUSE: The label in the EXIT or CONTINUE statement did not refer to a LOOP
// statement. An EXIT or CONTINUE statement need not specify a label. However,
// if a label is specified (as in EXIT my_label or CONTINUE my_label), it must
// refer to a LOOP statement. 
// ACTION: Make sure the label name is spelled correctly and that it refers to 
// a LOOP statement.
//
374, 0, "illegal EXIT/CONTINUE statement; must appear inside the loop labeled '%s'"
// MANUAL: illegal EXIT/CONTINUE statement; must appear inside loop labeled '<MI>name<D>'
// INDEX:
// RELEASE: 
// CAUSE: The label in the EXIT or CONTINUE statement did not refer to a loop
// statement. An EXIT or CONTINUE statement need not specify a label. However,
// if a label is specified (as in EXIT my_label or CONTINUE my_label), the EXIT
// or CONTINUE statement must be inside the LOOP statement designated by that
// label.
// ACTION: Make sure the label name is spelled correctly; if necessary, move 
// the EXIT or CONTINUE statement inside the LOOP statement to which the label
// refers.
//
375, 0, "illegal GOTO statement; this GOTO cannot branch to label '%s'"
// MANUAL: illegal GOTO statement; this GOTO cannot branch to label '<MI>name<D>'
// INDEX:
// RELEASE: 
// CAUSE: The line and column numbers accompanying the error message refer 
// to a GOTO that branches from outside a construct (a loop or exception 
// handler, for example) that contains a sequence of statements to a label 
// inside that sequence of statements. Such a branch is not allowed.
// ACTION:Either move the GOTO statement inside the sequence of statements 
// or move the labeled statement outside the sequence of statements.
//
376, 0, "illegal EXIT/CONTINUE statement; it must appear inside a loop"
// MANUAL: illegal EXIT/CONTINUE statement; it must appear inside a loop
// INDEX:
// RELEASE: 
// CAUSE: An EXIT or CONTINUE statement was found outside of a loop construct.
// The EXIT statement is used to exit prematurely from a loop and the CONTINUE
// statement is used to begin the next iteration of a loop; each must always
// appear within a loop.
// ACTION: Either remove the EXIT or CONTINUE statement or place it inside
// a loop.
//
377, 0, "internal type PLS_INTEGER is not included in this release of PL/SQL"
// MANUAL: internal type PLS_INTEGER is not included in this release of PL/SQL
// INDEX:
// RELEASE: 
// CAUSE: The type-name INTEGER was used in a declaration.
// ACTION:
//
378, 0, "invalid compilation unit for this release of PL/SQL"
// MANUAL: invalid compilation unit for this release of PL/SQL
// INDEX: "compilation unit"
// RELEASE: 
// CAUSE: A compilation unit is a file containing PL/SQL source code that is 
// passed to the compiler. Only compilation units containing blocks, 
// declarations, statements, and subprograms are allowed. This error occurs 
// when some other language construct is passed to the compiler.
// ACTION:Make sure the compilation unit contains only blocks, declarations, 
// statements, and subprograms.
//
379, 0, "CASE statements are not included in this release of PL/SQL"
// MANUAL: CASE statements are not included in this release of PL/SQL
// INDEX:
// RELEASE: 
// CAUSE: The unit being compiled contains a CASE statement. However, the 
// current release of PL/SQL does not support CASE statements.
// ACTION:Remove the CASE statement from the compilation unit.
//
380, 0, "functions and procedures are not included in this release of PL/SQL"
// MANUAL: functions and procedures are not included in this release of PL/SQL
// INDEX:
// RELEASE:
// CAUSE:  The program being compiled contains a declaration of a FUNCTION
//         or PROCEDURE.
// ACTION:
//
381, 0, "type mismatch found at '%s' between column and variable in subquery or INSERT"
// MANUAL: type mismatch found at '<MI>name<D>' between column and variable in 
// subquery or INSERT
// INDEX:
// RELEASE: 
// CAUSE: The datatypes of a column and a variable do not match. The 
// variable was encountered in a subquery or INSERT statement.
// ACTION: Change the variable datatype to match that of the column.
//
382, 0, "expression is of wrong type"
// MANUAL: expression is of wrong type
// INDEX:
// RELEASE: 
// CAUSE: An expression has the wrong datatype for the context in which it was 
// found.
// ACTION: Change the datatype of the expression. You might want to use 
// datatype conversion functions.
//
383, 0, "type mismatch found at '%s' inside an IN or NOT IN clause"
// MANUAL: type mismatch found at '<MI>name<D>' inside an IN or NOT IN clause
// INDEX:
// RELEASE: 
// CAUSE: In a test for set membership such as X NOT IN (SELECT Y ... ), the 
// expressions X and Y do not match in datatype, and it is unclear which 
// implicit conversion is required to correct the mismatch.
// ACTION: Change the expressions so that their datatypes match. You might 
// want to use datatype conversion functions in the select list.
//
384, 0, "type mismatch found at '%s' in UPDATE's SET clause"
// MANUAL: type mismatch found at '<MI>name<D>' in UPDATE's SET clause
// INDEX:
// RELEASE: 
// CAUSE: The column to the left of the equal sign in the SET clause of an 
// UPDATE statement does not match in datatype with the column, expression, or 
// subquery to the right of the equal sign, and it is unclear which implicit 
// conversion is required to correct the mismatch.
// ACTION: Change the expressions so that their datatypes match. You might 
// want to use datatype conversion functions in the SET clause.
//
385, 0, "type mismatch found at '%s' in SELECT...INTO statement"
// MANUAL: type mismatch found at '<MI>name<D>' in SELECT...INTO statement
// INDEX:
// RELEASE: 
// CAUSE: The expressions to the left and right of the INTO clause in a 
// SELECT...INTO statement do not match in datatype, and it is unclear which 
// implicit conversion is required to correct the mismatch.
// ACTION: Change the expressions so that their datatypes match. You might 
// want to use datatype conversion functions in the select list.
//
386, 0, "type mismatch found at '%s' between FETCH cursor and INTO variables"
// MANUAL: type mismatch found at '<MI>name<D>' between FETCH cursor and 
// INTO variables
// INDEX:
// RELEASE: 
// CAUSE: An assignment target in the INTO list of a FETCH statement does 
// not match in datatype with the corresponding column in the select list of 
// the cursor declaration, and it is unclear which implicit conversion is 
// required to correct the mismatch.
// ACTION: Change the cursor declaration or change the datatype of the 
// assignment target. You might want to use datatype conversion functions in 
// the select list of the query associated with the cursor.
//
387, 0, "INTO variable cannot be a database object"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: An item in the INTO list of a FETCH or SELECT statement was found to 
// be a database object. INTO introduces a list of user-defined variables to 
// which output values are assigned. Therefore, database objects cannot appear 
// in the INTO list.
// ACTION: Check the spelling of the INTO list item. If necessary, remove 
// the item from the INTO list or replace it with a user-defined output 
// variable.
//
388, 0, "undefined column '%s' in subquery"
// MANUAL: undefined column '<MI>name<D>' in subquery
// INDEX:
// RELEASE: 
// CAUSE: A subquery contains a column name that was not defined in the 
//        specified table.
// ACTION: Change the expression to specify a column that was defined.
//
389, 0, "table, view or alias name \"%s\" not allowed in this context"
// MANUAL: table, view or alias name <name> not allowed in this context
// INDEX:
// RELEASE:
// CAUSE:  A table, view or alias name <name> corresponding to a regular
//         (non-object) table appeared in an inappropriate context.
// ACTION: Remove the reference, or, if you intended to code this as a
//         column reference, fix it as such.
//
390, 0, "undefined column '%s' in INSERT statement"
// MANUAL: undefined column '<MI>name<D>' in INSERT statement
// INDEX:
// RELEASE: 
// CAUSE: Check the spelling of the column name, then change the expression so 
// that it refers only to defined columns.
// ACTION: Check the spelling of the column name, then change the expression 
// so that it refers only to defined columns.
//
391, 0, "undefined column '%s' in UPDATE statement"
// MANUAL: undefined column '<MI>name<D>' in UPDATE statement
// INDEX:
// RELEASE: 
// CAUSE: An UPDATE statement refers to a column not defined for the table 
// or view being updated.
// ACTION: Check the spelling of the column name, then revise the statement so 
// that it refers only to defined columns.
//
392, 0, "Type mismatch in arguments to BETWEEN"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: In a comparison such as X BETWEEN Y AND Z, the expressions X, Y, and 
// Z do not match in datatype, and it is unclear which implicit conversion 
// is required to correct the mismatch.
// ACTION: Change the expressions so that their datatypes match. You might 
// want to use datatype conversion functions.
//
393, 0, "wrong number of columns in SELECT...INTO statement"
// MANUAL: wrong number of columns in SELECT...INTO statement
// INDEX:
// RELEASE: 
// CAUSE: The number of columns selected by a SELECT...INTO statement does not 
// match the number of variables in the INTO clause.
// ACTION: Change the number of columns in the select list or the number of 
// variables in the INTO clause so that the numbers match.
//
394, 0, "wrong number of values in the INTO list of a FETCH statement"
// MANUAL: wrong number of values in the INTO list of a FETCH statement
// INDEX:
// RELEASE: 
// CAUSE: The number of variables in the INTO clause of a FETCH statement does 
// not match the number of columns in the cursor declaration.
// ACTION: Change the number of variables in the INTO clause or the number 
// of columns in the cursor declaration so that the numbers match.
//
395, 0, "wrong number of values in VALUES clause of INSERT statement"
// MANUAL: wrong number of values in VALUES clause of INSERT statement
// INDEX:
// RELEASE: 
// CAUSE: The number of columns in an INSERT statement does not match the 
// number of values in the VALUES clause. For example, the following statement 
// is faulty because no column is specified for the value 20:     
// INSERT INTO emp (empno, ename) VALUES (7788, 'SCOTT', 20);
// ACTION: Change the number of items in the column list or the number of 
// items in the VALUES list so that the numbers match.
//
396, 0, "INSERT statement's subquery yields wrong number of columns"
// MANUAL: INSERT statement's subquery yields wrong number of columns
// INDEX:
// RELEASE: 
// CAUSE: The number of columns in an INSERT statement does not match the 
// number of columns in a subquery select list. For example, the following 
// statement is faulty because no corresponding column is specified for col3:
// INSERT INTO emp (ename, empno) SELECT col1, col2, col3 FROM ...
//    ACTION: Change the column list of the INSERT or subquery so they are the
//    same length.
// ACTION: Change the number of items in the column list of the INSERT 
// statement or the number of items in the select list so that the numbers
// match.
//
397, 0, "Type mismatch in arguments to IN"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: In a test for set membership such as X IN (Y, Z), the expressions X, 
// Y, and Z do not match in datatype, and it is unclear which implicit 
// conversion is required to correct the mismatch.
// ACTION: Change the expressions so that their datatypes match. You might 
// want to use datatype conversion functions.
//
398, 0, "wrong number of columns in UNION, INTERSECT, or MINUS expression"
// MANUAL: wrong number of columns in UNION, INTERSECT, or MINUS expression
// INDEX:
// RELEASE: 
// CAUSE: The SELECT clauses to the left and right of a UNION, INTERSECT, or 
// MINUS expression do not select the same number of columns. For example, the 
// following statement is faulty because the select lists do not contain the 
// same number of items:    
//  CURSOR my_cur IS SELECT ename FROM emp
//         INTERSECT SELECT ename, empno FROM emp;
// ACTION: Change the select lists so that they contain the same number of 
// items.
//
399, 0, "different types of columns in UNION, INTERSECT, or MINUS expression"
// MANUAL: different types of columns in UNION, INTERSECT, or MINUS expression
// INDEX:
// RELEASE: 
// CAUSE: The select lists to the left and right of a UNION, INTERSECT, or 
// MINUS expression select at least one column that is mismatched in datatype. 
// For example, the following statement is faulty because the constant 3 has 
// datatype NUMBER, whereas SYSDATE has datatype DATE:     
// CURSOR my_cur IS SELECT 3 FROM emp 
//        INTERSECT SELECT SYSDATE FROM emp;
// ACTION: Change the select lists so that they match in datatype. You might 
// want to use datatype conversion functions in the select list of one or more 
// queries.
//
400, 0, "different number of columns between cursor SELECT statement and return value"
// MANUAL: different number of columns between cursor SELECT statement and return value
// INDEX:
// RELEASE: 
// CAUSE: In a cursor declaration, a return type (such as RETURN 
// emp%ROWTYPE) was specified, but the number of returned column values does 
// not match the number of select-list items.
// ACTION: Change the cursor return type or the select list so that the number 
// of returned column values matches the number of select-list items.
//
401, 0, "different column types between cursor SELECT statement and return value found at '%s'"
// MANUAL: different column types between cursor SELECT statement and return value found at '<MI>name<D>'
// INDEX:
// RELEASE: 
// CAUSE: In a cursor declaration, a return type (such as RETURN 
// emp%ROWTYPE) was specified, but a returned column value and its 
// corresponding select-list item have different datatypes.
// ACTION: Change the cursor return type or the select list so that each 
// returned column value and its corresponding select-list item have the 
// same datatype.
//
402, 0, "alias required in SELECT list of cursor to avoid duplicate column names"
// MANUAL: alias required in SELECT list of cursor to avoid duplicate column names
// INDEX:	
// RELEASE: 
// CAUSE: A cursor was declared with a SELECT statement that contains 
// duplicate column names. Such references are ambiguous.
// ACTION: Replace the duplicate column name in the select list with an alias.
//
403, 0, "expression '%s' cannot be used as an INTO-target of a SELECT/FETCH statement"
// MANUAL: INTO list of SELECT/FETCH statement contains illegal assignment target
// INDEX:
// RELEASE: 
// CAUSE: A FETCH statement was unable to assign a value to an assignment 
// target in its INTO list because the target is not a legally formed and 
// declared variable. For example, the following assignment is illegal because 
// 'Jones' is a character string, not a variable:      
// FETCH my_cur INTO 'Jones';
// ACTION:Check the spelling and declaration of the assignment target. Make 
// sure that the rules for forming variable names are followed.
//
404, 0, "cursor '%s' must be declared with FOR UPDATE to use with CURRENT OF"
// MANUAL: cursor '<MI>name<D>' must be declared with FOR UPDATE to use with CURRENT OF
// INDEX:
// RELEASE: 
// CAUSE: The use of the CURRENT OF cursor_name clause is legal only if 
// cursor_name was declared with a FOR UPDATE clause.
// ACTION: Add a FOR UPDATE clause to the definition of the cursor or do not 
// use the CURRENT OF cursor_name clause.
//
405, 0, "subquery not allowed in this context"
// MANUAL:
// INDEX:
// RELEASE: 1.0.27
// CAUSE: A subquery was used in an inappropriate context, such as:     
//  if (SELECT deptno FROM emp WHERE ... ) = 20 then ...     
// Subqueries are allowed only in SQL statements.
// ACTION: The same result can be obtained by using a temporary variable, as 
// in:     
// SELECT deptno INTO temp_var FROM emp WHERE ...;     
// IF temp_var = 20 THEN ...
//
406, 0, "length of SELECT list in subquery must match number of assignment targets"
// MANUAL: length of SELECT list in subquery must match number of assignment targets
// INDEX:
// RELEASE: 
// CAUSE: A query select list is not the same length as the list of targets 
// that will receive the returned values. For example, the following statement 
// is faulty because the subquery returns two values for one target:     
// UPDATE emp SET ename =
//        (SELECT ename, empno FROM emp WHERE ename = 'SMITH') ...
// ACTION: Change one of the lists so that they contain the same number of 
// items.
//
407, 0, "'*' not allowed here; a list of columns is required"
// MANUAL: '*' not allowed here; a list of columns is required
// INDEX:
// RELEASE: NOT IN 1.0.11
// CAUSE: An asterisk (*) was used as an abbreviation for a list of column 
// names. However, in this context the column names must be written out 
// explicitly.
// ACTION:Replace the asterisk with a list of column names.
//
408, 0, "duplicate column '%s' not permitted in INSERT or UPDATE"
// MANUAL: duplicate column '<MI>name<D>' not permitted in INSERT or UPDATE
// INDEX:	"alias", "qualifier"
// RELEASE: 
// CAUSE: An UPDATE or INSERT statement has a column list that contains 
// duplicate column names.
// ACTION: Check the spelling of the column names, then eliminate the 
// duplication.
//
409, 0, "duplicate variable '%s' in INTO list is not permitted"
// MANUAL: duplicate variable '<MI>name<D>' in INTO list is not permitted
// INDEX:
// RELEASE: 
// CAUSE: The same variable appears twice in the INTO list of a SELECT or 
// FETCH statement.
// ACTION: Remove one of the variables from the INTO list.
//
410, 0, "duplicate fields in RECORD,TABLE or argument list are not permitted"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: When a user-defined record was declared, the same name was given 
// to two fields. Like column names in a database table, field names in a 
// user-defined record must be unique.
// ACTION: Check the spelling of the field names, then remove the duplicate.
//
411, 0, "Number of values in aggregate and in subquery don't match"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: In a statement of the form aggregate = subquery, the numbers of 
// values in the aggregate and subquery are unequal. For example, the code 
// might look like    
//  ... WHERE (10,20,30) = (SELECT empno,deptno FROM emp WHERE...);
// ACTION: Revise the aggregate or subquery so that the numbers of values 
// match.
//
412, 0, "list of values not allowed as argument to this function or procedure"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: A parenthesized list of values separated by commas (that is, an 
// aggregate) was used in the wrong context. For example, the following 
// usage is invalid:
//  WHERE (col1, col2) > (SELECT col3, col4 FROM my_table ...)     
// However, an equal sign can take a list of values and a subquery as left- 
// and right-hand-side arguments, respectively. So, the following usage is 
// valid:      
// WHERE (col1, col2) = (SELECT col3, col4 FROM my_table ...)
// ACTION: Rewrite the expression. For example, the clause     
// WHERE (col1, col2) > (SELECT col3, col4 FROM my_table ...)     
// can be rewritten as     
// WHERE col1 > (SELECT col3 FROM my_table ...) AND
//         col2 > (SELECT col4 FROM my_table ...)
//
413, 0, "identifier in CURRENT OF clause is not a cursor name"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: The identifier in a CURRENT OF clause names an object other than a 
// cursor.  
// ACTION: Check the spelling of the identifier. Make sure that it names the 
// cursor in the DELETE or UPDATE statement and that it names the cursor 
// itself, not a FOR-loop variable.
//
414, 0, "no column '%s' in table"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: A table name or alias was used to qualify a column reference, but 
// the column was not found in that table. Either the column was never defined 
// or the column name is misspelled.
// ACTION: Confirm that the column was defined and check the spelling of the 
// column name.
//
415, 0, "'%s' is an OUT parameter and cannot appear in a function"
// MANUAL: functions cannot have OUT or IN-OUT parameters.
// INDEX:	"OUT parameters"
// RELEASE: 
// CAUSE: An OUT or IN OUT formal parameter was used in a function 
// specification.
// ACTION:
//
416, 0, "The third argument of DECODE cannot be NULL"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: The third argument of DECODE is NULL.
// ACTION: Enter an argument with a proper type and value.
//
417, 0, "unable to resolve \"%s\" as a column"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: A database table, view, or column was specified in a SQL statement 
// that does not exist, or the privileges required to access the table or view 
// were not granted.
// ACTION: Check the spelling of the table (or view) and column names; make 
// sure the table and columns exist. If necessary, ask the DBA to grant the 
// privileges required to access the table.
//
418, 0, "array bind type must match PL/SQL table row type"
// MANUAL: 
// INDEX:
// RELEASE: 7.0
// CAUSE: A host array was passed (by an Oracle Precompiler program, for 
// example) to a PL/SQL subprogram for binding to a PL/SQL table parameter. 
// However, the datatypes of the array elements and PL/SQL table rows are 
// incompatible. So, the binding failed.
// ACTION: Change the datatype of the array elements or PL/SQL table rows to 
// make the datatypes compatible.
//
419, 0, "reference to remote attribute not permitted"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: An attempt was made to reference a remote cursor attribute, which is 
// not allowed. For example, the code might look like     
// IF SQL%NOTFOUND@newyork THEN ...
// ACTION: Do not try to reference a remote cursor attribute.
//
420, 0, "can't call builtin routines remotely"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: An attempt was made to call a built-in PL/SQL function remotely, 
// which is not allowed. For example, the code might look like     
// my_sqlerrm := SQLERRM@newyork;     
// or     
// INSERT INTO emp VALUES (my_empno, STANDARD.RTRIM@newyork(my_ename), ...);  
// ACTION: Always call built-in functions locally; never specify a database 
// link.
//
421, 0, "circular synonym '%s'"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: Directly or indirectly, a synonym was defined in terms of itself, 
// creating a circular definition.
// ACTION: Redefine the synonyms to eliminate the circular definition.
//
422, 0, "no PL/SQL translation for the bindtype given for this bind variable"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: A host variable was passed (by an Oracle Precompiler program, for 
// example) to PL/SQL for binding. However, its datatype is not compatible 
// with any PL/SQL datatype. So, the binding failed.
// ACTION: Change the datatype of the host variable to make it compatible with 
// a PL/SQL datatype.
//
423, 0, "ORDER BY item must be the number of a SELECT-list expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: A column alias was used in the ORDER BY clause of a SELECT statement 
// that uses a UNION, INTERSECT, or MINUS set operator. This is not allowed. 
// In such cases, expressions in the ORDER BY clause must be unsigned integers 
// that designate the ordinal positions of select-list items.
// ACTION: Change the alias in the ORDER BY clause to an unsigned integer that 
// designates the ordinal position of the select item in question.
//
424, 0, "RPC defaults cannot include Package State"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: An attempt was made to call a remote subprogram whose defaulted 
// parameters depend on package state, which is not allowed. When calling 
// remote subprograms, the actual parameters must be passed explicitly if 
// the corresponding formal parameters depend on package state.
// ACTION:  Call the remote subprogram by passing each actual parameter 
// explicitly.
425, 0, "in SQL, function argument and return types must be SQL type" 
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: When a stored function was called from a SQL statement, parameters 
// of the wrong type were passed. To be callable from SQL statements, a stored 
// function must meet several requirements, one of which is that its arguments 
// have SQL datatypes such as CHAR, DATE, or NUMBER. None of the arguments can 
// have non-SQL types such as BOOLEAN, TABLE, or RECORD.
// ACTION:Make sure all the arguments in the function call have SQL datatypes.
//
/ With OUT readability, this error message no longer makes sense
/ 426, 0, "cursor variable OUT parameter '%s' cannot be FETCH'ed or CLOSE'd"
/ MANUAL: 
/ INDEX: 
/ RELEASE: 
/ CAUSE: When a cursor variable was declared as the formal parameter of a 
/ subprogram that will FETCH from and/or CLOSE the cursor variable, the OUT 
/ parameter mode was specified. This is not allowed. In such cases, the IN or 
/ IN OUT mode must be specified.
/ ACTION:Change the parameter mode from OUT to IN or IN OUT.
/
427, 0, "RPC defaults cannot use builtins when versions of STANDARD differ"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: An attempt was made to call a remote subprogram whose defaulted 
// parameter value is calculated using a builtin operation.  If the
// calling system uses a different version of package STANDARD than does
// the called system, a defaulted expression must be either a simple numeric
// or string literal, NULL, or a direct call to a user-written function.
// ACTION:  Call the remote subprogram by passing each actual parameter 
// value explicitly.
428, 0, "an INTO clause is expected in this SELECT statement"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:The INTO clause of a SELECT INTO statement was omitted. For 
// example, the code might look like     
//  SELECT deptno, dname, loc FROM dept WHERE ...    
//  instead of     
// SELECT deptno, dname, loc INTO dept_rec FROM dept WHERE ...     
// In PL/SQL, only a subquery is written without an INTO clause.
// ACTION: Add the required INTO clause.
//
429, 0, "unsupported feature with RETURNING clause"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE:
//   - INTO clause and RETURNING clause cannot be use in the same statement
//   - RETURNING clause is currently not supported for object type 
//     columns, LONG columns, records, %rowtypes, remote tables and INSERT 
//     with subquery.
//     This is as ORA-28815.
// ACTION: Use separate select statement to get the values.
//
430, 0, "FORALL iteration variable %s is not allowed in this context"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: FORALL iteration variable can only be used as a subscript. It
//        cannot be used directly or as a part of an expression.
// ACTION: Use FORALL variable only as a collection subscript.
//
431, 0, "bulk SQL attributes must use a single index"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: More than one index specified to access SQL bulk attribute.
// ACTION: Use a single index of integer datatype.
//
432, 0, "implementation restriction: cannot use FORALL and BULK COLLECT INTO together in SELECT statements"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: SELECT statement contains both the FORALL and BULK COLLECT INTO 
//        phrases.
// ACTION: Dn not use FORALL and BULK COLLECT INTO together in SELECT 
//         statements.
//
433, 0, "inconsistent package STANDARD" 
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: PL/SQL compiler could not find the entries (such as type declarations)
//        that should exist in the package STANDARD.
// ACTION: Make sure that the correct version of package STANDARD is available 
//  in the current Oracle database, then retry compilation.
//
434, 0, "record field has unsupported type: \"%s\""
// MANUAL: 
// INDEX: 
// RELEASE:  8.1
// CAUSE: An attempt was made to use an unsupported type for a record 
//        field.  In this release, the use of the SQL92 datetime types
//        (time, timestamp, time with time zone, timestamp with time zone,
//        interval year to month, interval day to second) are not supported
//        in record fields.
// ACTION:  Use only supported types for record fields.
//       
//
435, 0, "DML statement without BULK In-BIND cannot be used inside FORALL"
// MANUAL:
// INDEX:
// RELEASE: 8.1.6
// CAUSE: The DML (SELECT/INSERT/DELETE/UPDATE) statement inside the FORALL
//        statement does not contain BULK IN-BIND variables.
// ACTION:The DML (SELECT/INSERT/DELETE/UPDATE) statement inside the FORALL
//        statement must contain BULK IN-BIND variables.
//
436, 0, "implementation restriction: cannot reference fields of BULK In-BIND table of records or objects"
// MANUAL:
// INDEX:
// RELEASE: 8.1.6
// CAUSE: table(bulk_index).field is not supported at run-time. 
// ACTION:Use FOR loop with instead of the FORALL DML statement 
//        (MERGE/INSERT/DELETE/UPDATE).
//
437, 0, "FORALL bulk index cannot be used in %s clause"
// MANUAL:
// INDEX:
// RELEASE: 8.1.6
// CAUSE: RETURNING table(bulk_index) is not supported.
// ACTION:Use RETURNING BULK COLLECT instead
//
438, 0, "value in LIMIT clause: '%s' use is invalid"
// MANUAL: value in LIMIT clause '<MI>name<D>' usage is invalid
// INDEX:  "limit clause in bulk fetch"
// RELEASE: 
// CAUSE: The evaluation value in the LIMIT clause of a bulk fetch was 
//  found in an inappropriate context. 
//  For example, the following statement is illegal because the LIMIT
//  clause in a bulk fetch expects a numeric value.
//     FETCH c1 BULK COLLECT INTO var_tab LIMIT '22333'; -- illegal
//
// ACTION: Change the expression of the LIMIT clause so that the 
//  evaluation result is compatible to a numeric value.
439, 0, "A LIMIT clause must be used within a BULK FETCH"
// MANUAL: A LIMIT clause is only allowed within a BULK FETCH
// INDEX:  "limit clause in bulk fetch"
// RELEASE: 
// CAUSE: A LIMIT clause is used within a non-bulk fetch
// ACTION: Do not use a LIMIT clause when a non-bulk fetch is used.
//
440, 0, "FORALL bulk IN-bind variables cannot be used here"
// MANUAL:
// INDEX:
// RELEASE: 11.0.0.0.0
// CAUSE: A reference to a FORALL statement's bulk IN-bind variable was found in
//   a context in which it is not permitted.  For example, such variables are
//   not permitted in expressions in the USING clause of a dynamic SQL
//   statement: 
//       forall j in 1..Users.Count()
//         execute immediate '
//           insert into System_Users(Username)
//             values :U'
//           using Upper(Users(j));
// ACTION: In the case described above, move the expression from the USING
//   clause into the SQL statement: 
//       forall j in 1..Users.Count()
//         execute immediate '
//           insert into System_Users(Username)
//             values Upper(:U)'
//           using Users(j);
//
441, 0, "EXIT/CONTINUE statement may have a label here; '%s' is not a label"
// MANUAL: EXIT/CONTINUE statement may have a label here; <MI>name<D> is not a label
// INDEX:	
// RELEASE: 
// CAUSE: The specified name was not a label. An EXIT or CONTINUE statement
// does not require a label, but when the optional name appears, it must be a
// label.
// ACTION: Check the spelling of the name. Make sure that the name is the
// label of a loop in which the EXIT or CONTINUE statement is nested. If a
// label is not needed for this statement, delete the name.
//
442, 0, "CONTINUE statement may not have the prefix STANDARD"
// MANUAL: CONTINUE statement may not have the prefix STANDARD
// INDEX:	
// RELEASE: 
// CAUSE: The procedure CONTINUE appears in STANDARD but that procedure may
// not be called either with its name alone or with the prefix STANDARD. It
// exists only to help in analysis of the CONTINUE statement.
// ACTION: If a CONTINUE statement is intended, remove the prefix. If some
// other procedure was intended, check the spelling of the prefix and of the
// procedure name.
//
450, 0, "a variable of this private type cannot be declared here"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: A variable declaration uses a type that is declared PRIVATE in
//   some other compilation unit.
// ACTION: Do not use this type in a PRIVATE variable declaration.
//
452, 0, "Subprogram '%s' violates its associated pragma"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: A packaged function cannot be called from SQL statements unless 
// its purity level is asserted by coding a RESTRICT_REFERENCES pragma in 
// the package specification. The pragma, which is used to control side 
// effects, tells the PL/SQL compiler to deny the packaged function read/write 
// access to database tables, public packaged variables, or both. A SQL 
// statement that violates the pragma will cause a compilation error.
// ACTION: Raise the purity level of the function, or relax the pragma 
// restrictions.
//
453, 0, "remote operations not permitted on object tables or user-defined type columns"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: A reference to a remote object tables or user-defined type column
// was found.
// ACTION: Do not refer to it.
//
454, 0, "with a returning into clause, the table expression cannot be remote or a subquery"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: A reference to a remote table or subquery 
// was found in a sql statement with a returning into clause.
// ACTION: Do not refer to it, or do use a subsequent select statement.
//
455, 0, "cursor '%s' cannot be used in dynamic SQL OPEN statement"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE: dynamicly OPEN a REF CURSOR that has RETURN type.  However,
// only REF CURSOR without RETURN type can be OPEN'ed by an embebded
// dynamic OPEN statement.
// ACTION: define a REF CURSOR without return type, and use it in the statement.
456, 0, "item '%s' is not a cursor"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE: the given variable is not a cursor and therefore cannot be OPEN'ed
// or FETCH'ed from.
// ACTION: check the spelling and declaration for the given variable.
457, 0, "expressions have to be of SQL types"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE: an expression of wrong type is in USING or dynamic RETURNING clause.
//        In USING or dynamic RETURNING clause, an expression cannot be of
//        non-SQL types such as BOOLEAN, INDEX TABLE, and record.
// ACTION: change the expression type to a SQL type.
458, 0, "subprogram '%s' cannot be called from a REPEATABLE subprogram"
// MANUAL:  
// INDEX:
// RELEASE: 8.1
// CAUSE:   The subprogram is not REPEATABLE and cannot be called from a
//          REPEATABLE subprogram.
// ACTION:  delete the call or delete REPEATABLE.
459, 0, "this feature is not allowed in REPEATABLE subprogram"
// MANUAL:  
// INDEX:
// RELEASE: 8.1
// CAUSE:   Having one of the followings feature in the REPEATABLE subprogram:
// dynamic SQL statements or autonomous transaction.          
// ACTION:  delete the statements or delete REPEATABLE.
460, 0, "REPEATABLE subprogram '%s' has to be RNDS, WNDS, RNPS, and WNPS"
// MANUAL:  
// INDEX:
// RELEASE: 8.1
// CAUSE:   Repeatable subprogram can neither read database state (RNDS),
//          write database state (WNDS), read package state (RNPS), nor write
//          package state (WNPS).
// ACTION:  make the subprogram to be RNDS, WNDS, RNPS, and WNPS or delete
//          REPEATABLE
461, 0, "mismatch REPEATABLE information between specification and body of '%s'"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:   REPEATABLE is declared at the subprogram's specification, but not
//          at its body, or vice versa.
// ACTION:  make sure both specification and body are declared as REPEATABLE
462, 0, "nested subprogram '%s' has to be REPEATABLE"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:   the nested subprogram of a REPEATABLE subprogram is not declared
//          as REPEATABLE.  If a subprogram is REPEATABLE, all of its nested
//          subprograms has to be declared as REPEATABLE.
// ACTION:  declared the nested subprogram as REPEATABLE
483, 0, "exception '%s' may appear in at most one exception handler in this block"
// MANUAL: exception '<MI>name<D>' may appear in at most one exception handler 
// in this block
// INDEX:
// RELEASE: An exception appears in two different WHEN clauses (two different 
// exception-handlers) in the EXCEPTION section of the block.
// CAUSE: An exception appears in two different WHEN clauses (that is, two 
// different exception handlers) in the exception-handling part of a PL/SQL 
// block or subprogram.
// ACTION:Remove one of the references to the exception.
//
484, 0, "redundant exceptions '%s' and '%s' must appear in same exception handler"
// MANUAL: exceptions '<MI>name1<D>' and '<MI>name2<D>' have same ORACLE error 
// number and must appear in same exception handler
// INDEX:
// RELEASE: bug 136690 filed by MGAALEN asked for a shorter rewording of
// the error message. I changed it 29 Oct 92 -- Gray
// CAUSE: Using the EXCEPTION_INIT pragma, different exceptions were 
// initialized to the same Oracle error number; then, they were referenced 
// in different exception handlers within the same exception-handling part. 
// Such references conflict.
// ACTION: Remove one of the exceptions or initialize it to a different Oracle 
// error number.
//
485, 0, "in exception handler, '%s' must be an exception name"
// MANUAL: in exception handler, '<MI>name<D>' must be an exception name
// INDEX:
// RELEASE: In a WHEN clause of an exception-handler, an identifier that has
// not been declared to be an exception appears where only an exception name
// is legal.
// CAUSE: An identifier not declared as an exception appears in an exception 
// handler WHEN clause. Only the name of an exception is valid in a WHEN 
// clause.
// ACTION:Check the spelling of the exception name and make sure the exception 
// was declared properly.
//
486, 0, "select list cannot be enclosed in parentheses"
// MANUAL: select list cannot be enclosed in parentheses
// INDEX:
// RELEASE: 
// CAUSE: In a SELECT statement, the select list was enclosed in 
// parentheses, as in:   
// SELECT (deptno, dname, loc) FROM dept INTO ...     
// This breaks the rules of SQL syntax. Parentheses are not required because 
// the keywords SELECT and FROM delimit the select list.
// ACTION: Remove the parentheses enclosing the select list.
//
487, 0, "Invalid reference to variable '%s'"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: A variable was referenced in a way that is inconsistent with its 
// datatype. For example, a scalar variable might have been mistakenly 
// referenced as a record, as follows:     
// DECLARE
//         CURSOR emp_cur IS SELECT empno, ename, sal FROM emp; 
//        emp_rec emp_cur%ROWTYPE; 
//        my_sal  NUMBER(7,2);     
// BEGIN    ...    total_sal := total_sal + my_sal.sal;  -- invalid
//         ...
// ACTION: Check the spelling of the variable name. Make sure the variable was 
// declared properly and that the declaration and reference are consistent 
// regarding datatype.
//
488, 0, "'%s' must be a type"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The datatype specifier in a declaration or expression does not 
// designate a legal type. For example, the %TYPE attribute might not have 
// been added to a declaration, as in    
//  DECLARE
//         my_sal   emp.sal%TYPE;
//         my_ename emp.ename;    -- missing %TYPE
//         ...     
// When declaring a constant or variable, to provide the datatype of a 
// column automatically, use the %TYPE attribute. Likewise, when declaring a 
// record, to provide the datatypes of a row automatically, use the %ROWTYPE 
// attribute.
// ACTION: Make sure the datatype specifier designates a legal type. 
// Remember to use the %TYPE and %ROWTYPE attributes when necessary.
//
489, 0, "invalid table reference: '%s' must be a column in this expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: In a query, a select-list item refers to a table in the FROM 
// clause but not to a database column.
// ACTION: Check the spelling of the column names, make sure each column in 
// the select list refers to a table in the FROM clause, then re-execute the 
// query.
//
490, 0, "illegal statement"
// MANUAL:
// INDEX:
// CAUSE: A constant, variable, function call, or incomplete statement was 
// used where a statement was expected. For example, instead of calling a 
// function from an expression, it might have been called as a statement (as 
// if it were a procedure).
// ACTION: Check the statement, making sure that its commands, identifiers, 
// operators, delimiters, and terminator form a complete and valid PL/SQL 
// statement.
//
491, 0, "numeric literal required"
// MANUAL:
// INDEX:
// CAUSE: A constant or variable was used where a numeric literal is required. 
// For example, the code might look like    
//  my_ename  VARCHAR2(max_len);     
// instead of    
//  my_ename  VARCHAR2(15);     
// When specifying the maximum length of a VARCHAR2 variable, an integer 
// literal must be used.
// ACTION: Replace the identifier with a numeric literal.
//
492, 0, "variable or constant initialization may not refer to functions declared in the same package"
// MANUAL: variable or constant initialization may not refer to functions 
// declared in the same package
// INDEX:
// CAUSE: If a package spec p declares a function f, that function may not be
//        used in any variable declarations in that same package spec.  This is
//        because of a circular instantiation problem: in order to fully
//        instantiate the package spec, the variable must be initialized.  To
//        initialize the variable, the function body code in the package body
//        must be executed.  That requires that the package body be
//        instantiated.  However, the package body cannot be instantiated until
//        the package spec is fully instantiated.
// ACTION: Remove the reference to the function from the variable
//        initialization.  A technique which often works is to move the variable
//        initialization from the variable declaration (in the package spec) to
//        the package body initialization block.
//
493, 0, "invalid reference to a server-side object or function in a local context"
// MANUAL: invalid reference to a server-side object in a local context
// INDEX:
// CAUSE: A reference to a server-side object (e.g. a table column) or function
//	  (a group function such as SUM, AVG, MIN, MAX, ... ) was found in a
//        context where only PL/SQL objects may be present (such as within the
//        parameter list of a local function or as the index of a (local) PL/SQL
//        table.)  
// ACTION: Rewrite the offending statement; or (if a local function call is the
//        problem context), make the function non-local (either packaged or top-
//        level.)
//
494, 0, "coercion into multiple record targets not supported"
// MANUAL: coercion into multiple record targets not supported
// INDEX:
// RELEASE: 
// CAUSE: The INTO list of a SELECT or FETCH specified more than a single record-
//        type target and the column types required
//        coercion into a record to match the INTO list.  This is type
//        checked as correct, but not yet supported.
// ACTION: Create a new record type to hold all of the column types
//         or code the SELECT with an INTO target for every source column.
495, 0, "too many columns in SELECT...INTO statement after bursting record targets"
// MANUAL: too many columns in SELECT...INTO statement after bursting record targets
// INDEX:
// RELEASE: 
// CAUSE: Type checking indicated the columns in a SELECT or FETCH were being collected
//        into a record in the INTO list.  The record was burst into its
//        fields.  There were not enough fields in the record for each
//        of the columns.  
// ACTION: Change the number of columns or the record variable(s) in the INTO 
//         clause so that they match.
//
496, 0, "too few columns in SELECT...INTO statement after bursting record targets"
// MANUAL: too few columns in SELECT...INTO statement after bursting record targets
// INDEX:
// RELEASE: 
// CAUSE: Type checking indicated the columns in a SELECT or FETCH were being collected
//        into a record in the INTO list.  The record was burst into its
//        fields.  There were not enough columns to fill all of the fields
//        in the record. 
// ACTION: Change the number of columns or the record variable(s) in the INTO 
//         clause so that they match.
//
497, 0, "cannot mix between single row and multi-row (BULK) in INTO list"
// MANUAL: BULK SQL
// INDEX:
// RELEASE: 8.1.6
// CAUSE: - When BULK syntax (e.g. BULK COLLECT INTO) is used to retrieve data,
//        every variable in the INTO list has to be of type that is a
//        collection of the type of the corresponding column.
//        - When BULK is NOT used, every variable in the INTO list has to be of
//        compatible type with the corresponding column.
// ACTION: Change the INTO list so that all variables have correct data types
498, 0, "illegal use of a type before its declaration"
// MANUAL: illegal use of a type before its declaration
// INDEX:
// RELEASE: 
// CAUSE: A variable or constant was declared to be of a type whose declaration
//        appears later in the compilation unit; or, a type or subtype was
//        declared in terms of another type whose declaration appears later in
//        the compilation unit.
// ACTION: Ensure that the type declaration preceeds its use in the variable/
//         constant/type declaration. 
//
499, 0, "coercion into collection of records not supported"
// MANUAL: coercion into collection of records not supported 
// INDEX:
// RELEASE: 
// CAUSE: A SELECT or FETCH may specify a column list to be coerced into a
//        variable which is a collection of records.  This is type
//        checked as correct, but not yet supported because of the
//        implicit layout change required.
// ACTION: Express the SELECT with an object constructor around the 
//         columns and use a collection of objects as an INTO variable.   
//         Or, build the collection one row at a time coercing each 
//         row into a record which happens to be an element.  Or,
//         use a record of collections. 
//
500, 0, "invalid operator binding"
// MANUAL: invalid operator binding
// INDEX:
// RELEASE:8.1
// CAUSE: An operator binding fucntion cannot be found in the specified
//        scope.
// ACTION: Provide the correct number and types of parameters for
//         the operator binding fucntion. Or, specify the correct
//         names for schema, package, or type containing the operator
//         binding fucntion.
//
503, 0, "RETURN <value> statement required for this return from function"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:In a function body, a RETURN statement was used that contains no 
// expression. In procedures, a 
// RETURN statement contains no expression because the statement simply 
// returns control to the 
// caller. However, in functions, a RETURN statement must contain an 
// expression because its value 
// is assigned to the function identifier.
// ACTION:Add an expression to the RETURN statement.
//
504, 0, "type %s_BASE may not be used outside of package STANDARD"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:In a declaration, the datatype NUMBER_BASE (for example) was 
// mistakenly specified. The 
// datatypes CHAR_BASE, DATE_BASE, MLSLABEL_BASE, and NUMBER_BASE are for 
// internal 
// use only.
// ACTION:Specify (for example) the datatype NUMBER instead of NUMBER_BASE.
//
505, 0, "User Defined Types may only be defined as PLSQL Tables or Records"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:An attempt was made to define a type other than TABLE or RECORD, 
// but these are the only user-
// defined types allowed in this release of PL/SQL. For example, the following 
// type definition is illegal:    
// TYPE Byte IS INTEGER(2);  -- illegal
// ACTION:Remove the type definition, or revise it to specify a TABLE or 
// RECORD type.
//
506, 0, "User Defined Constrained Subtypes are disallowed"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:An attempt was made to define a constrained subtype, but only 
// unconstrained subtypes are allowed 
// in this release of PL/SQL. For example, the following type definition is 
// illegal:    
// SUBTYPE Acronym IS VARCHAR2(5);  -- illegal
// ACTION:Remove the illegal type constraint.
//
507, 0, "a PLSQL Table may not contain a table or a record with composite fields"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:In a TABLE type definition, a nested record type was specified as the 
// element type. This is not 
// allowed. All fields in the record must be scalars.
// ACTION:Remove the TABLE type definition, or replace the nested record 
// type with a simple record type.
//
508, 0, "The expression in a RETURN statement cannot be a type"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:A datatype specifier was used instead of an expression in the 
// RETURN statement of a user-defined 
// function, as shown in the example below. Do not confuse the RETURN 
// statement, which sets the 
// function identifier to the result value, with the RETURN clause, which 
// specifies the datatype of the 
// result value.     
// FUNCTION credit-rating (acct_no NUMBER) RETURN BOOLEAN IS
//           BEGIN
//             ... 
//              RETURN NUMBER;  -- should be an expression        
// END;
// ACTION:Replace the datatype specifier in the RETURN statement with an 
// appropriate expression.
//
509, 0, "Implementation Restriction : Pass a returned record to a temporary identifier before selecting a field"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:Illegal syntax was used to call a parameter-less function that 
// returns a record or a PL/SQL table of records. When calling a function that 
// takes parameters and returns a record, you use the following syntax to 
// reference fields in the record:     
// function_name(parameters).field_name     
// However, you cannot use the syntax above to call a parameter-less 
// function because PL/SQL does not allow empty parameter lists. That is, 
// the following syntax is illegal:      
// function_name().field_name  -- illegal; empty parameter list     
// You cannot just drop the empty parameter list because the following 
// syntax is also illegal:     function_name.field_name  -- illegal; no 
// parameter list. 
// ACTION:Declare a local record or PL/SQL table of records to which you can 
// assign the function result, then 
// reference its fields directly.
//
510, 0, "Float cannot have scale"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: When a FLOAT variable was declared, its precision and scale were 
// specified, as shown in the following example:     
// DECLARE
//         Salary FLOAT(7,2);     
// However, a scale for FLOAT variables cannot be specified; only a 
// precision can be specified, as in 
//        salary FLOAT(7);
// ACTION: Remove the scale specifier from the declaration, or declare a 
// NUMBER variable instead.
//
511, 0, "a record may not contain a PL/SQL table of records"
// MANUAL: 
// INDEX:
// RELEASE: 2.3
// CAUSE: n a RECORD definition, one of the fields was declared as a PL/SQL 
// table of records. This is not allowed. A record can be the component of 
// another record (that is, records can be nested), but a PL/SQL table of 
// records cannot be the component of a record.
// ACTION: Remove the field declaration, or revise it to specify a simple 
// record type.
//
512, 0, "Implementation Restriction: '%s': Cannot directly access remote package variable or cursor"
// MANUAL: 
// MANUAL:
// INDEX:
// RELEASE: 2.3
// CAUSE:   An attempt was made to reference a remote packaged variable or 
// cursor. This is not allowed. Instead, add to the remote package a 
// function that returns the value of the variable or cursor.
// ACTION: Remove the illegal reference.
//
513, 0, "PL/SQL function called from SQL must return value of legal SQL type"
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: In a SQL statement, do not call a PL/SQL function
// 	  having a return type that can not be handled by SQL.
//	  For example, type BOOLIAN, records and indexed-tables 
//        are not supported by SQL and functions returneing such values can not be
//	  called from SQL.
//
514, 0, "INSERT statement with REF INTO clause requires a typed table"
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: This INSERT statement provides REF INTO clause, which is only
// 	  legal when the table specified in the INTO clause is an object table.
//
515, 0, "The type of the REF INTO variable '%s' must be REF to the table's type"
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: In INSERT statement with REF INTO clause, the type of the data item
//        must be REF to the type of the table used in INTO clause.
//
516, 0, "Type mismatch between object table and value '%s' in INSERT statement."
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: In the INSERT statement operating on typed tables (tables of 
// objects), the type of a non-aggregate value
//        did not match the object type of the table.
//
517, 0, "Type mismatch between a select list element '%s' and corresponding table column in INSERT statement with a subquery"
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: In an INSERT statement with subquery, at lease one of the elements
//        of the select 
//        list was not type-compatible with the corresponding column 
//        of the table in the INTO clause. This error indicates that 
//        the subquery should be 
//        rewritten to match the structure of the target table.
//
518, 0, "This INSERT statement requires VALUES clause containing a parenthesised list of values"
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: A VALUES clause was entered without a list of SQL data items in 
// parentheses. In all INSERT statements with an explicit column list, the 
// VALUES clause must contain a list of SQL data items in parentheses. For 
// example:
// INSERT INTO my_tab (a,b,c) VALUES (1,2,my_variable);
//  ACTION: Rewrite the statement to include a list of SQL data items in
//   parentheses.
//
519, 0, "This INSERT statement requires a VALUES clause containing an object type expression, not a list of values"
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: In an INSERT statement with typed tables, an aggregate was used when 
//        an object type item was expected.
// ACTION: Replace the aggregate with an object constructor or other 
//	  object type expression.
//
520, 0, "MAP methods must be declared without any parameters other than (optional) SELF."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:  A MAP member function was declared with a parameter. Map member 
// functions can have only one parameter: the default SELF parameter.  Map 
// methods must be declared without any parameters. The compiler adds the SELF 
// parameter.
// ACTION:  Remove the parameter from the map member function.
//
521, 0, "ORDER methods must be declared with 1 (one) parameter in addition to (optional) SELF."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:  An order member function was declared without the user-specified 
//        parameter. Order member functions have two parameters, one is the 
//        default SELF parameter which is added by the compiler. the second 
//        parameter is added by the user and must declare an order method 
//        which must be the same type as the containing object type.   
// ACTION:  Check and correct the way the parameter is specified.
//
522, 0, "MAP methods must return a scalar type."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:  The MAP member function was written such that it returns 
//        something other than a scalar type.
// ACTION:  Rewrite the MAP function such that it returns a scalar type. 
//
523, 0, "ORDER methods must return an INTEGER."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:  An order member function was written such that it returns something 
//        other than an integer type. 
// ACTION: Rewrite the ORDER method such that it returns an integer type.
//
524, 0, "The parameter type in an ORDER method must be the containing object type."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:    An order member function was declared without the user-
//        specified parameter. Order member functions have two parameters, one 
//        is the default SELF parameter which is added by the compiler. the 
//        second parameter is added by the user and must declare an order 
//        method which must be the same type as the containing object type. 
// ACTION:  Check and correct the way the parameter is specified.
//
525, 0, "Within SQL statements, only equality comparisons of objects are allowed without a map or order function."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:   A map or order function was not provided for a relational 
//        comparison. Only equality comparisons may be used when a map or 
//        order function is not supplied.
// ACTION:  Supply either a map or order function for the object.  Otherwise 
//        change the program to use only equality comparisons.
//
526, 0, "A MAP or ORDER function is required for comparing objects in PL/SQL."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:   Within stand alone PL/SQL, an attempt was made to compare 
//        objects without a map or order function.
// ACTION:  Provide a map or order function and retry the operation.
//
527, 0, "MAP or ORDER functions require a PRAGMA RESTRICT_REFERENCES specifying :WNDS,WNPS,RNPS,RNDS."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:    Either a PRAGMA RESTRICT_REFERENCES was not specified or  it 
//        was specified without one of the following: WNDS, WNPS, RNPS, or 
//        RNDS. 
// ACTION:  Add or correct the PRAGMA and retry the operation.
//
528, 0, "The parameters to an ORDER function must have IN mode"
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:   You declared parameter to an ORDER function to have OUT or IN 
//        OUT mode.
// ACTION:  Correct the parameter to use IN mode only.
//
529, 0, "Bad column name %s in INSERT statement (must be an identifier)"
// MANUAL: 
// INDEX: 
// RELEASE: 
// CAUSE: In an INSERT statement, an attempt was made to use a column name 
//        that is not an identifier.  In any INSERT statement with explicit 
//        column list a column name must be a simple identifier.
// ACTION: Rewrite the INSERT statement, using a simple identifier for the  
//        column name.
530, 0, "Illegal type used for object type attribute: '%s'."
// MANUAL: 
// INDEX: 
// RELEASE:  8.0
// CAUSE: An attempt was made to use an invalid type for an object type 
//        attribute. 
// ACTION:  Use only supported types for the object type attribute.
//       
//
531, 0, "Unsupported type in a VARRAY or TABLE type: '%s'." 
// MANUAL: 
// INDEX: 
// RELEASE:  8.0
// CAUSE: An attempt was made to use an unsupported type in a VARRAY or 
//        TABLE type.
// ACTION:  Use only supported types in a VARRAY or TABLE type. 
//       
//
532, 0, "Target of REF must be a complete or incomplete object type."
// MANUAL: 
// INDEX: 
// RELEASE: 8.0
// CAUSE:  The target of a REF can only be a complete or an incomplete object
//         type.
// ACTION: If a REF is to be used, change the type; otherwise,
//         remove the REF.
//
533, 0, "Tables of non_queryable types are not supported."
// MANUAL: 
// INDEX: 
// RELEASE: 8.0
// CAUSE: An attempt was made to create a table of a type which cannot be 
//        queried.  Tables of such types are not supported.
// ACTION:  Create an object type containing the non-queryable type. Then 
//        create a table of the object type.
//
534, 0, "A Table type may not contain a nested table type or VARRAY."
// MANUAL: 
// INDEX: 
// RELEASE: 8.0
// CAUSE:  An attempt was made to do one of the following: define a table type 
//        which contained nested collection types. or define an object table 
//        that has (perhaps nested) another table type or VARRAY type.
// ACTION:  Check the table definitions to be sure that they do not contain 
//        nested tables or VARRAYs. 
//
535, 0, "A VARRAY type may not contain a NESTED TABLE, VARRAY or LOB"
// MANUAL: 
// INDEX: 
// RELEASE: 8.0
// CAUSE:   An attempt was made to do one of the following: define a VARRAY 
//        type containing a nested collection type or LOB or define a  
//        VARRAY type of an object type that has a nested attribute which is 
//        one of NESTED TABLE, VARRAY or LOB type.
// ACTION: Check the VARRAY definitions to be sure that they do not contain 
//        nested colection types, LOBs or nested attributes. 
//
536, 0, "Navigation through REF variables is not supported in PL/SQL."
// MANUAL: 
// INDEX: 
// RELEASE: 8.0
// CAUSE: The expression of the form refvar.field was entered. This is not 
//        supported in PL/SQL, ver 8.0.
// ACTION:
//
537, 0, "A VARRAY must have a positive limit"
// MANUAL: 
// INDEX: 
// RELEASE: 8.0
// CAUSE:  A VARRAY type was declared with a non-positive limit, for example 
//        VARRAY(0).
// ACTION: Declare the VARRAY with a positive limit and retry the operation.
//
538, 0, "subprogram or cursor '%s' is declared in an object type specification and must be defined in the object type body"
// MANUAL: 
// INDEX: "object type specification", "object type body"
// RELEASE: 8.0
// CAUSE: The specified subprogram is declared in an object type's   
//        specification, but is not defined in the object type body.
// ACTION: Define the subprogram in the object type body, or remove the  
//        declaration from the specification.   
//
539, 0, "subprogram '%s' is declared in an object type body and must be defined in the object type specification"
// MANUAL: 
// INDEX: "object type body", "object type specification"
// RELEASE: 8.0
// CAUSE: The specified subprogram is declared in an object type's body, but 
//        is not defined in the object type's specification. Notice cursor 
//        bodies can exist without a specification.
// ACTION: Define the subprogram in the object type's specification, or remove 
//        the declaration from the body.
//
540, 0, "object not supported in this context."
// MANUAL: 
// INDEX: "object type body", "object type specification"
// RELEASE: 8.0
// CAUSE: An object was declared inside a local scope (Function, Procedure, or 
//        anonymous block), or in a package scope which is not supported.
// ACTION: Declare the type in a global or data base scope.
//
541, 0, "size or length specified is too large."
// MANUAL: 
// INDEX: 
// RELEASE: 8.0
// CAUSE: A length or size that is too large was specified for a data item.
// ACTION:  Specify a smaller value and retry the operation.
//
542, 0, "CLOB and NCLOB cannot use varying-width character sets in the server"
// MANUAL: 
// INDEX:
// RELEASE: 8.0
// CAUSE: A server type is being created with an embedded CLOB or NCLOB 
//        atttribute which uses a varying-width character set.
// ACTION: Use VARCHAR2 instead of CLOB, or use a fixed-width character set.
//
543, 0, "a PLSQL Table may not contain a nested table type or VARRAY."
// MANUAL: 
// INDEX: 
// RELEASE: 8.0
// CAUSE: An attempt was made to define a PLSQL table that contained a
//        (possibly deeply)
//        nested table type or VARRAY. Nested collection types are not
//        supported.
// ACTION: Remove the nested table type or VARRAY from the table. Then retry
//         the operation.
//
546, 0, "SELF may not be declared as a REF parameter."
// MANUAL: 
// INDEX: 
// RELEASE: 8.0
// CAUSE:  SELF was declared as a ref parameter to a member function or 
//         procedure. SELF is not supported as a REF.
// ACTION: Redeclare SELF as a value parameter.
//
548, 0, "invalid use of operator."
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  A name of an operator is used as a qualifier or appears
//         outside from sql context.
// ACTION: Eliminate the use of operator name as a qualifier or place
//         it in a sql clause.
//
550, 0, "character set specification is not allowed for this type"
// MANUAL: a character set specification does not make sense for this type
// INDEX:
// RELEASE:
// CAUSE: A character set specification was made on a type that does not 
//        require one.
// ACTION: Remove the character set specification, or change the type.
551, 0, "character set ANY_CS is only allowed on a subprogram parameter"
// MANUAL: Character set ANY_CS can only be used when declaring a parameter of
//         a function or subroutine.
// INDEX:
// RELEASE:
// CAUSE: The character set ANY_CS was specified when it is not allowed.
// ACTION: Change or remove the character set specification.
552, 0, "flexible character set is not allowed on component element"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: ANY_CS or %CHARSET was used to reference an ANY_CS parameter which 
//         is not a CHAR, VARCHAR2, or CLOB type.  ANY_CS or %CHARSET is not 
//         allowed for fields of a record , object, elements of a 
//         collection, etc.
// ACTION: Change or remove the character set specification.
553, 0, "character set name is not recognized"
// MANUAL: The name in a character set specification was not recognized as
//         a valid name for a character set.
// INDEX:
// RELEASE:
// CAUSE: An unrecognized name appears in a character set specification.
// ACTION: Change or remove the character set specification.
554, 0, "character set has already been determined"
// MANUAL: A character set specification may not be added to a type that
//         already includes one, or already includes a length specification.
// INDEX:
// RELEASE:
// CAUSE: A redundant or conflicting character set was specified. 
// ACTION: Remove the CHARACTER SET specification, or change the character set 
//         specified.
555, 0, "default expressions are not allowed for SQL operators"
// MANUAL: No default expression can be specified for SQL operators.
// INDEX:
// RELEASE: 8.1
// CAUSE: A default expression has been specified for a SQL operator.
// ACTION: Eliminate the default expression from the operator.
//
560, 0, "character set mismatch"
// MANUAL: The expression has the wrong character set for use in this context.
// INDEX:
// RELEASE:
// CAUSE: An expression was used that has the wrong character set for this
//        context.
// ACTION: Adjust the expression, using TRANSLATE(... USING ...)
//         or by rethinking the logic.
561, 0, "character set mismatch on value for parameter '%s'"
// MANUAL: The actual argument has a character set conflict.  If a default
//	   argument value is being used, it may be in conflict with some
//         actual argument that must have the same character set.
// INDEX:
// RELEASE:
// CAUSE:  An expression was used that contains an incorrect character set.
//         The actual argument has a character set conflict.  If a default
//	   argument value is being used, it might be in conflict with some
//         actual argument that must have the same character set.
// ACTION: Adjust the expression, using TRANSLATE(... USING ...) or change
//         the character set.
//         
562, 0, "a function must return a type."
// MANUAL:
// INDEX:
// RELEASE: 8.0
// CAUSE:  The current function was definied to return something other than 
//         a data type.
// ACTION: Make sure the function is returning a data type.
//
563, 0, "illegal use of CAST expression"
// MANUAL: Currently, CAST is enabled in SQL statements only.
// INDEX: 
// RELEASE:
// CAUSE: CAST (in PLSQL) was used outside of a DML scope.
// ACTION: Do not use CAST outside DML statements.
564, 0, "lob arguments are not permitted in calls to remote server"
// MANUAL: lob arguments are not permitted in calls to remote server
// INDEX: 
// RELEASE:
// CAUSE: use of lob argument in call to remote server
// ACTION: Do not use LOBs in call to remote server
565, 0, "%s must be completed as a potential REF target (object type)"
// MANUAL: This library unit must be completed as a potential REF target
// INDEX:
// RELEASE: 8.0
// CAUSE:    Incomplete library units that are potential targets of REF
//           dependencies must be completed so that they continue to
//           remain potential targets of REF dependencies (since there might
//           be library units with REF dependencies on this library unit).
//           Potential REF targets include complete and incomplete
//           object types.  This error happened because  an attempt was made to
//           complete a potential REF target as something other than a
//           potential REF target.
// ACTION:   Use another name for this library unit, or drop the original
//           incomplete library unit.
566, 0, "type name \"%s\" cannot be constrained"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: A lob, date, boolean, rowid, or mlslabel type was constrained 
//        with a length specification. For example: 
//        X BLOB(5);
// ACTION:Remove the constraint.
//
567, 0, "cannot pass NULL to a NOT NULL constrained formal parameter"
// MANUAL: cannot pass NULL to a NOT NULL constrained formal parameter
// INDEX:	"NULL"
// RELEASE: 
// CAUSE: You attempted to pass NULL to a NOT NULL constrained
//  parameter.
// ACTION: Pass a NOT NULL expression instead.
//
568,0,"cannot access rows from a non-nested table item"
// MANUAL: cannot access rows from a non-nested table item
//INDEX:  "NULL"
//RELEASE:
//CAUSE: You attempted to use TABLE expression, from a non-nested table
// ACTION: pass the correct parameter
//
569,0,"numeric overflow or underflow"
// MANUAL: numeric overflow or underflow
//INDEX:  "NULL"
//RELEASE:
//CAUSE: A constant literal is either too large or too small to fit in an Oracle number
// ACTION: Change the value of the literal
//
570, 0, "different number of columns in the multiset and cast expressions"
// MANUAL: different number of columns in the multiset and cast expressions
// INDEX:  "NULL"
// RELEASE:
// CAUSE: Number of columns in the collection returned by MULTISET and the
//        number of columns for the CAST type don't match. For example:
//          create type tab_obj as object (n number);
//          create type tab1 as table of tab_obj;
//          create table tab2 (col1 number, col2 number);
//          select CAST(MULTISET(select col1, col2 from tab2) as tab1)
//            from tab2;
571, 0, "method access through data base link not yet supported on client side "
// MANUAL:
// INDEX:
// CAUSE: Remote link is used with on client side
// ACTION: Create a dummy function to call symbolic link on server side
// or wiat till it is implemented
//  
572,0,"improper constraint form used"
// MANUAL: improper constraint form used
//INDEX:  "NULL"
//RELEASE:
//CAUSE: "number" types cannot have a range.  user-defined aggregate types and
//  integer types cannot have
//  scale or precision specified.   Example: "x number(5,3)" is acceptable
//  but "x number range 1..10" is not.
// ACTION: Remove the constraint
//
573,0,"cannot constrain scale, precision, or range of an anchored type declaration" 
// MANUAL: cannot constrain scale, precision, or range of an anchored type declaration 
//INDEX:  "NULL"
//RELEASE:
//CAUSE: A variable declared with %TYPE or %ROWTYPE cannot have a scale, precision, or
//  range constraint.  Example: x y%TYPE(10) is not acceptable.  It is legal to
//  add "NOT NULL" or non-conflicting CHARACTER SET constraints to anchored type
//  declarations.
// ACTION: Remove the constraint or use a type name instead of an anchored type.  
//
580, 0, "supertype must be an object type"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  An attempt was made to declare an object type to have a supertype,
//         but the specified supertype was not itself an object type.  Object
//         types can inherit only from other object types.
// ACTION: Remove the supertype specification, or change it to refer to an
//         object type. If the declaration appears correct, make sure the
//         supertype has compiled correctly.
//
581, 0, "inheritance is not supported for opaque types"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  An attempt was made to declare an opaque type with a supertype.
// ACTION: Remove the supertype specification.
//
582, 0, "attribute declarations are not allowed in opaque types"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  An attempt was made to declare an attribute in an opaque type.
// ACTION: Remove the attribute declaration.
//
583, 0, "size must be specified if opaque type is fixed-length"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  An attempt was made to declare a fixed-length opaque type
//         without specifying an explicit size.
// ACTION: Specify an explicit size, or change the declaration to be
//         varying-length.
//
584, 0, "size of an opaque type must be between 1 and 4000 bytes"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  An attempt was made to specify an explicit size for an opaque type,
//         but the specified size was out of the valid range.
// ACTION: Change the explicit size to be between 1 and 4000 bytes, or change
//         the declaration to be varying-length without an explicit size.
//
585, 0, "declared support library for opaque type is not a library"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  An attempt was made to name a support library for an opaque type,
//         but the name refers to an object that is not a library.
// ACTION: Change the declaration to name a valid library.
//
586, 0, "a static method cannot declare a parameter named SELF"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  An attempt was made to name a parameter SELF when declaring a
//         static method.  SELF is reserved as a parameter name in methods,
//         to hold the object instance on which the method is applied. A
//         parameter named SELF is not allowed in static methods because
//         static methods do not apply to a particular object instance.
// ACTION: Change the name of the parameter in the declaration.
//
587, 0, "a static method cannot be invoked on an instance value"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  An attempt was made to use an object instance value, not a
//         typename, as the qualifier of the name of a method invocation,
//         but only a typename can be used as the qualifier when calling
//         a static method.
// ACTION: Use the typename, not an object instance value, to qualify
//         the name of a method if the method is static.
//
588, 0, "unqualified instance attribute references allowed only in member methods"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE:  An attempt was made to use the name of an object instance
//         attribute in the body of a static method, or in an initialization
//         default value on another attribute. If the instance attribute is
//         not qualified with a particular object instance that supplies a
//         value, the instance attribute can be named only when it is inside
//         a member method.
// ACTION: Qualify the attribute reference with the name of an object value,
//         or change the containing method to a member method rather than
//         a static method.
//
589, 0, "no attributes found in object type \"%s\""
// MANUAL: 
// INDEX:  
// RELEASE:
// CAUSE:  Table of non adt type is defined.
// ACTION:  Table of type should be of ADT type only
//
590, 0, "attempting to create a subtype UNDER a FINAL type"
// MANUAL: 
// INDEX:  
// RELEASE: 8.2
// CAUSE:  An attempt was made to create a subtype UNDER
//         a FINAL type.
// ACTION: Avoid deriving a subtype from this FINAL type.
591, 0, "this feature is not supported in client-side programs"
// MANUAL:
// INDEX: 
// RELEASE: 8.1
// CAUSE: One of the following features was used in a wrong context: 
//  pragma AUTONOMOUS_TRANSACTION, dynamic SQL statements,  
//  (e.g. EXECUTE IMMEDIATE), and bulk binds.  These listed features can only 
//  be used in server-side programs but not client-side programs. 
// ACTION: 
//  Remove it or define a server-side subprogram to do the work and 
//  call the subprogram from the client.
592, 0, "the type of a object table must be an object type" 
// MANUAL: object types 
// INDEX: 
// RELEASE: 
// CAUSE:  You have defined a typed-table of a non-object type. 
// ACTION:  Replace the non-object type with an object-type. 
593, 0, "default value of parameter \"%s\" in body must match that of spec" 
// MANUAL:   
// INDEX: 
// RELEASE:  
// CAUSE:  The default value initialization of a parameter in a 
//     subprogram body contained in a package body did not match 
//     that of the corresponding subprogram specification in the 
//     corresponding package specification.
// ACTION: Change the default initialization of the parameter in
//     body to match that of spec.
594, 0, "the SELF parameter can be declared only as IN or as IN OUT" 
// MANUAL: object types 
// INDEX: 
// RELEASE: 
// CAUSE:  The SELF parameter was declared as an OUT parameter. 
// ACTION:  Declare the SELF parameter as either an IN or an IN OUT parameter.
595, 0, "the TABLE operator is not allowed in this context"   
// MANUAL: collections   
// INDEX:   
// RELEASE:   
// CAUSE:  The TABLE operator was used as an argument to a SELECT or 
//         CAST statement. 
// ACTION: Remove the TABLE operator from the SELECT list items or from argument of CAST 
//         operator. Make sure that the TABLE operator appears only in the FROM clause.
//
// Starting from 8.1.6, error message 596 isn't true since we do support
// weak ref cursor with BULK binds.
// 596, 0, "weak ref cursors with bulk binds not supported"
// MANUAL: weak ref cursor, bulk collect into a table of records.
// INDEX:
// CAUSE:  This feature is not yet implemented.
// ACTION: Don't use weak ref cursors with bulk binds.
597, 0, "expression '%s' in the INTO list is of wrong type"
// MANUAL: RECORD, BULK
// INDEX:
// RELEASE: 8.1.6
// CAUSE:   This exception is raised for the following errors:
//          - the expression in INTO clause of OPEN or RETURNING statement is
//            neither of legal SQL datatypes nor of PL/SQL RECORD datatype
//          - a collection of records is used in INTO clause of OPEN or
//            RETURNING statement.
//          - a record or a collection of records is used in BULK COLLECT INTO
// ACTION:  Use expression with correct datatype in the INTO clause
598, 0, "comparison of object with NULL using \"%s\" is not allowed"
// MANUAL: object types
// INDEX:
// RELEASE:
// CAUSE:  An object is compared with NULL using a relational operator.
// ACTION:  Use IS NULL comparison operator.
599, 0, "SAMPLE percentage must be in the range [0.000001,100)"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:  The percentage number is not in the range [0.000001,100)
// ACTION:  Use a percentage number in the range [0.000001,100)
600, 0, "SAMPLE cannot be applied to a remote object"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:  SAMPLE applying to a remote object is not supported
// ACTION:  Do not use SAMPLE with a remote object
601, 0, "partition extended object names may only be used with tables"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  User attempted to use a partition-extended object name
//         with an object which is not a table.
// ACTION: Avoid using partition-extended name syntax with objects
//         which are not tables
602, 0, "CUBE and ROLLUP may appear only in a GROUP BY clause"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  User attempted to use the keywords CUBE or ROLLUP outside
//         a GROUP BY clause
// ACTION: Avoid using the keywords CUBE and ROLLUP outside the GROUP
//         BY clause
603, 0, "GROUPING function supported only with GROUP BY CUBE or ROLLUP"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  User attempted to use the GROUPING function without GROUP BY
//         CUBE or GROUP BY ROLLUP
// ACTION: Avoid using the GROUPING function without GROUP BY CUBE or ROLLUP
604, 0, "aggregate function is not allowed here"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  One of the functions, such as AVG, COUNT, MAX, MIN, SUM, STDDEV or
//         VARIANCE, was used in a WHERE or GROUP BY clause
// ACTION: Remove the group function from the WHERE or GROUP BY clause. The
//         desired result may be achieved by including the function in a
//         subquery or HAVING clause.
605, 0, "set operators are not yet supported as an argument to a MULTISET operator"
// MANUAL: collections
// INDEX:
// RELEASE:
// CAUSE:  A set operator was used in a subquery that was the argument
//         to a MULTISET operator. 
// ACTION: Rewrite your SQL statement so that it does not use a set operator
// in the subquery that is the argument to the MULTISET operator.
606, 0, "cursor subquery is not supported on client side in this release"
// MANUAL: SQL
// INDEX:
// RELEASE:
// CAUSE:  A query that contains a cursor subquery is being used from client side.
// ACTION: Use this feature from serevr side only.
607, 0, "SQLJ Object Types can have only SQLJ Types as its supertype or subtype"
// MANUAL: DDL statements
// INDEX:
// RELEASE: 
// CAUSE: You were trying to create a SQLJ Object Type under a non-SQLJ Object Type.
// ACTION: Recreate the type as a SQLJ Object Type. 
608, 0, "the value of the USING clause must match that of the supertype"
// MANUAL: DDL statements
// INDEX:
// RELEASE: 
// CAUSE: You were trying to create a SQLJ Object Type with a different value 
//        of the USING clause from the USING clause specified in its supertype. 
// ACTION:  Change the value of the USING clause to match the USING clause
//          in its supertype.
609, 0, "the OVERRIDING clause is not valid for SQLJ Object Types"
// MANUAL: DDL statements
// INDEX:
// RELEASE: 
// CAUSE: You were trying to a SQLJ Object Type method that override
//        an inherited method.
// ACTION:  Change the SQLJ Object Type defintion by removing the OVERRIDING
//          method.
610, 0, "ROW can be used only once in SET clause of UPDATE statement"
// MANUAL: DML statements
// INDEX:
// RELEASE:
// CAUSE:  You were trying to use ROW more than once in UPDATE statement.
// ACTION:  Remove all the additional ROW in set clause of UPDATE statement.
611, 0, "right hand side can be only the variables of record type"
// MANUAL: DML statements
// INDEX:
// RELEASE:
// CAUSE:  with ROW on LHS, only PL/SQL records or %ROWTYPE variables are
//         allowed on right hand side..
// ACTION: Make appropriate changes, so that right hande side should only have
//         variables of record or %ROWTYPE.
612, 0, "Number of attributes do not match in SET clause"
// MANUAL: DML statements
// INDEX:
// RELEASE:
// CAUSE:  Number of columns do not match with number of attributes on 
//         record type on rhs.
// ACTION:  Make sure that number of columns match with the number of 
//          attributes in record on rhs.
613, 0, "only one item is allowed, when using variables of record type"
// MANUAL: DML statements
// INDEX:
// RELEASE:
// CAUSE:  You are trying to use more than one values in VALUES clause or
//         RETURNING INTO clause, when one of the value is of record type..
// ACTION: Specify only one variable of record type, or don't use variables
//         of record type.
614, 0, "creating a FINAL NOT INSTANTIABLE type"
// MANUAL: 
// INDEX:
// RELEASE: 8.2
// CAUSE:  An attempt was made to create a FINAL NOT INSTANTIABLE type.
//         No useful operation can be performed with this type.
// ACTION: Avoid using the keywords FINAL and NOT INSTANTIABLE 
//         together when creating types.
615, 0, "type mismatch found at '%s' between CASE operand and WHEN operands"
// MANUAL: 
// INDEX:
// RELEASE: 8.2
// CAUSE:  In a simple CASE statement or expression, the CASE operand and
//         WHEN operands do not match in datatype, and it is unclear which
//         implicit conversion is required to correct the mismatch.
// ACTION: Change the CASE operand and WHEN operands so that their datatypes
//         match. Consider using datatype conversion functions in the CASE
//         operand and/or WHEN operands.
616, 0, "type mismatch found at '%s' among result expressions in a CASE expression"
// MANUAL: 
// INDEX:
// RELEASE: 8.2
// CAUSE:  In a CASE expression, the result expressions do not match in
//         datatype, and it is unclear which implicit conversion is required
//         to correct the mismatch.
// ACTION: Change the result expressions so that their datatypes match.
//         Consider using datatype conversion functions in the result
//         expressions.
617, 0, "at least one result in the CASE expression must not be NULL"
// MANUAL: 
// INDEX:
// RELEASE: 8.2
// CAUSE:  All the results in the CASE expression are the literal NULL.
// ACTION: Change at least one result in the CASE expression to be non-NULL.
618, 0, "type mismatch found at '%s' between operands in a NULLIF expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:  In a NULLIF expression, the two operands do not match in datatype,
//         and it is unclear which implicit conversion is required to correct
//         the mismatch.
// ACTION: Change the operands so that their datatypes match. Consider
//         using datatype conversion functions in the operands.
619, 0, "the first operand in the NULLIF expression must not be NULL"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:  The first operand in the NULLIF expression is the literal NULL.
// ACTION: Change the first operand in the NULLIF expression to be non-NULL.
620, 0, "type mismatch found at '%s' among operands in a COALESCE expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:  In a COALESCE expression, the operands do not match in datatype,
//         and it is unclear which implicit conversion is required to correct
//         the mismatch.
// ACTION: Change the operands so that their datatypes match. Consider
//         using datatype conversion functions in the operands.
621, 0, "at least one operand in the COALESCE expression must not be NULL"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:  All the operands in the COALESCE expression are the literal NULL.
// ACTION: Change at least one operand in the COALESCE expression to be
//         non-NULL.
622, 0, "range constraints must be between -2147483647 and 2147483647"
// MANUAL: "range constraints must be between -2147483647 and 2147483647"
// INDEX: "range", "constraint"
// RELEASE: 8.2
// CAUSE:  The range constraints specified for a pls_integer or
//         binary_integer declaration did not fall between -2147483647
//         and 2147483647.
// ACTION: Use range constraints between -2147483647 and 2147483647.
623, 0, "FLOAT precision constraint must be between 1 and 126"
// MANUAL: "FLOAT precision constraint must be between 1 and 126"
// INDEX: "FLOAT", "constraint" 
// RELEASE: 8.2
// CAUSE:  The precision specified for a FLOAT, REAL or DOUBLE PRECISION
//         did not fall between 1 and 126.
// ACTION: Use precision constraints between 1 and 126.
624, 0, "USING clause must be used with either aggregate or pipelined functions"
// MANUAL: "USING <type> clause must be used with either aggregate or pipelined functions"
// INDEX: "PIPELINED", "AGGREGATE"
// RELEASE: 8.2
// CAUSE:  USING clause cannot be used with functions that are not declared
//         with AGGREGATE or PIPELINED properties.
// ACTION: Define function body in PL/SQL or some other language (using
//         external callout call specification).
625, 0, "PARTITION/CLUSTER/ORDER-BY clause can only be used with IN parameters"
// MANUAL: "partition/cluster/order-by clause can only be used with IN parameters"
// INDEX: "PARTITION", "CLUSTER", "ORDER", "ref cursor"
// RELEASE: 8.2
// CAUSE:  A PARTITION/CLUSTER/ORDER-BY clause was used with an OUT or IN OUT 
//         ref-cursor parameter.
// ACTION: Change the parameter mode to IN or use some other parameter with
//         the PARTITION/CLUSTER/ORDER-BY clause.
626, 0, "partitioned/clustered/ordered parameter must be a function argument"
// MANUAL: "partitioned/clustered/ordered parameter must be a function argument"
// INDEX: "PARTITION", "CLUSTER", "ORDER", "ref cursor"
// RELEASE: 8.2
// CAUSE:  A partitioning or clustering/ordering specification specified on
//         an argument that is not one of the function arguments.
// ACTION: Specify partitioning/clustering/ordering based on the function
//         ref-cursor formal argument.
627, 0, "'%s' must be a strongly typed ref cursor"
// MANUAL: "variable must correspond to a strongly typed ref cursor"
// INDEX: "PARTITION", "ref cursor"
// RELEASE: 8.2
// CAUSE:  A partitioning or clustering/ordering specification specified on
//         an argument that is not a strongly typed ref cursor.
// ACTION: Specify partitioning/clustering/ordering based on the function
//         ref-cursor formal argument.
628, 0, "'%s' must be a valid record attribute"
// MANUAL: "variable must correspond to a valid record attribute"
// INDEX: "PARTITION", "CLUSTER", "ORDER"
// RELEASE: 8.2
// CAUSE:  A partitioning or clustering/ordering specification must use
//         only valid record attributes.
// ACTION: Specify partitioning/clustering/ordering based on valid
//         record attributes.
629, 0, "PIPE statement cannot be used in non-pipelined functions"
// MANUAL: 
// INDEX: "PIPE", "PIPELINED"
// RELEASE: 8.2
// CAUSE:  A PIPE statement was used in a non-pipelined function.
// ACTION: Use PIPE statement only in pipelined functions.
630, 0, "pipelined functions must have a supported collection return type"
// MANUAL:
// INDEX: "PIPELINED"
// RELEASE: 8.2
// CAUSE:  A pipelined function was specified with an unsupported return type.
//         The following are not supported as return types of pipelined
//         functions:
//          - non-collections,
//          - PL/SQL tables,
//          - associative arrays,
//          - collections of PL/SQL types: 
//             rowid, mlslabel, long, long raw, boolean, binary_integer,
//             pls_integer, string and urowid 
//         The following restrictions apply:
//          - If the return type is a collection of records, then each of the 
//            attributes of the record must be a supported type. 
//          - A collection of records must not contain a record type as 
//            one of its attributes.
// ACTION: Specify a supported collection type as the pipelined function 
//         return type.
631, 0, "PARTITION-BY and CLUSTER/ORDER-BY clauses must be used with the same function argument"
// MANUAL: 
// INDEX: "PARTITION", "CLUSTER", "ORDER"
// RELEASE: 8.2
// CAUSE:  PARTITION-BY and CLUSTER/ORDER-BY clauses are specified on different
//         function arguments.
// ACTION: Use the same argument in both PARITITON-BY and CLUSTER/ORDER-BY
//         clauses.
632, 0, "NOT INSTANTIABLE method cannot have a body"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 8.2
// CAUSE:  An attempt was made to provide an implementation for a
//         NOT INSTANTIABLE method.
// ACTION: Remove the implementation for the NOT INSTATIABLE method.
//
633, 0, "RETURN statement in a pipelined function cannot contain an expression"
// MANUAL: RETURN statement in a pipelined function cannot contain an expression
// INDEX: "PIPELINED", "RETURN"
// RELEASE: 8.2
// CAUSE: A RETURN statement in a pipelined function contains an expression, 
// which is not allowed. Pipelined functions must send back values to the
// caller by using the PIPE statement.
// ACTION: Remove the expression from the RETURN statement and use a PIPE
// statement to return values. Else, convert the function into a non-pipelined
// function.
//
634, 0, "type with NOT INSTANTIABLE methods must be declared NOT INSTANTIABLE"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 8.2
// CAUSE:  The type being created contains NOT INSTANTIABLE methods,
//        either declared or inherited. The type must be explicitly
//        declared NOT INSTANTIABLE
// ACTION: Explicitly specify the NOT INSTANTIABLE keyword or provide
//        implementations for all the NOT INSTANTIABLE methods.
635, 0, "method does not override"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 8.2
// CAUSE:  The method specification contains the OVERRIDING keyword but
//         the method does not override a method in the ancestor types.
// ACTION: Check the method specification.
636, 0, "overriding method requires OVERRIDING keyword"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 8.2
// CAUSE:  An attempt was made to provide an overriding method
//         specification, but the OVERRIDING keyword was not
//         specified.
// ACTION: Modify the method specification and specify the
//         OVERRIDING keyword.
637, 0, "FINAL method cannot be overriden or hidden"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 8.2
// CAUSE:  An attempt was made to override a FINAL MEMBER method or
//         hide a FINAL STATIC method.
// ACTION: Avoid overriding FINAL MEMBER methods or hiding FINAL
//         STATIC methods
638, 0, "cannot overload MAP method"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 8.2
// CAUSE:  The MAP method does override the inherited one.
// ACTION: Make the specifications match.
639, 0, "NCHAR/NVARCHAR2 cannot be byte length semantics"
// MANUAL: NCHAR/NVARCHAR2 cannot be byte length semantics
// INDEX:
// RELEASE:
// CAUSE: NCHAR/NVARCHAR can only be codepoint length sematics.
//   BYTE qualifiers used with NCHAR is illegal:
//      nc  NCHAR(7 BYTE);
//      name  NVARCHAR2(10 byte);
// ACTION: Remove BYTE qualifier to make it as codepoint length semantics
//
640, 0, "a pipelined function cannot be called from PL/SQL context"
// MANUAL: "a pipelined function cannot be called from PL/SQL context"
// INDEX: "PIPELINED"
// RELEASE: 8.2
// CAUSE:  A pipelined function was invoked from a PL/SQL expression.
// ACTION: Use the pipelined function in the FROM clause of a SQL query.
//
641, 0, "INTO clause not allowed for this SELECT statement"
// MANUAL: INTO clause not allowed for this SELECT statement
// INDEX: "INTO", "SELECT", "cursor", "OPEN", "cursor FOR loop"
// RELEASE: 8.2
// CAUSE: A SELECT statement in a cursor definition, an OPEN statement
// or a cursor FOR loop has an erroneous INTO clause.
// ACTION: Remove the INTO clause.
//
642, 0, "local collection types not allowed in SQL statements"
// MANUAL: local collection types not allowed in SQL statements
// INDEX: "SQL statements", "collections"
// RELEASE: 8.2
// CAUSE: A locally-defined (i.e. not schema level) collection type was
// used in a SQL statement. The type must be defined in a schema to be
// accepted in a SQL statement.
// ACTION: Define the collection type in your schema, not inside a
// PL/SQL subprogram.
//
643, 0, "booleans, index tables, records and cursors not allowed in SQL statements"
// MANUAL: booleans, index tables, records and cursors not allowed in SQL statements"
// INDEX: "SQL statements", "boolean", "index table", "record", "cursor"
// RELEASE: 8.2
// CAUSE: Items of type boolean, table of foo index by binary_integer,
// record and static cursors cannot be used in SQL statements.
// ACTION: Remove expressions of these types from the SQL statement.
//
644, 0, "character set mismatch found at '%s' among result expressions in a CASE expression"
// MANUAL:
// INDEX:
// RELEASE: 8.2
// CAUSE:  In a CASE expression, the result expressions do not match in
//         character set, and it is unclear which implicit conversion is
//         required to correct the mismatch.
// ACTION: Change the result expressions so that their character sets match.
645, 0, "character set mismatch found at '%s' among operands in a COALESCE expression"
// MANUAL:
// INDEX:
// RELEASE: 8.2
// CAUSE:  In a COALESCE expression, the operands do not match in character
//         set and it is unclear which implicit conversion is required to
//         correct the mismatch.
// ACTION: Change the operands so that their character sets match.
646, 0, "MAP or ORDER method must be defined in the root of the subtype hierarchy"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 8.2
// CAUSE:  An attempt was made to define a MAP or ORDER method in a subtype.
// ACTION: Define the MAP or ORDER method in the root of the subtype hierarchy.
//         You can override MAP methods in subtypes.
647, 0, "attribute by name \"%s\" conflicts with method by same name"
// MANUAL: A local or inherited attribute can not have name same as that of a 
//         local or inherited method.
// INDEX: "Create Type", "Alter Type", "Add Method", "Add Attribute"
// RELEASE: 9.0
// CAUSE: While creating a subtype some attribute name conflicted with a method
// name.
// ACTION: Use a different name for attribute or method in the type being created.
648, 0, "type of supertype attribute \"%s\" can not be a subtype or reference to a subtype in this release"
// MANUAL: Type of an attribute can not be a subtype or reference to a subtype of
// the type in which the attribute is defined.
// INDEX: "Create Type", "Alter Type", "Add Attribute"
// RELEASE: 9.0
// CAUSE: User tried to complete a type, Tsub as a subtype of another type, Tsuper
// where Tsuper contained an attribute of type Tsub or of type REF to Tsub. This is
// an implementation restriction. 
// ACTION: Change the design of code to not use any type with attribute whose type
// is of subtype or REF to subtype.
649, 0, "method \"%s\" can be overridden only once per object type"
// MANUAL: The inherited method is overridden more than once the same subtype.
// INDEX: "Create Type"
// RELEASE: 9.0
// CAUSE: User tried to override the method more than once in the same subtype.
// ACTION: Either make this an extra overload by removing the OVERRIDING keyword where
// the method signature is different. The argument types should be reconsidered otherwise.
650, 0, "invalid type for PARTITION/CLUSTER/ORDER BY clause"
// MANUAL: The table function does not allow all types like CLOB/BLOB 
//         in PARTITION?ORDER?CLUSTER BY clauses
// INDEX: "Table Function"
// RELEASE: 9.0
// CAUSE: Uer tried to use invalid type for PARTITION/CLUSTER?ORDER BY clause.
// ACTION: Use legal allowed types.
651, 0, "implementation type in Aggregate/Table function should be a valid type"
// MANUAL: For Aggregate funtion or Interface style table functions
//         The implementation type can only be a user defined type.
// INDEX: "Table Function"
// RELEASE: 9.0
// CAUSE: User tried to use some other database object like a package to
//        define implementation type of an aggregate/table function.
// ACTION: Use a valid user defined type as implementation type.
652, 0, "aggregate functions should have exactly one argument"
// MANUAL: aggregate functions should have exactly one argument.
// INDEX: "agregate Function"
// RELEASE: 9.0
// CAUSE: User tried to create aggregate function with either 0 or more than
//        one arguments.
// ACTION: Do not create aggregate function with 0 or more than one argument.
653, 0, "aggregate/table functions are not allowed in PL/SQL scope"
// MANUAL: aggregate/table functions are allowed only in a SQL statement.
// INDEX: "Table Function"
// RELEASE: 9.0
// CAUSE: User tried to use a table/aggregate function in PL/SQL scope.
// ACTION: Do not use table/aggregate function in PL/SQL scope.
654, 0, "PARTITION/ORDER/CLUSTER BY are allowed for only with PARALLEL_ENABLE "
// MANUAL: partition by, orser by cluster by are allowed, only if parallel 
//         enable option is also set for that table function
// INDEX: "Table Function"
// RELEASE: 9.0
// CAUSE: User tried partion by order by cluster by without parallel enable
//        clause in table function.
// ACTION: specify parallel enable also when using partion by, cluster by
//         order by clause.
655, 0, "only functions can be declared as PIPELINED"
// MANUAL: only functions can have attributes like pipelined, order by 
//         cluster by, partition by
// INDEX: "Table Function"
// RELEASE: 9.0
// CAUSE: user is trying to declare a procedure to be pipeliend function
// ACTION: declare a function instead of a procedure to be a pipelined function
656, 0, "field '%s' not available in input argument"
// MANUAL:
// INDEX: "Datetime"
// RELEASE: 9.0
// CAUSE:  An EXTRACT operation specified a field that was not present.
//         For example, you tried to extract the YEAR field from a TIME
//         variable.
// ACTION: Specify a legal field in the call to EXTRACT.
657, 0, "Implementation restriction: bulk SQL with associative arrays with VARCHAR2 key is not supported."
// MANUAL:
// INDEX:
// RELEASE: 9.0.2
// CAUSE:  Variable or expression of associative array type was used as
//         bulk SQL bind or define.
// ACTION: Use colleciton types supported by bulk SQL.
658, 0, "constructor method name must match type name"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 9.0.2
// CAUSE: The name of the object type constructor does not match the type name.
// ACTION: Change the name of the constructor method to match the type name.
659, 0, "constructor method must return SELF AS RESULT"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 9.0.2
// CAUSE: The return clause of the constructor method did not specify SELF AS
//        RESULT.
// ACTION: Change the return clause to include RETURN SELF AS RESULT.
660, 0, "SELF parameter of constructor method must be IN OUT"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 9.0.2
// CAUSE: The mode of the SELF parameter of the constructor was not IN OUT.
// ACTION: Change the mode of the SELF parameter to be IN OUT.
661, 0, "RETURN statement in a CONSTRUCTOR cannot include an expression"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 9.0.2
// CAUSE: An attempt was made to include an expression in the RETURN statement
//        of a CONSTRUCTOR body.
// ACTION: Remove the expression from the RETURN statement.
662, 0, "Non-external object types containing external mapped attributes are not allowed"
// MANUAL:
// INDEX: "Create Type"
// RELEASE: 9.0.2
// CAUSE: An attempt was made to create a non-external object, whoose attributes
//        are mapped externally.
// ACTION: Create the object as an external object.
//
663, 0, "the NEW keyword is not allowed in this context"   
// MANUAL: object types
// INDEX: 
// RELEASE: 9.0.2
// CAUSE: The NEW keyword is not followed by an call to a constructor method.
// ACTION: Remove the NEW keyword, or make sure the expression following it is a
//         constructor call.
// 
664, 0, "Both ORDER BY and CLUSTER BY can not be specified for the same table function"
// MANUAL:
// INDEX: "Table Function"
// RELEASE: 9.2.0
// CAUSE: An attempt was made to specify both ORDER BY and CLUSTER BY 
//        for the same table function.
// ACTION: specify either ORDER BY or CLUSTER BY for a table 
//         function, but not both.
665, 0, "ORDER BY and CLUSTER BY clauses require a PARTITION BY clause"
// MANUAL:
// INDEX: "Table Function"
// RELEASE: 9.2.0
// CAUSE: An attempt was made to specify an ORDER BY or CLUSTER BY clause 
//        without also specifying a PARTITION BY clause.
// ACTION: Add a PARTITION BY clause, or remove the ORDER BY or CLUSTER BY
//         clause.
666, 0, "Only index by binary_integer/pls_integer associative arrays allowed here"
// MANUAL:
// INDEX: "Bulk Binds"
// RELEASE: 10.0.0
// CAUSE: An attempt was made to specify index collection that was not
//        indexed by binary_integer or pls_integer.
// ACTION: Change the index collection variable type to associative 
//         array that is indexed by binary_integer or pls_integer. 
667, 0, "Element type of associative array should be pls_integer or binary_integer"
// MANUAL:
// INDEX: "Bulk Binds"
// RELEASE: 10.0.0
// CAUSE: An attempt was made to specify index collection whos element type
//        was not one of pls_integer or binary_integer.
// ACTION: Change the index collection variable type to associative 
//         array whose element type is pls_integer or binary_integer. 
668, 0, "Type of expression should be a collection type"
// MANUAL:
// INDEX: "Bulk Binds"
// RELEASE: 10.0.0
// CAUSE: An attempt was made to specify expression after INDICES OF or 
//        VALUES OF clause whose type is not a collection type.
// ACTION: Change the index collection expression type to 
//         a valid collection type. 
669, 0, "Type of expression should be a valid collection variable"
// MANUAL:
// INDEX: "Bulk Binds"
// RELEASE: 10.0.0
// CAUSE: An attempt was made to specify expression after INDICES OF or 
//        VALUES OF clause that is not a collection variable.
// ACTION: Change the index collection expression type to 
//         a valid collection variable. 
670, 0, "sort columns must be simple column names"
// MANUAL:
// INDEX: "PARTITION", "CLUSTER", "ORDER"
// RELEASE: 10.0.0
// CAUSE: An attempt was made to specify an expression as a sort column in a
//        PARTITION BY, CLUSTER BY or ORDER BY clause.  Only simple column names
//        are permitted. 
// ACTION: Specify a simple column name.
671, 0, "this expression is allowed only with instance methods"
// MANUAL:
// INDEX: "OBJECTS"
// RELEASE: 11.0.0
// CAUSE: The generalized invocation syntax was used in instance method
//        context.
// ACTION: The generalized invocation syntax can only be used in a 
//         instance method that is not a constructor
672, 0, "The expression %s should be a subtype of the type %s"
// MANUAL:
// INDEX: "OBJECTS"
// RELEASE: 11.0.0
// CAUSE: The expression in the generalized expression should be a sub type of the
//        type.
// ACTION: The type of expression should be a subtype of the type name
673, 0, "Generalized expression is not allowed in this context"
// MANUAL:
// INDEX: "OBJECTS"
// RELEASE: 11.0.0
// CAUSE: The generalized expression is used in wrong context
// ACTION: Fix the expression and remove the generalized expression syntax.
//
674, 0, "references to fields of BULK In-BIND table of records or objects must have the form A(I).F"
// MANUAL:
// INDEX:
// RELEASE: 11.0.0
// CAUSE: The form table(bulk_index).field is the only field selection
// supported at runtime. 
// ACTION:Use a FOR loop instead of the FORALL DML statement 
//        (MERGE/INSERT/DELETE/UPDATE) or revise reference to fit
//        the form allowed.
//
675, 0, "invalid section for this type of Compound Trigger"
// MANUAL:
// INDEX: "TRIGGERS"
// RELEASE: 11.0.0
// CAUSE:  Before and After row sections are not allowed for Compound trigges defined on
//         the Table and instead of row section is not allowed for Compound Triggers
//         defined on a view.
// ACTION: Remove the invalid sections for this context.
676, 0, "duplicate Compound Triggers section"
// MANUAL:
// INDEX: "TRIGGERS"
// RELEASE: 11.0.0
// CAUSE: Each Compound Trigger Section can appear at most once
//        in a body of the compound trigger
// ACTION: Remove the offending sections.
677, 0, "Compound Triggers cannot be autonomous transactions"
// MANUAL:
// INDEX: "TRIGGERS"
// RELEASE: 11.0.0
// CAUSE: The Compound Triggers hsd pragma autonomous transaction.
// ACTION: Call autonomous function or procedure, if autonomous
//         transaction behavior is desired from Compound Triggers.
678, 0, "RETURN statement not allowed inside Compound Triggers"
// MANUAL:
// INDEX: "TRIGGERS"
// RELEASE: 11.0.0
// CAUSE: A return Statement was seen inside a compound trigger
// ACTION: Remove Return statement and use other PL/SQL constructs
//         to transfer flow of control. 
679, 0, "trigger binds not allowed in before/after statement section"
// MANUAL:
// INDEX: "TRIGGERS"
// RELEASE: 11.0.0
// CAUSE: :new or :old were used in this section.
// ACTION: Do not use trigger binds in this section
680, 0, "BEFORE/AFTER ROW sections were used in a view trigger"
// MANUAL:
// INDEX: "TRIGGERS"
// RELEASE: 11.0.0
// CAUSE: BEFORE/AFTER ROW sections are not allowed with instead of row
//        triggers.
// ACTION: Remove the offending sections.
700, 0, "PRAGMA EXCEPTION_INIT of %s must follow declaration of its exception in the same declarative part"
// MANUAL: PRAGMA EXCEPTION_INIT of '<MI>name<D>' must follow declaration of 
// its exception in the same declarative part
// INDEX: EXCEPTION_INIT
// RELEASE:
// CAUSE: An EXCEPTION_INIT pragma was not declared in the same block as its 
// exception. They must be declared in the proper order in the same block, 
// with the pragma declaration following the exception declaration.
// ACTION: Place the EXCEPTION_INIT pragma directly after the exception 
// declaration referenced by the pragma.
//
701, 0, "illegal ORACLE error number %s for PRAGMA EXCEPTION_INIT"
// MANUAL: illegal ORACLE error number <MI>num<D> for PRAGMA EXCEPTION_INIT
// INDEX:	"Oracle Error Number"
// RELEASE: 
// CAUSE: The error number passed to an EXCEPTION_INIT pragma was out of 
// range. The error number must be in the range -9999 .. -1 (excluding -100) 
// for Oracle errors or in the range -20000 .. -20999 for user-defined errors.
// ACTION: Use a valid error number.
//
702, 0, "second argument to PRAGMA EXCEPTION_INIT must be a numeric literal"
// MANUAL: second argument to PRAGMA EXCEPTION_INIT must be a numeric literal
// INDEX:	"Oracle Error Number"
// RELEASE: 
// CAUSE: The second argument passed to an EXCEPTION_INIT pragma was something 
// other than a numeric literal (a variable, for example). The second argument 
// must be a numeric literal in the range -9999 .. -1 (excluding -100) for 
// Oracle errors or in the range -20000 .. -20999 for user-defined errors.
// ACTION:Replace the second argument with a valid error number.
//
703, 0, "multiple instances of named argument in list"
// MANUAL: more than one of the actuals refers to the same named parameter
// INDEX:	"Oracle Error Number"
// RELEASE: 
// CAUSE:  Two or more actual parameters in a subprogram call refer to the 
// same formal parameter.
// ACTION: Remove the duplicate actual parameter.
//
704, 0, "'%s' must be declared as an exception"
// MANUAL: '<MI>name<D>' must be declared as an exception
// INDEX:	
// RELEASE: 
// CAUSE: The exception_name parameter passed to an EXCEPTION_INIT pragma is 
// misspelled or does not refer to a legally declared exception. Or, the 
// pragma is misplaced; it must appear in the same declarative section, 
// somewhere after the exception declaration.  
// ACTION: Check the spelling of the exception_name parameter. Then, check the 
// exception declaration, making sure the exception name and the keyword 
// EXCEPTION are spelled correctly. Also make sure the pragma appears in the 
// same declarative section somewhere after the exception declaration.
//
705, 0, "exception '%s' used in expression requiring return type"
// MANUAL:
// INDEX:	
// RELEASE: 
// CAUSE: An exception was referred to in an expression. Exceptions have names 
// but not values and therefore cannot contribute values to an expression. For 
// example, the following RETURN statement is illegal:     
// FUNCTION credit_limit (cust_no INTEGER) RETURN NUMBER IS
//     limit       NUMBER;
//     over_limit  EXCEPTION;
//         ...     
// BEGIN
//     ...
//     RETURN over_limit;  -- illegal     
// END;
// ACTION: Check the spelling of the identifiers in the expression, then 
// rewrite the expression so that it does not refer to an exception.
706, 0, "Exception %s cannot be used as prefix of a selected component"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: An exception name was mistakenly used to qualify a reference to a 
// component. For example, when dot notation was used to specify fields within 
// a record, an exception name might have been coded instead of the record 
// name.
// ACTION: Rewrite the component reference using a valid prefix (for 
// example, the name of a package, record, or schema).
//
707, 0, "unsupported construct or internal error [%s]"
// MANUAL: "unsupported construct or internal error"
// INDEX:
// RELEASE:
// CAUSE: At run time, this is an internal error. At compile time, it 
// indicates one of the following problems:     
// -- A call was made to a remote subprogram that has a parameter type or 
//    default expression not supported at the calling site.     
// -- An incomplete upgrade or downgrade was done to a database that has 
//    stored procedures. Perhaps incorrect versions of system packages such as 
//    STANDARD.SQL were installed.     
// -- A compiler bug was encountered. In such cases, legal PL/SQL syntax 
//    will fail to compile.
// ACTION:
// Either report the internal error to your Customer Support representative 
// or, depending on the problem, take one of the following actions:     
// -- Revise the logic of the application to use parameter types and default 
//    expressions that are supported at both the local and remote sites.     
// -- Complete the upgrade or downgrade properly, making sure to install 
//    correct versions of all system packages.
// -- Report the legal-syntax error to your Customer Support representative. 
//    If there are line and column numbers displayed with the error message, 
//    they might help you find a workaround. For example, try recoding the 
//    offending 
//    line to avoid the bug.
//
708, 0, "Pragma %s must be declared in a package specification"
// MANUAL: this PRAGMA must be declared in a package specification
// INDEX: pragma
// RELEASE:
// CAUSE: The named pragma was not declared in a package specification, as 
// required. For example, the pragma RESTRICT_REFERENCES must be declared in a 
// package specification.
// ACTION: Remove or relocate the misplaced pragma.
//
//
709, 0, "pragma %s must be declared in package specification and body"
// MANUAL: this PRAGMA must be declared in package specification and body
// INDEX: pragma
// RELEASE:
// CAUSE: The named pragma was declared in a package specification but not in the corresponding package body or vice-versa,
// as well as the package body. 
// ACTION: Add the pragma to that part of the package declaration
// that does not have the pragma.
//
//
710, 0, "Pragma %s cannot be specified here"
// MANUAL:
// INDEX: PRAGMA
// RELEASE: 8.1
// CAUSE: The pragma was specified in an inappropriate context.  
// ACTION: Remove or relocate the misplaced pragma.  Check the documentation to
// determine the correct context for this pragma.
//
711, 0, "PRAGMA %s cannot be declared twice"
// MANUAL:
// INDEX: PRAGMA
// RELEASE: 8.1
// CAUSE: The PRAGMA was declared twice in the same block.
// ACTION: remove the duplicate declaration of the PRAGMA
//
712, 0, "illegal option for subprogram %s"
// MANUAL:
// INDEX:
// RELEASE: 8.1
// CAUSE: Only top level subprograms or subprogram declarations in PACKAGE
// or TYPE specifications are allowed to have the options DETERMINISTIC or
// PARALLEL_ENABLE.  For example, this error would be raised if the options
// are used in PACKAGE or TYPE body.
// ACTION: remove the option.
//
713, 0, "attempting to instantiate a type that is NOT INSTANTIABLE"
// MANUAL:
// INDEX:
// RELEASE: 8.2
// CAUSE:  An attempt was made to instantiate a type that is defined
//         as NOT INSTANTIABLE.
// ACTION: Avoid instantiating variables of this NOT INSTANTIABLE
//         type, instead derive an INSTANTIABLE subtype from it 
//         and instantiate variables of the subtype. 
//
714, 0, "supertypes's AUTHID is DEFINER but supertype and subtype are not in same schema"
// MANUAL:
// INDEX: "Create Type", "Invoker's Rights"
// RELEASE: 8.2
// CAUSE:    The supertype's AUTHID is DEFINER, but the supertype and subtype
// are defined in different schemas. SQL statements executed in dynamically
// dispatched methods can potentially pick up different values from database
// tables in the two schemas.
// ACTION: Create the subtype in the same schema as the supertype.
//
715, 0, "attribute or method by name '%s' does not exist"
// MANUAL: Attributes and methods to drop must be local to the type.
// INDEX: "Alter Type", "Drop Attribute", "Drop Method"
// RELEASE: 8.2
// CAUSE: An attempt was made to drop a nonexistant method or attribute 
//   from the type being altered.
// ACTION:Check the spelling of the attribute or method name. Make sure it
//   is locally defined in the type and not inherited.
//
716, 0, "Attribute/method '%s' can occur only once in an ALTER TYPE statement"
// MANUAL: Only one alter operation is allowed per attribute/method per ALTER
//         TYPE statement.
// INDEX: "Alter Type", "Drop Attribute", "Drop Method", "Modify attribute",
//        "Add Method", "Add Attribute"
// RELEASE: 8.2
// CAUSE: User attempted more than one of ADD, DROP or MODIFY on an attribute in
//   single ALTER TYPE statement. User attempted more than one of ADD or DROP on
//   a method in single ALTER TYPE statement.
// ACTION: Do only one ADD, DROP or MODIFY for an attribute in single ALTER TYPE
//   statement. Do only one ADD or DROP for a method in single ALTER TYPE statement.
//
717, 0, "method '%s' does not have matching signature among existing methods"
// MANUAL: Complete method signature is needed for dropping a method.
// INDEX: "Alter Type", "Drop Method"
// RELEASE: 8.2
// CAUSE: The method to be dropped matches the name of some existing method
//   but does not match it in signature.
// ACTION: Make sure that a matching method signature is provided for dropping
//   a method.
//
718, 0, "type of attribute '%s' does not allow modifications to the attribute"
// MANUAL: Only VARCHAR2, NUMBER and RAW type attributes are allowed to be modified.
// INDEX: "Alter Type", "Modify Attribute"
// RELEASE: 8.2
// CAUSE: The type of the attribute to modify is not one of VARCHAR2, NUMBER,
//   or RAW.
// ACTION: Only VARCHAR2, NUMBER and RAW type attributes are allowed to be 
//   modified.
//
719, 0, "only widening of attribute '%s' constraints is allowed"
// MANUAL: Modify attribute allows only widening of constraints.
// INDEX: "Alter Type", "Modify Attribute"
// RELEASE: 8.2
// CAUSE: Modification to the attribute did not widen its constraints or
//   attempted to change the type of the attribute. For NUMBER type 
//   attributes, scale and precision can be changed to allow increase in
//   number of digits after and before the decimal point. For VARCHAR2 
//   and RAW type attributes the size can be increased. Other type
//   attributes are not allowed to be modified. Change of type of attribute
//   is also not allowed.
// ACTION: Change the constraint specification so as to widen the existing
//   constraints.To narrow the constraints or to change the type of the
//   attribute, you must drop the attribute and add it with new constraints
//   or new type. In that case you must also take appropriate steps to 
//   preserve your existing data based on the type (if you want to
//   preserve it).Typically this will involve backing up the data and 
//   restoring it after the ALTER TYPE.
//
720, 0, "type '%s' has evolved" 
// MANUAL: Type has evolved and a compiled unit using old type can not run.
// INDEX: "Alter Type"
// RELEASE: 8.2
// CAUSE: The type has evolved. The version of the type used by the compiled
//   code is not the same as the latest version of the type.
// ACTION: Recompile the code to use the latest version of the type.
721, 0, "'%s' formed a non-REF mutually-dependent cycle with '%s'"
// MANUAL: Type of added attribute in ALTER TYPE should not form non-ref
//         mutually dependent cycle with the type being altered.
// INDEX: "Alter Type", "Add Attribute"
// RELEASE: 8.2
// Cause:  This compilation was aborted because the library unit that was
//         compiled would have formed a non-REF mutually-dependent cycle with
//         some other library units.  This happens when an attempt is made to
//         compile types that have attributes of other types that may
//         participate in a cycle with this type.
//         Example:
//             create type t1;
//             create type t2 (a t1);
//             create type t1 (a t2);
// Action: Break the cycle (possibly by adding a REF or by using another
//         type).
722, 0, "supertypes's AUTHID is different than subtype's AUTHID"
// MANUAL:
// INDEX: "Create Type", "Invoker's Rights"
// RELEASE: 8.2
// CAUSE:    The subtype's's AUTHID must be same as the supertype's AUTHID.
// ACTION: Create the subtype with AUTHID of its supertype or do not specify
//  AUTHID for subtype.
//
725, 0, "type '%s' must be a supertype or subtype of the TREAT expression"
// MANUAL:
// INDEX: 
// RELEASE: 8.2
// CAUSE:   In TREAT(<expr> AS <type>), type must be a supertype or subtype of <expr>.
//
726, 0, "MODIFY ELEMENT is supported only on schema-level varray and nested tables"
// MANUAL: MODIFY ELEMENT is supported only on schema-level varray and nested table types.
// INDEX: "Alter Type", "Modify Limit"
// RELEASE: 10.0
// CAUSE: An attempt was made to modify the limit of a type that was not 
//   a schema-level varray and nested table type.
// ACTION: This is not a legal ALTER TYPE command for this type.
//
727, 0, "MODIFY LIMIT is supported only on schema-level varray types"
// MANUAL: MODIFY LIMIT is supported only on schema-level varray types.
// INDEX: "Alter Type", "Modify Limit"
// RELEASE: 10.0
// CAUSE: An attempt was made to modify the limit of a type that was not 
//   a schema-level varray type.
// ACTION: This is not a legal ALTER TYPE command for this type.
//
728, 0, "the limit of a VARRAY can only be increased and to a maximum 2147483647"
// MANUAL: The limit of a VARRAY can only be increased, and to a maximum 2147483647
// INDEX: "Alter Type", "Modify Limit"
// RELEASE: 10.0
// CAUSE: An attempt was made to decrease the limit or raise it past 2147483647.
// ACTION: This is not a legal limit for this type, change it.
//
729, 0, "only widening of the collection element type is allowed"
// MANUAL: Modify Element Type allows only widening of constraints.
// INDEX: "Alter Type", "Modify Element Type"
// RELEASE: 8.2
// CAUSE: Modification to the collection element type did not widen its 
//   constraints or attempted to change the type of the element. For NUMBER 
//   types, scale and precision can be changed to allow increase in
//   number of digits after and before the decimal point. For VARCHAR2 
//   and RAW type attributes the size can be increased. 
// ACTION: Change the constraint specification so as to widen the existing
//   constraints.
//
730, 0, "collection element type does not allow modifications"
// MANUAL: Only VARCHAR2, NUMBER and RAW type elements are allowed to be modified.
// INDEX: "Alter Type", "Modify Element Type"
// RELEASE: 10.0
// CAUSE: The element type to modify is not one of VARCHAR2, NUMBER,
//   or RAW. 
// ACTION: Only VARCHAR2, NUMBER and RAW collection elements can be modified.
731, 0, "ALTER TYPE is supported only on schema-level types"
// MANUAL: ALTER TYPE is supported only on schema-level types.
// INDEX: "Alter Type"
// RELEASE: 10.0
// CAUSE: An attempt was made to alter a type that was not schema-level.
// ACTION: ALTER TYPE is not legal for this type.
//
732, 0, "Illegal overload of ellipsis in formal parameter list"
// MANUAL:
// INDEX:
// RELEASE: 10.0
// CAUSE: An ellipsis and a non-ellipsis type appeared at the same
// position in separate overload candidates.  Currently, if ellipsis
// types are used they must appear in ALL overload candidates with
// the same name (regardless of the number or types of their formal
// parameters) at the same position in the formal parameter list.
// ACTION: Make sure that ellipsis types appear at the same position
// in all overload candidates.
//
733, 0, "RPCs to variable argument functions are not allowed"
// MANUAL:
// INDEX:
// RELEASE: 10.0
// CAUSE: Attempted to call a vararg function (a function which contains
// ellipsis in the formal parameter list) as an RPC.
// ACTION: Do not call vararg functions as an RPC.
//
734, 0, "Illegal use of an associational parameter with a formal ellipsis"
// MANUAL:
// INDEX:
// RELEASE: 10.0
// CAUSE: Attempted to use an associational actual argument for a
// formal ellipsis type argument.
// ACTION: Remove associational parameters which correspond to formal
// ellipsis types.
//
735, 0, "Attempted to declare more than one formal ellipsis parameter"
// MANUAL:
// INDEX:
// RELEASE: 10.0
// CAUSE: More than one ellipsis ('...') was found in a formal parameter 
// specification for a function or procedure
// ACTION: Make sure only one ellipsis appears in a formal parameter
// specification for any given function or procedure
//
736, 0, "user-declared operators are not allowed"
// MANUAL:
// INDEX:
// RELEASE: 10.0
// CAUSE: An attempt was made by the user to declare an operator (a function
// whose name is enclosed in single quotes ("'")).  Operators may only be
// declared in package STANDARD.
// ACTION: Remove the single quotes from around the function name, replacing
// them with double quotes (""") only if needed.
//
737, 0, "LIBRARY or ASSEMBLY file specification exceeds the maximum allowed length"
// MANUAL:
// INDEX:
// RELEASE: 10.0
// CAUSE: A string of more than expected number of chararacters was
// found for the LIBRARY or ASSEMBLY file specification.
// ACTION: Limit the LIBRARY or ASSEMBLY file specification to the 
// appropriate size for the platform.
//
738, 0, "REF target %s changed during compilation"
// MANUAL:
// INDEX:
// RELEASE: 10.0
// CAUSE: The current unit contains a REF to a target object. During
//        compilation, the REF's target object was simultaneously
//        changed by a different session. The current unit is therefore
//        invalid and needs to be recompiled to pick up the latest
//        definition of the REF target. 
// ACTION: Recompile the unit that has this error.
//
739, 0, "FORALL INSERT/UPDATE/DELETE not supported on remote tables"
// MANUAL:
// INDEX:
// RELEASE: 10.2
// CAUSE:  The current statement refers to remote insert/update/delete for 
//         remote object.
// ACTION:  Use a FOR loop instead of a FORALL loop or call a remote 
//          function or procedure that includes the FORALL INSERT/UPDATE/
//          DELETE statement.
//
//
740, 0, "ASSEMBLY identity specification exceeds the maximum allowed length"
// MANUAL:
// INDEX:
// RELEASE: 11.0
// CAUSE: A string of more than expected number of chararacters was
// found for the ASSEMBLY identity specification.
// ACTION: Limit the ASSEMBLY identity specification to the 
// appropriate size.
//
741, 0, "%s must be specified on subprogram %s's declaration and definition"
// MANUAL: 
// INDEX: "RESULT_CACHE"
// RELEASE: 11.0.0
// CAUSE: A property was specified on a subprogram's declaration but 
// not on its definition or vice-versa.
// ACTION: Certain subprogram properties (e.g., RESULT_CACHE) must be
// specified as part of the subprogram declaration and definition.
// For example, if the property RESULT_CACHE is specified on a 
// subprogram declared in a package specification, then it must also 
// be specified on the subprogram's definition in the package body 
// (and vice-versa).
// 
742, 0, "field %s is not yet denotable"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: When the fields of a record were declared, one field was used to
//  initialize another, as in:
//  TYPE my_rec IS RECORD (f1 varchar2(10), f2 varchar2(10) := f1);
//  The first field has no value until run time, so it cannot be used to
//  initialize another field. 
// ACTION: Remove the illegal field reference.
//
751, 0, "cannot find PACKAGE SYS_STUB_FOR_PURITY_ANALYSIS"
// MANUAL: 
// INDEX:
// RELEASE: 
// CAUSE: A top level subprogram (function or procedure) cannot be created 
// if the system package SYS_STUB_FOR_PURITY_ANALYSIS is missing in the 
// Oracle database.
// ACTION:  Make sure the package is in the database, and retry the creation
//
752, 0, "Table function %s is in an inconsistent state."
// MANUAL: 
// INDEX: 
// RELEASE: 10.0 
// CAUSE : Some of the internally generated types prefixed with SYS_ 
// have been dropped.  These should never be dropped by the user. 
// ACTION: Recompile the table function or the package or type 
// that contains the table function. 
// 
753, 0, "malformed or corrupted wrapped unit"
// MANUAL: 
// INDEX: 
// RELEASE: 10.2 
// CAUSE : The format of the wrapped unit being compiled is not understood
//         by the compiler. This may be because the unit was edited
//         or modified after it was wrapped.
// ACTION: Rewrap the unit.
//
754, 0, "illegal reference to editioned object %s"
// MANUAL: 
// INDEX: 
// RELEASE: 11.1 
// CAUSE : An attempt was made to violate the rule "A noneditioned object may
//         not depend on an editioned object."
// ACTION: Either make this obejct editioned; or do not make the illegal
//         reference.
//
755, 0, "SYSAUX tablespace offline while saving identifier data"
// MANUAL: 
// INDEX: 
// RELEASE: 11.1
// CAUSE : The SYSAUX tablespace was offline while attempting to save
//         identifier data.  Any identifier data previously collected and
//         saved for the libunit will be invalid.
// ACTION: Bring the SYSAUX tablespace back online and recompile the object.
//
756, 0, "PL/SQL does not support feature \"%s\" \"%s\" in this environment"
// MANUAL: 
// INDEX: 
// RELEASE: 11.1
// CAUSE : Some host environments of the PL/SQL compiler do not support the
//         full range of PL/SQL features. A construct in the program 
//         violated one of the current host's restrictions.
// ACTION: Modify the program to avoid using features that are not supported
//         by this host environment. Check the host environment documentation
//         for specific changes and limitations in PL/SQL features.
//
// NLS_DO_NOT_TRANSLATE [800,800]
800, 0, "PD%d(%d) %s %s"
// MANUAL: 
// INDEX:
// *Document: NO
// RELEASE: INTERNAL USE ONLY.  DO NOT DOCUMENT. 
// CAUSE: 
// ACTION:
//
801, 0, "internal error [%s]"
// MANUAL: "internal error"
// INDEX:
// RELEASE:
// CAUSE: This is a generic internal error that might occur during compilation 
// or execution. The first parameter is the internal error number.
// ACTION: Report this error as a bug to your Customer Support representative.
//
//
900, 0, "can't find body of unit '%s'"
// MANUAL: can't find body of unit '<NAME>'
// INDEX:
// RELEASE: 
// CAUSE: At run time, the body of a program unit could not be found.
//    This can happen for one of two reasons.  
//    --  First, there may be a unit 'a' which calls a module 'b', where 
//        the spec for 'b' exists but not the body. In this case, since 
//        the spec is present, there will be no compile-time errors.
//    --  Secondly, this can occur if there is a reference to a sequence
//        outside of the proper context such as a SQL statement.  In 
//        this case, the "spec" of the sequence reference can be found, but
//        it is invalid to actually run code which references the sequence
//        outside a SQL statement, as in:
//
//        i := seq.nextval;
//
// ACTION: If caused by the first reason, create a body for the object that
//     is being referenced.  If caused by the second reason, move the sequence
//    into a SQL statement.  For example,
//
//      i := seq.nextval;
//
//    can be replaced by:
//
//      select seq.nextval into temp from dual;
//      i := temp;
//
901, 0, "the data type of column '%s' of table '%s' is not supported"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: A column in a database table belongs to a datatype that is not 
//  supported by the current release of PL/SQL.
// ACTION: Remove the offending column from the table or copy the desired 
//  columns to another table.
//
902, 0, "A READ-ONLY bind variable used in OUT or IN-OUT context"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: A host variable that is protected from update was used in a 
// context that allows an update.
// ACTION: Check the context and change the use of the host variable, or 
// assign the value of the host variable to a PL/SQL local variable, then 
// use the local variable instead.
//
904, 0, "insufficient privilege to access object %s"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: An attempt was made to operate on a database object without the 
// required privilege. This error occurs, for example, if an attempt was 
// made to UPDATE a table for which only SELECT privileges were granted.
// ACTION: Ask the DBA to perform the operation or to grant you the required 
// privilege.
//
905, 0, "object %s is invalid"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: An invalid package specification or stored subprogram was 
// referenced. A package specification or stored subprogram is invalid if 
// its source code or any database object it references has been DROPped, 
// REPLACEd, or ALTERed since it was last compiled.
// ACTION: Find out what invalidated the package specification or stored 
// subprogram, then make sure that Oracle can recompile it without errors.
//
906, 0, "Compilation is not possible"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The PL/SQL compiler cannot run properly because its operating 
// environment is corrupted. For example, its error message file might be 
// inaccessible.
// ACTION: Check the PL/SQL operating environment, making sure that all 
// files required by the compiler are accessible.
//
907, 0, "cannot load library unit %s (referenced by %s)"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: PL/SQL is unable to find and load a library unit that was
//        previously available.  This typically happens when you try to
//        load a unit which references another library unit that is
//        non-existent or invalid.
// ACTION: Provide the needed library unit.
//
908, 0, "The stored format of %s is not supported by this release"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: PL/SQL cannot understand the stored format of a library unit.
//        It has been compiled or shrink-wrapped with a version of PL/SQL
//        either too new or too old for this version to understand it.
// ACTION: Recompile the library unit for this version of PL/SQL.
//
909, 0, "object %s is not declared or insufficient privileges to access object %s"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: An object from the operator declaration is not declared,
//        or it is declared but there is no sufficient privileges to
//        access that object.
// ACTION: Declare the object, or ask the DBA to grant the
//         privileges required to access the object.
//
910, 0, "insufficient privilege to inherit from type %s"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: An attempt was made to inherit from a type without the 
// required UNDER privilege. 
//
920, 0, "parameter plsql_native_library_dir is not set"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: A PL/SQL program is being compiled natively, but the compiler
//        parameter plsql_native_library_dir, which denotes the directory
//        to store the native shared objects (DLL), is not set.
// ACTION: The DBA should set this parameter.
//
923, 0, "native compilation failed: %s:%s"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The native compilation of PL/SQL program has failed because
//        the native shared object (DLL) could not be created successfully.
// ACTION: The DBA should ensure that the commands specified in spnc_commands
//         file are correct.
//
924, 0, "native compilation is not supported on this platform"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: Native compilation of PL/SQL programs is not supported
//        on this platform.
// ACTION: Compile the PL/SQL program to bytecode by setting the parameter
//         plsql_compiler_flags to INTERPRETED.
//
925, 0, "native compilation failed: Unable to create file (%s %s)"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: Native compilation of a PL/SQL program failed because a file
//        could not be created. It is likely that the system parameter 
//        plsql_native_library_dir does not reference a writable, existing
//        directory
// ACTION: Ensure that the system parameter plsql_native_library_dir references
//         a directory which exists, and is writable.
//
950, 0, "In this version, PL/SQL tables can not be used in this SQL statement."
// MANUAL:
// INDEX:
// RELEASE: 
// CAUSE: In a SQL statement, a PL/SQL table was referenced incorrectly. For 
// example, the following reference might have been made, but PL/SQL table 
// attributes can only be used in procedural statements:     
// SELECT ename_tab.COUNT INTO name_count WHERE ... 
// ACTION: Remove the incorrect reference from the SQL statement.
//
951, 0, "%s Feature is not supported by this release"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: PL/SQL cannot understand something in an imported library unit.
//        It uses some feature either too new or too old for this version
//        to understand it.
// ACTION: Recompile the imported library unit with this version of PL/SQL,
//         to discover more precisely what feature is not supported.
//
960, 0, "RPCs cannot use parameters with schema-level object types in this release"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: Schema-level object types, or types which recursively use such 
//        types, were used in an RPC, which is not permitted.  For example:
//        create type foo as object (...)
//        create package my_pack is
//           type my_rec is record(v foo);
//        -- on a remote server: 
//        x my_pack.my_rec@rpc;  -- illegal attempt to use type my_rec
// ACTION: Use only PL/SQL-defined types in RPC calls.  It may be necessary to
//        add extra code to element-wise copy schema-level types into local 
//        types in order to move such data through an RPC.
//
970, 0, "The class name of a method must match that of EXTERNAL NAME clause in the type header"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The class name defined as part of the method signature does not match
//        the one defined in the type header in the EXTERNAL NAME clause.
//        create type foo as object EXTERNAL NAME 'foo' LANGUAGE JAVA (...
//         MEMBER FUNCTION my (number) return number
//             EXTERNAL NAME 'bar.func(oracle.sql.NUMBER) return oracle.sql.NUMBER',
//             .. );
// ACTION: Either omit the class name from the method signature or use the one
//        defined in the type header.
//

989, 0, "Cursor Variable in record, object, or collection is not supported by this release"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: 3.0 Implementation Restriction for Ref Cursors
// ACTION:
//
990, 0, "Index Tables of Cursor Variables are disallowed"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: 2.2 Implementation Restriction for Ref Cursors
// ACTION:
//
992, 0, "Cursor Variables cannot be FETCH'ed from"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: 2.2 Implementation Restriction for Ref Cursors
// ACTION:
//
993, 0, "Cursor variables cannot be passed as forwarded RPC arguments or results"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: An attempt was made to pass a cursor variable to or from a remote 
// subprogram by way of a forwarded RPC, which is not allowed.
// For example, from a client-side tool, a procedure on a remote database cannot
// be used to open a cursor variable because remote subprograms cannot return
// the values of cursor variables.
// ACTION: Change the subprogram call to reference the local database.
//
994, 0, "Cursor Variables cannot be declared as part of a package"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:An attempt was made to declare a cursor variable in a package 
// specification, which is not allowed. 
// Although REF CURSOR types can be defined in a PL/SQL block, subprogram, 
// or package, cursor 
// variables can be declared only in a block or subprogram.
// ACTION:Move the cursor variable declaration into a PL/SQL block or 
// subprogram.
//
995, 0, "unhandled exception # %s"
// MANUAL: unhandled exception # <MI>num<D>
// INDEX: "Exception", "Unhandled Exception"
// RELEASE: 
// CAUSE: An exception was raised for which no handler was found. If it cannot 
// find a handler for a raised exception, PL/SQL returns an unhandled 
// exception to the host environment. The number embedded in the message is an 
// Oracle error code listed in this manual.
// ACTION: Fix the condition that raised the exception, write an appropriate 
// exception handler, or use the OTHERS handler. If there is an appropriate 
// handler in the current block, the exception was raised in a declaration 
// or exception handler, and therefore propagated immediately to the enclosing 
// block.
//
996, 0, "out of memory"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: A request from PL/SQL for more memory failed. 
// ACTION: Make sure that you are not referencing the wrong row in a PL/SQL 
// table and that the program is not recursing too deeply. 
//
997, 0, " no cursor return types allowed in this beta version"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Cursor return types have bugs, and it is best to disable them for now.
// ACTION:
//
998, 0, "implementation restriction (may be temporary)"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: 
// ACTION:
//
999, 0, "implementation restriction (may be temporary) %s"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: 
// ACTION:
//
/
/
/ HERE BEGINS THE FIPS FLAGS LIST.
/
1400, 0, "Use of '||' token"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  Use of '||' token in expressions is not in ANSI's grammar.  
//         This corresponds to the "binary_add_op"'s reduction to a "CAT_" 
//         in plsql.y
// ACTION:
//
1401, 0, "Identifier over 18 characters long"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Identifiers over 18 characters long are not allowed under
//        the ANSI grammar.
// ACTION:
//
1402, 0, "Use of quoted identifier"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  The use of quoted identifiers is a PL/SQL extension
//         and is not allowed under the ANSI grammar.
// ACTION:
//
1403, 0, "Comment delimiters /* */"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: C-style comments (introduced with the '/' and '*' characters)
//        are not part of the ANSI grammar.  To conform with ANSI, comments 
//        must be preceded by the ANSI comment introducer, '--' , and must not
//        contain a newline.  If someone can figure out a way to make this
//        message look less cheesy without ending up with nested comments, be
//        my guest.
// ACTION:
//
1404, 0, "ANSI Identifiers can only consist of letters, digits, and the underscore character" 
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  ANSI identifiers can only consist of letters, digits, and
//         the underscore character.  PL/SQL allows "#" and "$" in 
//         identifiers, but these are not ANSI.
// ACTION:
//
1405, 0, "Under ANSI's grammar, numeric data represented in exponent notationmust use an uppercase E"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Under ANSI's grammar, numeric data represented in exponent
//        notation must use an uppercase "E".  Example: 3.45E-6 is ANSI, but
//        3.45e-6 is not.
// ACTION:
//
1406, 0, "An identifier has been found that is considered a keyword in ANSI's grammar but not in PL/SQL's"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: An identifier has been found that is considered a keyword in
//        ANSI's grammar but not in PL/SQL's.
// ACTION:
//
1407, 0, "One of the identifiers CHAR, CHARACTER, or INTEGER has been redefined by the programmer"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: One of the identifiers "CHAR", "CHARACTER", or "INTEGER" (all
//        ansi keywords) has been redefined by the programmer.(special case of
//        1406, above).
// ACTION:
//
1408, 0, "Use of '&' token"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of '&' token in expressions is not in ANSI's grammar.
// ACTION:
//
1409, 0, "Use of 'PRIOR_' token"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of 'PRIOR_' token in expressions is not in ANSI's grammar.
// ACTION:
//
1410, 0, "Use of 'MOD' token"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of 'MOD' token in expressions is not in ANSI's grammar.
// ACTION:
//
1411, 0, "Use of 'REM' token"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of 'REM' token in expressions is not in ANSI's grammar.
// ACTION:
//
1412, 0, "Use of 'EXP' token"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of 'EXP' token in expressions is not in ANSI's grammar.
// ACTION:
//
1413, 0, "Use of NULL an expression"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of NULL an expression not in ANSI's grammar.
// ACTION:
//
1414, 0, "Use of qualified expression here"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of qualified expression here is not in ANSI's grammar.
// ACTION:
//
1415, 0, "Use of aggregate value here"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of aggregate value here is not in ANSI's grammar.
// ACTION:
//
1416, 0, "Use of <id> (<value>...) here"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of <id> (<value>...) here is not in ANSI's grammar.
// ACTION:
//
1417, 0, "Use of %%attribute"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use of %%attribute value here is not in ANSI's grammar.
// ACTION:
//
1418, 0, "Subquery cannot include set operators in ANSI's grammar"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Subquery cannot include set operators in ANSI's grammar.
// ACTION:
//
1419, 0, "Subquery must have either '*' or exactly one column in its select list"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  Subquery must have either '*' or exactly one column 
//         in its select list according to ANSI's grammar.
// ACTION:
//
1420, 0, "INTERSECT and MINUS set operators are not ANSI"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: INTERSECT and MINUS set operators are not ANSI
// ACTION:
//
1421, 0, "FOR UPDATE clause"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: FOR UPDATE clause is not in ANSI's grammar.
// ACTION:
//
1422, 0, "Aliases"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Aliases are not in ANSI's grammar.
// ACTION:
//
1423, 0, "Subquery on right-hand-side in set clause"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Subquery on right-hand-side in set clause
//        is not in ANSI's grammar.
// ACTION:
//
1424, 0, "Non-ANSI order of clauses"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: ANSI specifies an ordering to clauses in a table-expression
// which PL/SQL doesn't.  The ordering according to ANSI must be:
//	(1) from clause
//	(2) where clause
//	(3) group-by clause
//	(4) having clause
// In PL/SQL, the from clause must come first, and the clauses after 
// it can appear in any order (with the addition of the non-ansi
// connect-by clause).
// ACTION:
//
1425, 0, "Connect-by clause"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE:  ANSI doesn't allow connect-by clauses.
// ACTION:
//
1450, 0, "This <value expression> contains a nonconforming data type"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: This <value expression> contains a nonconforming data type.
//        Section 4.2 of X3H2, "Data types" states that:
//        "A nonnull value is either a character string or a number."
//        Many builtin functions in STANDARD will be flagged with this warning
//        by means of a pragma.
// ACTION:
//
1451, 0, "The data types of these <value expressions> must be comparable" 
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: The data types of these <value expressions> must be comparable.
//        Section 4.2 of X3H2, "Data types", states that:
//        "A character string and a number are not comparable values."
//        Many builtin functions in STANDARD will be flagged with this warning
//        by means of a pragma.  This warning will be place on data-type 
//        coercion functions, for example, TO_CHAR(<number>), that are inserted
//        in OracleSQL to allow non-conforming data type combinations.
// ACTION:
//
1452, 0, "This function is not part of the ANSI standard"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: This function is not part of the ANSI standard.
//        This warning is used to flag such functions as "POWER" that 
//        are not mentioned in the ANSI specifications.
// ACTION:
//
1453, 0, "This procedure is not part of the ANSI standard"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: This procedure is not part of the ANSI standard.
//        This warning is used to flag such procedures as "STOP" that 
//        are not mentioned in the ANSI specifications.
// ACTION:
//
1454, 0, "No operator may be used with values of data type CHAR"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: No operator may be used with values of data type "character
//        string".  Section 5.9, "<value expression>", syntax rule 3, of X3H2
//        states: "If the data type of a <primary> is character string, then 
//        the <value expression> shall not include any operators."  This 
//        warning is placed on many functions in STDBASE that take CHAR args.
// ACTION:
//
1455, 0, "The predicates IS NULL and IS NOT NULL are defined only for column specifications"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: The predicates "IS NULL" and "IS NOT NULL" are defined only for
//        column specifications, not for any other expressions.
//        Section 5.15, "<null predicate>", indicates that in the predicate
//        "x IS NULL", x must be a column, and may not be any other kind of
//        expression.
// ACTION:
//
1456, 0, "Name length cannot exceed 3."
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Name length cannot exceed 3.
// ACTION:
//
/
/
/ Obselete flag
/
// 1457, 0, "The length of a table name cannot exceed 2"},
// 1457: The length of a table name cannot exceed 2.
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: 
// ACTION:
//
1458, 0, "The set clause in an UPDATE statement requires a column name of length 1"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: The set clause in an UPDATE statement requires a 
//        column name of length 1.
//        Sect. 8.11, 8.12
// ACTION:
//
1460, 0, "Cannot access object on a remote host"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Cannot access object on a remote host.
// ACTION:
//
1463, 0, "STDDEV is not a standard set function"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: STDDEV is not a standard set function.
// ACTION:
//
1464, 0, "VARIANCE is not a standard set function"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: VARIANCE is not a standard set function.
// ACTION:
//
1466, 0, "Null strings are not allowed"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Null strings are not allowed.
// ACTION:
//
1467, 0, "The value list of the IN predicate, if not a subquery, must contain only value_specifications"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: The value list of the IN predicate, if not a subquery, must contain
// only value_specifications (i.e. literals and PL/SQL or embedded variables).
// ACTION:
//
1468, 0, "The first argument of the like-predicate must be a column of type character string"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: The first argument of the like-predicate must be a column of 
//        type character string.
// ACTION:
//
1469, 0, "ANSI standard does not permit records"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:  ANSI standard does not permit records. 
// ACTION:
//
1470, 0, "The escape character in the like-predicate must be a literal or a variable of type CHAR"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: The escape character in the like-predicate must be a literal 
//        or a variable of type character.
// ACTION:
//
1471, 0, "The keyword DISTINCT must be present in a COUNT(DISTINCT sim_expr)"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: The keyword DISTINCT must be present in a COUNT(DISTINCT sim_expr).
//        Sect 5.8
// ACTION:
//
1472, 0, "In a set_function_specification, if DISTINCT is present, the expression must be a column_specification"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: In a set_function_specification, if DISTINCT is present, the 
//        expression must be a column_specification.
// ACTION:
//
1473, 0, "Use <> instead of != or ~="
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Use <> instead of != or ~=.  Sect 5.11.
// ACTION:
//
1474, 0, "Use of ANY is non_ANSI"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Due to the combining of comparison_predicate and 
//        quantified_predicate, we may have something like
//        sim_expr = ANY_ sim_expr, which is nonetheless accepted by kernel.
// ACTION:
//
1500, 0, "Unions are not allowed in the definition of a view"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Unions are not allowed in the definition of a view.
//        Sect. 6.9
// ACTION:
//
1501, 0, "Options in CREATE TABLE statement is non-ANSI."
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: CREATE TABLE allows only the definition of the structure of a
//        table.  None of the .SPACE__name. .PCTFREE__numeric_literal. 
//        .cluster. is ANSI.  Sect. 6.2
// ACTION:
//
1502, 0, "Constraint name and constraint status are non-ANSI."
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Constraint name and constraint status are non-ANSI.
//        Sect. 6.3
// ACTION:
//
1503, 0, "The expression in a SET clause must not include a set function"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: The expression in a SET clause must not include a set function.
//        Sect. 8.12.
// ACTION:
//
1504, 0, "Use of AS phase in CREATE TABLE statement is non_ANSI"
// NEW DDL FLAGS
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: CREATE TABLE allows only the definition 
//        of the structure of a table.
//        Use of AS phase in CREATE TABLE statement is non-ANSI.
// ACTION:
//
1505, 0, "ALTER is non-ANSI"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: ALTER is non-ANSI
// ACTION:
//
1506, 0, "CREATE INDEX is non-ANSI"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: CREATE INDEX is non-ANSI
// ACTION:
//
1507, 0, "DROP is non-ANSI"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: DROP is non-ANSI
// ACTION:
//         Sect. 6.2
//
1701, 0, "Illegal syntax in ROLLBACK WORK statement"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Illegal syntax in ROLLBACK WORK statement.
// ACTION:
//
1702, 0, "Illegal syntax in COMMIT WORK statement"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Illegal syntax in COMMIT WORK statement.
// ACTION:
//
1703, 0, "Cursor name in CLOSE statment must be of length 1"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Cursor name in CLOSE statment must be of length 1.
// ACTION:
//
1704, 0, "The expressions in a sort clause must be column specs or unsigned integers, with optional ASC or DESC"
// MANUAL: The expressions in a sort clause must be column specs or unsigned integers, with optional ASC or DESC
// INDEX:
// RELEASE:
// CAUSE: The expressions in a sort clause may only be 
//        column specifications or unsigned integers, followed
//        by optional ASC or DESC.
// ACTION:
//
1705, 0, "table specified by a cursor not updatable if cursor specification has a UNION or ORDER_BY"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: The table specified by a cursor is not updatable if
//        the cursor specification contains a UNION or ORDER_BY. 
// ACTION:
//
/
/
/ Obselete flag
/
// 1706, 0, "Missing keyword FROM"},
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: Missing keyword FROM.
// ACTION:
//
1707, 0, "In positioned DELETE or UPDATE statement, table must be identified in specification of cursor"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: In a positioned DELETE or UPDATE statement, the table
//        deleted fromor updated must be identified in the 
//        specifictation of the cursor.
// ACTION:
//
1708, 0, "In searched DELETE, UPDATE or INSERT, table must not appear in FROM clause of subqueries in search condition"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: In a searched DELETE, UPDATE or INSERT statement,
//        the table affected must not appear in a FROM clause
//        in any of the subqueries in the search condition.
// ACTION:
//
1709, 0, "value list of INSERT statement, if specified with value list rather than subquery, must be value specification"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: In an INSERT statement, the insert value list, if
//        specified with a value list rather than a subquery, must
//        be value specifications, i.e. no compound expressions
//        or column references.  Sect 8.7.
// ACTION:
//
1710, 0, "In a positioned DELETE or UPDATE statement, the cursor name must be of length 1"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: In a positioned DELETE or UPDATE statement, the cursor
//        name must be of length 1.
// ACTION:
//
1711, 0, "A SELECT statement may not contain ORDER_BY, HAVING, or GROUP_BY clause"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: A SELECT statement may not contain ORDER_BY, HAVING,
//        or GROUP_BY clause.  Sect. 8.10.
// ACTION:
//
1712, 0, "ANSI does not allow bind variables as INDICATORS"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: ANSI does not allow bind variables as INDICATORS
// ACTION:
//
1713, 0, "The constraints on these types do not match"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The constraints on these types do not match
// ACTION:
//
1714, 0, "ANSI expects a column name not a literal value here"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: ANSI expects a column name not a literal value here
// ACTION:
//
1715, 0, "ANSI does not accept SAVEPOINTs"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE:
// ACTION:
//
/ HERE ENDS THE FIPS FLAGS LIST.                        
/ HERE BEGINS THE VALUE_ERROR SUB MESSAGES
1900, 0, ": character to number conversion error"  
// MANUAL:  
// INDEX:  
// RELEASE:  
// CAUSE:  There was a failure while converting a character string  
//         into a numeric value.  
// ACTION: Verify that all character strings assigned to number  
//         variables have valid numeric value interpretations.  
//  
//  
1901, 0, ": host bind array too small"  
// MANUAL:  
// INDEX:  
// RELEASE:  
// CAUSE:  PL/SQL was unable to transfer data into a host array  
//         because the array is too small.  
// ACTION: Increase the size of the host array.  
//  
1902, 0, ": hex to raw conversion error"  
// MANUAL:  
// INDEX:  
// RELEASE:  
// CAUSE:  There was a failure while converting a hexadecimal string  
//         to a raw.  
// ACTION: Verify that the hexadecimal variable to be converted  
//         contains a valid hexadecimal value.  
//  
1903, 0, ": non-integer error number"  
// MANUAL:  
// INDEX:  
// RELEASE:  
// CAUSE:  SQLERRM() was called with a non-integer value.  
// ACTION: Make sure SQLERRM() is called with an integer value.  
//  
1904,0, ": NULL index table key value"  
// MANUAL:  
// INDEX:  
// RELEASE:  
// CAUSE:  An attempt was made to index into an index table with  
//         a NULL key value.  
// ACTION: Make sure key values used to index into index tables  
//         are non-NULL.  
//  
1905,0, ": character string buffer too small"  
// MANUAL:  
// INDEX:  
// RELEASE:  
// CAUSE:  An error was encountered while moving a character  
//         string from a source to a destination. This error   
//         occurs if, for example, an attempt is made to move a  
//         a character string of 10 characters into a 1 character  
//         buffer. The cause of this error may not always be  
//         obvious. For example, the following will result in  
//         this error:  
//           a varchar2(1);  
//           b number;  
//           b := 10;  
//           a := b;  
//         An error results because an implicit conversion causes  
//         the number 10 to become the character string '10', which  
//         does not fit in the character buffer of 1 allocated for the  
//         variable a.  
// ACTION: First, look for character string assignment statements  
//         where the buffer size is mismatched. If there are none  
//         found, then consider the implicit conversion case  
//         illustrated in the example above.  
//  
1906,0, ": raw variable length too long"  
// MANUAL:  
// INDEX:  
// RELEASE:  
// CAUSE:  The length of a raw variable being copied or assigned was too  
//         long to fit into its destination.  
// ACTION: Make sure the raw variable length is correct.  
//  
1907,0, ": number precision too large"  
// MANUAL:  
// INDEX:  
// RELEASE:  
// CAUSE:  The number begin copied or assigned had too many digits to  
//         the left of the decimal and did not fit into its destination.   
//         In other words, there is a number precision mismatch. This  
//         error may also occur if, for example, an attempt is made to  
//         assign a character string to a number, as demonstrated below.
//           a varchar2(4);  
//           b number(1,1);  
//           a := '10.1';  
//           b := a;  
// ACTION: First, check explicit number precision value mismatches. If  
//         none are found, then consider implicit conversions of  
//         other types to numbers, including conversions performed  
//         during binds.  
//  
1908,0, ": RETURNING INTO buffer too small"  
// MANUAL:  
// INDEX:  
// RELEASE:  
// CAUSE:  PL/SQL determined that a server side DML with a RETURNING INTO  
//         clause does not use a buffer that is large enough to hold the  
//         data being returned.  
// ACTION: Increase the size of the RETURNING INTO clause buffer. 
1909,0, ": cannot assign supertype instance to subtype"  
// MANUAL:  
// INDEX:  
// RELEASE:  9.0.0
// CAUSE:  An attempt was made to assign or copy a supertype instance to
//         a container (destination) that can only hold a subtype instance.
// ACTION: Make sure the runtime type of the source of the assignment or
//         copy is the same type as the destination or is a subtype of the
//         destination type
1910,0, ": associative array shape is not consistent with session parameters"
// MANUAL:
// INDEX:
// RELEASE:  9.0.2
// CAUSE:  NLS parameters affecting comparison of keys have been altered 
//         dynamically.  The associative array's index is invalid.
// ACTION: Avoid using associative arrays with string keys in applications 
//         which require frequent changes of NLS_COMP and/or NLS_SORT.
1911,0, ": associative array key violates its type constraints"
// MANUAL:
// INDEX:
// RELEASE:  9.0.2
// CAUSE:  The key value of an element being inserted into an associative
//         array violates the the key type constraints. 
// ACTION: Relax the constraints if the key value is meant to be acceptable.
//         Otherwise, apply a valid key value when inserting an element.
1912,0, ": instance must of be of type '%s'"
// MANUAL: object types
// INDEX:
// RELEASE:  9.0.2
// CAUSE:  The run-time type of the instance is not the declared type. 
//         e.g. If the return value of a user defined constructor is wrong.
// ACTION: Return the correct type.
1913,0, ": instance must of be of type '%s' or one of its subtypes"
// MANUAL: object types
// INDEX:
// RELEASE:  9.0.2
// CAUSE:  The run-time type of the instance is the not declared type or
//         one of its subtypes. 
//         e.g. TREAT(supertype AS subtype) fails.
// ACTION: Catch the exception.
1914, 0, "duplicate SECURITY specification in subprogram expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two SECURITY specifications.
// ACTION: Remove one of the SECURITY specifications.
1915, 0, "duplicate ASSEMBLY specification in subprogram expression"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The subprogram was found to have two ASSEMBLY specifications.
// ACTION: Remove one of the ASSEMBLY specifications.
1916, 0, "SECURITY level specification exceeds ASSEMBLY SECURITY specification"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The security level specified in the callspec exceeds the maximum
// security level allowed by the assembly.
// ACTION: Lower the security level specified in the callspec to match the
// maximum security level specificed in the assembly.
1917, 0, "illegal reference to package STANDARD item '%s'"
// MANUAL:
// INDEX:
// RELEASE:
// CAUSE: The item is intended for internal use and must not be referred to
// in user code.
// ACTION: Remove the reference and use syntax that provides the necessary 
// functionality.
1918, 0, "9.2 and earlier wrap formats are not permitted"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: An attempt was made to compile a unit that was wrapped using 9.2 
// or earlier version of the wrap utility. Wrapped source created by 9.2 
// and earlier versions of wrap is not permitted on this database.
// ACTION: Wrap the source using 10g or later versions of the wrap utility. Alternately, 
// set the initialization parameter PERMIT_92_WRAP_FORMAT parameter to TRUE. 
