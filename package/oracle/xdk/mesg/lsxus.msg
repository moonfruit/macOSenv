/ $RCSfile: lsxus.msg $
/ $Date: 06-mar-2008.21:59:21 $
/ Copyright (c) 2000, 2003, Oracle.  All rights reserved.
/
/   NAME
/     lsxus.msg - US language error message file
/
/   DESCRIPTION
/     Error message file for LSX (XML Schema processor)
/
/   NOTES
/     COMPLY WITH STANDARDS WHEN ADDING OR CHANGING MESSAGES!
/     See /vobs/rdbms/mesg/oraus.msg for full message rules.
/
/     See XML parser's message file (lpxus.msg) for a description of the
/     special formatting strings used.  They are NOT printf but a simple
/     stripped down replacement that handles all data encodings, including
/     Unicode.
/
00001, 00000, "NULL pointer"
// *Cause:  A NULL pointer was detected as an internal error condition.
// *Action: This is a programming error by the caller of the Schema
//          processor. Contact someone who can fix the problem.
/
00002, 00000, "root element is not <schema>"
// *Cause:  The top-level element of an XML Schema must be <schema>.
// *Action: Correct the Schema; consult the Schema specification.
/
00003, 00000, "invalid attribute \"~1S\" for element \"~2S\""
// *Cause:  The named Schema element had an invalid attribute.
// *Action: Correct the Schema; consult the Schema specification.
/
00004, 00000, "unexpected XML node type"
// *Cause:  Schema contains an XML node other than element, text (or CDATA),
//          comment, or PI.
// *Action: Other node types are not permitted; remove them.
/
00008, 00000, "feature \"~s\" is not implemented"
// *Cause: An attempt was made to use a feature that is not yet implemented.
// *Action: Make an enhancement request for the feature.
/
00009, 00000, "data missing for type \"~S\""
// *Cause: Data is missing for an element or attribute of a simple type.
// *Action: Add data in the element or attribute.
/
00010, 00000, "extra element(s) at end of \"~S\""
// *Cause: Extra elements exist at the end of schema component declarations.
// *Action: Remove the extra elements.
/
00011, 00000, "internal error: ~s\n"
// *Cause: Implementation error.
// *Action: File a bug.
/
00013, 00000, "element \"~S\" not from Schema of Schemas"
// *Cause: Bogus element exists in the schema file. Its name is not from
//         Schema of Schemas.
// *Action: Remove the bogus element.
/
00014, 00000, "empty instance document"
// *Cause: Instance document to be Schema validated was empty (no top-level
//              element).
// *Action: Provide a complete XML instance document.
/
00015, 00000, "failed to parse document"
// *Cause: Failed to parse the schema document using the given URI.
// *Action: Provide the correct URI and make sure that the schema
//          document is valid.
/
00016, 00000, "schema and instance document have incompatible character sets"
// *Cause: Parsed schema components were in a simple-type character set while
//         the parsed instance document data was not.  A simple-type 
//         character set is single-byte, not shift sensitive, and has no 
//         linguistic specials in use.
// *Action: Reinitialize the schema global context with appropriate parser
//          context settings, i.e. pass a parser context with its output 
//          encoding set to be a multibyte or Unicode character set.
/
00018, 00000, "invalid schema context"
// *Cause: An invalid schema context was provided to the processor. Multiple
//         schema documents were loaded and assembled into the schema context.
//         At least one of them is not fully valid with respect to a schema
//         corresponding to the Schema for Schemas.
// *Action: Check the errors reported when schema documents were loaded,
//          mapped, or validated.  Correct errors found in the identified
//          schema documents and reload them into a new schema context.  Then
//          provide the new schema context to the processor.
/
00020, 00000, "unknown type \"~S\""
// *Cause:  A specified type was unknown (not defined in any loaded Schemas).
// *Action: Make sure the type was defined and that the type usage referenced
//          the correct Schema.
/
00021, 00000, "undefined element \"~S\""
// *Cause: Element is undefined in the specified namespace.
// *Action: If the element name is misspelled, correct the spelling.
/
00022, 00000, "unknown namespace prefix \"~S\""
// *Cause: Prefix in a QName is undefined in the current scope.
// *Action: Correct the prefix name if it's misspelled.
/
00023, 00000, "unknown namespace URI \"~S\""
// *Cause: Namespace URI is unknown to the schema processor.
// *Action: Correct the namespace URI if it's misspelled.
/
00024, 00000, "unknown attribute group \"~S\""
// *Cause: The name of attribute group is unknown to the schema processor in
//         the current scope.
// *Action: Correct the name of attribute group if it's misspelled.
/
00025, 00000, "unknown group \"~S\""
// *Cause: The name of group is unknown to the schema processor in the current
//         scope.
// *Action: Correct the name of group if it's misspelled.
/
00026, 00000, "unknown attribute \"~S\""
// *Cause: The name of attribute is unknown to the schema processor in the
//         current scope.
// *Action: Correct the name of attribute if it's misspelled.
/
00027, 00000, "property \"~s\" unknown"
// *Cause: The named validation property was unknown.
// *Action: Refer to the documentation for the complete list of validation
//          properties.
/
/       Declaration errors
/
00102, 00000, "duplicate element \"~S\""
// *Cause: Element declaration is not unique within its scope.
// *Action: Rename the element.
/
00103, 00000, "duplicate group \"~S\""
// *Cause: Group declaration is not unique within its scope.
// *Action: Rename the group.
/
00104, 00000, "duplicate type \"~S\""
// *Cause: Type definition is not unique within its scope.
// *Action: Rename the type.
/
00105, 00000, "duplicate attribute group \"~S\""
// *Cause: Attribute group declaration is not unique within its scope.
// *Action: Rename the attribute group.
/
00106, 00000, "duplicate attribute \"~S\""
// *Cause: Attribute declaration is not unique within its scope.
// *Action: Rename the attribute.
/
00110, 00000, "facet \"~S\" should have single value attribute"
// *Cause:  A facet declaration did not have a value attribute.
// *Action: Each facet declaration must contain one and only one
//          value attribute.
/
00111, 00000, "type \"~S\" contains invalid facets"
// *Cause:  A specified facet was invalid for a type. Each datatype has
//          a different set of facets which may apply.
// *Action: Use only applicable facets for the type.
/
00112, 00000, "facet \"~S\" duplicated"
// *Cause:  A facet (other than "enumeration") was specified more than once.
// *Action: Only the enumeration facet may be used more than once for a type.
/
00113, 00000, "facet \"~1S\" has invalid value \"~2S\""
// *Cause: Facet value contained illegal characters or its value was out of
//         range.
// *Action: Remove illegal characters.
/
00114, 00000, "facet \"~S\" not in schema schema"
// *Cause: Facets are not defined in the XMLSchema namespace.
// *Action: Remove illegal facet declarations.
/
00116, 00000, "mutually exclusive facets are not allowed"
// *Cause: Mutual exclusiveness violations were found for facets. For example,
//         both "length" and either "minLength" or "maxLength" are not
//         allowed to be facets.
// *Action: Remove the facets that are at fault.
/
00117, 00000, "\"minLength\" should not be greater than \"maxLength\""
// *Cause: The value of "minLength" must be less than or equal to the value
//         of "maxLength".
// *Action: Correct either "minLength" or "maxLength".
/
00118, 00000, "fixed facet value cannot be changed"
// *Cause: The value of a fixed facet in the base type definition should
//         remain the same.
// *Action: Remove the fixed facet specification in the parent's type for the
//          erroneous facet component.
/
00119, 00000, "value is not valid restriction of parent's minLength"
// *Cause: There was an error in that minLength was among the members of 
//         {facets} of {base type definition} and {value} was less than the
//         {value} of the parent minLength.
// *Action: Increase the {value} of minLength.
/
00120, 00000, "value is not valid restriction of parent's maxLength"
// *Cause: There was an error in that maxLength was among the members of 
//         {facets} of {base type definition} and {value} was greater than 
//         the {value} of the parent maxLength.
// *Action: Increase the {value} of maxLength.
/
00121, 00000, "value is not valid restriction of parent's length"
// *Cause: There was an error in that length was among the members of {facets} 
//         of {base type definition} and {value} was not equal to the {value}
//         of the parent length. 
// *Action: Make {value} the same as parent's. 
/
00122, 00000, "value is not valid restriction of parent's whiteSpace"
// *Cause: There was an error in that whiteSpace was among the members of 
//         {facets} of {base type definition} and at least one of the 
//         following conditions was true: 
//         1 {value} is replace or preserve and {value} of the parent 
//           whiteSpace is collapse 
//         2 {value} is preserve and the {value} of the parent whiteSpace is
//           replace 
// *Action: Change the {value} of whiteSpace. 
/
00123, 00000, "base type is required"
// *Cause: Missing base type declaration in the type definition.
// *Action: Define a base type.
/
00124, 00000, "\"list\" element is improperly defined"
// *Cause: A "list" element either must have its "itemType" attribute set or
//         have one of its children be a "simpleType" element, but both
//         conditions cannot exist.
// *Action:  Remove the erroneous condition.
/
00125, 00000, "\"restriction\" element is improperly defined"
// *Cause: A "restriction" element either must have its "base" attribute set
//         or have one of its children be a "simpleType" element,
//         but both conditions cannot exist.
// *Action:  Remove the erroneous condition.
/
00126, 00000, "facet \"~1S\" has invalid value \"~u\""
// *Cause: Facet value contained illegal characters or its value was out of
//         range.
// *Action: Remove illegal characters.
/
00130, 00000, "attribute \"processContents\" has invalid value \"~S\""
// *Cause: Attribute "processContents" in the "any" element or "anyAttribute"
//         declaration has an invalid value.
// *Action: Specify one of the following values: lax, skip, or strict.
/
00132, 00000, "attribute \"~1S\" has invalid occurrences value \"~2S\""
// *Cause:  A minOccurs or maxOccurs attribute had an invalid value (not a
//          integer or less than zero).
// *Action: Use a legal "occurs" value.
/
00133, 00000, "attribute \"use\" has invalid value \"~S\""
// *Cause:  A "use" attribute had an invalid value. Choices for "use" are
//          "default", "fixed", "optional", "prohibited", or "required".
// *Action: Change the attribute to one of the above values.
/
00134, 00000, "attribute \"~1S\" has invalid qualification \"~2S\""
// *Cause:  An attribute that specifies qualification (form,
//          attributeFormDefault, elementFormDefault) was invalid; it must
//          be one of "qualified" or "unqualified".
// *Action: Change the attribute to one of the above values.
/
00135, 00000, "invalid min/max Occurs for <all> element, must be 0/1"
// *Cause: "minOccurs" has a value other than 0/1 or "maxOccurs" has a value
//         other than 1.
// *Action: Specify 0/1 for "minOccurs" or "maxOccurs".
/
00136, 00000, "\"maxOccurs\" is less than \"minOccurs\""
// *Cause: The value of the "maxOccurs" specification is less than the value
//         of the "minOccurs" specification.
// *Action: Correct "minOccurs" or "maxOccurs".
/
00141, 00000, "ID type may only be used in attributes"
// *Cause: For backward compatibility with DTD, ID type may only be used in
//         attributes.
// *Action: Remove the ID type.
/
00142, 00000, "invalid sub-element \"~1S\" for element \"~2S\""
// *Cause: There was an invalid sub-element in the content of either the 
//         attribute or the element declaration. This was because the 
//         sub-element was either at the wrong position or out of context. 
// *Action: Remove the sub-element or move it to the correct position. 
/
00143, 00000, "element \"~S\" must have type or ref"
// *Cause:  A Schema element was declared but was neither type or reference.
// *Action: One of type or reference must be specified.
/
00144, 00000, "attribute \"~1S\" invalid derivation-restriction value \"~2S\""
// *Cause: An attribute which specifies a derivation-restriction setting
//         (block, content, final) had an invalid value. Choices are "#all",
//         "extension", or "restriction".
// *Action: Change the attribute to one of the above values.
/
00145, 00000, "attribute \"~1S\" invalid derived value \"~2S\""
// *Cause:  A derivedBy attribute had an invalid value. Choices are
//          "extension" or "restriction".
// *Action: Change the attribute to one of the above values.
/
00146, 00000, "element or attribute is improperly defined"
// *Cause: An element or attribute definition must have either its "type"
//         attribute set or must have one of its children be a "simpleType"
//         or "complexType" element but both conditions cannot exist.
// *Action:  Remove the erroneous condition.
/
00147, 00000, "\"~1S\" cannot contain \"~2S\""
// *Cause: An invalid schema component exists in the current declaration.
// *Action: Remove the schema component.
/
00148, 00000, "annotation must come first in \"~S\""
// *Cause:  "annotation" element must be the first in the content.
// *Action: Make "annotation" the first element.
/
00149, 00000, "duplicated ID specified in \"~S\""
// *Cause:  An attempt was made to specify two distinct members of {attribute
//          uses}with {attribute declaration}s, both of whose {type definition}s
//          are from ID or are derived from ID.
// *Action: Declare only one member of the {attribute uses} whose
//          {type definition} is from ID or will be derived from ID.
/
00150, 00000, "attributeGroup reference shouldn't have children"
// *Cause: A reference-to-attributeGroup element has children. It is
//         suppose to be empty except for annotations.
// *Action: Remove the children.
/
00151, 00000, "invalid combination of attributes \"ref\" and \"name\""
// *Cause: If the item's parent is not <schema>, then either the "ref"
//         or the "name" attribute must be present, but not both.
//         Top-level elements or attributes must have a name.
// *Action: Specify either the "ref" or "name" attribute.
/
00152, 00000, "only \"minOccurs\", \"maxOccurs\", or \"id\" is allowed"
// *Cause: If the item's parent is not <schema> and "ref" is present, then
//         "complexType", "simpleType", "key", "keyref", "unique",
//         "nillable", "default", "fixed", "form", "block", and "type" must
//         be absent.
// *Action: Remove the prohibited attribute.
/
00153, 00000, "invalid combination of default and fixed attributes"
// *Cause: It is an error for a declaration to contain both fixed and default
//         attributes.
// *Action: Remove either the default or the fixed attributes.
/
00154, 00000, "attribute \"use\" must have its value set to \"optional\""
// *Cause: If "default" and "use" are both present, use must have its
//         value set to "optional".
// *Action: Remove the default attribute or change the value of the "use"
//          attribute.
/
00155, 00000, "invalid use of attribute \"ref\""
// *Cause: If the item's parent is not <schema> and the attribute "ref" is
//         present, then the element "simpleType" and the attributes "form"
//         and "type" must be absent.
// *Action: Remove the prohibited items.
/
00156, 00000, "type is final and no derivations are allowed"
// *Cause: Derivation from a type that is declared to be final occurred.
// *Action: Remove the final declaration from the base type.
/
00157, 00000, "\"~S\" is abstract and cannot be used in an instance document"
// *Cause: The element declaration or the type definition was abstract. 
// *Action: When an element is declared to be abstract, a member of that 
//          element's substitution group must appear in the instance document. 
//          When an element's corresponding type definition is declared as 
//          abstract, all instances of that element must use xsi:type to 
//          indicate a derived type that is not abstract. 
/
00158, 00000, "base type of \"~S\" must be simple type or primitive datatype"
// *Cause: The derivation constraint was violated. 
// *Action: Use complexType instead of simpleType. 
/
00159, 00000, "list content of multiple simple types is not allowed"
// *Cause: Two or more simple types were specified within the list content . 
// *Action: Specify only one simple type. 
/
00160, 00000, "invalid substitution group affiliation between \"~S\" and \"~S\""
// *Cause: There was an error in that {substitution group exclusions} 
//         prevented substitution group affiliation by type restriction or 
//         type extension.
// *Action: Remove the offending deriving method from the {substitution group
//          exclusions} list.
/
00161, 00000, "disallowed type substitution between \"~S\" and \"~S\""
// *Cause: There was a substituted type whose deriving method falls in the 
//         union of the {disallowed substitutions} and the {type definition}'s
//         {prohibited substitutions}. 
// *Action: Remove the offending deriving method from the element's 
//          {disallowed substitutions} list or the {type definition}'s 
//          {prohibited substitutions} list. 
/
00162, 00000, "string \"~S\" is an invalid default for the complex type"
// *Cause: If the {content type} is a simple type definition, then the string 
//         must be valid with regard to the simple type definition as defined 
//         by String Valid (3.14.4). 
//         If the {content type} is mixed, then the {content type}'s particle 
//         must be emptiable as defined by Particle Emptiable (3.9.6). 
//         However, one of these conditions was not met, resulting in this error. 
// *Action: Make the default string a valid default with regard to the complex 
//          type definition. 
/
00163, 00000, "duplicated content specification in \"~S\""
// *Cause:  There was a duplicate content specification in the children of
//          complexType.
// *Action: Remove the duplicate content specification.
/
00164, 00000, "no content specified in \"~S\""
// *Cause:  In a simpleContent specification, either "restriction" or
//          "extension" was not specified as a child.
// *Action: Add either a "restriction" or an "extension" element information
//          item.
/
00165, 00000, "content type of \"~S\" must be simple type"
// *Cause: The content type of the type definition was not a simple type
//         definition.
// *Action: Use complexContent instead of simpleContent .
/
00166, 00000, "both content types must be mixed or both must be element-only"
// *Cause: If the content types of the derived type and base type are not
//         the same simple type definition and the content type of the base
//         type is not empty, then both content types must be mixed or both
//         must be element-only. This was not the case, resulting in this 
//         error.
// *Action: Add attribute mixed="true" or remove it. 
/
00167, 00000, "defining form of \"~S\" must occur at the top level"
// *Cause: The defining form did not occur at the top level of a schema.
// *Action: Move attributeGroup or group definition to the top level of the
//          schema.
/
00168, 00000, "referring form of \"~S\"  must NOT occur at the top level"
// *Cause: The referring form did not occur within a complex type definition
//         or an attribute group definition. 
// *Action: Move the attributeGroup definition to within a complex type 
//          definition or an attribute group definition. Or, move the group 
//          definition to within a complex type, restriction, extension, 
//          choice, or sequence. 
/
00169, 00000, "circular group reference is disallowed outside <redefine>"
// *Cause: There was a circular group reference.
// *Action: One of the group references needs to be changed to a group 
//          definition.
/
00170, 00000, "union must have memberTypes attribute or some simpleType children"
// *Cause: There was no member type definition for the union declaration.
// *Action: Add memberTypes attribute or simpleType children.
/
00171, 00000, "missing required sub-element \"~S\""
// *Cause: The sub-element specified in the error message was required.
// *Action: Add the required sub-element.
/
00172, 00000, "\"~S\" is not a valid restriction of \"~S\""
// *Cause: The schema component constraint, Derivation Valid 
//         (Restriction, Complex) or Particle Valid (Restriction), was 
//         violated.
// *Action: Modify the base type (particle) or the restricted type (particle) 
//          definition.
/
00173, 00000, "~S of ~S type is not a valid restriction of ~S of ~S type"
// *Cause: The schema component constraint, Particle Restriction OK 
//         (Elt:Elt -- NameAndTypeOK), was violated. 
// *Action: Modify either or both element declaration particles. 
/
00174, 00000, "\"~S\" is not a valid derivation of \"~S\""
// *Cause: The schema component constraint, Derivation Valid 
//         (Restriction, simple), (Restriction, complex) or (Extension), 
//         was violated. 
// *Action: Modify the base type or the derived type definition. 
/
00175, 00000, "a complex base within \"simpleContent\" must have simple content"
// *Cause: A complex base within "simpleContent" was not restricted to contain
//         only simple content.
// *Action: Modify the base type or the derived type definition.
/
00176, 00000, "circular reference detected in schema component named \"~S\""
// *Cause: An attempt was made to use a circular reference. This is not 
//         allowed.  For example, it is not possible to return to an element 
//         declaration by repeatedly following the {substitution group 
//         affiliation} property. Or, within the {particles} of a group there 
//         must not be at any depth a particle whose {term} is the group itself.
// *Action: Modify one of the schema components in the loop.
/
/       Validation errors
/
00200, 00000, "element \"~S\" not empty"
// *Cause: Content of the element must be empty.
// *Action: Remove any schema components in the content.
/
00201, 00000, "contents of \"~S\" should be elements only"
// *Cause: Node with type other than "element", "processing instruction", or
//         "comment" exists in the content of the violating element.
// *Action: Remove the offending nodes.
/
00202, 00000, "contents of \"~S\" should be text only"
// *Cause: Node with type other than "text", "processing instruction", or
//         "comment" exists in the content of the violating element.
// *Action: Remove the offending nodes.
/
00204, 00000, "extra data at end of complex element"
// *Cause: Extra nodes exist at the end of an element with a complex type
//         definition.
// *Action: Remove the offending nodes or check the definition of the complex
//          type.
/
00205, 00000, "element \"~1S\" value \"~2S\" is wrong (must be \"~3S\")"
// *Cause: The element had a value other than its fixed value. 
// *Action: Use the fixed value as its value. 
/
00206, 00000, "substitution for element \"~S\" is disallowed"
// *Cause: An attempt was made to substitute an element that violated a
//         constraint.
// *Action: Change to a valid new element that can be substituted for the
//          headElement.
/
00210, 00000, "value \"~1S\" out of range for type \"~2S\""
// *Cause: Value is out of range for the data with a specific type.
// *Action: Fix the value.
/
00211, 00000, "value \"~1S\" whose fractional digits exceeds ~2d"
// *Cause: Too many fractional digits after the decimal point.
// *Action: Remove the extra fractional digits.
/
00212, 00000, "value \"~1s\" whose total digits exceeds ~2d"
// *Cause: Too many digits in the decimal data.
// *Action: Remove the extra digits.
/
00213, 00000, "only ~1d occurrences of particle \"~2S\", minimum is ~3d"
// *Cause: Too few occurrences of particles in the node.
// *Action: Specify more particles.
/
00214, 00000, "too many occurrences of particle \"~1S\", maximum is ~2d"
// *Cause: Too many occurrences of particles in the node.
// *Action: Remove extra ones.
/
00215, 00000, "value \"~1S\" whose total digits exceeds ~2d"
// *Cause: There were too many digits in the decimal data.
// *Action: Remove the extra digits.
/
00220, 00000, "\"~1S\" is wrong length, should be ~2d"
// *Cause: Data of simple type has invalid length.
// *Action: Fix the length of the data.
/
00221, 00000, "\"~1S\" is too short (minimum length is ~2d)"
// *Cause: The length of the data is too short.
// *Action: Prepend extra characters (such as zeros or blank characters) to
//          make the data longer.
/
00222, 00000, "\"~1S\" is too long (maximum length is ~2d)"
// *Cause: The length of the data is too long.
// *Action: Remove extra characters from the data.
/
00229, 00000, "item type is not a valid type for a list simple type"
// *Cause: The specified item type must not itself be a list type, and must be
//         one of the types identified in [XML Schemas: Datatypes] as a
//         suitable item type for a list simple type.
// *Action: Change the list schema component's declaration.
/
00230, 00000, "invalid integer \"~S\""
// *Cause: Illegal characters exist in the "integer" or its derivative type
//         declarations.
// *Action: Remove illegal characters.
/
00231, 00000, "invalid unsigned integer \"~S\""
// *Cause: Illegal characters exist in the "unsignedLong", "unsignedInt",
//         "unsignedShort", or "unsignedByte" declarations.
// *Action: Remove illegal characters.
/
00232, 00000, "invalid unsigned long \"~S\""
// *Cause: Illegal characters exist in the "unsignedLong" declaration.
// *Action: Remove illegal characters.
/
00233, 00000, "invalid long \"~S\""
// *Cause: Illegal characters exist in the "long" declaration.
// *Action: Remove illegal characters.
/
00234, 00000, "invalid decimal \"~S\""
// *Cause: Illegal characters exist in the "decimal" declaration.
// *Action: Remove illegal characters.
/
00235, 00000, "invalid URI \"~S\""
// *Cause: Invalid URI specification for data of "anyURI" type.
// *Action: Remove illegal characters.
/
00237, 00000, "invalid Name \"~S\""
// *Cause: Invalid XML name.
// *Action: Remove illegal characters.
/
00238, 00000, "invalid Nmtoken \"~S\""
// *Cause: Invalid Nmtoken.
// *Action: Remove illegal characters.
/
00240, 00000, "bad float \"~S\""
// *Cause: Invalid value for "float" type data.
// *Action: Remove illegal characters.
/
00241, 00000, "bad double \"~S\""
// *Cause: Invalid value for "double" type data.
// *Action: Remove illegal characters.
/
00242, 00000, "bad Boolean \"~S\""
// *Cause: Boolean data must have a value from the following set: "1", "0",
//         "true", or "false".
// *Action: Specify one of "1", "0", "true", or "false".
/
00243, 00000, "invalid date \"~S\""
// *Cause: Invalid value for data of "date" type.
// *Action: Remove illegal characters.
/
00244, 00000, "invalid NCName \"~S\""
// *Cause: Invalid value for data of "NCName" type.
// *Action: Remove illegal characters.
/
00245, 00000, "invalid ID \"~S\""
// *Cause: Data specified is not of "NCName" type.
// *Action: Remove illegal characters.
/
00246, 00000, "invalid QName \"~S\""
// *Cause: Invalid value for data of "QName" type.
// *Action: Remove illegal characters.
/
00247, 00000, "invalid language specification \"~S\""
// *Cause: Invalid value for data of "language" type.
// *Action: Remove illegal characters.
/
00248, 00000, "invalid duration \"~S\""
// *Cause:  Invalid value for data of "duration" type.
// *Action: Remove illegal characters.
/
00249, 00000, "invalid date or time \"~S\""
// *Cause: Invalid value for data of "dateTime", "time", "gYearMonth",
//         "gYear", "gMonthDay", "gDay", or "gMonth" type.
// *Action: Remove illegal characters.
/
00250, 00000, "invalid normalizedString \"~S\""
// *Cause: Invalid value for data of "normalizedString" type.
// *Action: Remove illegal characters.
/
00251, 00000, "invalid token \"~S\""
// *Cause: Invalid value for data of "token" type.
// *Action: Remove illegal characters.
/
00252, 00000, "invalid union \"~S\""
// *Cause: Data of simple type is not one of the union type.
// *Action: Use one of the union type as its type.
/
00253, 00000, " branch is empty"
// *Cause: The pattern specification "branch1 | branch2" has either "branch1"
//         or "branch2" missing.
// *Action: Remove '|' or add either "branch1" or "branch2".
/
00255, 00000, "mismatched parentheses"
// *Cause: ")" found without a matching "(" in a pattern specification.
// *Action: Add "(" to the pattern specification.
/
00256, 00000, "empty character class expression"
// *Cause: "[]" found when processing a character class expression.
// *Action: Specify the character group within the brackets.
/
00257, 00000, "atom specification is missing"
// *Cause:  A quantifier was found without an atom specification.
// *Action: Add an atom specification in front of the quantifier.
/
00258, 00000, "invalid escape character"
// *Cause: "x" in "\x" is not a valid escape character.
// *Action: Change "x" to a valid escape character.
/
00259, 00000, "invalid character found in the pattern"
// *Cause: An unexpected character was found in the pattern.
// *Action: Fix the pattern.
/
00260, 00000, "unexpected end of pattern"
// *Cause: Something is missing at the end of the pattern.
// *Action: Fix the pattern.
/
00261, 00000, "invalid character property"
// *Cause:  An error occurred when processing the character property. For
//          example, "{" is missing after "\p" or "\P".
// *Action: Fix the character property.
/
00262, 00000, "attribute \"~1S\" cannot have complex type \"~2S\""
// *Cause: The type of the attribute is "complex".
// *Action: Specify the type of the attribute to be "simple".
/
00263, 00000, "undefined attribute \"~S\""
// *Cause: Violating attribute is not defined in the current scope.
// *Action: Correct the attribute name if it's misspelled.
/
00264, 00000, "attribute \"~S\" is prohibited (may not occur)"
// *Cause:  Global declarations cannot contain the attributes "ref",
//          "minOccurs", or "maxOccurs", or the use of this attribute is
//          explicitly declared as "prohibited" by the schema.
// *Action: Remove the attribute.
/
00265, 00000, "attribute \"~1S\" value \"~2S\" is wrong (must be \"~3S\")"
// *Cause: Attribute has a value other than its fixed value.
// *Action: Use fixed value as its value.
/
00266, 00000, "missing required attribute \"~S\""
// *Cause: A required attribute is missing.
// *Action: Add the required attribute.
/
00270, 00000, "hex-encoded binary has odd length"
// *Cause: Data of "hexBinary" type has odd number of digits.
// *Action: Add missing digits as appropriate.
/
00271, 00000, "invalid character \"~c\" in hex-encoded binary"
// *Cause: Data of "hexBinary" type has invalid characters.
// *Action: Remove illegal characters.
/
00272, 00000, "BASE64-encoded binary grouped improperly (not 4's)"
// *Cause: Number of digits is not a multiple of four.
// *Action: Add missing digits as appropriate.
/
00273, 00000, "invalid character \"~c\" in base64-encoded binary"
// *Cause: Data of "base64Binary" type has invalid characters.
// *Action: Remove illegal characters.
/
00274, 00000, "invalid padding in base64-encoded binary"
// *Cause: Invalid padding characters at the end of data.
// *Action: Use "=" as the padding characters.
/
00280, 00000, "duplicate ID \"~S\""
// *Cause: ID name is not unique within the schema scope.
// *Action: Rename the ID.
/
00281, 00000, "referenced ID \"~S\" is not defined"
// *Cause: Referenced ID name is not defined within the schema scope.
// *Action: Define the ID.
/
00282, 00000, "duplicate notation name \"~S\""
// *Cause: The name of the "notation" element is not unique within the schema
//         scope.
// *Action: Rename the element.
/
00283, 00000, "referenced notation \"~S\" is not defined"
// *Cause: Referenced notation name is not defined within the schema scope.
// *Action: Define the element.
/
00284, 00000, "duplicate constraint name \"~S\""
// *Cause: Each constraint declaration has a name which exists in a single
//         symbol space for constraints.
// *Action: Choose a different name.
/
00285, 00000, "referenced key \"~S\" is not defined"
// *Cause: Referenced key name is not defined within the schema scope.
// *Action: Define the key.
/
00286, 00000, "duplicate key \"~S\" for {\"~S\"}\"~S\""
// *Cause: The key value was not unique within its scope.
// *Action: Change the key value.
/
00287, 00000, "duplicate key \"~S\""
// *Cause: The key value was not unique within its scope.
// *Action: Change the key value.
/
00290, 00000, "invalid enumeration choice \"~S\""
// *Cause: The value of the data is not one of the enumeration choice.
// *Action: Select one of the enumeration choice as its value.
/
00291, 00000, "value \"~1S\" is less than minimum \"~2S\" (~3S)"
// *Cause: Data has a value less than required minimum.
// *Action: Increase the value.
/
00292, 00000, "value \"~1S\" is greater than maximum \"~2S\" (~3S)"
// *Cause: Data has a value greater than maximum.
// *Action: Decrease the value.
/
00293, 00000, "missing one or more fields from element \"~S\""
// *Cause: The required fields were missing from the content of the element.
// *Action: Add the fields.
/
00294, 00000, "field \"~S\" produced multiple hits"
// *Cause: XPath expressions relative to each element selected by a 
//         {selector}are specified by {fields}. These XPath expressions must
//         identify a single node (element or attribute) whose content or 
//         value was used in the constraint.  This content or value must be
//         of a simple type.
// *Action: Remove duplicate elements or attributes.
/
00295, 00000, "field element \"~S\" is not a simple type"
// *Cause: The field element evaluated to a node-set with a member that was 
//         not a simple type. 
// *Action: Change the field element's type.
/
00300, 00000, "group must have name or ref but not both"
// *Cause: "ref" or "name" attributes are either both missing or have both
//         been specified.
// *Action: Specify either "ref", "name", but not both.
/
00310, 00000, "local element or attribute should be namespace qualified"
// *Cause: Element or attribute name is not namespace qualified.
// *Action: Add prefix or default namespace URI declaration.
/
00311, 00000, "local element or attribute shouldn't be namespace qualified"
// *Cause: Element or attribute name is namespace qualified.
// *Action: Remove prefix or default namespace URI declaration from itself or
//          ancestors.
/
00320, 00000, "missing required elements in <all>"
// *Cause: Some required elements in "all" particle are missing.
// *Action: Add the missing elements.
/
00330, 00000, "missing range start character"
// *Cause: Missing range start character in a character range specification.
// *Action: Add the missing characters.
/
00331, 00000, "missing comma"
// *Cause: A comma is missing in a range specification.
// *Action: Add the missing characters.
/
00332, 00000, "bad decimal digits in a quantifier specification"
// *Cause: Quatifier has invalid characters.
// *Action: Remove illegal characters.
/
00333, 00000, "literal \"~S\" is not valid with respect to the pattern"
// *Cause: Literal is not valid with respect to the pattern.
// *Action: Choose correct characters in the literal.
/
00340, 00000, "improper namespace value for the imported element"
// *Cause: If the namespace attribute is present, then its actual value
//         must not match the actual value of the enclosing schema's
//         targetNamespace attribute. If the namespace attribute is
//         not present, then the enclosing schema must have a
//         targetNamespace attribute.
// *Action: Match namespace value.
/
00341, 00000, "ENTITY or ENTITIES type may only be used in attributes"
// *Cause: For compatibility, ENTITY or ENTITIES should be used only on
//         attributes.
// *Action: Remove the ENTITY or ENTITIES.
/
00342, 00000, "value of attribute \"base\" must be a complex type definition"
// *Cause: If the "complexContent" alternative is chosen, then the type 
//         definition resolved to by the actual value of the attribute "base"
//         must be a complex type definition.
// *Action: Choose a complex type definition as its base type.
/
00343, 00000, "\"~S\" is not nillable"
// *Cause: Attribute nillable was set to be "false" in element's declaration.
// *Action: Remove attribute xsi:nil from the instance document.
/
00344, 00000, "namespace values \"~1S\" and \"~2S\" differ"
// *Cause: The targetNamespace specified in the schema document differed from
//         either:  a) the value of the enclosing schema's namespace attribute,
//         or b) the value of the namespace attribute identified in the import 
//         element information item.
// *Action: Match the namespace value to the enclosing schema's targetNamespace
//          attribute or the actual value of the namespace attribute identified
//         in the import element information item.
/
00345, 00000, "Element (\"~1S\") from \"~2S\" namespace is unexpected. Expecting element from \"~3S\" namespace"
// *Cause: The namespace of the Xml Node in the instance document does not match
// with the expected element definition  namespace
// *Action:
/
