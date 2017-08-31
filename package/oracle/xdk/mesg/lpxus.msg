/ $RCSfile: lpxus.msg $
/ $Date: 2008/10/29 22:22:33 $
/ Copyright (c) 1999, 2003, Oracle.  All rights reserved.
/
/   NAME
/     lpxus.msg
/
/   DESCRIPTION
/     US-language error message file for XML parser (LPX)
/
/   NOTES
/     COMPLY WITH STANDARDS WHEN ADDING OR CHANGING MESSAGES!
/     See /vobs/rdbms/mesg/oraus.msg for full message rules.
/
/     Error messages are XML-parser-specific format strings, not general
/     printf-type format strings.  The magic character is '~' instead of
/     '%', and formatting is very restricted.  Choices are:
/
/	~d  sb4	      signed decimal output
/	~u  ub4	      unsigned decimal output
/	~x  ub4	      U+FFFF-style Uncode character output
/	~X  ub4	      Generic 0x-style hexadecimal output
/       ~c  ub4	      single-character output
/	~s  oratext*  single/multibyte string output
/	~S  oratext*  single/multibyte/Unicode string output
/
/     Hex 'x' is for Unicode character output.  It formats "\uFFFF" for
/     USC2 characters and "\vFFFFFF" for UCS4 characters.
/
/     Hex 'X' format is used for NLS wide characters, as many bytes as
/     needed, leading 0 bytes omitted, e.g. "0xF".
/
/     For the 'S' format type, the string is expected to be in the DOM
/     data encoding, which may be single-byte, multi-byte, or Unicode.
/     For plain 's' format, the string may only be single or multi-byte.
/
/ ----------------------------------------------------------------------
/
/     For error messages with multiple arguments, the fields must be
/     identified as to the original order of arguments in the code.
/     If there is only a single argument, the number "1" may be omitted.
/
/     That is, if a message contains ~1s and ~2s then ~1s corresponds to
/     the first code argument, ~2s to the second.  This is so that the
/     order may be changed as needed in translation while the code still
/     passes the arguments in original order.  For example, the English
/
/	"only ~1d occurance(s) of element \"~2s\", minimum is ~3d"
/
/     might translate to
/
/	"\"~2s\" öðesinin sadece ~1d tekrarý var, minimum: ~3d"
/
/     but the code would remain
/
/	... LsxErrNode(scctx, n, LSXERR_MIN_OCCURS, (sb4) count,
/		       (oratext *) lsx_choice, (sb4) all->minoc_lsxall);
/
/     with the arguments passed as sb4, oratext*, sb4 (as in the US file).
/
/ ----------------------------------------------------------------------
/
/   Classification of external exception codes
/
/   00000 - 00099	Generic Errors
/   00100 - 00199	Validity Constraint Errors
/   00200 - 00299	Parser Errors
/   00300 - 00399	XSL Errors
/   00400 - 00499	XPATH Errors
/   00500 - 00549	Iterator, TreeWalker, Range
/   00550 - 00599	XSLT VM
/   00600 - 00699	XSLVM
/   00700 - 00749	SOAP
/   00750 - 00799	WebDAV
/   00800 - 00849	WebDAV
/   00900 - 00999	XmlDiff, XmlPatch
/   01000 - 01099	XVM - XQuery/XPath/XSLT
/
/ --- Generic Errors ---------------------------------------------------------
/
00000, 00000, "normal, successful completion"
// *Cause:  Normal exit
// *Action: No action required.
/
00001, 00000, "NULL pointer"
// *Cause:  A NULL pointer was detected as an internal error condition.
// *Action: This is a programming error by the caller of the XML parser.
//          Please contact someone who can fix the problem.
/
00002, 00000, "out of memory"
// *Cause:  The operating system has run out of memory.
// *Action: Make more memory available to the program.
/
00003, 00000, "duplicate entry in hash table"
// *Cause:  An internal error has occurred (a key was requested to be
//          placed in a hash table but was already there).
// *Action: Contact Oracle Support Services and report the error.
/
00004, 00000, "internal error \"~s\""
// *Cause:  An internal error has occurred.
// *Action: Contact Oracle Support Services and report the error.
/
00005, 00000, "~1s buffer overflow, maximum size is ~2u bytes"
// *Cause: A name, quoted string, URL, or other document component was
//	too long.
// *Action: Restrict the component to the maximum size shown.
//
00006, 00000, "invalid child type for parent node"
// *Cause: An attempt was made to add an invalid node-type to a parent node.
// *Action: Correct the code.
/
00007, 00000, "unexpected end-of-file encountered"
// *Cause: The documented ended unexpectedly, perhaps due to truncation.
// *Action: Verify that the document is complete.
/
00008, 00000, "invalid memory callback"
// *Cause: The memory callback structure passed to xmlinit was missing
//	the allocate or free functions (or both).
// *Action: Provide both functions in the callback structure.
/
00009, 00000, "In line ~1u of ~2s:"
00010, 00000, "In line ~1u of ~2s [parameter entity ~3S]:"
00011, 00000, "In line ~1u of ~2s [general entity ~3S]:"
// *Cause: Error message prefixes, not errors themselves. These are the
//	possible banner messages which appear before an XML error to
//	describe the position (line#) and source (buffer or URI) in which
//	the error occurred, as well as the entity's name (if the source is
//	an entity). Parameter entity banner must be at +1 to non-entity
//	banner, general entity at +2 (see lpxerr.c).
// *Action: No action required. This is not an error message.
/
00012, 00000, "Unicode data alignment error"
// *Cause: An input Unicode (UCS2) datum was not aligned properly.
// *Action: UCS2 data consists of an array of shorts (ub2) which must
//	be aligned on an even-byte boundary.
/
00013, 00000, "wrong node type"
// *Cause: The wrong node type was given as argument to a DOM call.
// *Action: Review the failing function call, consult the documentation, and
//	make sure the node types passed as correct.
/
00014, 00000, "context is not clean"
// *Cause: An operation was performed on a context that has already been
//	used (so is not "clean").
// *Action: Some functions must be performed on a newly initialized context
//	before being used for parsing. For example, setting a shared DTD.
//	Change the code and do the call before parsing.
//
00015, 00000, "XML Location: "
00016, 00000, "XSL Location: "
00017, 00000, "~1sNodeName: <~2S> "
// *Cause: More error message boilerplate.
// *Action: No action required. This is not an error message.
/
00018, 00000, "internal error \"nested open strings\""
// *Cause:  An internal error has occurred.
// *Action: Contact Oracle Support Services and report the error.
/
00019, 00000, "property \"~s\" unknown"
// *Cause:  The named initialization property was unknown.
// *Action: Refer to the documentation for the complete set of
//	init properties.
/
/00020, 00000, "save overflow"
// *Cause:  An XmlSaveDom operation overflowed its destination buffer.
// *Action: Increase the size of the destination buffer.  Note that
//	XmlSaveDom may be called with no destination, in which case it
//	returns the total size of the formatted document without actually
//	saving it.
/
/00021, 00000, "feature not implemented"
// *Cause:  A code feature has not yet been implemented.
// *Action: Contact Oracle Support Services and request the feature.
/
/00022, 00000, "internal error \"~s\", subcode ~u"
// *Cause:  An unexpected error has occured in a subsystem used by XML.
//	Subcode is the error code returned by that failing subsystem.
// *Action: Contact Oracle Support Services and report the error and subcode.
/
/ --- Initialization Errors ---------------------------------------------
/
00050, 00000, "initialization error: NLS mismatch"
// *Cause:  A language ID was specified without the matching global area.
// *Action: Internal error, contact Oracle Support Services and report
//	the error.
/
00051, 00000, "NLS initialization failed"
// *Cause:  The NLS (National Language Support) package initialization failed.
// *Action: Internal error, contact Oracle Support Services and report
//	the error.
/
00052, 00000, "LEH initialization failed"
// *Cause:  The LEH (Library Exception Handling) package initialization failed.
// *Action: Internal error, contact Oracle Support Services and report
//	the error.
/
00053, 00000, "LML initialization failed"
// *Cause:  The LML (Low-Level Memory manager) package initialization failed.
// *Action: Internal error, contact Oracle Support Services and report
//	the error.
/
00054, 00000, "LPU initialization failed, error ~u"
// *Cause:  The LPU (URL Parser/Loader) package initialization failed.
// *Action: Internal error, contact Oracle Support Services and report
//	the error.
/
/ --- Validity Constraint Errors ---------------------------------------------
/
00100, 00000, "root element \"~1S\" does not match DTD root \"~2S\""
// *Cause:  Validity Constraint 2.8 failed:
//	"The Name in the document type declaration must match the element
//	type of the root element."
// *Example:
//	<?xml version="1.0"?>
//	<!DOCTYPE greeting [ <!ELEMENT greeting (#PCDATA)> ]>
//	<salutation>Hello!</salutation>
// *Explanation:
//      The document's root element, salutation, does not match the
//	root element declared in the DTD (greeting).
// *Action: Correct the document.
/
00101, 00000, "parameter-entity markup cannot be split up"
// *Cause:  Validity Constraint 2.8 failed:
//	"Parameter-entity replacement text must be properly nested with
//	markup declarations."
// *Example:
//	<?xml version="1.0"?>
//	<!DOCTYPE greeting [
//	    <!ENTITY % e "<!ELEMENT ">
//	    %e; greeting (#PCDATA)>
//	]>
//	<greeting>Hello!</greeting>
// *Explanation:
//	The parameter entity 'e' contains markup which may not be split
//	up; the entire ELEMENT (or ATTLIST or ENTITY) definition must be
//	present in one piece.
// *Action: Correct the document.
/
00102, 00000, "standalone document declaration should be \"no\""
// *Cause:  Validity Constraint 2.9 failed:
//	"Standalone document declaration must have the value 'no' if any
//	external markup declarations contain declarations of:
//	    * attributes with default values  - or -
//	    * entities  - or -
//	    * attributes with values subject to normalization  - or -
//	    * element types with element content"
// *Action: Correct the document.
/
00103, 00000, "document structure does not match DTD"
// *Cause:  Validity Constraint 3 failed:
//	"An element is valid if there is a declaration matching elementdecl
//	where the Name matches the element type, and one of the following
//	holds:
// 
//	* The declaration matches EMPTY and the element has no content
//	* The declaration matches children and the sequence of child elements
//	  belongs to the language generated by the regular expression in the 
//	  content model, with optional white space (characters matching the
//	  nonterminal S) between each pair of child elements.
//	* The declaration matches Mixed and the content consists of character
//	  data and child elements whose types match names in the content model.
//	* The declaration matches ANY, and the types of any child elements 
//	  have been declared."
// *Action: Correct the document.
/
00104, 00000, "element \"~S\" is not declared in the DTD"
// *Cause:  Validity Constraint 3 failed:
//	The named element has no matching elementdecl in the DTD
// *Action: Correct the document.
/
00105, 00000, "element \"~S\" is not empty as required by the DTD"
// *Cause:  Validity Constraint 3 failed:
//	The named element is declared as EMPTY in the DTD but contains
//	sub-elements in the document.
// *Action: Correct the document.
/
00106, 00000, "attribute \"~1S\" of element \"~2S\" is undefined"
// *Cause:  Validity Constraint 3.1 failed:
// *Action: Correct the document.
/
00107, 00000, "element \"~S\" has multiple declarations"
// *Cause:  Validity Constraint 3.2 failed:
//	"No element type may be declared more than once."
// *Action: Correct the DTD.
/
00108, 00000, "parameter-entity parenthetical cannot be split up"
// *Cause:  Validity Constraint 3.2.1 failed:
//	"Parameter-entity replacement text must be properly nested with
//	parenthesized groups.  For interoperability, if a parameter-entity
//	reference appears in a choice, seq, or Mixed construct, its
//	replacement text should not be empty, and neither the first nor
//	last non-blank character of the replacement text should be a
//	connector (| or ,).
// *Example:
//	<?xml version="1.0"?>
//	<!DOCTYPE foo [
//	    <!ELEMENT greeting (#PCDATA)>
//	    <!ENTITY % e "(#PCDATA|">
//	    <!ELEMENT foo %e; greeting)>
//	]>
//	<greeting>Hello!</greeting>
// *Explanation:
//	The parenthetical content of the 'e' entity may not be split up
//	into sections: both open and close parentheses must be in the same
//	declaration.
// *Action: Correct the DTD.
/
00109, 00000, "duplicate name \"~S\" in mixed-content declaration"
// *Cause:  Validity Constraint 3.2.2 failed:
//	"The same name must not appear more than once in a single
//	mixed-content declaration."
// *Example:
//	<!ELEMENT p (#PCDATA|a|b|c|d|a)>
// *Explanation:
//	'a' occurs more than once in the mixed-content declaration.
// *Action: Correct the DTD.
/
00110, 00000, "invalid ~1s \"~2S\" (not a Name)"
// *Cause:  Validity Constraint 3.3.1 failed: Given thing is not a Name
// *Action: Correct the document.
/
00111, 00000, "invalid ~1s \"~2S\" (not a Nmtoken)"
// *Cause:  Validity Constraint 3.3.1 failed: Given thing is not a Nmtoken
// *Action: Correct the document.
/
00112, 00000, "element \"~S\" has multiple ID attributes"
// *Cause:  Validity Constraint 3.3.1 failed:
//	"No element type may have more than one ID attribute specified."
// *Action: Correct the document.
/
00113, 00000, "element \"~1S\" ID attribute \"~2S\" must be #IMPLIED or #REQUIRED"
// *Cause:  Validity Constraint 3.3.1 failed:
//	"An ID attribute must have a declared default of #IMPLIED or
//	#REQUIRED."
// *Action: Correct the document.
/
00114, 00000, "element \"~1S\" attribute \"~2S\" has invalid enumeration value \"~3S\""
// *Cause:  Validity Constraint 3.3.1 failed:
//	"Values of this type must match one of the Nmtoken tokens in the 
//	declaration."
// *Action: Correct the document.
/
00115, 00000, "element \"~1S\" is missing required attribute \"~2S\""
// *Cause:  Validity Constraint 3.3.2 failed:
//	"If the default declaration is the keyword #REQUIRED, then the 
//	attribute must be specified for all elements of the type in the
//	attribute-list declaration."
// *Action: Correct the document.
/
00116, 00000, "element \"~1S\" attribute \"~2S\" has invalid value \"~3S\", must be \"~4S\""
// *Cause:  Validity Constraint 3.3.2 failed:
//	"If an attribute has a default value declared with the #FIXED
//	keyword, instances of that attribute must match the default value."
// *Action: Correct the document.
/
00118, 00000, "undefined entity \"~S\""
// *Cause:  Validity Constraint 4.1 failed:
//	"In a document with an external subset or external parameter entities
//	with "standalone='no'", the Name given in the entity reference must
//	match that in an entity declaration."
// *Action: Correct the document.
/
00119, 00000, "element \"~1S\" attribute \"~2S\" must be an unparsed entity"
// *Cause: The attribute value must be an unparsed entity.
// *Action: Correct the document.
/
00120, 00000, "entity \"~1S\" NDATA (notation) \"~2S\" is undefined"
// *Cause: Entity's NDATA (notation) is undefined
// *Action: Correct the document.
/
00121, 00000, "undefined notation \"~S\""
// *Cause: Notation is not known.
// *Action: Correct the document.
/
00122, 00000, "undefined ID \"~S\" in IDREF"
// *Cause:  Validity Constraint 3.3.1 failed:
//	"A name must not appear more than once in an XML document as a
//	value of this type; i.e., ID values must uniquely identify the
//	elements which bear them."
// *Action: Correct the document.
/
00123, 00000, "duplicate ID \"~S\""
// *Cause: An ID was used twice, they must be unique.
// *Action: Correct the document.
/
00124, 00000, "attribute value should be one or more tokens"
// *Cause: An attribute with tokenized type (IDREFS, ENTITIES, NMTOKENS)
//	did not contain any tokens.
// *Action: Value must contain one or more tokens, separated by spaces.
/
00125, 00000, "duplicate entity \"~S\" (ignored)"
// *Cause: A general or parameter entity was declared more than once.
// *Action: This is a warning, not an error. The first entity declaration is in
//	force, subsequent are ignored. Remove duplicate entity declarations
//	or ignore the warning.
/
//00126 no error message, return value XMLERR_NO_DECL only
// *Cause: Warning returned by XmlDomGetDecl when original document did
//	not contain an XMLDecl
// *Action: This is a warning, not an error.  The value XMLERR_NO_DECL is
//	used by the programmer to detect whether a document had an XMLDecl
//	or not.  It does not indicate a problem.
/
/ --- Parser Errors ----------------------------------------------------------
/
00200, 00000, "could not convert from encoding ~1s to ~2s"
// *Cause:  The conversion cannot be made between the specified encodings.
// *Action:  Choose a data encoding which can represent all expected
//	input encoding (such as a Unicode-based encoding, UTF-8 or UTF-16).
/
00201, 00000, "unknown encoding \"~s\""
// *Cause:  The specified encoding was not known. It should be an IANA
//	or Oracle encoding name.
// *Action:  Use an appropriate encoding.
/
00202, 00000, "could not open \"~s\" (error ~u)"
// *Cause:  The named input (file, URL, etc) does not exist.
// *Action:  Make sure the named input is available and can be opened.
/
00203, 00000, "could not read from \"~s\" (error ~u)"
// *Cause:  Data could not be read from the named input.
// *Action:  Take appropriate action to allow data to be read.
/
00204, 00000, "syntax error"
// *Cause:  A syntax error was found.
// *Action:  Check the XML document line and correct it.
/
00205, 00000, "expected \"<!--\" at the start of comment"
// *Cause:  Bad syntax detected when processing a comment.
// *Action:  Fix the comment syntax.
/
00206, 00000, "invalid CDATA section"
// *Cause:  Bad syntax detected when processing CDATA. Proper format
//	    is '<![CDATA[' data ']]>'.
// *Action:  Correct the CDATA syntax.
/
00207, 00000, "expected \"[\" at the start of conditional section"
// *Cause:  Bad syntax detected when processing a conditional section.
// *Action:  Fix the conditional section syntax.
/
00208, 00000, "unknown DTD keyword \"~s\""
// *Cause:  An unknown keyword was found in the DTD.
// *Action:  Use a proper keyword.
/
00209, 00000, "PI names starting with XML are reserved"
// *Cause:  Processing instruction starting with XML was found.
// *Action:  Use another name for the processing instruction.
/
00210, 00000, "expected '~1c' instead of '~2c'"
// *Cause:  A syntax error was detected.
// *Action:  Use proper syntax.
/
00211, 00000, "attribute default must be REQUIRED, IMPLIED, or FIXED"
// *Cause:  Attribute default was invalid.
// *Action:  Default must be REQUIRED, IMPLIED, or FIXED.
/
00212, 00000, "comment must not contain \"--\""
// *Cause:  A syntax error was detected in the comment.
// *Action:  Use '--' only when specifying the end of the comment.
/
00213, 00000, "comment did not end in \"-->\""
// *Cause:  A syntax error was detected in the comment.
// *Action:  Be sure to end the comment with '-->'.
/
00214, 00000, "CDATA section did not end in \"]]>\""
// *Cause:  A syntax error was detected in the CDATA section.
// *Action:  Be sure to end the CDATA section with ']]>'.
/
00215, 00000, "processing instruction did not end in \"?>\""
// *Cause:  A syntax error was detected in the PI section.
// *Action:  Be sure to end the PI with '?>'.
/
00216, 00000, "invalid character ~1u (~2X)"
// *Cause:  An invalid multibyte character was found.
// *Action:  Use only characters allowed by the XML specification.
/
00217, 00000, "invalid character ~1u (~2x)"
// *Cause:  An invalid Unicode character was found.
// *Action:  Use only characters allowed by the XML specification.
/
00218, 00000, "invalid character ~1u ('~2c')"
// *Cause:  An invalid native (ASCII/EBCDIC) character was found.
// *Action:  Use only characters allowed by the XML specification.
/
00219, 00000, "invalid digit '~c' in character reference"
// *Cause:  An invalid digit was found in a character reference.
// *Action: Character references are either &#DDD; where D's are decimal
//	    digits, or &#xHHH; where H's are hexadecimal digits.
/
00220, 00000, "the string \"]]>\" cannot occur in character data"
// *Cause:  Found ']]>' in character data.
// *Action:  Do not use ']]>' in character data.
/
00221, 00000, "the character \"<\" cannot occur in attribute values"
// *Cause:  Found '<' in an attribute value.
// *Action:  Do not use '<' in attribute values.
/
00222, 00000, "error received from SAX callback function"
// *Cause:  An error was received from the SAX callback function.
// *Action:  Examine the additional error messages and take corrective action.
/
00223, 00000, "external entity \"~s\" found in an attribute value"
// *Cause:  An external entity reference was found in an attribute value.
// *Action:  Use only references to internal or character entities in 
//           attribute values.
/
00224, 00000, "multiple occurrences of attribute \"~S\" found"
// *Cause:  An attribute occurred multiple times in the same start-tag or
//          empty-element tag.
// *Action:  Make sure that the attributes are unique.
/
00225, 00000, "end-element tag \"~1S\" does not match start-element tag \"~2S\""
// *Cause:  An element tag was not ended properly.
// *Action:  Make sure that the correct end element tag is used.
/
00226, 00000, "entity \"~S\" is not declared"
// *Cause:  An entity is not declared.
// *Action:  Declare the entity before referencing it.
/
00227, 00000, "entity \"~S\" is not a parsed entity"
// *Cause:  An entity reference contained the name of an unparsed entity.
// *Action:  Only reference parsed entities.
/
00228, 00000, "entity reference \"~S\" refers to itself"
// *Cause:  An entity reference contains a recursive reference to itself.
// *Action:  Modify the contents of the entity reference to remove this
//           recursion.
/
00229, 00000, "input source is empty"
// *Cause:  An XML input file has no contents.
// *Action:  The XML file representing a document must contain at least one
//           element.
/
00230, 00000, "invalid character ~1u (~2x) found in a Name or Nmtoken"
// *Cause:  An invalid character was found in a NAME or NMTOKEN.
// *Action:  Use only the characters allowed for NAMES and NMTOKENS by the XML
//           specification.
/
00231, 00000, "invalid character ~1u ('~2c') found in a Name or Nmtoken"
// *Cause:  An invalid character was found in a NAME or NMTOKEN.
// *Action:  Use only the characters allowed for NAMES and NMTOKENS by the XML
//           specification.
/
00232, 00000, "invalid use of a parameter entity reference"
// *Cause:  A parameter entity reference was found in an improper location in
//          the internal DTD subset.
// *Action:  Use a parameter entity reference only where markup declarations
//           can occur in the internal DTD subset, in the external DTD subset,
//           or in an external entity.
/
00233, 00000, "namespace prefixes starting with \"xml\" are reserved"
// *Cause:  Namespace prefix starting with XML was found.
// *Action:  Use another name for the namespace prefix.
/
00234, 00000, "namespace prefix \"~S\" is not declared"
// *Cause:  Namespace prefix is not declared.
// *Action:  Declare the prefix in an attribute list.
/
00235, 00000, "invalid XML version, must be 1.0 or 2.0"
// *Cause:  Only versions 1.0 and 2.0 of the XML specification are supported.
// *Action:  Use the 1.0 or 2.0 specification & set version# accordingly.
/
00236, 00000, "invalid character ~1u ('~2c') found in public identifier"
// *Cause:  An invalid character was found in a public identifier.
// *Action:  Use only the characters allowed for public identifiers by the XML
//           specification.
/
00237, 00000, "invalid condition section keyword, must be INCLUDE or IGNORE"
// *Cause: A conditional section <![ keyword [ markup ]]> had invalid keyword,
//	   must be either "IGNORE" or "INCLUDE"
// *Action: Correct condition section usage in document.
/
00238, 00000, "unterminated conditional section"
// *Cause: A conditional section was not properly terminated with ]]>.
// *Action: Verify conditional nesting in document and correct.
/
00239, 00000, "invalid attribute type \"~s\""
// *Cause: The attribute type is not valid. Options are CDATA, ID, IDREF,
//	   IDREFS, ENTITY, ENTITIES, NMTOKEN, or NMTOKENS.
// *Action: Check and correct attribute declaration.
/
00240, 00000, "element-start tag is not well formed"
// *Cause: A start-element tag was improperly formed.
// *Action: Check and correct the start-element syntax.
/
00241, 00000, "entity reference is not well formed"
// *Cause: An entity reference (general or parameter) was not formed properly.
// *Action: Form entity reference correctly as "&name;" or "%name;".
/
00242, 00000, "invalid use of ampersand ('&') character (use &amp;)"
// *Cause: The ampersand character is used only to start entity or character
//	   references.
// *Action: To include an ampersand character as data, use the built-in
//	    &amp; general entity.
/
00243, 00000, "element attribute value must be enclosed in quotes"
// *Cause: An attribute defined in an element's start-tag must be enclosed
//	   in single ('') or double ("") quotes.
// *Action: Enclose the attribute value in quotes.
/
00244, 00000, "invalid use of less-than ('<') character (use &lt;)"
// *Cause: The less-than character ('<') is not permitted as data.
// *Action: Use the built-in entity &lt; instead. Check for mismatched
//	    quotes ("') in case the '<' is part of subsequent markup.
/
00245, 00000, "extra data after end of document"
// *Cause: After the close of the top-level element, more data was found.
// *Action: The end-element tag for the top-level element must be the
//	    last thing in the document.
/
00246, 00000, "missing system ID after public ID"
// *Cause: In an external ID declaration, the public ID literal was
//	   not followed by the system ID literal as required.
// *Action: Provide with public *and* system IDs for 'PUBLIC' type.
/
00247, 00000, "invalid Document Type Declaration (DTD)"
// *Cause: Problems were encountered in the DTD declaration.
// *Action: Review the DTD and correct the problems.
/
00248, 00000, "invalid entity declaration"
// *Cause: Problems were encountered parsing an entity declaration.
// *Action: Check and correct the declaration syntax.
/
00249, 00000, "invalid external ID declaration"
// *Cause: Problems were encountered parsing an external ID declaration.
// *Action: Check and correct the declaration syntax.
/
00250, 00000, "invalid attribute declaration"
// *Cause: Problems were encountered parsing an attribute declaration.
// *Action: Check and correct the declaration syntax.
/
00251, 00000, "conditional sections are valid only in external DTDs"
// *Cause: A condition section is not permitted in internal DTDs.
// *Action: Remove the condition section.
/
00252, 00000, "invalid entity replacement-text nesting"
// *Cause: Markup included from an entity must nest/group properly. That
//	   is, open/close markup must occur within the same entity.
//	   For example, 
//		<!DOCTYPE doc [ <!ENTITY e "</foo><foo>"> ]>
//		<doc><foo>&e;</foo></doc>
//	   Is invalid since foo's start-tag occurs in the top-level
//	   document, but the close-tag is provided by the "e" entity.
//	   Both start and end must be provided by the same source.
// *Action: Examples, such as the ones above, are not permitted.
/
00253, 00000, "missing required version number in XML declaration"
// *Cause: An XML declaration was missing the required version#.
// *Action: Always provide a version#, which must come first in the
//	    declaration. XML is case sensitive, so only "version"
//	    (not "Version", and so on) is valid.
/
00254, 00000, "invalid XML declaration"
// *Cause: Problems were encountered parsing an XML declaration.
// *Action: Check and correct the declaration syntax.
/
00255, 00000, "XML standalone declaration must be \"yes\" or \"no\""
// *Cause: The "standalone" parameter in the XML declaration had an
//	   invalid value.
// *Action: standalone must be set to either "yes" or "no". Case is
//	    sensitive, so "Yes", "YES", and so on, are invalid.
00256, 00000, "invalid element declaration"
// *Cause: Problems were encountered parsing an element declaration.
// *Action: Check and correct the declaration.
/
00257, 00000, "invalid children specification in element declaration"
// *Cause: The 'children' specification in an element declaration was
//	   invalid.
// *Action: Check and correct the declaration.
/
00258, 00000, "invalid \"Mixed\" specification in element declaration"
// *Cause: The 'Mixed' specification in an element declaration was
//	   invalid.
// *Action: Check and correct the declaration.
/
00259, 00000, "invalid notation declaration"
// *Cause: Problems were encountered parsing a notation declaration.
// *Action: Check and correct the declaration syntax.
/
00260, 00000, "invalid xml:space attribute declaration"
// *Cause: The xml:space attribute must be declared as an enumeration
//	with choices "default" and "preserve". For example,
//	<!ATTLIST foo xml:space (default|preserve) 'preserve').
// *Action: Declare the special attribute as above.
/
00261, 00000, "invalid URL ~s"
// *Cause: The specified URL was invalid and could not be parsed.
// *Action: Correct the URL; consult RFC-2396.
/
00262, 00000, "unsupported protocol ~s"
// *Cause: An URL was encountered which requested a protocol not supported
//	by the XML parser. Only HTTP and file are currently allowed.
// *Action: Make the data available through the filesystem or HTTP.
/
00263, 00000, "couldn't connect to host ~s port ~d"
// *Cause: A TCP connection couldn't be opened to the named host.
// *Action: Verify the hostname and connectivity to the host.
/
00264, 00000, "send failed to host ~s"
// *Cause: An error occurred trying to send data over a TCP connection.
// *Action: Verify network connectivity, and so on.
/
00265, 00000, "read failed from to host ~s"
// *Cause: An error occurred trying to read data from a TCP connection.
// *Action: Verify network connectivity, and so on.
/
00266, 00000, "invalid language specification ~s"
// *Cause: The given language specification was invalid.
// *Action: Language specification has the format
//	<language>_<territory>.<character set>.
//	For example, "French_France".
/
00267, 00000, "could not resolve relative URL ~s"
// *Cause: The named relative URL couldn't be resolved against its parent.
// *Action: Make sure the relative makes sense in relation to its parent
//	URL; see RFC-2396 sections 4, 5, and appendix C.
/
00268, 00000, "invalid access method ~1d, must be 0 to ~2d"
// *Cause: The provided access code was not in the valid range.
// *Action: The code should be one of the XMLACCESS_xxx codes defined in 
//	oraxml.h, in the range shown in the error message.
/
00269, 00000, "all three access functions (open/close/read) must be provided"
// *Cause: An attempt was made to set the access method callbacks, but all three
//	functions were not provided.
// *Action: All three callback functions (open, close, and read) are required.
//	They must all be provided, even if they are stub functions which do
//	nothing.
/
00270, 00000, "FTP error: ~s"
// *Cause: An error was returned from the FTP server while trying to
//	retrieve a file. See the specific message for details.
// *Action: Corrective action depends on the error.
/
00271, 00000, "FTP login failed: ~s"
// *Cause: The username/password combination was invalid for FTP login.
// *Action: Specify a valid pair.
/
00272, 00000, "FTP server unavailable: ~s"
// *Cause: The FTP server is unavailable for use.
// *Action: No action is possible from the client side. See server's error message.
/
00273, 00000, "failed to initialize TCP/IP"
// *Cause: The TCP/IP package could not be initialized.
// *Action: Check with system administrator to see if this is a configuration
//	problem or a connectivity problem.
/
00274, 00000, "can't import node type"
// *Cause: Some node types (DOCUMENT_NODE & DOCUMENT_TYPE_NODE) cannot
//	be imported with importNode().
// *Action: No action required.
/
00275, 00000, "can't set output/data encoding AFTER parsing"
// *Cause: Output/data encoding must be set after initialization but
//	BEFORE any parsing has taken place.
// *Action: Set encoding before parsing any documents.
/
00276, 00000, "bad HTTP/Mime header"
// *Cause: An HTTP reply contained an invalid Mime header.
// *Action: Verify HTTP reply for accuracy. See RFC 2616.
/
00277, 00000, "no closing quote was seen"
// *Cause:  A quoted string was started but not finished.
// *Action:  Put a closing quote in the proper location.
/
00278, 00000, "invalid ~s proxy \"~s\""
// *Cause: The proxy specification for the given protocol was invalid.
// *Action: Check and correct the proxy specification. For HTTP, this
//	is the environment variable "http_proxy".
/
00279, 00000, "invalid no_proxy \"~s\""
// *Cause: The no_proxy specification was invalid.
// *Action: Check and correct it. no_proxy is a comma- or space-separated
//	list of machine or domain names, with an optional port part. If
//	no port part is present, then it applies to all ports on that domain.
/
00280, 00000, "HTTP error ~s"
// *Cause: An HTTP protocol error occurred.
// *Action: Corrective action depends on the error..
/
00281, 00000, "unsupported encoding \"~s\""
// *Cause:  The specified encoding is known but not supported by the parser.
// *Action:  Try a different encoding.
/
00282, 00000, "document cannot have both internal/external and shared DTDs"
// *Cause: A parser context which had a shared DTD set was used to parse
//	a document which also contained a DTD. You cannot use both a
//	shared DTD and and internal/external one.
// *Action: If a shared DTD is to be used, then the documents parsed must not
//	contain or reference a DTD.
/
00283, 00000, "document encoding is ~s-based but default input encoding is not"
// *Cause: The input document was detected to be ASCII (or EBCDIC) based, but
//	no encoding was specified in the XMLDecl and the default input coding
//	was not ASCII (or EBCDIC) based, so could not be applied.
// *Action: Add an explicit encoding specification to the XMLDecl so the
//	default input encoding is not needed, or pick a default encoding
//	which matches the input document.
/
00284, 00000, "namespace prefix to NULL URI is not allowed"
// *Cause: An element's namespace prefix declarations was for a NULL URI,
//	e.g. <foo xmlns:bar=""/>
//	This is illegal presently in XML 1.0, but will be legal in XML 1.1
// *Action: Remove erroneous prefix definition.
/
00285, 00000, "invalid Unicode surrogate ~X ~X"
// *Cause: A Unicode document contained an invalid surrogate.  If the first
//	(high) surrogate is in the correct range 0xD800 to 0xDBFF, then the
//	second (low) surrogate must be in the range 0xDC00 to 0xDFFF.
// *Action: Correct the document.
/
00286, 00000, "Exceeded max depth for recursion"
// *Cause: The depth of embedded elements in the document exceeded 
//       the limit of 2000.
// *Action: Correct the document.
/
/ --- XSL Errors ----------------------------------------------------------
/
00300, 00000, "no name in attribute set"
// *Cause:  The name attribute was not found in the attribute-set element.
// *Action:  Add a name attribute for this element.
/
00301, 00000, "error in XPATH evaluation"
// *Cause:  The XPATH evaluation returns an error.
// *Action:  Check specified XPATH expression to determine the error.
/
00302, 00000, "Incorrect stylesheet. The node is not valid."
// *Cause: The child node is of invalid type or has invalid name for this
//         particular location in stylesheet, rendering the stylesheet
//         as invalid XSLT.
// *Action:  Fix the stylesheet by using valid nodes only.
/
00303, 00000, "attribute value \"~S\" not expected for ~S"
// *Cause:  Attribute is found but its value is not the expected value.
// *Action:  Set the attribute value to the correct value.
/
00304, 00000, "input parameter to function is null"
// *Cause:  An input parameter passed into this function is null when 
//          it is not supposed to.
// *Action:  Make sure the caller function is not passing null for this
//           parameter.
/
00305, 00000, "missing token"
// *Cause:  An expected token is not found.
// *Action:  Check the input string to make sure the expected token is present.
/
00306, 00000, "inputed string ended with no corresponding closing \'}\'"
// *Cause:  A closing '}' is expected.
// *Action:  Add the closing '}' to the input string or remove the extra 
//           opening '{'.
/
00307, 00000, "namespace prefix ~S used but not declared"
// *Cause:  Namespace prefix is used but not declared.
// *Action:  Either declare the namespace or don't use this namespace prefix.
/
00308, 00000, "attribute ~S not found in ~S"
// *Cause:  The expected attribute for this node is not found.
// *Action:  Need to add this attribute to the node.
/
00309, 00000, "cannot initialize XPATH"
// *Cause:  XPATH context could not be initialized.
// *Action:  Check the initialization function LpxsutInitXpathCtx().
/
00310, 00000, "element ~S not found in ~S"
// *Cause:  The expected element is not found.
// *Action:  Check the initialization function LpxsutInitXpathCtx().
/
00311, 00000, "unsupported feature: ~s"
// *Cause:  This feature is not supported.
// *Action:  Do not use this feature.
/
00312, 00000, "cannot construct XML PI with content: ~S"
// *Cause:  The content of XML PI node might be invalid.
// *Action:  Make necessary changes to make the node valid according to spec.
/
00313, 00000, "cannot construct XML comment with content: ~S"
// *Cause:  The content of XML comment node might be invalid.
// *Action:  Make necessary changes to make the node valid according to spec.
/
00314, 00000, "an internal failure occurred"
// *Cause:  An internal error occurred in the code.
// *Action:  Contact appropriate developer.
/
00315, 00000, "extension function ~S not supported"
// *Cause:  This extension function is not supported.
// *Action:  Either contact appropriate developer for more information or
//           don't use this extension function.
/
00316, 00000, "invalid value ~S for ~S attribute ~S"
// *Cause: The value for the specified attribute is invalid.
// *Action: Consult the XSL spec, use only legal values.
/
00317, 00000, "undefined decimal-format \"~S\""
// *Cause: The named decimal-format is undefined (the name "#default"
//	means the default format).
// *Action: Define the desired decimal-format before trying to use it.
/
00318, 00000, "duplicate xsl:decimal-format \"~S\""
// *Cause: The named decimal-format was declared more than once.
// *Action: Make sure there is only a single declaration.
/
00319, 00000, "The node specified is not valid"
// *Cause: The node specified is not of expected type.
// *Action: Use only the nodes of legal type.
/
00320, 00000, "No more attributes can be added to a non empty element"
// *Cause: The element to which an attribute was being added is non
//   empty and hence can not add anymore attributes to it.
// *Action: Modify the XSLT stylesheet so that all the attributes
//   are added to an element before anything else is added to it.
//   If you absolutely can not do that then select your output
//   method to be DOM based rather then a stream or SAX based
//   output which you are using presently.
/
00321, 00000, "None of the output method (DOM, SAX, Stream) is selected"
// *Cause: User is trying to process an XML file with out selecting any
//   mechanism for output.
// *Action: User must select one of the output mechanisms (SAX/DOM/Stream)
//   before attempting to process the XML file.
/
00322, 00000, "A doc referred by XSLT stylesheet could not be opened : ~s"
// *Cause: Either an import,include or document() function tried to
//   open a document and failed.
// *Action: Make sure that document is present and can be opened.
/
00323, 00000, "illegal apply-imports because of no current template: ~s"
// *Cause: apply-imports was used even when there was no current template
//   possibly with in for-each.
// *Action: Make sure that apply-imports are invoked only if there is 
//   a current template and it is not in a xsl:for-each.
/
00324, 00000, "\"~S\" is not a valid value for the lang attribute of xsl:sort"
// *Cause:  An invalid language name was specified for sorting. 
// *Action: Provide a valid value for the lang attribute of xsl:sort.
/
00325, 00000, "recursive import/include encountred"
//
00326, 00000, "recursive use of attribute sets"
//
/ --- XPATH Errors ----------------------------------------------------------
/
00400, 00000, "an internal error has occurred in XPATH"
// *Cause:  An internal error has occurred in XPATH.
// *Action: Contact the appropriate developer.
/
00401, 00000, "invalid QName in the XSL file"
// *Cause:  An invalid QName was passed to the XPATH parser.
// *Action:  See whether there are any invalid QNames in the XSL file.
/
00402, 00000, "invalid axisname in the XSL file"
// *Cause: An invalid axis name was passed to the XPATH parser.
// *Action: See whether all axis names in the XSL file are correct. 
/
00403, 00000, "unmatched quote in the XSL file"
// *Cause:  An unmatched quote was found in the XSL file.
// *Action:  Check for unmatched quotes in the XSL file.
/
00404, 00000, "unable to resolve namespace URI"
// *Cause:  The namespace URI may not be valid.
// *Action:  Make sure that the name space URIs are valid.
/
00405, 00000, "unable to allocate memory"
// *Cause:  May be out of memory.
// *Action: Try increasing virtual memory. 
/
00406, 00000, "object of incorrect type passed to the function"
// *Cause:  An object of incorrect type was passed to the XPATH/XSL function.
// *Action:  Do the required conversion before passing in an object of
//           type which is different from the expected type.
/
00407, 00000, "right square bracket missing in the XSL file"
// *Cause:  Right square bracket missing in the XSL file.
// *Action: Check for unmatched square bracket in the XSL file.
/
00408, 00000, "right parenthesis missing in the XSL file"
// *Cause:  Right parenthesis missing in the XSL file.
// *Action:  Check for unmatched parenthesis in the XSL file.
/
00409, 00000, "incorrect token encountered while parsing"
// *Cause:  An unexpected token encountered while parsing the expression/
//          pattern.
// *Action:  Check the syntax of the expressions/patterns.
/
00410, 00000, "unable to resolve the variable reference"
// *Cause:  Variable reference may not be valid.
// *Action:  Check whether the variable references are valid.
/
00411, 00000, "unknown function name encountered"
// *Cause:  The function is not supported at this time or the name is invalid.
// *Action:  Check the function names. If valid and this error occurs, then 
//           avoid using them at this time.
/
00413, 00000, "loss of precision due to excessively large numerical constant"
// *Cause:  The numerical constant in the XPath expression is too big.
/
/ --- XSLT VM Errors ---------------------------------------------------------
/
00601, 00000, "Invalid token in: '~S'"
// *Cause:  Invalid token in XPath expression.
// *Action:  Check the expression.
/
00602, 00000, "Invalid child element '~1S' of element '~2S'."
// *Cause:  Invalid child element in this stylesheet context.
// *Action:  Check the stylesheet.
/
00603, 00000, "Invalid attribute value '~1S': {element '~2S', attribute '~3S'}."
// *Cause:  Invalid attribute value in this stylesheet context.
// *Action:  Check the stylesheet.
/
00604, 00000, "Invalid attribute value '~1S', for attribute '~2s'."
// *Cause:  Invalid attribute value for this attribute.
// *Action:  Check the stylesheet.
/
00605, 00000, "Invalid attribute '~1S' in element '~2S'."
// *Cause:  Invalid attribute for this element.
// *Action:  Check the stylesheet.
/
00606, 00000, "Missing attribute '~1s' in element '~2S'."
// *Cause:  Missing attribute for this element.
// *Action:  Check the stylesheet.
/
00607, 00000, "Invalid reference: '~S'."
// *Cause:  Invalid variable or parameter or template reference.
// *Action:  Check the stylesheet.
/
00608, 00000, "Repeated declaration of '~1S' in element '~2S'."
// *Cause:  Only one declaration is allowed at this level.
// *Action:  Check the stylesheet.
/
00609, 00000, "Function call with invalid number of arguments in '~1S'."
// *Cause:  Invalid number of arguments.
// *Action:  Check the function signature.
/
00651, 00000, "VM Stack overflow."
// *Cause:  The XML data is too large.
// *Action:  Increase the size of VM stacks in XmlXslVMCreate().
/
00652, 00000, "SAX callback returns with error."
// *Cause:  SAX callback returns an error.
// *Action:  Check the callback function.
/
00653, 00000, "Output attribute '~S' doesn't have a parent element."
// *Cause:  Attribute is generated in a wrong context.
// *Action:  Check the XSLT stylesheet.
/
00654, 00000, "Output namespace attribute '~S' doesn't have a parent element."
// *Cause:  Attribute generated in the wrong context.
// *Action:  Check the XSLT stylesheet.
/
00655, 00000, "Invalid output comment '~S'."
// *Cause:  Invalid comment node.
// *Action:  Check the XSLT stylesheet.
/
00656, 00000, "XSLTVM terminate."
// *Cause:  VM terminates.
// *Action:  No action.
/
00657, 00000, "Invalid output PI '~S'."
// *Cause:  Invalid PI node.
// *Action:  Check the XSLT stylesheet.
/
00658, 00000, "Invalid XSLT object type."
// *Cause:  Invalid object type in XPath evaluation.
// *Action:  Check the XSLT stylesheet.
/
00659, 00000, "Output write failed."
// *Cause:  Write operation failed.
// *Action:  Check the write method.
/
00660, 00000, "Not a well-formed document or external entity."
// *Cause:  The generated document is not well-formed.
// *Action:  Check the XSLT stylesheet.
/
00661, 00000, "Failed to load: '~s'."
// *Cause:  Failed to load a document.
// *Action:  Check the XSLT stylesheet.
/
00662, 00000, "Invalid encoding."
// *Cause:  Invalid encoding specified.
// *Action:  Check the encoding string.
/
00663, 00000, "VM String-Stack overflow."
// *Cause:  The string data is too large.
// *Action:  Increace the size of VM StringStack in XmlXslVMCreate().
/
00664, 00000, "VM Node-Stack overflow."
// *Cause:  Too many XML nodes.
// *Action:  Increace the size of VM NodeStack in XmlXslVMCreate().
/
00690, 00000, "Invalid argument."
// *Cause:  Invalid or missing argument.
// *Action:  Check the function signature.
/
/ --- SOAP Errors ---------------------------------------------------------
/ --- NOTE None of the SOAP error messages should require arguments so ----
/ ---      that they can be returned by XmlSoapErrMsg() -------------------
/
00700, 00000, "invalid SOAP context"
// *Cause:  The SOAP context passed to an XmlSoap function was invalid.
// *Action: Make sure the context passed is an xmlsoapctx and is still
//	valid (has not been destroyed).
/
00701, 00000, "invalid SOAP role"
// *Cause:  An invalid SOAP role was specified.
// *Action: Only xmlsoaprole enum values should be used (see xml.h).
/
00702, 00000, "invalid SOAP connection binding"
// *Cause:  An invalid SOAP connection binding was specified.
// *Action: Only xmlsoapbind enum values should be used (see xml.h).
/
00703, 00000, "SOAP POST failed"
// *Cause:  A SOAP message sent with an HTTP binding failed.
// *Action: See the returned HTTP error to determine the problem.
/
00704, 00000, "elem has no mustUnderstand"
// *Cause:  Header block does not have a mustUnderstand attribute.
// *Action:  This is legal, no action required.
/
00705, 00000, "elem has no role"
// *Cause:  Header block does not have a role attribute.
// *Action:  This is legal, no action required.
/
00706, 00000, "message has no fault"
// *Cause:  Message body has no Fault child.
// *Action:  This is legal, no action required.
/
00707, 00000, "no Fault reason w/given language"
// *Cause:  Fault element does not have a reason with given language.
// *Action:  This is legal, no action required.
/
00708, 00000, "SOAP failed to make HTTP connection"
// *Cause:  SOAP failed to make an HTTP connection to the given URL.
// *Action: Possible cause is invalid URL or memory exhaustion.
/
00709, 00000, "SOAP reply not valid XML"
// *Cause:  The reply to a SOAP call was not a valid XML document.
// *Action: Check the calling URL for validity; otherwise the problem
//	is likely to be on the reply side.
/
00711, 00000, "invalid SOAP version"
// *Cause:  The version string specified at SOAP creation time was invalid.
// *Action: Specify a valid version string, either '1.1' or '1.2'.
/
00712, 00000, "failed to set HTTP header"
// *Cause:  Connection does not exists, or header is badly formed, or maximum
// number of headers is exceeded.
// *Action:  Check that connection exists, header has ':', decrease number of 
// headers.
/
00713, 00000, "body has more than one fault"
// *Cause:  Message body has multiple Fault children.
// *Action:  Most likely bug in the server.
/
00714, 00000, "fault is not a single child"
// *Cause:  Message body has additional children besides Fault.
// *Action:  Most likely bug in the server.
/
00715, 00000, "badly formed fault elemen"
// *Cause:  Fault element does not have one of mandatory children or has 
// children, which are not allowed.
// *Action:   Most likely bug in the server.
/
00716, 00000, "badly formed Text subelement"
// *Cause:  Mandatory text child is missing from the requested  message subelemt.
// *Action:  Most likely bug in the server.
/
00717, 00000, "badly formed Value subelement"
// *Cause:  Mandatory Value child of the Code child of the Fault badly formed 
// or absent.
// *Action:  Most likely bug in the server.
/
00718, 00000, "message has no envelope"
// *Cause:  The message has no envelope element child.
// *Action:  Most likely bug in the server.
/
00719, 00000, "prefix too long"
// *Cause:  The maximum size of encoded namespace attribute name is 1022.
// *Action:  Use shorter prefix.
/
00720, 00000, "envelope has no header"
// *Cause:  The message envelope does not have header.
// *Action: This is legal, no action required
/
00721, 00000, "envelope has no body"
// *Cause:  The message envelope does not have body.
// *Action:  Most likely bug in the server.
/
00722, 00000, "elem has no relay"
// *Cause:  Header block does not have a relay attribute.
// *Action:  This is legal, no action required.
/
00723, 00000, "no such element"
// *Cause:  The element with requested namespace name and local part does not exists.
// *Action:  This is legal, no action required.
/

