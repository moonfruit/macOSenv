#!/usr/bin/env bash

source "$ENV/lib/bash/fs.sh"
source "$ENV/lib/bash/native.sh"

FILE=/path/to/file
echo $FILE
simple-basename $FILE
simple-dirname $FILE

echo ---
echo "$(basename "")" == "$(simple-basename "")"
echo "$(basename ".")" == "$(simple-basename ".")"
echo "$(basename "/")" == "$(simple-basename "/")"
echo "$(dirname "")" == "$(simple-dirname "")"
echo "$(dirname ".")" == "$(simple-dirname ".")"
echo "$(dirname "/")" == "$(simple-dirname "/")"

echo ---
to-absolute-path .
to-absolute-path ./test.file
to-absolute-path ..
to-absolute-path ../test

echo ---
main-script-directory
current-script-directory

echo ---
create-temp-directory TEMPD && echo "$TEMPD" && trap-add "ls -ld '$TEMPD'" EXIT
create-temp-directory TEMPD && echo "$TEMPD" && trap-add "ls -ld '$TEMPD'" EXIT
create-temp-directory TEMPD && echo "$TEMPD" && trap-add "ls -ld '$TEMPD'" EXIT
trap -p

echo ---
rm -fr target && mkdir target

cat >test.file<<END
1
2
END
copy-if-diff test.file target
copy-if-diff test.file target/test.new.file

cat >test.file <<END
1
3
END
copy-if-diff test.file target
copy-if-diff test.file target/test.new.file

echo ---
