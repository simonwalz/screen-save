#!/bin/bash

echo "System Test: Create and save test session"

# Create predefined session
TESTFILE="${PWD}/.screenrc-testsession"
HOME="/tmp" screen -d -m -c "${TESTFILE}"
sleep 2

# Save session
HOME="${PWD}" ./screen-save testsession ./.screenrc-testsession-gen
# Terminate session
screen -S testsession -X quit

# Compare result
diff ./.screenrc-testsession ./.screenrc-testsession-gen
if test "$?" != "0"
then
	echo "Error: Result not as expected."
	echo "Result:"
	cat ./.screenrc-testsession-gen
	rm -f ./.screenrc-testsession-gen
	exit 1
fi
echo "okay"
rm -f ./.screenrc-testsession-gen
exit 0