/ --- WebDAV Errors ---------------------------------------------------------
/
00750, 00000, "arguments \"~1s\" to function \"~2s\" are null"
// *Cause:  Input arguments passed into this function are null when
//          it is not supposed to.
// *Action:  Make sure the caller function is not passing null for this
//           parameter.
/
00751, 00000, "arguments \"~s\" are exclusive"
// *Cause:  Input arguments passed into this function are exclusive.
//          Specify only one of them.
// *Action:  Specify only one of the exclusive arguments.
/
00752, 00000, "invalid ~1s, must be ~2s"
// *Cause:  Invalid value was specified for attribute.
// *Action:  Correct the value with one of the suggested values.
/
00753, 00000, "invalid proxy \"~s\""
// *Cause: The proxy specification for the given protocol was invalid.
// *Action: Check and correct the proxy specification. For HTTP, this
//      is the environment variable "http_proxy".
/
00754, 00000, "invalid no_proxy \"~s\""
// *Cause: The no_proxy specification was invalid.
// *Action: Check and correct the specification. no_proxy is a comma- or
//          space-separated list of machine or domain names, with an optional
//          port part. If no port part is present, then it applies to all
//          ports on that domain.
/
00755, 00000, "missing required argument \"~s\""
// *Cause:  A required argument was missing.
// *Action: Provide the missing argument to the function.
/
00756, 00000, "Etags and tokens must be either all tagged or all untagged"
// *Cause:  The list of condition factors need to be either all tagged with
//          absoluteURI's or all untagged with absoluteURI's.
// *Action: If all condition factors were applied to the resource receiving
//          the request, make them all untagged.  Otherwise, make them all
//          tagged with appropriate resource's URI's.
/
00757, 00000, "maximum XML document size (~s bytes) exceeded"
// *Cause:  The input XML document's size exceeded the limit set by
//          "max_xml_size" attribute set in XmlDavCreate().
// *Action: Raise the value set for max_xml_size attribute in XmlDavCreate()
//          if this does not create problems with security.
/
00758, 00000, "user-provided callback returns null"
// *Cause:  Null was returned from user-provided callback function.
// *Action: Check error(s) encoutered within the callback function.
/
00759, 00000, "failed to initialize TCP/IP"
// *Cause: The TCP/IP package could not be initialized.
// *Action: Check with your system administrator to see if this is a
//          configuration problem or a connectivity problem.
/
00760, 00000, "couldn't connect to host ~s port ~u"
// *Cause: A TCP connection couldn't be opened to the named host.
// *Action: Verify the hostname and connectivity to the host.
/
00761, 00000, "send failed to host ~s"
// *Cause: An error occurred trying to send data over a TCP connection.
// *Action: Verify network connectivity.
/
00762, 00000, "read failed from host ~s"
// *Cause: An error occurred trying to read data from a TCP connection.
// *Action: Verify network connectivity.
/
00763, 00000, "exceeded maximum TCP connections"
// *Cause: The maximum allowable number of TCP connections were exceeded.
//         This happens only if too many pending HTTP responses have not
//         been properly ended or destroyed.
// *Action: End a pending response session or destroy response objects
//          that have been processed.
/
00764, 00000, "TCP connection was broken"
// *Cause: Either the server terminated the TCP connection or the TCP
//         connection is in a bad state.
// *Action: Analyze the error.  After cleanup, retry the method.
/
00765, 00000, "HTTP error ~s"
// *Cause: An HTTP protocol error occurred.
// *Action: Corrective action depends on the error.
/
00766, 00000, "unsupported transfer-coding values: ~s"
// *Cause: Only "chunked" and "identity" transfer-coding values are supported.
// *Action: This is WebDAV implementation's shortfall.  There is no workaround
//          for this problem.
/
00767, 00000, "not a text media type"
// *Cause: A text media type was expected.  But other media types were found.
// *Action: Since this data cannot be read as a text type, use another
//          routine to read it.
/
00768, 00000, "no entity body found"
// *Cause: No entity body was found when it was read.
// *Action: Check the HTTP status code and headers to see why the entity
//          body was not found.
/
00769, 00000, "not xml media type"
// *Cause: An XML media type was expected.  But other media types were found.
// *Action: Since this data cannot be read as an XML type, use another
//          routine to read it.
00770, 00000, "missing lock token in lock refresh request"
// *Cause: A LOCK request to refresh a lock had no lock token header
//         specified.
// *Action: Use XmlDavUpdResDesc to set a lock token in the resource
/           descriptor before calling XmlDavResLock.
/
00771, 00000, "missing lock token in UNLOCK request"
// *Cause: An UNLOCK request to remove a lock had no lock token header
//         specified.
// *Action: Use XmlDavUpdResDesc to set a lock token in the resource
/           descriptor before calling XmlDavResUnlock.
/
00772, 00000, "wrong object type"
// *Cause: The wrong object type was given as argument to a WebDAV call.
// *Action: Review the failing function call, consult the documentation, and
//      make sure the object types pass as correct.
/
00773, 00000, "protocol violation: ~s"
// *Cause: The entity body sent by the server in Chunked Transfer Encoding
//         violated protocol.
// *Action: Either this is an internal implementation error or a server
//          implementation error.  Users should file a bug agaist either
//          the server's or the client's implementation.
/
/ --- XQuery Parser Errors ------------------------------------------------
/
00800, 00000, "XQuery invalid token"
// *Cause:  Invalid XQuery query.
// *Action: Correct the query.
/
00801, 00000, "XQuery syntax error at"
// *Cause:  Invalid XQuery query.
// *Action: Correct the query.
/
00802, 00000, "Too many arguments"
// *Cause:  Invalid XQuery query.
// *Action: Correct the query.
/
00803, 00000, "Too few arguments"
// *Cause:  Invalid XQuery query.
// *Action: Correct the query.
/
00804, 00000, "Invalid token: '~S'"
// *Cause:  Invalid program.
// *Action: Correct the program.
/
00805, 00000, "Syntax error at '~S'"
// *Cause:  Invalid program.
// *Action: Correct the program.
/
/
/ --- XSLT to XQuery Errors ------------------------------------------------
/
00825, 00000, "Can't compile the element:"
// *Cause:  XSLT Stylesheet can't be compiled to XQuery query.
// *Action: Correct the the stylesheet.
/
00826, 00000, "Can't compile the attribute:"
// *Cause:  XSLT Stylesheet can't be compiled to XQuery query.
// *Action: Correct the the stylesheet.
/
00827, 00000, "Namespace conflict for prefix:"
// *Cause:  XSLT Stylesheet can't be compiled to XQuery query.
// *Action: Correct the the stylesheet.
/
/
/ --- ??? ------------------------------------------------------------------
/
00903, 00000, "Invalid flags specified for XmlDiff or XmlPatch"
// *Cause:  Invalid value supplied to flags parameter for XmlDiff or 
//          XmlPatch functions.
// *Action: Specify valid flags (see xmldf.h).
/
00904, 00000, "Invalid inputs were supplied to XmlDiff or XmlPatch"
// *Cause:  Data could not be read from inputs to XmlDiff or XmlPatch
//          functions.
// *Action: Specify valid inputs (see xmldf.h).
/
00905, 00000, "Insert-node or append-node failed in XmlDiff "
// *Document: NO
// *Cause:  
// *Action: 
/
00906, 00000, "Ouput generation failed for XmlDiff (illegal operation)"
// *Document: NO
// *Cause:  
// *Action: 
/
00907, 00000, "XmlDiff encountered an invalid state in FSM"
// *Document: NO
// *Cause:  
// *Action: 
/
00908, 00000, "XmlDiff encountered an inconsistency in DMTRX "
// *Document: NO
// *Cause:  
// *Action: 
/
00909, 00000, "Rename operation failed in XmlDiff"
// *Document: NO
// *Cause:  
// *Action: 
/
00910, 00000, "The root nodes in input documents to XmlDiff did not match"
// *Cause:  The root nodes in input documents do not match.
// *Action: Make sure the root nodes have same qualified name in both input 
//          documents. XmlDiff can be called only if the root nodes are same
//          in input documents.
/
00911, 00000, "XmlDiff encountered an error in computing a hash for XML subtree"
// *Document: NO
// *Cause:  
// *Action: 
/
00912, 00000, "XmlDiff encountered limit for maximum input XML nodes"
// *Document: NO
// *Cause:  
// *Action: 
/
00913, 00000, "XmlPatch could not process the XML PI oracle-xmldiff"
// *Cause:  The diff document either did not specify the XML Processing 
//          Instruction "oracle-xmldiff" or did not specify all data required 
//          by XmlPatch. The PI should be the first child of the top-level 
//          xdiff element. This error is also thrown when the output-model is
//          'snapshot' and operations-in-docorder is 'false'.
// *Action: Specify the "oracle-xmldiff" PI correctly. See documentation for 
//          XmlPatch C function in xmldf.h. 
/
00914, 00000, "Import of XML node from diff document failed in XmlPatch"
// *Document: NO
// *Cause:  
// *Action: 
/
00915, 00000, "XmlDiff or XmlPatch encountered an unknown type of XML node"
// *Document: NO
// *Cause:  
// *Action: 
/
00916, 00000, "Invalid NS maps in XmlDiff or XmlPatch"
// *Document: NO
// *Cause:  
// *Action: 
/
00917, 00000, "XmlPatch encountered an error in initializing XmlXVM"
// *Document: NO
// *Cause:  
// *Action: 
/
00918, 00000, "XmlPatch encountered an error in translating XPATH using XmlXVM"
// *Cause:  XmlPatch encountered an invalid XPATH in the diff document.
// *Action: If you handcoded the diff document, make sure all the XPATHs in the
//          diff document are valid.
/
00999, 00000, "Internal error in XmlDiff or XmlPatch"
// *Document: NO
// *Cause:  
// *Action: 
/
/
/ --- XVM (XQuery/XSLT/XPath) Errors ---------------------------------------
/
01001, 00000, "[XPST0001] Static context component '~S' has no value"
// *Cause:  It is a static error if analysis of an expression relies on some
//          component of the static context that has not been assigned a value.
// *Action: 
/
01002, 00000, "[XPDY0002] Dynamic context component '~S' has no value"
// *Cause:  It is a dynamic error if evaluation of an expression relies on some//           part of the dynamic context that has not been assigned a value.
// *Action: 
/
01003, 00000, "[XPST0003] Syntax error at '~s'"
// *Cause:  It is a static error if an expression is not a valid instance of 
//          the grammar defined in A.1 EBNF
// *Action: 
/
01004, 00000, "[XPTY0004] Expression type does not match a required type"
// *Cause:  It is a type error if, during the static analysis phase, 
//          an expression is found to have a static type that is not 
//          appropriate for the context in which the expression occurs,
//          or during the dynamic evaluation phase, the dynamic type of a value
//          does not match a required type as specified by the matching rules
//          in 2.5.4 SequenceType Matching.
// *Action: Check the expression type.
/
01005, 00000, "[XPST0005] Invalid empty-sequence() expression"
// *Cause:  During the analysis phase, it is a static error if the static type
//          assigned to an expression other than the expression () or data(())
//          is empty-sequence().
// *Action: 
/
01006, 00000, "[XPTY0006]"
// *Cause:  Not currently used.
// *Action: 
/
01007, 00000, "[XPTY0007]"
// *Cause:  Not currently used.
// *Action: 
/
01008, 00000, "[XPST0008] Invalid reference"
// *Cause:  It is a static error if an expression refers to an element name,
//          attribute name, schema type name, namespace prefix, or variable
//          name that is not defined in the static context, except for 
//          an ElementName in an ElementTest or an AttributeName in 
//          an AttributeTest.
// *Action: 
/
01009, 00000, "[XQST0009] Schema Import Feature not supported"
// *Cause:  An implementation that does not support the Schema Import Feature
//          must raise a static error if a Prolog contains a schema import.
// *Action: 
/
01010, 00000, "[XPST0010] Axis '~S' not supported"
// *Cause:  An implementation must raise a static error if it encounters 
//          a reference to an axis that it does not support.
// *Action: 
/
01012, 00000, "[XQST0012] Invalid XML schema"
// *Cause:  It is a static error if the set of definitions contained in all
//          schemas imported by a Prolog do not satisfy the conditions for 
//          schema validity specified in Sections 3 and 5 of [XMLSchema] Part 1
//          i.e., each definition must be valid, complete, and unique
// *Action: 
/
01013, 00000, "[XQST0013] Invalid pragma content"
// *Cause:  It is a static error if an implementation recognizes a pragma but
//          determines that its content is invalid.
// *Action: 
/
01014, 00000, "[XQST0014]"
// *Cause:  Not currently used.
// *Action: 
/
01015, 00000, "[XQST0015]"
// *Cause:  Not currently used.
// *Action: 
/
01016, 00000, "[XQST0016] Module Feature not supported"
// *Cause:  An implementation that does not support the Module Feature raises
//          a static error if it encounters a module declaration or a module
//          import.
// *Action: 
/
01017, 00000, "[XPST0017] Invalid function call"
// *Cause:  It is a static error if the expanded QName and number of arguments
//          in a function call do not match the name and arity of a function
//          signature in the static context.
// *Action: 
/
01018, 00000, "[XPTY0018] Path last step contains both nodes and atomic values"
// *Cause:  It is a type error if the result of the last step in a path 
//          expression contains both nodes and atomic values.
// *Action: 
/
01019, 00000, "[XPTY0019] Path step contains atomic values"
// *Cause:  It is a type error if the result of a step (other than the last
//          step) in a path expression contains an atomic value.
// *Action: 
/
01020, 00000, "[XPTY0020] The path step context item is not a node"
// *Cause:  It is a type error if, in an axis step, the context item 
//          is not a node.
// *Action: 
/
01021, 00000, "[XPDY0021]"
// *Cause:  Not currently used.
// *Action: 
/
01022, 00000, "[XQST0022] The value of a namespace must be a URILiteral."
// *Cause:  It is a static error if the value of a namespace declaration
//          attribute is not a URILiteral.
// *Action: 
/
01023, 00000, "[XPDY0023]"
// *Cause:  Not currently used.
// *Action: 
/
01024, 00000, "[XQTY0024] Attribute node out of context"
// *Cause:  It is a type error if the content sequence in an element
//          constructor contains an attribute node following a node that 
//          is not an attribute node.
// *Action: 
/
01025, 00000, "[XQDY0025] Repeated attribute name"
// *Cause:  It is a dynamic error if any attribute of a constructed element
//          does not have a name that is distinct from the names of all other
//          attributes of the constructed element.
// *Action: 
/
01026, 00000, "[XQDY0026] Processing instruction content contains '?>'"
// *Cause:  It is a dynamic error if the result of the content expression
//          of a computed processing instruction constructor contains 
//          the string '?>'.
// *Action: 
/
01027, 00000, "[XQDY0027] Invalid PSVI validity property of the root element"
// *Cause:  In a validate expression, it is a dynamic error if the root
//          element information item in the PSVI resulting from validation
//          does not have the expected validity property: valid if validation
//          mode is strict, or either valid or notKnown if validation 
//          mode is lax.
// *Action: 
/
01028, 00000, "[XQDY0028]"
// *Cause:  Not currently used
// *Action: 
/
01029, 00000, "[XQDY0029]"
// *Cause:  Not currently used
// *Action: 
/
01030, 00000, "[XQTY0030] Expression should evaluate to exactly one node"
// *Cause:  It is a type error if the argument of a validate expression does
//          not evaluate to exactly one document or element node.
// *Action: 
/
01031, 00000, "[XQST0031] Version not supported by the implementation"
// *Cause:  It is a static error if the version number specified in a version
//          declaration is not supported by the implementation.
// *Action: 
/
01032, 00000, "[XQST0032] Repeated base URI declaration"
// *Cause:  A static error is raised if a Prolog contains more than one 
//          base URI declaration.
// *Action: 
/
01033, 00000, "[XQST0033] Multiple bindings for the namespace prefix '~s'"
// *Cause:  It is a static error if a module contains multiple bindings 
//          for the same namespace prefix.
// *Action: 
/
01034, 00000, "[XQST0034] Repeated function declaration"
// *Cause:  It is a static error if multiple functions declared or imported by
//          a module have the number of arguments and their expanded QNames
//          are equal (as defined by the eq operator).
// *Action: 
/
01035, 00000, "[XQST0035] Repeated schema components"
// *Cause:  It is a static error to import two schema components that both
//          define the same name in the same symbol space and in
//          the same scope.
// *Action: 
/
01036, 00000, "[XQST0036] Importing module should import schema '~s'"
// *Cause:  It is a static error to import a module if the importing module's
//          in-scope schema types do not include definitions for the schema
//          type names that appear in the declarations of variables and
//          functions (whether in an argument type or return type) that are
//          present in the imported module and are referenced in 
//          the importing module.
// *Action: 
/
01037, 00000, "[XQST0037]"
// *Cause:  Not currently used
// *Action: 
/
01038, 00000, "[XQST0038] Invalid collation"
// *Cause:  It is a static error if a Prolog contains more than one default
//          collation declaration, or the value specified by a default
//          collation declaration is not present in statically known
//          collations.
// *Action: 
/
01039, 00000, "[XQST0039] Repeated parameter name"
// *Cause:  It is a static error for a function declaration to have more than
//          one parameter with the same name.
// *Action: 
/
01040, 00000, "[XQST0040] Repeated attribute name"
// *Cause:  It is a static error if the attributes specified by a direct
//          element constructor do not have distinct expanded QNames.
// *Action: 
/
01041, 00000, "[XQDY0041] Expression can't be cast to the type xs:NCName"
// *Cause:  It is a dynamic error if the value of the name expression in 
//          a computed processing instruction constructor cannot be cast
//          to the type xs:NCName.
// *Action: 
/
01042, 00000, "[XQST0042]"
// *Cause:  Not currently used.
// *Action: 
/
01043, 00000, "[XQST0043]"
// *Cause:  Not currently used.
// *Action: 
/
01044, 00000, "[XQDY0044] Invalid attribute namespace"
// *Cause:  It is a dynamic error if the node-name property of the node
//          constructed by a computed attribute constructor is in the 
//          namespace http://www.w3.org/2000/xmlns/ (corresponding to namespace
//          prefix xmlns), or is in no namespace and has local name xmlns.
// *Action: 
/
01045, 00000, "[XQST0045] Invalid function namespace"
// *Cause:  It is a static error if the function name in a function
//          declaration is in one of the following namespaces:
//          http://www.w3.org/XML/1998/namespace,
//          http://www.w3.org/2001/XMLSchema,
//          http://www.w3.org/2001/XMLSchema-instance,
//          http://www.w3.org/2005/xpath-functions.
// *Action: 
/
01046, 00000, "[XQST0046] Invalid URILiteral"
// *Cause:  An implementation MAY raise a static error if the value of 
//          a URILiteral is of nonzero length and is not in the lexical space
//          of xs:anyURI.
// *Action: 
/
01047, 00000, "[XQST0047] Repeated import module target namespace"
// *Cause:  It is a static error if multiple module imports in the same
//          Prolog specify the same target namespace.
// *Action: 
/
01048, 00000, "[XQST0048] Namespace should be as the module target namespace"
// *Cause:  It is a static error if a function or variable declared in 
//          a library module is not in the target namespace of 
//          the library module.
// *Action: 
/
01049, 00000, "[XQST0049] Repeated variable declaration"
// *Cause:  It is a static error if two or more variables declared or 
//          imported by a module have equal expanded QNames (as defined by 
//          the eq operator.)
// *Action: 
/
01050, 00000, "[XPDY0050] Invalid dynamic type"
// *Cause:  It is a dynamic error if the dynamic type of the operand of 
//          a treat expression does not match the sequence type specified by
//          the treat expression. This error might also be raised by a path
//          expression beginning with "/" or "//" if the context node is not
//          in a tree that is rooted at a document node. This is because
//          a leading "/" or "//" in a path expression is an abbreviation for
//          an initial step that includes the clause treat as document-node().
// *Action: 
/
01051, 00000, "[XPST0051] AtomicType not defined"
// *Cause:  It is a static error if a QName that is used as an AtomicType in
//          a SequenceType is not defined in the in-scope schema types
//          as an atomic type.
// *Action: 
/
01052, 00000, "[XQDY0052]"
// *Cause:  Not currently used.
// *Action: 
/
01053, 00000, "[XQDY0053]"
// *Cause:  Not currently used.
// *Action: 
/
01054, 00000, "[XQST0054] The variable depends on itself"
// *Cause:  It is a static error if a variable depends on itself.
// *Action: 
/
01055, 00000, "[XQST0055] Repeated copy-namespaces declaration"
// *Cause:  It is a static error if a Prolog contains more than one
//          copy-namespaces declaration.
// *Action: 
/
01056, 00000, "[XQST0056]"
// *Cause:  Not currently used.
// *Action: 
/
01057, 00000, "[XQST0057] Missing schema import target namespace"
// *Cause:  It is a static error if a schema import binds a namespace prefix 
//          but does not specify a target namespace other than a zero-length
//          string.
// *Action: 
/
01058, 00000, "[XQST0058] Repeated schema import target namespace"
// *Cause:  It is a static error if multiple schema imports specify 
//          the same target namespace.
// *Action: 
/
01059, 00000, "[XQST0059] Can't find schema or module with namespace '~s'"
// *Cause:  It is a static error if an implementation is unable to process
//          a schema or module import by finding a schema or module with
//          the specified target namespace.
// *Action: 
/
01060, 00000, "[XQST0060] Function name should have a namespace"
// *Cause:  It is a static error if the name of a function in a function
//          declaration is not in a namespace (expanded QName has a null
//          namespace URI).
// *Action: 
/
01061, 00000, "[XQDY0061] Invalid document node"
// *Cause:  It is a dynamic error if the operand of a validate expression
//          is a document node whose children do not consist of exactly one
//          element node and zero or more comment and processing instruction
//          nodes, in any order.
// *Action: 
/
01062, 00000, "[XQDY0062]"
// *Cause:  Not currently used.
// *Action: 
/
01063, 00000, "[XQST0063]"
// *Cause:  Not currently used.
// *Action: 
/
01064, 00000, "[XQDY0064] Processing instruction name contains 'XML'"
// *Cause:  It is a dynamic error if the value of the name expression in
//          a computed processing instruction constructor is equal to "XML"
//          (in any combination of upper and lower case).
// *Action: 
/
01065, 00000, "[XQST0065] Repeated ordering mode declaration"
// *Cause:  A static error is raised if a Prolog contains more than one
//          ordering mode declaration.
// *Action: 
/
01066, 00000, "[XQST0066] Repeated default declaration"
// *Cause:  A static error is raised if a Prolog contains more than one
//          default element/type namespace declaration, or more than one
//          default function namespace declaration.
// *Action: 
/
01067, 00000, "[XQST0067] Repeated construction declaration"
// *Cause:  A static error is raised if a Prolog contains more than one
//          construction declaration.
// *Action: 
/
01068, 00000, "[XQST0068] Repeated boundary-space declaration"
// *Cause:  A static error is raised if a Prolog contains more than one
//          boundary-space declaration.
// *Action: 
/
01069, 00000, "[XQST0069] Repeated empty order declaration"
// *Cause:  A static error is raised if a Prolog contains more than one
//          empty order declaration.
// *Action: 
/
01070, 00000, "[XQST0070] Invalid (prefix, URI) combination"
// *Cause:  A static error is raised if a namespace URI is bound to the
//          predefined prefix xmlns, or if a namespace URI other than
//          http://www.w3.org/XML/1998/namespace is bound to the prefix xml,
//          or if the prefix xml is bound to a namespace URI other than
//          http://www.w3.org/XML/1998/namespace.
// *Action: 
/
01071, 00000, "[XQST0071] Repeated namespace attribute"
// *Cause:  A static error is raised if the namespace declaration attributes
//          of a direct element constructor do not have distinct names.
// *Action: 
/
01072, 00000, "[XQDY0072] Element content contains invalid hyphens combination"
// *Cause:  It is a dynamic error if the result of the content expression of
//          a computed comment constructor contains two adjacent hyphens or
//          ends with a hyphen.
// *Action: 
/
01073, 00000, "[XQST0073] Cyclic import sequence"
// *Cause:  It is a static error if the graph of module imports contains
//          a cycle (that is, if there exists a sequence of modules M1 ... Mn
//          such that each Mi imports Mi+1 and Mn imports M1), unless all
//          the modules in the cycle share a common namespace.
// *Action: 
/
01074, 00000, "[XQDY0074] Invalid element or attribute QName"
// *Cause:  It is a dynamic error if the value of the name expression in
//          a computed element or attribute constructor cannot be converted
//          to an expanded QName (for example, because it contains a namespace
//          prefix not found in statically known namespaces.)
// *Action: 
/
01075, 00000, "[XQST0075] Validate expression not supported"
// *Cause:  An implementation that does not support the Validation Feature
//          must raise a static error if it encounters a validate expression.
// *Action: 
/
01076, 00000, "[XQST0076] Invalid collation"
// *Cause:  It is a static error if a collation subclause in an order by
//          clause of a FLWOR expression does not identify a collation that
//          is present in statically known collations.
// *Action: 
/
01077, 00000, "[XQST0077]"
// *Cause:  Not currently used.
// *Action: 
/
01078, 00000, "[XQST0078]"
// *Cause:  Not currently used.
// *Action: 
/
01079, 00000, "[XQST0079] Invalid extension expression"
// *Cause:  It is a static error if an extension expression contains neither
//          a pragma that is recognized by the implementation nor
//          an expression enclosed in curly braces.
// *Action: 
/
01080, 00000, "[XPST0080] Invalid target type"
// *Cause:  It is a static error if the target type of a cast or castable
//          expression is xs:NOTATION or xs:anyAtomicType.
// *Action: 
/
01081, 00000, "[XPST0081] Invalid prefix"
// *Cause:  It is a static error if a QName used in a query contains
//          a namespace prefix that cannot be expanded into a namespace URI
//          by using the statically known namespaces.
// *Action: 
/
01082, 00000, "[XQST0082] "
// *Cause: Not currently used. 
// *Action: 
/
01083, 00000, "[XQST0083]"
// *Cause:  Not currently used.
// *Action: 
/
01084, 00000, "[XQDY0084] Missing top-level element declaration"
// *Cause:  It is a dynamic error if the element validated by a validate
//          statement does not have a top-level element declaration in
//          the in-scope element declarations, if validation mode is strict.
// *Action: 
/
01085, 00000, "[XQST0085] The namespace URI shouldn't be a zero-length string"
// *Cause:  It is a static error if the namespace URI in a namespace
//          declaration attribute is a zero-length string, and
//          the implementation does not support [XML Names 1.1].
// *Action: 
/
01086, 00000, "[XQTY0086] No-preserve mode conflict"
// *Cause:  It is a type error if the typed value of a copied element or
//          attribute node is namespace-sensitive when construction mode is
//          preserve and copy-namespaces mode is no-preserve.
// *Action: 
/
01087, 00000, "[XQST0087] Invalid encoding"
// *Cause:  It is a static error if the encoding specified in a Version
//          Declaration does not conform to the definition of EncName
//          specified in [XML 1.0].
// *Action: 
/
01088, 00000, "[XQST0088] Target namespace string shouldn't be of zero length"
// *Cause:  It is a static error if the literal that specifies the target
//          namespace in a module import or a module declaration
//          is of zero length.
// *Action: 
/
01089, 00000, "[XQST0089] Repeated variable name"
// *Cause:  It is a static error if a variable bound in a for clause of
//          a FLWOR expression, and its associated positional variable,
//          do not have distinct names (expanded QNames).
// *Action: 
/
01090, 00000, "[XQST0090] Invalid character reference"
// *Cause:  It is a static error if a character reference does not identify
//          a valid character in the version of XML that is in use.
// *Action: 
/
01091, 00000, "[XQDY0091] Invalid xml:id"
// *Cause:  An implementation MAY raise a dynamic error if an xml:id error,
//          as defined in [XML ID], is encountered during construction of
//          an attribute named xml:id.
// *Action: 
/
01092, 00000, "[XQDY0092] Invalid xml:space value"
// *Cause:  An implementation MAY raise a dynamic error if a constructed
//          attribute named xml:space has a value other than preserve
//          or default.
// *Action: 
/
01093, 00000, "[XQST0093] Module depends on itself"
// *Cause:  It is a static error to import a module M1 if there exists
//          a sequence of modules M1 ... Mi ... M1 such that each module
//          directly depends on the next module in the sequence (informally,
//          if M1 depends on itself through some chain of module dependencies.)
// *Action: 
/
01094, 00000, "[FORG0003] fn:zero-or-one called with a sequence containing more than one item"
// *Cause:  It is a dynamic error if fn:zero-or-one is called with a sequence
//          containing more than one item
// *Action: 
/
01095, 00000, "[FORG0004] fn:one-or-more called with a sequence containing no items"
// *Cause:  It is a dynamic error if fn:one-or-more is called with a sequence
//          containing no items
// *Action: 
/
01096, 00000, "[FORG0005] fn:exactly-one called with a sequence containing zero or more than one item"
// *Cause:  It is a dynamic error if fn:exactly-one is called with a sequence
//          containing zero or more than one item
// *Action: 
/
01097, 00000, "[FORG0006] Invalid argument type"
// *Cause:  It is a dynamic error if an XQuery F&O is called with wrong argument type.
// *Action: 
/
01098, 00000, "[FOCA0002] Invalid lexical value"
// *Cause:  It is a dynamic error if an XQuery F&O is called with wrong argument value.
// *Action: 
/
01099, 00000, "[FOCA0001] Input value too large for decimal"
// *Cause:  It is a dynamic error if the Input value too large for decimal
// *Action: 
/
01100, 00000, "[FOCA0003] Input value too large for integer"
// *Cause:  It is a dynamic error if the Input value too large for integer
// *Action: 
/
01101, 00000, "External Error '~s' occurs"
// *Cause:   An error occurred during the processing of the XQuery expression.
// *Action:  Check the detailed error message for the possible causes.
/
01102, 00000, "[FORG0008] both arguments to fn:dateTime have a specified timezone"
// *Cause:   It is an error to pass arguments to fn:dateTime having a specified timezone
// *Action:  
/
01103, 00000, "[FOCH0001] codepoint not valid"
// *Cause:   
// *Action:  
/
01104, 00000, "[FONS0004] No namespace found for prefix"
// *Cause:   
// *Action:  
/
01105, 00000, "[FOAR0001] Division by zero"
// *Cause:  It is an error to divide by zero 
// *Action:  
/
01106, 00000, "[FOAR0002] Numeric operation overflow/underflow"
// *Cause:  Numeric operations causes overflow/underflow
// *Action:  
/
01107, 00000, "[FORG0002] invalid argument to fn:resolve-uri()"
// *Cause:  Wrong argument to fn:resolve-uri() function
// *Action:  
/
01108, 00000, "[FORG0009] error in resolving a relative URI against a base URI in fn:resolve-uri()"
// *Cause:  Error resolving relative URI in fn:resolve-uri() function
// *Action:  
/

