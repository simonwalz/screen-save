#!/bin/bash

assert() {
	a="$1"; b="$2"
	if test "x$a" = "x$b"
	then
		echo "okay"
	else
		echo "Error: Output not as expected."
		echo "Result: $a"
		echo "Expected: $b"
		exit 1
	fi
}

export TESTCASES="screen-save"
source ./screen-save

## Test Cases:

echo "Test: Double Quote"
result="$(doublequote "Hall\\o Welt"'"'\')"
expected=$(cat <<EOF
"Hall\\\\o Welt\"'"
EOF
)
assert "${result}" "${expected}"

echo "Test: Single Quote"
result="$(singlequote "Hall\\o Welt"'"'\')"
expected=$(cat <<EOF
'Hall\o Welt"'\'''
EOF
)
assert "${result}" "${expected}"


