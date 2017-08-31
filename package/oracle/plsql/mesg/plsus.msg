/ Copyright (c) 1991, 2000 by Oracle Corporation
/   NAME
/     plsus.msg - <one-line expansion of the name>
/   DESCRIPTION
/     <short description of component this file declares/defines>
/   RETURNS
/   NOTES
/     <other useful comments, qualifications, etc.>
/   MODIFIED   (MM/DD/YY)
/      yifeng   03/12/08 - lrg 3331276
/      brwolf   10/13/06 - Bug 5577316: Clean up Result Cache syntax
/      ciyer    09/25/06 - add 11R1 NLS_DO_NOT_TRANSLATE delimiters
/      kmuthukk 06/26/06 - dont capture PURGE 
/      kmuthukk 06/26/06 - dont capture PURGE 
/      kmuthukk 06/26/06 - do not capture purge at stmt beginning 
/      kmuthukk 06/02/06 - shared func result cache 
/      brwolf   05/10/06 - bug 5203501: Add missing PL/SQL tokens to
/                          plsql.recover
/      rdecker  03/28/06 - incorporate review comments 
/      rdecker  12/15/05 - adding assembly support 
/      cwethere 02/03/06 - 
/      gviswana 06/20/05 - More parser cleanups 
/      mxyang   07/11/05 - phase one reorg
/      sagrawal 06/15/05 - making more changes 
/      sagrawal 04/07/04 - Changes in grammar with no diana changes 
/      wxli     04/16/04 - 
/      wxli     04/08/04 - add LIKE2,LIKE4 and LIKEC 
/      jmuller  07/05/05 - Fix bug 4435282: dblink identifiers can be longer 
/      gviswana 12/08/04 - Better nonterminal names 
/      mxyang   07/01/04 - add 10gR2 NLS_DO_NOT_TRANSLATE delimiters
/      mxyang   05/24/04 - preprocessor support
/      gviswana 03/11/04 - Disallow string literals in names 
/      mxyang   07/02/03 - add 10iR1 NLS_DO_NOT_TRANSLATE delimiters
/      rpang    05/30/03 - distinguish optional DECLARE keyword
/      dbronnik 02/25/03 - sparse collections
/      mxyang   01/22/03 - native syntax for binary_flt/dbl trusted callout
/      cbarclay 12/09/02 - not submultiset
/      cbarclay 11/07/02 - member
/      sagrawal 09/25/02 - lint
/      sagrawal 04/23/02 - Sparse collection support for Bulk BINDS
/      rdecker  09/12/02 - add vararg support
/      cbarclay 07/09/02 - alter array
/      cbarclay 07/01/02 - rope off alternatively quoted string_literal
/      mxyang   07/31/02 - remf, nan, infinite
/      cbarclay 01/24/02 - new
/      cbarclay 01/21/02 - new adt_constructor
/      cbarclay 01/10/02 - regen for is_of_2
/      sagrawal 10/29/01 - bug 2075024
/      lvbcheng 10/10/01 - bug 1960680: empty sub types
/      cbarclay 07/05/01 - user defined constructor support
/      qyu      09/13/01 - type evolution syntax
/      ciyer    06/19/01 - bugfix 1764948
/      mxyang   06/06/01 - b759390: remove unused keyword DELAY_ and others
/      rdani    04/20/01 - Fix 1643827.Handle ALTER TYPE in wrapped files
/      rdani    02/08/01 - Fix final
/      gviswana 02/03/01 - 1111555: Hidden columns
/      gviswana 12/18/00 - Upsert -> Merge
/      gviswana 12/12/00 - ub4 for line numbers
/      mxyang   12/07/00 - bug 1484770
/      rdani    12/01/00 - Fix expected LRG Rename method core dump
/      rdani    11/28/00 - Fix 1400251
/      rmotofuj 11/23/00 - new ICDs for LIKE2/SUBSTR2, guhan's REPLACE.
/      mmorsi   10/24/00 - Support for ORAData.
/      dbronnik 09/27/00 - PNTY callout args
/      rdani    09/28/00 - Fix 1420629
/      gviswana 07/21/00 - Common FE: COMMIT, ROLLBACK, etc
/      rdani    07/17/00 - Issue PLS 951 on ALTER TYPE RENAME
/      asethi   07/12/00 - Bulk bind extensions
/      mmorsi   06/23/00 - Support for SELF AS RESULT
/      asethi   06/30/00 - Dedicated agent and transactional extproc
/      cbarclay 06/26/00 - daylight savings
/      cbarclay 03/07/00 - new extract fieldnames for dls
/      cbarclay 03/02/00 - at time zone sim_expr
/      wxli     06/19/00 -  
/      sagrawal 06/20/00 - ref cursor to statement handle
/      wxli     06/17/00 - length semantics implementation.
/      mmorsi   06/15/00 - SQLJ types part 2.
/      gviswana 06/14/00 - Common FE part 3
/      asethi   06/06/00 - Pipelined and parallel support, part 3
/      asethi   06/08/00 - Make PARALLEL_ENABLE extensions optional
/      rdani    06/06/00 - Merge conflicts resolve
/      ciyer    06/03/00 - support method modifiers
/      asethi   06/01/00 - Pipelined and parallel table functions, part 2
/      rdani    05/22/00 - Make FORCE generic rule
/      rdani    05/21/00 - Fix order of added attributes
/      rdani    05/19/00 - ALTER TYPE 8.2.0
/      mmorsi   05/11/00 - SQLJ changes.
/      cbarclay 05/03/00 - sqlj after review comments
/      ciyer    05/09/00 - cleanup support for not instantiable types
/      cbarclay 04/24/00 - sqlj
/      gviswana 05/02/00 - Common SQL Frontend
/      asethi   04/28/00 - Fixed pipelined and parallel support problems
/      mxyang   04/27/00 - Support PL/SQL CASE stmt/expr
/      sagrawal 04/17/00 - table function and ref cursor
/      jjozwiak 04/13/00 - Remove parallel properites debugging token
/      jjozwiak 04/07/00 - Pipelined and parallel support
/      sokrishn 02/03/00 - inheritance related changes
/      jmuller  12/10/99 - Fix bug 784046: allow f@x()       
/      cbarclay 12/11/99 - extract
/      nle      11/09/99 - dynamic bulk sql support
/      sagrawal 12/10/99 - Cursor subquery
/      cbarclay 11/03/99 - merge datetime_literals fix forward
/      cbarclay 11/03/99 - datetime literals without NLS
/      cbarclay 10/26/99 - datetime literals
/      cbarclay 10/06/99 - datetime literals
/      rdani    08/31/99 - TRIM/CAST capture.Fix 967837.
/      gviswana 08/30/99 - Add TIMESTAMP WITH LOCAL TIME ZONE
/      ciyer    07/20/99 - bug 919390: partition extended name in lock table
/      dbronnik 05/20/99 - allow ORDER BY in all subqueries
/      cbarclay 06/30/99 - single interval field literals
/      nle      06/29/99 - dynamic returning clause                            
/      wawu     06/28/99 - Add limit clause to BULK FETCH
/      plsint   06/23/99 - The compilation error was reported. Removed lines wi
/      cbarclay 05/07/99 - datetime type capture again
/      asethi   06/10/99 - Bug 783235: added datetime/interval support to ILMS
/      mxyang   06/22/99 - bug 881427: add support for sample clause
/      ciyer    06/03/99 - bug 881430: support subpartition extended table name
/      cbarclay 06/08/99 - datetime constraints
/      cbarclay 05/14/99 - overlaps
/      mxyang   05/14/99 - enable "delete from t1 return c1 into n"
/      cbarclay 05/12/99 - datetime literals back again
/      sagrawal 05/14/99 - bug 838413
/      gviswana 05/13/99 - Fix bad merge
/      cbarclay 05/12/99 - at time zone
/      cbarclay 05/11/99 - undo datetime literal
/      cbarclay 05/10/99 - regen in merge stage
/      cbarclay 05/07/99 - fix datetime capture
/      cbarclay 05/06/99 - regen
/      cbarclay 01/29/99 - add datetime literals
/      cbarclay 05/05/99 - cast to datetime multiword types
/      cbarclay 04/23/99 - avoid datetime type capture
/      kosinski 03/02/99 - "exponent" terminal should have angle brackets
/      mxyang   01/02/99 - bug487834
/      cbarclay 10/29/98 - remove interval from (d-d) interval <int type>
/      nle      11/18/98 - add delimiters
/      cbarclay 11/03/98 - regen with plsql.recover updated with TRIM
/      cbarclay 10/12/98 - simple trim() now in standard
/      cbarclay 10/10/98 - sql92 trim
/      nle      10/08/98 - wrap support for adt
/      gviswana 08/07/98 - Remove SQL_NAME_RESOLVE                             
/      sagrawal 08/17/98 - TABLE subquery using nested TABLE locators
/      cwethere 07/23/98 - Add the CALL statement.
/      nle      07/14/98 - add DETERMINISTIC and PARALLEL_ENABLE
/      nle      06/23/98 - cleaning up frontend code for java project
/      cbarclay 05/29/98 - resolve merge conflicts
/      cbarclay 05/21/98 - fix lint errors
/      cbarclay 05/18/98 - (datetime-datetime)interval<qual> syntax
/      nle      05/29/98 - add delimiters
/      sagrawal 05/18/98 - bug 671858
/      nle      05/18/98 - REPEATABLE support
/      bburshte 05/09/98 - select from table
/      cbarclay 05/06/98 - datetime table_element
/      cbarclay 05/04/98 - regen
/      cbarclay 04/17/98 - more datetime
/      cbarclay 03/25/98 - add datetime to table_element
/      asethi   03/03/98 - Added NOCOPY support
/      lgammo   04/17/98 -
/      lgammo   04/02/98 - UROWID Support
/      dalpern  04/06/98 - opaque object ddl and static methods
/      nle      04/06/98 - dynamic SQL - revised
/      bburshte 03/30/98 - create operator spec
/      gviswana 03/15/98 - IR: changes to plsql.recover
/      rhari    02/20/98 - Disable default params in CALL-Specifications
/      rhari    01/27/98 - CALL-Specification in specs
/      plsint   01/26/98 - fix merge error; rvasired
/      gviswana 01/22/98 - Invoker rights syntax
/      dalpern  01/12/98 - inheritance, part 1
/      nle      01/15/98 - dynamic sql
/      jweisz   01/07/98 - add STORED                                          
/      rhari    01/05/98 - ILMS CALL-Specification
/      asethi   12/18/97 - Added bulk bind support
/      jweisz   12/19/97 - add FIXED_                                          
/      gclossma 11/19/97 - set L_RESTRICT_REFERENCES in Java covers
/      gclossma 10/28/97 - call Java
/      asethi   09/23/97 - Bug 491827; deleted redundant non-terminal and prods
/      dalpern  09/05/97 - bug 523301: extraneous diana nodes
/      ssikdar  07/08/97 - 8.0.3 changes
/      cbarclay 04/03/97 - remove_parenthesized_type_body_syntax
/      edarnell 04/17/97 - update pxextk_ usage
/      cbarclay 03/21/97 - bug 467024 WITH CHECK ONLY/WITH READ OPTION
/      cbarclay 03/20/97 - table partitions in insert stmt
/      cbarclay 03/20/97 - table partitions
/      cbarclay 03/20/97 - as object is mandatory not optional
/      cbarclay 03/19/97 - remove ref into clause
/      cbarclay 03/14/97 - singleton sql returning into
/      gclossma 03/13/97 - 444115
/      rhari    12/12/96 - Wrap libraries
/      dnizhego 12/04/96 - support IS DANGLING
/      dalpern  12/04/96 - nchar: D_CHARSET_SPEC reshape
/      zwalcott 11/20/96 - remove cfile, signed/unsigned binary integer, pointe
/      cbarclay 11/09/96 - type as object
/      dalpern  11/10/96 - nchar: bind var, empty_clob(), chr()/translate()
/      dalpern  11/05/96 - nchar: bind var, empty_clob(), chr()/translate()
/      mvemulap 10/28/96 - oci renaming
/      dalpern  09/18/96 - diana v7<->v8 compatibility
/      rhari    10/02/96 - #407291, library names are not identifiers
/      dnizhego 09/29/96 - change meaning of MULTISET
/      rhari    09/27/96 - NCHAR support in external procedures
/      dnizhego 09/24/96 - new collection DML syntax
/      zwalcott 09/15/96 - default pragma rr
/      dalpern  07/12/96 - nchar
/      rhari    08/12/96 - Switch datatype to PFFTINDSTRUCT if indicator + stru
/      rhari    07/30/96 - Support for ADTs, LOBs, Collections, REFs, RECORDSs
/      rhari    07/22/96 - #377926, No PH1 error if null library filespec
/      zwalcott 06/13/96 - pragma rr in  adt.
/      cbarclay 06/05/96 - incomp type
/      rhari    06/04/96 - Merge, One more try
/      rhari    06/04/96 - #371492 : allocate memory
/      zwalcott 06/02/96 - pragma_restrict_refs for adts.
/      dnizhego 05/31/96 - insert DML: newer version
/      zwalcott 05/19/96 - map and order methods.
/      rhari    05/20/96 - Library extensions
/      zwalcott 05/14/96 - signed/unsigned binary integer, pointer.
/      rhari    05/13/96 - Backout insert statement changes
/      dnizhego 04/12/96 - upgrade INSERT DML for 8.0
/      zwalcott 03/22/96 - nclob
/      gclossma 03/11/96 - regen for varray syntax
/      zwalcott 03/05/96 - LOB types.
/      zwalcott 01/29/96 - REF and table types.
/      rhari    01/12/96 - Merge new FCD stuff for callouts(dunietis, rhari)
/      dunietis 12/01/95 - foreign function support
/      bburshte 09/28/95 - object merge 2
/      bburshte 09/18/95 - mainline object merge
/      spuranik 08/22/95 - foreign function syntax
/      usundara 07/31/95 - bugfix 280461 - continuation of 184183.
/                           (merge from version /main/st_plsql_rel73/2)
/    zwalcott   07/11/95 -  add back the header
/    zwalcott   07/11/95 -  #275601: line numbers at block ends:
/                           (update for merge from 2.3)
/    bburshte   04/22/95 -  new set transaction semantics
/    bburshte   03/21/95 -  pragma support for index-table methods
/    zwalcott   03/03/95 -  Allow : select unique
/    zwalcott   03/03/95 -  allow: select unique
/    bburshte   02/20/95 -  PDP-NDE
/    bburshte   02/20/95 -  cleaning up
/    bburshte   02/01/95 -  -l
/    usundara   11/30/94 -  bug 252006: merge changes from branch 1.12.720.2
/    usundara   11/30/94 -  fix some keywords - sync w/ plsql.recover
/    bburshte   08/29/94 -  new wrapped keyword
/    bburshte   08/26/94 -  ref keyword
/    cbarclay   07/26/94 -  Add new non-terminal expanded_and_bind_n
/    bburshte   04/28/94 -  just checking
/    bburshte   04/28/94 -  new grammar symbols
/    tolkin     01/08/92 -  allow qualified dblinks
/    tolkin     11/27/91 -  added long, raw and segment
/    tolkin     09/12/91 -  recomp grammar
/    tolkin     08/19/91 -         Creation
/
/ ------- REPLACE GENERATED FILE BELOW THIS LINE ------------
/
/ Slax Generated Error Message file for plsql Grammar
/
/
/ Terminals
/
1,0,	"end-of-file"
2,0,	"error"
3,0,	":="
4,0,	"."
5,0,	"("
6,0,	")"
7,0,	","
8,0,	"*"
9,0,	"@"
10,0,	"%"
11,0,	"&"
12,0,	"|"
13,0,	"="
14,0,	"-"
15,0,	"+"
16,0,	":"
17,0,	";"
18,0,	"<"
19,0,	"/"
20,0,	">"
21,0,	"<bad>"
22,0,	"<bad-string>"
23,0,	"all"
24,0,	"array"
25,0,	"at"
26,0,	"begin"
27,0,	"body"
28,0,	"case"
29,0,	"constant"
30,0,	"declare"
31,0,	"else"
32,0,	"elsif"
33,0,	"end"
34,0,	"exception"
35,0,	"exit"
36,0,	"for"
37,0,	"function"
38,0,	"goto"
39,0,	"if"
40,0,	"in"
41,0,	"is"
42,0,	"limited"
43,0,	"loop"
44,0,	"mod"
45,0,	"remainder"
46,0,	"new"
47,0,	"not"
48,0,	"null"
49,0,	"of"
50,0,	"nan"
51,0,	"infinite"
52,0,	"others"
53,0,	"out"
54,0,	"package"
55,0,	"pragma"
56,0,	"private"
57,0,	"procedure"
58,0,	"raise"
59,0,	"range"
60,0,	"record"
61,0,	"rem"
62,0,	"hash"
63,0,	"return"
64,0,	"returning"
65,0,	"select"
66,0,	"separate"
67,0,	"subtype"
68,0,	"then"
69,0,	"type"
70,0,	"update"
71,0,	"use"
72,0,	"varray"
73,0,	"when"
74,0,	"while"
75,0,	"with"
76,0,	"<an identifier>"
77,0,	"<a double-quoted delimited-identifier>"
78,0,	"<a bind variable>"
79,0,	"=>"
80,0,	".."
81,0,	"<an exponent (**)>"
82,0,	"<> or != or ~="
83,0,	">="
84,0,	"<="
85,0,	"<<"
86,0,	">>"
87,0,	"<>"
88,0,	"reverse"
89,0,	"and"
90,0,	"or"
91,0,	"char_base"
92,0,	"default"
93,0,	"like"
94,0,	"like2"
95,0,	"like4"
96,0,	"likec"
97,0,	"number_base"
98,0,	"decimal"
99,0,	"date_base"
100,0,	"escape"
101,0,	"clob_base"
102,0,	"blob_base"
103,0,	"bfile_base"
104,0,	"table"
105,0,	"interface"
106,0,	"authid"
107,0,	"..."
108,0,	"continue"
109,0,	"alter"
110,0,	"any"
111,0,	"as"
112,0,	"asc"
113,0,	"avg"
114,0,	"between"
115,0,	"by"
116,0,	"call"
117,0,	"check"
118,0,	"close"
119,0,	"cluster"
120,0,	"clusters"
121,0,	"final"
122,0,	"instantiable"
123,0,	"colauth"
124,0,	"columns"
125,0,	"compress"
126,0,	"count"
127,0,	"crash"
128,0,	"create"
129,0,	"current"
130,0,	"comment"
131,0,	"cursor"
132,0,	"define"
133,0,	"delete"
134,0,	"desc"
135,0,	"distinct"
136,0,	"drop"
137,0,	"exists"
138,0,	"fetch"
139,0,	"force"
140,0,	"from"
141,0,	"lock"
142,0,	"mode"
143,0,	"nowait"
144,0,	"share"
145,0,	"exclusive"
146,0,	"grant"
147,0,	"group"
148,0,	"having"
149,0,	"identified"
150,0,	"index"
151,0,	"indexes"
152,0,	"into"
153,0,	"insert"
154,0,	"intersect"
155,0,	"max"
156,0,	"min"
157,0,	"minus"
158,0,	"nocompress"
159,0,	"on"
160,0,	"open"
161,0,	"option"
162,0,	"order"
163,0,	"overlaps"
164,0,	"overriding"
165,0,	"partition"
166,0,	"prior"
167,0,	"public"
168,0,	"resource"
169,0,	"revoke"
170,0,	"rollback"
171,0,	"row"
172,0,	"savepoint"
173,0,	"sequence"
174,0,	"segment"
175,0,	"set"
176,0,	"size"
177,0,	"some"
178,0,	"sql"
179,0,	"start"
180,0,	"stddev"
181,0,	"subpartition"
182,0,	"sum"
183,0,	"synonym"
184,0,	"to"
185,0,	"tabauth"
186,0,	"union"
187,0,	"unique"
188,0,	"using"
189,0,	"self"
190,0,	"result"
191,0,	"values"
192,0,	"variable"
193,0,	"variance"
194,0,	"view"
195,0,	"views"
196,0,	"where"
197,0,	"connect"
198,0,	"||"
199,0,	"indicator"
200,0,	"dangling"
201,0,	"execute"
202,0,	"immediate"
203,0,	"long"
204,0,	"raw"
205,0,	"double"
206,0,	"precision"
207,0,	"transaction"
208,0,	"read"
209,0,	"only"
210,0,	"work"
211,0,	"commit"
212,0,	"write"
213,0,	"ref"
214,0,	"compiled"
215,0,	"wrapped"
216,0,	"isolation"
217,0,	"level"
218,0,	"Serializable"
219,0,	"SQLData"
220,0,	"CustomDatum"
221,0,	"ORAData"
222,0,	"committed"
223,0,	"multiset"
224,0,	"the"
225,0,	"organization"
226,0,	"heap"
227,0,	"both"
228,0,	"leading"
229,0,	"trailing"
230,0,	"forall"
231,0,	"bulk"
232,0,	"collect"
233,0,	"limit"
234,0,	"save"
235,0,	"nocopy"
236,0,	"merge"
237,0,	"hidden"
238,0,	"<a SQL statement>"
239,0,	"external"
240,0,	"library"
241,0,	"name"
242,0,	"parameter"
243,0,	"style"
244,0,	"general"
245,0,	"oracle"
246,0,	"native"
247,0,	"language"
248,0,	"calling"
249,0,	"standard"
250,0,	"trusted"
251,0,	"untrusted"
252,0,	"parameters"
253,0,	"context"
254,0,	"length"
255,0,	"maxlen"
256,0,	"c"
257,0,	"pascal"
258,0,	"tdo"
259,0,	"duration"
260,0,	"charsetid"
261,0,	"charsetform"
262,0,	"assembly"
263,0,	"dotnet"
264,0,	"security"
265,0,	"identity"
266,0,	"safe"
267,0,	"external_0"
268,0,	"external_1"
269,0,	"external_2"
270,0,	"unsafe"
271,0,	"char"
272,0,	"short"
273,0,	"int"
274,0,	"sb1"
275,0,	"sb2"
276,0,	"sb4"
277,0,	"ub1"
278,0,	"ub2"
279,0,	"ub4"
280,0,	"float"
281,0,	"OCINumber"
282,0,	"OCIString"
283,0,	"orlvary"
284,0,	"OCIRaw"
285,0,	"OCIDate"
286,0,	"OCIROWID"
287,0,	"OCIDateTime"
288,0,	"OCIInterval"
289,0,	"OCIREFCURSOR"
290,0,	"orlany"
291,0,	"struct"
292,0,	"void"
293,0,	"valist"
294,0,	"reference"
295,0,	"string"
296,0,	"OCIType"
297,0,	"OCIDuration"
298,0,	"OCIRef"
299,0,	"OCILobLocator"
300,0,	"OCIColl"
301,0,	"size_t"
302,0,	"sqlcode"
303,0,	"sqlstate"
304,0,	"sqlname"
305,0,	"static"
306,0,	"java"
307,0,	"bound"
308,0,	"year"
309,0,	"month"
310,0,	"day"
311,0,	"hour"
312,0,	"minute"
313,0,	"second"
314,0,	"zone"
315,0,	"local"
316,0,	"timezone_hour"
317,0,	"timezone_minute"
318,0,	"timezone_region"
319,0,	"timezone_abbr"
320,0,	"time"
321,0,	"timestamp"
322,0,	"interval"
323,0,	"date"
324,0,	"agent"
325,0,	"transactional"
326,0,	"value"
327,0,	"member"
328,0,	"object"
329,0,	"constructor"
330,0,	"stored"
331,0,	"fixed"
332,0,	"varying"
333,0,	"unsigned"
334,0,	"binary"
335,0,	"map"
336,0,	"operator"
337,0,	"national"
338,0,	"character"
339,0,	"nchar"
340,0,	"large"
341,0,	"charset"
342,0,	"<a string literal with character set specification>"
343,0,	"opaque"
344,0,	"under"
345,0,	"sample"
346,0,	"block"
347,0,	"<a number>"
348,0,	"<a single-quoted SQL string>"
349,0,	"pipe"
350,0,	"deterministic"
351,0,	"parallel_enable"
352,0,	"pipelined"
353,0,	"aggregate"
354,0,	"byte"
355,0,	"invalidate"
356,0,	"cascade"
357,0,	"including"
358,0,	"exceptions"
359,0,	"add"
360,0,	"rename"
361,0,	"modify"
362,0,	"attribute"
363,0,	"data"
364,0,	"convert"
365,0,	"substitutable"
366,0,	"<an alternatively-quoted string literal with character set specification>"
367,0,	"<an alternatively-quoted SQL string>"
368,0,	"element"
369,0,	"indices"
370,0,	"a"
371,0,	"empty"
372,0,	"except"
373,0,	"submultiset"
374,0,	"sparse"
375,0,	"$if"
376,0,	"$then"
377,0,	"$else"
378,0,	"$elsif"
379,0,	"$end"
380,0,	"$error"
381,0,	"TOKEN_SEPARATOR_"
382,0,	"SQLOPT_HINT_"
383,0,	"result_cache"
384,0,	"relies_on"
385,0,	"NOW_"
386,0,	"purge"
387,0,	"compound"
388,0,	"trigger"
389,0,	"before"
390,0,	"after"
391,0,	"statement"
392,0,	"instead"
393,0,	"each"
/
/ Nonterminals
/
1000,0,	"accept grammar"
1001,0,	"an optional table organization clause"
1002,0,	"organization heap or organization index"
1003,0,	"an optional BULK COLLECT clause"
1004,0,	"an optional limit clause for bulk fetch"
1005,0,	"an optional clause used with FORALL statement for bulk error handling"
1006,0,	"a generalized  invocation"
1007,0,	"SELECT"
1008,0,	"UPDATE"
1009,0,	"INSERT"
1010,0,	"DELETE"
1011,0,	"WITH"
1012,0,	"SET"
1013,0,	"LOCK"
1014,0,	"SAVEPOINT"
1015,0,	"COMMIT"
1016,0,	"ROLLBACK"
1017,0,	"ddl_start"
1018,0,	"dml_start"
1019,0,	"MERGE"
1020,0,	""
1021,0,	""
1022,0,	""
1023,0,	"a DDL statement"
1024,0,	"a DML statement"
1025,0,	"an optional external LIBRARY name"
1026,0,	"an optional external routine NAME"
1027,0,	"a list of external options"
1028,0,	"a formal parameter name"
1029,0,	"an optional external PARAMETER STYLE specification"
1030,0,	"an external CALLING STANDARD specification"
1031,0,	"an optional indicator or length specification"
1032,0,	"an INDICATOR, LENGTH, MAXLEN, DURATION or TDO keyword"
1033,0,	"an optional indicator or length mode: IN, OUT or IN OUT"
1034,0,	"an optional BY VALUE or BY REFERENCE"
1035,0,	"an optional external type specification"
1036,0,	"an optional external LANGUAGE specification"
1037,0,	"a formal parameter name and options, or one of SQLSTATE, SQLCODE, SQLNAME, CONTEXT, or RETURN"
1038,0,	"external_atr_opt"
1039,0,	"an external parameter list"
1040,0,	"an optional external parameter list"
1041,0,	"an external parameter list entry specification"
1042,0,	"a LANGUAGE specification"
1043,0,	"external_name_ops"
1044,0,	"java_external_ops"
1045,0,	"java_call_specification"
1046,0,	"a LANGUAGE specification"
1047,0,	"a CALL statement"
1048,0,	"sqlj_type_opt"
1049,0,	"dotnet_external_ops"
1050,0,	"top-level foreign library declaration"
1051,0,	"java_class_opt"
1052,0,	"top-level assembly declaration"
1053,0,	"an optional external parameter list entry specification"
1054,0,	"an optional LOCAL modifier for TIMESTAMP WITH TIME ZONE"
1055,0,	"an interval literal qualifier"
1056,0,	"STATIC or a string literal"
1057,0,	"Trusted or Untrusted"
1058,0,	"an optional clause to specify agent string"
1059,0,	"identity_opt"
1060,0,	"optional TRANSACTIONAL keyword"
1061,0,	"security_opt"
1062,0,	"a compilation session"
1063,0,	"a relational operator"
1064,0,	"a binary addition operator (e.g. +, -, &, or ||)"
1065,0,	"a unary opertor (e.g. +, -, or PRIOR)"
1066,0,	"a binary multiplacation operator (e.g. *, /, MOD, or REM)"
1067,0,	"a PL/SQL variable or double-quoted string"
1068,0,	"a bind variable with indicator variable"
1069,0,	"a parameter passing mode: in, out or in out"
1070,0,	"a union operator"
1071,0,	"is_or_as"
1072,0,	"rep_type"
1073,0,	"return_or_returning"
1074,0,	"the optional keyword IN"
1075,0,	"a pragma"
1076,0,	"an argument association used in a pragma"
1077,0,	"a declaration"
1078,0,	"an object declaration"
1079,0,	"a type declaration"
1080,0,	"a full type declaration"
1081,0,	"a NEW type definition"
1082,0,	"a type definition"
1083,0,	"a subtype declaration"
1084,0,	"a subtype indication"
1085,0,	"a type mark"
1086,0,	"a constraint"
1087,0,	"cursor_ty_def"
1088,0,	"func_return_prm_spec_unconstrained_type"
1089,0,	"a range"
1090,0,	"an integer type definition"
1091,0,	"a real type definition"
1092,0,	"an indexed-table type definition"
1093,0,	"array_ty_initial_def"
1094,0,	"a record type definition"
1095,0,	"an incomplete type declaration"
1096,0,	"a basic declarative item"
1097,0,	"a later declarative item"
1098,0,	"the name of some object"
1099,0,	"a name"
1100,0,	"a name"
1101,0,	"an indexed component"
1102,0,	"a selected component"
1103,0,	"an attribute"
1104,0,	"an attribute designator"
1105,0,	"arg"
1106,0,	"an expression"
1107,0,	"a relation preceded optionally by NOT"
1108,0,	"assoc_arg"
1109,0,	"paren_aggr"
1110,0,	"a simple expression"
1111,0,	"a term in an expression"
1112,0,	"a factor in a term"
1113,0,	"a primary factor in an expression"
1114,0,	"a procedure invocation"
1115,0,	"an optional label followed by a PL/SQL statement"
1116,0,	"an optional label followed by a PL/SQL non-block statement"
1117,0,	"an optional label followed by a PL/SQL block statement"
1118,0,	"a PL/SQL statement"
1119,0,	"unlabeled_nonblock_stmt"
1120,0,	"a non-block compound statement"
1121,0,	"a label"
1122,0,	"a NULL statement"
1123,0,	"an assignment statement"
1124,0,	"an IF statement"
1125,0,	"a LOOP statement"
1126,0,	"a WHILE or FOR statement"
1127,0,	"a loop parameter specification"
1128,0,	"a statement block (BEGIN ... END)"
1129,0,	"an EXIT statement"
1130,0,	"a RETURN statement"
1131,0,	"a GOTO statement"
1132,0,	"continue_stmt"
1133,0,	"a pipe statement"
1134,0,	"a subprogram declaration"
1135,0,	"a subprogram specification"
1136,0,	"a function name (an identifier or operator symbol)"
1137,0,	"a formal parameter list"
1138,0,	"a parameter specification"
1139,0,	"a type mark"
1140,0,	"an ADT type header"
1141,0,	"foreign function with EXTERNAL keyword"
1142,0,	"foreign function without EXTERNAL keyword"
1143,0,	"subprg_body_or_spec"
1144,0,	"a subprogram body"
1145,0,	"a package body"
1146,0,	"user defined operator definition"
1147,0,	"operator signature"
1148,0,	"binding function"
1149,0,	"list of user defined operator signatures"
1150,0,	"an enumerator type definition"
1151,0,	"an enumerator literal specification"
1152,0,	"a compilation unit"
1153,0,	"a library unit"
1154,0,	"an exception handler"
1155,0,	"an exception declaration"
1156,0,	"an exception choice or OTHERS"
1157,0,	"a RAISE statement"
1158,0,	"one or more PL/SQL statements"
1159,0,	"an expanded name"
1160,0,	"an expanded name link"
1161,0,	"a database link name"
1162,0,	"a database link name"
1163,0,	"an expanded or bind variable name"
1164,0,	"link_expanded_n_optional_partition"
1165,0,	"the right-hand side of an object declaration"
1166,0,	"a range expression (expr1 .. expr2)"
1167,0,	"NOT_BOUND_opt"
1168,0,	"an optional simple expression"
1169,0,	"a select expression followed optionally by an identifier"
1170,0,	"a select expression"
1171,0,	"an optional ASSIGN or DEFAULT statement"
1172,0,	"an optional constraint"
1173,0,	"relal_op_sim_expr_opt"
1174,0,	"an exponential expression"
1175,0,	"an ELSE followed by a sequence of statements"
1176,0,	"identifier_opt"
1177,0,	"an optional FOR or WHILE statement"
1178,0,	"an optional EXCEPTION handler"
1179,0,	"an optional expanded name"
1180,0,	"an optional WHEN <condition> clause"
1181,0,	"an optional expression"
1182,0,	"an optional formal parameter list"
1183,0,	"an optional designator"
1184,0,	"a BEGIN block followed by an optional exception handler"
1185,0,	"empty_block"
1186,0,	"a package specification"
1187,0,	"a binary addition operation"
1188,0,	"a statement that requires bulk binds"
1189,0,	"an optional range for bulk binds"
1190,0,	"Interface table function or aggregate function"
1191,0,	"Sub program declaration"
1192,0,	"an optional WITH INTERFACE clause"
1193,0,	"an INTERFACE procedure specification"
1194,0,	"an INTERFACE procedure formal declaration list"
1195,0,	"an INTERFACE procedure parameter specification"
1196,0,	"an optional INTERFACE indicator parameter"
1197,0,	"interface_constrained_type"
1198,0,	"interface_constraint_opt"
1199,0,	"user_defined_type_name"
1200,0,	"is_of_predicate"
1201,0,	"is_prefix"
1202,0,	"is_of_modifier"
1203,0,	"an optional DECLARE section"
1204,0,	"an optional INTERFACE procedure parameter spec"
1205,0,	"a list of identifiers"
1206,0,	"an optional argument list"
1207,0,	"empty_parens_opt"
1208,0,	"an aggregate"
1209,0,	"type_aggr"
1210,0,	"user_defined_type_name_list"
1211,0,	""
1212,0,	"an argument"
1213,0,	"an optional declare part"
1214,0,	"an optional basic declaration item"
1215,0,	"an optional later declaration item"
1216,0,	"arg_list"
1217,0,	"sim_expr_list"
1218,0,	"an optional list of expressions and ids"
1219,0,	"an optional list of statements"
1220,0,	"an optional label"
1221,0,	"an optional ELSIF clause"
1222,0,	"a list of exception handlers"
1223,0,	"an optional parameter-specification list"
1224,0,	"an optional enumerator-literal-specification list"
1225,0,	"an optional exception-choice list"
1226,0,	"a declaration list"
1227,0,	"a CURSOR declaration"
1228,0,	"a character type definition"
1229,0,	"a date type definition"
1230,0,	"a lob type definition"
1231,0,	"a table type definition"
1232,0,	"a PL/SQL component declaration"
1233,0,	"body_adt_field"
1234,0,	"adt_field"
1235,0,	"a SQL statement"
1236,0,	"a BULK executable statement"
1237,0,	"a SQL query or DML statement"
1238,0,	"a DELETE statement (positioned)"
1239,0,	"a DELETE statement (searched)"
1240,0,	"an UPDATE statement (positioned)"
1241,0,	"an UPDATE statement (searched)"
1242,0,	"an INSERT statement"
1243,0,	"a WHERE clause"
1244,0,	"a HAVING clause"
1245,0,	"sequence of expressions following VALUES keyword"
1246,0,	"element of VALUES clause"
1247,0,	"a query specification"
1248,0,	"a query expression"
1249,0,	"a term in a query"
1250,0,	"a CURSOR specification"
1251,0,	"the body of a CURSOR declaration"
1252,0,	"first argument to CAST expression"
1253,0,	"a SELECT statement"
1254,0,	"a table definition"
1255,0,	"a sequence definition"
1256,0,	"a synonym definition"
1257,0,	"adt_definition"
1258,0,	"table_type_definition"
1259,0,	"a set (group) function specification"
1260,0,	"a BETWEEN predicate"
1261,0,	"a table expression"
1262,0,	"a FROM clause"
1263,0,	"a primary boolean expression"
1264,0,	"an IN predicate"
1265,0,	"ordered_subquery"
1266,0,	"table_subquery"
1267,0,	"cursor_subquery"
1268,0,	"a plain subquery expression"
1269,0,	"a subquery expression"
1270,0,	"a plain subquery expression"
1271,0,	"with_subquery"
1272,0,	"THE subquery or TABLE subquery"
1273,0,	"ordered_table_subquery"
1274,0,	"MULTISET constructor"
1275,0,	"expreesion of collection type"
1276,0,	"expression for DML value clauses"
1277,0,	"a comparison predicate"
1278,0,	"a LIKE predicate"
1279,0,	"a NULL predicate"
1280,0,	"obj IS DANGLING form"
1281,0,	"nan_predicate"
1282,0,	"infinite_predicate"
1283,0,	"an overlaps predicate"
1284,0,	"an EXISTS predicate"
1285,0,	"an ESCAPE clause"
1286,0,	"the body of a cursor declaration"
1287,0,	"an OPEN statement"
1288,0,	"a FETCH statement"
1289,0,	"a CLOSE statement"
1290,0,	"open_cursor_reference_statement"
1291,0,	"a SQL statement in a cursor OPEN statement"
1292,0,	"a table reference expression"
1293,0,	"a CONNECT BY clause"
1294,0,	"TABLE expression"
1295,0,	"link_expanded_n_optional_partition_or_subquery"
1296,0,	"table_reference_or_subquery"
1297,0,	"a list of table elements"
1298,0,	"an element of a table"
1299,0,	"a default initializer for a column"
1300,0,	"a column property"
1301,0,	"a list of column properties"
1302,0,	"an item in a SET clause"
1303,0,	"COMMENT_literal_opt"
1304,0,	"a table expression clause"
1305,0,	"a select list"
1306,0,	"a set (group) function name"
1307,0,	"a GROUP BY clause"
1308,0,	"a sort specification"
1309,0,	"a LOCK TABLE statement"
1310,0,	"a valid lockmode"
1311,0,	"an optional NOWAIT modifier"
1312,0,	"returning_into_clause"
1313,0,	"returning_into_clause_opt"
1314,0,	"a list of columns in an INSERT or UPDATE statement"
1315,0,	"a list of names"
1316,0,	"column_name_list"
1317,0,	"a set operator"
1318,0,	"an optional PUBLIC"
1319,0,	"an optional NOT"
1320,0,	"an optional NOT NULL"
1321,0,	"like"
1322,0,	"adt_flags"
1323,0,	"adt_flag"
1324,0,	"method_flags_opt"
1325,0,	"NOT_opt_INSTANTIABLE"
1326,0,	"NOT_opt_FINAL"
1327,0,	"fixed_varying_opt"
1328,0,	"a method specification in a ADT"
1329,0,	"an original method specification in a ADT"
1330,0,	"an original method body in a ADT"
1331,0,	"an optional WHERE clause"
1332,0,	"an optional NOT IN"
1333,0,	"an optional NOT BETWEEN"
1334,0,	"an optional NOT LIKE"
1335,0,	"an optional RETURN clause"
1336,0,	"an optional table expression clause"
1337,0,	"an optional set operator expression"
1338,0,	"an optional ORDER BY clause"
1339,0,	"an optional FOR UPDATE clause"
1340,0,	"an ORDER BY clause"
1341,0,	"a FOR UPDATE clause"
1342,0,	"a datetime declaration"
1343,0,	"an interval declaration"
1344,0,	"an interval qualifier"
1345,0,	"a datetime or interval declaration"
1346,0,	"constrained_datetime_type"
1347,0,	"constrained_interval_type"
1348,0,	"constrained_interval_type_2"
1349,0,	"constrained_datetime_interval_type"
1350,0,	"iconstraint"
1351,0,	"an optional interval constraint"
1352,0,	"unconstrained_type_wo_datetime"
1353,0,	"time_zone_specifier"
1354,0,	"an interval qualifier"
1355,0,	"captureable_datetime_identifiers"
1356,0,	"a datetime field name"
1357,0,	"an interval literal"
1358,0,	"datetime_string_field"
1359,0,	"a LEADING, TRAILING or BOTH keyword"
1360,0,	"a simple expression, trim option, or trim option followed by simple expression"
1361,0,	"partition_or_subpartition"
1362,0,	"a PL/SQL component slice"
1363,0,	"adt_field_list"
1364,0,	"adt_field_list_opt"
1365,0,	"body_adt_field_list"
1366,0,	"an optional table reference"
1367,0,	"an optional sort specification"
1368,0,	"an optional INTO clause"
1369,0,	"an INTO clause"
1370,0,	"an optional SET clause item"
1371,0,	"an optional AND relation"
1372,0,	"an optional ALL, DISTINCT, or UNIQUE"
1373,0,	"an ALL, DISTINCT, or UNIQUE key word"
1374,0,	"the optional key word WORK"
1375,0,	"the optional key word SAVEPOINT"
1376,0,	"the optional key word FROM"
1377,0,	"ph1psh_"
1378,0,	"swallow"
1379,0,	"pragma_arg2"
1380,0,	"decl_id"
1381,0,	"expr_id"
1382,0,	"MEMBER or STATIC"
1383,0,	"partition_name"
1384,0,	"array_"
1385,0,	"a dynamic SQL statement"
1386,0,	"an execute immediate statement"
1387,0,	"an expression with IN/OUT/IN_OUT mode"
1388,0,	"an optional dynamic returning clause"
1389,0,	"an optional using clause"
1390,0,	"a list of expressions in using clause"
1391,0,	"a character set specification"
1392,0,	"a character set specification"
1393,0,	"OBJECT or OPAQUE clause"
1394,0,	"size of opaque type"
1395,0,	"either Base type spec/ Sub type spec"
1396,0,	"Base type spec"
1397,0,	"Sub type spec"
1398,0,	"FIXED or VARYING"
1399,0,	"an AUTHID clause"
1400,0,	"an optional AUTHID clause"
1401,0,	"subprg_properties"
1402,0,	"subprg_property"
1403,0,	"an optional clause with function properties"
1404,0,	"a table reference or subquery using keyword return or returning as alias name"
1405,0,	"datetime_literal"
1406,0,	"datetime_expanded_n"
1407,0,	"datetime_link_expanded_n"
1408,0,	"sample_clause"
1409,0,	"sample_percent"
1410,0,	"table_reference_with_sample"
1411,0,	"from_table_reference_or_subquery"
1412,0,	"...from_table_reference_or_subquery.."
1413,0,	"a case statement"
1414,0,	"a case statement alternative (WHEN clause)"
1415,0,	"a sequence of case statement alternatives"
1416,0,	"a case expression"
1417,0,	"a case expression alternative (WHEN clause)"
1418,0,	"a sequence of case expression alternatives"
1419,0,	"an optional ELSE which is followed by an expression"
1420,0,	"an partition by clause specification"
1421,0,	"an optional partition by clause specification"
1422,0,	"cluster or order by clause specification"
1423,0,	"hash or range partitioning keyword"
1424,0,	"an optional UPDATE VALUE clause"
1425,0,	"an optional WITH EXTERNAL CONTEXT clause"
1426,0,	"a list of ADT attribute names"
1427,0,	"a list of ADT attribute names"
1428,0,	"a list of ADT attribute specifications"
1429,0,	"an optional list of ADT attributes"
1430,0,	"a ADD, MODIFY, RENAME or DROP attribute"
1431,0,	"a list of ADD, DROP, RENAME or MODIFY attribute"
1432,0,	"a RENAME, DROP or ADD method with purity pragma"
1433,0,	"a list of RENAME, DROP or ADD method"
1434,0,	"an optional INCLUDING TABLE DATA"
1435,0,	"an optional FORCE"
1436,0,	"a FORCE and EXCEPTIONS clause"
1437,0,	"an INVALIDATE or a CASCADE followed by table data and force options"
1438,0,	"a ALTER TYPE statement"
1439,0,	"a list of attribute, method or property chnages followed by data options"
1440,0,	"a list of ALTER TYPE statements"
1441,0,	"an optional list of ALTER TYPE statements"
1442,0,	"an ADT specification"
1443,0,	"a body definition for an ADT"
1444,0,	"alter_type_prefix"
1445,0,	"collection_limit"
1446,0,	"alt_array_a_statement"
1447,0,	"alt_array_clause"
1448,0,	"alt_array_change"
1449,0,	"alt_array_stmts"
1450,0,	"optional_alter_arrays"
1451,0,	"bulk_loop_bnds"
1452,0,	"bulk_btwn"
1453,0,	"empty_predicate"
1454,0,	"set_predicate"
1455,0,	"member_predicate"
1456,0,	"submultiset_predicate"
1457,0,	"multiset_op_union_except"
1458,0,	"multiset_op_intersect"
1459,0,	"multiset_boolean_expr"
1460,0,	"multiset_term"
1461,0,	"multiset_value_expression"
1462,0,	"multiset_primary"
1463,0,	"multiset_term_or_primary"
1464,0,	"combinable_multiset_term"
1465,0,	"combinable_multiset_expr"
1466,0,	"combinable_multiset_primary"
1467,0,	"OF_opt"
1468,0,	"ALL_opt"
1469,0,	"result_cache_property"
1470,0,	"relies_on_clause"
1471,0,	"result_cache_entries"
1472,0,	"purge_stmt"
1473,0,	"purge_options"
1474,0,	"dotted_name_list_opt"
1475,0,	"dotted_name_list"
1476,0,	"compound trigger body"
1477,0,	"before or after"
1478,0,	"row or statement"
1479,0,	"table statement"
1480,0,	"compound trigger block"
1481,0,	"compound trigger statements"
1482,0,	"$$116"
1483,0,	"$$273"
1484,0,	"$$431"
1485,0,	"$$433"
1486,0,	"$$440"
1487,0,	"$$442"
1488,0,	"$$481"
1489,0,	"$$616"
1490,0,	"$$618"
1491,0,	"$$626"
1492,0,	"$$629"
1493,0,	"$$631"
1494,0,	"$$632"
1495,0,	"$$634"
1496,0,	"$$648"
1497,0,	"$$649"
1498,0,	"$$651"
1499,0,	"$$688"
1500,0,	"shrinkwd"
1501,0,	"$$690"
1502,0,	"$$691"
1503,0,	"$$693"
1504,0,	"$$695"
1505,0,	"$$697"
1506,0,	"$$699"
1507,0,	"$$701"
1508,0,	"$$703"
1509,0,	"$$737"
1510,0,	"$$757"
1511,0,	"as"
1512,0,	"$$104"