01109, 00000, "[FOCA0005] NaN supplied as float/double value"
// *Cause:  NaN supplied as float/double value
// *Action:  
/
01110, 00000, "[FOCA0006] String to be cast to decimal has too many digits of precision"
// *Cause: String to be cast to decimal has too many digits of precision 
// *Action:  
/
01111, 00000, "[FOCH0002] Unsupported collation"
// *Cause:  Unsupported collation
// *Action:  
/
01112, 00000, "[FOCH0003] Unsupported normalization form"
// *Cause:  Unsupported normalization form
// *Action:  
/
01113, 00000, "[FOCH0004] Collation does not support collation units"
// *Cause:  Collation does not support collation units
// *Action:  
/
01114, 00000, "[FODC0001] No context document"
// *Cause:  No context document
// *Action:  
/
01115, 00000, "[FODC0002] Error retrieving resource"
// *Cause:  Error retrieving resource
// *Action:  
/
01116, 00000, "[FODC0003] "
// *Cause:  Function stability not defined
// *Action:  Function stability not defined
/
01117, 00000, "[FODC0004] Invalid argument to fn:collection"
// *Cause:  Invalid argument to fn:collection 
// *Action:  
/
01118, 00000, "[FODC0005] Invalid argument to fn:doc or fn:doc-available"
// *Cause:  Invalid argument to fn:doc or fn:doc-available
// *Action:  
/
01119, 00000, "[FODT0001] Overflow/underflow in date/time operation"
// *Cause:  Overflow/underflow in date/time operation
// *Action:  
/
01120, 00000, "[FODT0002] Overflow/underflow in duration operation"
// *Cause:  Overflow/underflow in duration operation 
// *Action:  
/
01121, 00000, "[FODT0003] Invalid timezone value"
// *Cause:  Invalid timezone value
// *Action:  
/
01122, 00000, "[FONS0005] Base-uri not defined in the static context"
// *Cause:  Base-uri not defined in the static context
// *Action:  
/
01123, 00000, "[FORG0001] Invalid value for cast/constructor"
// *Cause:  Invalid value for cast/constructor
// *Action:  
/
01124, 00000, "[FORX0001] Invalid regular expression flags"
// *Cause:  Invalid regular expression flags
// *Action:  
/
01125, 00000, "[FORX0002] Invalid regular expression"
// *Cause:  Invalid regular expression
// *Action:  
/
01126, 00000, "[FORX0003] Regular expression matches zero-length string"
// *Cause:  Regular expression matches zero-length string
// *Action:  
/
01127, 00000, "[FORX0004] Invalid replacement string"
// *Cause:  Invalid replacement string
// *Action:  
/
01128, 00000, "[FOTY0012] Argument node does not have a typed value"
// *Cause:  Argument node does not have a typed value
// *Action:  
/
01129, 00000, "[XUST0001] Updating expression in a wrong position"
// *Cause:  It is a static error if an updating expression is used in any
//          position other than one of the following:
//            1. The topmost expression in the body of a query.
//            2. The modify clause of a transform expression.
//            3. The return clause of a FLWOR expression.
//            4. The return clauses of a typeswitch expression in which every
//               return clause contains an updating expression, an empty 
//               expression ( ), or a call to the fn:error function.
//            5. The then and else clauses of a conditional statement in which
//               both the then and else clauses contain either an updating
//               expression, an empty expression ( ), or a call to 
//               the fn:error function.
//            6. An operand of a comma expression in which each operand is 
//               either an updating expression, an empty expression ( ), or 
//               a call to the fn:error function.
//            7. The content of a parenthesized expression.
//            8. The body of a function declaration in which the keyword 
//               updating is specified.
// *Action:  
/
01130, 00000, "[XUST0002] Non-updating expression in a wrong position"
// *Cause:  It is a static error if an non-updating expression other than 
//          an empty expression ( ) or a call to the fn:error function is used
//          in one of the following positions:
//            1. The modify clause of a transform expression.
//            2. The top-level expression in the body of a function
//               declaration in which the keyword updating is specified.
// *Action:  
/
01131, 00000, "[XUST0003] Repeated revalidation declaration"
// *Cause:  It is a static error if a Prolog contains more than one 
//          revalidation declaration.
// *Action:  
/
01132, 00000, "[XUTY0004] Invalid attribute node in the insertion sequence"
// *Cause:  It is a type error if the insertion sequence of an insert 
//          expression contains an attribute node following a node that 
//          is not an attribute node.
// *Action:  
/
01133, 00000, "[XUTY0005] Invalid target expression for 'insert'"
// *Cause:  In an insert expression where into, as first into, or as last 
//          into is specified, it is a type error if the target expression
//          returns a non-empty result that does not consist of a single
//          element or document node.
// *Action:  
/
01134, 00000, "[XUTY0006] Invalid target expression for 'insert'"
// *Cause:  In an insert expression where before or after is specified,
//          it is a type error if the target expression returns a non-empty
//          result that does not consist of a single element, text, comment,
//          or processing instruction node.
// *Action:  
/
01135, 00000, "[XUTY0007] Invalid target expression for 'delete'"
// *Cause:  It is a type error if the target expression of a delete expression
//          does not return a sequence of zero or more nodes.
// *Action:  
/
01136, 00000, "[XUTY0008] Invalid target expression for 'replace'"
// *Cause:  In a replace expression, it is a type error if the target
//          expression returns a non-empty result that does not consist of
//          a single element, attribute, text, comment, or 
//          processing instruction node.
// *Action:  
/
01137, 00000, "[XUDY0009] Invalid target expression for 'replace'"
// *Cause:  In a replace expression where value of is not specified, 
//          it is a dynamic error if the node returned by the target 
//          expression does not have a parent.
// *Action:  
/
01138, 00000, "[XUTY0010] Invalid replacement sequence for 'replace'"
// *Cause:  In a replace expression where value of is not specified and 
//          the target is an element, text, comment, or processing instruction
//          node, it is a type error if the replacement sequence does not
//          consist of zero or more element, text, comment, or 
//          processing instruction nodes.
// *Action:  
/
01139, 00000, "[XUTY0011] Invalid replacement sequence for 'replace'"
// *Cause:  In a replace expression where value of is not specified and 
//          the target is an attribute node, it is a type error if the
//          replacement sequence does not consist of zero or more 
//          attribute nodes.
// *Action:  
/
01140, 00000, "[XUTY0012] Invalid target expression for 'rename'"
// *Cause:  In a rename expression, it is a type error if the target 
//          expression returns a non-empty result that does not consist of 
//          a single element, attribute, or processing instruction node.
// *Action:  
/
01141, 00000, "[XUTY0013] Invalid copy expression for transform"
// *Cause:  In a transform expression, it is a type error if a source
//          expression in the copy clause does not return a single node.
// *Action:  
/
01142, 00000, "[XUDY0014] Modified node was not created by the copy clause"
// *Cause:  In a transform expression, it is a dynamic error if the modify
//          clause modifies any node that was not created by the copy clause.
// *Action:  
/
01143, 00000, "[XUDY0015] Duplicate 'rename' for the same target node"
// *Cause:  It is a dynamic error if any node is the target of more than one
//          rename expression within the same query.
// *Action:  
/
01144, 00000, "[XUDY0016] Duplicate 'replace' for the same target node"
// *Cause:  It is a dynamic error if any node is the target of more than one
//          replace expression (without value of being specified) within 
//          the same query.
// *Action:  
/
01145, 00000, "[XUDY0017] Duplicate 'replace' for the same target node"
// *Cause:  It is a dynamic error if any node is the target of more than one
//          replace value of expression within the same query.
// *Action:  
/
01146, 00000, "[XUDY0018] External not updating function returns an updated value"
// *Cause:  It is a dynamic error if a function that was declared to be
//          external but not updating returns a non-empty pending update list.
// *Action:  
/
01147, 00000, "[XUDY0019] External updating function returns an invalid value"
// *Cause:  It is a dynamic error if a function that was declared to be both 
//          external and updating returns a non-empty data model instance.
// *Action:  
/
01148, 00000, "[XUDY0020] Deleted node has no parent"
// *Cause:  An implementation may (but is not required to) raise a dynamic
//          error if a node is deleted that had no parent before execution
//          of the query began.
// *Action:  
/
01149, 00000, "[XUDY0021] The result XDM instance violates XDM constraints"
// *Cause:  It is a dynamic error if the XDM instance that would result from
//          applying all the updates in a query violates any constraint 
//          specified in [XQuery/XPath Data Model (XDM)]. In this case, none
//          of the updates in the query are made effective.
// *Action:  
/
01150, 00000, "[XUTY0022] Invalid attribute insertion into a document node"
// *Cause:  It is a type error if an insert expression specifies the insertion
//          of an attribute node into a document node.
// *Action:  
/
01151, 00000, "[XUDY0023] Updating expression introduces a namespace conflict"
// *Cause:  It is a dynamic error if an insert, replace, or rename expression
//          affects an element node by introducing a new namespace binding 
//          that conflicts with one of its existing namespace bindings.
// *Action:  
/
01152, 00000, "[XUDY0024] Updating expression introduces a namespace conflict"
// *Cause:  It is a dynamic error if the effect of a set of updating 
//          expressions is to introduce conflicting namespace bindings
//          into an element node.
// *Action:  
/
01153, 00000, "[XUDY0025] Invalid QName for processing instruction rename"
// *Cause:  It is a dynamic error if the target of a rename expression is
//          a processing instruction node, and the new name expression returns
//          a QName with a non-empty namespace prefix.
// *Action:  
/
01154, 00000, "[XUST0026] Revalidation mode '~s' is not supported"
// *Cause:  It is a static error if a revalidation declaration in a Prolog 
//          specifies a revalidation mode that is not supported by the current
//          implementation.
// *Action:  
/
01155, 00000, "[XUDY0027] Invalid target expression"
// *Cause:  It is a dynamic error if the target expression of an insert, 
//          replace, or rename expression evaluates to an empty sequence.
// *Action:  
/
01156, 00000, "[XUST0028] Updating function should not have a return type"
// *Cause:  It is a static error if a function declaration specifies both
//          updating and a return type.
// *Action:  
/
01157, 00000, "[XUDY0029] Insert expression target node doesn't have a parent"
// *Cause:  In an insert expression where before or after is specified,
//          it is a dynamic error if node returned by the target expression 
//          does not have a parent.
// *Action:  
/
01158, 00000, "[XUDY0030] Invalid insertion of an attribute node"
// *Cause:  It is a dynamic error if an insert expression specifies the 
//          insertion of an attribute node before or after a child of 
//          a document node.
// *Action:  
/
01159, 00000, "[FOUP0001] Invalid 'fn:put' first operand"
// *Cause:  It is a dynamic error if the first operand of fn:put is not 
//          a node of a supported kind.
// *Action:  
/
01160, 00000, "[FOUP0002] Invalid 'fn:put' second operand"
// *Cause:  It is a dynamic error if the second operand of fn:put is not 
//          a valid lexical representation of the xs:anyURI type.
// *Action:  
/
/ end of lpxus.msg
