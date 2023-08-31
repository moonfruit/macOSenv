#!/bin/bash
cd /etc/pam.d && sudo patch <<END
--- /etc/pam.d/sudo	2023-08-02 17:44:46
+++ sudo	2023-08-31 13:07:25
@@ -1,4 +1,5 @@
 # sudo: auth account password session
+auth       sufficient     pam_tid.so
 auth       sufficient     pam_smartcard.so
 auth       required       pam_opendirectory.so
 account    required       pam_permit.so
END
