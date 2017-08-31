/Copyright (c) 1987, 2008, Oracle Corporation.  All rights reserved.
/ 
/ NAME
/   plwus.msg : Warning Message File
/ FUNCTION
/
/ NOTES
/   =====================================================================
/
/                  PL/SQL WARNINGS
/
/   =====================================================================
/
/   Now we have PL/SQL warnings in the compiler. At this moment there
/   are three categories of warnings.
/
/   SEVERE -- For this category the warning number should be between 
/             5000 and 5999.
/   INFORMATIONAL - For this category the warning number should be between
/                   6000 and 6249.
/   PERFORMANCE   - For this category the warning number should be between
/                   7000 and 7249.
/
/
/   PLEASE UPDATE THESE COMMENTS WHEN YOU ADD A NEW CATEGORY.
/
/ =================  END WARNINGS =======================================
/   [Portfolio] To match the style of RDBMS error messages:
/   - don't capitalize the first letter of the message text (keywords excepted)
/   - don't end the text with a period
/   - surround identifiers with double-quotes instead of single-quotes
/     eg: "\"%s\" is not in SQL scope here"
/
/
/ MODIFIED
/    sagrawal   11/21/08 - bug 7538484
/    cwethere   04/24/08 - 6990740: Code sure to raise exception gets warning
/    cwethere   04/15/08 - 6727923: Adjust message 5005 for inlining.
/    brwolf     03/25/08 - RELIES_ON deprecated
/    cwethere   03/12/08 - 6522196: Warn if authid clause is missing
/    astocks    09/21/07 - warn if turning off native
/    sagrawal   04/06/07 - warning for Generalized invocation
/    cwethere   11/29/06 - 5675353: Repair level 1 and dead assignment.
/    kmuthukk   10/19/06 - inlined sql in plsql (xbranchmerge from 10.2)
/    jmuller    10/18/06 - Fix bug 5589275: throw warning on cursor decl w/
/                          BULK clause
/    cwethere   10/03/06 - 5374587: Make debug flag obsolete.
/    astocks    09/19/06 - Bug 709811 - warning if debug IDL overflows
/    gviswana   08/07/06 - Add FG Diana overflow warning
/    jmuller    08/03/06 - Fix bug 5242317: good idea, but can't break existing
/                          Apps
/    astocks    04/06/06 - Make format of inline messages consistent
/    dbronnik   11/01/05 - Add mixed modular arithmetic warning
/    jmuller    05/26/05 - Fix bug 3998025: psdtygen can (sort of) raise 
/                          warnings 
/    mxyang     01/14/05 - Add PLW-6003
/    jmuller    07/28/04 - Fix CAUSE and ACTION for PLW-5001: labels too 
/    sagrawal   08/25/03 - sagrawal_split_plsql_message_file 
/    sagrawal   08/19/03 - create warning message file 
/
/
/ This file is converted to header/message files using lmsgen.c.
/
/ The first col is the PL/SQL warning number.
/ The second column is reserved and must (for now) be x00000
/ The remainder of the line is the warning text
/
/   =====================================================================
/
/                  PL/SQL SEVERE WARNINGS
/
/   =====================================================================
/
/
/   SEVERE -- For this category the warning number should be between 
/             5000 and 5999.
/
/ ========================================================================
5000, 0, "mismatch in NOCOPY qualification between specification and body"
// MANUAL: 
// INDEX: 
// RELEASE: 10.0
// CAUSE:  The indicated parameter was declared with the NOCOPY hint in the 
//         subprogram specification but not in the body, or it was declared
//         with the NOCOPY hint in the body but not in the specification. 
// ACTION: Ensure that the specification and the body agree in their use of
//         NOCOPY.  If this mismatch is not corrected, the program will obey
//         the declaration given in the specification, ignoring that in the
//         body.
//
5001, 0, "previous use of '%s' (at line %s) conflicts with this use"
// MANUAL: 
// INDEX:       
// RELEASE: 10.0
// CAUSE:  While looking for prior declarations of a variable, constant, or
//         label, the compiler found another declaration with the same name in
//         the same scope. Or, the headers of subprogram in a package
//         specification and body were not identical. 
// ACTION: Check the spelling of the variable, constant, or label name. Also
//         check the names of all parameters and exceptions declared in the same
//         scope. Then, remove or rename the object with the duplicate name.
//         Or, change the headers of the packaged subprogram in the package
//         specification or body so that they are identical.
//
5002, 0, "same actual parameter(%s and %s) is not a good programming practice"
// Document: NO
// MANUAL:  ***** DO NOT DOCUMENT *************
// INDEX: 
// RELEASE: 10.0
// CAUSE: DO NOT DOCUMENT
// ACTION: this message is available only when an event is set.
//
5003, 0, "same actual parameter(%s and %s) at IN and NOCOPY may have side effects"
// MANUAL: 
// INDEX: 
// RELEASE: 10.0
// CAUSE: The indicated parameter was declared with the NOCOPY hint in the 
//        subprogram specification but not in the body, or it was declared with
//        the NOCOPY hint in the body but not in the specification. 
// ACTION: Ensure that the specification and the body agree in their use of
//         NOCOPY.  If this mismatch is not corrected, the program will obey the
//         declaration given in the specification, ignoring that in the body.
//
5004, 0, "identifier %s is also declared in STANDARD or is a SQL builtin"
// MANUAL: 
// INDEX: 
// RELEASE: 10.0
// CAUSE: The indicated identifier was also either:
//           o) declared in package STANDARD, or
//           o) a SQL builtin function, or
//           o) a pseudo-column.  
//        This situation can result in name resolution issues since the 
//        STANDARD/builtin declaration will be chosen over the local 
//        declaration in SQL statements; however the local declaration will be
//        chosen over the STANDARD/builtin declaration outside SQL scope.  (See
//        the documentation on PL/SQL name resolution.)  
// ACTION: Either:
//            o) rename the given identifier,
//            o) qualify any references to the identifier with the containing
//               scope's name, or
//            o) make sure the intended resolution occurs if using the
//               identifier in SQL scope.   
//
5005,0, "subprogram %s returns without value at line %s"
// MANUAL: A PL/SQL function must always terminate in a RETURN statement that
//         returns a value.
// INDEX:
// RELEASE:  10.0.2
// CAUSE:  A function terminated without a return value. RETURN statements with
//         values are required for all PL/SQL functions.
// ACTION: Inspect function source code to ensure that every RETURN statement
//         returns a value and that a function does not terminate by executing
//         its END statement. Notice that this message may appear at the
//         call site for a function if the function call was inlined and if 
//         the called function did not terminate properly.
5006,0, "shadow type generation resulted in warning: %s"
// MANUAL: PL/SQL
// INDEX:
// RELEASE:  10.2.0
// CAUSE:  Compilation of a table function causes the creation of internally-
//         generated types.  A problem occurred during creation of these types
//         which was not severe enough to prevent the creation of the types, but
//         which may impact the usage of the table function.  See the
//         accompanying error message for more information.
// ACTION: Fix the issue reported in the accompanying error message.
5007, 0, "first parameter to pragma INLINE must be an identifier"
// MANUAL:
// INDEX:
// RELEASE: 11.1
// CAUSE: The first parameter to the pragma INLINE must be an identifier
//        denoting a procedure or function.
// ACTION: Use a procedure or function name
5008, 0, "illegal number of arguments for pragma %s"
// MANUAL: this PRAGMA was passed an illegal number of arguments.
// INDEX: pragma
// RELEASE:
// CAUSE: The number of arguments (actual parameters) passed to the named
//        pragma (compiler directive) is incorrect. A required argument was
//        omitted from the argument list, or the pragma syntax is faulty
//        (for example, a comma might be missing between two parameters).
// ACTION: Supply the missing argument or correct the faulty syntax.
5009, 0, "pragma INLINE may not appear in a declaration list"
// MANUAL:
// INDEX: pragma
// RELEASE: 11.1
// CAUSE: Pragma INLINE applies only to the following statement, and can
//        not appear immediately prior to a declaration
// ACTION: Remove the pragma.
5010, 0, "duplicate pragma INLINE on procedure '%s'"
// MANUAL:
// INDEX: pragma
// RELEASE: 11.1
// CAUSE: Pragma INLINE was applied twice to the same procedure in the same
// statement. The procedure will be inlined only if all duplicates specify
// a control value of 'YES'
// ACTION: Remove the duplicate pragma.
5011, 0, "pragma INLINE for procedure '%s' does not apply to any calls"
// MANUAL:
// INDEX: pragma
// RELEASE: 11.1
// CAUSE: A pragma INLINE was provided, but there was no call to the mentioned
//        procedure in the next statement.
// ACTION: Remove the unnecessary pragma.
5012, 0, "pragma INLINE for procedure '%s' could not be applied"
// MANUAL:
// INDEX: pragma
// RELEASE: 11.1
// CAUSE: A pragma INLINE(<name>, 'yes') was used, but the named procedure 
//        could not be inlined.
// ACTION: Eliminate the reasons which are blocking the inlining. See the
//         documentation for possible problems.
//
// NLS_DO_NOT_TRANSLATE [5400,5401]
5013, 0, "second parameter to pragma INLINE '%s' is not 'YES' or 'NO'"
// MANUAL:
// INDEX:       
// RELEASE: 11.1
// CAUSE: The second parameter to the pragma INLINE governs whether or not
//        a procedure call can be inlined. The only legal values are 'YES',
//        meaning that the compiler should attempt to inline the call, and
//        'NO', meaning that the compiler must not inline the call.
// ACTION: Use 'YES' or 'NO' as appropriate.
/
5014, 0, "Pragma %s cannot be specified here"
// MANUAL:
// INDEX: PRAGMA
// RELEASE: 8.1
// CAUSE: The pragma was specified in an inappropriate context.  
// ACTION: Remove or relocate the misplaced pragma.  Check the documentation to
// determine the correct context for this pragma.
//
5015, 0, "implementation restriction - too many debug records"
// MANUAL:
// INDEX: PLSQL_DEBUG
// RELEASE: 11.1
// CAUSE: The program is so large that it overflowed a compiler limit on the
// size of the debug symbol table. The module was compiled with partial 
// debugging information. 
// ACTION: Compile the module with PLSQL_DEBUG=FALSE, or split it into
// multiple modules
//
5016, 0, "INTO clause should not be specified here"
// MANUAL:
// INDEX: BULK
// RELEASE: 11.1
// CAUSE: The INTO clause was incorrectly specified on a cursor declaration. It
// should have been specified on the FETCH statement. 
// ACTION: Relocate the misplaced clause.
//
5017, 0, " prefix of the expression will be ignored"
// MANUAL:
// INDEX: OBJECTS
// RELEASE: 11.1
// CAUSE:   Generalized invocation with explicit SELF and a 
// dotted name was used to call the type method causing the 
// prefix of the dotted name to be ignored.
// ACTION: Do not use a dotted name to invoked type method in this context.
//
5018, 0, "unit %s omitted optional AUTHID clause; default value DEFINER used"
// MANUAL:
// INDEX: AUTHID
// RELEASE: 11.2
// CAUSE: The AUTHID clause is missing. The unit is allowed to have an AUTHID
//        clause. If the clause is missing, DEFINER's rights are used by
//        default. Good practice suggests that an explicit AUTHID clause
//        should always be used.
// ACTION: Write an explicit AUTHID clause for the unit.
//
5019, 0, "the language element near keyword %s is deprecated beginning with version %s"
// MANUAL:
// INDEX:
// RELEASE: See the error message text.
// CAUSE: A deprecated language element was used.  The particular language
//        element is deprecated in PL/SQL versions greater than or equal to the
//        version number given in the message text.
// ACTION: The deprecated language element should be deleted or rewritten.
//         Deprecated PL/SQL language elements become obsolete one version
//         after they are deprecated.  An obsolete language element will no
//         longer be supported and use of the element will result in an error.
//
//
//
5020, 0, "parameter name must be an identifier"
// MANUAL:
// INDEX:
// RELEASE:  11.2 
// CAUSE:  A string literal was used as the parameter name in a call that used
//         named notation.
// ACTION: Change the code to use an identifier for the parameter name.
//
5400,0, "This is a severe warning #1"
// Document: NO
// MANUAL: None
// INDEX:
// RELEASE:  10.0.0
// CAUSE:  this is a test message
// ACTION: Not to be documented
//
5401,0, "This is a severe warning #2"
// Document: NO
// MANUAL: None
// INDEX:
// RELEASE:  10.0.0
// CAUSE:  this is a test message
// ACTION:  Not to be documented
/
5999, 0, "implementation restriction (may be temporary) %s"
// MANUAL: 
// INDEX:
// RELEASE:
// CAUSE: 
// ACTION:
//
/   =====================================================================
/
/                  PL/SQL INFORMATIONAL WARNINGS
/
/   =====================================================================
/
/
/   INFORMATIONAL - For this category the warning number should be between
/                   6000 and 6249.
/
/ ========================================================================
// NLS_DO_NOT_TRANSLATE [6000,6001]
6000,0, "This is a informational warning #1"
// Document: NO
// MANUAL: None
// INDEX:
// RELEASE:  10.0.0
// CAUSE:  this is a test message
// ACTION:  Not to be documented
6001,0, "This is a informational warning #2"
// Document: NO
// MANUAL: None
// INDEX:
// RELEASE:  10.0.0
// CAUSE:  this is a test message
// ACTION:  Not to be documented
6002,0, "Unreachable code"
// MANUAL: Code can not be reached.  Unreachable code is removed.
// INDEX:
// RELEASE:  10.0.1
// CAUSE:  Static program analysis determined that some code on the specified
//         line would never be reached during execution.  This may have been
//         caused by expression evaluation at compile time.
// ACTION:  Inspect program logic for possible defects.  Disable
//          the warning if much code is made unreachable intentionally
//          and the warning message is more annoying than helpful.
6003,0, "unknown inquiry directive '%s'"
// MANUAL: PL/SQL
// INDEX:
// RELEASE:  10.2.0
// CAUSE:  An unknown inquiry directive was used. The inquiry directive is
//         neither predefined nor user-defined.
// ACTION: Use a predefined inquiry directive or define the inquiry directive.
//
6004,0, "inlining of call of procedure '%s' requested"
// MANUAL:
// INDEX:
// RELEASE:  11.0.0
// CAUSE:  A pragma INLINE(, 'YES') referring to the named procedure was
//         found. The compiler will, if possible, inline this call.
// ACTION:
6005,0, "inlining of call of procedure '%s' was done"
// MANUAL:
// INDEX:
// RELEASE:  11.0.0
// CAUSE:  A call to the procedure was inlined.
// ACTION:
6006,0, "uncalled procedure \"%s\" is removed."
// MANUAL: A local procedure is never called so its code is removed. 
// INDEX:
// RELEASE:  11.0.0
// CAUSE:  Static program analysis determined that the procedure can never be
//         called or executed. Therefore, it has been removed to save time 
//         during compilation and space during execution.
// ACTION:  Inspect program logic for possible defects.  Disable
//          the warning if the procedure is useful but simply not being used
//          right now and the warning message is more annoying than helpful.
6007,0, "procedure \"%s\" is removed because optimization removed calls"
// MANUAL: A local procedure is never called so its code is removed. 
// INDEX:
// RELEASE:  11.0.0
// CAUSE:  Static program analysis determined that the procedure can never be
//         called or executed. Therefore, it has been removed to save time 
//         during compilation and space during execution.
// ACTION:  Inspect program logic for possible defects.  Disable
//          the warning if the procedure is useful but simply not being used
//          right now and the warning message is more annoying than helpful.
6008,0, "call of procedure '%s' will not be inlined"
// MANUAL:
// INDEX:
// RELEASE:  11.0.0
// CAUSE:  A pragma INLINE(, 'NO') referring to the named procedure was
//         found. The compiler is prevented from inlining this call.
// ACTION:
6009,0, "procedure \"%s\" OTHERS handler does not end in RAISE or RAISE_APPLICATION_ERROR"
// MANUAL:
// INDEX:
// RELEASE:  11.0.0
// CAUSE:  The OTHERS handler can exit without executing some form of RAISE or
//         or a call to the standard procedure RAISE_APPLICATION_ERROR.
// ACTION: Good programming practices suggest that OTHERS handlers must always
//         pass an exception upward. Inspect the program logic to determine if
//         the handler code needs revision.
//
6010,0, "keyword \"%s\" used as a defined name"
// MANUAL: keyword <MI>name<D> used as a defined name
// INDEX:
// RELEASE:  11.0.0
// CAUSE:  A PL/SQL or SQL keyword was used as defined name.
//         Although legal, this is not recommended.
// ACTION: Choose another name for the defined item.
6011,0, "detailed dependency information discarded due to size limitations"
// MANUAL:
// INDEX:
// RELEASE:  11.1.0
// CAUSE:  The compiled unit was so large that the compiler could not
//         store detailed dependency information that could be used to
//         quickly recompile the unit if it was invalidated.
// ACTION: Break up the unit into smaller units.
//
6012,0, "SQL statement cannot be inlined. %s"
// MANUAL: PL/SQL
// INDEX:
// RELEASE:  11.1.0
// CAUSE:  The SQL statement could not be inlined.
// ACTION: 
//
6013,0, "deprecated parameter PLSQL_DEBUG forces PLSQL_OPTIMIZE_LEVEL <= 1"
// MANUAL:
// INDEX:
// RELEASE: 11.1.0
// CAUSE:   The PLSQL_DEBUG parameter was set to TRUE forcing the optimization
//          level to 1 (or 0 if the user selected 0) regardless of the setting
//          of the PLSQL_OPTIMIZE_LEVEL parameter to a higher level
// ACTION:  Do not use the PLSQL_DEBUG parameter; it is deprecated. Instead,
//          set the PLSQL_OPTIMIZE_LEVEL parameter to 1.
//
6014,0, "PLSQL_OPTIMIZE_LEVEL <= 1 turns off native code generation"
// MANUAL:
// INDEX:
// RELEASE: 11.1.0
// CAUSE:   Native code generation was not done because the optimization was
//          set to 1 or less.
// ACTION:  The goal of native code generation is high performance and a low
//          optimization level defeats that purpose. Either request a higher
//          optimization level or remove the request for native code
//          generation. Note that using the deprecated parameter PLSQL_DEBUG
//          also forces the optimization level to 1; do not use this parameter
//          when native code generation is desired.
//
6015,0, "parameter PLSQL_DEBUG is deprecated; use PLSQL_OPTIMIZE_LEVEL = 1"
// MANUAL:
// INDEX:
// RELEASE: 11.1.0
// CAUSE:   The PLSQL_DEBUG parameter was specified.
// ACTION:  The parameter PLSQL_DEBUG no longer controls the generation of 
//          debugging information by the PL/SQL compiler; debugging information
//          is always generated and no special parameter is needed.
//
6016,0, "unit %s is too large; native code generation turned off"
// MANUAL:
// INDEX:
// RELEASE: 11.1.0
// CAUSE:   Because the program was extremely large, analysis took an 
//          excessive amount of time or space to complete causing native 
//          compilation to be turned off.
// ACTION:  The goal of native code generation is high performance and the 
//          compiler does extensive analysis of the program. If possible,
//          reduce the size of the largest procedure, or split the program 
//          unit into multiple units.
//
6017,0, "an operation will raise an exception"
// MANUAL:
// INDEX:
// RELEASE: 11.2.0
// CAUSE:   An operation near this location is certain to raise an exception
//          during execution; it may be a programming error because it is not
//          an explicit RAISE.
// ACTION:  The compiler has determined that some operation near this location
//          is certain to raise an exception during execution. This may be a
//          programming error; consider rewriting the code. If the intention
//          is to raise an exception, use an explicit RAISE statement.
//
6018,0, "an infinity or NaN value is computed or used"
// MANUAL:
// INDEX:
// RELEASE: 11.2.0
// CAUSE:   An operation near this location computes or uses an infinite
//          NUMBER, BINARY_FLOAT, or BINARY_DOUBLE value or a NaN BINARY_FLOAT
//          or BINARY_DOUBLE value.
// ACTION:  The compiler has determined that an operation near this location
//          computes or uses either an infinity or a not-a-number (NaN)
//          value. This may indicate a programming error; consider rewriting
//          the code. If the intention is to use a BINARY_FLOAT or a
//          BINARY_DOUBLE non-numeric value, use the  appropriate constant
//          from STANDARD rather than computing the value. Some valid
//          uses exist for these values; the warning will still appear in those
//          cases. The use of infinite NUMBER values is not well-defined and
//          should be avoided.
//
/
/   =====================================================================
/
/                  PL/SQL PERFORMANCE WARNINGS
/
/   =====================================================================
/
/
/   PERFORMANCE   - For this category the warning number should be between
/                   7000 and 7249.
/
/ ========================================================================
// NLS_DO_NOT_TRANSLATE [7200,7201]
7200,0, "This is a performance warning #1"
// Document: NO
// MANUAL: None
// INDEX:
// RELEASE:  10.0.0
// CAUSE:  this is a test message
// ACTION:  Not to be documented
//
7201,0, "This is a performance warning #2"
// Document: NO
// MANUAL: None
// INDEX:
// RELEASE:  10.0.0
// CAUSE:  this is a test message
// ACTION:  Not to be documented
//
7202,0, "bind type would result in conversion away from column type"
// MANUAL: PL/SQL
// INDEX:
// RELEASE:  10.0.0
// CAUSE:  The column type and the bind type do not exactly match. This
//         will result in the column being converted to the type of the bind
//         variable. This type conversion may prevent the SQL optimizer
//         from using any index the column participates in. This may
//         adversely affect the execution performance of this statement.
// ACTION: To make use of any index for this column, make sure the bind
//         type is the same type as the column type.
//
7203,0, "parameter '%s' may benefit from use of the NOCOPY compiler hint"
// MANUAL: PL/SQL
// INDEX:
// RELEASE:  10.0.0
// CAUSE:  The mode of the specified parameter was IN OUT or OUT. Use of
//         the NOCOPY compiler hint may speed up calls to this subprogram.
// ACTION: Change the mode of the parameter to explicitly use the NOCOPY
//         compiler hint. For example, if your subprogram declaration is:
//           PROCEDURE proc(p1 IN OUT CLOB);
//         you can change it to:
//           PROCEDURE proc(p1 IN OUT NOCOPY clob);
//         to get the benefit of the NOCOPY hint.
//         For member procedures or functions in object types, you may have
//         to explicitly declare the SELF parameter as illustrated in the
//         following:
//           MEMBER PROCEDURE proc(SELF IN OUT NOCOPY MY_TYPE);
//
7204,0, "conversion away from column type may result in sub-optimal query plan"
// MANUAL: PL/SQL
// INDEX:
// RELEASE:  10.0.0
// CAUSE:  The column type and the bind type do not exactly match. This
//         may result in the column being converted to the type of the bind
//         variable. This type conversion may prevent the SQL optimizer
//         from using any index the column participates in. This may
//         adversely affect the execution performance of this statement.
// ACTION: To make use of any index for this column, make sure the bind
//         type is the same type as the column type.
//
7205,0, "SIMPLE_INTEGER is mixed with BINARY_INTEGER or PLS_INTEGER"
// MANUAL: PL/SQL
// INDEX:
// RELEASE:  11.0.0
// CAUSE:  Using SIMPLE_INTEGER and BINARY_INTEGER or PLS_INTEGER arguments
//         in the same arithmetic expression may inhibit certain optimizations.
// ACTION: Try using SIMPLE_INTEGER values only if the expression is
//         computed on a performance critical path.
//
7206,0, "analysis suggests that the assignment to '%s' may be unnecessary"
// MANUAL: PL/SQL
// INDEX:
// RELEASE:  11.0.0
// CAUSE:  This assignment may be unnecessary; the PL/SQL optimizer could not
//         find any further use of the variable which was being set. If the
//         assignment was being done for some side-effect such as raising a 
//         specific exception, the compiler may not have been able to
//         understand the side-effect and this warning may be inappropriate.
// ACTION: If the assignment sets a variable whose value will not be used again
//         and there are no side-effects (exceptions or calls) to consider,
//         remove the assignment for better performance. If the assignment was
//         in place to raise a specific known exception, replace the
//         assignment with a RAISE statement.

