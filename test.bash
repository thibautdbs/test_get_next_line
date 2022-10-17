#!/bin/bash

binary="$(pwd)/$1"
shift $#
tmpdir='/tmp/.test_get_next_line'

function run() {
	local vgflags='--error-exitcode=1 -q'
	local output #can't initialize on same line to retrieve exit code
	output="$(cat - | valgrind $vgflags $binary $@ 2>&1)"

	if [ $? -eq 1 ] #if valgrind threw error
	then
		cat <<-END 1>&2

		--> Valgrind error
		$output

		END
	fi
	echo -n "$output" 
}

function fd() {
	local lines=$(cat)
	local fifo=$tmpdir/fd$1

	rm -f $fifo
	mkfifo $fifo
	eval "exec $1<>$fifo"
	echo "$lines" >& $1
}

test__read_nothing_from_stdin () {

	input=''

	expected_output='(null)'

	output="$(echo -n "$input" | run 0 1)"

	assertEquals "$expected_output" "$output"
	return 0
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
	
	output="$(run 0 1 <<< "$input")"

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
	
	output="$(run 0 2 <<< "$input")"

	assertEquals "$expected_output"	"$output"
	return 0
}

source shunit2/shunit2
