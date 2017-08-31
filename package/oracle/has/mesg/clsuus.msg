/ Copyright (c) Oracle Corporation 2007.  All rights reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clsuus.msg
/ DESCRIPTION
/   Message file for cross-component messages
/ NOTES
/   This file is intended for messages used in multiple components and
/   so inappropriate for a component-specific file.  It was created for
/   the slos formatting messages introduced in CLSU.  Other sets of
/   messages can be added if desired--carve out a range for them below.
/
/   We would have used clsdus.msg for these messages, but bug 6054661
/   makes it best to avoid that file for now.  Depending on how that
/   bug is fixed, this file might be merged into another (e.g. crsus.msg)
/   in the future.
/
/   Source code references to these messages use the wrapper macro CLSUER(),
/   defined in cls.h.
/
/   Note to translators: The slos formatting code uses CORE LSF for
/                        data insertion to messages, so the message
/                        format items include an LSF-style index value
/                        as in (e.g.) "%(2)s".  This means you can move
/                        (re-order) the format items as necessary for
/                        translation.
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   dbrower     09/04/08  - another parm for 912
/   dbrower     08/25/08  - add fatal from clsem
/   dbrower     08/05/08  - change test messages
/   dbrower     04/25/08  - some test msgs.
/   dbrower     02/25/08  - add tst message 217
/   dbrower     11/01/07  - message formatting messages
/   bmanry      08/07/07  - Add LSF argument indices and related comments
/   bmanry      06/20/07  - Created
/
/ Message number ranges:
/   0100-0199: CLSU slos formatting messages
/
/ CLSU slos formatting messages
/
100, 0, "Operating System function: %(1)s failed with error data: %(2)s"
// *Cause:  A call to an Operating System dependent service or function returned
//          an error indication.  The message includes the name of the function
//          and the returned error data.  The latter varies by platform but
//          typically is numeric; on most platforms it is the value of
//          C "errno" after the failing call.
// *Action: This error normally is accompanied by other (higher-level)
//          messages describing the operation that is affected by the
//          failure.  It may also include one or more of messages 101,
//          103, and 104 providing additional error details.  All
//          of the messages should be examined to assess the error, which
//          may have a very ordinary cause and correction, such as an input
//          file failing to open because the supplied name was misspelled.
/
101, 0, "Operating System error message: %(1)s"
// *Cause:  This message accompanies message 100 above when the Operating
//          System dependent error data can be converted into a text message.
//          On most Oracle platforms the message is a text representation of
//          the C "errno" value reported in message 100.
// *Action: See message 100.
/
102, 0, "Operating System interface detected an error"
// *Cause:  This message is issued instead of messages 100-101 when
//          a "logical" error condition (rather than failure of an Operating
//          System function call) is detected at an Operating System specific
//          interface.  The error condition is further described by accompanying
//          message(s), including 103 and 104.
// *Action: This error normally is accompanied by other (higher-level)
//          messages describing the operation that is affected by the
//          failure.  In most cases it will also include messages 103
//          and 104, providing additional details about the error.  All
//          of the messages should be examined to assess the error, which
//          may have a very ordinary cause and correction, such as a
//          missing required environment variable.
/
103, 0, "error location: %(1)s"
// *Cause:  This message accompanies message 100, 102, or 105 and
//          identifies a location in Oracle program code that encountered
//          the error.
// *Action: See message 100, 102, or 105.  This information normally is
//          useful only when reporting the error condition to Oracle as a
//          potential code bug.
/
104, 0, "additional error information: %(1)s"
// *Cause:  This message accompanies message 100, 102, or 105 and
//          supplies additional information related to the error
//          condition.  A single error may include multiple lines of
//          additional information.
// *Action: See message 100, 102, or 105.
/
105, 0, "Operating System interface has reported an internal failure"
// *Cause:  This message indicates that an Operating System dependent interface
//          within Oracle code has detected internal corruption or some
//          other evidence of internal program failure.
// *Action: This message may be accompanied by other (higher-level)
//          messages indicating the product operation that was affected
//          by the failure.  It may also be accompanied by either or
//          both of messages 103 and 104.  All situations reporting
//          this condition should be referred to Oracle Support for
//          resolution.
/
106, 0, "An improper Operating System error display was attempted"
// *Cause:  During processing of an error condition, an attempt was made
//          to format/display Operating System dependent error data, but the
//          error data structure was found to indicate "no error".
// *Action: This error should be reported to Oracle Support for resolution.
/

200, 0, "**** Error stack contains %d records, newest first:\n"
// *Cause:  The collection of errors about to be presented contains this
//          many following records.
// *Action:  This and the following data should be reported to Oracle Support
//           for resolution.

201, 0, "**** Error stack end ****\n"
// *Cause:  This marks the end of a collection of errors
// *Action:  The preceding data should be reported to Oracle Support
//           for resolution.

210, 0, "CLSUUS test msg 0"
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

211, 0, "CLSUUS test msg 1:%s"
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

212, 0, "CLSUUS test msg 2:%s 2:%s"
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

213, 0, "CLSUUS test msg 3:%s 2:%s 3:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

214, 0, "CLSUUS test msg 4:%s 2:%s 3:%s 4:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

215, 0, "CLSUUS test msg 5:%s 2:%s 3:%s 4:%s 5:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

216, 0, "CLSUUS test msg 6:%s 2:%s 3:%s 4:%s 5:%s 6:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

217, 0, "CLSUUS test msg 7:%s 2:%s 3:%s 4:%s 5:%s 6:%s 7:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

218, 0, "CLSUUS test msg 8:%s 2:%s 3:%s 4:%s 5:%s 6:%s 7:%s 8:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

220, 1, "clsem FATAL exception: %s"
// *Cause:  Something unrecoverable happened in CLSEM.
// *Action:  Report to Oracle Support.

221, 1, "ERROR printed by clsecho: %s"
// *Cause:  An error printed by clsecho
// *Action:  Report to Oracle Support.

222, 2, "WARNING printed by clsecho: %s"
// *Cause:  A warning
// *Action:  Note the text

223, 3, "Info printed by clsecho: %s"
// *Cause:  Information printed by clsecho
// *Action:  Report to Oracle Support.

910, 0, "Named exception %s %s %s %s"
// *Cause: Program raised an exception that does not have its own message
// *Action:  Report to Oracle Support.

911, 0, "Signal %s received"
// *Cause:  Program received on OS signal reported as an exception
// *Action:  Report to Oracle Support

912, 0, "OSE: %s %s"
// *Cause:  An operating specific error was noticed
// *Action: Examine the message in context.

