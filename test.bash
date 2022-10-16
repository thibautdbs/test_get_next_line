#!/bin/bash

binary="$(pwd)/$1"
shift $#
tmpdir='/tmp/.test_get_next_line'

function run() {
	local vgflags='--error-exitcode=1'
	local output #can't initialize on same line to retrieve exit code
	output="$(cat - | valgrind $vgflags $binary $@ 2>&1)"

	if [ $? -eq 1 ] #if valgrind threw error
	then
		cat <<-END 1>&2

		--> Valgrind error
		$output

		END
	fi
	echo "$output" | grep -v ==
}

function fd() {
	local lines=$(cat)
	local fifo=$tmpdir/fd$1

	rm -f $fifo
	mkfifo $fifo
	eval "exec $1<>$fifo"
	echo "$lines" >& $1
}

test__read_one_line_from_stdin() {
	read -r -d '' input <<-EOF
		jawdijawid
		wdajwdiawd
		awdaw
	EOF

	read -r -d '' expected_output <<-EOF
		jawdijawid
	EOF
	
	output="$(echo "$input" | run 0 1)"

	assertEquals "$expected_output"	"$output"
	return 0
}

test__read_two_lines_from_stdin() {
	read -r -d '' input <<-EOF
		jawdijawid
		wdajwdiawd
		awdaw
	EOF

	read -r -d '' expected_output <<-EOF
		jawdijawid
		wdajwdiawd
	EOF
	
	output="$(echo "$input" | run 0 2)"

	assertEquals "$expected_output"	"$output"
	return 0
}

source shunit2/shunit2
